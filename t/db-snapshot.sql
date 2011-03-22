--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.user_info DROP CONSTRAINT user_info_login_id_fkey;
ALTER TABLE ONLY public.medium DROP CONSTRAINT medium_same_as_fkey;
ALTER TABLE ONLY public.medium DROP CONSTRAINT medium_root_id_fkey;
DROP INDEX public.medium_root_id_idx;
ALTER TABLE ONLY public.user_login DROP CONSTRAINT user_login_pkey;
ALTER TABLE ONLY public.user_login DROP CONSTRAINT user_login_name_key;
ALTER TABLE ONLY public.user_info DROP CONSTRAINT user_info_pkey;
ALTER TABLE ONLY public.medium DROP CONSTRAINT medium_pkey;
ALTER TABLE ONLY public.medium DROP CONSTRAINT medium_asin_key;
ALTER TABLE public.user_login ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.user_info ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.medium ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.user_login_id_seq;
DROP TABLE public.user_login;
DROP SEQUENCE public.user_info_id_seq;
DROP TABLE public.user_info;
DROP SEQUENCE public.medium_id_seq;
DROP TABLE public.medium;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--



SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: medium; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE medium (
    id integer NOT NULL,
    asin character(10),
    isbn character varying(13),
    title character varying(255) NOT NULL,
    made_by character varying(255),
    publisher character varying(255),
    amazon_url character varying(255),
    small_image character varying(255),
    medium_image character varying(255),
    large_image character varying(255),
    publish_year smallint,
    root_id integer,
    same_as integer,
    l integer DEFAULT 1 NOT NULL,
    r integer DEFAULT 2 NOT NULL,
    level integer DEFAULT 0 NOT NULL
);


--
-- Name: medium_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE medium_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: medium_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE medium_id_seq OWNED BY medium.id;


--
-- Name: medium_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('medium_id_seq', 45, true);


--
-- Name: user_info; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE user_info (
    id integer NOT NULL,
    login_id integer NOT NULL,
    real_name character varying(64),
    email character varying(255)
);


--
-- Name: user_info_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: user_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_info_id_seq OWNED BY user_info.id;


--
-- Name: user_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('user_info_id_seq', 4, true);


--
-- Name: user_login; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE user_login (
    id integer NOT NULL,
    name character varying(64),
    salt bytea NOT NULL,
    cost integer NOT NULL,
    pw_hash bytea NOT NULL
);


--
-- Name: user_login_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_login_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: user_login_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_login_id_seq OWNED BY user_login.id;


--
-- Name: user_login_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('user_login_id_seq', 4, true);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE medium ALTER COLUMN id SET DEFAULT nextval('medium_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE user_info ALTER COLUMN id SET DEFAULT nextval('user_info_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE user_login ALTER COLUMN id SET DEFAULT nextval('user_login_id_seq'::regclass);


--
-- Data for Name: medium; Type: TABLE DATA; Schema: public; Owner: -
--

COPY medium (id, asin, isbn, title, made_by, publisher, amazon_url, small_image, medium_image, large_image, publish_year, root_id, same_as, l, r, level) FROM stdin;
9	0316037834	9780316037839	The Ambassador's Mission	Trudi Canavan	Orbit	http://www.amazon.com/Ambassadors-Mission-Traitor-Spy-Trilogy/dp/0316037834%3FSubscriptionId%3DAKIAJQH5L3AY6MOXEEVQ%26tag%3Dwebservices-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D0316037834	http://ecx.images-amazon.com/images/I/51rcW1kFeGL._SL75_.jpg	http://ecx.images-amazon.com/images/I/51rcW1kFeGL._SL160_.jpg	http://ecx.images-amazon.com/images/I/51rcW1kFeGL.jpg	2010	38	\N	2	3	1
10	0316037869	0316037869	The Rogue	Trudi Canavan	Orbit	http://www.amazon.com/Rogue-Traitor-Spy-Trilogy/dp/0316037869%3FSubscriptionId%3DAKIAJQH5L3AY6MOXEEVQ%26tag%3Dwebservices-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D0316037869	http://ecx.images-amazon.com/images/I/51UYVonc3lL._SL75_.jpg	http://ecx.images-amazon.com/images/I/51UYVonc3lL._SL160_.jpg	http://ecx.images-amazon.com/images/I/51UYVonc3lL.jpg	2011	38	\N	4	5	1
6	006057528X	006057528X	The Magicians' Guild	Trudi Canavan	Harper Voyager	http://www.amazon.com/Magicians-Guild-Black-Magician-Trilogy/dp/006057528X%3FSubscriptionId%3DAKIAJQH5L3AY6MOXEEVQ%26tag%3Dwebservices-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D006057528X	http://ecx.images-amazon.com/images/I/51tN5SeF1wL._SL75_.jpg	http://ecx.images-amazon.com/images/I/51tN5SeF1wL._SL160_.jpg	http://ecx.images-amazon.com/images/I/51tN5SeF1wL.jpg	2004	39	\N	2	3	1
7	0060575298	9780060575298	The Novice	Trudi Canavan	Harper Voyager	http://www.amazon.com/Novice-Black-Magician-Trilogy-Book/dp/0060575298%3FSubscriptionId%3DAKIAJQH5L3AY6MOXEEVQ%26tag%3Dwebservices-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D0060575298	http://ecx.images-amazon.com/images/I/415Td1q9EmL._SL75_.jpg	http://ecx.images-amazon.com/images/I/415Td1q9EmL._SL160_.jpg	http://ecx.images-amazon.com/images/I/415Td1q9EmL.jpg	2004	39	\N	4	5	1
8	0060575301	9780060575304	The High Lord	Trudi Canavan	Harper Voyager	http://www.amazon.com/High-Lord-Black-Magician-Trilogy/dp/0060575301%3FSubscriptionId%3DAKIAJQH5L3AY6MOXEEVQ%26tag%3Dwebservices-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D0060575301	http://ecx.images-amazon.com/images/I/51Q-3cRiwiL._SL75_.jpg	http://ecx.images-amazon.com/images/I/51Q-3cRiwiL._SL160_.jpg	http://ecx.images-amazon.com/images/I/51Q-3cRiwiL.jpg	2004	39	\N	6	7	1
4	0345518705	9780345518705	The Warded Man	Peter V. Brett	Del Rey	http://www.amazon.com/Warded-Man-Peter-V-Brett/dp/0345518705%3FSubscriptionId%3DAKIAJQH5L3AY6MOXEEVQ%26tag%3Dwebservices-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D0345518705	http://ecx.images-amazon.com/images/I/51u6lj2ouJL._SL75_.jpg	http://ecx.images-amazon.com/images/I/51u6lj2ouJL._SL160_.jpg	http://ecx.images-amazon.com/images/I/51u6lj2ouJL.jpg	2010	42	\N	2	3	1
5	0345503813	0345503813	The Desert Spear	Peter V. Brett	Del Rey	http://www.amazon.com/Desert-Spear-Peter-V-Brett/dp/0345503813%3FSubscriptionId%3DAKIAJQH5L3AY6MOXEEVQ%26tag%3Dwebservices-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D0345503813	http://ecx.images-amazon.com/images/I/41fvCXHZoHL._SL75_.jpg	http://ecx.images-amazon.com/images/I/41fvCXHZoHL._SL160_.jpg	http://ecx.images-amazon.com/images/I/41fvCXHZoHL.jpg	2010	42	\N	4	5	1
12	B0017PICLQ	\N	The Silmarillion, Second Edition	J.R.R. Tolkien, Christopher Tolkien	\N	http://www.amazon.com/Silmarillion-Second-J-R-R-Tolkien/dp/B0017PICLQ%3FSubscriptionId%3DAKIAJQH5L3AY6MOXEEVQ%26tag%3Dwebservices-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB0017PICLQ	http://ecx.images-amazon.com/images/I/41%2BsuVXiorL._SL75_.jpg	http://ecx.images-amazon.com/images/I/41%2BsuVXiorL._SL160_.jpg	http://ecx.images-amazon.com/images/I/41%2BsuVXiorL.jpg	\N	44	\N	2	3	1
11	0345296044	0345296044	The Hobbit	J.R.R. Tolkien	Ballantine Books	http://www.amazon.com/Hobbit-J-R-R-Tolkien/dp/0345296044%3FSubscriptionId%3DAKIAJQH5L3AY6MOXEEVQ%26tag%3Dwebservices-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D0345296044	http://ecx.images-amazon.com/images/I/61BtpQ95N7L._SL75_.jpg	http://ecx.images-amazon.com/images/I/61BtpQ95N7L._SL160_.jpg	http://ecx.images-amazon.com/images/I/61BtpQ95N7L.jpg	1981	44	\N	4	5	1
3	0007269722	9780007269723	Lord of the Rings, The: The Return of the King	J. R. R. Tolkien	HarperCollins	http://www.amazon.com/Lord-Rings-J-R-Tolkien/dp/0007269722%3FSubscriptionId%3DAKIAJQH5L3AY6MOXEEVQ%26tag%3Dwebservices-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D0007269722	http://ecx.images-amazon.com/images/I/51W9T9VpTjL._SL75_.jpg	http://ecx.images-amazon.com/images/I/51W9T9VpTjL._SL160_.jpg	http://ecx.images-amazon.com/images/I/51W9T9VpTjL.jpg	2008	44	\N	11	12	2
13	0618154043	0618154043	Unfinished Tales of Numenor and Middle-earth	Christopher Tolkien, J.R.R. Tolkien	Houghton Mifflin Harcourt	http://www.amazon.com/Unfinished-Numenor-Middle-earth-Christopher-Tolkien/dp/0618154043%3FSubscriptionId%3DAKIAJQH5L3AY6MOXEEVQ%26tag%3Dwebservices-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D0618154043	http://ecx.images-amazon.com/images/I/51c7zKC8DSL._SL75_.jpg	http://ecx.images-amazon.com/images/I/51c7zKC8DSL._SL160_.jpg	http://ecx.images-amazon.com/images/I/51c7zKC8DSL.jpg	\N	44	\N	14	15	1
14	0765342987	9780765342980	Kushiel's Dart	Jacqueline Carey	Tor Fantasy	http://www.amazon.com/Kushiels-Dart-Jacqueline-Carey/dp/0765342987%3FSubscriptionId%3DAKIAJQH5L3AY6MOXEEVQ%26tag%3Dwebservices-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D0765342987	http://ecx.images-amazon.com/images/I/51wgsbYdF9L._SL75_.jpg	http://ecx.images-amazon.com/images/I/51wgsbYdF9L._SL160_.jpg	http://ecx.images-amazon.com/images/I/51wgsbYdF9L.jpg	2002	45	\N	3	4	2
23	0786852550	0786852550	The Amulet of Samarkand	Jonathan Stroud	Disney-Hyperion	http://www.amazon.com/Amulet-Samarkand-Bartimaeus-Trilogy-Book/dp/0786852550%3FSubscriptionId%3DAKIAJQH5L3AY6MOXEEVQ%26tag%3Dwebservices-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D0786852550	http://ecx.images-amazon.com/images/I/51DGa4T2v2L._SL75_.jpg	http://ecx.images-amazon.com/images/I/51DGa4T2v2L._SL160_.jpg	http://ecx.images-amazon.com/images/I/51DGa4T2v2L.jpg	2004	23	\N	1	2	0
24	1423123727	9781423123729	Bartimaeus: The Ring of Solomon	Jonathan Stroud	Hyperion Book CH	http://www.amazon.com/Bartimaeus-Ring-Solomon-Jonathan-Stroud/dp/1423123727%3FSubscriptionId%3DAKIAJQH5L3AY6MOXEEVQ%26tag%3Dwebservices-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D1423123727	http://ecx.images-amazon.com/images/I/41LYVL93LgL._SL75_.jpg	http://ecx.images-amazon.com/images/I/41LYVL93LgL._SL160_.jpg	http://ecx.images-amazon.com/images/I/41LYVL93LgL.jpg	2010	24	\N	1	2	0
25	078683868X	078683868X	Ptolemy's Gate	Jonathan Stroud	Hyperion Book CH	http://www.amazon.com/Ptolemys-Gate-Bartimaeus-Trilogy-Book/dp/078683868X%3FSubscriptionId%3DAKIAJQH5L3AY6MOXEEVQ%26tag%3Dwebservices-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D078683868X	http://ecx.images-amazon.com/images/I/21GDQ710ADL._SL75_.jpg	http://ecx.images-amazon.com/images/I/21GDQ710ADL._SL160_.jpg	http://ecx.images-amazon.com/images/I/21GDQ710ADL.jpg	2007	25	\N	1	2	0
26	142310420X	142310420X	The Bartimaeus Trilogy Boxed Set	Jonathan Stroud	Disney-Hyperion	http://www.amazon.com/Bartimaeus-Trilogy-Boxed-Set/dp/142310420X%3FSubscriptionId%3DAKIAJQH5L3AY6MOXEEVQ%26tag%3Dwebservices-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D142310420X	http://ecx.images-amazon.com/images/I/21E0CGCDZEL._SL75_.jpg	http://ecx.images-amazon.com/images/I/21E0CGCDZEL._SL160_.jpg	http://ecx.images-amazon.com/images/I/21E0CGCDZEL.jpg	\N	26	\N	1	2	0
27	038560615X	038560615X	Golem's Eye	Jonathan Stroud	Doubleday Children's Books	http://www.amazon.com/Golems-Bartimaeus-Trilogy-Jonathan-Stroud/dp/038560615X%3FSubscriptionId%3DAKIAJQH5L3AY6MOXEEVQ%26tag%3Dwebservices-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D038560615X	http://ecx.images-amazon.com/images/I/41073NG1J3L._SL75_.jpg	http://ecx.images-amazon.com/images/I/41073NG1J3L._SL160_.jpg	http://ecx.images-amazon.com/images/I/41073NG1J3L.jpg	2004	27	\N	1	2	0
28	3802581202	3802581202	Kushiel 01. Das Zeichen	Jacqueline Carey	Egmont vgs Verlagsgesell.	http://www.amazon.com/Kushiel-01-Zeichen-Jacqueline-Carey/dp/3802581202%3FSubscriptionId%3DAKIAJQH5L3AY6MOXEEVQ%26tag%3Dwebservices-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D3802581202	http://ecx.images-amazon.com/images/I/21wTujaDZpL._SL75_.jpg	http://ecx.images-amazon.com/images/I/21wTujaDZpL._SL160_.jpg	http://ecx.images-amazon.com/images/I/21wTujaDZpL.jpg	2007	37	\N	2	3	1
16	0765347539	0765347539	Kushiel's Avatar	Jacqueline Carey	Tor Fantasy	http://www.amazon.com/Kushiels-Avatar-Legacy-Trilogy/dp/0765347539%3FSubscriptionId%3DAKIAJQH5L3AY6MOXEEVQ%26tag%3Dwebservices-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D0765347539	http://ecx.images-amazon.com/images/I/41IroVTFHgL._SL75_.jpg	http://ecx.images-amazon.com/images/I/41IroVTFHgL._SL160_.jpg	http://ecx.images-amazon.com/images/I/41IroVTFHgL.jpg	2004	45	\N	7	8	2
15	0765345048	0765345048	Kushiel's Chosen	Jacqueline Carey	Tor Fantasy	http://www.amazon.com/Kushiels-Chosen-Jacqueline-Carey/dp/0765345048%3FSubscriptionId%3DAKIAJQH5L3AY6MOXEEVQ%26tag%3Dwebservices-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D0765345048	http://ecx.images-amazon.com/images/I/510zCCQSX2L._SL75_.jpg	http://ecx.images-amazon.com/images/I/510zCCQSX2L._SL160_.jpg	http://ecx.images-amazon.com/images/I/510zCCQSX2L.jpg	2003	45	\N	5	6	2
19	044661016X	9780446610162	Kushiel's Mercy	Jacqueline Carey	Grand Central Publishing	http://www.amazon.com/Kushiels-Mercy-Jacqueline-Carey/dp/044661016X%3FSubscriptionId%3DAKIAJQH5L3AY6MOXEEVQ%26tag%3Dwebservices-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D044661016X	http://ecx.images-amazon.com/images/I/514ZlQoxZyL._SL75_.jpg	http://ecx.images-amazon.com/images/I/514ZlQoxZyL._SL160_.jpg	http://ecx.images-amazon.com/images/I/514ZlQoxZyL.jpg	2009	45	\N	15	16	2
18	0446610143	0446610143	Kushiel's Justice	Jacqueline Carey	Grand Central Publishing	http://www.amazon.com/Kushiels-Justice-Legacy-Jacqueline-Carey/dp/0446610143%3FSubscriptionId%3DAKIAJQH5L3AY6MOXEEVQ%26tag%3Dwebservices-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D0446610143	http://ecx.images-amazon.com/images/I/51FgNHapbUL._SL75_.jpg	http://ecx.images-amazon.com/images/I/51FgNHapbUL._SL160_.jpg	http://ecx.images-amazon.com/images/I/51FgNHapbUL.jpg	2008	45	\N	13	14	2
21	0446198056	0446198056	Naamah's Curse	Jacqueline Carey	Grand Central Publishing	http://www.amazon.com/Naamahs-Curse-Jacqueline-Carey/dp/0446198056%3FSubscriptionId%3DAKIAJQH5L3AY6MOXEEVQ%26tag%3Dwebservices-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D0446198056	http://ecx.images-amazon.com/images/I/517FyWIUZYL._SL75_.jpg	http://ecx.images-amazon.com/images/I/517FyWIUZYL._SL160_.jpg	http://ecx.images-amazon.com/images/I/517FyWIUZYL.jpg	2010	45	\N	21	22	2
20	0446198048	0446198048	Naamah's Kiss	Jacqueline Carey	Grand Central Publishing	http://www.amazon.com/Naamahs-Kushiel-Legacy-Jacqueline-Carey/dp/0446198048%3FSubscriptionId%3DAKIAJQH5L3AY6MOXEEVQ%26tag%3Dwebservices-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D0446198048	http://ecx.images-amazon.com/images/I/51JDVcFFm0L._SL75_.jpg	http://ecx.images-amazon.com/images/I/51JDVcFFm0L._SL160_.jpg	http://ecx.images-amazon.com/images/I/51JDVcFFm0L.jpg	2010	45	\N	19	20	2
44	\N	\N	Middle Earth	J.R.R. Tolkien, Christopher Tolkien, Alan Lee	Houghton Mifflin Harcourt, Ballantine Books	\N	\N	\N	\N	\N	44	\N	1	16	0
36	0618260587	0618260587	The Lord of the Rings	J.R.R. Tolkien, Alan Lee	Houghton Mifflin Harcourt	http://www.amazon.com/Lord-Rings-J-R-R-Tolkien/dp/0618260587%3FSubscriptionId%3DAKIAJQH5L3AY6MOXEEVQ%26tag%3Dwebservices-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D0618260587	http://ecx.images-amazon.com/images/I/31F0RQ5PXAL._SL75_.jpg	http://ecx.images-amazon.com/images/I/31F0RQ5PXAL._SL160_.jpg	http://ecx.images-amazon.com/images/I/31F0RQ5PXAL.jpg	\N	44	\N	6	13	1
29	3802581210	9783802581212	Kushiel 02. Der Verrat	Jacqueline Carey	Egmont vgs Verlagsgesell.	http://www.amazon.com/Kushiel-02-Verrat-Jacqueline-Carey/dp/3802581210%3FSubscriptionId%3DAKIAJQH5L3AY6MOXEEVQ%26tag%3Dwebservices-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D3802581210	http://ecx.images-amazon.com/images/I/51L9D5j7YwL._SL75_.jpg	http://ecx.images-amazon.com/images/I/51L9D5j7YwL._SL160_.jpg	http://ecx.images-amazon.com/images/I/51L9D5j7YwL.jpg	2008	37	\N	4	5	1
37	\N	\N	Kushiels Auserwählte	Jacqueline Carey	Egmont vgs Verlagsgesell.	\N	\N	\N	\N	\N	37	\N	1	8	0
30	3802581229	9783802581229	Kushiel 03. Die Erlösung	Jacqueline Carey	Egmont vgs Verlagsgesell.	http://www.amazon.com/Kushiel-03-Erl%C3%B6sung-Jacqueline-Carey/dp/3802581229%3FSubscriptionId%3DAKIAJQH5L3AY6MOXEEVQ%26tag%3Dwebservices-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D3802581229	http://ecx.images-amazon.com/images/I/51I4wJF2PoL._SL75_.jpg	http://ecx.images-amazon.com/images/I/51I4wJF2PoL._SL160_.jpg	http://ecx.images-amazon.com/images/I/51I4wJF2PoL.jpg	2008	37	\N	6	7	1
39	\N	\N	The Black Magician Trilogy	Trudi Canavan	Harper Voyager	\N	\N	\N	\N	\N	39	\N	1	8	0
38	\N	\N	The Traitor Spy Trilogy	Trudi Canavan	Orbit	\N	\N	\N	\N	\N	38	\N	1	6	0
43	\N	\N	Naamah's Gift (Moirin)	Jacqueline Carey	Grand Central Publishing	\N	\N	\N	\N	\N	45	\N	18	25	1
41	\N	\N	Kushiel's Dart (Phedre)	Jacqueline Carey	Tor Fantasy	\N	\N	\N	\N	\N	45	\N	2	9	1
32	0201896834	0201896834	Art of Computer Programming, Volume 1: Fundamental Algorithms	Donald E. Knuth	Addison-Wesley Professional	http://www.amazon.com/Art-Computer-Programming-Fundamental-Algorithms/dp/0201896834%3FSubscriptionId%3DAKIAJQH5L3AY6MOXEEVQ%26tag%3Dwebservices-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D0201896834	http://ecx.images-amazon.com/images/I/41233D6XS0L._SL75_.jpg	http://ecx.images-amazon.com/images/I/41233D6XS0L._SL160_.jpg	http://ecx.images-amazon.com/images/I/41233D6XS0L.jpg	1997	31	\N	2	3	1
40	\N	\N	Kushiel's Scion (Imriel)	Jacqueline Carey	Grand Central Publishing	\N	\N	\N	\N	\N	45	\N	10	17	1
42	\N	\N	Demon Series	Peter V. Brett	Del Rey	\N	\N	\N	\N	\N	42	\N	1	6	0
22	0446198072	0446198072	Naamah's Blessing	Jacqueline Carey	Grand Central Publishing	http://www.amazon.com/Naamahs-Blessing-Kushiels-Legacy-Jacqueline/dp/0446198072%3FSubscriptionId%3DAKIAJQH5L3AY6MOXEEVQ%26tag%3Dwebservices-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D0446198072	http://ecx.images-amazon.com/images/I/51kn%2B%2BlaLJL._SL75_.jpg	http://ecx.images-amazon.com/images/I/51kn%2B%2BlaLJL._SL160_.jpg	http://ecx.images-amazon.com/images/I/51kn%2B%2BlaLJL.jpg	2011	45	\N	23	24	2
31	0321751043	0321751043	Art of Computer Programming, Volumes 1-4A Boxed Set, The (3rd Edition)	Donald E. Knuth	Addison-Wesley Professional	http://www.amazon.com/Computer-Programming-Volumes-1-4A-Boxed/dp/0321751043%3FSubscriptionId%3DAKIAJQH5L3AY6MOXEEVQ%26tag%3Dwebservices-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D0321751043	http://ecx.images-amazon.com/images/I/41gCSRxxVeL._SL75_.jpg	http://ecx.images-amazon.com/images/I/41gCSRxxVeL._SL160_.jpg	http://ecx.images-amazon.com/images/I/41gCSRxxVeL.jpg	2011	31	\N	1	10	0
2	0618129081	0618129081	The Two Towers	J.R.R. Tolkien	Mariner Books	http://www.amazon.com/Two-Towers-Lord-Rings-Part/dp/0618129081%3FSubscriptionId%3DAKIAJQH5L3AY6MOXEEVQ%26tag%3Dwebservices-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D0618129081	http://ecx.images-amazon.com/images/I/411RC3MC6WL._SL75_.jpg	http://ecx.images-amazon.com/images/I/411RC3MC6WL._SL160_.jpg	http://ecx.images-amazon.com/images/I/411RC3MC6WL.jpg	\N	44	\N	9	10	2
33	0201896842	0201896842	Art of Computer Programming, Volume 2: Seminumerical Algorithms	Donald E. Knuth	Addison-Wesley Professional	http://www.amazon.com/Art-Computer-Programming-Seminumerical-Algorithms/dp/0201896842%3FSubscriptionId%3DAKIAJQH5L3AY6MOXEEVQ%26tag%3Dwebservices-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D0201896842	http://ecx.images-amazon.com/images/I/41T1XCAEE1L._SL75_.jpg	http://ecx.images-amazon.com/images/I/41T1XCAEE1L._SL160_.jpg	http://ecx.images-amazon.com/images/I/41T1XCAEE1L.jpg	1997	31	\N	4	5	1
34	0201896850	0201896850	Art of Computer Programming, Volume 3: Sorting and Searching	Donald E. Knuth	Addison-Wesley Professional	http://www.amazon.com/Art-Computer-Programming-Sorting-Searching/dp/0201896850%3FSubscriptionId%3DAKIAJQH5L3AY6MOXEEVQ%26tag%3Dwebservices-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D0201896850	http://ecx.images-amazon.com/images/I/41N01A6R2KL._SL75_.jpg	http://ecx.images-amazon.com/images/I/41N01A6R2KL._SL160_.jpg	http://ecx.images-amazon.com/images/I/41N01A6R2KL.jpg	1998	31	\N	6	7	1
35	0201038048	\N	The Art of Computer Programming, Volume 4A: Combinatorial Algorithms, Part 1	Donald E. Knuth	Addison-Wesley Professional	http://www.amazon.com/Art-Computer-Programming-Combinatorial-Algorithms/dp/0201038048%3FSubscriptionId%3DAKIAJQH5L3AY6MOXEEVQ%26tag%3Dwebservices-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D0201038048	http://ecx.images-amazon.com/images/I/41Uv2Tm1D4L._SL75_.jpg	http://ecx.images-amazon.com/images/I/41Uv2Tm1D4L._SL160_.jpg	http://ecx.images-amazon.com/images/I/41Uv2Tm1D4L.jpg	\N	31	\N	8	9	1
1	0007269706	9780007269709	Lord of the Rings, The: The Fellowship of the Ring	J. R. R. Tolkien	HarperCollins	http://www.amazon.com/Lord-Rings-Fellowship-J-Tolkien/dp/0007269706%3FSubscriptionId%3DAKIAJQH5L3AY6MOXEEVQ%26tag%3Dwebservices-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D0007269706	http://ecx.images-amazon.com/images/I/51HRRyQf0wL._SL75_.jpg	http://ecx.images-amazon.com/images/I/51HRRyQf0wL._SL160_.jpg	http://ecx.images-amazon.com/images/I/51HRRyQf0wL.jpg	2008	44	\N	7	8	2
17	044661002X	044661002X	Kushiel's Scion	Jacqueline Carey	Grand Central Publishing	http://www.amazon.com/Kushiels-Scion-Legacy-Jacqueline-Carey/dp/044661002X%3FSubscriptionId%3DAKIAJQH5L3AY6MOXEEVQ%26tag%3Dwebservices-20%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D044661002X	http://ecx.images-amazon.com/images/I/51C8YGxxWuL._SL75_.jpg	http://ecx.images-amazon.com/images/I/51C8YGxxWuL._SL160_.jpg	http://ecx.images-amazon.com/images/I/51C8YGxxWuL.jpg	2007	45	\N	11	12	2
45	\N	\N	Terre d'Ange	Jacqueline Carey	Grand Central Publishing, Tor Fantasy	\N	\N	\N	\N	\N	45	\N	1	26	0
\.


--
-- Data for Name: user_info; Type: TABLE DATA; Schema: public; Owner: -
--

COPY user_info (id, login_id, real_name, email) FROM stdin;
1	1	Test	test@example.com
2	2	Admin	admin@example.com
3	3	Root	root@example.com
4	4	Moritz	moritz@example.com
\.


--
-- Data for Name: user_login; Type: TABLE DATA; Schema: public; Owner: -
--

COPY user_login (id, name, salt, cost, pw_hash) FROM stdin;
1	test	-+6\\235\\3506R-\\325\\351\\364\\313;\\376\\004\\026	9	\\234\\325\\252\\245\\354E\\377g\\210>9w\\276_1\\325\\322\\330\\236\\013\\177\\270\\237
2	admin	JL\\275\\213\\253{\\212@\\011\\266\\310\\244\\011J\\330j	9	\\273:wn\\036\\351\\262*\\307\\277\\214\\265\\244\\003\\354\\300\\0324\\265\\031Ok\\262
3	root	I\\341\\201\\3309n\\301\\243\\234\\011\\326?Iu\\332]	9	\\213\\245\\242N\\034\\303*Mr\\272\\253\\200\\261\\354\\275\\347G\\012\\245\\241rs\\227
4	moritz	0\\255\\270Y4\\346\\375\\300\\270\\365\\234\\270\\207\\267\\333F	9	\\246\\367M[k\\277C>9\\322X\\257=\\224\\356\\231\\311j\\363\\022\\356\\372\\236
\.


--
-- Name: medium_asin_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY medium
    ADD CONSTRAINT medium_asin_key UNIQUE (asin);


--
-- Name: medium_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY medium
    ADD CONSTRAINT medium_pkey PRIMARY KEY (id);


--
-- Name: user_info_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY user_info
    ADD CONSTRAINT user_info_pkey PRIMARY KEY (id);


--
-- Name: user_login_name_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY user_login
    ADD CONSTRAINT user_login_name_key UNIQUE (name);


--
-- Name: user_login_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY user_login
    ADD CONSTRAINT user_login_pkey PRIMARY KEY (id);


--
-- Name: medium_root_id_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX medium_root_id_idx ON medium USING btree (root_id);


--
-- Name: medium_root_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY medium
    ADD CONSTRAINT medium_root_id_fkey FOREIGN KEY (root_id) REFERENCES medium(id) ON DELETE CASCADE;


--
-- Name: medium_same_as_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY medium
    ADD CONSTRAINT medium_same_as_fkey FOREIGN KEY (same_as) REFERENCES medium(id) ON DELETE CASCADE;


--
-- Name: user_info_login_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_info
    ADD CONSTRAINT user_info_login_id_fkey FOREIGN KEY (login_id) REFERENCES user_login(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--
