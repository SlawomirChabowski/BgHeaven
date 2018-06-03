using System;
using System.Data;
using System.Web.UI;

public partial class View : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataView dw = (DataView) ImgDataSource.Select(DataSourceSelectArguments.Empty);
        if(dw.Count > 0)
        {
            ImgMultiView.SetActiveView(ImgExistsView);
        } else
        {
            ImgMultiView.SetActiveView(ImgNotExistsView);
        }
    }
}