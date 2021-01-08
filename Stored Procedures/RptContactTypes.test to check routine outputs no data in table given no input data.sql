SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROC [RptContactTypes].[test to check routine outputs no data in table given no input data]
AS
BEGIN
	--Assemble
	
	--Act

	--Assert
	EXEC tSQLt.AssertEmptyTable @TableName = N'dbo.RptContactTypes'; -- nvarchar(max)
END;
GO
