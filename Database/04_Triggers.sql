/* Inventory Auto Updates */

CREATE OR ALTER TRIGGER dbo.TR_DonationItems_AddStock
ON dbo.DonationItems
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE inv
    SET inv.QuantityOnHand = inv.QuantityOnHand + i.Quantity,
        inv.UpdatedDate = SYSDATETIME()
    FROM dbo.Inventory inv
    INNER JOIN inserted i ON i.InventoryId = inv.InventoryId;
END
GO

CREATE OR ALTER TRIGGER dbo.TR_DistributionItems_SubStock
ON dbo.DistributionItems
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM dbo.Inventory inv
        INNER JOIN inserted i ON i.InventoryId = inv.InventoryId
        WHERE inv.QuantityOnHand - i.Quantity < 0
    )
    BEGIN
        RAISERROR (N'لا يمكن تنفيذ التوزيع: الكمية غير متوفرة في المخزون.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    UPDATE inv
    SET inv.QuantityOnHand = inv.QuantityOnHand - i.Quantity,
        inv.UpdatedDate = SYSDATETIME()
    FROM dbo.Inventory inv
    INNER JOIN inserted i ON i.InventoryId = inv.InventoryId;
END
GO
