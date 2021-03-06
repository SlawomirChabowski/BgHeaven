-- user accounts
CREATE TABLE t_user (
	id INT IDENTITY(1, 1) PRIMARY KEY,
	name VARCHAR(30) NOT NULL UNIQUE,
	email VARCHAR(500) NOT NULL UNIQUE CHECK (email LIKE '%@%.%'),
	password CHAR(96) NOT NULL CHECK (LEN(password) >= 6),
	date_joined DATETIME DEFAULT GETDATE(),
	last_active DATETIME DEFAULT GETDATE(),
	rank INT DEFAULT 0,										-- 0 for normal user, 1 for moderator
	website VARCHAR(255) CHECK (LEN(website) >= 5),
	about VARCHAR(max),
	banned TINYINT DEFAULT 0									-- 1 for TRUE, 0  for FALSE
);

-- logging history
CREATE TABLE t_login_history (
	id INT IDENTITY(1, 1) PRIMARY KEY,
	date DATETIME NOT NULL DEFAULT GETDATE(),
	user_id INT NOT NULL FOREIGN KEY REFERENCES t_user(id)
);

-- image categories
CREATE TABLE t_category (
	id INT IDENTITY(1, 1) PRIMARY KEY,
	name VARCHAR(30) NOT NULL UNIQUE
);

-- images
CREATE TABLE t_image (
	id INT IDENTITY(1, 1) PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	tags VARCHAR(1000),										-- separated by spacebars
	date_added DATETIME NOT NULL DEFAULT GETDATE(),
	description VARCHAR(max),
	category_id INT NOT NULL FOREIGN KEY REFERENCES t_category(id),
	author_id INT FOREIGN KEY REFERENCES t_user(id),
	-- file measurements
	filetype VARCHAR(10),
	filename VARCHAR(100) NOT NULL UNIQUE,								-- generated by website's code
	blocked TINYINT DEFAULT 0									-- 1 for TRUE, 0 for FALSE
);

-- if user decided to report an inappropriate image
CREATE TABLE t_report (
	id INT IDENTITY(100, 1) PRIMARY KEY,
	date_added DATETIME NOT NULL DEFAULT GETDATE(),
	reason VARCHAR(1000) NOT NULL,
	status INT NOT NULL DEFAULT 0,									-- 0 if under review, 1 if reviewed succesfully, 2 if not
	callback VARCHAR(1000),
	image_id INT NOT NULL FOREIGN KEY REFERENCES t_image(id),
	user_id INT NOT NULL FOREIGN KEY REFERENCES t_user(id)
);

-- if user decided to give a star to an image
CREATE TABLE t_vote (
	id INT IDENTITY(100, 1) PRIMARY KEY,
	image_id INT NOT NULL FOREIGN KEY REFERENCES t_image(id),
	user_id INT NOT NULL FOREIGN KEY REFERENCES t_user(id),
	value INT NOT NULL CHECK (value >= 1 AND value <= 5)
);