SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [Interaction].[test check constraint needs end after start]
AS
BEGIN
	--Assemble
	EXEC tSQLt.FakeTable @TableName = N'dbo.Interaction';

	EXEC tSQLt.ApplyConstraint
		@TableName = N'dbo.Interaction'
		,@ConstraintName = N'chkInteractionsEndAfterStart';

	--Act
	EXEC tSQLt.ExpectException;

	INSERT INTO dbo.Interaction
	(
		InteractionStartDT
		,InteractionEndDT
	)
	VALUES
	(
		'2013-11-02 11:40:18'  -- InteractionStartDT - datetime
		,'2013-11-01 11:40:18' -- InteractionEndDT - datetime
	);
END;
GO
