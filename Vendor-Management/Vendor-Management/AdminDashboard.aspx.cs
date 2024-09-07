using System;
using System.Linq;
using System.Web.UI.WebControls;

namespace Vendor_Management
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
                BindDropDownList();
            }
        }

        private void BindGridView()
        {
            using (var context = new UserEntities())
            {
                var data = context.Users.ToList();
                GridView1.DataSource = data;
                GridView1.DataBind();
            }
        }

        protected void btnShowInsertPanel_Click(object sender, EventArgs e)
        {
            pnlInsert.Visible = true; // Show the panel with insert fields
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            using (var context = new UserEntities())
            {
                var user = new User
                {
                    username = txtUsername.Text.Trim(),
                    password = txtPassword.Text.Trim(),
                    user_type = txtUserType.Text.Trim()
                };
                context.Users.Add(user);
                context.SaveChanges();
                BindGridView();
                lblMessage.Text = "Record inserted successfully.";
                pnlInsert.Visible = false; // Hide the panel after inserting
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            using (var context = new UserEntities())
            {
                var user = context.Users.Find(id);
                if (user != null)
                {
                    context.Users.Remove(user);
                    context.SaveChanges();
                    BindGridView();
                    lblMessage.Text = "Record deleted successfully.";
                }
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            TextBox txtUsername = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditUsername");
            TextBox txtPassword = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditPassword");
            TextBox txtUserType = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditUserType");

            using (var context = new UserEntities())
            {
                var user = context.Users.Find(id);
                if (user != null)
                {
                    user.username = txtUsername.Text.Trim();
                    user.password = txtPassword.Text.Trim();
                    user.user_type = txtUserType.Text.Trim();

                    context.SaveChanges();
                    GridView1.EditIndex = -1;
                    BindGridView();
                    lblMessage.Text = "Record updated successfully.";
                }
                else
                {
                    lblMessage.Text = "Record not found.";
                }
            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindGridView();
        }

        protected void btnAddSupplierType_Click(object sender, EventArgs e)
        {
            string newType = txtNewSupplierType.Text.Trim();
            if (!string.IsNullOrEmpty(newType))
            {
                using (var context = new UserEntities()) // Replace with your DbContext
                {
                    var supplierType = new SupplierType { TypeName = newType };
                    context.SupplierTypes.Add(supplierType);
                    context.SaveChanges();
                    lblMessage.Text = "Supplier type added successfully.";
                    BindDropDownList(); // Refresh the dropdown list
                }
            }
        }

        private void BindDropDownList()
        {
            using (var context = new UserEntities()) // Replace with your DbContext
            {
                var supplierTypes = context.SupplierTypes.ToList();
                SupplierType.DataSource = supplierTypes;
                SupplierType.DataTextField = "TypeName";
                SupplierType.DataValueField = "Id";
                SupplierType.DataBind();
                SupplierType.Items.Insert(0, new ListItem("Please Select", ""));
            }
        }

        protected void btnDeleteSupplierType_Click(object sender, EventArgs e)
        {
            int idToDelete;
            if (int.TryParse(SupplierType.SelectedValue, out idToDelete))
            {
                using (var context = new UserEntities()) // Replace with your DbContext
                {
                    var supplierType = context.SupplierTypes.Find(idToDelete);
                    if (supplierType != null)
                    {
                        context.SupplierTypes.Remove(supplierType);
                        context.SaveChanges();
                        BindDropDownList(); // Refresh the dropdown list
                        lblMessage.Text = "Supplier type deleted successfully.";
                    }
                    else
                    {
                        lblMessage.Text = "Supplier type not found.";
                    }
                }
            }
        }
    }
}
