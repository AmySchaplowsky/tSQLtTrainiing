CREATE SCHEMA [fcn_GetFirstOfMonth]
AUTHORIZATION [dbo]
GO
DECLARE @xp int
SELECT @xp=1
EXEC sp_addextendedproperty N'tSQLt.TestClass', @xp, 'SCHEMA', N'fcn_GetFirstOfMonth', NULL, NULL, NULL, NULL
GO
