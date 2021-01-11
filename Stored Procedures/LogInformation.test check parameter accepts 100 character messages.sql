SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [LogInformation].[test check parameter accepts 100 character messages]
AS
BEGIN
	--Assemble
	DECLARE @Msg NVARCHAR(100) = REPLICATE('a', 100);

	--Act
	EXEC tSQLt.ExpectNoException
		@Message = 'An exception was raised when a message of 100 characters was supplied.';

	EXEC dbo.LogInformation @Msg = @Msg;

--Assert
END;
GO
