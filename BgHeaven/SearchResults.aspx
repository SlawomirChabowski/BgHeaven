<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SearchResults.aspx.cs" Inherits="SearchResults" %>

<!-- A data source to list the images -->
<asp:sqldatasource id="ImgListDataSource" runat="server" connectionstring="<%$ ConnectionStrings:ProkektConnectionString %>" selectcommand="SELECT TOP 15 * FROM t_image WHERE id NOT IN (SELECT TOP (SELECT 15*@section) id FROM t_image) AND blocked=0 AND ((t_image.name LIKE '%' + @tags + '%') OR (t_image.tags LIKE '%' + @tags + '%') OR (t_image.description LIKE '%' + @tags + '%')) ORDER BY date_added DESC, id ASC">
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="0" Name="section" QueryStringField="img" />
        <asp:QueryStringParameter DefaultValue="" Name="tags" QueryStringField="tags" />
    </SelectParameters>
</asp:sqldatasource>

<!-- A repeater to print images from the data source -->
<asp:repeater runat="server" datasourceid="ImgListDataSource">
    <ItemTemplate>
        <a href='View.aspx?img=<%#Eval("id") %>' target="_blank">
            <img class="img-thumbnail thumb" src='content/wallpapers/<%#Eval("filename") %>' alt='<%#Eval("name") %>' />
        </a>
    </ItemTemplate>
</asp:repeater>
