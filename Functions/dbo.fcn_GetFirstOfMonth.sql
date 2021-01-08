SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE FUNCTION [dbo].[fcn_GetFirstOfMonth]
(
	@Date DATE
)
RETURNS DATETIME
AS
BEGIN
	--Utility procedure to return the start of the month.
	DECLARE @FirstOfMonth DATETIME;

	SET @FirstOfMonth = DATEADD(dd, 1, EOMONTH(@Date, -1));

	RETURN @FirstOfMonth;
END;
GO
