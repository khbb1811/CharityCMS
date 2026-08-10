<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registerkhaled.aspx.cs" Inherits="CharityCMS.Pages.Auth.Registerkhaled" %>

<!DOCTYPE html>
<html dir="rtl" lang="ar">
<head runat="server">
    <meta charset="utf-8" />
    <title>إدارة المستخدمين</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background: #f8f9fa;
        }

        .page-card {
            border: none;
            border-radius: 16px;
            box-shadow: 0 4px 18px rgba(0,0,0,0.08);
        }

        .table thead th {
            background-color: #0d6efd;
            color: #fff;
            vertical-align: middle;
            text-align: center;
        }

        .table td {
            vertical-align: middle;
        }

        .form-label {
            font-weight: 600;
        }

        .actions .btn {
            margin-left: 4px;
        }
    </style>
</head>
<body class="container py-4">

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="row g-4">
            <!-- نموذج الإضافة / التعديل -->
            <div class="col-lg-5">
                <div class="card page-card">
                    <div class="card-body">
                        <h3 class="mb-4">
                            <asp:Literal ID="litFormTitle" runat="server" Text="إضافة مستخدم جديد"></asp:Literal>
                        </h3>

                        <asp:Literal ID="litMsg" runat="server"></asp:Literal>
                        <asp:HiddenField ID="hdnUserId" runat="server" />

                        <div class="mb-3">
                            <label class="form-label">اسم المستخدم</label>
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator
                                ID="rfvUsername"
                                runat="server"
                                ControlToValidate="txtUsername"
                                ErrorMessage="اسم المستخدم مطلوب"
                                CssClass="text-danger small"
                                Display="Dynamic" />
                        </div>

                        <div class="mb-3">
                            <label class="form-label">الاسم</label>
                            <asp:TextBox ID="txtFullNameAr" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator
                                ID="rfvFullNameAr"
                                runat="server"
                                ControlToValidate="txtFullNameAr"
                                ErrorMessage="الاسم مطلوب"
                                CssClass="text-danger small"
                                Display="Dynamic" />
                        </div>

                        <div class="mb-3">
                            <label class="form-label">الجوال</label>
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator
                                ID="rfvPhone"
                                runat="server"
                                ControlToValidate="txtPhone"
                                ErrorMessage="الجوال مطلوب"
                                CssClass="text-danger small"
                                Display="Dynamic" />
                            <asp:RegularExpressionValidator
                                ID="revPhone"
                                runat="server"
                                ControlToValidate="txtPhone"
                                ValidationExpression="^\d{9,15}$"
                                ErrorMessage="رقم الجوال غير صحيح"
                                CssClass="text-danger small"
                                Display="Dynamic" />
                        </div>

                        <div class="mb-3">
                            <label class="form-label">البريد الإلكتروني</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
                            <asp:RequiredFieldValidator
                                ID="rfvEmail"
                                runat="server"
                                ControlToValidate="txtEmail"
                                ErrorMessage="البريد الإلكتروني مطلوب"
                                CssClass="text-danger small"
                                Display="Dynamic" />
                            <asp:RegularExpressionValidator
                                ID="revEmail"
                                runat="server"
                                ControlToValidate="txtEmail"
                                ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                                ErrorMessage="البريد الإلكتروني غير صحيح"
                                CssClass="text-danger small"
                                Display="Dynamic" />
                        </div>

                        <div class="mb-3">
                            <label class="form-label">كلمة المرور</label>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" />
                            <asp:CustomValidator
                                ID="cvPassword"
                                runat="server"
                                OnServerValidate="cvPassword_ServerValidate"
                                ErrorMessage="كلمة المرور مطلوبة في حالة الإضافة ويجب ألا تقل عن 6 أحرف"
                                CssClass="text-danger small"
                                Display="Dynamic" />
                            <div class="form-text">في حالة التعديل اترك كلمة المرور فارغة إذا كنت لا تريد تغييرها.</div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">الدور</label>
                            <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-select">
                                <asp:ListItem Value="AdminGeneral">أدمن عام</asp:ListItem>
                                <asp:ListItem Value="AdminAssistant">مساعد أدمن</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="d-flex gap-2">
                            <asp:Button
                                ID="btnSave"
                                runat="server"
                                Text="حفظ"
                                CssClass="btn btn-primary"
                                OnClick="btnSave_Click" />

                            <asp:Button
                                ID="btnCancel"
                                runat="server"
                                Text="إلغاء التعديل"
                                CssClass="btn btn-secondary"
                                CausesValidation="false"
                                Visible="false"
                                OnClick="btnCancel_Click" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- جدول المستخدمين -->
            <div class="col-lg-7">
                <div class="card page-card">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h3 class="mb-0">قائمة المستخدمين</h3>
                            <asp:Button
                                ID="btnRefresh"
                                runat="server"
                                Text="تحديث"
                                CssClass="btn btn-outline-primary btn-sm"
                                CausesValidation="false"
                                OnClick="btnRefresh_Click" />
                        </div>

                        <div class="table-responsive">
                            <asp:GridView
                                ID="gvUsers"
                                runat="server"
                                CssClass="table table-bordered table-hover align-middle"
                                AutoGenerateColumns="false"
                                DataKeyNames="UserId"
                                EmptyDataText="لا يوجد مستخدمون"
                                OnRowCommand="gvUsers_RowCommand"
                                OnRowDeleting="gvUsers_RowDeleting">
                                <Columns>
                                    <asp:BoundField DataField="UserId" HeaderText="الرقم" />
                                    <asp:BoundField DataField="Username" HeaderText="اسم المستخدم" />
                                    <asp:BoundField DataField="FullNameAr" HeaderText="الاسم" />
                                    <asp:BoundField DataField="Phone" HeaderText="الجوال" />
                                    <asp:BoundField DataField="Email" HeaderText="البريد الإلكتروني" />
                                    <asp:BoundField DataField="RoleName" HeaderText="الدور" />

                                    <asp:TemplateField HeaderText="الإجراءات">
                                        <ItemTemplate>
                                            <div class="actions">
                                                <asp:LinkButton
                                                    ID="btnEdit"
                                                    runat="server"
                                                    CommandName="EditUser"
                                                    CommandArgument='<%# Eval("UserId") %>'
                                                    CssClass="btn btn-sm btn-warning"
                                                    CausesValidation="false">
                                                    تعديل
                                                </asp:LinkButton>

                                                <asp:LinkButton
                                                    ID="btnDelete"
                                                    runat="server"
                                                    CommandName="Delete"
                                                    CommandArgument='<%# Eval("UserId") %>'
                                                    CssClass="btn btn-sm btn-danger"
                                                    CausesValidation="false"
                                                    OnClientClick="return confirm('هل أنت متأكد من حذف هذا المستخدم؟');">
                                                    حذف
                                                </asp:LinkButton>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
