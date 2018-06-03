<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLayout.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Panel_Users_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitlePlaceHolder" runat="Server">
    Manage users
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="PageNamePlaceHolder" runat="server">
    Manage users
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="BreadcrumbsContentPlaceHolder" runat="server">
    <li class="breadcrumb-item"><a href="/">Home</a></li>
    <li class="breadcrumb-item"><a href="../">Panel</a></li>
    <li class="breadcrumb-item active">Users</li>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="WebsiteContentPlaceHolder" runat="Server">

    <asp:LinkButton ID="ViewBannedLinkButton" runat="server" CssClass="btn btn-danger">View banned</asp:LinkButton>
    <asp:LinkButton ID="ViewAdminsLinkButton" runat="server" CssClass="btn btn-info">View admins</asp:LinkButton>

    <br />
    <br />

    <asp:GridView ID="UserListGridView" runat="server" DataSourceID="UserListDataSource" AutoGenerateColumns="False" DataKeyNames="id" CssClass="table" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="name" HeaderText="Login" SortExpression="name" />
            <asp:BoundField DataField="email" HeaderText="Email address" SortExpression="email" />
            <asp:BoundField DataField="last_active" HeaderText="Last seen" SortExpression="last_active" />
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
    <asp:SqlDataSource ID="UserListDataSource" runat="server" SelectCommand="SELECT [id], [name], [email], [last_active] FROM [t_user] WHERE (([banned] = 0) AND ([rank] = 0))" ConnectionString="<%$ ConnectionStrings:ProkektConnectionString %>"></asp:SqlDataSource>
</asp:Content>
