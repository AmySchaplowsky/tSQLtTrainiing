SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [LogInformation].[test check parameter is required]
AS
BEGIN
	--Assemble
	--Act
	EXEC tSQLt.ExpectException
		@ExpectedSeverity = 16
		,@ExpectedState = 4
		,@ExpectedMessage = 'Procedure or function ''LogInformation'' expects parameter ''@Msg'', which was not supplied.';

	EXEC dbo.LogInformation;

--Assert
END;
GO
