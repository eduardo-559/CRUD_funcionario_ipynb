--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

-- Started on 2022-05-12 18:34:39

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 9351254)
-- Name: empresa; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA empresa;


ALTER SCHEMA empresa OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 199 (class 1259 OID 9351273)
-- Name: departamento; Type: TABLE; Schema: empresa; Owner: postgres
--

CREATE TABLE empresa.departamento (
    dnome character varying(30),
    dnumero integer NOT NULL,
    cpf_gerente character varying(11),
    data_inicio_gerente date
);


ALTER TABLE empresa.departamento OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 9351291)
-- Name: dependente; Type: TABLE; Schema: empresa; Owner: postgres
--

CREATE TABLE empresa.dependente (
    fcpf character varying(11),
    nome_dependente character varying(30),
    sexo character varying(1),
    datanasc date,
    parentesco character varying(30)
);


ALTER TABLE empresa.dependente OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 9351258)
-- Name: funcionario; Type: TABLE; Schema: empresa; Owner: postgres
--

CREATE TABLE empresa.funcionario (
    pnome character varying(30) NOT NULL,
    minicial character varying(30),
    unome character varying(30) NOT NULL,
    cpf character varying(11) NOT NULL,
    datanasc date,
    endereco character varying(30) NOT NULL,
    sexo character varying(1),
    salario numeric,
    cpf_supervisor character varying(11),
    dnr integer,
    rg character varying(30)
);


ALTER TABLE empresa.funcionario OWNER TO postgres;




CREATE VIEW empresa.funcionario_dep AS
 SELECT (((f.pnome)::text || ' '::text) || (f.unome)::text) AS nome,
    d.dnome AS depart
   FROM (empresa.funcionario f
     JOIN empresa.departamento d ON ((f.dnr = d.dnumero)));


ALTER TABLE empresa.funcionario_dep OWNER TO postgres;

--


CREATE TABLE empresa.localizacoes_dep (
    dnumero integer,
    dlocal character varying(30)
);


ALTER TABLE empresa.localizacoes_dep OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 9351278)
-- Name: projeto; Type: TABLE; Schema: empresa; Owner: postgres
--

CREATE TABLE empresa.projeto (
    projnome character varying(50),
    projnumero integer NOT NULL,
    projlocal character varying(50),
    dnum integer
);


ALTER TABLE empresa.projeto OWNER TO postgres;




CREATE TABLE empresa.trabalha_em (
    fcpf character varying(11),
    pnr integer,
    horas integer
);


ALTER TABLE empresa.trabalha_em OWNER TO postgres;


--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

-- Started on 2022-05-12 18:37:47

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2863 (class 0 OID 9351273)
-- Dependencies: 199
-- Data for Name: departamento; Type: TABLE DATA; Schema: empresa; Owner: postgres
--

INSERT INTO empresa.departamento VALUES ('Matriz', 1, NULL, NULL);
INSERT INTO empresa.departamento VALUES ('Administração', 4, NULL, NULL);
INSERT INTO empresa.departamento VALUES ('Pesquisa', 5, '33344555587', NULL);


--
-- TOC entry 2866 (class 0 OID 9351291)
-- Dependencies: 202
-- Data for Name: dependente; Type: TABLE DATA; Schema: empresa; Owner: postgres
--

--
-- TOC entry 2862 (class 0 OID 9351258)
-- Dependencies: 198
-- Data for Name: funcionario; Type: TABLE DATA; Schema: empresa; Owner: postgres
--

-- Some inserts to make your experience easier:

INSERT INTO empresa.funcionario VALUES ('Eduardo', 'T', 'Oliveira', '33344555587', '2002-11-16', 'Rua da Lapa, 34, São Paulo, SP', 'M', 40000, NULL, 5, NULL);
INSERT INTO empresa.funcionario VALUES ('Marly', 'B', 'Lima', '12345678966', '1985-01-09', 'R Flores 781, São Paulo, SP', 'M', 30000, '33344555587', 5, NULL);
INSERT INTO empresa.funcionario VALUES ('Alice', 'J', 'Zelaya', '99988777767', '1968-01-19', 'R Lima, 35, Curitiba, PR', 'F', 25000, '12345678966', 4, NULL);
INSERT INTO empresa.funcionario VALUES ('Barbara', 'A', 'Silva', '11122233355', NULL, 'Rua x', NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 2861 (class 0 OID 9351255)
-- Dependencies: 197
-- Data for Name: localizacoes_dep; Type: TABLE DATA; Schema: empresa; Owner: postgres
--

INSERT INTO empresa.localizacoes_dep VALUES (1, 'Quixada');
INSERT INTO empresa.localizacoes_dep VALUES (1, 'Fortaleza');
INSERT INTO empresa.localizacoes_dep VALUES (4, 'Mombaça');
INSERT INTO empresa.localizacoes_dep VALUES (5, 'Iguatu');


--
-- TOC entry 2864 (class 0 OID 9351278)
-- Dependencies: 200
-- Data for Name: projeto; Type: TABLE DATA; Schema: empresa; Owner: postgres
--

INSERT INTO empresa.projeto VALUES ('projetoA', 1, 'Fortaleza', 1);
INSERT INTO empresa.projeto VALUES ('projetoB', 2, 'Quixadá', 4);
INSERT INTO empresa.projeto VALUES ('projetoC', 3, 'Mombaça', 5);
INSERT INTO empresa.projeto VALUES ('ProjetoX', 10, 'Fortaleza', 5);


--
-- TOC entry 2865 (class 0 OID 9351283)
-- Dependencies: 201
-- Data for Name: trabalha_em; Type: TABLE DATA; Schema: empresa; Owner: postgres
--



-- Completed on 2022-05-12 18:37:47

--
-- PostgreSQL database dump complete
--
