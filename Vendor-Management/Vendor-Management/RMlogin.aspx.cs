using System;
using System.Linq;

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
            using (var context = new UserEntities())
            {
                var user = (from i in context.Users where i.username == username.ToLower() select i).FirstOrDefault();
                Label1.Text = user.username+" "+user.password;
                if (user != null)
                {
                    if (string.Equals(user.password.Trim(), password.Trim()))
                    {
                        if (user.user_type.ToLower().Trim() == "admin")
                        {
                            Response.Redirect("AdminDashboard.aspx");
                        }
                        else if (user.user_type.ToLower().Trim() == "manager")
                        {
                            Response.Redirect("Manager.aspx");
                        }
                        else if (user.user_type.ToLower().ToLower().Trim() == "rmanager")
                        {
                            var rmanager = (from i in context.regional_manager where i.Id == user.regional_manager_id select i).FirstOrDefault();
                            if (rmanager != null)
                            {
                                if (!rmanager.is_blocked)
                                {
                                    Session["region"] = rmanager.region_name.Trim();
                                    Response.Redirect("RMdashboard.aspx");
                                }
                                else
                                {
                                    string script = "alert('User is Blocked by Admin');";
                                    ClientScript.RegisterStartupScript(this.GetType(), "myScript", script, true);
                                }
                            }
                            else
                            {
                                string script = "alert('User Not Found!');";
                                ClientScript.RegisterStartupScript(this.GetType(), "myScript", script, true);
                            }
                        }
                    }
                    else
                    {
                        string script = "alert('Invalid Password1234');";
                        ClientScript.RegisterStartupScript(this.GetType(), "myScript", script, true);
                    }
                }
                else
                {
                    string script = "alert('User Not Found!');";
                    ClientScript.RegisterStartupScript(this.GetType(), "myScript", script, true);
                }
            }
        }
    }
}