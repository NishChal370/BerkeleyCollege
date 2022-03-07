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
            GridView1.Columns[5].Visible = false;
        }

        protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
        {

        }


        protected void UpdateRowButton_Click(object sender, EventArgs e)
        {
            GridView1.Columns[5].Visible = true;//show address ID
            System.Diagnostics.Debug.WriteLine("Update");

            LinkButton btn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            oracleConnection = new OracleConnection(connectionString);
            oracleConnection.Open();

            string studentId = (gvr.FindControl("LabelPerson_Id") as Label).Text;
            string name = (gvr.FindControl("TextBoxNAME") as TextBox).Text;
            string contact = (gvr.FindControl("TextBoxCONTACT") as TextBox).Text;
            string dateOfBirth = (gvr.FindControl("TextBoxDATE_OF_BIRTH") as TextBox).Text;
            DateTime dateOfBirthTemp = Convert.ToDateTime(dateOfBirth);
            dateOfBirth = (dateOfBirthTemp.Year).ToString() + '-' + (dateOfBirthTemp.Month).ToString() + '-' + (dateOfBirthTemp.Day).ToString();
            string email = (gvr.FindControl("TextBoxEMAIL") as TextBox).Text;
            string addressId = (gvr.FindControl("LabelAddress_Id") as Label).Text;
            string address = (gvr.FindControl("TextBoxAddress") as TextBox).Text;


            OracleCommand oracleUpdatePersonCommand = new OracleCommand(
                $"UPDATE PERSON SET NAME = '{name}', CONTACT = '{contact}', DATE_OF_BIRTH = TO_DATE('{dateOfBirth}','YYYY-MM-DD')," +
                $" EMAIL = '{email}' WHERE PERSON_ID = '{studentId}'", oracleConnection);
            oracleUpdatePersonCommand.ExecuteNonQuery();


            OracleCommand oracleAddressUpdateCommand = new OracleCommand($"UPDATE ADDRESS SET ADDRESS = '{address}' WHERE ADDRESS_ID = '{addressId}'", oracleConnection);
            oracleAddressUpdateCommand.ExecuteNonQuery();

            GridView1.DataBind();
            oracleConnection.Close();
            GridView1.EditIndex = -1;
            GridView1.Columns[5].Visible = false;//hide address ID
        }

        protected void DeleteRowButton_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            oracleConnection = new OracleConnection(connectionString);
            oracleConnection.Open();

            string studentId = (gvr.FindControl("LabelPerson_Id") as Label).Text;
            string addressId = (gvr.FindControl("LabelAddress_Id") as Label).Text;

            OracleCommand oracleDeletePersonCommand = new OracleCommand($"DELETE FROM person WHERE PERSON_ID = '{studentId}'", oracleConnection);
            oracleDeletePersonCommand.ExecuteNonQuery();

            OracleCommand oracleAddressCommand = new OracleCommand($"DELETE FROM address WHERE ADDRESS_ID = '{addressId}'", oracleConnection);
            oracleAddressCommand.ExecuteNonQuery();

            GridView1.DataBind();
            oracleConnection.Close();

        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("INSERT");
            Random random = new Random();
            oracleConnection = new OracleConnection(connectionString);
            oracleConnection.Open();


            string personId = (FormView1.FindControl("PERSON_IDTextBox") as TextBox).Text;
            string name = (FormView1.FindControl("NAMETextBox") as TextBox).Text;
            string contact = (FormView1.FindControl("CONTACTTextBox") as TextBox).Text;
            string dateOfBirth = (FormView1.FindControl("DATE_OF_BIRTHTextBox") as TextBox).Text;
            string email = (FormView1.FindControl("EMAILTextBox") as TextBox).Text;
            string address = (FormView1.FindControl("ADDRESSTEXTBOX") as TextBox).Text;
            string addressId = "AD" + random.Next(12, 100);


            OracleCommand oracleSavePersonCommand = new OracleCommand(
                $"INSERT INTO PERSON (PERSON_ID, NAME, CONTACT, DATE_OF_BIRTH, EMAIL) " +
                $"VALUES('{personId}', '{name}', '{contact}', TO_DATE('{dateOfBirth}','YYYY-MM-DD'), '{email}')", oracleConnection);
            oracleSavePersonCommand.ExecuteNonQuery();


            OracleCommand oracleSaveSalaryCommand = new OracleCommand($"INSERT INTO student VALUES('{personId}')", oracleConnection);
            oracleSaveSalaryCommand.ExecuteNonQuery();

            OracleCommand oracleAddressCommand = new OracleCommand($"INSERT INTO address (ADDRESS_ID, ADDRESS) VALUES ('{addressId}', '{address}')", oracleConnection);
            oracleAddressCommand.ExecuteNonQuery();

            OracleCommand oraclePersonAddressCommand = new OracleCommand($"INSERT INTO person_address (PERSON_ID, ADDRESS_ID) VALUES ('{personId}', '{addressId}')", oracleConnection);
            oraclePersonAddressCommand.ExecuteNonQuery();

            GridView1.DataBind();
            oracleConnection.Close();
            FormView1.ChangeMode(FormViewMode.ReadOnly);
        }

    }
}