<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RMAccepted_Applications.aspx.cs" Inherits="Vendor_Management.RMAccepted_Applications" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Accepted Applications</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        #popupDiv {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            display: none;
            justify-content: center;
            align-items: center;
        }

        #popupContent {
            background: white;
            padding: 20px;
            border-radius: 8px;
            width: 80%;
            max-width: 600px;
            max-height: 90%;
            overflow: auto;
        }

        #pdfFrame {
            width: 100%;
            height: 500px;
            border: none;
            display: none;
        }

        #closePopupButton {
            margin-top: 10px;
        }

        #popupDiv {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            display: none; /* Hidden by default */
            justify-content: center;
            align-items: center;
        }

        #popupContent {
            background: white;
            padding: 20px;
            border-radius: 5px;
            width: 80%;
            max-width: 600px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .label-container {
            margin-bottom: 10px;
        }

        .label-title {
            font-weight: bold;
            color: #333;
        }

        .label-value {
            display: block;
            margin-left: 10px;
            color: #555;
            font-size: 1em;
        }

        #closePopupButton {
            margin-top: 20px;
            padding: 10px 20px;
            border: none;
            background-color: #007bff;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }

            #closePopupButton:hover {
                background-color: #0056b3;
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
            <asp:GridView ID="GridView1" CssClass="table table-bordered rounded table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="Aadhar_No" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:BoundField DataField="V_C_Name" ItemStyle-CssClass="p-2" HeaderText="Vendor Name" />
                    <asp:BoundField DataField="Firm_Name" HeaderText="Firm Name" />
                    <asp:BoundField DataField="City" HeaderText="City" />
                    <asp:BoundField DataField="State" HeaderText="State" />
                    <asp:BoundField DataField="Conn_Int_Plnt" HeaderText="Interested Plant" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <div>
                                <asp:Button type="button" class="btn btn-primary btn-sm view-details" ID="btnViewDetails" runat="server" CommandName="ViewDetails" CommandArgument='<%# Eval("Aadhar_No") %>' Text="View Details" />
                                <!-- Uncomment this if you need an Accept button -->
                                
                                <asp:Button type="button" class="btn btn-danger btn-sm" ID="btnReject" runat="server" CommandName="MovetoPending" CommandArgument='<%# Eval("Aadhar_No") %>' Text="Move to Pending" />
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Label ID="lbl" runat="server" Text=""></asp:Label>
        </div>

        <!---popup window-->

        <div id="popupDiv" style="display: none;">
            <div id="popupContent">
                <h4>Employee Details</h4>
                <asp:Label runat="server" ID="lblV_C_Type" Text=""></asp:Label><br />
                <asp:Label runat="server" ID="lblV_C_Name" Text=""></asp:Label><br />
                <asp:Label runat="server" ID="lblFirm_Name" Text=""></asp:Label><br />
                <asp:Label runat="server" ID="lblArea" Text=""></asp:Label><br />
                <asp:Label runat="server" ID="lblStreet" Text=""></asp:Label><br />
                <asp:Label runat="server" ID="lblCity" Text=""></asp:Label><br />
                <asp:Label runat="server" ID="lblTahasil" Text=""></asp:Label><br />
                <asp:Label runat="server" ID="lblDist" Text=""></asp:Label><br />
                <asp:Label runat="server" ID="lblState" Text=""></asp:Label><br />
                <asp:Label runat="server" ID="lblCountry" Text=""></asp:Label><br />
                <asp:Label runat="server" ID="lblPinCode" Text=""></asp:Label><br />
                <asp:Label runat="server" ID="lblDom_Foreign" Text=""></asp:Label><br />
                <asp:Label runat="server" ID="lblCon_Per_Name" Text=""></asp:Label><br />
                <asp:Label runat="server" ID="lblCon_Number" Text=""></asp:Label><br />
                <asp:Label runat="server" ID="lblCon_Email" Text=""></asp:Label><br />
                <asp:Label runat="server" ID="lblConn_Int_Plnt" Text=""></asp:Label><br />
                <asp:Label runat="server" ID="lblSupp_Type" Text=""></asp:Label><br />
                <asp:Label runat="server" ID="lblGSTIN_No" Text=""></asp:Label><br />
                <asp:HyperLink ID="gstlink" runat="server">GST Certificate</asp:HyperLink>
                <asp:Label runat="server" ID="lblPAN_NO" Text=""></asp:Label><br />
                <asp:HyperLink ID="panlink" runat="server">pancard</asp:HyperLink><br />
                <asp:Label runat="server" ID="lblAadhar_No" Text=""></asp:Label><br />
                <asp:HyperLink ID="adharlink" runat="server">adharcard</asp:HyperLink><br />
                <asp:Label runat="server" ID="lblMSME_Appr" Text=""></asp:Label><br />
                <asp:HyperLink ID="msmelink" runat="server">msmecetificate</asp:HyperLink><br />
                <asp:Label runat="server" ID="lblPay_Term" Text=""></asp:Label><br />
                <asp:Label runat="server" ID="lblBank_Name" Text=""></asp:Label><br />
                <asp:Label runat="server" ID="lblBank_Branch" Text=""></asp:Label><br />
                <asp:Label runat="server" ID="lblBank_IFSC_Code" Text=""></asp:Label><br />
                <asp:Label runat="server" ID="lblBank_Hol_Name" Text=""></asp:Label><br />
                <asp:Label runat="server" ID="lblBank_Acc_No" Text=""></asp:Label><br />
                <asp:Label runat="server" ID="lblV_C_Date" Text=""></asp:Label><br />
                <asp:HyperLink ID="blankcheck" runat="server">blankcheck</asp:HyperLink>

                <button type="button" id="closePopupButton">Close</button>
            </div>
        </div>

        <script>
            function openPopup() {
                document.getElementById('popupDiv').style.display = 'flex';
            }

            function closePopup() {
                document.getElementById('popupDiv').style.display = 'none';
            }

            $(document).ready(function () {
                $('#closePopupButton').click(function () {
                    closePopup();
                });
            });

        </script>
    </form>
</body>
</html>
