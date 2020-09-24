SET @@session.sql_mode = '';

REPLACE INTO `oxpricealarm` (`OXID`, `OXSHOPID`, `OXUSERID`, `OXEMAIL`, `OXARTID`, `OXPRICE`, `OXCURRENCY`, `OXLANG`, `OXINSERT`, `OXSENDED`, `OXTIMESTAMP`) VALUES
('_test_wished_price_8_',	2,	'123ad3b5380202966df6ff128e9eecaq',	'user@oxid-esales.com',	'_test_product_5_',	10,	'EUR',	1,	'2020-05-26 00:00:00',	'0000-00-00 00:00:00',	'2020-05-26 11:48:20');

UPDATE `oxarticles` SET `OXMAPID` = 3333, `OXVPE` = 1 WHERE OXID = '_test_product_wished_price_3_';
UPDATE `oxarticles` SET `OXMAPID` = 4444, `OXVPE` = 1 WHERE OXID = '_test_product_wished_price_4_';
UPDATE `oxarticles` SET `OXMAPID` = 1234, `OXVPE` = 1 WHERE OXID = '_test_product_for_rating_5_';
UPDATE `oxarticles` SET `OXMAPID` = 2345, `OXVPE` = 1 WHERE OXID = '_test_product_for_rating_6_';
UPDATE `oxarticles` SET `OXMAPID` = 4567, `OXVPE` = 1 WHERE OXID = '_test_product_for_rating_avg';
UPDATE `oxarticles` SET `OXMAPID` = 1123, `OXVPE` = 1 WHERE OXID='_test_product_for_wish_list';
UPDATE `oxarticles` SET `OXMAPID` = 2123, `OXVPE` = 1, `OXISDOWNLOADABLE` = '1' WHERE OXID='_test_product_for_basket';
REPLACE INTO `oxarticles` (`OXID`, `OXMAPID`, `OXSHOPID`, `OXPARENTID`, `OXACTIVE`, `OXHIDDEN`, `OXACTIVEFROM`, `OXACTIVETO`, `OXARTNUM`, `OXEAN`, `OXDISTEAN`, `OXMPN`, `OXTITLE`, `OXSHORTDESC`, `OXPRICE`, `OXBLFIXEDPRICE`, `OXPRICEA`, `OXPRICEB`, `OXPRICEC`, `OXBPRICE`, `OXTPRICE`, `OXUNITNAME`, `OXUNITQUANTITY`, `OXEXTURL`, `OXURLDESC`, `OXURLIMG`, `OXVAT`, `OXTHUMB`, `OXICON`, `OXPIC1`, `OXPIC2`, `OXPIC3`, `OXPIC4`, `OXPIC5`, `OXPIC6`, `OXPIC7`, `OXPIC8`, `OXPIC9`, `OXPIC10`, `OXPIC11`, `OXPIC12`, `OXWEIGHT`, `OXSTOCK`, `OXSTOCKFLAG`, `OXSTOCKTEXT`, `OXNOSTOCKTEXT`, `OXDELIVERY`, `OXINSERT`, `OXTIMESTAMP`, `OXLENGTH`, `OXWIDTH`, `OXHEIGHT`, `OXFILE`, `OXSEARCHKEYS`, `OXTEMPLATE`, `OXQUESTIONEMAIL`, `OXISSEARCH`, `OXISCONFIGURABLE`, `OXVARNAME`, `OXVARSTOCK`, `OXVARCOUNT`, `OXVARSELECT`, `OXVARMINPRICE`, `OXVARMAXPRICE`, `OXVARNAME_1`, `OXVARSELECT_1`, `OXVARNAME_2`, `OXVARSELECT_2`, `OXVARNAME_3`, `OXVARSELECT_3`, `OXTITLE_1`, `OXSHORTDESC_1`, `OXURLDESC_1`, `OXSEARCHKEYS_1`, `OXTITLE_2`, `OXSHORTDESC_2`, `OXURLDESC_2`, `OXSEARCHKEYS_2`, `OXTITLE_3`, `OXSHORTDESC_3`, `OXURLDESC_3`, `OXSEARCHKEYS_3`, `OXBUNDLEID`, `OXFOLDER`, `OXSUBCLASS`, `OXSTOCKTEXT_1`, `OXSTOCKTEXT_2`, `OXSTOCKTEXT_3`, `OXNOSTOCKTEXT_1`, `OXNOSTOCKTEXT_2`, `OXNOSTOCKTEXT_3`, `OXSORT`, `OXSOLDAMOUNT`, `OXNONMATERIAL`, `OXFREESHIPPING`, `OXREMINDACTIVE`, `OXREMINDAMOUNT`, `OXAMITEMID`, `OXAMTASKID`, `OXVENDORID`, `OXMANUFACTURERID`, `OXSKIPDISCOUNTS`, `OXORDERINFO`, `OXPIXIEXPORT`, `OXPIXIEXPORTED`, `OXVPE`, `OXRATING`, `OXRATINGCNT`, `OXMINDELTIME`, `OXMAXDELTIME`, `OXDELTIMEUNIT`, `OXUPDATEPRICE`, `OXUPDATEPRICEA`, `OXUPDATEPRICEB`, `OXUPDATEPRICEC`, `OXUPDATEPRICETIME`, `OXISDOWNLOADABLE`, `OXSHOWCUSTOMAGREEMENT`) VALUES
('_test_product_wp1_',	6666,	1,	'',	1,	0,	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	'123',	'',	'',	'',	'Product wp1',	'',	15,	0,	0,	0,	0,	0,	0,	'',	0,	'',	'',	'',	NULL,	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	0,	0,	1,	'',	'',	'0000-00-00',	'2020-05-25',	'2020-05-25 09:25:26',	0,	0,	0,	'',	'',	'',	'',	1,	0,	'',	0,	0,	'',	10,	10,	'',	'',	'',	'',	'',	'',	'Product 5',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'oxarticle',	'',	'',	'',	'',	'',	'',	0,	0,	0,	0,	0,	0,	'',	'0',	'',	'',	0,	'',	0,	'0000-00-00 00:00:00',	1,	0,	0,	0,	0,	'',	0,	0,	0,	0,	'0000-00-00 00:00:00',	0,	1),
('_test_product_wp2_',	7777,	2,	'',	1,	0,	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	'213',	'',	'',	'',	'Product wp2',	'',	15,	0,	0,	0,	0,	0,	0,	'',	0,	'',	'',	'',	NULL,	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	0,	0,	1,	'',	'',	'0000-00-00',	'2020-05-25',	'2020-05-25 09:25:26',	0,	0,	0,	'',	'',	'',	'',	1,	0,	'',	0,	0,	'',	10,	10,	'',	'',	'',	'',	'',	'',	'Product 5',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'oxarticle',	'',	'',	'',	'',	'',	'',	0,	0,	0,	0,	0,	0,	'',	'0',	'',	'',	0,	'',	0,	'0000-00-00 00:00:00',	1,	0,	0,	0,	0,	'',	0,	0,	0,	0,	'0000-00-00 00:00:00',	0,	1),
('_test_product_5_',	5555,	2,	'',	1,	0,	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	'555',	'',	'',	'',	'Product 5',	'',	15,	0,	0,	0,	0,	0,	0,	'',	0,	'',	'',	'',	NULL,	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	0,	0,	1,	'',	'',	'0000-00-00',	'2020-05-25',	'2020-05-25 09:25:26',	0,	0,	0,	'',	'',	'',	'',	1,	0,	'',	0,	0,	'',	10,	10,	'',	'',	'',	'',	'',	'',	'Product 5',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'oxarticle',	'',	'',	'',	'',	'',	'',	0,	0,	0,	0,	0,	0,	'',	'0',	'',	'',	0,	'',	0,	'0000-00-00 00:00:00',	1,	0,	0,	0,	0,	'',	0,	0,	0,	0,	'0000-00-00 00:00:00',	0,	1);

REPLACE INTO `oxarticles2shop` (`OXSHOPID`, `OXMAPOBJECTID`, `OXTIMESTAMP`) VALUES
(1, 3333, '2020-01-01 00:00:00'),
(1, 4444, '2020-01-01 00:00:00'),
(2, 5555, '2020-01-01 00:00:00'),
(1, 6666, '2020-01-01 00:00:00'),
(2, 7777, '2020-01-01 00:00:00'),
(1, 1234, '2020-01-01 00:00:00'),
(2, 1234, '2020-01-01 00:00:00'),
(1, 2345, '2020-01-01 00:00:00'),
(1, 1123, '2020-01-01 00:00:00'),
(1, 2123, '2020-01-01 00:00:00'),
(1, 4567, '2020-01-01 00:00:00'),
(2, 2123, '2020-01-01 00:00:00');

REPLACE INTO `oxuser` (`OXID`, `OXACTIVE`, `OXRIGHTS`, `OXSHOPID`, `OXUSERNAME`, `OXPASSWORD`, `OXPASSSALT`, `OXCUSTNR`, `OXUSTID`, `OXUSTIDSTATUS`, `OXCOMPANY`, `OXFNAME`, `OXLNAME`, `OXSTREET`, `OXSTREETNR`, `OXADDINFO`, `OXCITY`, `OXCOUNTRYID`, `OXSTATEID`, `OXZIP`, `OXFON`, `OXFAX`, `OXSAL`, `OXBONI`, `OXCREATE`, `OXREGISTER`, `OXPRIVFON`, `OXMOBFON`, `OXBIRTHDATE`, `OXURL`, `OXLDAPKEY`, `OXWRONGLOGINS`, `OXUPDATEKEY`, `OXUPDATEEXP`, `OXPOINTS`) VALUES
('245ad3b5380202966df6ff128e9eecaq', 1, 'user', 1, 'otheruser@oxid-esales.com',  '$2y$10$b186f117054b700a89de9uXDzfahkizUucitfPov3C2cwF5eit2M2', 'b186f117054b700a89de929ce90c6aef', 8, '', 1, '', 'Marc', 'Muster', 'Hauptstr.', '13', '', 'Freiburg', 'a7c40f631fc920687.20179984', '', '79098', '', '', 'MR', 1000, '2011-02-01 08:41:25', '2011-02-01 08:41:25', '', '', '0000-00-00', '', '', 0, '', 0, 0),
('123ad3b5380202966df6ff128e9eecaq', 1, 'user', 2, 'user@oxid-esales.com',  '$2y$10$b186f117054b700a89de9uXDzfahkizUucitfPov3C2cwF5eit2M2', 'b186f117054b700a89de929ce90c6aef', 8, '', 1, '', 'Marc', 'Muster', 'Hauptstr.', '13', '', 'Freiburg', 'a7c40f631fc920687.20179984', '', '79098', '', '', 'MR', 1000, '2011-02-01 08:41:25', '2011-02-01 08:41:25', '', '', '1984-12-22', '', '', 0, '', 0, 0),
('309db395b6c85c3881fcb9b437a73dd6', 1, 'user', 2, 'existinguser@oxid-esales.com',  '$2y$10$b186f117054b700a89de9uXDzfahkizUucitfPov3C2cwF5eit2M2', 'b186f117054b700a89de929ce90c6aef', 8, '', 1, '', 'Marc', 'Muster', 'Hauptstr.', '13', '', 'Freiburg', 'a7c40f631fc920687.20179984', '', '79098', '', '', 'MR', 1000, '2011-02-01 08:41:25', '2011-02-01 08:41:25', '', '', '0000-00-00', '', '', 0, '', 0, 0),
('309db395b6c85c3881fcb9b437a73dd7', 1, 'user', 1, 'tempuser@oxid-esales.com',  '$2y$10$b186f117054b700a89de9uXDzfahkizUucitfPov3C2cwF5eit2M2', 'b186f117054b700a89de929ce90c6aef', 8, '', 1, '', 'Marc', 'Muster', 'Hauptstr.', '13', '', 'Freiburg', 'a7c40f631fc920687.20179984', '', '79098', '', '', 'MR', 1000, '2011-02-01 08:41:25', '2011-02-01 08:41:25', '', '', '0000-00-00', '', '', 0, '', 0, 0),
('309db395b6c85c3881fcb9b437a73dd8', 1, 'user', 2, 'tempuser@oxid-esales.com',  '$2y$10$b186f117054b700a89de9uXDzfahkizUucitfPov3C2cwF5eit2M2', 'b186f117054b700a89de929ce90c6aef', 8, '', 1, '', 'Marc', 'Muster', 'Hauptstr.', '13', '', 'Freiburg', 'a7c40f631fc920687.20179984', '', '79098', '', '', 'MR', 1000, '2011-02-01 08:41:25', '2011-02-01 08:41:25', '', '', '0000-00-00', '', '', 0, '', 0, 0),
('309db395b6c85c3881fcb9b437a73dd9', 1, 'user', 2, 'tempMalluser@oxid-esales.com',  '$2y$10$b186f117054b700a89de9uXDzfahkizUucitfPov3C2cwF5eit2M2', 'b186f117054b700a89de929ce90c6aef', 8, '', 1, '', 'Marc', 'Muster', 'Hauptstr.', '13', '', 'Freiburg', 'a7c40f631fc920687.20179984', '', '79098', '', '', 'MR', 1000, '2011-02-01 08:41:25', '2011-02-01 08:41:25', '', '', '0000-00-00', '', '', 0, '', 0, 0);

REPLACE INTO `oxratings` (`OXID`, `OXSHOPID`, `OXUSERID`, `OXTYPE`, `OXOBJECTID`, `OXRATING`) VALUES
('test_rating_8_', 2, '123ad3b5380202966df6ff128e9eecaq', 'oxarticle', '_test_product_5_', 4);
REPLACE INTO oxconfig (OXID, OXSHOPID, OXVARNAME, OXVARTYPE, OXVARVALUE) SELECT
MD5(RAND()), 2, OXVARNAME, OXVARTYPE, OXVARVALUE from oxconfig;

UPDATE `oxshops` SET `OXORDEREMAIL`='reply@myoxideshop.com' WHERE `OXID`='2';

REPLACE INTO `oxaddress` (`OXID`, `OXUSERID`, `OXFNAME`, `OXLNAME`, `OXSTREET`, `OXSTREETNR`, `OXCITY`, `OXCOUNTRY`, `OXCOUNTRYID`, `OXZIP`, `OXSAL`, `OXTIMESTAMP`) VALUES
('test_delivery_address_shop_2', '123ad3b5380202966df6ff128e9eecaq', 'Marc2', 'Muster2', 'Hauptstr2', '2', 'Freiburg2', 'Germany2', 'a7c40f631fc920687.20179984', '790982', 'MR', '2020-07-14 14:12:48');

REPLACE INTO `oxuserbaskets` (`OXID`, `OXUSERID`, `OXTITLE`, `OXPUBLIC`) VALUES
('_test_shop2_basket_public', '123ad3b5380202966df6ff128e9eecaq', 'buy_these', true);

REPLACE INTO `oxuserbasketitems` (`OXID`, `OXBASKETID`, `OXARTID`, `OXAMOUNT`, `OXSELLIST`, `OXPERSPARAM`) VALUES
('_test_shop2_basket_item_1', '_test_shop2_basket_public', '_test_product_for_basket', 1, 'N;', '');

REPLACE INTO `oxorder` (`OXID`, `OXSHOPID`, `OXUSERID`, `OXORDERDATE`, `OXORDERNR`, `OXBILLCOMPANY`, `OXBILLEMAIL`, `OXBILLFNAME`,
 `OXBILLLNAME`, `OXBILLSTREET`, `OXBILLSTREETNR`, `OXBILLADDINFO`, `OXBILLUSTID`, `OXBILLUSTIDSTATUS`, `OXBILLCITY`,
  `OXBILLCOUNTRYID`, `OXBILLSTATEID`, `OXBILLZIP`, `OXBILLFON`, `OXBILLFAX`, `OXBILLSAL`, `OXDELCOMPANY`, `OXDELFNAME`,
  `OXDELLNAME`, `OXDELSTREET`, `OXDELSTREETNR`, `OXDELADDINFO`, `OXDELCITY`, `OXDELCOUNTRYID`, `OXDELSTATEID`, `OXDELZIP`,
   `OXDELFON`, `OXDELFAX`, `OXDELSAL`, `OXPAYMENTID`, `OXPAYMENTTYPE`, `OXTOTALNETSUM`, `OXTOTALBRUTSUM`, `OXTOTALORDERSUM`,
   `OXARTVAT1`, `OXARTVATPRICE1`, `OXARTVAT2`, `OXARTVATPRICE2`, `OXDELCOST`, `OXDELVAT`, `OXPAYCOST`, `OXPAYVAT`, `OXWRAPCOST`,
   `OXWRAPVAT`, `OXGIFTCARDCOST`, `OXGIFTCARDVAT`, `OXCARDID`, `OXCARDTEXT`, `OXDISCOUNT`, `OXEXPORT`, `OXBILLNR`, `OXBILLDATE`,
    `OXTRACKCODE`, `OXSENDDATE`, `OXREMARK`, `OXVOUCHERDISCOUNT`, `OXCURRENCY`, `OXCURRATE`, `OXFOLDER`, `OXTRANSID`, `OXPAYID`,
    `OXXID`, `OXPAID`, `OXSTORNO`, `OXIP`, `OXTRANSSTATUS`, `OXLANG`, `OXINVOICENR`, `OXDELTYPE`, `OXPIXIEXPORT`, `OXTIMESTAMP`,
    `OXISNETTOMODE`) VALUES
('7d090db46a124f48cb7e6836ceef3f66',1,'e7af1c3b786fd02906ccd75698f4e6b9','2011-03-30 10:55:13',1,'bill company','billuser@oxid-esales.com','Marc','Muster','Hauptstr.','13','additional bill info','bill vat id',1,'Freiburg','a7c40f631fc920687.20179984','BW','79098','1234','4567','MR','','','','','','','','','','','','','','7d011a153655ef215558cddd43dc65a8','oxidinvoice',1639.15,2108.39,1950.59,19,311.44,0,0,0,19,0,0,0,0,0,0,'','',157.8,0,'7661','2020-03-31','track_me','2020-08-24 11:11:11','Hier können Sie uns noch etwas mitteilen.',0,'EUR',1,'ORDERFOLDER_NEW','','','','2020-04-01 12:12:12',0,'','OK',0,661,'oxidstandard',0,'2020-08-21 09:39:46',0),
('8c69bc776dd339a83d863c4f64693bb6',1,'e7af1c3b786fd02906ccd75698f4e6b9','2019-08-21 11:41:41',2,'bill company','billuser@oxid-esales.com','Marc','Muster','Hauptstr.','13','additional bill info','bill vat id',1,'Freiburg','a7c40f631fc920687.20179984','BW','79098','1234','4567','MR','','','','','','','','','','','','','','5b4b2226735704859055607e98a257e7','oxidcashondel',25.13,29.9,46.75,19,4.77,0,0,3.9,19,7.5,19,2.95,18.951612903226,2.5,19,'81b40cf076351c229.14252649','asdfasdf',0,0,'7662','2020-08-23','tick','2020-08-24 11:11:12','',0,'EUR',1,'ORDERFOLDER_NEW','','','','0000-00-00 00:00:00',0,'','OK',1,662,'oxidstandard',0,'2020-08-21 09:41:41',0),
('0c99bad495d00254a936ccee2391f763',1,'e7af1c3b786fd02906ccd75698f4e6b9','2020-04-22 14:07:12',3,'bill company','billuser@oxid-esales.com','Marc','Muster','Hauptstr.','13','additional bill info','bill vat id',1,'Freiburg','a7c40f631fc920687.20179984','BW','79098','1234','4567','MR','del company','Marcia','Pattern','Nebenstraße','123','del addinfo','Freiburg','a7c40f631fc920687.20179984','HH','79106','04012345678','04012345679','MRS','c3260a603ed4e2d3b01981cbc05e8dfd','oxidinvoice',226.05,269,269,19,42.95,0,0,0,19,0,0,0,0,0,19,'','',0,0,'7663','2020-08-24','trick','2020-08-24 11:11:13','Hej, greetings to graphQL! ',0,'EUR',1,'ORDERFOLDER_NEW','','','','0000-00-00 00:00:00',0,'','OK',1,663,'oxidstandard',0,'2020-08-21 12:07:12',0),
('0c99bad495d00254a936ccee2391f637',2,'e7af1c3b786fd02906ccd75698f4e6b9','2020-04-22 14:07:12',5,'bill company','billuser@oxid-esales.com','Marc','Muster','Hauptstr.','13','additional bill info','bill vat id',1,'Freiburg','a7c40f631fc920687.20179984','BW','79098','1234','4567','MR','del company','Marcia','Pattern','Nebenstraße','123','del addinfo','Freiburg','a7c40f631fc920687.20179984','HH','79106','04012345678','04012345679','MRS','invoice_order_payment','oxidinvoice',226.05,269,269,19,42.95,0,0,0,19,0,0,0,0,0,19,'','',0,0,'7663','2020-08-24','trick','2020-08-24 11:11:13','Hej, greetings to graphQL! ',0,'EUR',1,'ORDERFOLDER_NEW','','','','0000-00-00 00:00:00',0,'','OK',1,663,'oxidstandard',0,'2020-08-21 12:07:12',0),
('85ecbd1d5e56172ff5af6917894d4a31',2,'123ad3b5380202966df6ff128e9eecaq','2015-07-02 07:31:37',6,'','user@oxid-esales.com','Marc','Muster','Hauptstr.','13','','',1,'Freiburg','a7c40f631fc920687.20179984','','79098','','','MR','','','','','','','','','','','','','','fada11bc485e15e5b999c7776ef90592','oxempty',8.4,10,10,19,1.6,0,0,0,19,0,0,0,0,0,19,'','',0,0,'','0000-00-00','','0000-00-00 00:00:00','',0,'EUR',1,'ORDERFOLDER_NEW','','','','0000-00-00 00:00:00',0,'','OK',1,0,'',0,'2020-09-02 07:31:37',0),
('85ecbd1d5e56172ff5af6917894d4a32',2,'245ad3b5380202966df6ff128e9eecaq','2015-07-02 07:31:37',7,'','otheruser@oxid-esales.com','Marc','Muster','Hauptstr.','13','','',1,'Freiburg','a7c40f631fc920687.20179984','','79098','','','MR','','','','','','','','','','','','','','fada11bc485e15e5b999c7776ef90592','oxempty',8.4,10,10,19,1.6,0,0,0,19,0,0,0,0,0,19,'','',0,0,'','0000-00-00','','0000-00-00 00:00:00','',0,'EUR',1,'ORDERFOLDER_NEW','','','','0000-00-00 00:00:00',0,'','OK',1,0,'',0,'2020-09-02 07:31:37',0);



UPDATE `oxorder` SET `OXBILLUSTID` = 'bill vat id', `OXBILLUSTIDSTATUS` = 1, `OXPIXIEXPORT` = 0 WHERE OXID = '8c726d3f42ff1a6ea2828d5f309de881';

REPLACE INTO `oxorderarticles` (`OXID`, `OXORDERID`, `OXAMOUNT`, `OXARTID`, `OXARTNUM`, `OXTITLE`, `OXSHORTDESC`, `OXSELVARIANT`, `OXNETPRICE`, `OXBRUTPRICE`, `OXVATPRICE`, `OXVAT`, `OXPERSPARAM`, `OXPRICE`, `OXBPRICE`, `OXNPRICE`, `OXWRAPID`, `OXEXTURL`, `OXURLDESC`, `OXURLIMG`, `OXTHUMB`, `OXPIC1`, `OXPIC2`, `OXPIC3`, `OXPIC4`, `OXPIC5`, `OXWEIGHT`, `OXSTOCK`, `OXDELIVERY`, `OXINSERT`, `OXTIMESTAMP`, `OXLENGTH`, `OXWIDTH`, `OXHEIGHT`, `OXFILE`, `OXSEARCHKEYS`, `OXTEMPLATE`, `OXQUESTIONEMAIL`, `OXISSEARCH`, `OXFOLDER`, `OXSUBCLASS`, `OXSTORNO`, `OXORDERSHOPID`, `OXERPSTATUS`, `OXISBUNDLE`) VALUES
('677688370a4a64d8336107bcf174fdeb','85ecbd1d5e56172ff5af6917894d4a31',1,'_test_product_for_basket','621','Product 1','','',8.4,10,1.6,19,'',10,10,8.4,'','','','','','','','','','',0,0,'0000-00-00','2020-05-25','2015-07-02 07:31:37',0,0,0,'','','','',1,'','oxarticle',0,2,'',0),
('677688370a4a64d8336107bcf174fde1','85ecbd1d5e56172ff5af6917894d4a32',1,'_test_product_for_basket','621','Product 1','','',8.4,10,1.6,19,'',10,10,8.4,'','','','','','','','','','',0,0,'0000-00-00','2020-05-25','2015-07-02 07:31:37',0,0,0,'','','','',1,'','oxarticle',0,2,'',0);

REPLACE INTO `oxuserpayments` (`OXID`, `OXUSERID`, `OXPAYMENTSID`, `OXVALUE`, `OXTIMESTAMP`) VALUES
('invoice_order_payment',  'e7af1c3b786fd02906ccd75698f4e6b9', 'oxidinvoice', '', '2020-09-11 08:15:00');

REPLACE INTO `oxfiles` (`OXID`, `OXARTID`, `OXFILENAME`) VALUES ('48d949cb0af6076f841aea5cb5b703ed', '_test_product_for_basket', 'ch99.pdf');

REPLACE INTO `oxorderfiles` (`OXID`, `OXORDERID`, `OXFILENAME`, `OXFILEID`, `OXSHOPID`, `OXORDERARTICLEID`, `OXFIRSTDOWNLOAD`, `OXLASTDOWNLOAD`, `OXDOWNLOADCOUNT`, `OXMAXDOWNLOADCOUNT`, `OXDOWNLOADEXPIRATIONTIME`, `OXLINKEXPIRATIONTIME`, `OXRESETCOUNT`, `OXVALIDUNTIL`, `OXTIMESTAMP`) VALUES
('729aafa296783575ddfd8e9527355b9b',	'85ecbd1d5e56172ff5af6917894d4a31',	'ch99.pdf',	'48d949cb0af6076f841aea5cb5b703ed',	2,	'677688370a4a64d8336107bcf174fdeb',	'2020-09-10 09:14:15',	'2020-09-10 09:14:15',	1,	0,	24,	168,	0,	'2020-09-11 09:14:15',	'2020-09-10 09:14:15');

REPLACE INTO `oxshops` (`OXID`, `OXACTIVE`, `OXNAME`, `OXEDITION`, `OXVERSION`) VALUES
(2, 1, 'Second Shop', 'EE', '6.0.0');

REPLACE INTO `oxconfig` (`OXID`, `OXSHOPID`, `OXVARNAME`, `OXVARTYPE`, `OXVARVALUE`, `OXMODULE`)
SELECT MD5(RAND()), 2, oxvarname, oxvartype, oxvarvalue, oxmodule FROM oxconfig
WHERE oxshopid = '1'
AND oxvarname IN ( 'aLanguages');

UPDATE `oxcountry` SET `oxorder` = 1 where `OXID` = 'a7c40f631fc920687.20179984';
UPDATE `oxcountry` SET `oxorder` = 2 where `OXID` = '8f241f11096877ac0.98748826';
UPDATE `oxcountry` SET `oxorder` = 3 where `OXID` = 'a7c40f6321c6f6109.43859248';
UPDATE `oxcountry` SET `oxorder` = 4 where `OXID` = 'a7c40f6320aeb2ec2.72885259';
UPDATE `oxcountry` SET `oxorder` = 5 where `OXID` = 'a7c40f632a0804ab5.18804076';

REPLACE INTO `oxorderarticles` (`OXID`, `OXORDERID`, `OXAMOUNT`, `OXARTID`, `OXARTNUM`, `OXTITLE`, `OXSHORTDESC`, `OXSELVARIANT`, `OXNETPRICE`, `OXBRUTPRICE`, `OXVATPRICE`, `OXVAT`, `OXPERSPARAM`, `OXPRICE`, `OXBPRICE`, `OXNPRICE`, `OXWRAPID`, `OXEXTURL`, `OXURLDESC`, `OXURLIMG`, `OXTHUMB`, `OXPIC1`, `OXPIC2`, `OXPIC3`, `OXPIC4`, `OXPIC5`, `OXWEIGHT`, `OXSTOCK`, `OXDELIVERY`, `OXINSERT`, `OXTIMESTAMP`, `OXLENGTH`, `OXWIDTH`, `OXHEIGHT`, `OXFILE`, `OXSEARCHKEYS`, `OXTEMPLATE`, `OXQUESTIONEMAIL`, `OXISSEARCH`, `OXFOLDER`, `OXSUBCLASS`, `OXSTORNO`, `OXORDERSHOPID`, `OXISBUNDLE`) VALUES
('1d48d8339e49f906700b520ceb4c79aa','7f0b6ef39c4e76c04a0f75232489bb65',1,'05848170643ab0deb9914566391c0c63','1402','Harness MADTRIXX','New freestyle harness with a lean cut outline','',133.61,159,25.39,19,'',159,159,133.61,'','','','','','ion_madtrixx_kite_waist_2011_1.jpg','','','','',0,15,'0000-00-00','2010-12-06','2020-08-28 09:04:14',0,0,0,'','harness, hip harness, madtrixx','','',1,'','oxarticle',0,1,0),
('6c220c5d926c5092035234285f3c8fc3','7f0b6ef39c4e76c04a0f75232489bb65',1,'058c7b525aad619d8b343c0ffada0247','400-03','Sticky Tape DACRON KITEFIX','ideal for small repairs of the kite','black',7.01,7.99,0.98,14,'',7.99,7.99,7.01,'','','','','','kitefix_self-adhesive_dacron_1.jpg','','','','',0,5,'0000-00-00','2010-12-06','2020-08-28 09:04:14',0,0,0,'','sticky tape, kite, repair, kitefix','','',0,'','oxarticle',0,1,0),
('b4b9f8dd0be567d6fcfc59d9b7bb266b','7f0b6ef39c4e76c04a0f75232489bb65',1,'dc5ffdf380e15674b56dd562a7cb6aec','3503','Kuyichi leather belt JEVER','Leather belt, unisex','',27.18,29.9,2.72,10,'',29.9,29.9,27.18,'','','','','','p1170221_1.jpg','p1170222_1.jpg','','','',0,15,'0000-00-00','2010-12-10','2020-08-28 09:04:14',0,0,0,'','kuyichi, leather, leather belt, unisex, used','','',1,'','oxarticle',0,1,0),
('f805daf76a1f8614a7972ab51c22634b','7f0b6ef39c4e76c04a0f75232489bb65',1,'f33d5bcc7135908fd36fc736c643aa1c','1506','KiteFix Glue GLUFIX (30g)','Specially developed for fixing kites','',10.5,12.49,1.99,19,'',12.49,12.49,10.5,'','','','','glufix_z1a_th_th.jpg','glufix_z1a.jpg','','','','',0,27,'0000-00-00','2011-03-24','2020-08-28 09:04:14',0,0,0,'','kite, kitefix, glue, glufix','','',1,'','oxarticle',0,1,0),
('677688370a4a64d8336107bcf174f330','_order_with_non_existing_product',1,'non_existing_product_id','621','Product 1','','',8.4,10,1.6,19,'',10,10,8.4,'','','','','','','','','','',0,0,'0000-00-00','2020-05-25','2015-07-02 07:31:37',0,0,0,'','','','',1,'','oxarticle',0,2,0),
('677688370a4a64d8336107bcf174f331','_order_with_deleted_product',1,'_test_product_for_basket','621','Product 1','','',8.4,10,1.6,19,'',10,10,8.4,'','','','','','','','','','',0,0,'0000-00-00','2020-05-25','2015-07-02 07:31:37',0,0,0,'','','','',1,'','oxarticle',0,2,0),
('c5b7fd8dff99f066c168cd720212075a','8c726d3f42ff1a6ea2828d5f309de881',1,'oiaa81b5e002fc2f73b9398c361c0b97','10101','Online shops with OXID eShop','','',0,0,0,10,'',0,0,0,'','','','','','oxid_book_cover_1.jpg','','','','',0,600,'0000-00-00','2012-04-25','2020-09-10 09:13:36',0,0,0,'','','','',1,'','',0,1,0),
('4ad5c368c9c7715ac800adb27e079ebe','7f0b6ef39c4e76c04a0f75232489bb65',1,'oiaa81b5e002fc2f73b9398c361c0b97','10101','Online shops with OXID eShop','','',0,0,0,10,'',0,0,0,'','','','','','oxid_book_cover_1.jpg','','','','',0,600,'0000-00-00','2012-04-25','2020-09-10 09:13:36',0,0,0,'','','','',1,'','',0,1,0);
