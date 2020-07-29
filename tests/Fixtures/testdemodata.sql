SET @@session.sql_mode = '';

REPLACE INTO `oxpricealarm` (`OXID`, `OXSHOPID`, `OXUSERID`, `OXEMAIL`, `OXARTID`, `OXPRICE`, `OXCURRENCY`, `OXLANG`, `OXINSERT`, `OXSENDED`, `OXTIMESTAMP`) VALUES
('_test_wished_price_without_user_',	1,	'',	'test-email@test.com',	'dc5ffdf380e15674b56dd562a7cb6aec',	10,	'EUR',	1,	'2020-05-26 00:00:00',	'0000-00-00 00:00:00',	'2020-05-26 10:30:18'),
('_test_wished_price_1_',	1,	'e7af1c3b786fd02906ccd75698f4e6b9',	'user@oxid-esales.com',	'dc5ffdf380e15674b56dd562a7cb6aec',	10,	'EUR',	1,	'2020-05-26 00:00:00',	'0000-00-00 00:00:00',	'2020-05-26 10:31:33'),
('_test_wished_price_2_',	1,	'245ad3b5380202966df6ff128e9eecaq',	'redaktion@redaktion.net',	'dc5ffdf380e15674b56dd562a7cb6aec',	10,	'EUR',	1,	'2020-05-26 00:00:00',	'0000-00-00 00:00:00',	'2020-05-26 11:48:20'),
('_test_wished_price_3_',	1,	'e7af1c3b786fd02906ccd75698f4e6b9',	'user@oxid-esales.com',	'_test_product_wished_price_3_',	10,	'EUR',	1,	'2020-05-26 00:00:00',	'0000-00-00 00:00:00',	'2020-05-26 10:31:33'),
('_test_wished_price_4_',	1,	'e7af1c3b786fd02906ccd75698f4e6b9',	'user@oxid-esales.com',	'_test_product_wished_price_4_',	10,	'EUR',	1,	'2020-05-26 00:00:00',	'0000-00-00 00:00:00',	'2020-05-26 10:31:33'),
('_test_wished_price_5_',	1,	'e7af1c3b786fd02906ccd75698f4e6b9',	'user@oxid-esales.com',	'does_not_exist',	10,	'EUR',	1,	'2020-05-26 00:00:00',	'0000-00-00 00:00:00',	'2020-05-26 10:31:33'),
('_test_wished_price_6_',	1,	'e7af1c3b786fd02906ccd75698f4e6b9',	'user@oxid-esales.com',	'dc5ffdf380e15674b56dd562a7cb6aec',	10,	'EUR',	1,	'2020-05-26 00:00:00',	'2020-05-31 10:31:33',	'2020-05-26 10:31:33'),
('_test_wished_price_7_',	1,	'non-existing-user-id',	'user@oxid-esales.com',	'dc5ffdf380e15674b56dd562a7cb6aec',	10,	'EUR',	1,	'2020-05-26 00:00:00',	'2020-05-31 10:31:33',	'2020-05-26 10:31:33'),
('_test_wished_price_delete_',	1,	'e7af1c3b786fd02906ccd75698f4e6b9',	'user@oxid-esales.com',	'dc5ffdf380e15674b56dd562a7cb6aec',	10,	'EUR',	1,	'2020-05-26 00:00:00',	'2020-05-31 10:31:33',	'2020-05-26 10:31:33'),
('_test_wished_price_delete_1_',	1,	'e7af1c3b786fd02906ccd75698f4e6b9',	'user@oxid-esales.com',	'dc5ffdf380e15674b56dd562a7cb6aec',	10,	'EUR',	1,	'2020-05-26 00:00:00',	'2020-05-31 10:31:33',	'2020-05-26 10:31:33'),
('_test_wished_price_delete_2_',	1,	'e7af1c3b786fd02906ccd75698f4e6b9',	'user@oxid-esales.com',	'dc5ffdf380e15674b56dd562a7cb6aec',	10,	'EUR',	1,	'2020-05-26 00:00:00',	'2020-05-31 10:31:33',	'2020-05-26 10:31:33'),
('_test_wished_price_delete_3_',	1,	'e7af1c3b786fd02906ccd75698f4e6b9',	'user@oxid-esales.com',	'dc5ffdf380e15674b56dd562a7cb6aec',	10,	'EUR',	1,	'2020-05-26 00:00:00',	'2020-05-31 10:31:33',	'2020-05-26 10:31:33');


REPLACE INTO `oxarticles` (`OXID`, `OXSHOPID`, `OXPARENTID`, `OXACTIVE`, `OXHIDDEN`, `OXACTIVEFROM`, `OXACTIVETO`, `OXARTNUM`, `OXEAN`, `OXDISTEAN`, `OXMPN`, `OXTITLE`, `OXSHORTDESC`, `OXPRICE`, `OXBLFIXEDPRICE`, `OXPRICEA`, `OXPRICEB`, `OXPRICEC`, `OXBPRICE`, `OXTPRICE`, `OXUNITNAME`, `OXUNITQUANTITY`, `OXEXTURL`, `OXURLDESC`, `OXURLIMG`, `OXVAT`, `OXTHUMB`, `OXICON`, `OXPIC1`, `OXPIC2`, `OXPIC3`, `OXPIC4`, `OXPIC5`, `OXPIC6`, `OXPIC7`, `OXPIC8`, `OXPIC9`, `OXPIC10`, `OXPIC11`, `OXPIC12`, `OXWEIGHT`, `OXSTOCK`, `OXSTOCKFLAG`, `OXSTOCKTEXT`, `OXNOSTOCKTEXT`, `OXDELIVERY`, `OXINSERT`, `OXTIMESTAMP`, `OXLENGTH`, `OXWIDTH`, `OXHEIGHT`, `OXFILE`, `OXSEARCHKEYS`, `OXTEMPLATE`, `OXQUESTIONEMAIL`, `OXISSEARCH`, `OXISCONFIGURABLE`, `OXVARNAME`, `OXVARSTOCK`, `OXVARCOUNT`, `OXVARSELECT`, `OXVARMINPRICE`, `OXVARMAXPRICE`, `OXVARNAME_1`, `OXVARSELECT_1`, `OXVARNAME_2`, `OXVARSELECT_2`, `OXVARNAME_3`, `OXVARSELECT_3`, `OXTITLE_1`, `OXSHORTDESC_1`, `OXURLDESC_1`, `OXSEARCHKEYS_1`, `OXTITLE_2`, `OXSHORTDESC_2`, `OXURLDESC_2`, `OXSEARCHKEYS_2`, `OXTITLE_3`, `OXSHORTDESC_3`, `OXURLDESC_3`, `OXSEARCHKEYS_3`, `OXBUNDLEID`, `OXFOLDER`, `OXSUBCLASS`, `OXSTOCKTEXT_1`, `OXSTOCKTEXT_2`, `OXSTOCKTEXT_3`, `OXNOSTOCKTEXT_1`, `OXNOSTOCKTEXT_2`, `OXNOSTOCKTEXT_3`, `OXSORT`, `OXSOLDAMOUNT`, `OXNONMATERIAL`, `OXFREESHIPPING`, `OXREMINDACTIVE`, `OXREMINDAMOUNT`, `OXAMITEMID`, `OXAMTASKID`, `OXVENDORID`, `OXMANUFACTURERID`, `OXSKIPDISCOUNTS`, `OXRATING`, `OXRATINGCNT`, `OXMINDELTIME`, `OXMAXDELTIME`, `OXDELTIMEUNIT`, `OXUPDATEPRICE`, `OXUPDATEPRICEA`, `OXUPDATEPRICEB`, `OXUPDATEPRICEC`, `OXUPDATEPRICETIME`, `OXISDOWNLOADABLE`) VALUES
('_test_product_wished_price_3_',	1,	'',	1,	0,	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	'333',	'',	'',	'',	'Product 3',	'',	10,	1,	0,	0,	0,	0,	0,	'',	0,	'',	'',	'',	NULL,	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	0,	0,	1,	'',	'',	'0000-00-00',	'2020-05-25',	'2020-05-25 09:25:26',	0,	0,	0,	'',	'',	'',	'',	1,	0,	'',	0,	0,	'',	10,	10,	'',	'',	'',	'',	'',	'',	'Product 1',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'oxarticle',	'',	'',	'',	'',	'',	'',	0,	0,	0,	0,	0,	0,	'',	'0',	'',	'',	0,	0,	0,	0,	0,	'',	0,	0,	0,	0,	'0000-00-00 00:00:00',	0),
('_test_product_wished_price_4_',	1,	'',	0,	0,	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	'444',	'',	'',	'',	'Product 4',	'',	10,	0,	0,	0,	0,	0,	0,	'',	0,	'',	'',	'',	NULL,	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	0,	0,	1,	'',	'',	'0000-00-00',	'2020-05-25',	'2020-05-25 09:25:26',	0,	0,	0,	'',	'',	'',	'',	1,	0,	'',	0,	0,	'',	10,	10,	'',	'',	'',	'',	'',	'',	'Product 1',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'oxarticle',	'',	'',	'',	'',	'',	'',	0,	0,	0,	0,	0,	0,	'',	'0',	'',	'',	0,	0,	0,	0,	0,	'',	0,	0,	0,	0,	'0000-00-00 00:00:00',	0),
('_test_product_for_rating_5_',	1,	'',	1,	0,	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	'555',	'',	'',	'',	'Product 5',	'',	10,	0,	0,	0,	0,	0,	0,	'',	0,	'',	'',	'',	NULL,	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	0,	0,	1,	'',	'',	'0000-00-00',	'2020-05-25',	'2020-05-25 09:25:26',	0,	0,	0,	'',	'',	'',	'',	1,	0,	'',	0,	0,	'',	10,	10,	'',	'',	'',	'',	'',	'',	'Product 1',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'oxarticle',	'',	'',	'',	'',	'',	'',	0,	0,	0,	0,	0,	0,	'',	'0',	'',	'',	0,	0,	0,	0,	0,	'',	0,	0,	0,	0,	'0000-00-00 00:00:00',	0),
('_test_product_for_rating_6_',	1,	'',	1,	0,	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	'666',	'',	'',	'',	'Product 6',	'',	10,	0,	0,	0,	0,	0,	0,	'',	0,	'',	'',	'',	NULL,	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	0,	0,	1,	'',	'',	'0000-00-00',	'2020-05-25',	'2020-05-25 09:25:26',	0,	0,	0,	'',	'',	'',	'',	1,	0,	'',	0,	0,	'',	10,	10,	'',	'',	'',	'',	'',	'',	'Product 1',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'oxarticle',	'',	'',	'',	'',	'',	'',	0,	0,	0,	0,	0,	0,	'',	'0',	'',	'',	0,	0,	0,	0,	0,	'',	0,	0,	0,	0,	'0000-00-00 00:00:00',	0),
('_test_product_for_rating_avg',	1,	'',	1,	0,	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	'987',	'',	'',	'',	'Product 987',	'',	10,	0,	0,	0,	0,	0,	0,	'',	0,	'',	'',	'',	NULL,	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	0,	0,	1,	'',	'',	'0000-00-00',	'2020-05-25',	'2020-05-25 09:25:26',	0,	0,	0,	'',	'',	'',	'',	1,	0,	'',	0,	0,	'',	10,	10,	'',	'',	'',	'',	'',	'',	'Product 1',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'oxarticle',	'',	'',	'',	'',	'',	'',	0,	0,	0,	0,	0,	0,	'',	'0',	'',	'',	0,	0,	0,	0,	0,	'',	0,	0,	0,	0,	'0000-00-00 00:00:00',	0),
('_test_product_for_wish_list',	1,	'',	1,	0,	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	'645',	'',	'',	'',	'Product 645',	'',	10,	0,	0,	0,	0,	0,	0,	'',	0,	'',	'',	'',	NULL,	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	0,	0,	1,	'',	'',	'0000-00-00',	'2020-05-25',	'2020-05-25 09:25:26',	0,	0,	0,	'',	'',	'',	'',	1,	0,	'',	0,	0,	'',	10,	10,	'',	'',	'',	'',	'',	'',	'Product 1',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'oxarticle',	'',	'',	'',	'',	'',	'',	0,	0,	0,	0,	0,	0,	'',	'0',	'',	'',	0,	0,	0,	0,	0,	'',	0,	0,	0,	0,	'0000-00-00 00:00:00',	0),
('_test_product_for_basket',	1,	'',	1,	0,	'0000-00-00 00:00:00',	'0000-00-00 00:00:00',	'621',	'',	'',	'',	'Product 621',	'',	10,	0,	0,	0,	0,	0,	0,	'',	0,	'',	'',	'',	NULL,	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	0,	0,	1,	'',	'',	'0000-00-00',	'2020-05-25',	'2020-05-25 09:25:26',	0,	0,	0,	'',	'',	'',	'',	1,	0,	'',	0,	0,	'',	10,	10,	'',	'',	'',	'',	'',	'',	'Product 1',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'oxarticle',	'',	'',	'',	'',	'',	'',	0,	0,	0,	0,	0,	0,	'',	'0',	'',	'',	0,	0,	0,	0,	0,	'',	0,	0,	0,	0,	'0000-00-00 00:00:00',	0);

REPLACE INTO `oxuser` (`OXID`, `OXACTIVE`, `OXRIGHTS`, `OXSHOPID`, `OXUSERNAME`, `OXPASSWORD`, `OXPASSSALT`, `OXCUSTNR`, `OXUSTID`, `OXCOMPANY`, `OXFNAME`, `OXLNAME`, `OXSTREET`, `OXSTREETNR`, `OXADDINFO`, `OXCITY`, `OXCOUNTRYID`, `OXSTATEID`, `OXZIP`, `OXFON`, `OXFAX`, `OXSAL`, `OXBONI`, `OXCREATE`, `OXREGISTER`, `OXPRIVFON`, `OXMOBFON`, `OXBIRTHDATE`, `OXURL`, `OXUPDATEKEY`, `OXUPDATEEXP`, `OXPOINTS`) VALUES
('245ad3b5380202966df6ff128e9eecaq', 1, 'user', 1, 'otheruser@oxid-esales.com',  '$2y$10$b186f117054b700a89de9uXDzfahkizUucitfPov3C2cwF5eit2M2', 'b186f117054b700a89de929ce90c6aef', 8, '', '', 'Marc', 'Muster', 'Hauptstr.', '13', '', 'Freiburg', 'a7c40f631fc920687.20179984', '', '79098', '', '', 'MR', 1000, '2011-02-01 08:41:25', '2011-02-01 08:41:25', '', '', '0000-00-00', '', '', 0, 0),
('e7af1c3b786fd02906ccd75698f4e6b9', 1, 'user', 1, 'user@oxid-esales.com', '$2y$10$b186f117054b700a89de9uXDzfahkizUucitfPov3C2cwF5eit2M2', 'b186f117054b700a89de929ce90c6aef', 2, '', '', 'Marc', 'Muster', 'Hauptstr.', '13', '', 'Freiburg', 'a7c40f631fc920687.20179984', '', '79098', '', '', 'MR', 1000, '2011-02-01 08:41:25', '2011-02-01 08:41:25', '', '', '1984-12-21', '', '', 0, 0),
('_45ad3b5380202966df6ff128e9eecaq', 1, 'user', 1, 'differentuser@oxid-esales.com',  '$2y$10$b186f117054b700a89de9uXDzfahkizUucitfPov3C2cwF5eit2M2', 'b186f117054b700a89de929ce90c6aef', 8, '', '', 'Marc', 'Muster', 'Hauptstr.', '13', '', 'Freiburg', 'a7c40f631fc920687.20179984', '', '79098', '', '', 'MR', 1000, '2011-02-01 08:41:25', '2011-02-01 08:41:25', '', '', '0000-00-00', '', '', 0, 0),
('9119cc8cd9593c214be93ee558235f3c', 1, 'user', 1, 'existinguser@oxid-esales.com',  '$2y$10$b186f117054b700a89de9uXDzfahkizUucitfPov3C2cwF5eit2M2', 'b186f117054b700a89de929ce90c6aef', 8, '', '', 'Marc', 'Muster', 'Hauptstr.', '13', '', 'Freiburg', 'a7c40f631fc920687.20179984', '', '79098', '', '', 'MR', 1000, '2011-02-01 08:41:25', '2011-02-01 08:41:25', '', '', '0000-00-00', '', '', 0, 0);

REPLACE INTO `oxratings` (`OXID`, `OXSHOPID`, `OXUSERID`, `OXTYPE`, `OXOBJECTID`, `OXRATING`) VALUES
('test_user_rating', 1, '245ad3b5380202966df6ff128e9eecaq', 'oxarticle', '_test_product_for_rating_avg', 3),
('test_rating_1_', 1, 'e7af1c3b786fd02906ccd75698f4e6b9', 'oxarticle', '_test_product_for_rating_avg', 1);

UPDATE `oxarticles` SET `OXRATING` = '2', `OXRATINGCNT` = '2' WHERE oxid = '_test_product_for_rating_avg';

UPDATE `oxnewssubscribed` SET `OXDBOPTIN` = '1', `OXSUBSCRIBED` = '2020-04-01 11:11:11', `OXUNSUBSCRIBED` = '0000-00-00 00:00:00' WHERE `OXUSERID` = 'e7af1c3b786fd02906ccd75698f4e6b9';

UPDATE `oxnewssubscribed` SET `OXDBOPTIN` = 1 where `OXUSERID` = 'e7af1c3b786fd02906ccd75698f4e6b9';

REPLACE INTO `oxobject2group` (`OXID`, `OXSHOPID`, `OXOBJECTID`, `OXGROUPSID`, `OXTIMESTAMP`) VALUES
('test_unsubscribe', 1, 'e7af1c3b786fd02906ccd75698f4e6b9', 'oxidnewsletter', '2012-06-04 07:04:54');

REPLACE INTO `oxaddress` (`OXID`, `OXUSERID`, `OXFNAME`, `OXLNAME`, `OXSTREET`, `OXSTREETNR`, `OXCITY`, `OXCOUNTRY`, `OXCOUNTRYID`, `OXZIP`, `OXSAL`, `OXTIMESTAMP`) VALUES
('test_delivery_address',	'e7af1c3b786fd02906ccd75698f4e6b9',	'Marc',	'Muster',	'Hauptstr',	'13',	'Freiburg',	'Germany',	'a7c40f631fc920687.20179984',	'79098',	'MR',	'2020-07-14 14:12:48'),
('test_delivery_address_2',	'e7af1c3b786fd02906ccd75698f4e6b9',	'Marc',	'Muster',	'Hauptstr2',	'132',	'Freiburg',	'Austria',	'a7c40f6320aeb2ec2.72885259',	'79098',	'MR',	'2020-07-14 14:44:06');

REPLACE INTO `oxuserbaskets` (`OXID`, `OXUSERID`, `OXTITLE`, `OXPUBLIC`) VALUES
('_test_wish_list_public', 'e7af1c3b786fd02906ccd75698f4e6b9', 'wishlist', true),
('test_make_wishlist_private',	'e7af1c3b786fd02906ccd75698f4e6b9',	'wishlist',	true),
('_test_basket_public', 'e7af1c3b786fd02906ccd75698f4e6b9', 'buy_these', true),
('_test_wish_list_private', '245ad3b5380202966df6ff128e9eecaq', 'wishlist', false),
('_test_basket_private', '245ad3b5380202966df6ff128e9eecaq', 'buy_these_later', false);

REPLACE INTO `oxuserbasketitems` (`OXID`, `OXBASKETID`, `OXARTID`, `OXAMOUNT`, `OXSELLIST`, `OXPERSPARAM`) VALUES
('_test_wish_list_item_1', '_test_wish_list_public', '_test_product_for_wish_list', 1, 'N;', ''),
('_test_wish_list_item_2', '_test_wish_list_private', '_test_product_for_wish_list', 1, 'N;', ''),
('_test_basket_item_1', '_test_basket_public', '_test_product_for_basket', 1, 'N;', ''),
('_test_basket_item_2', '_test_basket_private', '_test_product_for_basket', 1, 'N;', '');
