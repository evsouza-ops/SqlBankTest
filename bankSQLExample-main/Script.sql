USE [master]
GO
/****** Object:  Database [Bank]    Script Date: 19/02/2021 13:26:33 ******/
CREATE DATABASE [Bank]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bank', FILENAME = N'C:\MSSQL\DATA\Bank.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bank_log', FILENAME = N'C:\MSSQL\DATA\Bank_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Bank] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bank].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bank] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bank] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bank] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bank] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bank] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bank] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bank] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bank] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bank] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bank] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bank] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bank] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bank] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bank] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bank] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bank] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bank] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bank] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bank] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bank] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bank] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bank] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bank] SET RECOVERY FULL 
GO
ALTER DATABASE [Bank] SET  MULTI_USER 
GO
ALTER DATABASE [Bank] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bank] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bank] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bank] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Bank] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Bank] SET QUERY_STORE = OFF
GO
USE [Bank]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Bank]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 19/02/2021 13:26:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[clientID] [int] IDENTITY(1,1) NOT NULL,
	[clientDUN] [char](9) NOT NULL,
	[clienteName] [varchar](255) NOT NULL,
	[clientSectorID] [tinyint] NOT NULL,
	[clientCreationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[clientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientSector]    Script Date: 19/02/2021 13:26:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientSector](
	[clientSectorID] [tinyint] NOT NULL,
	[clientSectorName] [varchar](50) NOT NULL,
	[clientSectorCreationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ClientSector] PRIMARY KEY CLUSTERED 
(
	[clientSectorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Portfolio]    Script Date: 19/02/2021 13:26:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Portfolio](
	[portfolioID] [int] IDENTITY(1,1) NOT NULL,
	[portfolioName] [varchar](100) NOT NULL,
	[portfolioComments] [varchar](255) NULL,
	[portfolioCreationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Portfolio] PRIMARY KEY CLUSTERED 
(
	[portfolioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PortfolioTrade]    Script Date: 19/02/2021 13:26:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PortfolioTrade](
	[portfolioID] [int] NOT NULL,
	[tradeID] [bigint] NOT NULL,
	[creationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_PortfolioTrade] PRIMARY KEY CLUSTERED 
(
	[portfolioID] ASC,
	[tradeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trade]    Script Date: 19/02/2021 13:26:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trade](
	[tradeID] [bigint] IDENTITY(1,1) NOT NULL,
	[clientID] [int] NOT NULL,
	[tradeValue] [money] NOT NULL,
	[tradeCreationDate] [datetime] NOT NULL,
	[tradeCategoryID] [tinyint] NULL,
 CONSTRAINT [PK_Trade] PRIMARY KEY CLUSTERED 
(
	[tradeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TradeCategory]    Script Date: 19/02/2021 13:26:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TradeCategory](
	[tradeCategoryID] [tinyint] NOT NULL,
	[tradeCategoryDescription] [varchar](100) NOT NULL,
	[tradeCategoryCreationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_TradeCategory] PRIMARY KEY CLUSTERED 
(
	[tradeCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TradeCategoryRule]    Script Date: 19/02/2021 13:26:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TradeCategoryRule](
	[tradeCategoryRule] [int] IDENTITY(1,1) NOT NULL,
	[tradeCategoryID] [tinyint] NOT NULL,
	[clientSectorID] [int] NOT NULL,
	[criteriaType] [varchar](2) NOT NULL,
	[criteriaValue] [money] NOT NULL,
	[tradeCategoryCreationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_TradeCategoryRule] PRIMARY KEY CLUSTERED 
(
	[tradeCategoryRule] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Client]    Script Date: 19/02/2021 13:26:34 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Client] ON [dbo].[Client]
(
	[clientDUN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
/****** Object:  Index [IX_Trade]    Script Date: 19/02/2021 13:26:34 ******/
CREATE NONCLUSTERED INDEX [IX_Trade] ON [dbo].[Trade]
(
	[clientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
/****** Object:  Index [IX_Trade_1]    Script Date: 19/02/2021 13:26:34 ******/
CREATE NONCLUSTERED INDEX [IX_Trade_1] ON [dbo].[Trade]
(
	[tradeCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TradeCategoryRule]    Script Date: 19/02/2021 13:26:34 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TradeCategoryRule] ON [dbo].[TradeCategoryRule]
(
	[clientSectorID] ASC,
	[criteriaValue] ASC,
	[criteriaType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_clientInsertDate]  DEFAULT (getdate()) FOR [clientCreationDate]
GO
ALTER TABLE [dbo].[ClientSector] ADD  CONSTRAINT [DF_ClientSector_clientSectorCreationDate]  DEFAULT (getdate()) FOR [clientSectorCreationDate]
GO
ALTER TABLE [dbo].[Portfolio] ADD  CONSTRAINT [DF_Portfolio_portfolioCreationDate]  DEFAULT (getdate()) FOR [portfolioCreationDate]
GO
ALTER TABLE [dbo].[PortfolioTrade] ADD  CONSTRAINT [DF_PortfolioTrade_creationDate]  DEFAULT (getdate()) FOR [creationDate]
GO
ALTER TABLE [dbo].[Trade] ADD  CONSTRAINT [DF_Trade_tradeCreationDate]  DEFAULT (getdate()) FOR [tradeCreationDate]
GO
ALTER TABLE [dbo].[TradeCategory] ADD  CONSTRAINT [DF_TradeCategory_tradeCategoryCreationDate]  DEFAULT (getdate()) FOR [tradeCategoryCreationDate]
GO
ALTER TABLE [dbo].[TradeCategoryRule] ADD  CONSTRAINT [DF_TradeCategoryRule_tradeCategoryCreationDate]  DEFAULT (getdate()) FOR [tradeCategoryCreationDate]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_ClientSector] FOREIGN KEY([clientSectorID])
REFERENCES [dbo].[ClientSector] ([clientSectorID])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_ClientSector]
GO
ALTER TABLE [dbo].[PortfolioTrade]  WITH CHECK ADD  CONSTRAINT [FK_PortfolioTrade_Portfolio] FOREIGN KEY([portfolioID])
REFERENCES [dbo].[Portfolio] ([portfolioID])
GO
ALTER TABLE [dbo].[PortfolioTrade] CHECK CONSTRAINT [FK_PortfolioTrade_Portfolio]
GO
ALTER TABLE [dbo].[PortfolioTrade]  WITH CHECK ADD  CONSTRAINT [FK_PortfolioTrade_Trade] FOREIGN KEY([tradeID])
REFERENCES [dbo].[Trade] ([tradeID])
GO
ALTER TABLE [dbo].[PortfolioTrade] CHECK CONSTRAINT [FK_PortfolioTrade_Trade]
GO
ALTER TABLE [dbo].[Trade]  WITH CHECK ADD  CONSTRAINT [FK_Trade_Client] FOREIGN KEY([clientID])
REFERENCES [dbo].[Client] ([clientID])
GO
ALTER TABLE [dbo].[Trade] CHECK CONSTRAINT [FK_Trade_Client]
GO
ALTER TABLE [dbo].[Trade]  WITH CHECK ADD  CONSTRAINT [FK_Trade_TradeCategory] FOREIGN KEY([tradeCategoryID])
REFERENCES [dbo].[TradeCategory] ([tradeCategoryID])
GO
ALTER TABLE [dbo].[Trade] CHECK CONSTRAINT [FK_Trade_TradeCategory]
GO
ALTER TABLE [dbo].[TradeCategoryRule]  WITH CHECK ADD  CONSTRAINT [FK_TradeCategoryRule_TradeCategory] FOREIGN KEY([tradeCategoryID])
REFERENCES [dbo].[TradeCategory] ([tradeCategoryID])
GO
ALTER TABLE [dbo].[TradeCategoryRule] CHECK CONSTRAINT [FK_TradeCategoryRule_TradeCategory]
GO
ALTER TABLE [dbo].[TradeCategoryRule]  WITH CHECK ADD  CONSTRAINT [CK_CriteriaType] CHECK  (([criteriaType]='=' OR [criteriaType]='<>' OR [criteriaType]='>=' OR [criteriaType]='<=' OR [criteriaType]='<' OR [criteriaType]='>'))
GO
ALTER TABLE [dbo].[TradeCategoryRule] CHECK CONSTRAINT [CK_CriteriaType]
GO


/****** Object:  Trigger [dbo].[tgrTradeInsert]    Script Date: 19/02/2021 13:26:34 ******/

/*
DEVELOPER			CREATION DATE				INDEX					COMMENTS
==============		======================		==================		====================================================================
SOUZA,EVERTON		19/02/2021 08:52									Automatic category definition.
																		The massive insertion is not allowed. 
*/

create TRIGGER dbo.tgrTradeInsert on dbo.Trade
   After INSERT
AS 
BEGIN
	
	SET NOCOUNT ON;

	--if @@NESTLEVEL>1 return 

    declare
		@tradeID int,
		@clientID int,
		@tradeValue money,
		@clientSectorID tinyint,
		@tradeCategoryID int


	select
		@tradeID = tradeID,
		@clientID = clientID,
		@tradeValue = tradeValue
	from
		inserted
		
	if not @clientID is null
	begin

		select
			@clientSectorID= clientSectorID
		from
			dbo.Client
		where
			clientID =@clientID 


		exec dbo.getCategoryIdByRule
			@clientSectorID,
			@tradeValue,
			@tradeCategoryID output

		if not @tradeCategoryID is null
		begin
			update
				dbo.trade
			set
				tradeCategoryID  = @tradeCategoryID 
			where
				tradeID =@tradeID
		end

	end

END
GO



/****** Object:  StoredProcedure [dbo].[CategoryTest]    Script Date: 19/02/2021 13:26:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
DEVELOPER			CREATION DATE				INDEX					COMMENTS
==============		======================		==================		====================================================================
SOUZA,EVERTON		19/02/2021 08:52									Tests of category definition...			
*/
CREATE procedure [dbo].[CategoryTest]

	@clientSectorID tinyint,
	@tradeValue money  
	

as
begin
	set nocount on

	declare	
		@tradeCategoryID int = null,
		@tradeCategoryIDCorrect int = null

	
	exec dbo.getCategoryIdByRule
		@clientSectorID,
		@tradeValue,
		@tradeCategoryID output
		 

	

	/*
	--Hardcoded business logic for tests purposes 

	Currently, there are three categories rules:

	LOWRISK: Trades with value less than 1,000,000 and client from Public Sector
	MEDIUMRISK: Trades with value greater than 1,000,000 and client from Public Sector
	HIGHRISK: Trades with value greater than 1,000,000 and client from Private Sector
 

	*/

	if @clientSectorID = 1 --Public Sector...
	begin
		
		if @tradeValue<=1000000 
		begin
			set @tradeCategoryIDCorrect = 3--LOWRISK
		end
		else
		begin
			set @tradeCategoryIDCorrect = 2--MEDIUMRISK
		end

		 
	end
	else
	begin


		if @clientSectorID = 2 --Private Sector...
		begin
		
			if @tradeValue>1000000 
			begin
				set @tradeCategoryIDCorrect = 1--HIGHRISK
			end
			else
			begin
				set @tradeCategoryIDCorrect = null ---Undefined...
			end
		 
		end

	end

	set nocount off

	select
		case when isnull(@tradeCategoryIDCorrect ,0)= isnull(@tradeCategoryID ,'') then 'Success' else 'Error' end as Result, 
		@tradeCategoryID as tradeCategoryIDFromSystem,
		@tradeCategoryIDCorrect as tradeCategoryIDCorrect,
		(select tradeCategoryDescription from TradeCategory where tradeCategoryID =@tradeCategoryID)  as tradeCategoryDescriptionFromSystem ,
		(select tradeCategoryDescription from TradeCategory where tradeCategoryID =@tradeCategoryIDCorrect)  as tradeCategoryDescriptionCorrect

end
GO
/****** Object:  StoredProcedure [dbo].[getCategoryIdByRule]    Script Date: 19/02/2021 13:26:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
DEVELOPER			CREATION DATE				INDEX					COMMENTS
==============		======================		==================		====================================================================
					19/02/2021 08:41									Defines the category of a trade using client sector and trade value.			
*/
CREATE procedure [dbo].[getCategoryIdByRule]

	@clientSectorID tinyint,
	@tradeValue money,
	@tradeCategoryID smallint =null output
as
begin
	
	set nocount on

	select
		@tradeCategoryID = a.tradeCategoryID
	from
		dbo.TradeCategory a inner join
		dbo.TradeCategoryRule b on
		a.tradeCategoryID = b.tradeCategoryID
	where
		@tradeValue > b.criteriaValue and
		b.clientSectorID = @clientSectorID and
		b.criteriaType='>'

	 
	if @tradeCategoryID is null
	begin

		select
			@tradeCategoryID = a.tradeCategoryID
		from
			dbo.TradeCategory a inner join
			dbo.TradeCategoryRule b on
			a.tradeCategoryID = b.tradeCategoryID
		where
			@tradeValue <= b.criteriaValue and
			b.clientSectorID = @clientSectorID and
			b.criteriaType='<='

	end

	if @tradeCategoryID is null
	begin

		select
			@tradeCategoryID = a.tradeCategoryID
		from
			dbo.TradeCategory a inner join
			dbo.TradeCategoryRule b on
			a.tradeCategoryID = b.tradeCategoryID
		where
			@tradeValue = b.criteriaValue and
			b.clientSectorID = @clientSectorID and
			b.criteriaType='='

	end


end
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data Universal Numbering.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Client', @level2type=N'COLUMN',@level2name=N'clientDUN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date and time of the trade transaction.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Trade', @level2type=N'COLUMN',@level2name=N'tradeCreationDate'
GO
USE [master]
GO
ALTER DATABASE [Bank] SET  READ_WRITE 
GO
