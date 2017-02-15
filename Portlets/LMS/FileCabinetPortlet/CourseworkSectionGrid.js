
var Jenzabar$Portlet$FileCabinet$CourseworkSectionGrid = CourseworkSectionGrid = new function()
{
    var $this = this;

    this.Load = function()
    {
        $("#LNK_delete").click(LNK_delete__Click);
    }

    var LNK_delete__Click = function()
    {
        alert($this.AssignmentDeleteURL);
    }
}