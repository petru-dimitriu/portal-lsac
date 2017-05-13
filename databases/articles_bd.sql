CREATE TABLE `articles` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `title` varchar(256) NOT NULL,
 `username` varchar(32) NOT NULL,
 `content` text NOT NULL,
 `postDate` date NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1