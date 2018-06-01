<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImageList.aspx.cs" Inherits="ImageList" %>

<!-- A data source to list the images -->
<asp:sqldatasource id="ImgListDataSource" runat="server" connectionstring="<%$ ConnectionStrings:ProkektConnectionString %>" selectcommand="SELECT TOP 15 * FROM t_image WHERE id NOT IN (SELECT TOP (SELECT 15*@section) id FROM t_image) AND blocked=0 ORDER BY date_added DESC, id ASC">
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="0" Name="section" QueryStringField="img" />
    </SelectParameters>
</asp:sqldatasource>

<!-- A repeater to print images from the data source -->
<asp:repeater runat="server" datasourceid="ImgListDataSource">
    <ItemTemplate>
        <img class="img-thumbnail thumb" src='content/wallpapers/<%#Eval("filename") %>' alt='<%#Eval("name") %>' />
    </ItemTemplate>
</asp:repeater>
