<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.master" AutoEventWireup="true" CodeBehind="DistribSolid.aspx.cs" Inherits="CharityCMS.Pages.Distributions.DistribSolid" %>



<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

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
            white-space: nowrap;
        }

        .table td {
            vertical-align: middle;
        }

        .stock-info {
            display: inline-block;
            margin-top: 8px;
            font-size: 13px;
            color: #6c757d;
        }

        .filter-box {
            background: #f8f9fa;
            border: 1px solid #e9ecef;
            border-radius: 12px;
            padding: 16px;
            margin-bottom: 16px;
        }
    </style>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="row g-4">

        <!-- النموذج -->
        <div class="col-lg-4">
            <div class="card page-card">
                <div class="card-body">

                    <h4 class="mb-3">إضافة توزيع</h4>

                    <asp:Literal ID="litMsg" runat="server"></asp:Literal>
                    <asp:HiddenField ID="hdnDistributionId" runat="server" />

                    <div class="mb-3">
                        <label class="form-label">المستفيد</label>
                        <asp:DropDownList ID="ddlBeneficiary" runat="server" CssClass="form-select"></asp:DropDownList>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">تاريخ التوزيع</label>
                        <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">نوع التوزيع</label>
                        <asp:TextBox ID="txtDistributionType" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">ملاحظات</label>
                        <asp:TextBox ID="txtNotes" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                    </div>

                    <div class="d-grid">
                        <asp:Button ID="btnCreate" runat="server"
                            Text="إنشاء التوزيع"
                            CssClass="btn btn-primary"
                            OnClick="btnCreate_Click" />
                    </div>

                    <asp:Panel ID="pnlCart" runat="server" Visible="false" CssClass="mt-4">
                        <hr />
                        <h5 class="mb-3">🛒 سلة التوزيع</h5>

                        <div class="mb-3">
                            <label class="form-label">الصنف</label>
                            <asp:DropDownList ID="ddlItem" runat="server"
                                CssClass="form-select"
                                AutoPostBack="true"
                                OnSelectedIndexChanged="ddlItem_SelectedIndexChanged">
                            </asp:DropDownList>

                            <asp:Label ID="lblStock" runat="server" CssClass="stock-info"></asp:Label>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">الكمية</label>
                            <asp:TextBox ID="txtQty" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="d-grid mb-3">
                            <asp:Button ID="btnAdd" runat="server"
                                Text="➕ إضافة للسلة"
                                CssClass="btn btn-success"
                                OnClick="btnAdd_Click" />
                        </div>

                        <asp:GridView ID="gvCart" runat="server"
                            CssClass="table table-bordered table-sm"
                            AutoGenerateColumns="false"
                            EmptyDataText="لا توجد أصناف في السلة"
                            OnRowCommand="gvCart_RowCommand">
                            <Columns>
                                <asp:BoundField DataField="Item" HeaderText="الصنف" />
                                <asp:BoundField DataField="Qty" HeaderText="الكمية" />

                                <asp:TemplateField HeaderText="إجراء">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnRemove" runat="server"
                                            CommandName="Remove"
                                            CommandArgument='<%# Container.DataItemIndex %>'
                                            Text="❌ حذف"
                                            CssClass="btn btn-danger btn-sm"
                                            CausesValidation="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                        <div class="d-grid mt-3">
                            <asp:Button ID="btnSaveAll" runat="server"
                                Text="✅ حفظ التوزيع"
                                CssClass="btn btn-success"
                                OnClick="btnSaveAll_Click" />
                        </div>
                    </asp:Panel>

                </div>
            </div>
        </div>

        <!-- القائمة -->
        <div class="col-lg-8">
            <div class="card page-card">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center flex-wrap gap-2 mb-3">
                        <h4 class="mb-0">سجل التوزيعات</h4>
                        <asp:Button ID="btnExportExcel" runat="server"
                            Text="⬇️ تصدير Excel"
                            CssClass="btn btn-outline-success"
                            OnClick="btnExportExcel_Click" />
                    </div>

                    <div class="filter-box">
    <div class="row g-3">
        <div class="col-md-6">
            <label class="form-label">فلترة بالمستفيد</label>
            <div class="input-group">
                <asp:TextBox ID="txtFilterBeneficiarySearch" runat="server"
                    CssClass="form-control"
                    placeholder="اكتب اسم المستفيد للبحث..."></asp:TextBox>

                <asp:DropDownList ID="ddlFilterBeneficiary" runat="server" CssClass="form-select"></asp:DropDownList>
            </div>
            <small class="text-muted">اكتب جزءًا من الاسم ثم اختر المستفيد من القائمة</small>
        </div>

        <div class="col-md-6">
            <label class="form-label">فلترة بالبلد</label>
            <asp:DropDownList ID="ddlFilterCountry" runat="server" CssClass="form-select"></asp:DropDownList>
        </div>

        <div class="col-md-6">
            <label class="form-label">فلترة ببيانات/ملاحظات التوزيع</label>
            <asp:TextBox ID="txtFilterNotes" runat="server" CssClass="form-control" placeholder="ابحث داخل الملاحظات"></asp:TextBox>
        </div>

        <div class="col-md-6">
            <label class="form-label">فلترة بصنف التوزيع</label>
            <asp:DropDownList ID="ddlFilterItem" runat="server" CssClass="form-select"></asp:DropDownList>
        </div>

        <div class="col-md-6">
            <label class="form-label">من تاريخ</label>
            <asp:TextBox ID="txtDateFrom" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
        </div>

        <div class="col-md-6">
            <label class="form-label">إلى تاريخ</label>
            <asp:TextBox ID="txtDateTo" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
        </div>
    </div>

    <div class="d-flex gap-2 flex-wrap mt-3">
        <asp:Button ID="btnFilter" runat="server"
            Text="🔎 تطبيق الفلتر"
            CssClass="btn btn-primary"
            OnClick="btnFilter_Click" />

        <asp:Button ID="btnResetFilter" runat="server"
            Text="🧹 إعادة تعيين"
            CssClass="btn btn-secondary"
            OnClick="btnResetFilter_Click"
            CausesValidation="false" />
    </div>
</div>


                    <asp:GridView ID="gvDist" runat="server"
    CssClass="table table-bordered table-hover align-middle"
    AutoGenerateColumns="false"
    DataKeyNames="DistributionId"
    EmptyDataText="لا توجد توزيعات"
    OnRowEditing="gvDist_RowEditing"
    OnRowCancelingEdit="gvDist_RowCancelingEdit"
    OnRowUpdating="gvDist_RowUpdating"
    OnRowDeleting="gvDist_RowDeleting">

    <Columns>

        <asp:BoundField DataField="DistributionId" HeaderText="رقم" ReadOnly="true"/>

        <asp:BoundField DataField="BeneficiaryName" HeaderText="المستفيد" ReadOnly="true"/>

        <asp:BoundField DataField="CityNameAr" HeaderText="البلد" ReadOnly="true"/>

        <asp:BoundField DataField="DistributionDate"
            HeaderText="التاريخ"
            DataFormatString="{0:yyyy-MM-dd}" />

        <asp:BoundField DataField="DistributionType" HeaderText="نوع التوزيع"/>

        <asp:BoundField DataField="Notes" HeaderText="ملاحظات"/>

        <asp:BoundField DataField="ItemNameAr" HeaderText="الصنف" ReadOnly="true"/>

        <asp:BoundField DataField="Quantity" HeaderText="الكمية"/>

        <asp:CommandField
            ShowEditButton="true"
            ShowDeleteButton="true"
            EditText="✏️ تعديل"
            DeleteText="🗑 حذف"
            CancelText="إلغاء"
            UpdateText="حفظ"/>
    </Columns>
</asp:GridView>

                </div>
            </div>
        </div>

    </div>

    <script type="text/javascript">
        (function () {
            function initBeneficiaryFilter() {
                var txt = document.getElementById('<%= txtFilterBeneficiarySearch.ClientID %>');
            var ddl = document.getElementById('<%= ddlFilterBeneficiary.ClientID %>');

                if (!txt || !ddl) return;

                if (!ddl.dataset.allOptions) {
                    var all = [];
                    for (var i = 0; i < ddl.options.length; i++) {
                        all.push({
                            text: ddl.options[i].text,
                            value: ddl.options[i].value
                        });
                    }
                    ddl.dataset.allOptions = JSON.stringify(all);
                }

                txt.addEventListener('keyup', function () {
                    var keyword = txt.value.toLowerCase().trim();
                    var allOptions = JSON.parse(ddl.dataset.allOptions);
                    var currentValue = ddl.value;

                    ddl.options.length = 0;

                    for (var i = 0; i < allOptions.length; i++) {
                        var item = allOptions[i];
                        if (keyword === '' || item.text.toLowerCase().indexOf(keyword) !== -1) {
                            ddl.options.add(new Option(item.text, item.value));
                        }
                    }

                    for (var j = 0; j < ddl.options.length; j++) {
                        if (ddl.options[j].value === currentValue) {
                            ddl.selectedIndex = j;
                            break;
                        }
                    }
                });
            }

            if (document.readyState === 'loading') {
                document.addEventListener('DOMContentLoaded', initBeneficiaryFilter);
            } else {
                initBeneficiaryFilter();
            }

            if (typeof Sys !== 'undefined' && Sys.Application) {
                Sys.Application.add_load(initBeneficiaryFilter);
            }
        })();
                </script>

</asp:Content>