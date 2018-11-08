<%@ Page Language="C#" AutoEventWireup="true" %>

<script runat="server">

protected void Page_Load(object sender, EventArgs e)
{
    Sitecore.ContentSearch.ContentSearchManager.GetIndex("sitecore_analytics_index").Reset();
    
    var poolPath = "aggregationProcessing/processingPools/live";
    var pool = Sitecore.Configuration.Factory.CreateObject(poolPath, true) as Sitecore.Analytics.Processing.ProcessingPool.ProcessingPool;
    var driver = Sitecore.Analytics.Data.DataAccess.MongoDb.MongoDbDriver.FromConnectionString("analytics");
    var visitorData = driver.Interactions.FindAllAs<Sitecore.Analytics.Model.VisitData>();
    var keys = visitorData.Select(data => new Sitecore.Analytics.Model.InteractionKey(data.ContactId, data.InteractionId));
    
    foreach(var key in keys)
    {
        var poolItem = new Sitecore.Analytics.Processing.ProcessingPool.ProcessingPoolItem(key.ToByteArray());
        pool.Add(poolItem);
    }
}

</script>

<!DOCTYPE html>

<html>
    <head>
        <title>Reset analytics index Page</title>
        <link rel="shortcut icon" href="/sitecore/images/favicon.ico" />
        <style type="text/css">
            body { font-family: normal 11pt "Times New Roman", Serif; }
            .Warning { color: red; }
        </style>
    </head>
    <body>
        <form runat="server" id="form">
            Analytics index has been reset
        </form>
    </body>
</html>
