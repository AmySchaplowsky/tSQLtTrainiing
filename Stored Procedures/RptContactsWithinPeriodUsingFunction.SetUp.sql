SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROC [RptContactsWithinPeriodUsingFunction].[SetUp]
AS
BEGIN
	--Isolate from the Interaction and InteractionType tables:
	EXEC tSQLt.FakeTable @TableName = N'dbo.InteractionType';

	EXEC tSQLt.FakeTable @TableName = N'dbo.Interaction';

	INSERT dbo.InteractionType
	(
		InteractionTypeID
		,InteractionTypeText
	)
	VALUES
	(
		1
		,'Introduction'
	)
		,(
			 2
			 ,'Phone Call (Outbound)'
		 )
		,(
			 3
			 ,'Complaint'
		 )
		,(
			 4
			 ,'Sale'
		 )
		,(
			 5
			 ,'Meeting'
		 );

	--Isolate from Function:
	EXEC tSQLt.FakeFunction
		@FunctionName = N'dbo.fcn_GetFirstOfMonth' -- nvarchar(max)
		,@FakeFunctionName = N'RptContactsWithinPeriodUsingFunction.fcn_GetFirstOfMonth';

	-- nvarchar(max)

	--Set Up Expected Data Table
	IF OBJECT_ID('RptContactsWithinPeriodUsingFunction.Expected') IS NOT NULL
	BEGIN
		DROP TABLE RptContactsWithinPeriodUsingFunction.Expected;
	END;

	CREATE TABLE RptContactsWithinPeriodUsingFunction.Expected
	(
		InteractionTypeText VARCHAR(100) NULL
		,Occurrences		INT			 NULL
		,TotalTimeMins		INT			 NULL
	);

	--Set Up Actual Data Table
	IF OBJECT_ID('RptContactsWithinPeriodUsingFunction.Actual') IS NOT NULL
	BEGIN
		DROP TABLE RptContactsWithinPeriodUsingFunction.Actual;
	END;

	CREATE TABLE RptContactsWithinPeriodUsingFunction.Actual
	(
		InteractionTypeText VARCHAR(100) NULL
		,Occurrences		INT			 NULL
		,TotalTimeMins		INT			 NULL
	);
END;
GO
