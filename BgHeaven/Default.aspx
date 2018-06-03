<%@ Page Title="" Language="C#" MasterPageFile="~/MainLayout.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitlePlaceHolder" runat="Server">
    BgHeaven
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="WebsiteContentPlaceHolder" runat="Server">

    <div class="row jumbotron">
        <h1 class="display-3">Welcome to BgHeaven!</h1>
        <p>
            Browse the wallpapers sent to us by our users and find the one that fits your desktop. Express yourself!
            <br />
            Also we encourage you to send the best images you found to share with other people if you want. : )
        </p>
    </div>

    <h2>Recently added wallpapers</h2>
    <hr />
    <script>

        var i = 0;
        var shouldAsk = true;

        $('#content').append($('<section class="image-container">').load('ImageList.aspx?img=' + i));
        i++;

        $(window).scroll(function () {

            // check if the script should request for more images; check if document is scrolled down
            if (shouldAsk && ($(window).scrollTop() >= (($(document).height() - $(window).height()) - $('content').innerHeight()))) {

                // preparating the new node to append
                newNode = ($('<section class="image-container">').load('ImageList.aspx?img=' + i, function (response, status, xhr) {

                    // check if node is empty (contains 121 characters - comments and spaces)
                    if (response.length > 121) {
                        $('#content').append("<hr />");
                        $('#content').append(newNode);
                        i++;
                    } else {
                        shouldAsk = false;
                    }
                }));
            }
        });

    </script>

</asp:Content>
