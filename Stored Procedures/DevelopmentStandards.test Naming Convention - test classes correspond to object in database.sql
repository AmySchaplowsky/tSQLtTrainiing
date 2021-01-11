SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [DevelopmentStandards].[test Naming Convention - test classes correspond to object in database]
AS
BEGIN
	--Assemble
	--Act
	SELECT
		Name
		,SchemaId
		,OBJECT_ID('dbo.' + Name) ObjectId
	INTO
		DevelopmentStandards.Actual
	FROM tSQLt.TestClasses
	WHERE OBJECT_ID('dbo.' + Name) IS NULL AND Name <> OBJECT_SCHEMA_NAME(@@PROCID)
	ORDER BY Name;

	--Assert
	EXEC tSQLt.AssertEmptyTable @TableName = N'DevelopmentStandards.Actual';
END;
GO
