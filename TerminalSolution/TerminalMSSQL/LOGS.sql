﻿CREATE TABLE [dbo].[LOGS]
(
	[LOG_ID] INT NOT NULL PRIMARY KEY, 
    [DATE] DATETIME2 NOT NULL, 
    [TYPE] VARCHAR(8) NOT NULL, 
    [TABLE_NAME] VARCHAR(16) NOT NULL, 
    [ACCOUNT_ID] INT NOT NULL
)