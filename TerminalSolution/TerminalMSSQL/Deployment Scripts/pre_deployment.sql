exec sp_configure 'contained database authentication', 1
go
reconfigure
go

alter database [TerminalMSSQL]
set containment = partial
go