<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<SuperAuctions.Domain.Entities.ItemVideo>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ListVideos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table><tr><td>
    <%
        foreach (var pics in Model)
        { %>
        <div style="position:absolute; left:0px; top:0px;"><table width=700px height=700px bgcolor=black><tr><td></td></tr></table></div>
        <div style="position:absolute; left:4px; top:60px;">
        <object id="MediaPlayer1" CLASSID="CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95" codebase="http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701"
        standby="Loading Microsoft Windows® Media Player components..." type="application/x-oleobject" width="468" height="320">
        <param name="fileName" value="C:\Users\MscWeb\Documents\Visual Studio 2010\Projects\SuperAuctions\SuperAuctions.WebUI\Videos\<%: pics.Video %>">
        <param name="animationatStart" value="true">
        <param name="transparentatStart" value="true">
        <param name="autoStart" value="true">
        <param name="loop" value="true">
        <param name="showControls" value="true">
        <param name="Volume" value="-450">
        <embed type="application/x-mplayer2" pluginspage="http://www.microsoft.com/Windows/MediaPlayer/" src="C:\Users\MscWeb\Documents\Visual Studio 2010\Projects\SuperAuctions\SuperAuctions.WebUI\Videos\<%: pics.Video %>" name="MediaPlayer1" width=468 height=320 autostart=1 showcontrols=1 volume=-450>
        </object>
        </div>
   <% } %>
   </td></tr></table>
</asp:Content>
