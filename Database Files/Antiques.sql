drop table Keywords
drop table Purchases
drop table UsersFavorites
drop table AuctionUsers
drop table ItemPhotos
drop table ItemVideos
drop table CatalogItems
drop table SaleDetails

PRINT 'Create Table AuctionUsers'
CREATE TABLE AuctionUsers
(
		UserId int identity(1,1),
		Firstname nvarchar(255),
		Surname nvarchar(255),
		Address nvarchar(255),
		Country nvarchar(255),
		Email nvarchar(255),
		Phone nvarchar(255),
		Username nvarchar(255),
		Password nvarchar(255),
		Primary Key(UserId)
)
go
insert into AuctionUsers (Firstname, Surname, Address, Country, Email, Phone, Username, Password) values ('John','McCarthy','47 Esmondale, Naas, Co. Kildare','Ireland','jonmcire@mail.com','085 7251930','jonmcire','letmein')

PRINT 'Create Table Users Favorites'
CREATE TABLE UsersFavorites
(
		FavId int identity(1,1),
		UserId int,
		ItemId int,
		Primary Key(FavId),
		FOREIGN KEY (UserId) REFERENCES AuctionUsers(UserId)
)
go
insert into UsersFavorites (UserId, ItemId) values (1,1)
insert into UsersFavorites (UserId, ItemId) values (1,2)
insert into UsersFavorites (UserId, ItemId) values (1,3)

PRINT 'Create Table SaleDetails'
CREATE TABLE SaleDetails
(
		SaleId int identity(1,1),
		SaleName nvarchar(255),
		SaleType nvarchar(255),
		SaleLocation nvarchar(255) NOT NULL,
		SaleDate datetime NOT NULL,
		SaleTime nvarchar(255) NOT NULL,
		ViewingCentre nvarchar(255),
		PriceAchieved float not null, 
		Primary Key(SaleId)
)
go
insert into SaleDetails (SaleName, SaleType, SaleLocation, SaleDate, SaleTime, ViewingCentre, PriceAchieved) values ('Auction 1','Fine Art','The Antiques Roadshow, CityWest, Dublin','11/12/2011','11:00','Citywest Business Campus',100)
insert into SaleDetails (SaleName, SaleType, SaleLocation, SaleDate, SaleTime, ViewingCentre, PriceAchieved) values ('Auction 2','Fine Art','The Antiques Roadshow, CityWest, Dublin','11/12/2011','11:00','Citywest Business Campus',100)
insert into SaleDetails (SaleName, SaleType, SaleLocation, SaleDate, SaleTime, ViewingCentre, PriceAchieved) values ('Auction 3','Fine Art','The Antiques Roadshow, CityWest, Dublin','11/12/2011','11:00','Citywest Business Campus',100)
insert into SaleDetails (SaleName, SaleType, SaleLocation, SaleDate, SaleTime, ViewingCentre, PriceAchieved) values ('Auction 4','Fine Art','The Antiques Roadshow, CityWest, Dublin','11/12/2011','11:00','Citywest Business Campus',100)
insert into SaleDetails (SaleName, SaleType, SaleLocation, SaleDate, SaleTime, ViewingCentre, PriceAchieved) values ('Auction 5','Fine Art','The Antiques Roadshow, CityWest, Dublin','11/12/2011','11:00','Citywest Business Campus',100)
insert into SaleDetails (SaleName, SaleType, SaleLocation, SaleDate, SaleTime, ViewingCentre, PriceAchieved) values ('Auction 6','Fine Art','The Antiques Roadshow, CityWest, Dublin','11/12/2011','11:00','Citywest Business Campus',100)
insert into SaleDetails (SaleName, SaleType, SaleLocation, SaleDate, SaleTime, ViewingCentre, PriceAchieved) values ('Auction 7','Fine Art','The Antiques Roadshow, CityWest, Dublin','11/12/2011','11:00','Citywest Business Campus',100)
insert into SaleDetails (SaleName, SaleType, SaleLocation, SaleDate, SaleTime, ViewingCentre, PriceAchieved) values ('Auction 8','Fine Art','The Antiques Roadshow, CityWest, Dublin','11/12/2011','11:00','Citywest Business Campus',100)
insert into SaleDetails (SaleName, SaleType, SaleLocation, SaleDate, SaleTime, ViewingCentre, PriceAchieved) values ('Auction 9','Fine Art','The Antiques Roadshow, CityWest, Dublin','11/12/2011','11:00','Citywest Business Campus',100)
insert into SaleDetails (SaleName, SaleType, SaleLocation, SaleDate, SaleTime, ViewingCentre, PriceAchieved) values ('Auction 10','Fine Art','The Antiques Roadshow, CityWest, Dublin','11/12/2011','11:00','Citywest Business Campus',100)
insert into SaleDetails (SaleName, SaleType, SaleLocation, SaleDate, SaleTime, ViewingCentre, PriceAchieved) values ('Auction 11','Fine Art','The Antiques Roadshow, CityWest, Dublin','11/12/2011','11:00','Citywest Business Campus',100)

PRINT 'Create Table CatalogItems'
CREATE TABLE CatalogItems
(
		CatalogItemsId int identity(1,1),
		Category nvarchar(255),
		SaleID int not null,
		LotNum int not null,
		ItemName nvarchar(255) NOT NULL,
		PriceEstimate nvarchar(255) NOT NULL,
		LotDescription text not null,
		ConditionReport text,
		Provenance text,
		Exhibited text not null,
		DeptInfo nvarchar(255),
		PriceAchieved float not null, 
		SaleDate datetime NOT NULL,
		Primary Key(CatalogItemsId),
		FOREIGN KEY (SaleID) REFERENCES SaleDetails(SaleId)
)
go
insert into CatalogItems (Category, SaleID, LotNum, ItemName, PriceEstimate, LotDescription, ConditionReport, Provenance, Exhibited, DeptInfo, PriceAchieved, SaleDate)
values ('Coins',1,1,'US half Dollar','€1000 to €2000','The Kennedy half dollar, first minted in 1964, is a currently struck fifty cent coin issued by the United States Mint. Intended as a memorial to the assassinated President John F. Kennedy, it was authorized by Congress just over a month after his death. Use of existing works by Mint sculptors Gilroy Roberts and Frank Gasparro allowed dies to be prepared quickly, and striking of the new coins began in January 1964.','Good Condition, slight damage on the edges','1 Owner!!','Citywest','Coin',0,'11/05/2011')

insert into CatalogItems (Category, SaleID, LotNum, ItemName, PriceEstimate, LotDescription, ConditionReport, Provenance, Exhibited, DeptInfo, PriceAchieved, SaleDate)
values ('Coins',1,2,'US Dollar','€2000 to €3000','From 1979 to 1981, and again in 1999, the Mint produced Anthony Dollars, depicting Susan B. Anthony, the first non-fictitious woman portrayed on circulating U.S. coinage. (Many earlier circulating coins featured images of women, but the women depicted were all non-specific representations of Liberty. Spains Queen Isabella was portrayed on the 1893 Columbian Exposition quarter dollar, but it was not intended as a circulating coin, although some did circulate.) The Anthony dollars, like the Eisenhower dollars, were made from a copper-nickel clad. The 1981 coins were issued for collectors only, but occasionally show up in circulation.','Well worn','No details','Citywest','Coin',0,'11/05/2011')

insert into CatalogItems (Category, SaleID, LotNum, ItemName, PriceEstimate, LotDescription, ConditionReport, Provenance, Exhibited, DeptInfo, PriceAchieved, SaleDate)
values ('Coins',1,3,'US Dollar','€3000 to €4000','From 1982 to 1987, and again in 1999, the Mint produced Anthony Dollars, depicting Susan B. Anthony, the first non-fictitious woman portrayed on circulating U.S. coinage. (Many earlier circulating coins featured images of women, but the women depicted were all non-specific representations of Liberty. Spains Queen Isabella was portrayed on the 1893 Columbian Exposition quarter dollar, but it was not intended as a circulating coin, although some did circulate.) The Anthony dollars, like the Eisenhower dollars, were made from a copper-nickel clad. The 1981 coins were issued for collectors only, but occasionally show up in circulation.','Well worn','No details','Citywest','Coin',0,'11/05/2011')

insert into CatalogItems (Category, SaleID, LotNum, ItemName, PriceEstimate, LotDescription, ConditionReport, Provenance, Exhibited, DeptInfo, PriceAchieved, SaleDate)
values ('Coins',1,4,'Irish 10 pence','€10 to €15','The ten pence coin was introduced on Decimal Day, February 15, 1971 and reused the design on the florin coin produced for the Irish Free State in 1928. Some florin coins remained in circulation until 1994, with the same nominal value, size and weight as the ten pence coin. In 1993 a replacement was struck at 2.2 centimeters diameter and 5.45 grams, this new coin kept the old design but incorporated some changes notably the location of the figure and reversing the main design of the salmon. The composition of the ten pence was 75% copper and 25% nickel.','Well handled','No details','Citywest','Coin',0,'11/05/2011')

insert into CatalogItems (Category, SaleID, LotNum, ItemName, PriceEstimate, LotDescription, ConditionReport, Provenance, Exhibited, DeptInfo, PriceAchieved, SaleDate)
values ('Coins',1,5,'English 20 pence','€20 to €40','The British decimal twenty pence (20p) coin – often pronounced "twenty pee" – was issued on 9 June 1982 to fill the obvious gap between the ten pence and fifty pence coins. It rapidly gained acceptance: as of March 2008 there were an estimated 2.3 billion 20p coins in circulation. The coin is minted from a cupronickel alloy of 84% copper and 16% nickel (unlike the other silver coins which are 75% copper, 25% nickel), weighs 5.00 grams and has a diameter of 21.4 millimetres. Like the fifty pence piece, the coin is not circular, but is seven-sided to aid identification. The sides are not straight but are curved so that the centre of curvature is the opposite apex of the coin – this is an equilateral curve (a curve of constant width) which allows the coin''s diameter to be consistently measured in vending machines and slot machines.','Well handled','No details','Citywest','Coin',0,'11/05/2011')

insert into CatalogItems (Category, SaleID, LotNum, ItemName, PriceEstimate, LotDescription, ConditionReport, Provenance, Exhibited, DeptInfo, PriceAchieved, SaleDate)
values ('Coins',1,6,'US half Dollar','€7000 to €8000','The Kennedy half dollar, first minted in 1964, is a currently struck fifty cent coin issued by the United States Mint. Intended as a memorial to the assassinated President John F. Kennedy, it was authorized by Congress just over a month after his death. Use of existing works by Mint sculptors Gilroy Roberts and Frank Gasparro allowed dies to be prepared quickly, and striking of the new coins began in January 1964.','Good Condition, slight damage on the edges','Mint','Citywest','Coin',0,'11/05/2011')

insert into CatalogItems (Category, SaleID, LotNum, ItemName, PriceEstimate, LotDescription, ConditionReport, Provenance, Exhibited, DeptInfo, PriceAchieved, SaleDate)
values ('Coins',1,7,'Churchill 1965 Coin','€1000 to €2000','A British 1965 cupro-nickel Crown (Five Shillings)(Elizabeth II)(Churchill Commemorative - Satin finish "VIP" Specimen), uncirculated and in absolute mint condition ','Good Condition','1 Owner!!','Citywest','Coin',0,'11/05/2011')

insert into CatalogItems (Category, SaleID, LotNum, ItemName, PriceEstimate, LotDescription, ConditionReport, Provenance, Exhibited, DeptInfo, PriceAchieved, SaleDate)
values ('Coins',1,8,'Churchill 1965 Coin','€1000 to €2000','A British 1965 cupro-nickel Crown (Five Shillings)(Elizabeth II)(Churchill Commemorative - Satin finish "VIP" Specimen), uncirculated and in absolute mint condition ','Good Condition','1 Owner!!','Citywest','Coin',0,'11/05/2011')

insert into CatalogItems (Category, SaleID, LotNum, ItemName, PriceEstimate, LotDescription, ConditionReport, Provenance, Exhibited, DeptInfo, PriceAchieved, SaleDate)
values ('Coins',1,9,'US Dollar','€2000 to €3000','From 1982 to 1987, and again in 1999, the Mint produced Anthony Dollars, depicting Susan B. Anthony, the first non-fictitious woman portrayed on circulating U.S. coinage. (Many earlier circulating coins featured images of women, but the women depicted were all non-specific representations of Liberty. Spains Queen Isabella was portrayed on the 1893 Columbian Exposition quarter dollar, but it was not intended as a circulating coin, although some did circulate.) The Anthony dollars, like the Eisenhower dollars, were made from a copper-nickel clad. The 1981 coins were issued for collectors only, but occasionally show up in circulation.','Well worn','No details','Citywest','Coin',0,'11/05/2011')

insert into CatalogItems (Category, SaleID, LotNum, ItemName, PriceEstimate, LotDescription, ConditionReport, Provenance, Exhibited, DeptInfo, PriceAchieved, SaleDate)
values ('Coins',1,10,'Queen Victoria Coin','€30000 to €40000','Beginning in 1858, various colonies of British North America started issuing their own coins denominated in cents, featuring the likeness of Queen Victoria on the obverse. These replaced the sterling coins previously in circulation. The Province of Canada was the first to issue decimal coins.','Well worn','No details','Citywest','Coin',0,'11/05/2011')

insert into CatalogItems (Category, SaleID, LotNum, ItemName, PriceEstimate, LotDescription, ConditionReport, Provenance, Exhibited, DeptInfo, PriceAchieved, SaleDate)
values ('Coins',1, 11,'US Dollar','€3000 to €4000','From 1982 to 1987, and again in 1999, the Mint produced Anthony Dollars, depicting Susan B. Anthony, the first non-fictitious woman portrayed on circulating U.S. coinage. (Many earlier circulating coins featured images of women, but the women depicted were all non-specific representations of Liberty. Spains Queen Isabella was portrayed on the 1893 Columbian Exposition quarter dollar, but it was not intended as a circulating coin, although some did circulate.) The Anthony dollars, like the Eisenhower dollars, were made from a copper-nickel clad. The 1981 coins were issued for collectors only, but occasionally show up in circulation.','Perfect Mint','No details','Citywest','Coin',0,'11/05/2011')

insert into CatalogItems (Category, SaleID, LotNum, ItemName, PriceEstimate, LotDescription, ConditionReport, Provenance, Exhibited, DeptInfo, PriceAchieved, SaleDate)
values ('Coins',1, 12,'US Dollar','€3000 to €4000','From 1982 to 1987, and again in 1999, the Mint produced Anthony Dollars, depicting Susan B. Anthony, the first non-fictitious woman portrayed on circulating U.S. coinage. (Many earlier circulating coins featured images of women, but the women depicted were all non-specific representations of Liberty. Spains Queen Isabella was portrayed on the 1893 Columbian Exposition quarter dollar, but it was not intended as a circulating coin, although some did circulate.) The Anthony dollars, like the Eisenhower dollars, were made from a copper-nickel clad. The 1981 coins were issued for collectors only, but occasionally show up in circulation.','Good Condition','No details','Citywest','Coin',0,'11/05/2011')

PRINT 'Create Table Key Words'
CREATE TABLE Keywords
(
		KeywordsId int identity(1,1),
		CatalogItemsId int,
		Keyword nvarchar(255),
		Primary Key(KeywordsId),
		FOREIGN KEY (CatalogItemsId) REFERENCES CatalogItems(CatalogItemsId)
)
go
insert into Keywords (CatalogItemsId,Keyword) values (1, 'Art')

PRINT 'Create Table Photos'
CREATE TABLE ItemPhotos
(
		ItemPhotos int identity(1,1),
		CatalogItemsId int,
		Photo nvarchar(255),
		Primary Key(ItemPhotos),
		FOREIGN KEY (CatalogItemsId) REFERENCES CatalogItems(CatalogItemsId)
)
go
insert into ItemPhotos (CatalogItemsId, Photo) values (1, 'Coin1.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (1, 'Coin2.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (2, 'Coin3.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (2, 'Coin4.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (3, 'Coin5.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (3, 'Coin6.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (4, 'Coin7.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (4, 'Coin8.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (5, 'Coin9.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (5, 'Coin10.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (6, 'Coin11.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (6, 'Coin12.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (7, 'Coin13.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (7, 'Coin14.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (8, 'Coin15.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (8, 'Coin16.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (9, 'Coin17.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (9, 'Coin18.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (10, 'Coin17.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (10, 'Coin18.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (11, 'Coin21.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (11, 'Coin22.jpg')

insert into ItemPhotos (CatalogItemsId, Photo) values (1, 'Coin1.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (1, 'Coin2.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (2, 'Coin3.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (2, 'Coin4.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (3, 'Coin5.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (3, 'Coin6.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (4, 'Coin7.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (4, 'Coin8.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (5, 'Coin9.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (5, 'Coin10.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (6, 'Coin11.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (6, 'Coin12.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (7, 'Coin13.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (7, 'Coin14.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (8, 'Coin15.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (8, 'Coin16.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (9, 'Coin17.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (9, 'Coin18.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (10, 'Coin17.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (10, 'Coin18.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (11, 'Coin21.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (11, 'Coin22.jpg')

insert into ItemPhotos (CatalogItemsId, Photo) values (1, 'Coin1.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (1, 'Coin2.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (2, 'Coin3.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (2, 'Coin4.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (3, 'Coin5.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (3, 'Coin6.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (4, 'Coin7.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (4, 'Coin8.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (5, 'Coin9.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (5, 'Coin10.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (6, 'Coin11.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (6, 'Coin12.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (7, 'Coin13.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (7, 'Coin14.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (8, 'Coin15.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (8, 'Coin16.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (9, 'Coin17.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (9, 'Coin18.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (10, 'Coin17.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (10, 'Coin18.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (11, 'Coin21.jpg')
insert into ItemPhotos (CatalogItemsId, Photo) values (11, 'Coin22.jpg')


PRINT 'Create Table Videos'
CREATE TABLE ItemVideos
(
		ItemVideos int identity(1,1),
		CatalogItemsId int,
		Video nvarchar(255),
		Primary Key(ItemVideos),
		FOREIGN KEY (CatalogItemsId) REFERENCES CatalogItems(CatalogItemsId)
)
go

insert into ItemVideos (CatalogItemsId, Video) values (3, 'M2U00070.mpg')
insert into ItemVideos (CatalogItemsId, Video) values (9, 'M2U00072.mpg')
insert into ItemVideos (CatalogItemsId, Video) values (10, 'M2U00071.mpg')
insert into ItemVideos (CatalogItemsId, Video) values (1, 'M2U00073.mpg')
insert into ItemVideos (CatalogItemsId, Video) values (7, 'M2U00074.mpg')
insert into ItemVideos (CatalogItemsId, Video) values (6, 'M2U00075.mpg')
insert into ItemVideos (CatalogItemsId, Video) values (5, 'M2U00076.mpg')
insert into ItemVideos (CatalogItemsId, Video) values (2, 'M2U00077.mpg')
insert into ItemVideos (CatalogItemsId, Video) values (4, 'M2U00078.mpg')
insert into ItemVideos (CatalogItemsId, Video) values (11, 'M2U00079.mpg')

PRINT 'Create Table Purchases'
CREATE TABLE Purchases
(
		PurchaseId int identity(1,1),
		UserId int,
		CatalogItemsId int,
		PriceAchieved money not null,
		SaleDate datetime NOT NULL,
		Primary Key(PurchaseId),
		FOREIGN KEY (UserId) REFERENCES AuctionUsers(UserId),
		FOREIGN KEY (CatalogItemsId) REFERENCES CatalogItems(CatalogItemsId)
)
go