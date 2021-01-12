SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [DevelopmentStandards].[test Naming Convention - test classes correspond to object in database]
AS
BEGIN
	DECLARE @IsTestDisabled BIT = 1; -- set this to 1 if you don't want the test to run

	IF @IsTestDisabled = 1
	BEGIN
		DECLARE @SchemaName VARCHAR(1000);

		SELECT
			@SchemaName = QUOTENAME(SCHEMA_NAME(schema_id)) + '.'
		FROM sys.procedures
		WHERE object_id = @@procid;

		PRINT 'Disabled Test: ' + @SchemaName + QUOTENAME(OBJECT_NAME(@@procid));

		RETURN;
	END;

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
	DECLARE @Code VARCHAR(MAX);

	SET @Code =
		'INSERT INTO dbo.LogNamingConvention
		  (
		  	   NAME
		  	   ,SchemaID
		  )
		  SELECT
		  	   Name
		  	   ,SchemaId
		  FROM tSQLt.TestClasses (nolock)
		  WHERE OBJECT_ID(''dbo.'' + Name) IS NULL
		  AND Name <> ''' + OBJECT_SCHEMA_NAME(@@PROCID) + '''
		  ';

	EXEC tSQLt.NewConnection @command = @Code;

	EXEC tSQLt.AssertEmptyTable @TableName = N'DevelopmentStandards.Actual';
END;
GO
