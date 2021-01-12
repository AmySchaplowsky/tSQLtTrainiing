SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [AssertEqualsTableSchema].[test to see if AssertEqualTableSchema works]
AS
BEGIN
	--Assemble
	CREATE TABLE AssertEqualsTableSchema.Expected
	(
		Col1  INT NULL
		,Col2 INT NULL
		,col3 INT NULL
	);

	CREATE TABLE AssertEqualsTableSchema.Actual
	(
		Col1  INT NULL
		,Col2 INT NULL
		,Col3 INT NULL
	);

	INSERT AssertEqualsTableSchema.Expected
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

	INSERT AssertEqualsTableSchema.Actual
	(
		Col1
		,Col2
	)
	VALUES
	(
		1
		,2
	);

	INSERT AssertEqualsTableSchema.Expected
	(
		Col1
		,Col2
	)
	VALUES
	(
		4
		,5
	);

	INSERT AssertEqualsTableSchema.Actual
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

	INSERT AssertEqualsTableSchema.Expected
	(
		Col1
		,Col2
	)
	VALUES
	(
		7
		,8
	);

	INSERT AssertEqualsTableSchema.Actual
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
		@Expected = N'AssertEqualsTableSchema.Expected' -- nvarchar(max)
		,@Actual = N'AssertEqualsTableSchema.Actual'	-- nvarchar(max)
		,@Message = N'The schemas are different.';		-- nvarchar(max)
END;

GO
