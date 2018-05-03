-- #########################
--          t_user
-- #########################

INSERT INTO t_user (name, email, password, rank, about) VALUES (
	'Admin',
	'admin@somewebsite.com',
	'passwd',
	1,
	'I am an administrator of this website'
);

INSERT INTO t_user (name, email, password, about) VALUES (
	'User',
	'user@somewebsite.com',
	'passwd',
	'I am a random user of this website'
);

-- #########################
--     t_login_history
-- #########################

INSERT INTO t_login_history (user_id) VALUES
	(1),
	(2);

-- #########################
--        t_category
-- #########################

INSERT INTO t_category (name) VALUES
	('Landscape'),
	('Sea'),
	('Mountains'),
	('City'),
	('People'),
	('Animals'),
	('Abstract'),
	('Sunset'),
	('Nature'),
	('Art');
	
-- #########################
--          t_image
-- #########################

INSERT INTO t_image (name, tags, category_id, author_id, filename) VALUES
	('A hill', 'hill mountain plains grass', 1, 1, 'img_01.jpg'),
	('A quay', 'quay pier water lake sunset', 8, 1, 'img_02.jpg'),
	('A quay', 'quay pier water lake sunset', 8, 1, 'img_03.jpg'),
	('Lake in the forest', 'forest lake water nature', 1, 1, 'img_04.jpg'),
	('The dusk', 'lake dusk twilight lake forest mountains hills island blue', 1, 1, 'img_05.jpg'),
	('A forest lake', 'lake forest trees mountains', 9, 1, 'img_06.jpg'),
	('Dandelion', 'dandelion flower road macro', 9, 1, 'img_07.jpg'),
	('Inflow', 'sea cliff inflow water', 2, 1, 'img_08.jpg'),
	('Meadow', 'meadow nature plains grass sky cloud', 1, 1, 'img_09.jpg'),
	('Lone beach', 'beach sea peaceful stones', 2, 1, 'img_10.jpg'),
	('A forest sunset', 'forest sunset grass trees', 9, 1, 'img_11.jpg'),
	('Sea', 'sea water drone', 2, 1, 'img_12.jpg'),
	('Tropics from the top', 'tropics sea jungle drone', 9, 1, 'img_13.jpg'),
	('A mountain sunset', 'mountains hills sunset nature', 8, 1, 'img_14.jpg'),
	('Grass in macro', 'grass sunset macro dew', 9, 1, 'img_15.jpg'),
	('Sierra', 'mountains sunset sierra', 3, 1, 'img_16.jpg'),
	('A rocky figure', 'rocks tower sea', 2, 1, 'img_17.jpg'),
	('Waterfall', 'waterfall lake', 1, 1, 'img_18.jpg'),
	('Sea from the drone', 'sea drone', 2, 1, 'img_19.jpg'),
	('Lake and mountain', 'lake mountain spring grass', 1, 1, 'img_20.jpg');