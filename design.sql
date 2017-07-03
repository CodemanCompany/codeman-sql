--  ██████╗ ██████╗ ██████╗ ███████╗███╗   ███╗ █████╗ ███╗   ██╗
-- ██╔════╝██╔═══██╗██╔══██╗██╔════╝████╗ ████║██╔══██╗████╗  ██║
-- ██║     ██║   ██║██║  ██║█████╗  ██╔████╔██║███████║██╔██╗ ██║
-- ██║     ██║   ██║██║  ██║██╔══╝  ██║╚██╔╝██║██╔══██║██║╚██╗██║
-- ╚██████╗╚██████╔╝██████╔╝███████╗██║ ╚═╝ ██║██║  ██║██║ ╚████║
--  ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝

DROP SCHEMA IF EXISTS codeman;

CREATE SCHEMA codeman;

USE codeman;
SET NAMES utf8;

-- ----------------------------------------------------------------------

DROP TABLE IF EXISTS codeman.users;
CREATE TABLE codeman.users(
	id_user INT UNSIGNED NOT NULL AUTO_INCREMENT,
	name VARCHAR( 40 ) NOT NULL,
	last_name VARCHAR( 50 ) NOT NULL,
	username VARCHAR( 15 ) NOT NULL,
	email VARCHAR( 60 ) NOT NULL,
	password CHAR( 40 ) BINARY NOT NULL,
	token CHAR( 56 ) NOT NULL,
	type ENUM( 'admin', 'client', 'root' ) NOT NULL DEFAULT 'client',
	status BOOLEAN NOT NULL DEFAULT TRUE COMMENT 'TRUE -> Active, FALSE -> Inactive',

	UNIQUE( username ),
	UNIQUE( email ),
	UNIQUE( token ),

	PRIMARY KEY( id_user )
)
ENGINE = INNODB
CHARACTER SET utf8 COLLATE utf8_unicode_ci;