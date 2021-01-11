CREATE TABLE [dbo].[LogNamingConvention]
(
[NAME] [sys].[sysname] NOT NULL,
[SchemaID] [int] NOT NULL,
[dt] [datetime] NOT NULL CONSTRAINT [DF__LogNamingCon__dt__4850AF91] DEFAULT (getdate())
) ON [PRIMARY]
GO
