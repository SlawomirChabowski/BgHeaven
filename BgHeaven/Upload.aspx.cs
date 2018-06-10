using System;
using System.IO;

public partial class Upload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] == null)
        {
            LoggedInMultiView.SetActiveView(NotLoggedInView);
        }
        else
        {
            LoggedInMultiView.SetActiveView(LoggedInView);
        }
    }

    protected void UploadButton_Click(object sender, EventArgs e)
    {
        if (WallpaperFileUpload.HasFile)
        {
            try
            {
                string filename = Session["login"].ToString() + "_" + DateTimeOffset.UtcNow.ToUnixTimeSeconds().ToString();
                string extension = Path.GetExtension(WallpaperFileUpload.FileName);
                WallpaperFileUpload.SaveAs(Server.MapPath("~/content/wallpapers/") + filename + extension);


            UploadWallpaperSqlDataSource.InsertParameters["filetype"].DefaultValue = extension;
                UploadWallpaperSqlDataSource.InsertParameters["filename"].DefaultValue = filename + extension;

                UploadWallpaperSqlDataSource.Insert();
                Response.Redirect("~/");
            }
            catch (Exception ex)
            {
            }
        }
    }
}