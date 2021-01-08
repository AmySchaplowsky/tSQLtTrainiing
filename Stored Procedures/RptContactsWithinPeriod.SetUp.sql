SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROC [RptContactsWithinPeriod].[SetUp]
AS
BEGIN
	-- Isolate Table Deps
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

	-- Mock Util_GetFirstOfMonth
	EXEC tSQLt.SpyProcedure
		@ProcedureName = N'dbo.Util_GetFirstOfMonth'				-- nvarchar(max)
		,@CommandToExecute = N'SET @FirstOfMonth = ''2013-01-01'''; -- nvarchar(max)
END;
GO
