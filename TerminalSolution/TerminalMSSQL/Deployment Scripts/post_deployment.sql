﻿/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

PRINT N'Altering [dbo].[ACCOUNTS]...';
ALTER TABLE [dbo].[ACCOUNTS]
ADD CONSTRAINT ACCOUNTS_AGENTS_FK 
FOREIGN KEY (AGENT_ID) 
REFERENCES AGENTS (AGENT_ID) 
ON DELETE CASCADE
ON UPDATE CASCADE

PRINT N'Altering [dbo].[AGENTS]...';
ALTER TABLE [dbo].[AGENTS]
ADD CONSTRAINT AGENTS_CONTACT_DATA_FK
FOREIGN KEY (CONTACT_DATA_ID) 
REFERENCES CONTACT_DATA (CONTACT_DATA_ID) 
ON DELETE CASCADE
ON UPDATE CASCADE

PRINT N'Altering [dbo].[AIRCRAFTS]...';
ALTER TABLE [dbo].[AIRCRAFTS]
ADD CONSTRAINT AIRCRAFTS_AIRCRAFT_MODELS__FK
FOREIGN KEY (AIRCRAFT_MODEL_ID) 
REFERENCES AIRCRAFT_MODELS (AIRCRAFT_MODEL_ID) 
ON DELETE CASCADE
ON UPDATE CASCADE

PRINT N'Altering [dbo].[CLIENTS]...';
ALTER TABLE [dbo].[CLIENTS]
ADD CONSTRAINT CLIENTS_CONTACT_DATA_FK 
FOREIGN KEY (CONTACT_DATA_ID) 
REFERENCES CONTACT_DATA (CONTACT_DATA_ID) 
ON DELETE CASCADE
ON UPDATE CASCADE

PRINT N'Altering [dbo].[LOGS]...';
ALTER TABLE [dbo].[LOGS]
ADD CONSTRAINT LOGS_ACCOUNTS_FK 
FOREIGN KEY (ACCOUNT_ID) 
REFERENCES ACCOUNTS (ACCOUNT_ID) 
ON DELETE CASCADE
ON UPDATE CASCADE

PRINT N'Altering [dbo].[MAINTENANCE]...';
ALTER TABLE [dbo].[MAINTENANCE]
ADD CONSTRAINT MAINTENANCE_INFRASTRUCTURE_FK 
FOREIGN KEY ([OBJECT_ID]) 
REFERENCES INFRASTRUCTURE ([OBJECT_ID]) 
ON DELETE CASCADE
ON UPDATE CASCADE

PRINT N'Altering [dbo].[RESERVATIONS]...';
ALTER TABLE [dbo].[RESERVATIONS]
ADD CONSTRAINT RESERVATIONS_AIRCRAFTS_FK 
FOREIGN KEY (AIRCRAFT_ID) 
REFERENCES AIRCRAFTS (AIRCRAFT_ID) 
ON DELETE CASCADE
ON UPDATE CASCADE

ALTER TABLE [dbo].[RESERVATIONS]
ADD CONSTRAINT RESERVATIONS_INFRASTRUCTURE_FK 
FOREIGN KEY ([OBJECT_ID]) 
REFERENCES INFRASTRUCTURE ([OBJECT_ID]) 
ON DELETE CASCADE
ON UPDATE CASCADE

PRINT N'Inserting values into [dbo].[CONTACT_DATA]...';
INSERT INTO [dbo].[CONTACT_DATA]
VALUES 
(NEXT VALUE FOR [CONTACT_DATA_SEQUENCE], 'Ryanair Ltd.','Corporate Head Office Airside Business Park', 'Swords', 'Dublin', 'K67', 'contact@ryanair.com', '845987658' ), 
(NEXT VALUE FOR [CONTACT_DATA_SEQUENCE], 'Marcin Nowak','Aleje Jerozolimskie 16', NULL, 'Warszawa', '00906', 'marcin.nowak@ryanair.com', '5748855878' ), 

(NEXT VALUE FOR [CONTACT_DATA_SEQUENCE], 'PLL LOT','ul. 17 Stycznia 39', NULL, 'Warszawa', '00906', 'contact@lot.com', '75406894' ), 
(NEXT VALUE FOR [CONTACT_DATA_SEQUENCE], 'Bogusław Łęcina','ul. 17 Stycznia 39', NULL, 'Warszawa', '00906', 'boguslaw.lecina@lot.com', '554821648' ), 

(NEXT VALUE FOR [CONTACT_DATA_SEQUENCE], 'Staszek Air Club','Budzynowo Wielkie 16', NULL, 'Budzynowo Wielkie', '14880', 'stasiu@buziaczek.pl', '742460874' ), 
(NEXT VALUE FOR [CONTACT_DATA_SEQUENCE], 'Stanisław Kasztan','Budzynowo Wielkie 16', NULL, 'Budzynowo Wielkie', '14880', 'stasiu@buziaczek.pl', '742460874' ), 

(NEXT VALUE FOR [CONTACT_DATA_SEQUENCE], 'Lufthansa','Tegel Airport', 'Schalter gegenüber Gate 10/11', 'Berlin', '13405', 'contact@lufthansa.com', '856503814' ), 
(NEXT VALUE FOR [CONTACT_DATA_SEQUENCE], 'Piotr Ułan','ul. Żwirki i Wigury 1', NULL, 'Warszawa', '00906', 'piotr.ulan@lufthansa.com', '225123917' ), 

(NEXT VALUE FOR [CONTACT_DATA_SEQUENCE], 'Wizz Air Hungary Ltd.','BUD International Airport', 'Building 221', 'Budapest', 'H-1185', 'contact@wizzair.com', '109964332' ), 
(NEXT VALUE FOR [CONTACT_DATA_SEQUENCE], 'Laszlo Hajdu','BUD International Airport', 'Building 221', 'Budapest', 'H-1185', 'contact@wizzair.com', '274851095' ), 

(NEXT VALUE FOR [CONTACT_DATA_SEQUENCE], 'Emirates','Lumen, VI piętro', 'Ul. Złota 59', 'Warszawa', '00120', 'contact@emirates.com', '223060808' ), 
(NEXT VALUE FOR [CONTACT_DATA_SEQUENCE], 'Andrzej Samotny','Lumen, VI piętro', 'Ul. Złota 59', 'Warszawa', '00120', 'andrzej.samotny@emirates.com', '554125896' )