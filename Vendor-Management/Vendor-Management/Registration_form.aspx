<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration_form.aspx.cs" Inherits="Vendor_Management.Registration_form" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script>
        $(document).ready(function () {
            $('.nav-link').click(function () {
                var target = $(this).attr('data-target');
                $('.form-section').hide();
                $(target).show();
                $('.nav-link').removeClass('active');
                $(this).addClass('active');
            });

            $('.next-button').click(function () {
                var target = $(this).attr('data-target');
                $('.form-section').hide();
                $(target).show();

                $('.nav-link').removeClass('active');
                $('a[data-target="' + target + '"]').addClass('active');
            });
            $('input[name="MSMEApproval"]').change(function () {
                if ($('#MSMEApprovalYes').is(':checked')) {
                    $('#MSMEApprovalDetails').show();
                } else {
                    $('#MSMEApprovalDetails').hide();
                }
            });


            $('.form-section').hide();
            $('#personalSection').show();
            $('.nav-link[data-target="#personalSection"]').addClass('active');
        });
        function validateFileUpload(fileInput) {
            console.log("File upload validation triggered");
            const allowedExtensions = /(\.pdf|\.jpeg|\.jpg)$/i;
            const maxSize = 2 * 1024 * 1024; // 2 MB
            const filePath = fileInput.value;
            const fileSize = fileInput.files[0].size;

            if (!allowedExtensions.exec(filePath) || fileSize > maxSize) {
                alert('Invalid file. Please upload a PDF/JPEG/JPG file less than 2 MB.');
                fileInput.value = '';
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
   <form id="form1" runat="server">
    <div class="container mt-5">
        <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link active" data-target="#personalSection" href="#">Personal Details</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-target="#plantInfoSection" href="#">Plant Info</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-target="#gstSection" href="#">GST Details</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-target="#bankSection" href="#">Bank Details</a>
            </li>
        </ul>

        <div id="personalSection" class="form-section mt-3">
            <h2>Personal Details</h2>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group row">
                        <label for="CustomerName" class="col-sm-4 col-form-label">Customer Name</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="VendorCustomerName" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvVendorCustomerName" runat="server" ControlToValidate="VendorCustomerName" 
                                ErrorMessage="Customer Name is required" CssClass="text-danger" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="FirmName" class="col-sm-4 col-form-label">Organization Name</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="FirmName" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvFirmName" runat="server" ControlToValidate="FirmName" 
                                ErrorMessage="Organization Name is required" CssClass="text-danger" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="Area" class="col-sm-4 col-form-label">Area/Street</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="Area" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvArea" runat="server" ControlToValidate="Area" 
                                ErrorMessage="Area/Street is required" CssClass="text-danger" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="City" class="col-sm-4 col-form-label">City</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="City" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="City" 
                                ErrorMessage="City is required" CssClass="text-danger" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="District" class="col-sm-4 col-form-label">District</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="District" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvDistrict" runat="server" ControlToValidate="District" 
                                ErrorMessage="District is required" CssClass="text-danger" />
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group row">
                        <label for="State" class="col-sm-4 col-form-label">State</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="State" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvState" runat="server" ControlToValidate="State" 
                                ErrorMessage="State is required" CssClass="text-danger" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="Country" class="col-sm-4 col-form-label">Country</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="Country" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvCountry" runat="server" ControlToValidate="Country" 
                                ErrorMessage="Country is required" CssClass="text-danger" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="Pincode" class="col-sm-4 col-form-label">Pincode</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="Pincode" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvPincode" runat="server" ControlToValidate="Pincode" 
                                ErrorMessage="Pincode is required" CssClass="text-danger" />
                            <asp:RegularExpressionValidator ID="revPincode" runat="server" ControlToValidate="Pincode" 
                                ErrorMessage="Invalid Pincode format" CssClass="text-danger" 
                                ValidationExpression="^\d{6}$" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="ContactPersonName" class="col-sm-4 col-form-label">Contact Person Name</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="ContactPersonName" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvContactPersonName" runat="server" ControlToValidate="ContactPersonName" 
                                ErrorMessage="Contact Person Name is required" CssClass="text-danger" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="ContactNumber" class="col-sm-4 col-form-label">Contact Number</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="ContactNumber" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvContactNumber" runat="server" ControlToValidate="ContactNumber" 
                                ErrorMessage="Contact Number is required" CssClass="text-danger" />
                            <asp:RegularExpressionValidator ID="revContactNumber" runat="server" ControlToValidate="ContactNumber" 
                                ErrorMessage="Invalid Contact Number format" CssClass="text-danger" 
                                ValidationExpression="^\d{10}$" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="Email" class="col-sm-4 col-form-label">Email</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="Email" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="Email" 
                                ErrorMessage="Email is required" CssClass="text-danger" />
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="Email" 
                                ErrorMessage="Invalid Email format" CssClass="text-danger" 
                                ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" />
                        </div>
                    </div>
                </div>
            </div>
            <button type="button" class="btn btn-primary next-button" data-target="#plantInfoSection">Next</button>
        </div>

        <div id="plantInfoSection" class="form-section mt-3">
            <h2>Plant Info</h2>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group row">
                        <label for="PlantInterest" class="col-sm-4 col-form-label">Plant Interest</label>
                        <div class="col-sm-8">
                            <asp:DropDownList ID="PlantInterest" runat="server" CssClass="form-control">
                                <asp:ListItem Value="Mumbai">Mumbai</asp:ListItem>
                                <asp:ListItem Value="Pune">Pune</asp:ListItem>
                                <asp:ListItem Value="Silvasa">Silvasa</asp:ListItem>
                                <asp:ListItem Value="Daman">Daman</asp:ListItem>
                                <asp:ListItem Value="Surat">Surat</asp:ListItem>
                                <asp:ListItem Value="Nashik">Nashik</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvPlantInterest" runat="server" ControlToValidate="PlantInterest" 
                                InitialValue="" ErrorMessage="Plant Interest is required" CssClass="text-danger" />
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group row">
                        <label for="SupplierType" class="col-sm-4 col-form-label">Supplier Type</label>
                        <div class="col-sm-8">
                            <asp:DropDownList ID="SupplierType" runat="server" CssClass="form-control">
                                <asp:ListItem Value="Raw Material">Raw Material</asp:ListItem>
                                <asp:ListItem Value="Packing Material">Packing Material</asp:ListItem>
                                <asp:ListItem Value="Consumable Material">Consumable Material</asp:ListItem>
                                <asp:ListItem Value="Hardware">Hardware</asp:ListItem>
                                <asp:ListItem Value="Other">Other</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvSupplierType" runat="server" ControlToValidate="SupplierType" 
                                InitialValue="" ErrorMessage="Supplier Type is required" CssClass="text-danger" />
                        </div>
                    </div>
                </div>
            </div>
            <button type="button" class="btn btn-primary next-button" data-target="#gstSection">Next</button>
        </div>

        <div id="gstSection" class="form-section mt-3">
            <h2>GST Details</h2>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group row">
                        <label for="GSTNumber" class="col-sm-4 col-form-label">GST Number</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="GSTNumber" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvGSTNumber" runat="server" ControlToValidate="GSTNumber" 
                                ErrorMessage="GST Number is required" CssClass="text-danger" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="PanNumber" class="col-sm-4 col-form-label">PAN Number</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="PanNumber" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvPanNumber" runat="server" ControlToValidate="PanNumber" 
                                ErrorMessage="PAN Number is required" CssClass="text-danger" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="AdharNumber" class="col-sm-4 col-form-label">Adhar Number</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="AdharNumber" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvAdharNumber" runat="server" ControlToValidate="AdharNumber" 
                                ErrorMessage="Adhar Number is required" CssClass="text-danger" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label">MSME Approval</label>
                        <div class="col-sm-8 d-flex align-items-center">
                            <asp:RadioButton ID="MSMEApprovalYes" runat="server" GroupName="MSMEApproval" Text="Yes" CssClass="form-check-input" />
                            <asp:RadioButton ID="MSMEApprovalNo" runat="server" GroupName="MSMEApproval" Text="No" CssClass="form-check-input ml-3" />
                            
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group row">
                        <label for="GSTCertificate" class="col-sm-4 col-form-label">GST Certificate</label>
                        <div class="col-sm-8">
                            <asp:FileUpload ID="GSTCertificate" runat="server" CssClass="form-control-file" onchange="validateFileUpload(this)" />
                            <asp:RequiredFieldValidator ID="rfvGSTCertificate" runat="server" ControlToValidate="GSTCertificate" 
                                InitialValue="" ErrorMessage="GST Certificate is required" CssClass="text-danger" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="PanCard" class="col-sm-4 col-form-label">PAN Card</label>
                        <div class="col-sm-8">
                            <asp:FileUpload ID="PanCard" runat="server" CssClass="form-control-file" onchange="validateFileUpload(this)" />
                            <asp:RequiredFieldValidator ID="rfvPanCard" runat="server" ControlToValidate="PanCard" 
                                InitialValue="" ErrorMessage="PAN Card is required" CssClass="text-danger" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="AdharCard" class="col-sm-4 col-form-label">Adhar Card</label>
                        <div class="col-sm-8">
                            <asp:FileUpload ID="AdharCard" runat="server" CssClass="form-control-file" onchange="validateFileUpload(this)" />
                            <asp:RequiredFieldValidator ID="rfvAdharCard" runat="server" ControlToValidate="AdharCard" 
                                InitialValue="" ErrorMessage="Adhar Card is required" CssClass="text-danger" />
                        </div>
                    </div>
                    <div id="MSMEApprovalDetails" style="display:none;">
                        <div class="form-group row">
                            <label for="MSMENumber" class="col-sm-4 col-form-label">MSME Number</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="MSMENumber" runat="server" CssClass="form-control" />
                              
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="MSMECertificate" class="col-sm-4 col-form-label">MSME Certificate</label>
                            <div class="col-sm-8">
                                <asp:FileUpload ID="MSMECertificate" runat="server" CssClass="form-control-file" onchange="validateFileUpload(this)" />
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <button type="button" class="btn btn-primary next-button" data-target="#bankSection">Next</button>
        </div>

        <div id="bankSection" class="form-section mt-3">
            <h2>Bank Details</h2>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group row">
                        <label for="PaymentTerms" class="col-sm-4 col-form-label">Payment Terms</label>
                        <div class="col-sm-8">
                            <asp:DropDownList ID="PaymentTerms" runat="server" CssClass="form-control">
                                <asp:ListItem Value="30 Days">30 Days</asp:ListItem>
                                <asp:ListItem Value="60 Days">60 Days</asp:ListItem>
                                <asp:ListItem Value="90 Days">90 Days</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvPaymentTerms" runat="server" ControlToValidate="PaymentTerms" 
                                InitialValue="" ErrorMessage="Payment Terms is required" CssClass="text-danger" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="BankName" class="col-sm-4 col-form-label">Bank Name</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="BankName" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvBankName" runat="server" ControlToValidate="BankName" 
                                ErrorMessage="Bank Name is required" CssClass="text-danger" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="IFSCCode" class="col-sm-4 col-form-label">IFSC Code</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="IFSCCode" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvIFSCCode" runat="server" ControlToValidate="IFSCCode" 
                                ErrorMessage="IFSC Code is required" CssClass="text-danger" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="AccountNumber" class="col-sm-4 col-form-label">Account Number</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="AccountNumber" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvAccountNumber" runat="server" ControlToValidate="AccountNumber" 
                                ErrorMessage="Account Number is required" CssClass="text-danger" />
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group row">
                        <label for="Branch" class="col-sm-4 col-form-label">Branch</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="Branch" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvBranch" runat="server" ControlToValidate="Branch" 
                                ErrorMessage="Branch is required" CssClass="text-danger" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="AccountHolderName" class="col-sm-4 col-form-label">Account Holder Name</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="AccountHolderName" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="rfvAccountHolderName" runat="server" ControlToValidate="AccountHolderName" 
                                ErrorMessage="Account Holder Name is required" CssClass="text-danger" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="CancelledCheque" class="col-sm-4 col-form-label">Cancelled Cheque</label>
                        <div class="col-sm-8">
                            <asp:FileUpload ID="CancelledCheque" runat="server" CssClass="form-control-file" onchange="validateFileUpload(this)" />
                            <asp:RequiredFieldValidator ID="rfvCancelledCheque" runat="server" ControlToValidate="CancelledCheque" 
                                InitialValue="" ErrorMessage="Cancelled Cheque is required" CssClass="text-danger" />
                        </div>
                    </div>
                </div>
            </div>
            <asp:Button ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click1" />
        </div>
    </div>
</form>

</body>
</html>

