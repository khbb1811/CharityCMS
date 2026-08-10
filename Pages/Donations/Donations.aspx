<%@ Page Title="التبرعات" Language="C#" MasterPageFile="~/MasterPages/Admin.master" AutoEventWireup="true" CodeBehind="Donations.aspx.cs" Inherits="CharityCMS.Pages.Donations.Donations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="card p-3 mb-4">
    <h5 class="mb-3">إضافة تبرع</h5>

    <asp:Literal ID="litMsg" runat="server"></asp:Literal>

    <!-- نوع التبرع -->
    <div class="mb-2">
        <label>نوع التبرع</label>
        <asp:DropDownList ID="ddlDonationType" runat="server" CssClass="form-select"></asp:DropDownList>
    </div>

    <!-- بيانات المتبرع -->
    <div class="mb-2">
        <label>اسم المتبرع</label>
        <asp:TextBox ID="txtDonorName" runat="server" CssClass="form-control"></asp:TextBox>
    </div>

    <div class="mb-2">
        <label>الجوال</label>
        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
    </div>

    <!-- المبلغ -->
    <div class="mb-2">
        <label>المبلغ (للتبرعات المالية)</label>
        <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control"></asp:TextBox>
    </div>

    <!-- ملاحظات -->
    <div class="mb-2">
        <label>ملاحظات</label>
        <asp:TextBox ID="txtNotes" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
    </div>

    <asp:Button ID="btnSave" runat="server" Text="حفظ التبرع" CssClass="btn btn-primary" OnClick="btnSave_Click" />
</div>

<div class="card p-3">
    <h5>قائمة التبرعات</h5>

    <asp:GridView ID="gvDonations" runat="server" CssClass="table table-bordered"
        AutoGenerateColumns="false">

        <Columns>
            <asp:BoundField DataField="DonationId" HeaderText="رقم" />
            <asp:BoundField DataField="DonationTypeAr" HeaderText="النوع" />
            <asp:BoundField DataField="Amount" HeaderText="المبلغ" />
            <asp:BoundField DataField="DonorName" HeaderText="المتبرع" />
            <asp:BoundField DataField="DonorPhone" HeaderText="الجوال" />
            <asp:BoundField DataField="DonationDate" HeaderText="التاريخ" />
        </Columns>

    </asp:GridView>
</div>

</asp:Content>
