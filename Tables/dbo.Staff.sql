CREATE TABLE [dbo].[Staff]
(
[StaffID] [int] NOT NULL IDENTITY(1, 1),
[Forename] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Surname] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[KnownAs] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Staff] ADD CONSTRAINT [PK__Staff__96D4AAF7EA218C5B] PRIMARY KEY CLUSTERED  ([StaffID]) ON [PRIMARY]
GO
