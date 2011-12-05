BEGIN TRANSACTION;
	COPY universidades FROM '~/Universidades.csv' DELIMITER ',';
	COPY secundaria FROM '~/Secundaria.csv' DELIMITER ',';
	COPY primaria FROM '~/Primaria.csv' DELIMITER ',';
COMMIT;
