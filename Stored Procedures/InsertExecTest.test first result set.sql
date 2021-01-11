SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [InsertExecTest].[test first result set]
AS
BEGIN
	--Assemble
	CREATE TABLE InsertExecTest.Actual
	(
		a  INT NULL
		,b INT NULL
		,c INT NULL
	);

	CREATE TABLE InsertExecTest.Expected
	(
		a  INT NULL
		,b INT NULL
		,c INT NULL
	);

	INSERT INTO InsertExecTest.Expected
	(
		a
		,b
		,c
	)
	VALUES
	(
		1
		,2
		,3
	);

	--Act
	INSERT INTO InsertExecTest.Actual
	(
		a
		,b
		,c
	)
	EXEC tSQLt.ResultSetFilter
		@ResultsetNo = 1
		,@Command = N'EXEC dbo.InsertExecTest';

	--Assert
	EXEC tSQLt.AssertEqualsTable
		@Expected = N'InsertExecTest.Expected'
		,@Actual = N'InsertExecTest.Actual'
		,@FailMsg = N'Data is not correct';
END;
GO
