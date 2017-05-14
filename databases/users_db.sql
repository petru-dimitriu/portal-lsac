CREATE TABLE `users` (
 `id_user` int(11) NOT NULL AUTO_INCREMENT,
 `name` varchar(64) NOT NULL,
 `password` varchar(64) DEFAULT NULL,
 `email` varchar(64) NOT NULL,
 `entryDate` date DEFAULT NULL,
 PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1