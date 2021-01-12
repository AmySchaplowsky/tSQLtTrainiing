SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

--  Comments here are associated with the test.
--  For test case examples, see: http://tsqlt.org/user-guide/tsqlt-tutorial/

CREATE PROCEDURE [CheckAssertEqualsTableSchema].[test Col3 has differnt datatype]
AS
BEGIN
	DECLARE @IsTestDisabled BIT = 1;

	IF (@IsTestDisabled = 1)
	BEGIN
		DECLARE @SchemaName VARCHAR(1000);

		SELECT
			@SchemaName = QUOTENAME(SCHEMA_NAME(schema_id)) + '.'
		FROM sys.procedures
		WHERE object_id = @@PROCID;

		PRINT 'Disabled Test: ' + @SchemaName + QUOTENAME(OBJECT_NAME(@@PROCID));

		RETURN 0;
	END;

	BEGIN
		--Assemble
		CREATE TABLE CheckAssertEqualsTableSchema.Expected
		(
			Col1  INT NULL
			,Col2 INT NULL
			,Col3 INT NULL
		);

		CREATE TABLE CheckAssertEqualsTableSchema.Actual
		(
			Col1  INT		  NULL
			,Col2 INT		  NULL
			,Col3 VARCHAR(10) NULL
		);

		--Act

		--Assert
		EXEC tSQLt.AssertEqualsTableSchema
			@Expected = N'[CheckAssertEqualsTableSchema].Expected' -- nvarchar(max)
			,@Actual = N'[CheckAssertEqualsTableSchema].Actual';   -- nvarchar(max)
	END;
END;

GO
