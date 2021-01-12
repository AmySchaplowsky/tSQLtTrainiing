SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[MaintenanceStatic] @Message VARCHAR(MAX) OUTPUT
AS
BEGIN
	SET @Message = 'Failed to complete.';

	EXEC dbo.Maintenance_CalculateAverages;

	EXEC dbo.Maintenance_CustomersTakingMoreTime;

	SELECT
		@Message = 'Completed.';
END;
GO
