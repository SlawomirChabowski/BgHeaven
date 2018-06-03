using System;

public partial class AdminLayout : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["rank"]) != 1)
        {
            AdminMultiView.SetActiveView(NotAdminView);
        }
        else
        {
            AdminMultiView.SetActiveView(AdminView);
        }
    }

    protected void logout_Click(object sender, EventArgs e)
    {
        Session["login"] = null;
        Session["rank"] = null;
        Response.Redirect("/");
    }
}
