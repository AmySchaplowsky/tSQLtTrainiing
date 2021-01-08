SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [CheckAssertEqualsTable].[test OneMoreColInActualThanExpected]
AS
BEGIN
	--Testing what happens when Actual has MORE columns than expected
	--Assemble
	CREATE TABLE [CheckAssertEqualsTable].Expected
	(
		Col1  INT NULL
		,Col2 INT NULL
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
	)
	VALUES
	(
		1
		,2
	);

	INSERT [CheckAssertEqualsTable].Actual
	(
		Col1
		,Col2
		,Col3
	)
	VALUES
	(
		1
		,2
		,3
	);

	--Assert
	EXEC tSQLt.AssertEqualsTable
		@Expected = N'[CheckAssertEqualsTable].Expected'	  -- nvarchar(max)
		,@Actual = N'[CheckAssertEqualsTable].Actual'		  -- nvarchar(max)
		,@FailMsg = N'Expected had one col less than Actual'; -- nvarchar(max)
END;
GO
