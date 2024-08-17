<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RMAccepted_Applications.aspx.cs" Inherits="Vendor_Management.RMAccepted_Applications" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Accepted Applications</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
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
                        <li class="nav-item">
                            <a class="nav-link active" href="RMAccepted_Applications.aspx">Accepted Applications</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="RMRejected_Applications.aspx">Rejected Applications</a>
                        </li>
                    </ul>
                    <asp:Button ID="Button1" CssClass="btn btn-danger" runat="server" Text="Log Out" OnClick="Button1_Click" />
                </div>
            </div>
        </nav>

        <!-- gridview -->
        <div class="container-fluid p-5">
            <asp:GridView ID="GridView1" CssClass="table table-bordered rounded table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="Con_Email" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:BoundField DataField="V_C_Name" ItemStyle-CssClass="p-2" HeaderText="Vendor Name" />
                    <asp:BoundField DataField="Firm_Name" HeaderText="Firm Name" />
                    <asp:BoundField DataField="City" HeaderText="City" />
                    <asp:BoundField DataField="State" HeaderText="State" />
                    <asp:BoundField DataField="Conn_Int_Plnt" HeaderText="Interested Plant" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <div>
                                <asp:Button type="button" class="btn btn-primary btn-sm view-details" ID="btnViewDetails" runat="server" CommandName="ViewDetails" CommandArgument='<%# Eval("Con_Email") %>' Text="View Details" />
                                <!-- Uncomment this if you need an Accept button -->
                                <!-- <asp:Button type="button" class="btn btn-success btn-sm" ID="btnAccept" runat="server" CommandName="Accept" CommandArgument='<%# Eval("Con_Email") %>' Text="Accept" /> -->
                                <asp:Button type="button" class="btn btn-danger btn-sm" ID="btnReject" runat="server" CommandName="MoveToPending" CommandArgument='<%# Eval("Con_Email") %>' Text="Move to Pending" />
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Label ID="lbl" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
