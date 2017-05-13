CREATE TABLE `sondaje` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `titlu` varchar(256) NOT NULL,
 `startSondaj` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 `stopSondaj` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
 `nrOptiuni` int(11) NOT NULL,
 `optiuni` varchar(256) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1