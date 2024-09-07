<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manager.aspx.cs" Inherits="Vendor_Management.Manager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manager's Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .form-select {
            appearance: none;
            padding: 0.375rem 2.25rem 0.375rem 0.75rem;
            line-height: 1.5;
            background-color: #6c757d;
            color: #fff;
            border: 1px solid #6c757d;
            border-radius: 0.25rem;
        }

        /* Add custom styles for the navbar */
      
        .nav-item {
            margin-right: 1rem; /* Adds space between nav items */
        }

        .navbar-brand {
            margin-left: 1rem;
        }

        .navbar-collapse {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar-collapse .btn {
            margin-left: auto; /* Moves the buttons to the right side */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">TAPARIYA Electricals</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="RMDashboard.aspx">Home</a>
                        </li>
                    </ul>
                    <div>
                        <asp:Button ID="Button2" CssClass="btn btn-danger" runat="server" Text="Log Out" />
                        <asp:Button ID="btnDownloadExcel" runat="server" Text="Download Excel" CssClass="btn btn-success m-2" OnClick="DownloadExcel_Click" />
                    </div>
                </div>
            </div>
        </nav>

        <div class="container-fluid d-flex m-3 p-3">
            <asp:Label ID="lblFromDate" runat="server" Text="From Date:" CssClass="m-2"></asp:Label>
            <asp:TextBox ID="txtFromDate" type="date" runat="server" CssClass="datepicker m-3"></asp:TextBox>
            <asp:Label ID="lblToDate" runat="server" Text="To Date:" CssClass="m-2"></asp:Label>
            <asp:TextBox ID="txtToDate" type="date" runat="server" CssClass="datepicker m-3"></asp:TextBox>

            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="btn btn-secondary m-2"></asp:DropDownList>
            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="btn btn-secondary m-2"></asp:DropDownList>

            <asp:Button ID="Button1" runat="server" Text="Filter" CssClass="btn btn-secondary m-2" OnClick="apply_changes" />
        </div>

        <div class="container-fluid p-5">
            <asp:GridView ID="GridView1" CssClass="table table-bordered rounded table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="Aadhar_No" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
                <Columns>
                    <asp:BoundField DataField="V_C_Name" ItemStyle-CssClass="p-2" HeaderText="Vendor Name" />
                    <asp:BoundField DataField="Firm_Name" HeaderText="Firm Name" />
                    <asp:BoundField DataField="City" HeaderText="City" />
                    <asp:BoundField DataField="State" HeaderText="State" />
                    <asp:BoundField DataField="Conn_Int_Plnt" HeaderText="Interested Plant" />
                    <asp:BoundField DataField="Supp_Type" HeaderText="Material Type" />
                    <asp:BoundField DataField="V_C_Date" HeaderText="Applied Date" />
                </Columns>
            </asp:GridView>
            <asp:Label ID="lbl" runat="server" Text=""></asp:Label>
            <asp:Label ID="filename" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
