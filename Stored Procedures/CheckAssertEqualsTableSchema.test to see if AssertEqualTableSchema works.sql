SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [CheckAssertEqualsTableSchema].[test to see if AssertEqualTableSchema works]
AS
BEGIN
	--Assemble
	CREATE TABLE CheckAssertEqualsTableSchema.Expected
	(
		Col1  INT NULL
		,Col2 INT NULL
		,col3 INT NULL
	);

	CREATE TABLE CheckAssertEqualsTableSchema.Actual
	(
		Col1  INT NULL
		,Col2 INT NULL
		,Col3 INT NULL
	);

	INSERT CheckAssertEqualsTableSchema.Expected
	(
		Col1
		,Col2
		,col3
	)
	VALUES
	(
		1
		,2
		,3
	);

	INSERT CheckAssertEqualsTableSchema.Actual
	(
		Col1
		,Col2
	)
	VALUES
	(
		1
		,2
	);

	INSERT CheckAssertEqualsTableSchema.Expected
	(
		Col1
		,Col2
	)
	VALUES
	(
		4
		,5
	);

	INSERT CheckAssertEqualsTableSchema.Actual
	(
		Col1
		,Col2
		,Col3
	)
	VALUES
	(
		4
		,5
		,6
	);

	INSERT CheckAssertEqualsTableSchema.Expected
	(
		Col1
		,Col2
	)
	VALUES
	(
		7
		,8
	);

	INSERT CheckAssertEqualsTableSchema.Actual
	(
		Col1
		,Col2
	)
	VALUES
	(
		7
		,8
	);

	--Act

	--Assert
	EXEC tSQLt.AssertEqualsTableSchema
		@Expected = N'CheckAssertEqualsTableSchema.Expected' -- nvarchar(max)
		,@Actual = N'CheckAssertEqualsTableSchema.Actual'	 -- nvarchar(max)
		,@Message = N'The schemas are different.';			 -- nvarchar(max)
END;
GO
