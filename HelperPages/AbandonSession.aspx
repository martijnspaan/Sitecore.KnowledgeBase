<%@ Page Language="C#" AutoEventWireup="true" %>

<script runat="server">

protected void Page_Load(object sender, EventArgs e)
{
    HttpContext.Current.Session.Abandon();
    Sitecore.Analytics.Tracker.Current.EndVisit(true);
    Sitecore.Analytics.Tracker.Current.EndTracking();
}

</script>

<!DOCTYPE html>

<html>
    <head>
        <title>Abandon Session Page</title>
        <link rel="shortcut icon" href="/sitecore/images/favicon.ico" />
        <style type="text/css">
            body { font-family: normal 11pt "Times New Roman", Serif; }
            .Warning { color: red; }
        </style>
    </head>
    <body>
        <form runat="server" id="form">
            Session Abandoned
        </form>
    </body>
</html>
