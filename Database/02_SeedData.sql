/* Seed Data */

-- Roles
INSERT INTO dbo.Roles(RoleName, RoleNameAr) VALUES
(N'AdminGeneral',  N'أدمن عام'),
(N'AdminAssistant',N'مساعد أدمن');

-- Lookups
INSERT INTO dbo.Cities(CityNameAr) VALUES
(N'الدمام'), (N'الخبر'), (N'الظهران');

INSERT INTO dbo.SupportTypes(SupportNameAr) VALUES
(N'دعم غذائي'), (N'دعم مالي'), (N'دعم طبي'), (N'دعم سكني');

INSERT INTO dbo.DonationTypes(DonationTypeAr, IsInKind) VALUES
(N'تبرع مالي', 0),
(N'تبرع عيني', 1),
(N'زكاة', 0),
(N'صدقة', 0);

-- Admin user (password: Admin@123)
INSERT INTO dbo.Users(Username, FullNameAr, PasswordHash, PasswordSalt, HashIterations, IsActive)
VALUES (N'admin', N'مدير النظام', 0xc9b158ee3d3f1cc78fb3712e87c69d4b99db54acd35fe3d3dbfae18dfe71b9b9d4f68553a3d3f6e10706e24e418e5cb51fed38a0dae5b627e79e66f2ad6525f9, 0x31c4f0b0bb773535d7c1d504c9333430f16af23df2eed621dfbe030529aa196a, 10000, 1);

DECLARE @adminId INT = SCOPE_IDENTITY();
DECLARE @roleId INT = (SELECT TOP 1 RoleId FROM dbo.Roles WHERE RoleName = N'AdminGeneral');
INSERT INTO dbo.UserRoles(UserId, RoleId) VALUES (@adminId, @roleId);

-- Sample Activity
INSERT INTO dbo.ActivityLog(ActivityType, Description, CreatedBy)
VALUES (N'Seed', N'تم تهيئة البيانات الأولية للنظام', @adminId);


INSERT INTO dbo.CashAccounts (AccountNameAr, Balance, IsActive, CreatedBy)
VALUES
(N'الخزينة الرئيسية', 50000, 1, 3),
(N'صندوق الزكاة', 30000, 1, 3),
(N'صندوق الصدقات', 20000, 1, 3);

