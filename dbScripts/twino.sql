--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

-- Started on 2016-08-21 17:59:29

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2115 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 16429)
-- Name: blacklist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE blacklist (
    personalid character varying(100) NOT NULL
);


ALTER TABLE blacklist OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 16432)
-- Name: loans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE loans (
    id numeric NOT NULL,
    amount numeric NOT NULL,
    term integer NOT NULL,
    name character varying(100) NOT NULL,
    surname character varying(100) NOT NULL,
    personalid character varying(100) NOT NULL,
    applicationdate timestamp without time zone NOT NULL,
    country character varying(5)
);


ALTER TABLE loans OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 16438)
-- Name: loans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE loans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE loans_id_seq OWNER TO postgres;

--
-- TOC entry 2105 (class 0 OID 16429)
-- Dependencies: 181
-- Data for Name: blacklist; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO blacklist VALUES ('185152861');
INSERT INTO blacklist VALUES ('101099926');
INSERT INTO blacklist VALUES ('798072241');


--
-- TOC entry 2106 (class 0 OID 16432)
-- Dependencies: 182
-- Data for Name: loans; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO loans VALUES (13, 2351, 25, 'TestName0', 'TestSurname0', '111111-11111', '2016-08-20 00:00:00', NULL);
INSERT INTO loans VALUES (14, 837, 47, 'TestName0', 'TestSurname0', '111111-11111', '2016-08-20 00:00:00', NULL);
INSERT INTO loans VALUES (15, 7433, 20, 'TestName0', 'TestSurname0', '111111-11111', '2016-08-20 00:00:00', NULL);
INSERT INTO loans VALUES (16, 3737310148522860000, 45, 'TestName0', 'TestSurname0', '111111-11111', '2016-08-20 00:00:00', NULL);
INSERT INTO loans VALUES (18, 0.175308843529287, 7, 'TestName0', 'TestSurname0', '111111-11111', '2016-08-20 00:00:00', NULL);
INSERT INTO loans VALUES (19, 8.03, 26, 'TestName0', 'TestSurname0', '111111-11111', '2016-08-20 23:32:06.945', NULL);
INSERT INTO loans VALUES (20, 3.58, 22, 'TestName0', 'TestSurname0', '111111-11111', '2016-08-20 23:32:09.581', NULL);
INSERT INTO loans VALUES (21, 2.84, 33, 'TestName0', 'TestSurname0', '111111-11111', '2016-08-20 23:32:19.561', NULL);
INSERT INTO loans VALUES (22, 0.96, 24, 'TestName0', 'TestSurname0', '111111-11111', '2016-08-20 23:32:22.63', NULL);
INSERT INTO loans VALUES (23, 292.72, 45, 'TestName0', 'TestSurname0', '111111-11111', '2016-08-20 23:32:24.003', NULL);
INSERT INTO loans VALUES (24, 0.04, 31, 'TestName0', 'TestSurname0', '111111-11111', '2016-08-20 23:32:25.283', NULL);
INSERT INTO loans VALUES (25, 69.08, 47, 'TestName', 'TestSurname', '111111-11111', '2016-08-21 11:19:48.599', NULL);
INSERT INTO loans VALUES (26, 985.29, 22, 'TestName', 'TestSurname', '111111-11111', '2016-08-21 11:19:52.648', NULL);
INSERT INTO loans VALUES (27, 71.83, 58, 'TestName', 'TestSurname', '111111-11111', '2016-08-21 11:22:59.749', 'LV');
INSERT INTO loans VALUES (28, 0.01, 45, 'TestName', 'TestSurname', '111111-11111', '2016-08-21 11:23:01.86', 'LV');
INSERT INTO loans VALUES (29, 813.41, 8, 'TestName', 'TestSurname', '111111-11111', '2016-08-21 11:23:03.331', 'LV');
INSERT INTO loans VALUES (30, 0.37, 19, 'TestName', 'TestSurname', '111111-11111', '2016-08-21 11:23:07.731', 'LV');
INSERT INTO loans VALUES (17, 0.920003354949969, 10, 'TestName0', 'TestSurname0', '222222-22222', '2016-08-20 00:00:00', NULL);
INSERT INTO loans VALUES (35, 200, 12, 'TestName1', 'TestSurname1', '111111-11111', '2016-08-21 14:55:19.17', 'US');
INSERT INTO loans VALUES (36, 400, 6, 'TestName2', 'TestSurname1', '222222-22222', '2016-08-21 14:55:19.803', 'LV');
INSERT INTO loans VALUES (37, 200, 12, 'TestName11', 'TestSurname11', '333333-33333', '2016-08-21 15:24:17.022', 'NL');
INSERT INTO loans VALUES (38, 200, 12, 'TestName1', 'TestSurname1', '111111-11111', '2016-08-21 15:24:17.213', 'US');
INSERT INTO loans VALUES (39, 400, 6, 'TestName2', 'TestSurname2', '222222-22222', '2016-08-21 15:24:17.315', 'LV');
INSERT INTO loans VALUES (40, 200, 12, 'TestName11', 'TestSurname11', '333333-33333', '2016-08-21 15:44:14.273', 'NL');
INSERT INTO loans VALUES (41, 200, 12, 'TestName1', 'TestSurname1', '111111-11111', '2016-08-21 15:44:14.488', 'US');
INSERT INTO loans VALUES (42, 400, 6, 'TestName2', 'TestSurname2', '222222-22222', '2016-08-21 15:44:14.566', 'LV');
INSERT INTO loans VALUES (43, 200, 12, 'TestName22', 'TestSurname22', '111111-11111', '2016-08-21 15:44:14.651', 'CN');
INSERT INTO loans VALUES (44, 200, 12, 'TestName11', 'TestSurname11', '333333-33333', '2016-08-21 15:46:15.23', 'NL');
INSERT INTO loans VALUES (45, 200, 12, 'TestName1', 'TestSurname1', '111111-11111', '2016-08-21 15:46:15.38', 'US');
INSERT INTO loans VALUES (46, 400, 6, 'TestName2', 'TestSurname2', '222222-22222', '2016-08-21 15:46:15.47', 'LV');
INSERT INTO loans VALUES (47, 333, 12, 'TestName22', 'TestSurname22', '111111-11111', '2016-08-21 15:46:15.542', 'CN');
INSERT INTO loans VALUES (48, 200, 12, 'TestName11', 'TestSurname11', '333333-33333', '2016-08-21 15:49:47.787', 'NL');
INSERT INTO loans VALUES (49, 200, 12, 'TestName1', 'TestSurname1', '111111-11111', '2016-08-21 15:49:47.961', 'US');
INSERT INTO loans VALUES (50, 400, 6, 'TestName2', 'TestSurname2', '222222-22222', '2016-08-21 15:49:48.053', 'LV');
INSERT INTO loans VALUES (51, 333, 12, 'TestName22', 'TestSurname22', '111111-11111', '2016-08-21 15:49:48.144', 'CN');
INSERT INTO loans VALUES (52, 200, 12, 'TestName11', 'TestSurname11', '333333-33333', '2016-08-21 15:50:37.806', 'NL');
INSERT INTO loans VALUES (53, 200, 12, 'TestName1', 'TestSurname1', '111111-11111', '2016-08-21 15:50:37.987', 'US');
INSERT INTO loans VALUES (54, 400, 6, 'TestName2', 'TestSurname2', '222222-22222', '2016-08-21 15:50:38.081', 'LV');
INSERT INTO loans VALUES (55, 333, 12, 'TestName22', 'TestSurname22', '111111-11111', '2016-08-21 15:50:38.17', 'CN');
INSERT INTO loans VALUES (56, 200, 12, 'TestName11', 'TestSurname11', '333333-33333', '2016-08-21 15:51:10.865', 'NL');
INSERT INTO loans VALUES (57, 200, 12, 'TestName1', 'TestSurname1', '111111-11111', '2016-08-21 15:51:11.048', 'US');
INSERT INTO loans VALUES (58, 400, 6, 'TestName2', 'TestSurname2', '222222-22222', '2016-08-21 15:51:11.137', 'LV');
INSERT INTO loans VALUES (59, 333, 12, 'TestName22', 'TestSurname22', '111111-11111', '2016-08-21 15:51:11.219', 'CN');
INSERT INTO loans VALUES (60, 200, 12, 'TestName11', 'TestSurname11', '333333-33333', '2016-08-21 16:22:27.47', 'NL');
INSERT INTO loans VALUES (61, 200, 12, 'TestName1', 'TestSurname1', '111111-11111', '2016-08-21 16:22:27.657', 'US');
INSERT INTO loans VALUES (62, 400, 6, 'TestName2', 'TestSurname2', '222222-22222', '2016-08-21 16:22:27.75', 'LV');
INSERT INTO loans VALUES (63, 333, 12, 'TestName22', 'TestSurname22', '111111-11111', '2016-08-21 16:22:27.848', 'CN');
INSERT INTO loans VALUES (64, 200, 12, 'TestName11', 'TestSurname11', '333333-33333', '2016-08-21 16:25:54.765', 'NL');
INSERT INTO loans VALUES (65, 200, 12, 'TestName11', 'TestSurname11', '333333-33333', '2016-08-21 16:25:55.457', 'NL');
INSERT INTO loans VALUES (66, 200, 12, 'TestName1', 'TestSurname1', '111111-11111', '2016-08-21 16:25:55.576', 'US');
INSERT INTO loans VALUES (67, 400, 6, 'TestName2', 'TestSurname2', '222222-22222', '2016-08-21 16:25:55.662', 'LV');
INSERT INTO loans VALUES (68, 333, 12, 'TestName22', 'TestSurname22', '111111-11111', '2016-08-21 16:25:55.745', 'CN');
INSERT INTO loans VALUES (69, 200, 12, 'TestName11', 'TestSurname11', '333333-33333', '2016-08-21 16:26:25.446', 'NL');
INSERT INTO loans VALUES (70, 200, 12, 'TestName11', 'TestSurname11', '333333-33333', '2016-08-21 16:26:26.368', 'NL');
INSERT INTO loans VALUES (71, 200, 12, 'TestName1', 'TestSurname1', '111111-11111', '2016-08-21 16:26:26.482', 'US');
INSERT INTO loans VALUES (72, 400, 6, 'TestName2', 'TestSurname2', '222222-22222', '2016-08-21 16:26:26.555', 'LV');
INSERT INTO loans VALUES (73, 333, 12, 'TestName22', 'TestSurname22', '111111-11111', '2016-08-21 16:26:26.627', 'CN');
INSERT INTO loans VALUES (74, 200, 12, 'TestName11', 'TestSurname11', '333333-33333', '2016-08-21 16:26:38.706', 'NL');
INSERT INTO loans VALUES (75, 200, 12, 'TestName11', 'TestSurname11', '333333-33333', '2016-08-21 16:26:39.299', 'NL');
INSERT INTO loans VALUES (76, 200, 12, 'TestName1', 'TestSurname1', '111111-11111', '2016-08-21 16:26:39.417', 'US');
INSERT INTO loans VALUES (77, 400, 6, 'TestName2', 'TestSurname2', '222222-22222', '2016-08-21 16:26:39.509', 'LV');
INSERT INTO loans VALUES (78, 333, 12, 'TestName22', 'TestSurname22', '111111-11111', '2016-08-21 16:26:39.598', 'CN');
INSERT INTO loans VALUES (79, 200, 12, 'TestName11', 'TestSurname11', '333333-33333', '2016-08-21 16:26:48.547', 'NL');
INSERT INTO loans VALUES (80, 200, 12, 'TestName11', 'TestSurname11', '333333-33333', '2016-08-21 16:26:49.474', 'NL');
INSERT INTO loans VALUES (81, 200, 12, 'TestName1', 'TestSurname1', '111111-11111', '2016-08-21 16:26:49.589', 'US');
INSERT INTO loans VALUES (82, 400, 6, 'TestName2', 'TestSurname2', '222222-22222', '2016-08-21 16:26:49.678', 'LV');
INSERT INTO loans VALUES (83, 333, 12, 'TestName22', 'TestSurname22', '111111-11111', '2016-08-21 16:26:49.761', 'CN');
INSERT INTO loans VALUES (84, 200, 12, 'TestName11', 'TestSurname11', '333333-33333', '2016-08-21 16:37:24.818', 'NL');
INSERT INTO loans VALUES (85, 200, 12, 'TestName11', 'TestSurname11', '333333-33333', '2016-08-21 16:37:25.786', 'NL');
INSERT INTO loans VALUES (86, 200, 12, 'TestName1', 'TestSurname1', '111111-11111', '2016-08-21 16:37:25.883', 'US');
INSERT INTO loans VALUES (87, 400, 6, 'TestName2', 'TestSurname2', '222222-22222', '2016-08-21 16:37:25.957', 'LV');
INSERT INTO loans VALUES (88, 333, 12, 'TestName22', 'TestSurname22', '111111-11111', '2016-08-21 16:37:26.031', 'CN');
INSERT INTO loans VALUES (89, 200, 12, 'TestName11', 'TestSurname11', '333333-33333', '2016-08-21 16:37:59.476', 'NL');
INSERT INTO loans VALUES (90, 200, 12, 'TestName11', 'TestSurname11', '333333-33333', '2016-08-21 16:38:00.431', 'NL');
INSERT INTO loans VALUES (91, 200, 12, 'TestName1', 'TestSurname1', '111111-11111', '2016-08-21 16:38:00.561', 'US');
INSERT INTO loans VALUES (92, 400, 6, 'TestName2', 'TestSurname2', '222222-22222', '2016-08-21 16:38:00.658', 'LV');
INSERT INTO loans VALUES (93, 333, 12, 'TestName22', 'TestSurname22', '111111-11111', '2016-08-21 16:38:00.74', 'CN');
INSERT INTO loans VALUES (94, 200, 12, 'TestName11', 'TestSurname11', '333333-33333', '2016-08-21 16:49:33.134', 'NL');
INSERT INTO loans VALUES (95, 200, 12, 'TestName11', 'TestSurname11', '333333-33333', '2016-08-21 16:49:34.063', 'NL');
INSERT INTO loans VALUES (96, 200, 12, 'TestName1', 'TestSurname1', '111111-11111', '2016-08-21 16:49:34.18', 'US');
INSERT INTO loans VALUES (97, 400, 6, 'TestName2', 'TestSurname2', '222222-22222', '2016-08-21 16:49:34.286', 'LV');
INSERT INTO loans VALUES (98, 333, 12, 'TestName22', 'TestSurname22', '111111-11111', '2016-08-21 16:49:34.376', 'CN');


--
-- TOC entry 2119 (class 0 OID 0)
-- Dependencies: 183
-- Name: loans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('loans_id_seq', 98, true);


--
-- TOC entry 1987 (class 2606 OID 16441)
-- Name: blacklist_personalid_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blacklist
    ADD CONSTRAINT blacklist_personalid_pk PRIMARY KEY (personalid);


--
-- TOC entry 1990 (class 2606 OID 16443)
-- Name: loans_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY loans
    ADD CONSTRAINT loans_pk PRIMARY KEY (id);


--
-- TOC entry 1988 (class 1259 OID 16444)
-- Name: loans_date_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX loans_date_index ON loans USING btree (applicationdate);


--
-- TOC entry 2114 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 2116 (class 0 OID 0)
-- Dependencies: 181
-- Name: blacklist; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE blacklist FROM PUBLIC;
REVOKE ALL ON TABLE blacklist FROM postgres;
GRANT ALL ON TABLE blacklist TO postgres;
GRANT SELECT,INSERT,DELETE,TRUNCATE,UPDATE ON TABLE blacklist TO twino;


--
-- TOC entry 2117 (class 0 OID 0)
-- Dependencies: 182
-- Name: loans; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE loans FROM PUBLIC;
REVOKE ALL ON TABLE loans FROM postgres;
GRANT ALL ON TABLE loans TO postgres;
GRANT SELECT,INSERT,DELETE,TRUNCATE,UPDATE ON TABLE loans TO twino;


--
-- TOC entry 2118 (class 0 OID 0)
-- Dependencies: 183
-- Name: loans_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE loans_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE loans_id_seq FROM postgres;
GRANT ALL ON SEQUENCE loans_id_seq TO postgres;
GRANT ALL ON SEQUENCE loans_id_seq TO twino;


-- Completed on 2016-08-21 17:59:30

--
-- PostgreSQL database dump complete
--

