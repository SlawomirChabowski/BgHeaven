using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ImageList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Image imageToBind = e.Item.FindControl("imgTest") as Image;
       // imageToBind.ImageUrl = (string)DataBinder.Eval(e.Item.DataItem, "ColumnName");
    }
}