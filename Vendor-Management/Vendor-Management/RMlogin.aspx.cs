using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vendor_Management
{
    public partial class RMlogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;
            using (var context = new RMentity())
            {
                var user = (from i in context.regional_manager where i.username == username select i).FirstOrDefault();
                if (username == user.username && password == user.password)
                {
                    lblMessage.Text = "<div class='alert alert-success'>Login successful!</div>";
                    Session["region"] = user.region_name;
                    Response.Redirect("RMdashboard.aspx");
                }
                else
                {
                    lblMessage.Text = "<div class='alert alert-danger'>Invalid username or password.</div>";
                }
            }

        }
    }
}