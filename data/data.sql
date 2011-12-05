--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.1
-- Dumped by pg_dump version 9.1.1
-- Started on 2011-12-05 09:02:10 UYST

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 164 (class 3079 OID 11643)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1863 (class 0 OID 0)
-- Dependencies: 164
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 161 (class 1259 OID 17382)
-- Dependencies: 6
-- Name: primaria; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE primaria (
    anio_pri integer,
    escolares integer
);


ALTER TABLE public.primaria OWNER TO postgres;

--
-- TOC entry 162 (class 1259 OID 17385)
-- Dependencies: 6
-- Name: secundaria; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE secundaria (
    anio_sec integer,
    liceales integer
);


ALTER TABLE public.secundaria OWNER TO postgres;

--
-- TOC entry 163 (class 1259 OID 17388)
-- Dependencies: 6
-- Name: universidades; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE universidades (
    universidad text,
    anio_uni integer,
    universitarios integer
);


ALTER TABLE public.universidades OWNER TO postgres;

--
-- TOC entry 1855 (class 0 OID 17382)
-- Dependencies: 161
-- Data for Name: primaria; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO primaria (anio_pri, escolares) VALUES (1900, 52474);
INSERT INTO primaria (anio_pri, escolares) VALUES (1901, 55376);
INSERT INTO primaria (anio_pri, escolares) VALUES (1902, 56417);
INSERT INTO primaria (anio_pri, escolares) VALUES (1903, 54355);
INSERT INTO primaria (anio_pri, escolares) VALUES (1904, 72972);
INSERT INTO primaria (anio_pri, escolares) VALUES (1905, 70834);
INSERT INTO primaria (anio_pri, escolares) VALUES (1906, 74870);
INSERT INTO primaria (anio_pri, escolares) VALUES (1907, 78727);
INSERT INTO primaria (anio_pri, escolares) VALUES (1908, 89582);
INSERT INTO primaria (anio_pri, escolares) VALUES (1909, 91882);
INSERT INTO primaria (anio_pri, escolares) VALUES (1910, 95160);
INSERT INTO primaria (anio_pri, escolares) VALUES (1911, 102582);
INSERT INTO primaria (anio_pri, escolares) VALUES (1912, 109141);
INSERT INTO primaria (anio_pri, escolares) VALUES (1913, 113620);
INSERT INTO primaria (anio_pri, escolares) VALUES (1914, 114946);
INSERT INTO primaria (anio_pri, escolares) VALUES (1915, 116591);
INSERT INTO primaria (anio_pri, escolares) VALUES (1916, 120180);
INSERT INTO primaria (anio_pri, escolares) VALUES (1917, 124604);
INSERT INTO primaria (anio_pri, escolares) VALUES (1918, 125384);
INSERT INTO primaria (anio_pri, escolares) VALUES (1919, 126302);
INSERT INTO primaria (anio_pri, escolares) VALUES (1920, 124117);
INSERT INTO primaria (anio_pri, escolares) VALUES (1921, 131595);
INSERT INTO primaria (anio_pri, escolares) VALUES (1922, 130609);
INSERT INTO primaria (anio_pri, escolares) VALUES (1923, 135459);
INSERT INTO primaria (anio_pri, escolares) VALUES (1924, 138920);
INSERT INTO primaria (anio_pri, escolares) VALUES (1925, 144463);
INSERT INTO primaria (anio_pri, escolares) VALUES (1926, 148485);
INSERT INTO primaria (anio_pri, escolares) VALUES (1927, 160169);
INSERT INTO primaria (anio_pri, escolares) VALUES (1928, 169985);
INSERT INTO primaria (anio_pri, escolares) VALUES (1929, 174952);
INSERT INTO primaria (anio_pri, escolares) VALUES (1930, 178264);
INSERT INTO primaria (anio_pri, escolares) VALUES (1931, 177774);
INSERT INTO primaria (anio_pri, escolares) VALUES (1932, 178162);
INSERT INTO primaria (anio_pri, escolares) VALUES (1933, 181789);
INSERT INTO primaria (anio_pri, escolares) VALUES (1934, 184125);
INSERT INTO primaria (anio_pri, escolares) VALUES (1935, 191644);
INSERT INTO primaria (anio_pri, escolares) VALUES (1936, 195271);
INSERT INTO primaria (anio_pri, escolares) VALUES (1937, 203616);
INSERT INTO primaria (anio_pri, escolares) VALUES (1938, 209651);
INSERT INTO primaria (anio_pri, escolares) VALUES (1939, 214409);
INSERT INTO primaria (anio_pri, escolares) VALUES (1940, 218846);
INSERT INTO primaria (anio_pri, escolares) VALUES (1941, 220833);
INSERT INTO primaria (anio_pri, escolares) VALUES (1942, 218422);
INSERT INTO primaria (anio_pri, escolares) VALUES (1943, 218422);
INSERT INTO primaria (anio_pri, escolares) VALUES (1944, 220981);
INSERT INTO primaria (anio_pri, escolares) VALUES (1945, 222102);
INSERT INTO primaria (anio_pri, escolares) VALUES (1946, 221455);
INSERT INTO primaria (anio_pri, escolares) VALUES (1947, 223049);
INSERT INTO primaria (anio_pri, escolares) VALUES (1948, 226522);
INSERT INTO primaria (anio_pri, escolares) VALUES (1949, 238792);
INSERT INTO primaria (anio_pri, escolares) VALUES (1950, 249393);
INSERT INTO primaria (anio_pri, escolares) VALUES (1951, 256911);
INSERT INTO primaria (anio_pri, escolares) VALUES (1952, 262866);
INSERT INTO primaria (anio_pri, escolares) VALUES (1953, 269707);
INSERT INTO primaria (anio_pri, escolares) VALUES (1954, 275242);
INSERT INTO primaria (anio_pri, escolares) VALUES (1955, 282954);
INSERT INTO primaria (anio_pri, escolares) VALUES (1956, 295032);
INSERT INTO primaria (anio_pri, escolares) VALUES (1957, 301596);
INSERT INTO primaria (anio_pri, escolares) VALUES (1958, 310226);
INSERT INTO primaria (anio_pri, escolares) VALUES (1959, 313891);
INSERT INTO primaria (anio_pri, escolares) VALUES (1960, 0);
INSERT INTO primaria (anio_pri, escolares) VALUES (1961, 0);
INSERT INTO primaria (anio_pri, escolares) VALUES (1962, 0);
INSERT INTO primaria (anio_pri, escolares) VALUES (1963, 0);
INSERT INTO primaria (anio_pri, escolares) VALUES (1964, 349151);
INSERT INTO primaria (anio_pri, escolares) VALUES (1965, 359285);
INSERT INTO primaria (anio_pri, escolares) VALUES (1966, 364325);
INSERT INTO primaria (anio_pri, escolares) VALUES (1967, 370468);
INSERT INTO primaria (anio_pri, escolares) VALUES (1968, 388046);
INSERT INTO primaria (anio_pri, escolares) VALUES (1969, 361702);
INSERT INTO primaria (anio_pri, escolares) VALUES (1970, 347611);
INSERT INTO primaria (anio_pri, escolares) VALUES (1971, 347746);
INSERT INTO primaria (anio_pri, escolares) VALUES (1972, 344598);
INSERT INTO primaria (anio_pri, escolares) VALUES (1973, 340154);
INSERT INTO primaria (anio_pri, escolares) VALUES (1974, 331047);
INSERT INTO primaria (anio_pri, escolares) VALUES (1975, 322602);
INSERT INTO primaria (anio_pri, escolares) VALUES (1976, 322942);
INSERT INTO primaria (anio_pri, escolares) VALUES (1977, 324361);
INSERT INTO primaria (anio_pri, escolares) VALUES (1978, 324615);
INSERT INTO primaria (anio_pri, escolares) VALUES (1979, 327009);
INSERT INTO primaria (anio_pri, escolares) VALUES (1980, 331297);
INSERT INTO primaria (anio_pri, escolares) VALUES (1981, 335600);
INSERT INTO primaria (anio_pri, escolares) VALUES (1982, 343957);
INSERT INTO primaria (anio_pri, escolares) VALUES (1983, 350178);
INSERT INTO primaria (anio_pri, escolares) VALUES (1984, 350390);
INSERT INTO primaria (anio_pri, escolares) VALUES (1985, 356002);
INSERT INTO primaria (anio_pri, escolares) VALUES (1986, 352459);
INSERT INTO primaria (anio_pri, escolares) VALUES (1987, 354177);
INSERT INTO primaria (anio_pri, escolares) VALUES (1988, 351984);
INSERT INTO primaria (anio_pri, escolares) VALUES (1989, 350415);
INSERT INTO primaria (anio_pri, escolares) VALUES (1990, 346416);
INSERT INTO primaria (anio_pri, escolares) VALUES (1991, 340789);
INSERT INTO primaria (anio_pri, escolares) VALUES (1992, 338020);
INSERT INTO primaria (anio_pri, escolares) VALUES (1993, 338204);
INSERT INTO primaria (anio_pri, escolares) VALUES (1994, 337889);
INSERT INTO primaria (anio_pri, escolares) VALUES (1995, 341197);
INSERT INTO primaria (anio_pri, escolares) VALUES (1996, 345573);
INSERT INTO primaria (anio_pri, escolares) VALUES (1997, 348195);
INSERT INTO primaria (anio_pri, escolares) VALUES (1998, 349452);
INSERT INTO primaria (anio_pri, escolares) VALUES (1999, 349647);
INSERT INTO primaria (anio_pri, escolares) VALUES (2000, 359759);
INSERT INTO primaria (anio_pri, escolares) VALUES (2001, 349549);
INSERT INTO primaria (anio_pri, escolares) VALUES (2002, 353826);
INSERT INTO primaria (anio_pri, escolares) VALUES (2003, 354843);
INSERT INTO primaria (anio_pri, escolares) VALUES (2004, 355568);
INSERT INTO primaria (anio_pri, escolares) VALUES (2005, 354777);
INSERT INTO primaria (anio_pri, escolares) VALUES (2006, 353528);
INSERT INTO primaria (anio_pri, escolares) VALUES (2007, 348579);
INSERT INTO primaria (anio_pri, escolares) VALUES (2008, 324588);
INSERT INTO primaria (anio_pri, escolares) VALUES (2009, 336865);
INSERT INTO primaria (anio_pri, escolares) VALUES (2010, 330548);


--
-- TOC entry 1856 (class 0 OID 17385)
-- Dependencies: 162
-- Data for Name: secundaria; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO secundaria (anio_sec, liceales) VALUES (1900, 855);
INSERT INTO secundaria (anio_sec, liceales) VALUES (1910, 4746);
INSERT INTO secundaria (anio_sec, liceales) VALUES (1920, 6491);
INSERT INTO secundaria (anio_sec, liceales) VALUES (1930, 6685);
INSERT INTO secundaria (anio_sec, liceales) VALUES (1940, 12766);
INSERT INTO secundaria (anio_sec, liceales) VALUES (1950, 37338);
INSERT INTO secundaria (anio_sec, liceales) VALUES (1960, 60430);
INSERT INTO secundaria (anio_sec, liceales) VALUES (1970, 131135);
INSERT INTO secundaria (anio_sec, liceales) VALUES (1980, 125438);
INSERT INTO secundaria (anio_sec, liceales) VALUES (1990, 180054);
INSERT INTO secundaria (anio_sec, liceales) VALUES (2000, 244486);
INSERT INTO secundaria (anio_sec, liceales) VALUES (2001, 254592);
INSERT INTO secundaria (anio_sec, liceales) VALUES (2002, 269159);
INSERT INTO secundaria (anio_sec, liceales) VALUES (2003, 229404);
INSERT INTO secundaria (anio_sec, liceales) VALUES (2004, 225388);
INSERT INTO secundaria (anio_sec, liceales) VALUES (2005, 220436);
INSERT INTO secundaria (anio_sec, liceales) VALUES (2006, 218816);
INSERT INTO secundaria (anio_sec, liceales) VALUES (2007, 255297);
INSERT INTO secundaria (anio_sec, liceales) VALUES (2008, 262241);
INSERT INTO secundaria (anio_sec, liceales) VALUES (2009, 268073);


--
-- TOC entry 1857 (class 0 OID 17388)
-- Dependencies: 163
-- Data for Name: universidades; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad Catolica', 1996, 1853);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad Catolica', 1997, 2112);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad Catolica', 1998, 2214);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad Catolica', 1999, 3355);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad Catolica', 2000, 4057);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad Catolica', 2001, 4180);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad Catolica', 2002, 3731);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad Catolica', 2003, 4543);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad Catolica', 2004, 3581);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad Catolica', 2005, 4262);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad Catolica', 2006, 5911);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad Catolica', 2007, 6400);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad Catolica', 2008, 5219);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad Catolica', 2009, 5330);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad ORT', 1996, 3361);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad ORT', 1997, 3474);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad ORT', 1998, 4808);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad ORT', 1999, 3227);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad ORT', 2000, 3445);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad ORT', 2001, 3572);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad ORT', 2002, 3550);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad ORT', 2003, 6844);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad ORT', 2004, 7133);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad ORT', 2005, 5162);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad ORT', 2006, 5863);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad ORT', 2007, 6118);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad ORT', 2008, 5983);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad ORT', 2009, 6293);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad de Montevideo', 1996, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad de Montevideo', 1997, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad de Montevideo', 1998, 186);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad de Montevideo', 1999, 223);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad de Montevideo', 2000, 575);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad de Montevideo', 2001, 775);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad de Montevideo', 2002, 740);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad de Montevideo', 2003, 1742);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad de Montevideo', 2004, 1713);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad de Montevideo', 2005, 1300);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad de Montevideo', 2006, 1612);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad de Montevideo', 2007, 1956);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad de Montevideo', 2008, 1434);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad de Montevideo', 2009, 1507);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad de la Empresa', 1996, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad de la Empresa', 1997, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad de la Empresa', 1998, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad de la Empresa', 1999, 470);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad de la Empresa', 2000, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad de la Empresa', 2001, 609);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad de la Empresa', 2002, 909);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad de la Empresa', 2003, 790);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad de la Empresa', 2004, 1417);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad de la Empresa', 2005, 1652);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad de la Empresa', 2006, 1611);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad de la Empresa', 2007, 1756);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad de la Empresa', 2008, 1142);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Universidad de la Empresa', 2009, 1320);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('UDELAR', 1996, 62026);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Crandon', 1996, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Crandon', 1997, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Crandon', 1998, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Crandon', 1999, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Asociacion Cristiana de Jovenes', 1996, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Asociacion Cristiana de Jovenes', 1997, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Asociacion Cristiana de Jovenes', 1998, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Asociacion Cristiana de Jovenes', 1999, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Asociacion Cristiana de Jovenes', 2000, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Asociacion Cristiana de Jovenes', 2001, 93);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Asociacion Cristiana de Jovenes', 2002, 140);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Asociacion Cristiana de Jovenes', 2003, 140);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Asociacion Cristiana de Jovenes', 2004, 340);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Asociacion Cristiana de Jovenes', 2005, 407);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Asociacion Cristiana de Jovenes', 2006, 508);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Asociacion Cristiana de Jovenes', 2007, 360);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Asociacion Cristiana de Jovenes', 2008, 352);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Asociacion Cristiana de Jovenes', 2009, 227);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Autonomo del Sur', 1996, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Autonomo del Sur', 1997, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Autonomo del Sur', 1998, 77);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Autonomo del Sur', 1999, 192);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Autonomo del Sur', 2000, 215);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Autonomo del Sur', 2001, 211);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Autonomo del Sur', 2002, 218);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Autonomo del Sur', 2003, 184);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Autonomo del Sur', 2004, 195);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Autonomo del Sur', 2005, 318);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Autonomo del Sur', 2006, 428);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Autonomo del Sur', 2007, 414);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Autonomo del Sur', 2008, 428);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Autonomo del Sur', 2009, 437);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('CLAEH', 1996, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('CLAEH', 1997, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('CLAEH', 1998, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('CLAEH', 1999, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('CLAEH', 2000, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('CLAEH', 2001, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('CLAEH', 2002, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('CLAEH', 2003, 39);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('CLAEH', 2004, 91);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('CLAEH', 2005, 283);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('CLAEH', 2006, 412);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('CLAEH', 2007, 483);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('CLAEH', 2008, 93);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('CLAEH', 2009, 116);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Instituto Universitario Bios', 1996, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Instituto Universitario Bios', 1997, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Instituto Universitario Bios', 1998, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Instituto Universitario Bios', 1999, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Instituto Universitario Bios', 2000, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Instituto Universitario Bios', 2001, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Instituto Universitario Bios', 2002, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Instituto Universitario Bios', 2003, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Instituto Universitario Bios', 2004, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Instituto Universitario Bios', 2005, 157);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Instituto Universitario Bios', 2006, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Instituto Universitario Bios', 2007, 52);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Instituto Universitario Bios', 2008, 113);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Instituto Universitario Bios', 2009, 60);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('UDELAR', 1997, 62026);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('UDELAR', 1998, 55532);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('UDELAR', 1999, 70156);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('UDELAR', 2000, 70156);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('UDELAR', 2001, 70156);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('UDELAR', 2002, 70156);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('UDELAR', 2003, 70156);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('UDELAR', 2004, 70156);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('UDELAR', 2005, 70156);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('UDELAR', 2006, 70156);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('UDELAR', 2007, 81774);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('UDELAR', 2008, 81774);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('UDELAR', 2009, 81774);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Crandon', 2000, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Crandon', 2001, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Crandon', 2002, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Crandon', 2003, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Crandon', 2004, 35);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Crandon', 2005, 60);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Crandon', 2006, 59);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Crandon', 2007, 83);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Crandon', 2008, 21);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Crandon', 2009, 15);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Asociacion Psicoanalitica del Uruguay', 1996, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Asociacion Psicoanalitica del Uruguay', 1997, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Asociacion Psicoanalitica del Uruguay', 1998, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Asociacion Psicoanalitica del Uruguay', 1999, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Asociacion Psicoanalitica del Uruguay', 2000, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Asociacion Psicoanalitica del Uruguay', 2001, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Asociacion Psicoanalitica del Uruguay', 2002, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Asociacion Psicoanalitica del Uruguay', 2003, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Asociacion Psicoanalitica del Uruguay', 2004, 35);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Asociacion Psicoanalitica del Uruguay', 2005, 25);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Asociacion Psicoanalitica del Uruguay', 2006, 31);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Asociacion Psicoanalitica del Uruguay', 2007, 29);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Asociacion Psicoanalitica del Uruguay', 2008, 34);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Asociacion Psicoanalitica del Uruguay', 2009, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Monseñor Mariano Soler', 1996, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Monseñor Mariano Soler', 1997, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Monseñor Mariano Soler', 1998, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Monseñor Mariano Soler', 1999, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Monseñor Mariano Soler', 2000, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Monseñor Mariano Soler', 2001, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Monseñor Mariano Soler', 2002, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Monseñor Mariano Soler', 2003, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Monseñor Mariano Soler', 2004, 59);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Monseñor Mariano Soler', 2005, 65);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Monseñor Mariano Soler', 2006, 50);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Monseñor Mariano Soler', 2007, 72);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Monseñor Mariano Soler', 2008, 54);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Monseñor Mariano Soler', 2009, 50);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Francisco de Asis', 1996, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Francisco de Asis', 1997, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Francisco de Asis', 1998, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Francisco de Asis', 1999, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Francisco de Asis', 2000, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Francisco de Asis', 2001, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Francisco de Asis', 2002, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Francisco de Asis', 2003, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Francisco de Asis', 2004, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Francisco de Asis', 2005, 83);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Francisco de Asis', 2006, 161);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Francisco de Asis', 2007, 202);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Francisco de Asis', 2008, 175);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('Francisco de Asis', 2009, 237);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('CEDIAP', 1996, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('CEDIAP', 1997, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('CEDIAP', 1998, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('CEDIAP', 1999, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('CEDIAP', 2000, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('CEDIAP', 2001, 34);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('CEDIAP', 2002, 50);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('CEDIAP', 2003, 49);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('CEDIAP', 2004, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('CEDIAP', 2005, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('CEDIAP', 2006, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('CEDIAP', 2007, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('CEDIAP', 2008, 0);
INSERT INTO universidades (universidad, anio_uni, universitarios) VALUES ('CEDIAP', 2009, 145);


--
-- TOC entry 1862 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2011-12-05 09:02:10 UYST

--
-- PostgreSQL database dump complete
--

