using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vendor_Management
{
    public partial class Manager : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDropdown();
                BindGrid();
            }
        }

        private void BindDropdown()
        {
            using (var context = new UserEntities())
            {
                // Bind region dropdown (DropDownList1)
                var region = (from i in context.regional_manager
                              select i.region_name).ToList();
                DropDownList1.DataSource = region;
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, new ListItem("All", "All"));  // Add 'All' option
            }

            using (var context = new UserEntities())
            {
                // Bind supplier type dropdown (DropDownList2)
                var supplierTypes = context.SupplierTypes.ToList();
                DropDownList2.DataSource = supplierTypes;
                DropDownList2.DataTextField = "TypeName";
                DropDownList2.DataValueField = "TypeName";
                DropDownList2.DataBind();
                DropDownList2.Items.Insert(0, new ListItem("Please Select", ""));
            }
        }

        private void BindGrid()
        {
            // Load the grid without any filtering
            using (var context = new data_entry_entity())
            {
                var data = context.data_entry.ToList();
                GridView1.DataSource = data;
                GridView1.DataBind();
            }
        }

        protected List<data_entry> apply_changes1()
        {
            // Parse filters (dates, region, and category)
            DateTime? fromDate = string.IsNullOrEmpty(txtFromDate.Text) ? (DateTime?)null : DateTime.Parse(txtFromDate.Text);
            DateTime? toDate = string.IsNullOrEmpty(txtToDate.Text) ? (DateTime?)null : DateTime.Parse(txtToDate.Text);
            string region = DropDownList1.SelectedValue;
            string category = DropDownList2.SelectedValue;

            // Querying the data with applied filters
            using (data_entry_entity db = new data_entry_entity())
            {
                var query = db.data_entry.AsQueryable();

                // Apply date range filter
                if (fromDate.HasValue)
                {
                    query = query.Where(de => de.V_C_Date >= fromDate.Value);
                }

                if (toDate.HasValue)
                {
                    query = query.Where(de => de.V_C_Date <= toDate.Value);
                }

                // Apply region filter, skipping if "All" is selected
                if (!string.IsNullOrEmpty(region) && region.ToLower() != "all")
                {
                    query = query.Where(de => de.Conn_Int_Plnt.ToLower() == region.ToLower());
                }

                // Apply category filter, skipping if "Please Select" is selected
                if (!string.IsNullOrEmpty(category) && category.ToLower() != "please select")
                {
                    query = query.Where(de => de.Supp_Type.ToLower() == category.ToLower());
                }

                // Return the filtered results
                return query.ToList();
            }
        }

        protected void apply_changes(object sender, EventArgs e)
        {
            // Apply filters and re-bind the GridView
            GridView1.DataSource = apply_changes1();
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            // Handle pagination
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataSource = apply_changes1();
            GridView1.DataBind();
        }

        protected void DownloadExcel_Click(object sender, EventArgs e)
        {
            // Get the filtered data using the apply_changes1 method
            var data = apply_changes1();

            // Clear the response and set up Excel file headers
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=VendorData.xls");
            Response.ContentType = "application/vnd.ms-excel";
            Response.Charset = "";

            // Use a StringWriter to output the Excel format
            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    // Create a temporary GridView for exporting the filtered data
                    GridView exportGrid = new GridView
                    {
                        DataSource = data
                    };
                    exportGrid.DataBind();

                    // Apply basic styles (optional)
                    exportGrid.HeaderRow.Style.Add("background-color", "#6c757d");
                    exportGrid.HeaderRow.Style.Add("color", "white");

                    // Render the GridView as an HTML table (Excel interprets HTML tables)
                    exportGrid.RenderControl(hw);

                    // Write the rendered HTML table to the response
                    Response.Output.Write(sw.ToString());
                }
            }

            // Send the file for download
            Response.Flush();
            Response.End();
        }
    }
}
