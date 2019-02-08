<%@ Page Language="C#" AutoEventWireup="true" %>

<script runat="server">

protected void Page_Load(object sender, EventArgs e)
{
    Sitecore.Configuration.Settings.Indexing.Enabled = Request?.QueryString["enabled"]?.Equals("true", StringComparison.InvariantCultureIgnoreCase) ?? true;
}

</script>

<!DOCTYPE html>

<html>
	<head>

		<title>Enable/Disable Indexing</title>    
		
		<style type="text/css">
		body
		{
			font-family: normal 11pt "Times New Roman", Serif;
		}
		</style>

	</head>

	<body>

		<form runat="server" id="form">
			<p>Utility page for enabling / disabling Sitecore Indexing. Typically used to speed up performance when performing jobs with high amount of item changes, like installing large packages.</p>
			<p>Add query string parameter 'enabled' with a bool 'true' or 'false' value.</p>
			Requested state: <%=Request.QueryString["enabled"] ?? "N/A" %><br/>
			New Indexing state: <%=Sitecore.Configuration.Settings.Indexing.Enabled%>
		</form>

	</body>

</html>