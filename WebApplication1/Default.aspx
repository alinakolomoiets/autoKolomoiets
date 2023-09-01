<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head runat="server">
        <title>Autode leht</title>
    </head>
    <body>
        <h1>Autod.xml failis tehtudd autolisa.xslt laused/päringud</h1>
        <form id="form1" runat="server">
            <div>
                <asp:Xml ID="xml" runat="server"
                    DocumentSource="~/autod.xml"
                    TransformSource="~/autolisa.xslt" />
            </div>
        </form>
    </body>
</html>
