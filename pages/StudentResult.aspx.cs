using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BerkeleyCollege
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView2.Visible = false;

        }

        protected void DropDownList1_TextChanged(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            GridView2.Visible = true;
            Console.WriteLine("Here I am");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
            GridView2.Visible = false;
            DropDownList1.SelectedIndex = -1;
        }

        protected void Student_SelectedIndexChanged(object sender, EventArgs e)
        {
            Console.WriteLine("Here I am");
            GridView1.Visible = false;
            GridView2.Visible = true;

        }
    }
}