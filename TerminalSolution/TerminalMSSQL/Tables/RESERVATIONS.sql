﻿CREATE TABLE [dbo].[RESERVATIONS]
(
	[RESERVATIONS_ID] INT NOT NULL PRIMARY KEY, 
    [AIRCRAFT_ID] INT NOT NULL, 
    [OBJECT_ID] INT NOT NULL, 
    [BEGIN_DATE] DATETIME2 NOT NULL, 
    [END_DATE] DATETIME2 NOT NULL, 
    [CYCLE_ID] INT NULL, 
    [IS_FINALIZED] BIT NOT NULL
)