<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLayout.master" AutoEventWireup="true" CodeFile="Categories.aspx.cs" Inherits="panel_wallpapers_Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitlePlaceHolder" Runat="Server">
    Manage categories
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageNamePlaceHolder" Runat="Server">
    Manage categories
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BreadcrumbsContentPlaceHolder" Runat="Server">
    <li class="breadcrumb-item"><a href="/">Home</a></li>
    <li class="breadcrumb-item"><a href="../">Panel</a></li>
    <li class="breadcrumb-item"><a href="./">Wallpapers</a></li>
    <li class="breadcrumb-item active">Categories</li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="WebsiteContentPlaceHolder" Runat="Server">
    <asp:GridView ID="CategoriesGridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="CategoriesDataSource" CssClass="table" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="name" HeaderText="Category name" SortExpression="name" />
            <asp:CommandField ShowEditButton="True" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle CssClass="bg-primary" Font-Bold="True" ForeColor="White" />
        <HeaderStyle CssClass="bg-primary" Font-Bold="True" ForeColor="White" />
        <PagerStyle CssClass="bg-primary" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:SqlDataSource ID="CategoriesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ProkektConnectionString %>" SelectCommand="SELECT * FROM [t_category] ORDER BY [id]" UpdateCommand="UPDATE t_category SET name = @name WHERE id = @id
">
        <UpdateParameters>
            <asp:Parameter Name="name" />
            <asp:Parameter Name="id" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

