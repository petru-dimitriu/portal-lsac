CREATE TABLE `articles` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `title` varchar(256) NOT NULL,
 `user_id` int(11) NOT NULL,
 `content` text NOT NULL,
 `postDate` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1

ALTER TABLE `articles` ADD CONSTRAINT `FK_articles` FOREIGN KEY (`user_id`) REFERENCES `users`(`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;