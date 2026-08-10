
<%@ Page Title="إدارة النظام"
    Language="C#"
    MasterPageFile="~/MasterPages/Admin.master"
    AutoEventWireup="true"
    CodeBehind="Register.aspx.cs"
    Inherits="CharityCMS.Pages.Auth.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <!-- ✅ الأزرار -->
    <div class="d-flex gap-2 mb-4">
        <asp:Button ID="btnShowUsers" runat="server"
            Text="👤 إدارة المستخدمين"
            CssClass="btn btn-primary"
            OnClick="btnShowUsers_Click" />

        <asp:Button ID="btnShowAccounts" runat="server"
            Text="💰 إدارة الحسابات المالية"
            CssClass="btn btn-success"
            OnClick="btnShowAccounts_Click" />

        
<asp:Button ID="btnShowCities" runat="server"
    Text="🏙️ إدارة المدن"
    CssClass="btn btn-warning"
    OnClick="btnShowCities_Click" />
       
        <asp:Button ID="btnShowImages" runat="server"
    Text="🖼️ إدارة الصور"
    CssClass="btn btn-info"
    OnClick="btnShowImages_Click" />

    </div>
     <div> <asp:Literal ID="litMsg" runat="server"></asp:Literal></div>
    <!-- ✅ شاشة المستخدمين -->
    <asp:Panel ID="pnlUsers" runat="server">

        <div class="row g-4">

            <div class="col-lg-5">
                <div class="card page-card">
                    <div class="card-body">

                        <h3 class="mb-4">
                            <asp:Literal ID="litFormTitle" runat="server" Text="إضافة مستخدم جديد" />
                        </h3>

                       
                        <asp:HiddenField ID="hdnUserId" runat="server" />

                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control mb-2" placeholder="اسم المستخدم" />
                        <asp:TextBox ID="txtFullNameAr" runat="server" CssClass="form-control mb-2" placeholder="الاسم" />
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control mb-2" placeholder="الجوال" />
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control mb-2" placeholder="البريد" />
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control mb-2" placeholder="كلمة المرور" />

                        <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-select mb-3">
                            <asp:ListItem Value="AdminAssistant">مساعد أدمن</asp:ListItem>
                        </asp:DropDownList>

                        <asp:Button ID="btnSave" runat="server" Text="حفظ" CssClass="btn btn-primary" OnClick="btnSave_Click" />
                        <asp:Button ID="btnCancel" runat="server" Text="إلغاء" CssClass="btn btn-secondary" OnClick="btnCancel_Click" />

                    </div>
                </div>
            </div>

            <div class="col-lg-7">
                <asp:GridView ID="gvUsers" runat="server"
                    CssClass="table table-bordered"
                    DataKeyNames="UserId"
                    AutoGenerateColumns="false"
                    OnRowCommand="gvUsers_RowCommand"
                    OnRowDeleting="gvUsers_RowDeleting">

                    <Columns>
                        <asp:BoundField DataField="UserId" HeaderText="رقم" />
                        <asp:BoundField DataField="Username" HeaderText="اسم المستخدم" />

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton runat="server" CommandName="EditUser"
                                    CommandArgument='<%# Eval("UserId") %>' Text="تعديل" />

                                <asp:LinkButton runat="server" CommandName="Delete"
                                    Text="حذف" />
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </div>

        </div>
    </asp:Panel>

    <!-- ✅ الحسابات -->
    <asp:Panel ID="pnlCashAccounts" runat="server" Visible="false">

        <div class="row g-4">

            <div class="col-lg-4">
                <div class="card page-card">
                    <div class="card-body">

                        <h4>إضافة حساب</h4>

                        <asp:HiddenField ID="hdnCashId" runat="server" />

                        <asp:TextBox ID="txtAccountName" runat="server"
                            CssClass="form-control mb-2" placeholder="اسم الحساب" />

                        <asp:TextBox ID="txtBalance" runat="server"
                            CssClass="form-control mb-2" placeholder="الرصيد" />

                        <asp:Button ID="btnSaveCash" runat="server"
                            Text="حفظ" CssClass="btn btn-success"
                            OnClick="btnSaveCash_Click" />

                    </div>
                </div>
            </div>

            <div class="col-lg-8">
                <asp:GridView ID="gvCashAccounts" runat="server"
                    CssClass="table table-bordered"
                    DataKeyNames="CashAccountId"
                    AutoGenerateColumns="false"
                    OnRowCommand="gvCashAccounts_RowCommand"
                    OnRowDeleting="gvCashAccounts_RowDeleting">

                    <Columns>
                        <asp:BoundField DataField="CashAccountId" HeaderText="رقم" />
                        <asp:BoundField DataField="AccountNameAr" HeaderText="اسم الحساب" />
                        <asp:BoundField DataField="Balance" HeaderText="الرصيد" />

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton runat="server"
                                    Text="تعديل"
                                    CommandName="EditCash"
                                    CommandArgument='<%# Eval("CashAccountId") %>' />

                                <asp:LinkButton runat="server"
                                    Text="حذف"
                                    CommandName="Delete" />
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </div>

        </div>

    </asp:Panel>

    
<!-- ✅ المدن -->
<asp:Panel ID="pnlCities" runat="server" Visible="false">

    <div class="row g-4">

        <!-- ✅ نموذج إضافة -->
        <div class="col-lg-4">
            <div class="card page-card">
                <div class="card-body">

                    <h4>إضافة مدينة</h4>

                    <asp:HiddenField ID="hdnCityId" runat="server" />

                    <asp:TextBox ID="txtCityName" runat="server"
                        CssClass="form-control mb-2"
                        placeholder="اسم المدينة" />

                    <div class="form-check mb-2">
                        <asp:CheckBox ID="chkCityActive" runat="server"
                            CssClass="form-check-input" Checked="true" />
                        <label class="form-check-label">نشط</label>
                    </div>

                    <asp:Button ID="btnSaveCity" runat="server"
                        Text="حفظ"
                        CssClass="btn btn-success"
                        OnClick="btnSaveCity_Click" />

                </div>
            </div>
        </div>

        <!-- ✅ جدول المدن -->
        <div class="col-lg-8">
            <asp:GridView ID="gvCities" runat="server"
                CssClass="table table-bordered"
                DataKeyNames="CityId"
                AutoGenerateColumns="false"
                OnRowCommand="gvCities_RowCommand">

                <Columns>

                    <asp:BoundField DataField="CityId" HeaderText="رقم" />
                    <asp:BoundField DataField="CityNameAr" HeaderText="اسم المدينة" />

                    <asp:TemplateField HeaderText="الحالة">
                        <ItemTemplate>
                            <%# Convert.ToBoolean(Eval("IsActive")) ? "✅ نشط" : "❌ غير نشط" %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <ItemTemplate>

                            <asp:LinkButton runat="server"
                                Text="تعديل"
                                CommandName="EditCity"
                                CommandArgument='<%# Eval("CityId") %>' />

                            <asp:LinkButton runat="server"
                                Text="تفعيل/إيقاف"
                                CommandName="ToggleCity"
                                CommandArgument='<%# Eval("CityId") %>' />

                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>
        </div>

    </div>

</asp:Panel>

    <asp:Panel ID="pnlImages" runat="server" Visible="false">

    <div class="row g-4">

        <div class="col-lg-4">
            <div class="card page-card">
                <div class="card-body">

                    <h4>إضافة صورة</h4>

                    <asp:HiddenField ID="hdnImageId" runat="server" />

                    <asp:TextBox ID="txtImageTitle" runat="server"
                        CssClass="form-control mb-2"
                        placeholder="عنوان الصورة" />

                    <asp:TextBox ID="txtImageDescription"
    runat="server"
    CssClass="form-control mb-2"
    TextMode="MultiLine"
    Rows="4"
    MaxLength="250"
    placeholder="وصف الصورة (حتى 250 حرف)" />

                    <small class="text-muted">
    الحد الأقصى 250 حرف
</small>
                    <asp:TextBox ID="txtImageOrder" runat="server"
                        CssClass="form-control mb-2"
                        placeholder="ترتيب الظهور"
                        Text="0" />

                    <div class="form-check mb-2">
                        <asp:CheckBox ID="chkImageActive" runat="server"
                            CssClass="form-check-input"
                            Checked="true" />
                        <label class="form-check-label">إظهار الصورة عند الاستدعاء</label>
                    </div>

                    <asp:FileUpload ID="fuSystemImage" runat="server"
                        CssClass="form-control mb-2" />

                    <small class="text-muted d-block mb-3">
                    
                    </small>

                    <asp:Button ID="btnSaveImage" runat="server"
                        Text="حفظ الصورة"
                        CssClass="btn btn-success"
                        OnClick="btnSaveImage_Click" />

                    <asp:Button ID="btnClearImageForm" runat="server"
                        Text="إلغاء"
                        CssClass="btn btn-secondary"
                        OnClick="btnClearImageForm_Click" />

                </div>
            </div>
        </div>

        <div class="col-lg-8">
            <asp:GridView ID="gvSystemImages" runat="server"
                CssClass="table table-bordered table-striped align-middle"
                DataKeyNames="ImageId"
                AutoGenerateColumns="false"
                OnRowCommand="gvSystemImages_RowCommand"
                OnRowDeleting="gvSystemImages_RowDeleting">

                <Columns>

                    <asp:BoundField DataField="ImageId" HeaderText="رقم" />

                   <asp:TemplateField HeaderText="الصورة">
    <ItemTemplate>
         <img src='<%# ResolveUrl("~/Pages/Auth/ImageViewer.ashx?id=" + Eval("ImageId")) %>'
             style="width:90px;height:55px;object-fit:cover;border-radius:8px;border:1px solid #ddd;" />
    </ItemTemplate>
</asp:TemplateField>

                    <asp:BoundField DataField="ImageTitleAr" HeaderText="العنوان" />
                    <asp:BoundField DataField="ImageDescription" HeaderText="الوصف" />
                    <asp:BoundField DataField="OriginalFileName" HeaderText="اسم الملف" />
                    <asp:BoundField DataField="CompressedSizeKB" HeaderText="الحجم KB" />
                    <asp:BoundField DataField="DisplayOrder" HeaderText="الترتيب" />

                    <asp:TemplateField HeaderText="الحالة">
                        <ItemTemplate>
                            <%# Convert.ToBoolean(Eval("IsActive")) ? "✅ ظاهر" : "❌ مخفي" %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="إجراءات">
                        <ItemTemplate>

                            <asp:LinkButton runat="server"
                                Text="تعديل"
                                CommandName="EditImage"
                                CommandArgument='<%# Eval("ImageId") %>'
                                CssClass="btn btn-sm btn-primary me-1" />

                            <asp:LinkButton runat="server"
                                Text="إظهار/إخفاء"
                                CommandName="ToggleImage"
                                CommandArgument='<%# Eval("ImageId") %>'
                                CssClass="btn btn-sm btn-warning me-1" />

                            <asp:LinkButton runat="server"
                                Text="حذف"
                                CommandName="Delete"
                                CssClass="btn btn-sm btn-danger"
                                OnClientClick="return confirm('هل تريد حذف الصورة؟');" />

                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>
        </div>

    </div>

</asp:Panel>

</asp:Content>
