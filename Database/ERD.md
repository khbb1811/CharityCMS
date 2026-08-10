# ERD

(انظر تمثيل Mermaid في المستندات/المحادثة — يمكنك وضعه هنا عند الحاجة)


DELETE FROM dbo.UserRoles 
WHERE UserId = 3;

INSERT INTO dbo.UserRoles (UserId, RoleId)
SELECT 3, RoleId
FROM dbo.Roles
WHERE RoleName = 'AdminGeneral2';

