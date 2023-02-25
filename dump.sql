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
    token text NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL
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
-- Name: url; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.url (
    id integer NOT NULL,
    userid integer,
    originalurl text NOT NULL,
    shorturl character varying(100) NOT NULL,
    visitcounter integer DEFAULT 0 NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: url_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.url_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: url_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.url_id_seq OWNED BY public.url.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(110) NOT NULL,
    password character varying(255) NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL
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
-- Name: url id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.url ALTER COLUMN id SET DEFAULT nextval('public.url_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: authtoken; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.authtoken VALUES (1, 1, '90b6aad3-2c69-45bd-b92f-df9c708fc37f', '2023-02-25 16:17:36.509378');
INSERT INTO public.authtoken VALUES (2, 1, '198c3465-da27-4cc2-bf56-6d0cb22cb2a1', '2023-02-25 16:39:37.61757');
INSERT INTO public.authtoken VALUES (3, 1, 'dc4290f0-492d-40fa-beb5-6322db1dcfc8', '2023-02-25 18:49:45.660578');
INSERT INTO public.authtoken VALUES (4, 1, 'c9d0acf1-a287-4ff1-9863-b5da98c3a589', '2023-02-25 18:50:28.793433');
INSERT INTO public.authtoken VALUES (5, 1, 'cba8d987-a937-4403-a8fc-48b14d1e0175', '2023-02-25 18:53:33.355221');
INSERT INTO public.authtoken VALUES (6, 1, '9d368873-75c7-46a6-9e4b-6ed0d5426fe4', '2023-02-25 18:58:04.895932');


--
-- Data for Name: url; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.url VALUES (1, NULL, 'https://www.google.com/search?q=url+para+desencurtar&sxsrf=AJOqlzWww_TicokzWwi_njNuQL87jyTzHg%3A1677361622015&ei=1oH6Y5NTlL7k5Q_GmJEY&ved=0ahUKEwiTlo_90rH9AhUUH7kGHUZMBAMQ4dUDCA8&uact=5&oq=url+para+desencurtar&gs_lcp=Cgxnd3Mtd2l6LXNlcnAQAzIFCCEQoAEyBQghEKABMgUIIRCgATIFCCEQoAE6BAgjECc6EQguEIAEELEDEIMBEMcBENEDOggIABCxAxCDAToLCC4QgAQQxwEQ0QM6CwguEIAEELEDEIMBOgQIABBDOgUIABCABDoFCC4QgAQ6BggAEAoQQzoRCC4QgwEQxwEQsQMQ0QMQgAQ6BAgAEAM6CggAELEDEIMBEEM6CwgAEIAEELEDEIMBOggIABCABBCxAzoICAAQgAQQywE6BggAEBYQHjoJCAAQFhAeEPEEOgcIABCABBATOggIABAWEB4QCkoECEEYAFAAWKsXYLQYaABwAXgAgAGqAYgB1ROSAQQwLjE5mAEAoAEBwAEB&sclient=gws-wiz-serp', 'Ea_PhEfcKkaedQfXAupr', 0, '2023-02-25 19:02:11.786384');
INSERT INTO public.url VALUES (2, NULL, 'https://www.google.com/search?q=url+para+desencurtar&sxsrf=AJOqlzWww_TicokzWwi_njNuQL87jyTzHg%3A1677361622015&ei=1oH6Y5NTlL7k5Q_GmJEY&ved=0ahUKEwiTlo_90rH9AhUUH7kGHUZMBAMQ4dUDCA8&uact=5&oq=url+para+desencurtar&gs_lcp=Cgxnd3Mtd2l6LXNlcnAQAzIFCCEQoAEyBQghEKABMgUIIRCgATIFCCEQoAE6BAgjECc6EQguEIAEELEDEIMBEMcBENEDOggIABCxAxCDAToLCC4QgAQQxwEQ0QM6CwguEIAEELEDEIMBOgQIABBDOgUIABCABDoFCC4QgAQ6BggAEAoQQzoRCC4QgwEQxwEQsQMQ0QMQgAQ6BAgAEAM6CggAELEDEIMBEEM6CwgAEIAEELEDEIMBOggIABCABBCxAzoICAAQgAQQywE6BggAEBYQHjoJCAAQFhAeEPEEOgcIABCABBATOggIABAWEB4QCkoECEEYAFAAWKsXYLQYaABwAXgAgAGqAYgB1ROSAQQwLjE5mAEAoAEBwAEB&sclient=gws-wiz-serp', 'N53hXuX7J-1qp54mf2nT', 0, '2023-02-25 19:02:51.970345');
INSERT INTO public.url VALUES (3, 1, 'https://www.google.com/search?q=url+para+desencurtar&sxsrf=AJOqlzWww_TicokzWwi_njNuQL87jyTzHg%3A1677361622015&ei=1oH6Y5NTlL7k5Q_GmJEY&ved=0ahUKEwiTlo_90rH9AhUUH7kGHUZMBAMQ4dUDCA8&uact=5&oq=url+para+desencurtar&gs_lcp=Cgxnd3Mtd2l6LXNlcnAQAzIFCCEQoAEyBQghEKABMgUIIRCgATIFCCEQoAE6BAgjECc6EQguEIAEELEDEIMBEMcBENEDOggIABCxAxCDAToLCC4QgAQQxwEQ0QM6CwguEIAEELEDEIMBOgQIABBDOgUIABCABDoFCC4QgAQ6BggAEAoQQzoRCC4QgwEQxwEQsQMQ0QMQgAQ6BAgAEAM6CggAELEDEIMBEEM6CwgAEIAEELEDEIMBOggIABCABBCxAzoICAAQgAQQywE6BggAEBYQHjoJCAAQFhAeEPEEOgcIABCABBATOggIABAWEB4QCkoECEEYAFAAWKsXYLQYaABwAXgAgAGqAYgB1ROSAQQwLjE5mAEAoAEBwAEB&sclient=gws-wiz-serp', 'ZVpXBJ-pANCkhUotHlsT', 0, '2023-02-25 19:03:03.795387');
INSERT INTO public.url VALUES (4, 1, 'https://www.google.com/search?q=url+para+desencurtar&sxsrf=AJOqlzWww_TicokzWwi_njNuQL87jyTzHg%3A1677361622015&ei=1oH6Y5NTlL7k5Q_GmJEY&ved=0ahUKEwiTlo_90rH9AhUUH7kGHUZMBAMQ4dUDCA8&uact=5&oq=url+para+desencurtar&gs_lcp=Cgxnd3Mtd2l6LXNlcnAQAzIFCCEQoAEyBQghEKABMgUIIRCgATIFCCEQoAE6BAgjECc6EQguEIAEELEDEIMBEMcBENEDOggIABCxAxCDAToLCC4QgAQQxwEQ0QM6CwguEIAEELEDEIMBOgQIABBDOgUIABCABDoFCC4QgAQ6BggAEAoQQzoRCC4QgwEQxwEQsQMQ0QMQgAQ6BAgAEAM6CggAELEDEIMBEEM6CwgAEIAEELEDEIMBOggIABCABBCxAzoICAAQgAQQywE6BggAEBYQHjoJCAAQFhAeEPEEOgcIABCABBATOggIABAWEB4QCkoECEEYAFAAWKsXYLQYaABwAXgAgAGqAYgB1ROSAQQwLjE5mAEAoAEBwAEB&sclient=gws-wiz-serp', 'b830KdnRNKW74BOFPixy', 0, '2023-02-25 19:03:49.406478');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'João', 'joao2@driven.com.br', '$2b$10$zNUgf8XVi05mphnXt7vIruuLi/dJsQw9FIB9qAMaxxcux3UqYTVOq', '2023-02-25 16:17:14.920959');


--
-- Name: authtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.authtoken_id_seq', 6, true);


--
-- Name: url_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.url_id_seq', 4, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


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
-- Name: url url_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.url
    ADD CONSTRAINT url_pkey PRIMARY KEY (id);


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
-- Name: url url_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.url
    ADD CONSTRAINT url_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

