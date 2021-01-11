SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [Maintenance].[test output parameter is correct with like]
AS
BEGIN
	--Assemble
	EXEC tSQLt.SpyProcedure
		@ProcedureName = N'dbo.Maintenance_CalculateAverages'
		,@CommandToExecute = N'DECLARE @rnd CHAR(2) = FLOOR(RAND() * 100);
							   DECLARE @delay VARCHAR(100) = ''00:00:00.'' + @rnd;
							   WAitFOR DELAY @delay;';

	EXEC tSQLt.SpyProcedure
		@ProcedureName = N'dbo.Maintenance_CustomersTakingMoreTime';

	--Act
	DECLARE @Actual VARCHAR(MAX);

	EXEC dbo.Maintenance @Message = @Actual OUTPUT;

	--Assert
	EXEC tSQLt.AssertLike
		@ExpectedPattern = N'Completed in % milliseconds' -- nvarchar(max)
		,@Actual = @Actual		   -- nvarchar(max)
		,@Message = N'Expected message was not recived in output variable.'		   -- nvarchar(max)
	
END;
GO
