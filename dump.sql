--
-- PostgreSQL database dump
--

-- Dumped from database version 12.13 (Ubuntu 12.13-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.13 (Ubuntu 12.13-0ubuntu0.20.04.1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: authtoken; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.authtoken (
    id integer NOT NULL,
    userid integer,
    token text NOT NULL
);


--
-- Name: authtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.authtoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: authtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.authtoken_id_seq OWNED BY public.authtoken.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(110) NOT NULL,
    password character varying(255) NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: authtoken id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.authtoken ALTER COLUMN id SET DEFAULT nextval('public.authtoken_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: authtoken; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.authtoken VALUES (1, 2, '5132962a-2230-4f4d-bf46-0547900f6308');
INSERT INTO public.authtoken VALUES (2, 2, '705ff990-745a-4a34-a393-66b434181a86');
INSERT INTO public.authtoken VALUES (3, 2, '140f6bae-3ff7-4c0f-ab00-2860d4018068');
INSERT INTO public.authtoken VALUES (4, 2, '28d637cc-925f-4c35-889e-7e3075a97aa7');
INSERT INTO public.authtoken VALUES (5, 2, '701deea7-aebb-43d8-904c-0113f037bac0');
INSERT INTO public.authtoken VALUES (6, 2, '36e0c926-9fd5-4356-8fd2-ccba53be9720');
INSERT INTO public.authtoken VALUES (7, 2, 'f9de7f17-1d9b-4672-8a19-b50196699636');
INSERT INTO public.authtoken VALUES (8, 2, '8f48b163-7b3c-4fa1-a633-8fd8fdd7d562');
INSERT INTO public.authtoken VALUES (9, 2, 'bc65dbb5-286b-4f9d-9957-02366bde52ff');
INSERT INTO public.authtoken VALUES (10, 2, 'c50dfde6-dce0-4fc2-8b0d-20c84e48d889');
INSERT INTO public.authtoken VALUES (11, 2, '6cfdae70-14d1-4780-8c7f-7b6ad8840788');
INSERT INTO public.authtoken VALUES (12, 2, 'dbb3b64b-d3a6-4fd2-b9fc-778f75687a5b');
INSERT INTO public.authtoken VALUES (13, 2, 'bd8fe9ec-1a66-4dcd-a9e2-7465fc1beec5');
INSERT INTO public.authtoken VALUES (14, 1, '7216ed79-6a38-4473-8aba-d09e93d2df12');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'João', 'joao12@driven.com.br', '$2b$10$jZtNyN0pALrCJQOJahOFq.y8ka2p5TH2xhkU.IPBpYxmND2BiVbgy');
INSERT INTO public.users VALUES (2, 'João', 'joao22@driven.com.br', '$2b$10$W1Tfvo1H3xw9meEirZBuQese03BGhWYzpYN6QZdxzItXJ69phWIHO');


--
-- Name: authtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.authtoken_id_seq', 14, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: authtoken authtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.authtoken
    ADD CONSTRAINT authtoken_pkey PRIMARY KEY (id);


--
-- Name: authtoken authtoken_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.authtoken
    ADD CONSTRAINT authtoken_token_key UNIQUE (token);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: authtoken authtoken_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.authtoken
    ADD CONSTRAINT authtoken_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

