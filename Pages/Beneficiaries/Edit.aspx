<%@ Page Title="إضافة/تعديل مستفيد" Language="C#" MasterPageFile="~/MasterPages/Admin.master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="CharityCMS.Pages.Beneficiaries.Edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

  <div class="d-flex justify-content-between align-items-center mb-2">
    <h5 class="mb-0">بيانات المستفيد</h5>
    <a class="btn btn-outline-secondary" href="List.aspx">رجوع</a>
  </div>

  <div class="card p-3">
    <asp:Literal ID="litMsg" runat="server" />

    <div class="row g-3">
      <div class="col-12 col-md-6">
        <label class="form-label">الاسم الكامل</label>
        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
      </div>
      <div class="col-12 col-md-6">
        <label class="form-label">رقم الهوية</label>
        <asp:TextBox ID="txtNational" runat="server" CssClass="form-control" />
      </div>
      <div class="col-12 col-md-6">
        <label class="form-label">الجوال</label>
        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" />
      </div>
      <div class="col-12 col-md-6">
        <label class="form-label">المدينة</label>
        <asp:DropDownList ID="ddlCity" runat="server" CssClass="form-select" />
      </div>
      <div class="col-12">
        <label class="form-label">العنوان</label>
        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" />
      </div>
      <div class="col-6 col-md-3">
        <label class="form-label">عدد أفراد الأسرة</label>
        <asp:TextBox ID="txtFamily" runat="server" CssClass="form-control" Text="0" />
      </div>
      <div class="col-6 col-md-3">
        <label class="form-label">الدخل</label>
        <asp:TextBox ID="txtIncome" runat="server" CssClass="form-control" />
      </div>
      <div class="col-12 col-md-6">
        <label class="form-label">نوع الدعم</label>
        <asp:DropDownList ID="ddlSupport" runat="server" CssClass="form-select" />
      </div>
      <div class="col-12">
        <label class="form-label">حالة الدعم</label>
        <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-select">
          <asp:ListItem Text="نشط" Value="Active" />
          <asp:ListItem Text="غير نشط" Value="Inactive" />
          <asp:ListItem Text="معلق" Value="OnHold" />
        </asp:DropDownList>
      </div>
    </div>

    <div class="d-flex gap-2 mt-3">
      <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="حفظ" OnClick="btnSave_Click" />
      <a class="btn btn-outline-secondary" href="List.aspx">إلغاء</a>
    </div>

  </div>

</asp:Content>
