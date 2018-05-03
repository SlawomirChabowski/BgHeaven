<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<form id="form2" runat="server">
    <div id="lightbox" class="lightbox bg-light">
        <h2>Create new account</h2>
        <hr />
        <div class="form-group site-form">
            <asp:textbox runat="server" id="LoginTextBox" placeholder="Login" CssClass="form-control"></asp:textbox>
            <asp:textbox runat="server" id="PasswordTextBox" placeholder="Password" textmode="Password" CssClass="form-control"></asp:textbox>
            <asp:textbox runat="server" id="RepeatPasswordTextBox" placeholder="Repeat password" textmode="Password" CssClass="form-control"></asp:textbox>
            <asp:textbox runat="server" id="EmailTextBox" placeholder="Email address" CssClass="form-control"></asp:textbox>
            <asp:textbox runat="server" id="AboutTextBox" placeholder="* Tell us something about you..." CssClass="form-control" rows="3" TextMode="MultiLine"></asp:textbox>
            <br />
            <asp:button runat="server" id="CreateAccountButton" text="Submit" CssClass="btn btn-success btn-block"/>
            <button id="cancelButton" type="button" class="btn btn-danger btn-block">Cancel</button>
            <hr />
            * You do not have to fill the <i>about</i> field
        </div>
    </div>
</form>