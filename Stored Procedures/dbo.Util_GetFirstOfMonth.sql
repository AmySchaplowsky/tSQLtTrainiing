SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROC [dbo].[Util_GetFirstOfMonth]
	@Date		   DATE
	,@FirstOfMonth DATETIME OUTPUT
AS
BEGIN
	--Utility procedure to return the start of the month.
	SET @FirstOfMonth = DATEADD(dd, 1, EOMONTH(@Date, -1));
END;
GO
