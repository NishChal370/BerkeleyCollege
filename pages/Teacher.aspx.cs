using Oracle.ManagedDataAccess.Client;
using System;
using System.Configuration;
using System.Web.UI.WebControls;

namespace BerkeleyCollege
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        private OracleConnection oracleConnection;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.Columns[6].Visible = false;
        }


        //Save new teacher event
        protected void InsertTeacherButton_Click(Object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("INSIDE");
            Random random = new Random();
            oracleConnection = new OracleConnection(connectionString);
            oracleConnection.Open();


            string personId = (FormView1.FindControl("PERSON_IDTextBox") as TextBox).Text;
            string name = (FormView1.FindControl("NAMETextBox") as TextBox).Text;
            string contact = (FormView1.FindControl("CONTACTTextBox") as TextBox).Text;
            string dateOfBirth = (FormView1.FindControl("DATE_OF_BIRTHTextBox") as TextBox).Text;
            string email = (FormView1.FindControl("EMAILTextBox") as TextBox).Text;
            string salary = (FormView1.FindControl("SALARYTextBox") as TextBox).Text;
            string address = (FormView1.FindControl("ADDRESSTEXTBOX") as TextBox).Text;
            string addressId = "AD" + random.Next(12, 100);


            OracleCommand oracleSavePersonCommand = new OracleCommand(
                $"INSERT INTO PERSON (PERSON_ID, NAME, CONTACT, DATE_OF_BIRTH, EMAIL) " +
                $"VALUES('{personId}', '{name}', '{contact}', TO_DATE('{dateOfBirth}','YYYY-MM-DD'), '{email}')", oracleConnection);
            oracleSavePersonCommand.ExecuteNonQuery();


            OracleCommand oracleSaveSalaryCommand = new OracleCommand($"INSERT INTO teacher VALUES('{personId}','{salary}')", oracleConnection);
            oracleSaveSalaryCommand.ExecuteNonQuery();

            OracleCommand oracleAddressCommand = new OracleCommand($"INSERT INTO address (ADDRESS_ID, ADDRESS) VALUES ('{addressId}', '{address}')", oracleConnection);
            oracleAddressCommand.ExecuteNonQuery();

            OracleCommand oraclePersonAddressCommand = new OracleCommand($"INSERT INTO person_address (PERSON_ID, ADDRESS_ID) VALUES ('{personId}', '{addressId}')", oracleConnection);
            oraclePersonAddressCommand.ExecuteNonQuery();

            GridView1.DataBind();
            oracleConnection.Close();
            FormView1.ChangeMode(FormViewMode.ReadOnly);
        }


        // Grid view row delete event
        protected void DeleteButton_Click(Object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            oracleConnection = new OracleConnection(connectionString);
            oracleConnection.Open();

            string teacher_Id = (gvr.FindControl("LabelPersonId") as Label).Text;
            string address_Id = (gvr.FindControl("LabelAddressId") as Label).Text;

            OracleCommand oracleDeletePersonCommand = new OracleCommand($"DELETE FROM person WHERE PERSON_ID = '{teacher_Id}'", oracleConnection);
            oracleDeletePersonCommand.ExecuteNonQuery();

            OracleCommand oracleAddressCommand = new OracleCommand($"DELETE FROM address WHERE ADDRESS_ID = '{address_Id}'", oracleConnection);
            oracleAddressCommand.ExecuteNonQuery();

            GridView1.DataBind();
            oracleConnection.Close();
        }



        // Grid view row update event
        protected void UpdateButton_Click(Object sender, EventArgs e)
        {
            GridView1.Columns[6].Visible = true;//show address ID
            System.Diagnostics.Debug.WriteLine("Update");

            LinkButton btn = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            oracleConnection = new OracleConnection(connectionString);
            oracleConnection.Open();

            string teacher_Id = (gvr.FindControl("LabelPersonId") as Label).Text;
            string name = (gvr.FindControl("TextBoxNAME") as TextBox).Text;
            string contact = (gvr.FindControl("TextBoxCONTACT") as TextBox).Text;
            string dateOfBirth = (gvr.FindControl("TextBoxDATE_OF_BIRTH") as TextBox).Text;
            DateTime dateOfBirthTemp = Convert.ToDateTime(dateOfBirth);
            dateOfBirth = (dateOfBirthTemp.Year).ToString() + '-' + (dateOfBirthTemp.Month).ToString() + '-' + (dateOfBirthTemp.Day).ToString();
            string email = (gvr.FindControl("TextBoxEMAIL") as TextBox).Text;
            string salary = (gvr.FindControl("TextBoxSalary") as TextBox).Text;
            string addressId = (gvr.FindControl("LabelAddressId") as Label).Text;
            string address = (gvr.FindControl("TextBoxAddress") as TextBox).Text;


            OracleCommand oracleUpdatePersonCommand = new OracleCommand(
                $"UPDATE PERSON SET NAME = '{name}', CONTACT = '{contact}', DATE_OF_BIRTH = TO_DATE('{dateOfBirth}','YYYY-MM-DD')," +
                $" EMAIL = '{email}' WHERE PERSON_ID = '{teacher_Id}'", oracleConnection);
            oracleUpdatePersonCommand.ExecuteNonQuery();


            OracleCommand oracleTeacherSalaryCommand = new OracleCommand($"UPDATE TEACHER SET SALARY = '{salary}' WHERE TEACHER_ID = '{teacher_Id}'", oracleConnection);
            oracleTeacherSalaryCommand.ExecuteNonQuery();

            OracleCommand oracleAddressUpdateCommand = new OracleCommand($"UPDATE ADDRESS SET ADDRESS = '{address}' WHERE ADDRESS_ID = '{addressId}'", oracleConnection);
            oracleAddressUpdateCommand.ExecuteNonQuery();

            GridView1.DataBind();
            oracleConnection.Close();
            GridView1.EditIndex = -1;
            GridView1.Columns[6].Visible = false;//hide address ID

        }

        protected void AddStudentAsTeacher_Click(Object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("ADD");
            oracleConnection = new OracleConnection(connectionString);
            oracleConnection.Open();

            string studentId = (FormView2.FindControl("StudentDropDown") as DropDownList).SelectedValue;
            string salary = (FormView2.FindControl("TextBoxSalary") as TextBox).Text;

            OracleCommand oracleAddressUpdateCommand = new OracleCommand($"INSERT INTO TEACHER VALUES('{studentId}', '{salary}')", oracleConnection);
            oracleAddressUpdateCommand.ExecuteNonQuery();

            GridView1.DataBind();
            oracleConnection.Close();
            FormView2.ChangeMode(FormViewMode.ReadOnly);
        }

    }
}