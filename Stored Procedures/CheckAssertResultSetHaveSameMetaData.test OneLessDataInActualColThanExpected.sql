SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [CheckAssertResultSetHaveSameMetaData].[test OneLessDataInActualColThanExpected]
AS
BEGIN
	--Assemble
	CREATE TABLE CheckAssertResultSetHaveSameMetaData.Expected
	(
		Col1  INT NULL
		,Col2 INT NULL
		,col3 INT NULL
	);

	CREATE TABLE CheckAssertResultSetHaveSameMetaData.Actual
	(
		Col1  INT NULL
		,Col2 INT NULL
		,Col3 INT NULL
	);

	INSERT CheckAssertResultSetHaveSameMetaData.Expected
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

	INSERT CheckAssertResultSetHaveSameMetaData.Actual
	(
		Col1
		,Col2
	)
	VALUES
	(
		1
		,2
	);

	INSERT CheckAssertResultSetHaveSameMetaData.Expected
	(
		Col1
		,Col2
	)
	VALUES
	(
		4
		,5
	);

	INSERT CheckAssertResultSetHaveSameMetaData.Actual
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

	INSERT CheckAssertResultSetHaveSameMetaData.Expected
	(
		Col1
		,Col2
	)
	VALUES
	(
		7
		,8
	);

	INSERT CheckAssertResultSetHaveSameMetaData.Actual
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
	EXEC tSQLt.AssertResultSetsHaveSameMetaData
		@expectedCommand = N'SELECT * FROM CheckAssertResultSetHaveSameMetaData.Expected' -- nvarchar(max)
		,@actualCommand = N'SELECT * FROM CheckAssertResultSetHaveSameMetaData.Actual';	  -- nvarchar(max)
END;
GO
