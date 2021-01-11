SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[Maintenance] @Message VARCHAR(MAX) OUTPUT
AS
BEGIN
	--Run Maintenance procedures, Report time taken
	DECLARE @StartTime DATETIME;

	SET @StartTime = GETDATE();
	SET @Message = 'Failed to complete.';

	EXEC dbo.Maintenance_CalculateAverages;

	EXEC dbo.Maintenance_CustomersTakingMoreTime;

	SELECT
		@Message = 'Completed in ' + CONVERT(VARCHAR(10), DATEDIFF(ms, @StartTime, GETDATE())) + ' milliseconds';
END;
GO
