SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROC [RptContactsWithinPeriodUsingFunction].[test correct data is returned given normal input data]
AS
BEGIN
	--Assemble
	INSERT dbo.Interaction
	(
		InteractionTypeID
		,InteractionStartDT
		,InteractionEndDT
	)
	VALUES
	(
		5 -- Meeting
		,CONVERT(DATETIME, '2013-01-03 09:00:00', 120)
		,CONVERT(DATETIME, '2013-01-03 09:30:00', 120)
	)
		,(
			 5 -- Meeting
			 ,CONVERT(DATETIME, '2013-01-02 09:00:00', 120)
			 ,CONVERT(DATETIME, '2013-01-02 10:30:00', 120)
		 )
		,(
			 5 -- Meeting (Out of period  - too recent)
			 ,CONVERT(DATETIME, '2013-02-02 09:00:00', 120)
			 ,CONVERT(DATETIME, '2013-02-02 10:30:00', 120)
		 )
		,(
			 5 -- Meeting (Out of period - too old)
			 ,CONVERT(DATETIME, '2012-12-08 09:00:00', 120)
			 ,CONVERT(DATETIME, '2012-12-08 10:30:00', 120)
		 )
		,(
			 2 -- Phone Call (Outbound)
			 ,CONVERT(DATETIME, '2013-01-03 09:01:00', 120)
			 ,CONVERT(DATETIME, '2013-01-03 09:13:00', 120)
		 );

	INSERT RptContactsWithinPeriodUsingFunction.Expected
	VALUES --Data we expect to be passed in
	(
		'Meeting'
		,2
		,120
	)
		,(
			 'Phone Call (Outbound)'
			 ,1
			 ,12
		 );

	--Act
	INSERT RptContactsWithinPeriodUsingFunction.Actual
	(
		InteractionTypeText
		,Occurrences
		,TotalTimeMins
	)
	EXEC dbo.RptContactsWithinPeriodUsingFunction
		@WithinLastMonths = 1
		,@RunAsAt = '2013-02-05';

	--Assert
	EXEC tSQLt.AssertEqualsTable
		@Expected = N'RptContactsWithinPeriodUsingFunction.Expected' -- nvarchar(max)
		,@Actual = N'RptContactsWithinPeriodUsingFunction.Actual'	 -- nvarchar(max)
		,@FailMsg = N'The expected results were not returned';		 -- nvarchar(max)
END;
GO
