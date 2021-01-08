CREATE TABLE [dbo].[Interaction]
(
[InteractionID] [int] NOT NULL IDENTITY(1, 1),
[StaffID] [int] NOT NULL,
[CustomerID] [int] NOT NULL,
[InteractionTypeID] [int] NOT NULL,
[InteractionStartDT] [datetime] NOT NULL,
[InteractionEndDT] [datetime] NOT NULL,
[StaffNotes] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Interaction] ADD CONSTRAINT [chkInteractionsEndAfterStart] CHECK (([InteractionEndDt]>[InteractionStartDt]))
GO
ALTER TABLE [dbo].[Interaction] ADD CONSTRAINT [PK__Interact__922C037618F921D8] PRIMARY KEY CLUSTERED  ([InteractionID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Interaction] ADD CONSTRAINT [FK_Interaction_Customer] FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Interaction] ADD CONSTRAINT [FK_Interaction_InteractionType] FOREIGN KEY ([InteractionTypeID]) REFERENCES [dbo].[InteractionType] ([InteractionTypeID])
GO
ALTER TABLE [dbo].[Interaction] ADD CONSTRAINT [FK_Interaction_Staff] FOREIGN KEY ([StaffID]) REFERENCES [dbo].[Staff] ([StaffID])
GO
