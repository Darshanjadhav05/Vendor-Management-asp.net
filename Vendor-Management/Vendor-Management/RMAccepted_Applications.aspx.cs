using System;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vendor_Management
{
    public partial class RMAccepted_Applications : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        private void BindGrid()
        {
            if (Session["region"] != null)
            {
                using (var context = new data_entry_entity())
                {
                    string region = Session["region"].ToString();
                    var data = context.accepteds.Where(i => i.Conn_Int_Plnt == region).ToList();
                    GridView1.DataSource = data;
                    GridView1.DataBind();
                    int acceptedCount = context.accepteds.Count(a => a.Conn_Int_Plnt == region);
                    lblAcceptedCount.Text = $"Accepted Applications: {acceptedCount}";

                }
            }
            else
            {
                Response.Redirect("test.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("RMLogin.aspx");
        }

        private void ProcessApplication(string adhar, bool isAccepted)
        {

            using (var context = new data_entry_entity())
            {
                var entry = context.accepteds.FirstOrDefault(x => x.Aadhar_No == adhar);

                if (entry != null)
                {
                    if (isAccepted)
                    {
                        var aentry = new data_entry
                        {
                            V_C_Type = entry.V_C_Type,
                            V_C_Name = entry.V_C_Name,
                            Firm_Name = entry.Firm_Name,
                            Area = entry.Area,
                            Street = entry.Street,
                            City = entry.City,
                            Tahasil = entry.Tahasil,
                            Dist = entry.Dist,
                            State = entry.State,
                            Country = entry.Country,
                            PinCode = entry.PinCode,
                            Dom_Foreign = entry.Dom_Foreign,
                            Con_Per_Name = entry.Con_Per_Name,
                            Con_Number = entry.Con_Number,
                            Con_Email = entry.Con_Email,
                            Conn_Int_Plnt = entry.Conn_Int_Plnt,
                            Supp_Type = entry.Supp_Type,
                            GSTIN_No = entry.GSTIN_No,
                            GSTIN_Cert = entry.GSTIN_Cert,
                            PAN_NO = entry.PAN_NO,
                            Pan_Card = entry.Pan_Card,
                            Aadhar_No = entry.Aadhar_No,
                            Aadhar_Card = entry.Aadhar_Card,
                            MSME_Appr = entry.MSME_Appr,
                            MSME_Cert = entry.MSME_Cert,
                            Pay_Term = entry.Pay_Term,
                            Bank_Name = entry.Bank_Name,
                            Bank_Branch = entry.Bank_Branch,
                            Bank_IFSC_Code = entry.Bank_IFSC_Code,
                            Bank_Hol_Name = entry.Bank_Hol_Name,
                            Bank_Acc_No = entry.Bank_Acc_No,
                            Bank_Chck_Copy = entry.Bank_Chck_Copy,
                            V_C_Date = entry.V_C_Date
                        };
                        context.data_entry.Add(aentry);
                    }
                    context.accepteds.Remove(entry);
                    context.SaveChanges();
                }
            }
            BindGrid();

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "MovetoPending")
            {
                lbl.Text = "Button hit!";
                string adhar = e.CommandArgument.ToString();
                ProcessApplication(adhar, e.CommandName == "MovetoPending");
            }
            else if (e.CommandName == "ViewDetails")
            {
                string adhar = e.CommandArgument.ToString();
                DisplayVendorDetails(adhar);
            }
        }

        private void DisplayVendorDetails(string adhar)
        {
            using (var context = new data_entry_entity())
            {
                var entry = context.accepteds.FirstOrDefault(x => x.Aadhar_No == adhar);
                if (entry != null)
                {
                    lblV_C_Type.Text = "Vendor Type: " + entry.V_C_Type;
                    lblV_C_Name.Text = "Vendor Name: " + entry.V_C_Name;
                    lblFirm_Name.Text = "Firm Name: " + entry.Firm_Name;
                    lblArea.Text = "Area: " + entry.Area;
                    lblStreet.Text = "Street: " + entry.Street;
                    lblCity.Text = "City: " + entry.City;
                    lblTahasil.Text = "Tahasil: " + entry.Tahasil;
                    lblDist.Text = "District: " + entry.Dist;
                    lblState.Text = "State: " + entry.State;
                    lblCountry.Text = "Country: " + entry.Country;
                    lblPinCode.Text = "Pin Code: " + entry.PinCode;
                    lblDom_Foreign.Text = "Domestic/Foreign: " + entry.Dom_Foreign;
                    lblCon_Per_Name.Text = "Contact Person Name: " + entry.Con_Per_Name;
                    lblCon_Number.Text = "Contact Number: " + entry.Con_Number;
                    lblCon_Email.Text = "Contact Email: " + entry.Con_Email;
                    lblConn_Int_Plnt.Text = "Interested Plant: " + entry.Conn_Int_Plnt;
                    lblSupp_Type.Text = "Supplier Type: " + entry.Supp_Type;
                    lblGSTIN_No.Text = "GSTIN No: " + entry.GSTIN_No;
                    lblPAN_NO.Text = "PAN No: " + entry.PAN_NO;
                    lblAadhar_No.Text = "Aadhar No: " + entry.Aadhar_No;
                    lblMSME_Appr.Text = "MSME Approved: " + entry.MSME_Appr;
                    lblPay_Term.Text = "Payment Terms: " + entry.Pay_Term;
                    lblBank_Name.Text = "Bank Name: " + entry.Bank_Name;
                    lblBank_Branch.Text = "Bank Branch: " + entry.Bank_Branch;
                    lblBank_IFSC_Code.Text = "Bank IFSC Code: " + entry.Bank_IFSC_Code;
                    lblBank_Hol_Name.Text = "Bank Holder Name: " + entry.Bank_Hol_Name;
                    lblBank_Acc_No.Text = "Bank Account No: " + entry.Bank_Acc_No;
                    lblV_C_Date.Text = "Vendor Certificate Date: " + (entry.V_C_Date.HasValue ? entry.V_C_Date.Value.ToString("yyyy-MM-dd") : "N/A");
                    bindLinks(entry.Aadhar_No);
                    // Show the popup
                    ClientScript.RegisterStartupScript(this.GetType(), "showPopup", "openPopup();", true);
                }
                else
                {
                    lbl.Text = "No details found for the selected email.";
                }
            }
        }

        private void bindLinks(string aadhar_No)
        {
            string folderPath = Server.MapPath($"~/UploadedFiles/{aadhar_No}/");

            HyperLink[] hyperlinkControls = { gstlink, adharlink, blankcheck, panlink, msmelink };


            if (Directory.Exists(folderPath))
            {
                string[] files = Directory.GetFiles(folderPath);

                for (int i = 0; i < files.Length && i < hyperlinkControls.Length; i++)
                {
                    string file = files[i];
                    string fileName = Path.GetFileName(file);

                    string fileUrl = ResolveUrl($"~/UploadedFiles/{aadhar_No}/" + fileName);
                    HyperLink s = (HyperLink)(from link in hyperlinkControls where link.ID == Path.GetFileNameWithoutExtension(file) select link).FirstOrDefault();

                    if (s != null)
                    {
                        s.NavigateUrl = fileUrl;
                        s.NavigateUrl = fileUrl;
                        s.Text = fileName;
                        s.Target = "_blank";
                    }
                    else
                    {
                        continue;
                    }
                }
            }
            else
            { 
                foreach (var hyperlink in hyperlinkControls)
                {
                    hyperlink.NavigateUrl = "";
                    hyperlink.Text = "No files found";
                }
            }

        }
    }
}
