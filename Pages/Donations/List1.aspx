<%@ Page Title="التبرعات" Language="C#" MasterPageFile="~/MasterPages/Admin.master"
    AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="CharityCMS.Pages.Donations.List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .page-card {
            border: none;
            border-radius: 16px;
            box-shadow: 0 4px 18px rgba(0,0,0,0.08);
        }

        .table thead th {
            background-color: #0d6efd;
            color: #fff;
            text-align: center;
            vertical-align: middle;
        }

        .table td {
            vertical-align: middle;
        }

        .details-box {
            background: #f8f9fa;
            border: 1px solid #e9ecef;
            border-radius: 12px;
            padding: 15px;
        }
    </style>

    <div class="row g-4">

        <!-- نموذج الإضافة / التعديل -->
        <div class="col-lg-4">
            <div class="card page-card">
                <div class="card-body">
                    <h4 class="mb-3">
                        <asp:Literal ID="litFormTitle" runat="server" Text="إضافة تبرع"></asp:Literal>
                    </h4>

                    <asp:Literal ID="litMsg" runat="server"></asp:Literal>
                    <asp:HiddenField ID="hdnDonationId" runat="server" />

                    <div class="mb-3">
                        <label class="form-label">نوع التبرع</label>
                        <asp:DropDownList ID="ddlDonationType" runat="server" CssClass="form-select"></asp:DropDownList>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">تاريخ التبرع</label>
                        <asp:TextBox ID="txtDonationDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">اسم المتبرع</label>
                        <asp:TextBox ID="txtDonorName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">الجوال</label>
                        <asp:TextBox ID="txtDonorPhone" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">المبلغ</label>
                        <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control"></asp:TextBox>
                        <div class="form-text">للتبرعات المالية فقط. للتبرع العيني يمكن تركها فارغة.</div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">ملاحظات</label>
                        <asp:TextBox ID="txtNotes" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                    </div>

                    <div class="d-flex gap-2">
                        <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn btn-primary" OnClick="btnSave_Click" />
                        <asp:Button ID="btnCancel" runat="server" Text="إلغاء التعديل" CssClass="btn btn-secondary"
                            CausesValidation="false" Visible="false" OnClick="btnCancel_Click" />
                    </div>
                </div>
            </div>
        </div>

        <!-- القائمة + الفلترة + التفاصيل -->
        <div class="col-lg-8">
            <div class="card page-card">
                <div class="card-body">
                    <h4 class="mb-3">قائمة التبرعات</h4>

                    <!-- فلترة -->
                    <div class="row g-2 mb-3">
                        <div class="col-md-4">
                            <label class="form-label">من تاريخ</label>
                            <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        </div>

                        <div class="col-md-4">
                            <label class="form-label">إلى تاريخ</label>
                            <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        </div>

                        <div class="col-md-4 d-flex align-items-end gap-2">
                            <asp:Button ID="btnFilter" runat="server" Text="فلترة" CssClass="btn btn-outline-primary"
                                CausesValidation="false" OnClick="btnFilter_Click" />
                            <asp:Button ID="btnResetFilter" runat="server" Text="إلغاء الفلترة" CssClass="btn btn-outline-secondary"
                                CausesValidation="false" OnClick="btnResetFilter_Click" />
                        </div>
                    </div>

                    <!-- الجدول -->
                    <div class="table-responsive">
                        <asp:GridView ID="gvDonations" runat="server"
                            CssClass="table table-bordered table-hover align-middle"
                            AutoGenerateColumns="false"
                            DataKeyNames="DonationId"
                            EmptyDataText="لا توجد تبرعات"
                            OnRowCommand="gvDonations_RowCommand"
                            OnRowDeleting="gvDonations_RowDeleting">

                            <Columns>
                                <asp:BoundField DataField="DonationId" HeaderText="رقم" />
                                <asp:BoundField DataField="DonationDate" HeaderText="التاريخ" DataFormatString="{0:yyyy-MM-dd}" />
                                <asp:BoundField DataField="DonationTypeAr" HeaderText="النوع" />
                                <asp:BoundField DataField="DonorName" HeaderText="اسم المتبرع" />
                                <asp:BoundField DataField="DonorPhone" HeaderText="الجوال" />
                                <asp:BoundField DataField="Amount" HeaderText="المبلغ" DataFormatString="{0:N2}" />

                                <asp:TemplateField HeaderText="الإجراءات">
                                    <ItemTemplate>
                                        <div class="d-flex gap-1 justify-content-center">
                                            <asp:LinkButton ID="btnDetails" runat="server"
                                                CssClass="btn btn-sm btn-info text-white"
                                                CommandName="ShowDetails"
                                                CommandArgument='<%# Eval("DonationId") %>'
                                                CausesValidation="false">
                                                تفاصيل
                                            </asp:LinkButton>

                                            <asp:LinkButton ID="btnEdit" runat="server"
                                                CssClass="btn btn-sm btn-warning"
                                                CommandName="EditDonation"
                                                CommandArgument='<%# Eval("DonationId") %>'
                                                CausesValidation="false">
                                                تعديل
                                            </asp:LinkButton>

                                            <asp:LinkButton ID="btnDelete" runat="server"
                                                CssClass="btn btn-sm btn-danger"
                                                CommandName="Delete"
                                                CommandArgument='<%# Eval("DonationId") %>'
                                                CausesValidation="false"
                                                OnClientClick="return confirm('هل أنت متأكد من حذف التبرع؟');">
                                                حذف
                                            </asp:LinkButton>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>

                    <!-- تفاصيل -->
                    <asp:Panel ID="pnlDetails" runat="server" Visible="false" CssClass="mt-4">
                        <h5 class="mb-3">تفاصيل التبرع</h5>

                        <div class="details-box mb-3">
                            <div class="row g-2">
                                <div class="col-md-6"><strong>الرقم:</strong> <asp:Literal ID="litDonationId" runat="server"></asp:Literal></div>
                                <div class="col-md-6"><strong>التاريخ:</strong> <asp:Literal ID="litDonationDate" runat="server"></asp:Literal></div>
                                <div class="col-md-6"><strong>النوع:</strong> <asp:Literal ID="litDonationType" runat="server"></asp:Literal></div>
                                <div class="col-md-6"><strong>اسم المتبرع:</strong> <asp:Literal ID="litDonorName" runat="server"></asp:Literal></div>
                                <div class="col-md-6"><strong>الجوال:</strong> <asp:Literal ID="litDonorPhone" runat="server"></asp:Literal></div>
                                <div class="col-md-6"><strong>المبلغ:</strong> <asp:Literal ID="litAmount" runat="server"></asp:Literal></div>
                                <div class="col-12"><strong>ملاحظات:</strong> <asp:Literal ID="litNotes" runat="server"></asp:Literal></div>
                            </div>
                        </div>

                        <asp:Panel ID="pnlItems" runat="server" Visible="false">
                            <h6 class="mb-2">بنود التبرع العيني</h6>
                            <asp:GridView ID="gvDonationItems" runat="server"
                                CssClass="table table-bordered table-sm"
                                AutoGenerateColumns="false"
                                EmptyDataText="لا توجد بنود لهذا التبرع">
                                <Columns>
                                    <asp:BoundField DataField="ItemNameAr" HeaderText="الصنف" />
                                    <asp:BoundField DataField="UnitNameAr" HeaderText="الوحدة" />
                                    <asp:BoundField DataField="Quantity" HeaderText="الكمية" DataFormatString="{0:N2}" />
                                </Columns>
                            </asp:GridView>
                        </asp:Panel>
                    </asp:Panel>

                </div>
            </div>
        </div>

    </div>

</asp:Content>