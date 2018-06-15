<%@ Page Title="" Language="C#" MasterPageFile="~/MainLayout.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitlePlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="WebsiteContentPlaceHolder" runat="Server">
    <script>
        $.urlParam = function (name) {
            var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
            return results[1] || 0;
        }

        var i = 0;
        var tag = $.urlParam('q');
        var shouldAsk = true;

        $('#content').append($('<section class="image-container">').load('SearchResults.aspx?img=' + i + '&tags=' + tag));
        i++;

        $(window).scroll(function () {

            // check if the script should request for more images; check if document is scrolled down
            if (shouldAsk && ($(window).scrollTop() >= (($(document).height() - $(window).height()) - $('content').innerHeight()))) {

                // preparating the new node to append
                newNode = ($('<section class="image-container">').load('ImageList.aspx?search=' + i + '&tags=' + tag, function (response, status, xhr) {

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
