CREATE TABLE `myblog`.`comment`( 
   `id` INT(20) NOT NULL AUTO_INCREMENT , 
   `name` VARCHAR(20) NOT NULL , 
   `email` VARCHAR(40) , 
   `pid` INT(11) NOT NULL , 
   `createTime` DATETIME , 
   PRIMARY KEY (`id`)
 ) ENGINE=INNODB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COMMENT='评论主表'; 
 
 create table `posts` (
	`id` int(11) primary key auto_increment,
	`title` varchar (165),
	`summary` varchar (565),
	`content` text ,
	`label_img` varchar (165),
	`cat_id` int(5) ,
	`user_id` int(11) ,
	`user_name` varchar (165),
	`is_valid` tinyint (1),
	`createTime` datetime ,
	`updateTime` datetime 
); ENGINE=INNODB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COMMENT='博客主表'; 