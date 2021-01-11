SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [CheckAssertResultSetHaveSameMetaData].[test OneMorColinActualThanExpected]
AS
BEGIN
	--Assemble
	CREATE TABLE CheckAssertResultSetHaveSameMetaData.Expected
	(
		Col1  INT NULL
		,Col2 INT NULL
	);

	CREATE TABLE CheckAssertResultSetHaveSameMetaData.Actual
	(
		Col1  INT NULL
		,Col2 INT NULL
		,Col3 INT NULL
	);

	--Act

	--Assert
	EXEC tSQLt.AssertResultSetsHaveSameMetaData
		@expectedCommand = N'SELECT * FROM CheckAssertResultSetHaveSameMetaData.Expected' -- nvarchar(max)
		,@actualCommand = N'SELECT * FROM CheckAssertResultSetHaveSameMetaData.Actual';	  -- nvarchar(max)
END;
GO
