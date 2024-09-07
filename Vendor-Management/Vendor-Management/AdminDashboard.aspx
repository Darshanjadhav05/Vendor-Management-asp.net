<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="Vendor_Management.AdminDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .form-section {
            display: none;
        }

            .form-section.active {
                display: block;
            }

        .nav-link.active {
            font-weight: bold;
            color: #0d6efd;
        }
    </style>
    <script>
        $(document).ready(function () {
            // Navigation between sections
            $('.nav-link').click(function (e) {
                e.preventDefault();
                var target = $(this).attr('data-target');
                $('.form-section').removeClass('active');
                $(target).addClass('active');
                $('.nav-link').removeClass('active');
                $(this).addClass('active');
            });

            // Default section display on load
            $('.form-section').removeClass('active');
            $('#usersSection').addClass('active');
            $('.nav-link[data-target="#usersSection"]').addClass('active');
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-3">
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link" data-target="#usersSection" href="#">Users</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-target="#supplierTypeSection" href="#">Supplier Type</a>
                </li>
            </ul>

            <div id="usersSection" class="form-section">
                <h3>Users Section</h3>
                <div class="container-fluid p-5">
                    <asp:Button ID="btnShowInsertPanel" CssClass="btn btn-primary mb-3" runat="server" Text="Insert New Record" OnClick="btnShowInsertPanel_Click" />

                    <!-- Panel for Insert Record Section -->
                    <asp:Panel ID="pnlInsert" runat="server" CssClass="mb-3" Visible="False">
                        <asp:TextBox ID="txtUsername" CssClass="form-control" runat="server" Placeholder="Username" />
                        <asp:TextBox ID="txtPassword" CssClass="form-control mt-2" runat="server" Placeholder="Password" TextMode="Password" />
                        <asp:TextBox ID="txtUserType" CssClass="form-control mt-2" runat="server" Placeholder="User Type" />
                        <asp:Button ID="btnInsert" CssClass="btn btn-primary mt-2" runat="server" Text="Insert New Record" OnClick="btnInsert_Click" />
                    </asp:Panel>

                    <asp:GridView ID="GridView1" CssClass="table table-bordered rounded table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" AllowPaging="True"
                        OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="True" />
                            <asp:TemplateField HeaderText="Username">
                                <ItemTemplate>
                                    <asp:Label ID="lblUsername" runat="server" Text='<%# Bind("username") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEditUsername" runat="server" Text='<%# Bind("username") %>' />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Password">
                                <ItemTemplate>
                                    <asp:Label ID="lblPassword" runat="server" Text='<%# Bind("password") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEditPassword" runat="server" Text='<%# Bind("password") %>' />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="User Type">
                                <ItemTemplate>
                                    <asp:Label ID="lblUserType" runat="server" Text='<%# Bind("user_type") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEditUserType" runat="server" Text='<%# Bind("user_type") %>' />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:Button ID="btnEdit" CssClass="btn btn-warning btn-sm" runat="server" CommandName="Edit" CommandArgument='<%# Eval("Id") %>' Text="Edit" />
                                    <asp:Button ID="btnDelete" CssClass="btn btn-danger btn-sm" runat="server" CommandName="Delete" CommandArgument='<%# Eval("Id") %>' Text="Delete" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Button ID="btnUpdate" CssClass="btn btn-success btn-sm" runat="server" CommandName="Update" Text="Update" />
                                    <asp:Button ID="btnCancel" CssClass="btn btn-secondary btn-sm" runat="server" CommandName="Cancel" Text="Cancel" />
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>


                    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                </div>
            </div>
            </div>
        <!-- Supplier Type Section -->
 <div class="container mt-3">
     <div id="supplierTypeSection" class="form-section">
    <h3>Supplier Type Section</h3>
    <div class="col-md-6">
        <div class="form-group row">
            <label for="SupplierType" class="col-sm-4 col-form-label">Supplier Type</label>
            <div class="col-sm-8">
                <asp:DropDownList ID="SupplierType" runat="server" CssClass="form-control">
                    <asp:ListItem Value="">Please Select</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvSupplierType" runat="server" ControlToValidate="SupplierType"
                    InitialValue="" ErrorMessage="Supplier Type is required" CssClass="text-danger" Display="Dynamic" 
                    ValidationGroup="DeleteSupplierTypeGroup" />
            </div>
        </div>
        <div class="mt-3">
            <asp:TextBox ID="txtNewSupplierType" CssClass="form-control" runat="server" Placeholder="New Supplier Type" />
            <asp:Button ID="btnAddSupplierType" CssClass="btn btn-primary mt-2" runat="server" Text="Add Supplier Type" OnClick="btnAddSupplierType_Click" />
            <asp:Button ID="btnDeleteSupplierType" CssClass="btn btn-danger mt-2" runat="server" Text="Delete Selected Supplier Type" OnClick="btnDeleteSupplierType_Click" ValidationGroup="DeleteSupplierTypeGroup" />
            <asp:Label ID="Label1" runat="server" Text="" CssClass="text-success mt-2" />
        </div>
    </div>
</div>

     </div>

    </form>
</body>
</html>
