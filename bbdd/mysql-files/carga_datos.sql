LOAD DATA INFILE '/var/lib/mysql/ficheros-sec-mysql/extraccion.txt'
INTO TABLE RN_AnalisisPedidos.Historico_Pedidos
FIELDS TERMINATED BY '|'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

