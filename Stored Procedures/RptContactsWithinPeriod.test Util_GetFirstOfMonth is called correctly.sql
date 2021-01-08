SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROC [RptContactsWithinPeriod].[test Util_GetFirstOfMonth is called correctly]
AS
BEGIN
	--Assemble
	IF (OBJECT_ID('RptContactsWithinPeriod.Expected') IS NOT NULL)
	BEGIN
		DROP TABLE RptContactsWithinPeriod.Expected;
	END;

	SELECT TOP (0)
		*
	INTO
		RptContactsWithinPeriod.Expected
	FROM dbo.Util_GetFirstOfMonth_SpyProcedureLog;

	INSERT INTO RptContactsWithinPeriod.Expected
	(
		[Date]
	)
	VALUES
	(
		'2013-01-05'
	);

	--Act
	EXEC dbo.RptContactsWithinPeriod
		@WithinLastMonths = 1
		,@RunAsAt = '2013-01-05';

	--Assert
	EXEC tSQLt.AssertEqualsTable
		@Expected = N'RptContactsWithinPeriod.Expected'		   -- nvarchar(max)
		,@Actual = N'dbo.Util_GetFirstOfMonth_SpyProcedureLog' -- nvarchar(max)
		,@FailMsg = N'Not called with expected parameters';	   -- nvarchar(max)
END;
GO
