using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BerkeleyCollege
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        private OracleConnection oracleConnection;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
        {

        }


        protected void InsertStudent(object sender, FormViewInsertedEventArgs e)
        {
            oracleConnection = new OracleConnection(connectionString);
            oracleConnection.Open();

            System.Diagnostics.Debug.WriteLine($"{(FormView1.FindControl("PersonId") as TextBox).Text}");

            OracleCommand oracleCommand = new OracleCommand($"INSERT INTO student VALUES('{(FormView1.FindControl("PersonId") as TextBox).Text}')", oracleConnection);
            oracleCommand.ExecuteNonQuery();

            GridView1.DataBind();
            oracleConnection.Close();
        }
    }
}