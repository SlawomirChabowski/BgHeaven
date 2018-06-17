<%@ Page Title="" Language="C#" MasterPageFile="~/MainLayout.master" AutoEventWireup="true" CodeFile="Categories.aspx.cs" Inherits="Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitlePlaceHolder" runat="Server">
    Categories | BgHeaven
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="WebsiteContentPlaceHolder" runat="Server">
        <asp:Repeater ID="CategoriesRepeater" runat="server" DataSourceID="CategoriesSqlDataSource">
            <ItemTemplate>
                <a 
                    class="btn btn-block btn-lg btn-outline-primary" href="ViewCategory.aspx?cat=<%# Eval("id") %>"><%# Eval("name") %></a>
            </ItemTemplate>
        </asp:Repeater>
    <asp:SqlDataSource ID="CategoriesSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ProkektConnectionString %>" SelectCommand="SELECT id, name FROM t_category"></asp:SqlDataSource>
</asp:Content>

