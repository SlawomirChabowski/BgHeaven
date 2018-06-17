<%@ Page Title="" Language="C#" MasterPageFile="~/MainLayout.master" AutoEventWireup="true" CodeFile="ViewCategory.aspx.cs" Inherits="ViewCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitlePlaceHolder" Runat="Server">
    BgHeaven
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="WebsiteContentPlaceHolder" Runat="Server">

    <script>
        $.urlParam = function (name) {
            var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
            return results[1] || 0;
        }

        var i = 0;
        var cat = $.urlParam('cat');
        var shouldAsk = true;

        $('#content').append($('<section class="image-container">').load('CatView.aspx?img=' + i + '&cat=' + cat));
        i++;

        $(window).scroll(function () {

            // check if the script should request for more images; check if document is scrolled down
            if (shouldAsk && ($(window).scrollTop() >= (($(document).height() - $(window).height()) - $('content').innerHeight()))) {

                // preparating the new node to append
                newNode = ($('<section class="image-container">').load('CatView.aspx?img=' + i + '&cat=' + tag, function (response, status, xhr) {

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

