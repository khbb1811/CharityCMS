<%@ Page Title="المستفيدون" Language="C#" MasterPageFile="~/MasterPages/Admin.master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="CharityCMS.Pages.Beneficiaries.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

  <div class="card p-3 mb-3">
    <div class="row g-2 align-items-end">
      <div class="col-12 col-md-4">
        <label class="form-label">بحث</label>
        <asp:TextBox ID="txtQ" runat="server" CssClass="form-control" placeholder="الاسم / رقم الهوية / الجوال" />
      </div>
      <div class="col-6 col-md-3">
        <label class="form-label">المدينة</label>
        <asp:DropDownList ID="ddlCity" runat="server" CssClass="form-select" />
      </div>
      <div class="col-6 col-md-3">
        <label class="form-label">نوع الدعم</label>
        <asp:DropDownList ID="ddlSupport" runat="server" CssClass="form-select" />
      </div>
      <div class="col-12 col-md-2 d-grid">
        <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-primary" Text="بحث" OnClick="btnSearch_Click" />
      </div>
    </div>
  </div>

  <div class="d-flex justify-content-between align-items-center mb-2">
    <h5 class="mb-0">قائمة المستفيدين</h5>
    <a class="btn btn-outline-primary" href="Edit.aspx">+ إضافة مستفيد</a>
  </div>

  <!-- Desktop Table -->
  <div class="card p-2 d-none d-md-block">
    <div class="table-responsive">
      <asp:GridView ID="gv" runat="server" CssClass="table table-hover align-middle mb-0" AutoGenerateColumns="False" OnRowCommand="gv_RowCommand">
        <Columns>
          <asp:BoundField DataField="FullNameAr" HeaderText="الاسم" />
          <asp:BoundField DataField="NationalId" HeaderText="الهوية" />
          <asp:BoundField DataField="Phone" HeaderText="الجوال" />
          <asp:BoundField DataField="CityNameAr" HeaderText="المدينة" />
          <asp:TemplateField HeaderText="إجراءات">
            <ItemTemplate>
              <a class="btn btn-sm btn-outline-secondary" href='Edit.aspx?id=<%# Eval("BeneficiaryId") %>'>تعديل</a>
              <asp:LinkButton runat="server" CssClass="btn btn-sm btn-outline-danger" CommandName="Del" CommandArgument='<%# Eval("BeneficiaryId") %>' OnClientClick="return confirm('تأكيد الحذف؟');">حذف</asp:LinkButton>
            </ItemTemplate>
          </asp:TemplateField>
        </Columns>
      </asp:GridView>
    </div>
  </div>

  <!-- Mobile Cards -->
  <div class="table-responsive-card d-md-none">
    <asp:Repeater ID="rptCards" runat="server">
      <ItemTemplate>
        <div class="card p-3">
          <div class="fw-bold"><%# Eval("FullNameAr") %></div>
          <div class="text-muted small">هوية: <%# Eval("NationalId") %></div>
          <div class="text-muted small">جوال: <%# Eval("Phone") %></div>
          <div class="text-muted small">مدينة: <%# Eval("CityNameAr") %></div>
          <div class="d-flex gap-2 mt-2">
            <a class="btn btn-sm btn-outline-secondary" href='Edit.aspx?id=<%# Eval("BeneficiaryId") %>'>تعديل</a>
            <asp:LinkButton runat="server" CssClass="btn btn-sm btn-outline-danger" CommandName="Del" CommandArgument='<%# Eval("BeneficiaryId") %>' OnClientClick="return confirm('تأكيد الحذف؟');">حذف</asp:LinkButton>
          </div>
        </div>
      </ItemTemplate>
    </asp:Repeater>
  </div>

</asp:Content>
