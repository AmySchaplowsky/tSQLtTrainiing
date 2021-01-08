CREATE TABLE [dbo].[Customer]
(
[CustomerID] [int] NOT NULL IDENTITY(1, 1),
[Forename] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Surname] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[KnownAs] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneNumber] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer] ADD CONSTRAINT [PK__Customer__A4AE64B83D74833B] PRIMARY KEY CLUSTERED  ([CustomerID]) ON [PRIMARY]
GO
