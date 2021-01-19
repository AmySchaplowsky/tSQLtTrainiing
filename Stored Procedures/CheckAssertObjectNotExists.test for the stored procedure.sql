SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [CheckAssertObjectNotExists].[test for the stored procedure]
AS
BEGIN
	--Assemble

	--Act

	--Assert
	EXEC tSQLt.AssertObjectDoesNotExist
		@ObjectName = N'dbo.Customer.NotAColumn' -- nvarchar(max)
		,@Message = N'';						 -- nvarchar(max)
END;
GO
