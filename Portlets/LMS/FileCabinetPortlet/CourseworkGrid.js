
var Jenzabar$LMS$Portlets$FileCabinetPortlet$CourseworkGrid = CourseworkGrid = new function()
{
    this.Load = function()
    {
        ReappendAddFolderLink();
        ReappendUpLink();
    }

    var ReappendAddFolderLink = function()
    {
        var AddFolder = $("a[id$='lnkAddFolder']").get(0);

        if (!AddFolder) return;

        document.getElementById("divNewFolder").appendChild(AddFolder);
    }

    var ReappendUpLink = function()
    {
        var LNK_up = $("a[id$='LNK_up']").get(0);

        if (!LNK_up) return;

        $("div[id$='divFolderInfo']").get(0).appendChild(LNK_up);

        LNK_up.style.marginLeft = "20px";
    }
}