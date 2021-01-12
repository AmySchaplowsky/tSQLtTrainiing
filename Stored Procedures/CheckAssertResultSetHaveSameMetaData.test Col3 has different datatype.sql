SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [CheckAssertResultSetHaveSameMetaData].[test Col3 has different datatype]
AS
BEGIN
	DECLARE @IsTestDisabled BIT = 1;

	IF (@IsTestDisabled = 1)
	BEGIN
		DECLARE @SchemaName VARCHAR(1000);

		SELECT
			@SchemaName = QUOTENAME(SCHEMA_NAME(schema_id)) + '.'
		FROM sys.procedures
		WHERE object_id = @@procid;

		PRINT 'Disabled Test: ' + @SchemaName + QUOTENAME(OBJECT_NAME(@@procid));

		RETURN 0;
	END;

	BEGIN
		--Assemble
		CREATE TABLE CheckAssertResultSetHaveSameMetaData.Expected
		(
			Col1  INT NULL
			,Col2 INT NULL
			,Col3 INT NULL
		);

		CREATE TABLE CheckAssertResultSetHaveSameMetaData.Actual
		(
			Col1  INT		  NULL
			,Col2 INT		  NULL
			,Col3 VARCHAR(10) NULL
		);

		--Act

		--Assert
		EXEC tSQLt.AssertResultSetsHaveSameMetaData
			@expectedCommand = N'SELECT * FROM CheckAssertResultSetHaveSameMetaData.Expected' -- nvarchar(max)
			,@actualCommand = N'SELECT * FROM CheckAssertResultSetHaveSameMetaData.Actual';	  -- nvarchar(max)
	END;
END;

GO
