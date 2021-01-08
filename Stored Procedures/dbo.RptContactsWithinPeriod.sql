SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROC [dbo].[RptContactsWithinPeriod]
	@WithinLastMonths INT
	,@RunAsAt		  DATE
AS
BEGIN
	--Display a summary of contacts and durations within the last X months
	--Exclude current month as it is incomplete.
	DECLARE
		@StartDate DATETIME
		,@EndDate  DATETIME;

	EXEC Util_GetFirstOfMonth
		@Date = @RunAsAt
		,@FirstOfMonth = @EndDate OUTPUT;

	SET @StartDate = DATEADD(mm, -@WithinLastMonths, @EndDate);

	SELECT
		IT.InteractionTypeText
		,COUNT(*)												 Occurrences
		,SUM(DATEDIFF(MI, InteractionStartDT, InteractionEndDT)) TotalTimeMins
	FROM dbo.Interaction				I
		 INNER JOIN dbo.InteractionType IT ON IT.InteractionTypeID = I.InteractionTypeID
	WHERE I.InteractionStartDT BETWEEN @StartDate AND @EndDate
	GROUP BY IT.InteractionTypeText;
END;
GO
