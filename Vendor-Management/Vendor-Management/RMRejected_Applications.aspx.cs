﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vendor_Management
{
    public partial class RMRejected_Applications : System.Web.UI.Page
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
                    var data = (from i in context.deleteds where i.Conn_Int_Plnt == region select i).ToList();
                    GridView1.DataSource = data;
                    GridView1.DataBind();
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

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Move to Pending")
            {
                lbl.Text = "button hit !";
                string email = e.CommandArgument.ToString();
                ProcessApplication(email, e.CommandName == "Move to Pending");
            }
        }

        private void ProcessApplication(string email, bool isAccepted)
        {
            using (var context = new data_entry_entity())
            {
                var entry = context.deleteds.FirstOrDefault(x => x.Con_Email == email);

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
                        lbl.Text = "deleted !";
                    }

                    context.deleteds.Remove(entry);
                    context.SaveChanges();
                    //SendEmail(email, isAccepted);
                    int milliseconds = 2000;
                    Thread.Sleep(milliseconds);
                    lbl.Text = "added to accepted!";
                }
            }
            BindGrid();
        }
    }
}