SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROC [dbo].[Maintenance_CalculateAverages]
AS
BEGIN
	--Stub Proc
	DECLARE @rnd CHAR(2) = FLOOR(RAND() * 100);
	DECLARE @delay VARCHAR(100) = '00:00:00.' + @rnd;

	WAITFOR DELAY @delay;
END;
GO
