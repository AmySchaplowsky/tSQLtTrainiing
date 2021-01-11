SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [Interaction].[test FK_Interaction_Customer Invalid inputs]
AS
BEGIN
	--Assemble
	EXEC tSQLt.FakeTable @TableName = N'dbo.Interaction';

	EXEC tSQLt.FakeTable @TableName = N'dbo.Customer';

	EXEC tSQLt.ApplyConstraint
		@TableName = N'dbo.Interaction'
		,@ConstraintName = N'FK_Interaction_Customer';

	--Act
	EXEC tSQLt.ExpectException;

	INSERT INTO dbo.Interaction
	(
		CustomerID
	)
	VALUES
	(
		1
	);
END;
GO
