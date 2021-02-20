/*
DEVELOPER			CREATION DATE				INDEX					COMMENTS
==============		======================		==================		====================================================================
SOUZA,EVERTON		19/02/2021 08:52									Example of Tests of category definition...			
*/

exec dbo.CategoryTest

	2,--Private Sector
	1000001 --High Risk

exec dbo.CategoryTest

	1,--Publick Sector
	1000001 --Medium Risk


exec dbo.CategoryTest

	1,--Publick Sector
	1000000 --Low Risk