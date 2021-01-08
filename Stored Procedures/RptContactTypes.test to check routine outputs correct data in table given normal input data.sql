SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROC [RptContactTypes].[test to check routine outputs correct data in table given normal input data]
AS
BEGIN
	--Assemble
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

	INSERT RptContactTypes.Expected
	(
		InteractionTypeText
		,Occurrences
		,TotalTimeMins
	)
	VALUES
	(
		'Complaint' -- InteractionTypeText - varchar(100)
		,206		-- Occurrences - int
		,78411		-- TotalTimeMins - int
	)
		,(
			 'Introduction' -- InteractionTypeText - varchar(100)
			 ,214			-- Occurrences - int
			 ,77837			-- TotalTimeMins - int
		 )
		,(
			 'Meeting' -- InteractionTypeText - varchar(100)
			 ,190	   -- Occurrences - int
			 ,69050	   -- TotalTimeMins - int
		 )
		,(
			 'Sale' -- InteractionTypeText - varchar(100)
			 ,202	-- Occurrences - int
			 ,75175 -- TotalTimeMins - int
		 )
		,(
			 'Phone Call (Outbound)' -- InteractionTypeText - varchar(100)
			 ,188					 -- Occurrences - int
			 ,64839					 -- TotalTimeMins - int
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
