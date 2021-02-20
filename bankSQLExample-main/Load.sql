/*
DEVELOPER			CREATION DATE				INDEX					COMMENTS
==============		======================		==================		====================================================================
SOUZA,EVERTON		19/02/2021 08:22									Load main data.
*/


--Client Sector...
insert into dbo.clientSector(clientSectorID, clientSectorName)
values(1, 'Public')

insert into dbo.clientSector(clientSectorID, clientSectorName)
values(2, 'Private')

--Actual risks categories rules... 
insert into dbo.TradeCategoryRule(tradeCategoryID, clientSectorID, criteriaType, criteriaValue)
values(1, 2, '>', 1000000)

insert into dbo.TradeCategoryRule(tradeCategoryID, clientSectorID, criteriaType, criteriaValue)
values(2, 1, '>', 1000000)

insert into dbo.TradeCategoryRule(tradeCategoryID, clientSectorID, criteriaType, criteriaValue)
values(3, 1, '<=', 1000000)

