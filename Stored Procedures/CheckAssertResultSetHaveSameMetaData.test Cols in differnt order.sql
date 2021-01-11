SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [CheckAssertResultSetHaveSameMetaData].[test Cols in differnt order]
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
		,Col3 INT NULL
		,Col2 INT NULL
	);
END;
GO
