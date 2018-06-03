<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLayout.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Panel_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitlePlaceHolder" runat="Server">
    Administration panel | BgHeaven
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageNamePlaceHolder" runat="Server">
    Administration panel
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BreadcrumbsContentPlaceHolder" runat="Server">
    <li class="breadcrumb-item"><a href="/">Home</a></li>
    <li class="breadcrumb-item active">Panel</li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="WebsiteContentPlaceHolder" runat="Server">
    <div class="control-panel-grid">

        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Manage users</h5>
                <p class="card-text">Edit and delete existing users and view informations about them.</p>
            </div>
            <ul class="list-group list-group-flush">
                <li class="list-group-item">
                    <a href="users" class="card-link">View users</a>
                </li>
                <li class="list-group-item">
                    <a href="users/Admins.aspx" class="card-link">View admins</a>
                </li>
                <li class="list-group-item">
                    <a href="users/Banned.aspx" class="card-link">View banned users</a>
                </li>
            </ul>
        </div>

        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Manage wallpapers</h5>
                <p class="card-text">Show informations about wallpapers and categories</p>
            </div>
            <ul class="list-group list-group-flush">
                <li class="list-group-item">
                    <a href="wallpapers" class="card-link">View wallpapers</a>
                </li>
                <li class="list-group-item">
                    <a href="wallpapers/Categories.aspx" class="card-link">View categories</a>
                </li>
                <li class="list-group-item">
                    <a href="wallpapers/Banned.aspx" class="card-link">View banned wallpapers</a>
                </li>
            </ul>
        </div>

        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Manage reports</h5>
                <p class="card-text">View and manage reports</p>
            </div>
            <ul class="list-group list-group-flush">
                <li class="list-group-item">
                    <a href="reports" class="card-link">Unexamined reports</a>
                </li>
                <li class="list-group-item">
                    <a href="reports/Examined.aspx" class="card-link">Examined reports</a>
                </li>
            </ul>
        </div>

    </div>
</asp:Content>

