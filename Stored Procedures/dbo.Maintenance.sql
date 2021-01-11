SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[Maintenance] @Message VARCHAR(MAX) OUTPUT
AS
BEGIN
	--Run Maintenance procedures
	SET @Message = 'Failed to complete.';

	EXEC dbo.Maintenance_CalculateAverages;

	EXEC dbo.Maintenance_CustomersTakingMoreTime;

	SELECT
		@Message = 'Completed.';
END;
GO
