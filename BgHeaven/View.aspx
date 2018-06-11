<%@ Page Title="" Language="C#" MasterPageFile="~/MainLayout.master" AutoEventWireup="true" CodeFile="View.aspx.cs" Inherits="View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitlePlaceHolder" runat="Server">
    BgHeaven
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="WebsiteContentPlaceHolder" runat="Server">
    <asp:MultiView ID="ImgMultiView" runat="server">

        <asp:View ID="ImgExistsView" runat="server">
            <asp:Repeater runat="server" DataSourceID="ImgDataSource">
                <ItemTemplate>
                    <figure class="figure">

                        <div class="row">
                            <div class="col-lg-9">
                                <h3><%#Eval("name") %></h3>
                            </div>
                            <div class="col-lg-3">
                                <a href='content/wallpapers/<%#Eval("filename") %>' download="true" class="btn btn-success btn-block">Download this wallpaper&nbsp;<i class="ion-android-download"></i></a>
                            </div>
                        </div>

                        <img alt='<%#Eval("name") %>'
                            src='content/wallpapers/<%#Eval("filename") %>'
                            class="img-fluid figure-img img-fluid rounded" />

                        <table class="figure-caption">
                            <tr>
                                <th>Category:&nbsp;</th>
                                <td><%#Eval("category_name") %></td>
                            </tr>
                            <tr>
                                <th>Tags:&nbsp;</th>
                                <td><%#Eval("tags") %></td>
                            </tr>
                            <tr>
                                <th>Added by:&nbsp;</th>
                                <td><%#Eval("user_name") %></td>
                            </tr>
                            <tr>
                                <th>Date added:&nbsp;</th>
                                <td><%#Eval("date_added") %></td>
                            </tr>
                            <tr>
                                <th>Description:&nbsp;</th>
                                <td><figcaption><%#Eval("description") %></figcaption></td>
                            </tr>
                        </table>

                    </figure>
                </ItemTemplate>
            </asp:Repeater>
        </asp:View>

        <asp:View ID="ImgNotExistsView" runat="server">
            <div class="alert alert-warning" role="alert">
                <h4 class="alert-heading">;&nbsp;(</h4>
                Could not find any image matching the following criteria.
            </div>
        </asp:View>

    </asp:MultiView>

    <asp:SqlDataSource runat="server" ID="ImgDataSource" ConnectionString="<%$ ConnectionStrings:ProkektConnectionString %>" SelectCommand="SELECT t_image.name, t_image.tags, t_image.date_added, t_image.description, t_image.filename, t_image.download_counter, t_user.name AS user_name, t_category.name AS category_name FROM t_image INNER JOIN t_user ON t_image.author_id = t_user.id INNER JOIN t_category ON t_image.category_id = t_category.id WHERE (t_image.id = @id)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="id" QueryStringField="img" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
