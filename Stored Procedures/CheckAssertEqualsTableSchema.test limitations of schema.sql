SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

--  Comments here are associated with the test.
--  For test case examples, see: http://tsqlt.org/user-guide/tsqlt-tutorial/

CREATE PROCEDURE [CheckAssertEqualsTableSchema].[test limitations of schema]
AS
BEGIN
	--Assemble
	CREATE TABLE CheckAssertEqualsTableSchema.Expected
	(
		Col0  NVARCHAR(50) NOT NULL
		,Col1 INT		   NOT NULL
		,Col2 TEXT		   NOT NULL
		,Col3 NTEXT		   NOT NULL
		,Col4 IMAGE		   NULL
		,Col5 XML		   NULL
		,Col6 GEOGRAPHY	   NULL
		,Col7 GEOMETRY	   NULL
		,Col8 ROWVERSION   NULL
		,Col9 VARCHAR(50)  NOT NULL
	);

	CREATE TABLE CheckAssertEqualsTableSchema.Actual
	(
		Col0  NVARCHAR(50) NULL
		,Col1 INT		   NULL
		,Col2 TEXT		   NULL
		,Col3 NTEXT		   NULL
		,Col4 IMAGE		   NOT NULL
		,Col5 XML		   NOT NULL
		,Col6 GEOGRAPHY	   NOT NULL
		,Col7 GEOMETRY	   NOT NULL
		,Col8 ROWVERSION   NOT NULL
		,Col9 VARCHAR(50)  NULL
	);

	--Act

	--Assert
	EXEC tSQLt.AssertEqualsTableSchema
		@Expected = N'CheckAssertEqualsTableSchema.Expected' -- nvarchar(max)
		,@Actual = N'CheckAssertEqualsTableSchema.Actual'	 -- nvarchar(max)
		,@Message = N'The table schema does not match.';	 -- nvarchar(max)
END;
GO
