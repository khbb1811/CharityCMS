<%@ Page Title="الرئيسية" Language="C#" MasterPageFile="~/MasterPages/Admin.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CharityCMS.Pages.Dashboard.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card p-3 mb-3">
    <div class="row g-2">

        <div class="col-md-2">
            <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control" TextMode="Date" />
        </div>

        <div class="col-md-2">
            <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control" TextMode="Date" />
        </div>

        <asp:Panel ID="Panel2" runat="server" Visible="False">
      
        <div class="col-md-2">
            <asp:DropDownList ID="ddlYearFilter" runat="server" CssClass="form-select">
                <asp:ListItem Value="">كل السنوات</asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="col-md-2">
            <asp:DropDownList ID="ddlMonthFilter" runat="server" CssClass="form-select">
                <asp:ListItem Value="">كل الشهور</asp:ListItem>
                <asp:ListItem Value="1">يناير</asp:ListItem>
                <asp:ListItem Value="2">فبراير</asp:ListItem>
                <asp:ListItem Value="3">مارس</asp:ListItem>
                <asp:ListItem Value="4">أبريل</asp:ListItem>
                <asp:ListItem Value="5">مايو</asp:ListItem>
                <asp:ListItem Value="6">يونيو</asp:ListItem>
                <asp:ListItem Value="7">يوليو</asp:ListItem>
                <asp:ListItem Value="8">أغسطس</asp:ListItem>
                <asp:ListItem Value="9">سبتمبر</asp:ListItem>
                <asp:ListItem Value="10">أكتوبر</asp:ListItem>
                <asp:ListItem Value="11">نوفمبر</asp:ListItem>
                <asp:ListItem Value="12">ديسمبر</asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="col-md-2">
            <asp:DropDownList ID="ddlCashAccount" runat="server" CssClass="form-select">
                <asp:ListItem Value="">كل الصناديق</asp:ListItem>
            </asp:DropDownList>
        </div>

              </asp:Panel>

        <div class="col-md-2 d-flex gap-1">
            <asp:Button ID="btnFilter" runat="server" Text="فلتر" CssClass="btn btn-primary w-100" OnClick="btnFilter_Click" />
            <asp:Button ID="btnReset" runat="server" Text="إلغاء" CssClass="btn btn-secondary w-100" OnClick="btnReset_Click" />
        </div>

    </div>
</div>

  <!-- الصف الأول -->
  <div class="row g-3">
    <div class="col-12 col-md-6 col-xl-3">
      <div class="card kpi p-3">
        <div class="text-muted">إجمالي التبرعات المالية</div>
        <div class="fs-3 fw-bold" id="kpiDonations" runat="server">0</div>
      </div>
    </div>

    <div class="col-12 col-md-6 col-xl-3">
         <div class="card kpi p-3">
   <div class="text-muted">إجمالي التوزيعات المالية</div>
   <div class="fs-3 fw-bold" id="kpiDistribution" runat="server">0</div>
 </div>
     
    </div>

    <div class="col-12 col-md-6 col-xl-3">
     <div class="card kpi p-3">
   <div class="text-muted">صافي الحركة </div>
   <div class="fs-3 fw-bold" id="kpiNet" runat="server">0</div>
 </div>
    </div>

    <div class="col-12 col-md-6 col-xl-3">
         <div class="card kpi p-3">
   <div class="text-muted">الرصيد الحالي للحسابات</div>
   <div class="fs-3 fw-bold" id="kpiBalance" runat="server">0</div>
 </div>
    
    </div>
  </div>

  <!-- الصف الثاني -->
  <div class="row g-3 mt-1">
    <div class="col-12 col-md-6 col-xl-6">
      <div class="card kpi p-3">
   <div class="text-muted">إجمالي المستفيدين</div>
   <div class="fs-3 fw-bold" id="kpiBenef" runat="server">0</div>
 </div>
    </div>

    <div class="col-12 col-md-6 col-xl-6">
         <div class="card kpi p-3">
   <div class="text-muted">حالات الطوارئ</div>
   <div class="fs-3 fw-bold" id="kpiEmergency" runat="server">0</div>
 </div>
     
    </div>
  </div>

  <div class="row g-3 mt-1">
    <!-- الشارت -->
    <div class="col-12 col-xl-8">
      <div class="card p-3">
        <div class="d-flex justify-content-between align-items-center mb-2 flex-wrap gap-2">
          <div class="fw-bold">تحليلات التبرعات والتوزيعات</div>

          <div class="d-flex gap-2">
            <asp:DropDownList ID="ddlChartMode" runat="server" CssClass="form-select form-select-sm"
                AutoPostBack="true" OnSelectedIndexChanged="ddlChartMode_SelectedIndexChanged">
                <asp:ListItem Value="monthly" Selected="True">شهري</asp:ListItem>
                <asp:ListItem Value="yearly">سنوي</asp:ListItem>
            </asp:DropDownList>

            <asp:DropDownList ID="ddlChartYear" runat="server" CssClass="form-select form-select-sm"
                AutoPostBack="true" OnSelectedIndexChanged="ddlChartYear_SelectedIndexChanged">
            </asp:DropDownList>
          </div>
        </div>

        <small class="text-muted d-block mb-2" id="chartHint" runat="server">عرض شهري / سنوي للمقارنة</small>

        <div style="height:320px; position:relative;">
          <canvas id="donationChart"></canvas>
        </div>

        <!-- labels -->
        <asp:HiddenField ID="hfChartLabels" runat="server" />
        <!-- values => donations#distribution -->
        <asp:HiddenField ID="hfChartData" runat="server" />
      </div>
    </div>

    <!-- العمود الأيمن -->
    <div class="col-12 col-xl-4">
         <!-- جدول المخزون العيني -->
 <div class="card p-3">
   <div class="fw-bold mb-2">المخزون العيني (اسم الصنف + الكمية)</div>

   <asp:GridView ID="gvInventoryDashboard" runat="server"
       CssClass="table table-bordered table-sm align-middle"
       AutoGenerateColumns="false"
       EmptyDataText="لا توجد بيانات مخزون">
     <Columns>
       <asp:BoundField DataField="ItemNameAr" HeaderText="الصنف" />
       <asp:BoundField DataField="QuantityOnHand" HeaderText="الكمية" DataFormatString="{0:N2}" />
         <asp:BoundField DataField="UnitNameAr" HeaderText="الوحدة" />
     </Columns>
   </asp:GridView>
 </div>
     

      <br />
         <!-- تنبيه المخزون -->
        <asp:Panel ID="panel1" runat ="server" Visible="False">

       
 <div class="card p-3">
   <div class="fw-bold mb-2">المخزون</div>
   <asp:Panel ID="pnlInventoryAlert" runat="server" Visible="false" CssClass="alert alert-warning">
     <strong>تنبيه مخزون:</strong>
     يوجد <asp:Literal ID="litDashboardLowStockCount" runat="server" Text="0"></asp:Literal>
     صنف/أصناف أقل من أو يساوي الحد الأدنى للمخزون.
     <a href="~/Pages/Inventory/Items.aspx" runat="server" class="btn btn-sm btn-warning ms-2">فتح المخزون</a>
   </asp:Panel>
 </div>
          <br />
      <!-- آخر الأنشطة -->
      <div class="card p-3">
        <div class="fw-bold mb-2">آخر الأنشطة</div>
        <asp:Repeater ID="rptActivities" runat="server">
          <ItemTemplate>
            <div class="border-bottom py-2">
              <div class="small fw-semibold"><%# Eval("Description") %></div>
              <div class="text-muted small"><%# Eval("CreatedDate") %></div>
            </div>
          </ItemTemplate>
        </asp:Repeater>
      </div>
 </asp:Panel>
    
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.1/dist/chart.umd.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2"></script>
  <script>
      (function () {
          const labelsRaw = document.getElementById('<%= hfChartLabels.ClientID %>').value || '';
          const dataRaw = document.getElementById('<%= hfChartData.ClientID %>').value || '';

          const labels = labelsRaw ? labelsRaw.split('|') : [];
          const parts = dataRaw ? dataRaw.split('#') : [];

          const donations = parts.length > 0 && parts[0]
              ? parts[0].split('|').map(x => parseFloat(x || '0'))
              : [];

          const distributions = parts.length > 1 && parts[1]
              ? parts[1].split('|').map(x => parseFloat(x || '0'))
              : [];

          const ctx = document.getElementById('donationChart');

          if (window.donationChartInstance) {
              window.donationChartInstance.destroy();
          }


          window.donationChartInstance = new Chart(ctx, {
              type: 'line',
              data: {
                  labels: labels,
                  datasets: [
                      {
                          label: 'التبرعات المالية',
                          data: donations,
                          borderColor: '#1D4ED8',
                          backgroundColor: 'rgba(29,78,216,.12)',
                          tension: 0.35,
                          fill: true,
                          borderWidth: 2,
                          pointRadius: 3
                      },
                      {
                          label: 'التوزيعات المالية',
                          data: distributions,
                          borderColor: '#DC2626',
                          backgroundColor: 'rgba(220,38,38,.10)',
                          tension: 0.35,
                          fill: true,
                          borderWidth: 2,
                          pointRadius: 3
                      }
                  ]
              },

              options: {
                  responsive: true,
                  maintainAspectRatio: false,
                  animation: false,

                  plugins: {
                      legend: {
                          display: true
                      },

                      // ✅ إظهار القيم بجانب النقاط
                      datalabels: {
                          color: '#000',
                          anchor: 'end',
                          align: 'start',

                          formatter: function (value) {
                              return value === 0 ? '' : value.toLocaleString();
                          },

                          font: {
                              weight: 'bold',
                              size: 12
                          }
                      }
                  },

                  scales: {
                      y: {
                          beginAtZero: true
                      }
                  }
              },

              plugins: [ChartDataLabels] // ✅ مهم جدا
          });

      })();
  </script>

</asp:Content>