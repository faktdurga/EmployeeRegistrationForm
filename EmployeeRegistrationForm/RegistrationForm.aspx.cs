using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;

namespace EmployeeRegistrationForm
{
    
    public partial class RegistrationForm : System.Web.UI.Page
    {
        string str = @"data source=DESKTOP-93R7Q3C\SQLEXPRESS; Initial catalog= Test_DB; Integrated Security=true";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateGrid();
            }
        }

        protected void lnkbtnGetDate_Click(object sender, EventArgs e)
        {
            datePicker.Visible = true;
        }

        protected void datePicker_SelectionChanged(object sender, EventArgs e)
        {
            txtDOB.Text = datePicker.SelectedDate.ToShortDateString();
            datePicker.Visible = false;
        }


        //populate grid with Employee Master table
        public void PopulateGrid()
        {
            try
            {
                SqlConnection con = new SqlConnection(str);
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_BindGridView", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                grdResult.DataSource = dt;
                grdResult.DataBind();
                con.Close();

            }
            catch (Exception)
            {

                throw;
            }
           

        }

        //send email for successfull registration
        public void SendEmail()
        {
            try
            {
                MailMessage mail = new MailMessage();
                mail.To.Add(txtEmail.Text);
                mail.From = new MailAddress("test@birlaopenminds.com");
                mail.Subject = "Registration Successfull";
                mail.Body = "Thanks for your feedback we will get to you soon";
                SmtpClient smptc = new SmtpClient();
                smptc.Host = "smtp.gmail.com";
                smptc.Port = 587;
                smptc.UseDefaultCredentials = false;
                smptc.Credentials = new System.Net.NetworkCredential("test@birlaopenminds.com", "Nov@2021");
                smptc.EnableSsl = true;
                smptc.Send(mail);           
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        //cancel button
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegistrationForm.aspx");
        }


        //Add record in database
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(str);
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_Insert_Into_EmployeeDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@EmpName", txtEmpName.Text.Trim());
                cmd.Parameters.AddWithValue("@EmpID", txtEmpID.Text.Trim());
                cmd.Parameters.AddWithValue("@DOB", txtDOB.Text.Trim());
                cmd.Parameters.AddWithValue("@MobileNumber", txtNumber.Text.Trim());
                cmd.Parameters.AddWithValue("@EmailID", txtEmpID.Text.Trim());
                cmd.Parameters.AddWithValue("@EmpAddress", txtAddress.Text.Trim());
                cmd.ExecuteNonQuery();
                con.Close();
                SendEmail();
                Response.Redirect("ThankYou.aspx");
               
               

            }
            catch (Exception ex)
            {

                lblMessage.Text = ex.Message;
            }
            


        }

        //Delete record from table
        protected void grdResult_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(str);
                con.Open();
                SqlCommand cmd = new SqlCommand("SP_DeleteRecord", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SRNo", Convert.ToInt32(grdResult.DataKeys[e.RowIndex].Value.ToString()));
                cmd.ExecuteNonQuery();
                con.Close();
                lblMessage.Text = "Record has been deleted";
                PopulateGrid();

            }
            catch (Exception ex)
            {

                lblMessage.Text = ex.Message;
            }
        }
    }
}
