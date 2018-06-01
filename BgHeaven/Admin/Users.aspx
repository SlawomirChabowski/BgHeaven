<%@ Page Title="" Language="C#" MasterPageFile="~/AdminLayout.master" AutoEventWireup="true" CodeFile="Users.aspx.cs" Inherits="Admin_Users" Theme="Peaceful" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitlePlaceHolder" Runat="Server">
    Manage users
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="WebsiteContentPlaceHolder" Runat="Server">
    <asp:GridView style="overflow-y: scroll;" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-hover" GridLines="None">
        <Columns>
            <asp:BoundField DataField="name" HeaderText="Login" SortExpression="name" />
            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
            <asp:BoundField DataField="password" HeaderText="Password" SortExpression="password" />
            <asp:BoundField DataField="date_joined" HeaderText="Date of join" SortExpression="date_joined" />
            <asp:BoundField DataField="last_active" HeaderText="Last active" SortExpression="last_active" />
            <asp:BoundField DataField="rank" HeaderText="Rank" SortExpression="rank" />
            <asp:BoundField DataField="website" HeaderText="Website" SortExpression="website" />
            <asp:BoundField DataField="about" HeaderText="About" SortExpression="about" />
            <asp:BoundField DataField="banned" HeaderText="Status" SortExpression="banned" />
            
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
        <HeaderStyle CssClass="bg-dark" HorizontalAlign="Center" VerticalAlign="Middle" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProkektConnectionString %>" DeleteCommand="DELETE FROM [t_user] WHERE [id] = @id" InsertCommand="INSERT INTO [t_user] ([name], [email], [password], [date_joined], [last_active], [rank], [website], [about], [banned]) VALUES (@name, @email, @password, @date_joined, @last_active, @rank, @website, @about, @banned)" ProviderName="<%$ ConnectionStrings:ProkektConnectionString.ProviderName %>" SelectCommand="SELECT [id], [name], [email], [password], [date_joined], [last_active], [rank], [website], [about], [banned] FROM [t_user]" UpdateCommand="UPDATE [t_user] SET [name] = @name, [email] = @email, [password] = @password, [date_joined] = @date_joined, [last_active] = @last_active, [rank] = @rank, [website] = @website, [about] = @about, [banned] = @banned WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="date_joined" Type="DateTime" />
            <asp:Parameter Name="last_active" Type="DateTime" />
            <asp:Parameter Name="rank" Type="Int32" />
            <asp:Parameter Name="website" Type="String" />
            <asp:Parameter Name="about" Type="String" />
            <asp:Parameter Name="banned" Type="Byte" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="date_joined" Type="DateTime" />
            <asp:Parameter Name="last_active" Type="DateTime" />
            <asp:Parameter Name="rank" Type="Int32" />
            <asp:Parameter Name="website" Type="String" />
            <asp:Parameter Name="about" Type="String" />
            <asp:Parameter Name="banned" Type="Byte" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

