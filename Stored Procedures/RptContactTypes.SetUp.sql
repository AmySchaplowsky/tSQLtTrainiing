SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [RptContactTypes].[SetUp]
AS
BEGIN
-- Setup expected data table
IF OBJECT_ID('RptContactTypes.Expected') IS NOT NULL
	BEGIN
		DROP TABLE RptContactTypes.Expected;
	END;

	CREATE TABLE RptContactTypes.Expected
	(
		InteractionTypeText VARCHAR(100) NULL
		,Occurrences		INT			 NULL
		,TotalTimeMins		INT			 NULL
	);

	-- Isolate from Interaction and InteractionType tables
	EXEC tSQLt.FakeTable @TableName = N'dbo.InteractionType'; -- nvarchar(max)

	EXEC tSQLt.FakeTable @TableName = N'dbo.Interaction'; -- nvarchar(max)

	INSERT dbo.InteractionType
	(
		InteractionTypeID
		,InteractionTypeText
	)
	VALUES
	(
		1				-- InteractionTypeID - int
		,'Introduction' -- InteractionTypeText - varchar(100)
	)
		,(
			 2						  -- InteractionTypeID - int
			 ,'Phone Call (Outbound)' -- InteractionTypeText - varchar(100)
		 )
		,(
			 3			  -- InteractionTypeID - int
			 ,'Complaint' -- InteractionTypeText - varchar(100)
		 )
		,(
			 4		 -- InteractionTypeID - int
			 ,'Sale' -- InteractionTypeText - varchar(100)
		 )
		,(
			 5			-- InteractionTypeID - int
			 ,'Meeting' -- InteractionTypeText - varchar(100)
		 );
END;
GO
