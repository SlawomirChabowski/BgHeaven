<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CatView.aspx.cs" Inherits="CatView" %>

<!-- A data source to list the images -->
<asp:sqldatasource id="CategoryListDataSource" runat="server" connectionstring="<%$ ConnectionStrings:ProkektConnectionString %>" selectcommand="SELECT TOP 15 * FROM t_image WHERE id NOT IN (SELECT TOP (SELECT 15*@section) id FROM t_image) AND blocked=0 AND t_image.category_id = @cat ORDER BY date_added DESC, id ASC">
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="0" Name="section" QueryStringField="img" />
        <asp:QueryStringParameter DefaultValue="" Name="cat" QueryStringField="cat" />
    </SelectParameters>
</asp:sqldatasource>

<!-- A repeater to print images from the data source -->
<asp:repeater runat="server" datasourceid="CategoryListDataSource">
    <ItemTemplate>
        <a href='View.aspx?img=<%#Eval("id") %>' target="_blank">
            <img class="img-thumbnail thumb" src='content/wallpapers/<%#Eval("filename") %>' alt='<%#Eval("name") %>' />
        </a>
    </ItemTemplate>
</asp:repeater>
