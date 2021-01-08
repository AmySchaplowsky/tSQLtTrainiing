SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [CheckAssertEqualsTable].[test OneLessDataInActualColThanExpected]
AS
BEGIN
	--Checking behaviour for unpopulated columns

	--Assemble
	CREATE TABLE [CheckAssertEqualsTable].Expected
	(
		Col1  INT NULL
		,Col2 INT NULL
		,col3 INT NULL
	);

	CREATE TABLE [CheckAssertEqualsTable].Actual
	(
		Col1  INT NULL
		,Col2 INT NULL
		,Col3 INT NULL
	);

	INSERT [CheckAssertEqualsTable].Expected
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

	INSERT [CheckAssertEqualsTable].Actual
	(
		Col1
		,Col2
	)
	VALUES
	(
		1
		,2
	);

	INSERT [CheckAssertEqualsTable].Expected
	(
		Col1
		,Col2
	)
	VALUES
	(
		4
		,5
	);

	INSERT [CheckAssertEqualsTable].Actual
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

	INSERT [CheckAssertEqualsTable].Expected
	(
		Col1
		,Col2
	)
	VALUES
	(
		7
		,8
	);

	INSERT [CheckAssertEqualsTable].Actual
	(
		Col1
		,Col2
	)
	VALUES
	(
		7
		,8
	);

	--Assert
	EXEC tSQLt.AssertEqualsTable
		@Expected = N'[CheckAssertEqualsTable].Expected' -- nvarchar(max)
		,@Actual = N'[CheckAssertEqualsTable].Actual'	 -- nvarchar(max)
		,@FailMsg = N'Data had one null col';			 -- nvarchar(max)
END;
GO
