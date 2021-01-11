SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [fcn_GetFirstOfMonth].[test with valid input date]
AS
BEGIN
	--Assemble
	DECLARE
		@Actual	   DATETIME
		,@Input	   DATETIME
		,@Expected DATETIME;

	SELECT
		@Input	   = '2012-02-19'
		,@Expected = '2012-02-01';

	--Act
	SET @Actual = dbo.fcn_GetFirstOfMonth(@Input);

	--Assert
	EXEC tSQLt.AssertEquals
		@Expected = @Expected															-- sql_variant
		,@Actual = @Actual																-- sql_variant
		,@Message = N'Procedure did not return when fed 29th Feb on a valid leap year'; -- nvarchar(max)
END;
GO
