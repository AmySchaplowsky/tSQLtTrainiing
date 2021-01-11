CREATE TABLE [dbo].[tbl_log]
(
[LogID] [int] NOT NULL IDENTITY(1, 1),
[LogMessage] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Logged] [datetime] NOT NULL CONSTRAINT [DF__tbl_log__Logged__0169315C] DEFAULT (getdate())
) ON [PRIMARY]
GO
