<%@ Page Title="" Language="C#" MasterPageFile="~/MainLayout.master" AutoEventWireup="true" CodeFile="Upload.aspx.cs" Inherits="Upload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitlePlaceHolder" runat="Server">
    Upload new wallpaper
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="WebsiteContentPlaceHolder" runat="Server">

    <asp:MultiView ID="LoggedInMultiView" runat="server">

        <asp:View ID="NotLoggedInView" runat="server">
            <h3>You are not logged in!</h3>
            <p>You do not have permissions to upload any wallpapers unless you are registered. Please create an account and log in.</p>
            <a href="/" class="btn btn-link">Home</a>
        </asp:View>



        <asp:View ID="LoggedInView" runat="server">
            <h3>Upload new wallpaper</h3>
            <small style="font-style: italic;">Fields marked with an asterisk (*) are required</small>
            <hr />

            <div class="custom-file">
                <asp:FileUpload ID="WallpaperFileUpload" runat="server" CssClass="custom-file-input" />
                <label class="custom-file-label" for="customFile">Choose wallpaper *</label>
                <small class="form-text text-muted">Only <i>.png</i>, <i>.jpg</i>, <i>.jpeg</i> and <i>.gif</i> file types are accepted.</small>
            </div>

            <br />
            <br />

            <div class="form-group row">
                <label for="NameTextBox" class="col-sm-2 col-form-label">Name *</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="NameTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="CategoriesDropDownList" class="col-sm-2 col-form-label">Category *</label>
                <div class="col-sm-10">
                    <asp:DropDownList ID="CategoriesDropDownList" runat="server" DataSourceID="CategoriesDataSource" DataTextField="name" DataValueField="id" CssClass="custom-select" AppendDataBoundItems="true">
                        <asp:ListItem Text="" Value="" />
                    </asp:DropDownList>
                </div>
                <asp:SqlDataSource ID="CategoriesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ProkektConnectionString %>" SelectCommand="SELECT * FROM [t_category]"></asp:SqlDataSource>
            </div>

            <div class="form-group row">
                <label for="TagsTextBox" class="col-sm-2 col-form-label">Tags</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="TagsTextBox" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="form-group row">
                <label for="DescriptionTextBox" class="col-sm-2 col-form-label">Description</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="DescriptionTextBox" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-2">&nbsp;</div>
                <div class="col-sm-10">
                    <asp:Button ID="UploadButton" runat="server" Text="Upload wallpaper" CssClass="btn btn-lg btn-success" OnClick="UploadButton_Click" />
                </div>
            </div>

            <asp:SqlDataSource ID="UploadWallpaperSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ProkektConnectionString %>" InsertCommand="INSERT INTO t_image(name, tags, description, category_id, author_id, filetype, filename) VALUES (@name, @tags, @description, @category_id, @author_id, @filetype, @filename);" ProviderName="<%$ ConnectionStrings:ProkektConnectionString.ProviderName %>">
                <InsertParameters>
                    <asp:ControlParameter ControlID="NameTextBox" Name="name" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TagsTextBox" Name="tags" PropertyName="Text" />
                    <asp:ControlParameter ControlID="DescriptionTextBox" Name="description" PropertyName="Text" />
                    <asp:ControlParameter ControlID="CategoriesDropDownList" Name="category_id" PropertyName="SelectedValue" />
                    <asp:SessionParameter Name="author_id" SessionField="id" />
                    <asp:Parameter Name="filetype" />
                    <asp:Parameter Name="filename" />
                </InsertParameters>
            </asp:SqlDataSource>
        </asp:View>

    </asp:MultiView>

</asp:Content>

