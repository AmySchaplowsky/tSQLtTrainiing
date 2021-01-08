SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROC [RptContactTypes].[test to check routine outputs correct data in table given normal input data]
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
		5											   -- InteractionTypeID - int
		,CONVERT(DATETIME, '2013-01-03 09:00:00', 120) -- InteractionStartDT - datetime
		,CONVERT(DATETIME, '2013-01-03 09:30:00', 120) -- InteractionEndDT - datetime
	)
		,(
			 5												-- InteractionTypeID - int
			 ,CONVERT(DATETIME, '2013-01-02 09:00:00', 120) -- InteractionStartDT - datetime
			 ,CONVERT(DATETIME, '2013-01-02 10:30:00', 120) -- InteractionEndDT - datetime
		 )
		,(
			 2												-- InteractionTypeID - int
			 ,CONVERT(DATETIME, '2013-01-03 09:01:00', 120) -- InteractionStartDT - datetime
			 ,CONVERT(DATETIME, '2013-01-03 09:13:00', 120) -- InteractionEndDT - datetime
		 );

	INSERT RptContactTypes.Expected
	(
		InteractionTypeText
		,Occurrences
		,TotalTimeMins
	)
	VALUES
	(
		'Meeting' -- InteractionTypeText - varchar(100)
		,2		  -- Occurrences - int
		,120	  -- TotalTimeMins - int
	)
		,(
			 'Phone Call (Outbound)' -- InteractionTypeText - varchar(100)
			 ,1						 -- Occurrences - int
			 ,12					 -- TotalTimeMins - int
		 );

	--Act
	SELECT
		*
	INTO
		RptContactTypes.Actual
	FROM dbo.RptContactTypes;

	--Assert
	EXEC tSQLt.AssertEqualsTable
		@Expected = N'RptContactTypes.Expected'			   -- nvarchar(max)
		,@Actual = N'RptContactTypes.Actual'			   -- nvarchar(max)
		,@FailMsg = N'The expected data was not returned'; -- nvarchar(max)
END;
GO
