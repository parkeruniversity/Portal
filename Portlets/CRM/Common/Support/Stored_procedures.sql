IF NOT EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'FRM_spGetFormCategoryPortletEX')
                    AND type IN ( N'P', N'PC' ) ) 
exec('CREATE PROCEDURE [dbo].[FRM_spGetFormCategoryPortletEX]
		@ID uniqueidentifier,	-- the CategoryID or PortletID
		@ShowCategory bit,		-- 0 = no (CategoryID is passed in), 1 = yes (PortletID is passed in)
		@ShowActive bit,			-- 0 = don''t filter by date, 1 = do filter
		@UserID uniqueidentifier = null	-- for security on category
	AS

	BEGIN

	SET NOCOUNT ON 

	-- Figure out if the User is an Admin
	DECLARE @IsUserAdmin bit

	SELECT @IsUserAdmin = CASE WHEN gm.ID IS NULL THEN 0 ELSE 1 END
	FROM FWK_SecurityGroup sg
		JOIN FWK_GroupMembership gm ON sg.ID = gm.ParentPrincipalID
	WHERE DisplayName = ''Administrators''
	AND MemberPrincipalID = @UserID


	IF @ShowCategory = 1
	-- Select FRM_Category data. 
		IF @ShowActive = 1
			SELECT 
				c1.CategoryID,
				c1.PortletID,
				c1.Name,
				convert(varchar(max), c1.Description) as Description,
				c1.COrder,
				MIN(CASE WHEN spfCat.UserID <> @UserID AND spfCat.UserID IS NOT NULL AND @IsUserAdmin = 1 THEN 1 ELSE 0 END) as AdminView
			FROM 
				FRM_Category c1
			LEFT OUTER JOIN (
							-- Get security info
							SELECT        distinct sp.ItemID, 
										ISNULL(gm.MemberPrincipalID, sp.PrincipalID) AS UserID
							FROM dbo.FWK_SelectedPrincipal sp 
										LEFT OUTER JOIN dbo.FWK_GroupMembership gm ON sp.PrincipalID = gm.ParentPrincipalID
							WHERE            (sp.ItemType = ''Jenzabar.FRM.Category'' or sp.ItemType = ''Jenzabar.FRM.EX.Category'') and @UserID is not null
							) spfCat ON c1.Categoryid = spfCat.ItemID 
			WHERE
				(spfCat.UserID = @UserID 
					or 
					@UserID is null
					or 
					@IsUserAdmin = 1)
				AND
				CategoryID IN
				(SELECT DISTINCT
					c2.CategoryID
				FROM
					FRM_FormCategory fc  
					INNER JOIN FRM_Category c2
					ON fc.CategoryID = c2.CategoryID
				WHERE 
					c2.PortletID = @ID
				AND
					(fc.StartDate <= getDate() AND fc.EndDate >= getDate() )
				)
			GROUP BY c1.CategoryID, c1.PortletID, c1.Name, convert(varchar(max), c1.[Description]), c1.COrder
			ORDER BY
				c1.COrder
		ELSE
			SELECT
				c.CategoryID,
				c.PortletID,
				c.Name,
				convert(varchar(max), c.Description) as Description,
				c.COrder,
				MIN(CASE WHEN spfCat.UserID <> @UserID AND spfCat.UserID IS NOT NULL AND @IsUserAdmin = 1 THEN 1 ELSE 0 END) as AdminView
			FROM
				FRM_Category c 
			LEFT OUTER JOIN (
							-- Get security info
							SELECT        distinct sp.ItemID, 
										ISNULL(gm.MemberPrincipalID, sp.PrincipalID) AS UserID
							FROM dbo.FWK_SelectedPrincipal sp 
										LEFT OUTER JOIN dbo.FWK_GroupMembership gm ON sp.PrincipalID = gm.ParentPrincipalID
							WHERE            (sp.ItemType = ''Jenzabar.FRM.Category'' or sp.ItemType = ''Jenzabar.FRM.EX.Category'') and @UserID is not null
							) spfCat ON c.Categoryid = spfCat.ItemID 
			WHERE 
				(spfCat.UserID = @UserID 
					or 
					spfCat.UserID is null
					or
					@UserID is null
					or 
					@IsUserAdmin = 1)
				AND
				c.PortletID = @ID
			GROUP BY c.CategoryID, c.PortletID, c.Name, convert(varchar(max), c.[Description]), c.COrder
			ORDER BY
				c.COrder


	-- SELECT FRM_FormCategory data
	SELECT	
		fc.FormCategoryID,
		fc.FormID,
		fc.CategoryID,
		fc.StartDate,
		fc.EndDate,
		fc.FOrder,
		fc.ReferenceNumber,
		fc.AllowMultipleSubmits,
		fc.UserCanViewTheirOwnSubmissions 
	FROM
		FRM_Form f
		INNER JOIN FRM_FormCategory fc ON f.FormID = fc.FormID
		INNER JOIN FRM_Category c 
		ON fc.CategoryID = c.CategoryID
	WHERE
		((@ShowCategory = 1 AND c.PortletID = @ID)
	OR
		(@ShowCategory = 0 AND c.CategoryID = @ID))
	AND
		((@ShowActive = 0)
	OR
		(fc.StartDate <= getDate() AND fc.EndDate >= getDate()))
	AND
		f.IsReadOnly = 0
	ORDER BY
		fc.FOrder


	-- SELECT FRM_Form data
	SELECT
		f.FormID,
		f.FormTypeID,
		f.Name,
		f.CanSave,
		f.UploadFileID,
		f.IsValidated,
		f.IsReadOnly,
		f.Version,
		f.UpdateVersion,
		f.Description,
		f.OrigCreatedBy,
		f.SubmissionErrorNotifyUser,
		f.CanSaveForLater
	FROM 
		FRM_Form f
		JOIN FRM_FormCategory fc  ON f.FormID = fc.FormID
		JOIN FRM_Category c ON fc.CategoryID = c.CategoryID
	WHERE
		(@ShowCategory = 1 AND c.PortletID = @ID)
	OR
		(@ShowCategory = 0 AND c.CategoryID = @ID)
	AND
		f.IsReadOnly = 0

	SET NOCOUNT OFF
	END')