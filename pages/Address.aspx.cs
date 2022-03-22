using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BerkeleyCollege
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void dataInserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            GridView1.DataBind();
        }
    }
}