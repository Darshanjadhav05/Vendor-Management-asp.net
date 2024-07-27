using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vendor_Management
{
    public partial class Registration_form : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void NextButton1_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "ShowSection", "showSection('gstSection');", true);
        }

        protected void NextButton2_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "ShowSection", "showSection('bankSection');", true);
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            // Add your form submission logic here

            // For example, validate file sizes
            if (GSTCertificate.HasFile && GSTCertificate.PostedFile.ContentLength > 2 * 1024 * 1024)
            {
                ShowErrorMessage("GST Certificate file size should not exceed 2 MB.");
                return;
            }
            // Add other validation and processing logic here
            ShowSuccessMessage("Form submitted successfully!");
        }

        private void ShowErrorMessage(string message)
        {
            // Display error message to the user
        }

        private void ShowSuccessMessage(string message)
        {
            // Display success message to the user
        }

    }
}