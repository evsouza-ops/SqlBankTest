/*
DEVELOPER			CREATION DATE				INDEX					COMMENTS
==============		======================		==================		====================================================================
SOUZA,EVERTON		19/02/2021 08:52									Use case example

																		Pre-conditions:
																			
																			1) Execute SQL Script.sql to create database objects;
																			2) Execute Load.Sql to load data

																		Input:

																		Trade1 {Value = 2000000; ClientSector = "Private"}
																		Trade2 {Value = 400000; ClientSector = "Public"}
																		Trade3 {Value = 500000; ClientSector = "Public"}
																		Trade4 {Value = 3000000; ClientSector = "Public"}
																		portfolio = {Trade1, Trade2, Trade3, Trade4}
 
																		Output:
																		tradeCategories = {"HIGHRISK", "LOWRISK", "LOWRISK", "MEDIUMRISK"}

		
*/

truncate table PortfolioTrade
delete from Trade
delete client

declare
	@clientID_PrivateSector int,
	@clientID_PublicSector int 

--ClientSector = "Private"
insert into dbo.client(clientDUN,clienteName,clientSectorID)
values('000000001','Client 1',2)

set @clientID_PrivateSector = SCOPE_IDENTITY()

--ClientSector = "Public"
insert into dbo.client(clientDUN,clienteName,clientSectorID)
values('000000002','Client 2',1)

set @clientID_PublicSector = SCOPE_IDENTITY() 
 

 declare
	@tradeID_1 bigint,
	@tradeID_2 bigint,
	@tradeID_3 bigint,
	@tradeID_4 bigint

--Trade1 {Value = 2000000; ClientSector = "Private"}
insert into dbo.Trade(clientID,tradeValue)
values(@clientID_PrivateSector,2000000)

set @tradeID_1 = SCOPE_IDENTITY()

--Trade2 {Value = 400000; ClientSector = "Public"}
insert into dbo.Trade(clientID,tradeValue)
values(@clientID_PublicSector,400000)

set @tradeID_2 = SCOPE_IDENTITY()

--Trade3 {Value = 500000; ClientSector = "Public"}
insert into dbo.Trade(clientID,tradeValue)
values(@clientID_PublicSector,500000)

set @tradeID_3 = SCOPE_IDENTITY()

--Trade4 {Value = 3000000; ClientSector = "Public"}
insert into dbo.Trade(clientID,tradeValue)
values(@clientID_PublicSector,3000000)

set @tradeID_4 = SCOPE_IDENTITY()

--Creates the portfolio ...
declare
	@portfolioID int

insert into portfolio (portfolioName,portfolioComments)
values('Portifolio 1', 'Portifolio Use Case 1')

set @portfolioID = SCOPE_IDENTITY()

--Allocate the portfolio trades...
insert into PortfolioTrade(portfolioID,tradeID)
values(@portfolioID,@tradeID_1)

insert into PortfolioTrade(portfolioID,tradeID)
values(@portfolioID,@tradeID_2)

insert into PortfolioTrade(portfolioID,tradeID)
values(@portfolioID,@tradeID_3)

insert into PortfolioTrade(portfolioID,tradeID)
values(@portfolioID,@tradeID_4)

select * from trade
 
--tradeCategories = {"HIGHRISK", "LOWRISK", "LOWRISK", "MEDIUMRISK"}

declare
	@tradeCategoriesMsg varchar(255) 

select
	@tradeCategoriesMsg = isnull(@tradeCategoriesMsg+',','')+'"'+c.tradeCategoryDescription+'"'
from
	dbo.PortfolioTrade a inner join
	dbo.Trade b on
	a.tradeID = b.tradeID inner join
	dbo.TradeCategory c on
	b.tradeCategoryID = c.tradeCategoryID
where
	portfolioID = @portfolioID
order by
	a.creationDate

set @tradeCategoriesMsg = 'tradeCategories = {'+ @tradeCategoriesMsg + '}'

set nocount off
select @tradeCategoriesMsg as tradeCategoriesMsg

