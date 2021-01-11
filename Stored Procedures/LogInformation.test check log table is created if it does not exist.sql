SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [LogInformation].[test check log table is created if it does not exist]
AS
BEGIN
	--Assemble
	EXEC tSQLt.RemoveObject @ObjectName = N'dbo.tbl_log';

	--Act
	EXEC dbo.LogInformation @Msg = 'test message';

	--Assert
	EXEC tSQLt.AssertObjectExists
		@ObjectName = N'dbo.tbl_log'													 -- nvarchar(max)
		,@Message = N'dbo.tbl_log does not exist (should have been created on the fly)'; -- nvarchar(max)
END;
GO
