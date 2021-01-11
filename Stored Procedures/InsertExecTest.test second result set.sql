SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [InsertExecTest].[test second result set]
AS
BEGIN
	--Assemble
	CREATE TABLE InsertExecTest.Actual
	(
		a  INT NULL
		,b INT NULL
		,c INT NULL
		,d INT NULL
	);

	CREATE TABLE InsertExecTest.Expected
	(
		a  INT NULL
		,b INT NULL
		,c INT NULL
		,d INT NULL
	);

	INSERT INTO InsertExecTest.Expected
	(
		a
		,b
		,c
		,d
	)
	VALUES
	(
		4
		,5
		,6
		,7
	);

	--Act
	INSERT INTO InsertExecTest.Actual
	(
		a
		,b
		,c
		,d
	)
	EXEC tSQLt.ResultSetFilter
		@ResultsetNo = 2
		,@Command = N'EXEC dbo.InsertExecTest';

	--Assert
	EXEC tSQLt.AssertEqualsTable
		@Expected = N'InsertExecTest.Expected'
		,@Actual = N'InsertExecTest.Actual'
		,@FailMsg = N'Data is not correct';
END;
GO
