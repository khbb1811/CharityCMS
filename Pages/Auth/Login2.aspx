<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Auth.master" AutoEventWireup="true" CodeBehind="Login2.aspx.cs" Inherits="CharityCMS.Pages.Auth.Login2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
/* ✅ خلفية */
.login-bg {
    min-height: 100vh;
    background-image:  url('/Content/image.jpg');
    background-size: cover;
    background-position: center;
    position: relative;
}

/* ✅ طبقة شفافة */
.overlay {
    position: absolute;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,0.55);
}

/* ✅ layout */
.login-wrapper {
    position: relative;
    z-index: 2;
    height: 100vh;
    display: flex;
}

/* ✅ يمين */
.login-box {
    width: 420px;
    background: #fff;
    padding: 30px;
    margin: auto 40px;
    border-radius: 15px;
}

/* ✅ يسار */
.verse-box {
    flex: 1;
    color: #fff;
    padding: 60px;
    display: flex;
    flex-direction: column;
    justify-content: center;
}

/* ✅ الآية */
.verse {
    font-size: 30px;
    line-height: 2.3;
    font-family: 'Tajawal', serif;
    margin-bottom: 25px;
}

/* ✅ النص */
.text-intro {
    font-size: 16px;
    line-height: 1.9;
    max-width: 600px;
}

.verse-ref {
   
    margin-top: 10px;
    font-size: 13px;
    color: #ccc;
    opacity: 0.85;
}

</style>

<div class="login-bg">
<div class="overlay"></div>

<div class="login-wrapper">

    <!-- ✅ يسار -->
    <div class="login-box">

    <div class="text-center mb-3">
        <div class="rounded-circle mx-auto mb-2"
             style="width:56px;height:56px;background:rgba(29,78,216,.12);
             display:flex;align-items:center;justify-content:center;">
            💙
        </div>

        <h4 class="fw-bold mb-1">نظام جود</h4>
        <div class="text-muted">تسجيل الدخول للوحة التحكم</div>
    </div>

    <asp:Literal ID="litMsg" runat="server" />

    <div class="mb-3">
        <label class="form-label">اسم المستخدم</label>
        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control form-control-lg" />
    </div>

    <div class="mb-3">
        <label class="form-label">كلمة المرور</label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control form-control-lg" />
    </div>

    <div class="d-flex align-items-center justify-content-between mb-3">
        <div class="form-check">
            <asp:CheckBox ID="chkRemember" runat="server" CssClass="form-check-input" />
            <label class="form-check-label">تذكرني</label>
        </div>
    </div>

    <asp:Button ID="btnLogin" runat="server"
        Text="دخول"
        CssClass="btn btn-primary btn-lg w-100"
        OnClick="btnLogin_Click" />

    <div class="text-center mt-3 text-muted small">
        جود - Jood
    </div>

</div>

    <!-- ✅ يمين (Login) -->
    
    <div class="verse-box d-none d-lg-flex">

    <div class="verse">
        ﴿ مَّثَلُ الَّذِينَ يُنْفِقُونَ أَمْوَالَهُمْ فِي سَبِيلِ اللَّهِ كَمَثَلِ حَبَّةٍ
        أَنبَتَتْ سَبْعَ سَنَابِلَ فِي كُلِّ سُنبُلَةٍ مِّائَةُ حَبَّةٍ ۗ
        وَاللَّهُ يُضَاعِفُ لِمَن يَشَاءُ ۗ وَاللَّهُ وَاسِعٌ عَلِيمٌ ﴾
    <small class="verse-ref"> البقرة (261)</small>
        </div>

    <div class="text-intro">
        العمل الخيري طريقٌ عظيمٌ لنيل الأجر والثواب، وهو رسالة إنسانية سامية تعكس
        الرحمة والتكافل بين الناس. فمد يد العون للمحتاجين ودعمهم في أوقات الشدة
        يزرع الأمل في النفوس، ويجعل المجتمع أكثر تماسكًا.
        إن الخير مهما كان بسيطًا فإنه يصنع فرقًا كبيرًا، ويعود بالبركة على المعطي
        قبل الآخذ، والله يضاعف لمن يشاء.
    </div>

</div>

</div>
</div>

</asp:Content>
