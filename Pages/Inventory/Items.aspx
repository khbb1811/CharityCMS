<%@ Page Title="المخزون" Language="C#" MasterPageFile="~/MasterPages/Admin.master"
    AutoEventWireup="true" CodeBehind="Items.aspx.cs" Inherits="CharityCMS.Pages.Inventory.Items" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .page-card {
            border: none;
            border-radius: 16px;
            box-shadow: 0 4px 18px rgba(0,0,0,0.08);
        }

        .summary-card {
            border: none;
            border-radius: 18px;
            color: #fff;
            padding: 18px;
            min-height: 120px;
            position: relative;
            overflow: hidden;
        }

        .summary-card:before {
            content: '';
            position: absolute;
            top: -20px;
            left: -20px;
            width: 90px;
            height: 90px;
            border-radius: 50%;
            background: rgba(255,255,255,.12);
        }

        .summary-primary { background: linear-gradient(135deg, #0d6efd, #3d8bfd); }
        .summary-success { background: linear-gradient(135deg, #198754, #2bb673); }
        .summary-danger  { background: linear-gradient(135deg, #dc3545, #e35d6a); }
        .summary-secondary { background: linear-gradient(135deg, #6c757d, #8a939b); }

        .summary-label {
            font-size: 14px;
            opacity: .95;
            margin-bottom: 8px;
        }

        .summary-value {
            font-size: 30px;
            font-weight: bold;
            line-height: 1.1;
        }

        .summary-sub {
            font-size: 12px;
            opacity: .9;
            margin-top: 6px;
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

        .badge-low {
            background-color: #dc3545;
            color: #fff;
        }

        .badge-ok {
            background-color: #198754;
            color: #fff;
        }

        .badge-inactive {
            background-color: #6c757d;
            color: #fff;
        }

        .badge-used {
            background-color: #fd7e14;
            color: #fff;
        }

        .row-low-stock {
            background-color: #fff5f5 !important;
        }

        .row-inactive {
            background-color: #f8f9fa !important;
            opacity: 0.95;
        }

        .actions .btn {
            margin-left: 4px;
            margin-bottom: 4px;
        }

        .modal .form-label {
            font-weight: 600;
        }

        .history-box {
            background: #f8f9fa;
            border: 1px solid #e9ecef;
            border-radius: 12px;
            padding: 15px;
        }

        .history-summary-card {
            border-radius: 14px;
            border: 1px solid #e9ecef;
            background: #fff;
            padding: 12px 14px;
            height: 100%;
        }

        .history-summary-title {
            color: #6c757d;
            font-size: 13px;
        }

        .history-summary-value {
            font-size: 24px;
            font-weight: bold;
        }

        .grid-caption {
            font-size: 13px;
            color: #6c757d;
        }

        .pagination-outer a,
        .pagination-outer span {
            display: inline-block;
            padding: 6px 12px;
            margin: 2px;
            border: 1px solid #dee2e6;
            border-radius: 6px;
            text-decoration: none;
        }

        .pagination-outer span {
            background-color: #0d6efd;
            color: #fff;
            border-color: #0d6efd;
        }

        .toolbar-wrap {
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
        }
    </style>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:Literal ID="litMsg" runat="server"></asp:Literal>

    <!-- تنبيه عام داخل نفس الصفحة -->
    <asp:Panel ID="pnlGlobalAlert" runat="server" Visible="false" CssClass="alert alert-warning mb-3">
        <div class="d-flex justify-content-between align-items-center flex-wrap gap-2">
            <div>
                <strong>تنبيه مخزون:</strong>
                يوجد <asp:Literal ID="litGlobalLowStockCount" runat="server" Text="0"></asp:Literal>
                صنف/أصناف أقل من أو يساوي الحد الأدنى للمخزون.
            </div>
            <asp:Button ID="btnShowLowStockOnly" runat="server"
                Text="عرض الأصناف المنخفضة فقط"
                CssClass="btn btn-sm btn-warning"
                CausesValidation="false"
                OnClick="btnShowLowStockOnly_Click" />
        </div>
    </asp:Panel>

    <!-- KPI -->
    <div class="row g-3 mb-3">
        <div class="col-md-3">
            <div class="summary-card summary-primary">
                <div class="summary-label">إجمالي الأصناف</div>
                <div class="summary-value">
                    <asp:Literal ID="litTotalItems" runat="server" Text="0"></asp:Literal>
                </div>
                <div class="summary-sub">عدد الأصناف في جدول المخزون</div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="summary-card summary-success">
                <div class="summary-label">إجمالي الكمية الحالية</div>
                <div class="summary-value">
                    <asp:Literal ID="litTotalQty" runat="server" Text="0"></asp:Literal>
                </div>
                <div class="summary-sub">مجموع QuantityOnHand</div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="summary-card summary-danger">
                <div class="summary-label">الأصناف منخفضة المخزون</div>
                <div class="summary-value">
                    <asp:Literal ID="litLowStockItems" runat="server" Text="0"></asp:Literal>
                </div>
                <div class="summary-sub">الكمية الحالية ≤ الحد الأدنى</div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="summary-card summary-secondary">
                <div class="summary-label">الأصناف غير النشطة</div>
                <div class="summary-value">
                    <asp:Literal ID="litInactiveItems" runat="server" Text="0"></asp:Literal>
                </div>
                <div class="summary-sub">IsActive = 0</div>
            </div>
        </div>
    </div>

    <!-- أدوات الصفحة -->
    <div class="card page-card mb-3">
        <div class="card-body">
            <div class="d-flex justify-content-between align-items-center flex-wrap gap-2">
                <div>
                    <h4 class="mb-1">إدارة المخزون</h4>
                    <%--<div class="text-muted">عرض الأصناف، حالة المخزون، سجل الحركة، وتصدير البيانات</div>--%>
                </div>

                <div class="toolbar-wrap">
                    <asp:Button ID="btnExportExcel" runat="server"
                        Text="Export Excel"
                        CssClass="btn btn-outline-success"
                        CausesValidation="false"
                        OnClick="btnExportExcel_Click" />

                    <asp:Button ID="btnAddNew" runat="server"
                        Text="إضافة صنف جديد"
                        CssClass="btn btn-primary"
                        CausesValidation="false"
                        OnClick="btnAddNew_Click" />
                </div>
            </div>
        </div>
    </div>

    <!-- الفلاتر -->
    <div class="card page-card mb-3">
        <div class="card-body">
            <div class="row g-2">
                <div class="col-md-4">
                    <label class="form-label">اسم الصنف</label>
                    <asp:TextBox ID="txtSearchItem" runat="server" CssClass="form-control" placeholder="ابحث باسم الصنف"></asp:TextBox>
                </div>

                <div class="col-md-4">
                    <label class="form-label">حالة المخزون</label>
                    <asp:DropDownList ID="ddlStockStatus" runat="server" CssClass="form-select">
                        <asp:ListItem Value="">الكل</asp:ListItem>
                        <asp:ListItem Value="low">منخفض</asp:ListItem>
                        <asp:ListItem Value="ok">طبيعي</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="col-md-4">
                    <label class="form-label">الحالة</label>
                    <asp:DropDownList ID="ddlActiveStatus" runat="server" CssClass="form-select">
                        <asp:ListItem Value="">الكل</asp:ListItem>
                        <asp:ListItem Value="1">نشط</asp:ListItem>
                        <asp:ListItem Value="0">غير نشط</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="col-12 d-flex align-items-end gap-2 mt-2">
                    <asp:Button ID="btnFilter" runat="server"
                        Text="فلترة"
                        CssClass="btn btn-outline-primary"
                        CausesValidation="false"
                        OnClick="btnFilter_Click" />

                    <asp:Button ID="btnResetFilter" runat="server"
                        Text="إلغاء الفلترة"
                        CssClass="btn btn-outline-secondary"
                        CausesValidation="false"
                        OnClick="btnResetFilter_Click" />
                </div>
            </div>
        </div>
    </div>

    <!-- الجدول -->
    <div class="card page-card mb-3">
        <div class="card-body">
            <div class="d-flex justify-content-between align-items-center mb-2 flex-wrap gap-2">
                <div>
                    <h5 class="mb-1">قائمة الأصناف</h5>
                    <div class="grid-caption">الأصناف المستخدمة في التبرعات أو التوزيعات لا يمكن تعديلها من هذه الصفحة</div>
                </div>
            </div>

            <div class="table-responsive">
                <asp:GridView ID="gvItems" runat="server"
                    CssClass="table table-bordered table-hover align-middle"
                    AutoGenerateColumns="false"
                    DataKeyNames="InventoryId"
                    EmptyDataText="لا توجد أصناف"
                    AllowPaging="true"
                    PageSize="10"
                    OnPageIndexChanging="gvItems_PageIndexChanging"
                    OnRowCommand="gvItems_RowCommand"
                    OnRowDataBound="gvItems_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="InventoryId" HeaderText="رقم" />
                        <asp:BoundField DataField="ItemNameAr" HeaderText="الصنف" />
                        <asp:BoundField DataField="UnitNameAr" HeaderText="الوحدة" />
                        <asp:BoundField DataField="QuantityOnHand" HeaderText="الكمية الحالية" DataFormatString="{0:N2}" />
                        <asp:BoundField DataField="LowStockLevel" HeaderText="الحد الأدنى" DataFormatString="{0:N2}" />

                        <asp:TemplateField HeaderText="حالة المخزون">
                            <ItemTemplate>
                                <asp:Literal ID="litStockBadge" runat="server"></asp:Literal>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="الحالة">
                            <ItemTemplate>
                                <asp:Literal ID="litActiveBadge" runat="server"></asp:Literal>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="الاستخدام">
                            <ItemTemplate>
                                <asp:Literal ID="litMovementBadge" runat="server"></asp:Literal>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="الإجراءات">
                            <ItemTemplate>
                                <div class="actions d-flex justify-content-center flex-wrap">
                                    <asp:LinkButton ID="btnHistory" runat="server"
                                        CommandName="ShowHistory"
                                        CommandArgument='<%# Eval("InventoryId") %>'
                                        CssClass="btn btn-sm btn-info text-white"
                                        CausesValidation="false">
                                        الحركة
                                    </asp:LinkButton>

                                    <asp:LinkButton ID="btnEdit" runat="server"
                                        CommandName="EditItem"
                                        CommandArgument='<%# Eval("InventoryId") %>'
                                        CssClass="btn btn-sm btn-warning"
                                        CausesValidation="false">
                                        تعديل
                                    </asp:LinkButton>

                                    <asp:LinkButton ID="btnDelete" runat="server"
                                        CommandName="SoftDeleteItem"
                                        CommandArgument='<%# Eval("InventoryId") %>'
                                        CssClass="btn btn-sm btn-danger"
                                        CausesValidation="false"
                                        OnClientClick="return confirm('هل أنت متأكد من تعطيل هذا الصنف؟');">
                                        حذف
                                    </asp:LinkButton>

                                    <asp:LinkButton ID="btnReactivate" runat="server"
                                        CommandName="ReactivateItem"
                                        CommandArgument='<%# Eval("InventoryId") %>'
                                        CssClass="btn btn-sm btn-success"
                                        CausesValidation="false"
                                        Visible="false">
                                        إعادة تفعيل
                                    </asp:LinkButton>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                    <PagerStyle CssClass="pagination-outer" HorizontalAlign="Center" />
                    <PagerSettings Mode="NumericFirstLast" FirstPageText="الأولى" LastPageText="الأخيرة" />
                </asp:GridView>
            </div>
        </div>
    </div>

    <!-- سجل الحركة -->
    <asp:Panel ID="pnlHistory" runat="server" Visible="false" CssClass="card page-card" ClientIDMode="Static">
        <div class="card-body">
            <div class="d-flex justify-content-between align-items-center flex-wrap gap-2 mb-3">
                <div>
                    <h5 class="mb-1">سجل حركة الصنف</h5>
                    <div class="text-muted">
                        الصنف:
                        <strong><asp:Literal ID="litHistoryItemName" runat="server"></asp:Literal></strong>
                    </div>
                </div>

                <asp:Button ID="btnCloseHistory" runat="server"
                    Text="إخفاء السجل"
                    CssClass="btn btn-outline-secondary btn-sm"
                    CausesValidation="false"
                    OnClick="btnCloseHistory_Click" />
            </div>

            <!-- بطاقات السجل -->
            <div class="row g-3 mb-3">
                <div class="col-md-4">
                    <div class="history-summary-card">
                        <div class="history-summary-title">إجمالي الداخل</div>
                        <div class="history-summary-value text-success">
                            <asp:Literal ID="litHistoryInQty" runat="server" Text="0"></asp:Literal>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="history-summary-card">
                        <div class="history-summary-title">إجمالي الخارج</div>
                        <div class="history-summary-value text-danger">
                            <asp:Literal ID="litHistoryOutQty" runat="server" Text="0"></asp:Literal>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="history-summary-card">
                        <div class="history-summary-title">الرصيد الحالي</div>
                        <div class="history-summary-value text-primary">
                            <asp:Literal ID="litHistoryBalance" runat="server" Text="0"></asp:Literal>
                        </div>
                    </div>
                </div>
            </div>

            <div class="history-box">
                <asp:GridView ID="gvHistory" runat="server"
                    CssClass="table table-bordered table-sm align-middle mb-0"
                    AutoGenerateColumns="false"
                    EmptyDataText="لا توجد حركة لهذا الصنف">
                    <Columns>
                        <asp:BoundField DataField="MovementTypeAr" HeaderText="نوع الحركة" />
                        <asp:BoundField DataField="RefId" HeaderText="المرجع" />
                        <asp:BoundField DataField="MovementDate" HeaderText="التاريخ" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:BoundField DataField="QuantityText" HeaderText="الكمية" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </asp:Panel>

    <!-- Modal -->
    <div class="modal fade" id="itemModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">
                        <asp:Literal ID="litModalTitle" runat="server" Text="إضافة صنف جديد"></asp:Literal>
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="إغلاق"></button>
                </div>

                <div class="modal-body">
                    <asp:HiddenField ID="hdnInventoryId" runat="server" />

                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label">اسم الصنف</label>
                            <asp:TextBox ID="txtItemNameAr" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">الوحدة</label>
                            <asp:TextBox ID="txtUnitNameAr" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">الحد الأدنى للمخزون</label>
                            <asp:TextBox ID="txtLowStockLevel" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="col-md-6 d-flex align-items-end">
                            <div class="form-check">
                                <asp:CheckBox ID="chkIsActive" runat="server" CssClass="form-check-input" Checked="true" />
                                <label class="form-check-label" for="<%= chkIsActive.ClientID %>">الصنف نشط</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="alert alert-info mb-0">
                                ملاحظة: الكمية الحالية للمخزون تُحدث تلقائيًا بواسطة حركات التبرعات والتوزيعات، لذلك التعديل هنا على بيانات الصنف الأساسية فقط.
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <asp:Button ID="btnSave" runat="server"
                        Text="حفظ"
                        CssClass="btn btn-primary"
                        OnClick="btnSave_Click" />

                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">إغلاق</button>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function showItemModal() {
            var el = document.getElementById('itemModal');
            var modal = new bootstrap.Modal(el);
            modal.show();
        }

        function hideItemModal() {
            var el = document.getElementById('itemModal');
            var modal = bootstrap.Modal.getInstance(el);
            if (modal) {
                modal.hide();
            }
        }

        function scrollToHistory() {
            var el = document.getElementById('pnlHistory');
            if (el) {
                el.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
        }
    </script>

</asp:Content>
