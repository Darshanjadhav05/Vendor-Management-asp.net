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

         $('.form-section').hide();
         $('#personalSection').show(); 
         $('.nav-link[data-target="#personalSection"]').addClass('active');
     });
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
           <div class="form-group">
               <label for="VendorCustomerName">Vendor / Customer Name</label>
               <asp:TextBox ID="VendorCustomerName" runat="server" CssClass="form-control" />
           </div>
           <div class="form-group">
               <label for="FirmName">Firm/Organization Name</label>
               <asp:TextBox ID="FirmName" runat="server" CssClass="form-control" />
           </div>
           <div class="form-group">
               <label for="Area">Area/Street</label>
               <asp:TextBox ID="Area" runat="server" CssClass="form-control" />
           </div>
           <div class="form-group">
               <label for="City">City</label>
               <asp:TextBox ID="City" runat="server" CssClass="form-control" />
           </div>
           <div class="form-group">
               <label for="District">District</label>
               <asp:TextBox ID="District" runat="server" CssClass="form-control" />
           </div>
           <div class="form-group">
               <label for="State">State</label>
               <asp:TextBox ID="State" runat="server" CssClass="form-control" />
           </div>
           <div class="form-group">
               <label for="Country">Country</label>
               <asp:TextBox ID="Country" runat="server" CssClass="form-control" />
           </div>
           <div class="form-group">
               <label for="Pincode">Pincode</label>
               <asp:TextBox ID="Pincode" runat="server" CssClass="form-control" />
           </div>
           <div class="form-group">
               <label for="ContactPersonName">Contact Person Name</label>
               <asp:TextBox ID="ContactPersonName" runat="server" CssClass="form-control" />
           </div>
           <div class="form-group">
               <label for="ContactNumber">Contact Number</label>
               <asp:TextBox ID="ContactNumber" runat="server" CssClass="form-control" />
           </div>
           <div class="form-group">
               <label for="Email">Email</label>
               <asp:TextBox ID="Email" runat="server" CssClass="form-control" />
           </div>
           <button type="button" class="btn btn-primary next-button" data-target="#plantInfoSection">Next</button>
       </div>

       <div id="plantInfoSection" class="form-section mt-3">
           <h2>Plant Info</h2>
           <div class="form-group">
               <label for="PlantInterest">Plant Interest</label>
               <asp:DropDownList ID="PlantInterest" runat="server" CssClass="form-control">
                   <asp:ListItem Value="Mumbai">Mumbai</asp:ListItem>
                   <asp:ListItem Value="Pune">Pune</asp:ListItem>
                   <asp:ListItem Value="Silvasa">Silvasa</asp:ListItem>
                   <asp:ListItem Value="Daman">Daman</asp:ListItem>
                   <asp:ListItem Value="Surat">Surat</asp:ListItem>
                   <asp:ListItem Value="Nashik">Nashik</asp:ListItem>
               </asp:DropDownList>
           </div>
           <div class="form-group">
               <label for="SupplierType">Supplier Type</label>
               <asp:DropDownList ID="SupplierType" runat="server" CssClass="form-control">
                   <asp:ListItem Value="Raw Material">Raw Material</asp:ListItem>
                   <asp:ListItem Value="Packing Material">Packing Material</asp:ListItem>
                   <asp:ListItem Value="Consumable Material">Consumable Material</asp:ListItem>
                   <asp:ListItem Value="Hardware">Hardware</asp:ListItem>
                   <asp:ListItem Value="Other">Other</asp:ListItem>
               </asp:DropDownList>
           </div>
           <button type="button" class="btn btn-primary next-button" data-target="#gstSection">Next</button>
       </div>

       <div id="gstSection" class="form-section mt-3">
           <h2>GST Details</h2>
           <div class="form-group">
               <label for="GSTNumber">GST Number</label>
               <asp:TextBox ID="GSTNumber" runat="server" CssClass="form-control" />
           </div>
           <div class="form-group">
               <label for="GSTCertificate">GST Certificate</label>
               <asp:FileUpload ID="GSTCertificate" runat="server" CssClass="form-control-file" />
           </div>
           <div class="form-group">
               <label for="PanNumber">PAN Number</label>
               <asp:TextBox ID="PanNumber" runat="server" CssClass="form-control" />
           </div>
           <div class="form-group">
               <label for="PanCard">PAN Card</label>
               <asp:FileUpload ID="PanCard" runat="server" CssClass="form-control-file" />
           </div>
           <div class="form-group">
               <label for="AadharNumber">Aadhar Number</label>
               <asp:TextBox ID="AadharNumber" runat="server" CssClass="form-control" />
           </div>
           <div class="form-group">
               <label for="AadharCard">Aadhar Card</label>
               <asp:FileUpload ID="AadharCard" runat="server" CssClass="form-control-file" />
           </div>
           <div class="form-group">
               <label for="IsMSME">MSME Approved</label>
               <asp:RadioButtonList ID="IsMSME" runat="server" CssClass="form-check">
                   <asp:ListItem Value="true">Yes</asp:ListItem>
                   <asp:ListItem Value="false">No</asp:ListItem>
               </asp:RadioButtonList>
           </div>
           <div class="form-group">
               <label for="MSMENumber">MSME Number (if applicable)</label>
               <asp:TextBox ID="MSMENumber" runat="server" CssClass="form-control" />
           </div>
           <div class="form-group">
               <label for="MSMECertificate">MSME Certificate</label>
               <asp:FileUpload ID="MSMECertificate" runat="server" CssClass="form-control-file" />
           </div>
           <button type="button" class="btn btn-primary next-button" data-target="#bankSection">Next</button>
       </div>

       <div id="bankSection" class="form-section mt-3">
           <h2>Bank Details</h2>
           <div class="form-group">
               <label for="PaymentTerms">Payment Terms</label>
               <asp:DropDownList ID="PaymentTerms" runat="server" CssClass="form-control">
                   <asp:ListItem Value="30 Days">30 Days</asp:ListItem>
                   <asp:ListItem Value="60 Days">60 Days</asp:ListItem>
                   <asp:ListItem Value="90 Days">90 Days</asp:ListItem>
               </asp:DropDownList>
           </div>
           <div class="form-group">
               <label for="BankName">Bank Name</label>
               <asp:TextBox ID="BankName" runat="server" CssClass="form-control" />
           </div>
           <div class="form-group">
               <label for="Branch">Branch</label>
               <asp:TextBox ID="Branch" runat="server" CssClass="form-control" />
           </div>
           <div class="form-group">
               <label for="IFSCCode">IFSC Code</label>
               <asp:TextBox ID="IFSCCode" runat="server" CssClass="form-control" />
           </div>
           <div class="form-group">
               <label for="AccountHolderName">Account Holder Name</label>
               <asp:TextBox ID="AccountHolderName" runat="server" CssClass="form-control" />
           </div>
           <div class="form-group">
               <label for="AccountNumber">Account Number</label>
               <asp:TextBox ID="AccountNumber" runat="server" CssClass="form-control" />
           </div>
           <div class="form-group">
               <label for="CancelledCheque">Cancelled Cheque</label>
               <asp:FileUpload ID="CancelledCheque" runat="server" CssClass="form-control-file" />
           </div>
           <button type="submit" class="btn btn-primary">Submit</button>
       </div>
   </div>
    </form>
</body>
</html>
