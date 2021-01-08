CREATE TABLE [dbo].[InteractionType]
(
[InteractionTypeID] [int] NOT NULL IDENTITY(1, 1),
[InteractionTypeText] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InteractionType] ADD CONSTRAINT [PK__Interact__827A814F4EC10E65] PRIMARY KEY CLUSTERED  ([InteractionTypeID]) ON [PRIMARY]
GO
