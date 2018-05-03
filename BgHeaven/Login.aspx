<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<form id="form2" runat="server">
    <div id="lightbox" class="lightbox bg-light">
        <h2>Login</h2>
        <hr />
        <div class="form-group site-form">
            <asp:textbox runat="server" id="LoginTextBox" placeholder="Login" CssClass="form-control"></asp:textbox>
            <asp:textbox runat="server" id="PasswordTextBox" placeholder="Password" textmode="Password" CssClass="form-control"></asp:textbox>
            <asp:button runat="server" id="CreateAccountButton" text="Login" CssClass="btn btn-success btn-block"/>
            <button id="cancelButton" type="button" class="btn btn-danger btn-block">Cancel</button>
        </div>
    </div>
</form>