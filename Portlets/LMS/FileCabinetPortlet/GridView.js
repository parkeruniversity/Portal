
//namespace.create("Jenzabar.Portlet.FileCabinet.GridView.ControlPaging");
    
//

var Jenzabar$Portlet$FileCabinet$GridView = GridView = new function()
{
    this.Load = function()
    {
        var MoveCopyDelete = $("input[name$='MoveDelete:delete']").get(0);

        var divAreaDelete = document.getElementById("divAreaDelete");
        var divAreaMove   = document.getElementById("divAreaMove");

        if (MoveCopyDelete == null)
        {
            divAreaDelete.style.display = "none";
            divAreaMove.style.display   = "none";

            return;
        }

        divAreaDelete.appendChild(MoveCopyDelete);

        var MCD = $(".MoveDelete").get(0);

        if (MCD.children.length == 0)
        {
            divAreaMove.style.display = "none";
        }
        else
        {
            divAreaMove.appendChild(MCD);
        }
    }

    this.ControlPaging = new function()
    {
        this.OnClick = function(page, url)
        {
            var callback = function(value)
            {
                if (value == -1) return;
            
                JCSL.window.document.disable(JCSL.JICS.DocumentProcessing);
            
                document.location.href = url;
            }
        
            ////
            
            var cbs = 0;
                
            $("table[id$='ggMain'] tbody tr td input[type='checkbox']").each
            (
                function()
                {
                    if (!this.checked) return;
                
                    cbs++;
                }
            );

            if (cbs == 0) return true;
        
            new JCSL.ui.windows.MessageBox
            (
                Globalizer["TXT_FILE_CABINET"],
                Globalizer["MSG_FC_SELECTIONS_MADE_CLEARED"].replace("{0}", cbs),
                callback,
                [
                    {caption:Globalizer["TXT_YES"]},
                    {caption:Globalizer["TXT_CANCEL"], value:-1}
                ]
            )
            .open(null);
                
            return false;
        }
    }
}