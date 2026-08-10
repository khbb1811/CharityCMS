/* =========================================
   CharityCMS - SQL Server Schema
   ========================================= */

SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE dbo.Users (
    UserId           INT IDENTITY(1,1) PRIMARY KEY,
    Username         NVARCHAR(50)  NOT NULL,
    FullNameAr       NVARCHAR(150) NOT NULL,
    Phone            NVARCHAR(30)  NULL,
    Email            NVARCHAR(120) NULL,
    PasswordHash     VARBINARY(64) NOT NULL,
    PasswordSalt     VARBINARY(32) NOT NULL,
    HashIterations   INT NOT NULL CONSTRAINT DF_Users_HashIt DEFAULT(10000),
    IsActive         BIT NOT NULL CONSTRAINT DF_Users_IsActive DEFAULT(1),
    LastLoginDate    DATETIME2 NULL,
    CreatedDate      DATETIME2 NOT NULL CONSTRAINT DF_Users_Created DEFAULT(SYSDATETIME()),
    UpdatedDate      DATETIME2 NULL,
    CreatedBy        INT NULL
);
GO
CREATE UNIQUE INDEX UX_Users_Username ON dbo.Users(Username);
GO
ALTER TABLE dbo.Users
ADD CONSTRAINT FK_Users_CreatedBy FOREIGN KEY (CreatedBy) REFERENCES dbo.Users(UserId);
GO

CREATE TABLE dbo.Roles (
    RoleId      INT IDENTITY(1,1) PRIMARY KEY,
    RoleName    NVARCHAR(50) NOT NULL,
    RoleNameAr  NVARCHAR(80) NOT NULL,
    CreatedDate DATETIME2 NOT NULL CONSTRAINT DF_Roles_Created DEFAULT(SYSDATETIME()),
    UpdatedDate DATETIME2 NULL,
    CreatedBy   INT NULL
);
GO
CREATE UNIQUE INDEX UX_Roles_RoleName ON dbo.Roles(RoleName);
GO
ALTER TABLE dbo.Roles
ADD CONSTRAINT FK_Roles_CreatedBy FOREIGN KEY (CreatedBy) REFERENCES dbo.Users(UserId);
GO

CREATE TABLE dbo.UserRoles (
    UserId  INT NOT NULL,
    RoleId  INT NOT NULL,
    PRIMARY KEY(UserId, RoleId),
    CONSTRAINT FK_UserRoles_User FOREIGN KEY(UserId) REFERENCES dbo.Users(UserId),
    CONSTRAINT FK_UserRoles_Role FOREIGN KEY(RoleId) REFERENCES dbo.Roles(RoleId)
);
GO

CREATE TABLE dbo.Cities (
    CityId      INT IDENTITY(1,1) PRIMARY KEY,
    CityNameAr  NVARCHAR(100) NOT NULL,
    IsActive    BIT NOT NULL CONSTRAINT DF_Cities_IsActive DEFAULT(1),
    CreatedDate DATETIME2 NOT NULL CONSTRAINT DF_Cities_Created DEFAULT(SYSDATETIME()),
    UpdatedDate DATETIME2 NULL,
    CreatedBy   INT NULL
);
GO
ALTER TABLE dbo.Cities
ADD CONSTRAINT FK_Cities_CreatedBy FOREIGN KEY (CreatedBy) REFERENCES dbo.Users(UserId);
GO

CREATE TABLE dbo.SupportTypes (
    SupportTypeId   INT IDENTITY(1,1) PRIMARY KEY,
    SupportNameAr   NVARCHAR(120) NOT NULL,
    IsActive        BIT NOT NULL CONSTRAINT DF_SupportTypes_IsActive DEFAULT(1),
    CreatedDate     DATETIME2 NOT NULL CONSTRAINT DF_SupportTypes_Created DEFAULT(SYSDATETIME()),
    UpdatedDate     DATETIME2 NULL,
    CreatedBy       INT NULL
);
GO
ALTER TABLE dbo.SupportTypes
ADD CONSTRAINT FK_SupportTypes_CreatedBy FOREIGN KEY (CreatedBy) REFERENCES dbo.Users(UserId);
GO

CREATE TABLE dbo.DonationTypes (
    DonationTypeId  INT IDENTITY(1,1) PRIMARY KEY,
    DonationTypeAr  NVARCHAR(120) NOT NULL,
    IsInKind        BIT NOT NULL CONSTRAINT DF_DonationTypes_IsInKind DEFAULT(0),
    IsActive        BIT NOT NULL CONSTRAINT DF_DonationTypes_IsActive DEFAULT(1),
    CreatedDate     DATETIME2 NOT NULL CONSTRAINT DF_DonationTypes_Created DEFAULT(SYSDATETIME()),
    UpdatedDate     DATETIME2 NULL,
    CreatedBy       INT NULL
);
GO
ALTER TABLE dbo.DonationTypes
ADD CONSTRAINT FK_DonationTypes_CreatedBy FOREIGN KEY (CreatedBy) REFERENCES dbo.Users(UserId);
GO

CREATE TABLE dbo.Beneficiaries (
    BeneficiaryId   INT IDENTITY(1,1) PRIMARY KEY,
    FullNameAr      NVARCHAR(200) NOT NULL,
    NationalId      NVARCHAR(20)  NOT NULL,
    Phone           NVARCHAR(30)  NULL,
    AddressAr       NVARCHAR(300) NULL,
    FamilyMembers   INT NOT NULL CONSTRAINT DF_Benef_Family DEFAULT(0),
    Income          DECIMAL(18,2) NULL,
    SupportStatus   NVARCHAR(50)  NULL,
    CityId          INT NULL,
    SupportTypeId   INT NULL,
    CreatedDate     DATETIME2 NOT NULL CONSTRAINT DF_Benef_Created DEFAULT(SYSDATETIME()),
    UpdatedDate     DATETIME2 NULL,
    CreatedBy       INT NULL,
    CONSTRAINT FK_Benef_City FOREIGN KEY(CityId) REFERENCES dbo.Cities(CityId),
    CONSTRAINT FK_Benef_SupportType FOREIGN KEY(SupportTypeId) REFERENCES dbo.SupportTypes(SupportTypeId),
    CONSTRAINT FK_Benef_CreatedBy FOREIGN KEY(CreatedBy) REFERENCES dbo.Users(UserId)
);
GO
CREATE UNIQUE INDEX UX_Beneficiaries_NationalId ON dbo.Beneficiaries(NationalId);
GO

CREATE TABLE dbo.Donations (
    DonationId       INT IDENTITY(1,1) PRIMARY KEY,
    DonationTypeId   INT NOT NULL,
    DonationDate     DATE NOT NULL CONSTRAINT DF_Donations_Date DEFAULT(CONVERT(date, GETDATE())),
    Amount           DECIMAL(18,2) NULL,
    Notes            NVARCHAR(500) NULL,
    DonorName        NVARCHAR(150) NULL,
    DonorPhone       NVARCHAR(30)  NULL,
    CreatedDate      DATETIME2 NOT NULL CONSTRAINT DF_Donations_Created DEFAULT(SYSDATETIME()),
    UpdatedDate      DATETIME2 NULL,
    CreatedBy        INT NULL,
    CONSTRAINT FK_Donations_Type FOREIGN KEY(DonationTypeId) REFERENCES dbo.DonationTypes(DonationTypeId),
    CONSTRAINT FK_Donations_CreatedBy FOREIGN KEY(CreatedBy) REFERENCES dbo.Users(UserId)
);
GO
CREATE INDEX IX_Donations_Date ON dbo.Donations(DonationDate);
CREATE INDEX IX_Donations_Type ON dbo.Donations(DonationTypeId);
GO

CREATE TABLE dbo.Inventory (
    InventoryId     INT IDENTITY(1,1) PRIMARY KEY,
    ItemNameAr      NVARCHAR(200) NOT NULL,
    UnitNameAr      NVARCHAR(50)  NOT NULL CONSTRAINT DF_Inv_Unit DEFAULT(N'قطعة'),
    QuantityOnHand  DECIMAL(18,2) NOT NULL CONSTRAINT DF_Inv_Qty DEFAULT(0),
    LowStockLevel   DECIMAL(18,2) NOT NULL CONSTRAINT DF_Inv_Low DEFAULT(5),
    IsActive        BIT NOT NULL CONSTRAINT DF_Inv_IsActive DEFAULT(1),
    CreatedDate     DATETIME2 NOT NULL CONSTRAINT DF_Inv_Created DEFAULT(SYSDATETIME()),
    UpdatedDate     DATETIME2 NULL,
    CreatedBy       INT NULL
);
GO
ALTER TABLE dbo.Inventory
ADD CONSTRAINT FK_Inv_CreatedBy FOREIGN KEY (CreatedBy) REFERENCES dbo.Users(UserId);
GO
CREATE INDEX IX_Inventory_LowStock ON dbo.Inventory(QuantityOnHand, LowStockLevel);
GO

CREATE TABLE dbo.DonationItems (
    DonationItemId  INT IDENTITY(1,1) PRIMARY KEY,
    DonationId      INT NOT NULL,
    InventoryId     INT NOT NULL,
    Quantity        DECIMAL(18,2) NOT NULL,
    CreatedDate     DATETIME2 NOT NULL CONSTRAINT DF_DonationItems_Created DEFAULT(SYSDATETIME()),
    CreatedBy       INT NULL,
    CONSTRAINT FK_DonationItems_Donation FOREIGN KEY(DonationId) REFERENCES dbo.Donations(DonationId),
    CONSTRAINT FK_DonationItems_Inv FOREIGN KEY(InventoryId) REFERENCES dbo.Inventory(InventoryId),
    CONSTRAINT FK_DonationItems_CreatedBy FOREIGN KEY(CreatedBy) REFERENCES dbo.Users(UserId),
    CONSTRAINT CK_DonationItems_Qty CHECK (Quantity > 0)
);
GO
CREATE INDEX IX_DonationItems_Donation ON dbo.DonationItems(DonationId);
GO

CREATE TABLE dbo.Distribution (
    DistributionId   INT IDENTITY(1,1) PRIMARY KEY,
    BeneficiaryId    INT NOT NULL,
    DistributionDate DATE NOT NULL CONSTRAINT DF_Distribution_Date DEFAULT(CONVERT(date, GETDATE())),
    DistributionType NVARCHAR(120) NULL,
    Amount           DECIMAL(18,2) NULL,
    Notes            NVARCHAR(500) NULL,
    CreatedDate      DATETIME2 NOT NULL CONSTRAINT DF_Distribution_Created DEFAULT(SYSDATETIME()),
    UpdatedDate      DATETIME2 NULL,
    CreatedBy        INT NULL,
    CONSTRAINT FK_Distribution_Benef FOREIGN KEY(BeneficiaryId) REFERENCES dbo.Beneficiaries(BeneficiaryId),
    CONSTRAINT FK_Distribution_CreatedBy FOREIGN KEY(CreatedBy) REFERENCES dbo.Users(UserId)
);
GO
CREATE INDEX IX_Distribution_Date ON dbo.Distribution(DistributionDate);
CREATE INDEX IX_Distribution_Benef ON dbo.Distribution(BeneficiaryId);
GO

CREATE TABLE dbo.DistributionItems (
    DistributionItemId INT IDENTITY(1,1) PRIMARY KEY,
    DistributionId     INT NOT NULL,
    InventoryId        INT NOT NULL,
    Quantity           DECIMAL(18,2) NOT NULL,
    CreatedDate        DATETIME2 NOT NULL CONSTRAINT DF_DistributionItems_Created DEFAULT(SYSDATETIME()),
    CreatedBy          INT NULL,
    CONSTRAINT FK_DistributionItems_Distribution FOREIGN KEY(DistributionId) REFERENCES dbo.Distribution(DistributionId),
    CONSTRAINT FK_DistributionItems_Inv FOREIGN KEY(InventoryId) REFERENCES dbo.Inventory(InventoryId),
    CONSTRAINT FK_DistributionItems_CreatedBy FOREIGN KEY(CreatedBy) REFERENCES dbo.Users(UserId),
    CONSTRAINT CK_DistributionItems_Qty CHECK (Quantity > 0)
);
GO
CREATE INDEX IX_DistributionItems_Distribution ON dbo.DistributionItems(DistributionId);
GO

CREATE TABLE dbo.EmergencyCases (
    EmergencyCaseId INT IDENTITY(1,1) PRIMARY KEY,
    BeneficiaryId   INT NULL,
    CaseType        NVARCHAR(80) NOT NULL,
    TitleAr         NVARCHAR(200) NOT NULL,
    DetailsAr       NVARCHAR(1000) NULL,
    Status          NVARCHAR(20) NOT NULL CONSTRAINT DF_Emergency_Status DEFAULT(N'Open'),
    RequestedAmount DECIMAL(18,2) NULL,
    ApprovedAmount  DECIMAL(18,2) NULL,
    CreatedDate     DATETIME2 NOT NULL CONSTRAINT DF_Emergency_Created DEFAULT(SYSDATETIME()),
    UpdatedDate     DATETIME2 NULL,
    CreatedBy       INT NULL,
    CONSTRAINT FK_Emergency_Benef FOREIGN KEY(BeneficiaryId) REFERENCES dbo.Beneficiaries(BeneficiaryId),
    CONSTRAINT FK_Emergency_CreatedBy FOREIGN KEY(CreatedBy) REFERENCES dbo.Users(UserId)
);
GO
CREATE INDEX IX_Emergency_Status ON dbo.EmergencyCases(Status, CaseType);
GO

CREATE TABLE dbo.Reports (
    ReportId     INT IDENTITY(1,1) PRIMARY KEY,
    ReportKey    NVARCHAR(80) NOT NULL,
    ReportNameAr NVARCHAR(200) NOT NULL,
    IsActive     BIT NOT NULL CONSTRAINT DF_Reports_IsActive DEFAULT(1),
    CreatedDate  DATETIME2 NOT NULL CONSTRAINT DF_Reports_Created DEFAULT(SYSDATETIME()),
    UpdatedDate  DATETIME2 NULL,
    CreatedBy    INT NULL
);
GO
ALTER TABLE dbo.Reports
ADD CONSTRAINT FK_Reports_CreatedBy FOREIGN KEY (CreatedBy) REFERENCES dbo.Users(UserId);
GO
CREATE UNIQUE INDEX UX_Reports_Key ON dbo.Reports(ReportKey);
GO

CREATE TABLE dbo.ReportRuns (
    ReportRunId  INT IDENTITY(1,1) PRIMARY KEY,
    ReportId     INT NOT NULL,
    RunParams    NVARCHAR(500) NULL,
    OutputType   NVARCHAR(20) NOT NULL,
    CreatedDate  DATETIME2 NOT NULL CONSTRAINT DF_ReportRuns_Created DEFAULT(SYSDATETIME()),
    CreatedBy    INT NULL,
    CONSTRAINT FK_ReportRuns_Report FOREIGN KEY(ReportId) REFERENCES dbo.Reports(ReportId),
    CONSTRAINT FK_ReportRuns_CreatedBy FOREIGN KEY(CreatedBy) REFERENCES dbo.Users(UserId)
);
GO

CREATE TABLE dbo.ActivityLog (
    ActivityId   BIGINT IDENTITY(1,1) PRIMARY KEY,
    ActivityType NVARCHAR(50) NOT NULL,
    EntityName   NVARCHAR(80) NULL,
    EntityId     NVARCHAR(40) NULL,
    Description  NVARCHAR(500) NULL,
    CreatedDate  DATETIME2 NOT NULL CONSTRAINT DF_Activity_Created DEFAULT(SYSDATETIME()),
    CreatedBy    INT NULL
);
GO
ALTER TABLE dbo.ActivityLog
ADD CONSTRAINT FK_Activity_CreatedBy FOREIGN KEY (CreatedBy) REFERENCES dbo.Users(UserId);
GO
CREATE INDEX IX_Activity_CreatedDate ON dbo.ActivityLog(CreatedDate DESC);
GO
