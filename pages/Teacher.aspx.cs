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
    public partial class WebForm5 : System.Web.UI.Page
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        private OracleConnection oracleConnection;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void saveSalary(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            string teacher_Id = (row.Cells[1].Controls[0].FindControl("Label1") as Label).Text;
            string salary = (row.Cells[6].Controls[0].FindControl("TextBox1") as TextBox).Text;

            oracleConnection = new OracleConnection(connectionString);
            oracleConnection.Open();

            OracleCommand oracleCommand = new OracleCommand($"UPDATE TEACHER SET SALARY = '{salary}' WHERE TEACHER_ID = '{teacher_Id}'", oracleConnection);
            oracleCommand.ExecuteNonQuery();

            GridView1.DataBind();
            oracleConnection.Close();
        }

        protected void saveTeacher(object sender, FormViewInsertedEventArgs e)
        {
            oracleConnection = new OracleConnection(connectionString);
            oracleConnection.Open();

            
            string person_id = (FormView1.FindControl("PERSON_IDTextBox") as TextBox).Text;
            string salary = (FormView1.FindControl("SALARYTextBox") as TextBox).Text;

            OracleCommand oracleCommand = new OracleCommand($"INSERT INTO teacher VALUES('{person_id}','{salary}')", oracleConnection);
            oracleCommand.ExecuteNonQuery();

            GridView1.DataBind();
            oracleConnection.Close();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("CHeck");
            //    oracleConnection = new OracleConnection(connectionString);
            //    oracleConnection.Open();
            //    System.Diagnostics.Debug.WriteLine("CHeck");

            //    GridViewRow row = GridView1.Rows[e.RowIndex];
            //    string teacher_Id = (row.Cells[1].Controls[0].FindControl("PERSON_IDLabel") as Label).Text;
            //    System.Diagnostics.Debug.WriteLine(teacher_Id);

            //    OracleCommand oracleCommand = new OracleCommand($"DELETE FROM person WHERE PERSON_ID = '{teacher_Id}'", oracleConnection);
            //    oracleCommand.ExecuteNonQuery();

            //    GridView1.DataBind();
            //    oracleConnection.Close();
        }

        protected void DeleteButton_Click(Object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            oracleConnection = new OracleConnection(connectionString);
            oracleConnection.Open();

            string teacher_Id = (gvr.FindControl("LabelPersonId") as Label).Text;

            OracleCommand oracleCommand = new OracleCommand($"DELETE FROM person WHERE PERSON_ID = '{teacher_Id}'", oracleConnection);
            oracleCommand.ExecuteNonQuery();

            GridView1.DataBind();
            oracleConnection.Close();

        }
    }
}