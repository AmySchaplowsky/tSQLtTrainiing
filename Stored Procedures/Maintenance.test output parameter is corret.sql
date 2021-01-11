SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [Maintenance].[test output parameter is corret]
AS
BEGIN
	--Assemble
	EXEC tSQLt.SpyProcedure
		@ProcedureName = N'dbo.Maintenance_CalculateAverages';

	EXEC tSQLt.SpyProcedure
		@ProcedureName = N'dbo.Maintenance_CustomersTakingMoreTime';

	--Act
	DECLARE @Actual VARCHAR(MAX);

	EXEC dbo.Maintenance @Message = @Actual OUTPUT;

	--Assert
	EXEC tSQLt.AssertEqualsString
		@Expected = N'Completed.'											-- nvarchar(max)
		,@Actual = @Actual													-- nvarchar(max)
		,@Message = N'Expected message was not recived in output variable'; -- nvarchar(max)
END;
GO
