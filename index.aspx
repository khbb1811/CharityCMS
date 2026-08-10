<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CharityCMS.index" %>

<!DOCTYPE html>

<html lang="ar" dir="rtl">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>جود - نظام إدارة الجمعية الخيرية</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        brand: {
                            50: '#f0fdf4',
                            100: '#dcfce7',
                            500: '#22c55e',
                            600: '#16a34a',
                            700: '#15803d',
                            800: '#166534',
                            900: '#14532d',
                        },
                        secondary: {
                            600: '#0284c7',
                            700: '#0369a1',
                        }
                    },
                    fontFamily: {
                        cairo: ['Cairo', 'sans-serif'],
                    }
                }
            }
        }
    </script>
    <style>
        body { font-family: 'Cairo', sans-serif; }
        .slide { display: none; opacity: 0; transition: opacity 0.8s ease-in-out; }
        .slide.active { display: block; opacity: 1; }

        .system-gallery-slide {
    display: none;
    opacity: 0;
    transform: translateY(8px);
    transition: opacity 0.45s ease, transform 0.45s ease;
}

.system-gallery-slide.active {
    display: block;
    opacity: 1;
    transform: translateY(0);
}

.system-gallery-dot {
    width: 9px;
    height: 9px;
    border-radius: 999px;
    background: #d1d5db;
    transition: 0.25s ease;
    cursor: pointer;
}

.system-gallery-dot.active {
    width: 26px;
    background: #16a34a;
}


    </style>
</head>
<body class="bg-gray-50 text-gray-800 antialiased selection:bg-brand-500 selection:text-white">
    <form id="form1" runat="server">

        <header class="sticky top-0 z-50 bg-white/95 backdrop-blur-md shadow-sm border-b border-gray-100">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 h-20 flex items-center justify-between">
                <div class="flex items-center gap-3">
                    <div class="w-12 h-12 rounded-xl bg-gradient-to-tr from-brand-600 to-secondary-600 flex items-center justify-center text-white text-2xl shadow-md">
                        <i class="fa-solid font-bold fa-hand-holding-heart"></i>
                    </div>
                    <div>
                        <h1 class="text-xl font-bold text-gray-900 tracking-tight">Jood</h1>
                        <p class="text-xs font-semibold text-brand-600">جمعية جود</p>
                    </div>
                </div>

                <div class="flex items-center gap-4">
                    <a href="Login2.aspx" class="inline-flex items-center gap-2 bg-gradient-to-r from-brand-600 to-brand-700 hover:from-brand-700 hover:to-brand-800 text-white font-bold px-6 py-2.5 rounded-xl shadow-lg shadow-brand-600/30 hover:shadow-xl transition-all transform hover:-translate-y-0.5">
                        <i class="fa-solid fa-right-to-bracket"></i>
                        <span>تسجيل الدخول للنظام</span>
                    </a>
                </div>
            </div>
        </header>

        <section class="relative bg-gradient-to-br from-emerald-950 via-teal-900 to-slate-900 text-white overflow-hidden min-h-[260px] flex items-center">

    <div id="heroCarousel" class="absolute inset-0 w-full h-full">
        <div class="slide active absolute inset-0 w-full h-full bg-cover bg-center" style="background-image: url('/images/1.jpg');">
            <div class="absolute inset-0 bg-gradient-to-r from-emerald-950/90 via-teal-900/70 to-slate-900/50"></div>
        </div>

        <div class="slide absolute inset-0 w-full h-full bg-cover bg-center" style="background-image: url('/images/2.jpg');">
            <div class="absolute inset-0 bg-gradient-to-r from-emerald-950/90 via-teal-900/70 to-slate-900/50"></div>
        </div>

        <div class="slide absolute inset-0 w-full h-full bg-cover bg-center" style="background-image: url('/images/3.jpg');">
            <div class="absolute inset-0 bg-gradient-to-r from-emerald-950/90 via-teal-900/70 to-slate-900/50"></div>
        </div>
    </div>

    <div class="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8 z-10 w-full">
        <div class="max-w-2xl">
            <span class="inline-block bg-brand-500/20 text-brand-300 border border-brand-500/30 text-xs font-semibold px-4 py-1 rounded-full mb-3">
                <i class="fa-solid fa-sparkles ml-1"></i>
                أداء، شفافية، وعطاء مستمر
            </span>

            <h2 class="text-3xl sm:text-4xl font-extrabold leading-tight mb-3">
                عطاء يصل لمستحقيه
            </h2>

            <p class="text-base text-emerald-100/90 mb-5 leading-relaxed max-w-xl">
                منظومة متكاملة لإدارة التبرعات، المساعدات المالية والعينية، ومتابعة القرى والمراكز التابعة بدقة عالية ورؤية واضحة.
            </p>

            <div class="flex flex-wrap gap-3">
                <a href="Login2.aspx" class="bg-brand-600 hover:bg-brand-700 text-white font-bold px-6 py-2.5 rounded-xl shadow-lg shadow-brand-600/30 transition">
                    دخول مستخدمي النظام
                    <i class="fa-solid fa-arrow-left mr-2"></i>
                </a>
                <a href="#AllData" class="bg-brand-600 hover:bg-brand-700 text-white font-bold px-6 py-2.5 rounded-xl shadow-lg shadow-brand-600/30 transition">
                     إنجازات
                </a>
            </div>
        </div>
    </div>

    <button type="button" onclick="prevSlide()" class="absolute right-4 top-1/2 -translate-y-1/2 z-20 bg-emerald-900/50 hover:bg-emerald-800 text-white w-9 h-9 rounded-full flex items-center justify-center backdrop-blur-sm border border-emerald-500/30 transition">
        <i class="fa-solid fa-chevron-right"></i>
    </button>

    <button type="button" onclick="nextSlide()" class="absolute left-4 top-1/2 -translate-y-1/2 z-20 bg-emerald-900/50 hover:bg-emerald-800 text-white w-9 h-9 rounded-full flex items-center justify-center backdrop-blur-sm border border-emerald-500/30 transition">
        <i class="fa-solid fa-chevron-left"></i>
    </button>

</section>

        <section id="AllData" class="py-16 bg-gradient-to-b from-gray-50 to-gray-100 border-y border-gray-200">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center max-w-3xl mx-auto mb-12">
            <h3 class="text-3xl font-extrabold text-gray-900">إحصائيات وإنجازات</h3>
            <p class="text-gray-600 mt-2">أرقام ومؤشرات حية تعبر عن أثر الدعم والتوزيعات المالية والعينية</p>
        </div>

        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-6 gap-5">
            
            <div class="bg-white p-5 rounded-2xl shadow-sm border border-gray-200/80 hover:shadow-md transition">
                <div class="w-11 h-11 rounded-xl bg-emerald-50 text-emerald-600 flex items-center justify-center text-lg mb-3">
                    <i class="fa-solid fa-users"></i>
                </div>
                <p class="text-xs font-bold text-gray-500 uppercase">إجمالي المستفيدين</p>
                <h4 class="text-xl font-black text-gray-900 mt-1">
                    <asp:Label ID="lblBeneficiariesCount" runat="server" Text="0"></asp:Label>
                </h4>
                <p class="text-[11px] text-emerald-600 mt-2 font-semibold">
                    <i class="fa-solid fa-check"></i> مسجلين بالجمعية
                </p>
            </div>

            <div class="bg-white p-5 rounded-2xl shadow-sm border border-gray-200/80 hover:shadow-md transition">
                <div class="w-11 h-11 rounded-xl bg-blue-50 text-blue-600 flex items-center justify-center text-lg mb-3">
                    <i class="fa-solid fa-coins"></i>
                </div>
                <p class="text-xs font-bold text-gray-500 uppercase">إجمالي المصروفات الكلي</p>
                <h4 class="text-xl font-black text-gray-900 mt-1">
                    <asp:Label ID="lblTotalExpenses" runat="server" Text="0.00"></asp:Label> <span class="text-xs font-normal">ج.م</span>
                </h4>
                <p class="text-[11px] text-blue-600 mt-2 font-semibold">
                    <i class="fa-solid fa-vault"></i> منذ بداية النظام
                </p>
            </div>

            <div class="bg-white p-5 rounded-2xl shadow-sm border border-teal-200/80 hover:shadow-md transition bg-gradient-to-b from-teal-50/20 to-white">
                <div class="w-11 h-11 rounded-xl bg-teal-50 text-teal-600 flex items-center justify-center text-lg mb-3">
                    <i class="fa-solid fa-calendar-check"></i>
                </div>
                <p class="text-xs font-bold text-gray-500 uppercase">مصروفات عام <% =DateTime.Now.Year %></p>
                <h4 class="text-xl font-black text-gray-900 mt-1">
                    <asp:Label ID="lblAnnualExpenses" runat="server" Text="0.00"></asp:Label> <span class="text-xs font-normal">ج.م</span>
                </h4>
                <p class="text-[11px] text-teal-600 mt-2 font-semibold">
                    <i class="fa-solid fa-chart-line"></i> العام الحالي
                </p>
            </div>

            <div onclick="openInventoryModal()" class="bg-white p-5 rounded-2xl shadow-sm border border-amber-200/80 hover:shadow-lg hover:border-amber-400 transition cursor-pointer group relative overflow-hidden">
                <div class="w-11 h-11 rounded-xl bg-amber-50 text-amber-600 flex items-center justify-center text-lg mb-3 group-hover:scale-110 transition-transform">
                    <i class="fa-solid fa-boxes-stacked"></i>
                </div>
                <p class="text-xs font-bold text-gray-500 uppercase">المخزون والدعم العيني</p>
                <h4 class="text-xl font-black text-gray-900 mt-1">
                    <asp:Label ID="lblInventoryCount" runat="server" Text="0"></asp:Label> <span class="text-xs font-normal">صنف</span>
                </h4>
                <p class="text-[11px] text-amber-600 mt-2 font-semibold">
                    <i class="fa-solid fa-eye"></i> استعراض الأصناف
                </p>
            </div>

            <div onclick="openSupportTypesModal()" class="bg-white p-5 rounded-2xl shadow-sm border border-purple-200/80 hover:shadow-lg hover:border-purple-400 transition cursor-pointer group relative overflow-hidden">
                <div class="w-11 h-11 rounded-xl bg-purple-50 text-purple-600 flex items-center justify-center text-lg mb-3 group-hover:scale-110 transition-transform">
                    <i class="fa-solid fa-hand-holding-hand"></i>
                </div>
                <p class="text-xs font-bold text-gray-500 uppercase">أنواع الخدمات والدعم</p>
                <h4 class="text-xl font-black text-gray-900 mt-1">
                    <asp:Label ID="lblSupportTypesCount" runat="server" Text="0"></asp:Label> <span class="text-xs font-normal">نوع</span>
                </h4>
                <p class="text-[11px] text-purple-600 mt-2 font-semibold">
                    <i class="fa-solid fa-list-check"></i> استعراض الخدمات
                </p>
            </div>

            <div onclick="openDistributionsModal()" class="bg-white p-5 rounded-2xl shadow-sm border border-indigo-200/80 hover:shadow-lg hover:border-indigo-400 transition cursor-pointer group relative overflow-hidden">
                <div class="w-11 h-11 rounded-xl bg-indigo-50 text-indigo-600 flex items-center justify-center text-lg mb-3 group-hover:scale-110 transition-transform">
                    <i class="fa-solid fa-truck-ramp-box"></i>
                </div>
                <p class="text-xs font-bold text-gray-500 uppercase">إجمالي عمليات التوزيع</p>
                <h4 class="text-xl font-black text-gray-900 mt-1">
                    <asp:Label ID="lblTotalDistributions" runat="server" Text="0"></asp:Label>
                </h4>
                <p class="text-[11px] text-indigo-600 mt-2 font-semibold">
                    <i class="fa-solid fa-cubes"></i> الكميات الموزعة
                </p>
            </div>

        </div>
    </div>
</section>

        <section id="about" class="py-16 bg-white">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
                    <div>
                       <span class="text-brand-600 font-bold text-sm tracking-wide uppercase">
    عن الجمعية 
</span>

<h3 class="text-3xl font-extrabold text-gray-900 mt-2 mb-6 leading-snug">
    نظام جود لإدارة الخدمات الخيرية والتنموية
</h3>

<p class="text-gray-600 leading-relaxed mb-4 text-justify">
    يمثل نظام جود منصة رقمية متكاملة صُممت لدعم أعمال الجمعية الخيرية وتطوير كفاءة العمليات الإدارية والمالية والميدانية. يساهم النظام في إدارة بيانات المستفيدين، وتنظيم ملفات الأسر والحالات الاجتماعية، ومتابعة التبرعات والمساعدات النقدية والعينية، بما يضمن سرعة الإنجاز ودقة البيانات وتحقيق أعلى مستويات الشفافية والحوكمة.
</p>

<p class="text-gray-600 leading-relaxed mb-4 text-justify">
    يوفر النظام بيئة عمل موحدة تساعد على إدارة برامج الدعم المختلفة، وإصدار التقارير والإحصائيات بشكل فوري، ومتابعة عمليات الصرف والتوزيع، وإدارة المخزون العيني، بالإضافة إلى متابعة الكفالات والمبادرات المجتمعية وفق إجراءات منظمة تدعم اتخاذ القرار وتطوير الأداء المؤسسي.
</p>

<p class="text-gray-600 leading-relaxed mb-6 text-justify">
    ويخدم النظام عدداً من القرى والمراكز المستفيدة، من بينها
    <span class="font-bold text-brand-700">
        (عمر مكرم، عمر شاهين، مركز بدر، صلاح الدين)
    </span>
    ، مما يسهم في توحيد البيانات وتسهيل وصول الدعم إلى مستحقيه ومتابعة أثر البرامج الخيرية والتنموية بصورة دقيقة ومستدامة، بما يعزز رسالة الجمعية في خدمة المجتمع وتحقيق أثر إيجابي ملموس.
</p>

                        <div class="grid grid-cols-2 gap-4 border-t border-gray-100 pt-6">
                            <div class="flex items-center gap-3">
                                <div class="w-10 h-10 rounded-lg bg-brand-50 text-brand-600 flex items-center justify-center font-bold">
                                    <i class="fa-solid fa-shield-check"></i>
                                </div>
                                <span class="text-sm font-bold text-gray-800">حماية وشفافية البيانات</span>
                            </div>
                            <div class="flex items-center gap-3">
                                <div class="w-10 h-10 rounded-lg bg-secondary-50 text-secondary-600 flex items-center justify-center font-bold">
                                    <i class="fa-solid fa-truck-ramp-box"></i>
                                </div>
                                <span class="text-sm font-bold text-gray-800">متابعة دقيقة للمخزون</span>
                            </div>
                        </div>
                    </div>

                    <div class="relative">
    <div class="absolute -inset-4 bg-gradient-to-r from-brand-500 to-secondary-500 rounded-3xl opacity-20 blur-xl"></div>

    <div class="relative bg-white rounded-3xl shadow-xl border border-gray-100 overflow-hidden">

        <div id="systemImagesGallery" class="relative">

            <asp:Repeater ID="rptHomeSystemImages" runat="server">
                <ItemTemplate>
                    <div class='system-gallery-slide <%# Container.ItemIndex == 0 ? "active" : "" %>'>

                        <div class="relative h-[360px] bg-gray-100 overflow-hidden">

                            <img src='<%# ResolveUrl("~/Pages/Auth/ImageViewer.ashx?id=" + Eval("ImageId")) %>'
                                 alt='<%# Eval("ImageTitleAr") %>'
                                 class="w-full h-full object-content bg-gray-100" />

                            <button type="button"
                                onclick="prevSystemImage()"
                                class="absolute right-4 top-1/2 -translate-y-1/2 z-30 w-12 h-12 rounded-full bg-white/90 hover:bg-white text-slate-800 shadow-lg flex items-center justify-center transition">
                                <i class="fa-solid fa-chevron-right"></i>
                            </button>

                            <button type="button"
                                onclick="nextSystemImage()"
                                class="absolute left-4 top-1/2 -translate-y-1/2 z-30 w-12 h-12 rounded-full bg-white/90 hover:bg-white text-slate-800 shadow-lg flex items-center justify-center transition">
                                <i class="fa-solid fa-chevron-left"></i>
                            </button>

                            <div class="absolute inset-0 bg-gradient-to-t from-slate-950/65 via-transparent to-transparent pointer-events-none"></div>

                            <div class="absolute bottom-5 right-5 left-5 pointer-events-none">
                                <h3 class="text-white text-2xl font-extrabold leading-snug drop-shadow">
                                    <%# Eval("ImageTitleAr") %>
                                </h3>
                            </div>

                        </div>

                        <div class="p-6">
                           
                            <p class="text-gray-600 leading-relaxed text-justify min-h-[80px]">
                                <%# Eval("ImageDescription") %>
                            </p>

                            <div class="flex items-center justify-between pt-4 mt-4 border-t border-gray-100">
                                <span class="text-sm text-gray-500">
                                    <i class="fa-regular fa-calendar ml-1"></i>
                                    <%# Eval("CreatedDateText") %>
                                </span>

                            </div>
                        </div>

                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <asp:Panel ID="pnlNoHomeSystemImages" runat="server" Visible="false"
                CssClass="p-8 text-center text-gray-500">
                <div class="w-16 h-16 mx-auto rounded-2xl bg-gray-100 flex items-center justify-center text-gray-400 text-2xl mb-4">
                    <i class="fa-regular fa-images"></i>
                </div>
                لا توجد صور مفعلة للعرض حاليًا.
            </asp:Panel>

        </div>



    </div>
</div>
                </div>
            </div>
        </section>

        <section id="PublicImpact" class="py-16 bg-white border-b border-gray-200">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">

        <div class="text-center max-w-3xl mx-auto mb-12">
            <h3 class="text-3xl font-extrabold text-gray-900">مؤشرات الأثر الخيري</h3>
            <p class="text-gray-600 mt-2">
                أرقام مختصرة وبيانات واضحة تعبر عن أثر الدعم المالي والعيني والخدمات المقدمة للمستفيدين
            </p>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">

            <!-- كرت المصروفات الشهرية -->
            <div class="bg-gradient-to-b from-blue-50/60 to-white rounded-3xl shadow-sm border border-blue-100 p-6 hover:shadow-md transition min-h-[420px]">
                <div class="flex items-start justify-between mb-6">
                    <div>
                        <h4 class="text-xl font-black text-gray-900">المصروفات الشهرية</h4>
                        <p class="text-sm text-gray-500 mt-1">إجمالي الدعم المالي خلال عام <%= DateTime.Now.Year %></p>
                    </div>
                    <div class="w-14 h-14 rounded-2xl bg-blue-100 text-blue-600 flex items-center justify-center text-xl">
                        <i class="fa-solid fa-chart-line"></i>
                    </div>
                </div>

                <div class="mb-6">
                    <p class="text-xs font-bold text-gray-500">إجمالي العام الحالي</p>
                    <h5 class="text-3xl font-black text-blue-700 mt-1">
                        <asp:Label ID="lblChartAnnualTotal" runat="server" Text="0.00"></asp:Label>
                        <span class="text-sm font-normal text-gray-500">ج.م</span>
                    </h5>
                </div>

                <div class="space-y-3">
                    <asp:Repeater ID="rptMonthlyExpensesImpact" runat="server">
                        <ItemTemplate>
                            <div>
                                <div class="flex items-center justify-between text-xs mb-1">
                                    <span class="font-bold text-gray-700"><%# Eval("MonthName") %></span>
                                    <span class="font-bold text-blue-700"><%# Eval("AmountText") %> ج.م</span>
                                </div>
                                <div class="w-full h-2.5 bg-blue-100 rounded-full overflow-hidden">
                                    <div class="h-full bg-blue-600 rounded-full" style='width:<%# Eval("Percent") %>%;'></div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                    <asp:Panel ID="pnlNoMonthlyExpensesImpact" runat="server" Visible="false">
                        <div class="text-center py-10 text-gray-400">
                            <i class="fa-solid fa-circle-info text-3xl mb-3"></i>
                            <p class="font-bold">لا توجد مصروفات مسجلة لهذا العام</p>
                        </div>
                    </asp:Panel>
                </div>
            </div>

            <!-- كرت المستفيدين حسب نوع الدعم -->
            <div class="bg-gradient-to-b from-purple-50/60 to-white rounded-3xl shadow-sm border border-purple-100 p-6 hover:shadow-md transition min-h-[420px]">
                <div class="flex items-start justify-between mb-6">
                    <div>
                        <h4 class="text-xl font-black text-gray-900">المستفيدون حسب نوع الدعم</h4>
                        <p class="text-sm text-gray-500 mt-1">تصنيف المستفيدين حسب الخدمات المسجلة</p>
                    </div>
                    <div class="w-14 h-14 rounded-2xl bg-purple-100 text-purple-600 flex items-center justify-center text-xl">
                        <i class="fa-solid fa-hand-holding-heart"></i>
                    </div>
                </div>

                <div class="mb-6">
                    <p class="text-xs font-bold text-gray-500">إجمالي المستفيدين المصنفين</p>
                    <h5 class="text-3xl font-black text-purple-700 mt-1">
                        <asp:Label ID="lblChartSupportTotal" runat="server" Text="0"></asp:Label>
                        <span class="text-sm font-normal text-gray-500">مستفيد</span>
                    </h5>
                </div>

                <div class="space-y-3">
                    <asp:Repeater ID="rptSupportTypesImpact" runat="server">
                        <ItemTemplate>
                            <div>
                                <div class="flex items-center justify-between text-xs mb-1">
                                    <span class="font-bold text-gray-700"><%# Eval("SupportName") %></span>
                                    <span class="font-bold text-purple-700"><%# Eval("BeneficiariesCount") %></span>
                                </div>
                                <div class="w-full h-2.5 bg-purple-100 rounded-full overflow-hidden">
                                    <div class="h-full bg-purple-600 rounded-full" style='width:<%# Eval("Percent") %>%;'></div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                    <asp:Panel ID="pnlNoSupportTypesImpact" runat="server" Visible="false">
                        <div class="text-center py-10 text-gray-400">
                            <i class="fa-solid fa-circle-info text-3xl mb-3"></i>
                            <p class="font-bold">لا توجد بيانات مصنفة للمستفيدين</p>
                        </div>
                    </asp:Panel>
                </div>
            </div>

            <!-- كرت أكثر الأصناف توزيعاً -->
            <div class="bg-gradient-to-b from-amber-50/60 to-white rounded-3xl shadow-sm border border-amber-100 p-6 hover:shadow-md transition min-h-[420px]">
                <div class="flex items-start justify-between mb-6">
                    <div>
                        <h4 class="text-xl font-black text-gray-900">أكثر الأصناف توزيعاً</h4>
                        <p class="text-sm text-gray-500 mt-1">أعلى الأصناف العينية وصولاً للمستفيدين</p>
                    </div>
                    <div class="w-14 h-14 rounded-2xl bg-amber-100 text-amber-600 flex items-center justify-center text-xl">
                        <i class="fa-solid fa-box-open"></i>
                    </div>
                </div>

                <div class="mb-6">
                    <p class="text-xs font-bold text-gray-500">إجمالي الكميات الموزعة</p>
                    <h5 class="text-3xl font-black text-amber-700 mt-1">
                        <asp:Label ID="lblChartInventoryTotal" runat="server" Text="0"></asp:Label>
                        <span class="text-sm font-normal text-gray-500">كمية</span>
                    </h5>
                </div>

                <div class="space-y-3">
                    <asp:Repeater ID="rptTopInventoryImpact" runat="server">
                        <ItemTemplate>
                            <div>
                                <div class="flex items-center justify-between text-xs mb-1">
                                    <span class="font-bold text-gray-700"><%# Eval("ItemName") %></span>
                                    <span class="font-bold text-amber-700"><%# Eval("QuantityText") %> <%# Eval("UnitName") %></span>
                                </div>
                                <div class="w-full h-2.5 bg-amber-100 rounded-full overflow-hidden">
                                    <div class="h-full bg-amber-500 rounded-full" style='width:<%# Eval("Percent") %>%;'></div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                    <asp:Panel ID="pnlNoTopInventoryImpact" runat="server" Visible="false">
                        <div class="text-center py-10 text-gray-400">
                            <i class="fa-solid fa-circle-info text-3xl mb-3"></i>
                            <p class="font-bold">لا توجد توزيعات عينية مسجلة</p>
                        </div>
                    </asp:Panel>
                </div>
            </div>

        </div>
    </div>
</section>



        <div id="inventoryModal" class="fixed inset-0 z-50 hidden overflow-y-auto bg-slate-900/60 backdrop-blur-sm flex items-center justify-center p-4">
            <div class="relative bg-white rounded-3xl max-w-lg w-full p-6 shadow-2xl border border-gray-100 transform transition-all">
                <div class="flex items-center justify-between pb-4 border-b border-gray-100">
                    <div class="flex items-center gap-3">
                        <div class="w-10 h-10 rounded-xl bg-amber-50 text-amber-600 flex items-center justify-center text-lg">
                            <i class="fa-solid fa-boxes-stacked"></i>
                        </div>
                        <div>
                            <h3 class="text-lg font-bold text-gray-900">أصناف الدعم والمخزون العيني</h3>
                            <p class="text-xs text-gray-500">الأصناف المعتمدة للتوزيع داخل النظام</p>
                        </div>
                    </div>
                    <button type="button" onclick="closeInventoryModal()" class="text-gray-400 hover:text-gray-600 w-8 h-8 rounded-full flex items-center justify-center hover:bg-gray-100 transition">
                        <i class="fa-solid fa-xmark text-lg"></i>
                    </button>
                </div>

                <div class="py-4 max-h-80 overflow-y-auto space-y-2.5">
                    <asp:Repeater ID="rptInventoryItems" runat="server">
                        <ItemTemplate>
                            <div class="flex items-center justify-between p-3.5 bg-gray-50 hover:bg-amber-50/50 rounded-xl border border-gray-100 transition">
                                <div class="flex items-center gap-3">
                                    <div class="w-8 h-8 rounded-lg bg-amber-100/60 text-amber-700 flex items-center justify-center text-sm">
                                        <i class="fa-solid fa-box-open"></i>
                                    </div>
                                    <span class="text-sm font-bold text-gray-800"><%# Eval("ItemName") %></span>
                                </div>
                                <span class="text-xs font-semibold text-gray-500 bg-white px-3 py-1 rounded-md border border-gray-200">
                                    وحدة القياس: <%# Eval("Unit") %>
                                </span>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    
                    <asp:Panel ID="pnlNoInventory" runat="server" Visible="false" class="text-center py-6 text-gray-500 text-sm">
                        لا توجد أصناف مخزن مسجلة حالياً.
                    </asp:Panel>
                </div>

                <div class="pt-4 border-t border-gray-100 flex justify-end">
                    <button type="button" onclick="closeInventoryModal()" class="bg-gray-100 hover:bg-gray-200 text-gray-700 font-bold px-5 py-2 rounded-xl text-sm transition">
                        إغلاق
                    </button>
                </div>
            </div>
        </div>

        <div id="supportTypesModal" class="fixed inset-0 z-50 hidden overflow-y-auto bg-slate-900/60 backdrop-blur-sm flex items-center justify-center p-4">
            <div class="relative bg-white rounded-3xl max-w-lg w-full p-6 shadow-2xl border border-gray-100 transform transition-all">
                <div class="flex items-center justify-between pb-4 border-b border-gray-100">
                    <div class="flex items-center gap-3">
                        <div class="w-10 h-10 rounded-xl bg-purple-50 text-purple-600 flex items-center justify-center text-lg">
                            <i class="fa-solid fa-hand-holding-hand"></i>
                        </div>
                        <div>
                            <h3 class="text-lg font-bold text-gray-900">أنواع الخدمات والدعم المتاحة</h3>
                            <p class="text-xs text-gray-500">قائمة خدمات الرعاية الاجتماعية المعتمدة</p>
                        </div>
                    </div>
                    <button type="button" onclick="closeSupportTypesModal()" class="text-gray-400 hover:text-gray-600 w-8 h-8 rounded-full flex items-center justify-center hover:bg-gray-100 transition">
                        <i class="fa-solid fa-xmark text-lg"></i>
                    </button>
                </div>

                <div class="py-4 max-h-80 overflow-y-auto space-y-2.5">
                    <asp:Repeater ID="rptSupportTypes" runat="server">
                        <ItemTemplate>
                            <div class="flex items-center justify-between p-3.5 bg-gray-50 hover:bg-purple-50/50 rounded-xl border border-gray-100 transition">
                                <div class="flex items-center gap-3">
                                    <div class="w-8 h-8 rounded-lg bg-purple-100/60 text-purple-700 flex items-center justify-center text-sm">
                                        <i class="fa-solid fa-hand-holding-heart"></i>
                                    </div>
                                    <span class="text-sm font-bold text-gray-800"><%# Eval("TypeName") %></span>
                                </div>
                                <span class="text-xs font-semibold text-purple-700 bg-purple-50 px-3 py-1 rounded-md border border-purple-200">
                                    <%# Eval("Category") %>
                                </span>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    
                    <asp:Panel ID="pnlNoSupportTypes" runat="server" Visible="false" class="text-center py-6 text-gray-500 text-sm">
                        لا توجد أنواع خدمات مسجلة حالياً.
                    </asp:Panel>
                </div>

                <div class="pt-4 border-t border-gray-100 flex justify-end">
                    <button type="button" onclick="closeSupportTypesModal()" class="bg-gray-100 hover:bg-gray-200 text-gray-700 font-bold px-5 py-2 rounded-xl text-sm transition">
                        إغلاق
                    </button>
                </div>
            </div>
        </div>

        <div id="distributionsModal" class="fixed inset-0 z-50 hidden overflow-y-auto bg-slate-900/60 backdrop-blur-sm flex items-center justify-center p-4">
            <div class="relative bg-white rounded-3xl max-w-lg w-full p-6 shadow-2xl border border-gray-100 transform transition-all">
                <div class="flex items-center justify-between pb-4 border-b border-gray-100">
                    <div class="flex items-center gap-3">
                        <div class="w-10 h-10 rounded-xl bg-indigo-50 text-indigo-600 flex items-center justify-center text-lg">
                            <i class="fa-solid fa-truck-ramp-box"></i>
                        </div>
                        <div>
                            <h3 class="text-lg font-bold text-gray-900">إجمالي الكميات الموزعة</h3>
                            <p class="text-xs text-gray-500">تفاصيل كميات المساعدات العينية المسلمة للمستفيدين</p>
                        </div>
                    </div>
                    <button type="button" onclick="closeDistributionsModal()" class="text-gray-400 hover:text-gray-600 w-8 h-8 rounded-full flex items-center justify-center hover:bg-gray-100 transition">
                        <i class="fa-solid fa-xmark text-lg"></i>
                    </button>
                </div>

                <div class="py-4 max-h-80 overflow-y-auto space-y-2.5">
                    <asp:Repeater ID="rptDistributedQuantities" runat="server">
                        <ItemTemplate>
                            <div class="flex items-center justify-between p-3.5 bg-gray-50 hover:bg-indigo-50/50 rounded-xl border border-gray-100 transition">
                                <div class="flex items-center gap-3">
                                    <div class="w-8 h-8 rounded-lg bg-indigo-100/60 text-indigo-700 flex items-center justify-center text-sm">
                                        <i class="fa-solid fa-hand-holding-hand"></i>
                                    </div>
                                    <span class="text-sm font-bold text-gray-800"><%# Eval("ItemName") %></span>
                                </div>
                                <div class="text-left">
                                    <span class="text-base font-black text-indigo-700"><%# Eval("TotalDistributed") %></span>
                                    <span class="text-xs font-semibold text-gray-500"><%# Eval("Unit") %></span>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    
                    <asp:Panel ID="pnlNoDistributions" runat="server" Visible="false" class="text-center py-6 text-gray-500 text-sm">
                        لم يتم تسجيل توزيعات عينية بعد.
                    </asp:Panel>
                </div>

                <div class="pt-4 border-t border-gray-100 flex justify-end">
                    <button type="button" onclick="closeDistributionsModal()" class="bg-gray-100 hover:bg-gray-200 text-gray-700 font-bold px-5 py-2 rounded-xl text-sm transition">
                        إغلاق
                    </button>
                </div>
            </div>
        </div>

        <footer class="bg-slate-900 text-gray-400 py-12 border-t border-slate-800">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div class="flex flex-col md:flex-row items-center justify-between gap-6">
                    <div class="flex items-center gap-3">
                        <div class="w-10 h-10 rounded-lg bg-brand-600 flex items-center justify-center text-white text-xl">
                            <i class="fa-solid fa-hand-holding-heart"></i>
                        </div>
                        <div>
                            <span class="text-lg font-bold text-white">جود</span>
                            <p class="text-xs text-gray-400">جميع الحقوق محفوظة &copy; <% =DateTime.Now.Year %></p>
                        </div>
                    </div>
                    
                    <div class="flex gap-6 text-sm">
                        <a href="Login2.aspx" class="hover:text-white transition">تسجيل الدخول</a>
                        <a href="#about" class="hover:text-white transition">عن الجمعية</a>
                    </div>
                </div>
            </div>
        </footer>

    </form>

    <script>
        // Hero Image Slider (Every 5 Seconds)
        let currentSlide = 0;
        const slides = document.querySelectorAll('.slide');
        const totalSlides = slides.length;

        function showSlide(index) {
            slides.forEach((slide, i) => {
                slide.classList.remove('active');
                if (i === index) {
                    slide.classList.add('active');
                }
            });
        }

        function nextSlide() {
            currentSlide = (currentSlide + 1) % totalSlides;
            showSlide(currentSlide);
        }

        function prevSlide() {
            currentSlide = (currentSlide - 1 + totalSlides) % totalSlides;
            showSlide(currentSlide);
        }

        setInterval(nextSlide, 5000);

        // Inventory Modal
        function openInventoryModal() {
            document.getElementById('inventoryModal').classList.remove('hidden');
        }
        function closeInventoryModal() {
            document.getElementById('inventoryModal').classList.add('hidden');
        }

        // Support Types Modal (الجديد)
        function openSupportTypesModal() {
            document.getElementById('supportTypesModal').classList.remove('hidden');
        }
        function closeSupportTypesModal() {
            document.getElementById('supportTypesModal').classList.add('hidden');
        }

        // Distributions Modal
        function openDistributionsModal() {
            document.getElementById('distributionsModal').classList.remove('hidden');
        }
        function closeDistributionsModal() {
            document.getElementById('distributionsModal').classList.add('hidden');
        }

        let currentSystemImage = 0;
        let systemImageTimer = null;

        function getSystemGallerySlides() {
            return document.querySelectorAll('.system-gallery-slide');
        }

        function buildSystemGalleryDots() {
            const slides = getSystemGallerySlides();
            const dotsContainer = document.getElementById('systemGalleryDots');

            if (!dotsContainer || slides.length === 0) return;

            dotsContainer.innerHTML = '';

            slides.forEach((slide, index) => {
                const dot = document.createElement('button');
                dot.type = 'button';
                dot.className = 'system-gallery-dot' + (index === 0 ? ' active' : '');
                dot.setAttribute('aria-label', 'الصورة ' + (index + 1));
                dot.onclick = function () {
                    showSystemImage(index);
                    restartSystemImageTimer();
                };

                dotsContainer.appendChild(dot);
            });
        }

        function showSystemImage(index) {
            const slides = getSystemGallerySlides();
            const dots = document.querySelectorAll('.system-gallery-dot');

            if (slides.length === 0) return;

            if (index >= slides.length) {
                currentSystemImage = 0;
            } else if (index < 0) {
                currentSystemImage = slides.length - 1;
            } else {
                currentSystemImage = index;
            }

            slides.forEach((slide, i) => {
                slide.classList.toggle('active', i === currentSystemImage);
            });

            dots.forEach((dot, i) => {
                dot.classList.toggle('active', i === currentSystemImage);
            });
        }

        function nextSystemImage() {
            showSystemImage(currentSystemImage + 1);
        }

        function prevSystemImage() {
            showSystemImage(currentSystemImage - 1);
        }

        function startSystemImageTimer() {
            const slides = getSystemGallerySlides();

            if (slides.length <= 1) return;

            systemImageTimer = setInterval(function () {
                nextSystemImage();
            }, 5000);
        }

        function restartSystemImageTimer() {
            if (systemImageTimer) {
                clearInterval(systemImageTimer);
            }

            startSystemImageTimer();
        }

        document.addEventListener('DOMContentLoaded', function () {
            buildSystemGalleryDots();
            startSystemImageTimer();
        });
        

    </script>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                renderPublicCharts();
            });

            function getHiddenValue(id) {
                var el = document.getElementById(id);
                if (!el) {
                    return "";
                }

                return el.value || "";
            }

            function splitLabels(value) {
                if (!value) {
                    return [];
                }

                return value.split("|");
            }

            function splitNumbers(value) {
                if (!value) {
                    return [];
                }

                var parts = value.split("|");
                var numbers = [];

                for (var i = 0; i < parts.length; i++) {
                    var n = parseFloat(parts[i]);
                    numbers.push(isNaN(n) ? 0 : n);
                }

                return numbers;
            }

            function renderPublicCharts() {
               
                renderMonthlyExpenseChart(monthlyLabels, monthlyData);
                renderSupportTypesChart(supportLabels, supportData);
                renderTopInventoryChart(inventoryLabels, inventoryData);
            }

            function renderMonthlyExpenseChart(labels, data) {
                var canvas = document.getElementById("monthlyExpenseChart");
                if (!canvas) {
                    return;
                }

                new Chart(canvas, {
                    type: "line",
                    data: {
                        labels: labels,
                        datasets: [{
                            label: "المصروفات",
                            data: data,
                            borderColor: "#2563eb",
                            backgroundColor: "rgba(37, 99, 235, 0.12)",
                            fill: true,
                            tension: 0.35,
                            pointRadius: 4,
                            pointHoverRadius: 6
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        plugins: {
                            legend: {
                                labels: {
                                    font: {
                                        family: "Tajawal"
                                    }
                                }
                            },
                            tooltip: {
                                callbacks: {
                                    label: function (context) {
                                        return " " + Number(context.raw).toLocaleString("ar-EG") + " ج.م";
                                    }
                                }
                            }
                        },
                        scales: {
                            y: {
                                beginAtZero: true,
                                ticks: {
                                    callback: function (value) {
                                        return Number(value).toLocaleString("ar-EG");
                                    }
                                }
                            }
                        }
                    }
                });
            }

            function renderSupportTypesChart(labels, data) {
                var canvas = document.getElementById("supportTypesChart");
                if (!canvas) {
                    return;
                }

                new Chart(canvas, {
                    type: "doughnut",
                    data: {
                        labels: labels,
                        datasets: [{
                            data: data,
                            background[{
: data,
                                Color: "#8b5cf6",
                                "#06b6d4",
                                "#10b981",
                                "#f59e0b",
                                "#ef4444",
                                "#6366f1",
                                "#14b8a6",
                                "#ec4899"
                    ],
                            borderWidth: 2,
                            borderColor: "#ffffff"
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        cutout: "62%",
                        plugins: {
                            legend: {
                                position: "bottom",
                                labels: {
                                    usePointStyle: true,
                                    font: {
                                        family: "Tajawal",
                                        size: 11
                                    }
                                }
                            },
                            tooltip: {
                                callbacks: {
                                    label: function (context) {
                                        return " " + context.label + ": " + Number(context.raw).toLocaleString("ar-EG") + " مستفيد";
                                    }
                                }
                            }
                        }
                    }
                });
            }

            function renderTopInventoryChart(labels, data) {
                var canvas = document.getElementById("topInventoryChart");
                if (!canvas) {
                    return;
                }

                new Chart(canvas, {
                    type: "bar",
                    data: {
                        labels: labels,
                        datasets: [{
                            label: "الكمية الموزعة",
                            data: data,
                            backgroundColor: "rgba(245, 158, 11, 0.75)",
                            borderColor: "#d97706",
                            borderWidth: 1,
                            borderRadius: 8
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        indexAxis: "y",
                        plugins: {
                            legend: {
                                display: false
                            },
                            tooltip: {
                                callbacks: {
                                    label: function (context) {
                                        return " الكمية: " + Number(context.raw).toLocaleString("ar-EG");
                                    }
                                }
                            }
                        },
                        scales: {
                            x: {
                                beginAtZero: true,
                                ticks: {
                                    callback: function (value) {
                                        return Number(value).toLocaleString("ar-EG");
                                    }
                                }
                            }
                        }
                    }
                });
            }
        </script>

</body>
</html>
