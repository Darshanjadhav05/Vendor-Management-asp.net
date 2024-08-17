using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net.NetworkInformation;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Vendor_Management
{
    public partial class Registration_form : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
      
        protected void NextButton1_Click(object sender, EventArgs e)
        {
        }

        protected void NextButton2_Click(object sender, EventArgs e)
        {
        }



       

        protected void SubmitButton_Click1(object sender, EventArgs e)
        {
           
            try
            {
                using (var context = new data_entry_entity()) // Replace with your actual context class name
                {
                    DateTime currentDate = DateTime.Today;
                    var entry = new data_entry
                    {
                        //V_C_Type = SupplierType.SelectedValue,
                        V_C_Name = VendorCustomerName.Text,
                        Firm_Name = FirmName.Text,
                        Area = Area.Text,
                        //Street = txtStreet.Text,
                        City = City.Text,
                        //Tahasil = txtTahasil.Text,
                        Dist = District.Text,
                        State = State.Text,
                        Country = Country.Text,
                        PinCode = Pincode.Text,
                        //Dom_Foreign = txtDom_Foreign.Text,
                        Con_Per_Name = ContactPersonName.Text,
                        Con_Number = ContactNumber.Text,
                        Con_Email = Email.Text,
                        Conn_Int_Plnt = PlantInterest.SelectedValue,
                        Supp_Type = SupplierType.Text,
                        GSTIN_No = GSTNumber.Text,
                        GSTIN_Cert = null,
                        PAN_NO = PanNumber.Text,
                        Pan_Card = null,
                        Aadhar_No = AdharNumber.Text,
                        Aadhar_Card = null,
                        MSME_Appr = MSMENumber.Text,
                        MSME_Cert = null,
                        Pay_Term = PaymentTerms.SelectedValue,
                        Bank_Name = BankName.Text,
                        Bank_Branch = Branch.Text,
                        Bank_IFSC_Code = IFSCCode.Text,
                        Bank_Hol_Name = AccountHolderName.Text,
                        Bank_Acc_No = AccountNumber.Text,
                        Bank_Chck_Copy = null,

                        V_C_Date = currentDate
                    };
                    
                    saveFiles(entry.Aadhar_No);

                    context.data_entry.Add(entry);

                    send_Email(Email.Text);
                    
                    context.SaveChanges();

                    Console.WriteLine("Data submitted successfully!");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine( "An error occurred: " + ex.Message);
            }

            
        }

        private void send_Email(string toEmail)
        {
            try
            {
                
                string messageBody = "Your Application for vendorship registration has submitted successfully ";

                // Configure the email client
                SmtpClient client = new SmtpClient("smtp.gmail.com"); // Replace with your SMTP server
                client.Port = 587; // Typically, 587 for TLS or 465 for SSL
                client.UseDefaultCredentials = false;
                client.Credentials = new NetworkCredential("sarangonemore@gmail.com", "mozs awqz piri wjsg");
                client.EnableSsl = true;

                // Create the email message
                MailMessage mailMessage = new MailMessage();
                mailMessage.From = new MailAddress("sarangonemore@gmail.com");
                mailMessage.To.Add(toEmail);
                mailMessage.Subject = "Application Submitted Successfully.";
                mailMessage.Body = messageBody;

                // Send the email
                client.Send(mailMessage);

                emailstatus.Text = "Email sent successfully!";
                //Response.Redirect("emailSubmitted.aspx");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error sending email: " + ex.Message);
            }
        }

        private void saveFiles(string aadhar_No)
        {
            string uploadFolderPath = Server.MapPath($"~/UploadedFiles/{aadhar_No}/");

            // Create the UploadedFiles folder if it does not exist
            if (!Directory.Exists(Server.MapPath("~/UploadedFiles/")))
            {
                Directory.CreateDirectory(Server.MapPath("~/UploadedFiles/"));
            }

            // Create a unique folder for this upload if it doesn't exist
            if (!Directory.Exists(uploadFolderPath))
            {
                Directory.CreateDirectory(uploadFolderPath);
            }

            // List of FileUpload controls
            FileUpload[] fileUploadControls = { GSTCertificate, PanCard, AdharCard, MSMECertificate, CancelledCheque };

            foreach (FileUpload fileUpload in fileUploadControls)
            {
                if (fileUpload.HasFile)
                {
                    try
                    {
                        // Get the original file extension
                        string fileExtension = Path.GetExtension(fileUpload.PostedFile.FileName);

                        // Create a new file name using GUID
                        string newFileName = fileUpload.ID + fileExtension;

                        // Save the file in the folder with the new name
                        string savePath = Path.Combine(uploadFolderPath, newFileName);
                        fileUpload.SaveAs(savePath); // Save the renamed file on the server
                    }
                    catch (Exception ex)
                    {
                        // Handle error
                        Response.Write("Error: " + ex.Message);
                    }
                }
            }

            filesupload.Text="files uploaded";
        }

        
    }
}