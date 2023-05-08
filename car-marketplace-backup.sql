--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Ubuntu 15.2-1.pgdg22.04+1)
-- Dumped by pg_dump version 15.2 (Ubuntu 15.2-1.pgdg22.04+1)

-- Started on 2023-05-07 17:00:59 WIB

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
-- TOC entry 219 (class 1259 OID 16440)
-- Name: ads; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ads (
    ad_id integer NOT NULL,
    user_id integer NOT NULL,
    car_id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text NOT NULL,
    mileage_km integer NOT NULL,
    color character varying(50) NOT NULL,
    transmission character varying(50) NOT NULL,
    negotiable boolean NOT NULL,
    post_date date NOT NULL
);


ALTER TABLE public.ads OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16439)
-- Name: ads_ad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ads_ad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ads_ad_id_seq OWNER TO postgres;

--
-- TOC entry 3418 (class 0 OID 0)
-- Dependencies: 218
-- Name: ads_ad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ads_ad_id_seq OWNED BY public.ads.ad_id;


--
-- TOC entry 221 (class 1259 OID 16459)
-- Name: bids; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bids (
    bid_id integer NOT NULL,
    user_id integer NOT NULL,
    ad_id integer NOT NULL,
    bid_price_idr numeric(12,2) NOT NULL,
    bid_date date NOT NULL
);


ALTER TABLE public.bids OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16458)
-- Name: bids_bid_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bids_bid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bids_bid_id_seq OWNER TO postgres;

--
-- TOC entry 3419 (class 0 OID 0)
-- Dependencies: 220
-- Name: bids_bid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bids_bid_id_seq OWNED BY public.bids.bid_id;


--
-- TOC entry 223 (class 1259 OID 16491)
-- Name: cars; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cars (
    car_id integer NOT NULL,
    brand character varying(255) NOT NULL,
    model character varying(255) NOT NULL,
    body_type character varying(50) NOT NULL,
    manufacturing_year smallint NOT NULL,
    price_idr numeric(12,2) NOT NULL,
    CONSTRAINT ck_manufacturing_year CHECK (((manufacturing_year > 0) AND ((manufacturing_year)::numeric <= EXTRACT(year FROM CURRENT_DATE)))),
    CONSTRAINT ck_price CHECK ((price_idr >= (0)::numeric))
);


ALTER TABLE public.cars OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16490)
-- Name: cars_car_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cars_car_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cars_car_id_seq OWNER TO postgres;

--
-- TOC entry 3420 (class 0 OID 0)
-- Dependencies: 222
-- Name: cars_car_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cars_car_id_seq OWNED BY public.cars.car_id;


--
-- TOC entry 215 (class 1259 OID 16406)
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    city_id integer NOT NULL,
    city_name character varying(255) NOT NULL,
    latitude numeric(9,6) NOT NULL,
    longitude numeric(9,6) NOT NULL
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16405)
-- Name: cities_city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cities_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_city_id_seq OWNER TO postgres;

--
-- TOC entry 3421 (class 0 OID 0)
-- Dependencies: 214
-- Name: cities_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cities_city_id_seq OWNED BY public.cities.city_id;


--
-- TOC entry 217 (class 1259 OID 16415)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(255) NOT NULL,
    phone_number character varying(20) NOT NULL,
    city_id integer NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16414)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO postgres;

--
-- TOC entry 3422 (class 0 OID 0)
-- Dependencies: 216
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- TOC entry 3238 (class 2604 OID 16443)
-- Name: ads ad_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ads ALTER COLUMN ad_id SET DEFAULT nextval('public.ads_ad_id_seq'::regclass);


--
-- TOC entry 3239 (class 2604 OID 16462)
-- Name: bids bid_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bids ALTER COLUMN bid_id SET DEFAULT nextval('public.bids_bid_id_seq'::regclass);


--
-- TOC entry 3240 (class 2604 OID 16494)
-- Name: cars car_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars ALTER COLUMN car_id SET DEFAULT nextval('public.cars_car_id_seq'::regclass);


--
-- TOC entry 3236 (class 2604 OID 16409)
-- Name: cities city_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities ALTER COLUMN city_id SET DEFAULT nextval('public.cities_city_id_seq'::regclass);


--
-- TOC entry 3237 (class 2604 OID 16418)
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- TOC entry 3408 (class 0 OID 16440)
-- Dependencies: 219
-- Data for Name: ads; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ads (ad_id, user_id, car_id, title, description, mileage_km, color, transmission, negotiable, post_date) FROM stdin;
1	48	1	Dijual Toyota Yaris Hatchback (2016) - Biru dongker - otomatis	Informasi mobil:\nBrand: Toyota\nModel: Toyota Yaris\nTipe Body: Hatchback\nTahun: 2016\nHarga: 175000000 IDR	72739	Biru dongker	otomatis	f	2022-03-02
2	10	2	Dijual Toyota Yaris Hatchback (2018) - Perak - manual	Informasi mobil:\nBrand: Toyota\nModel: Toyota Yaris\nTipe Body: Hatchback\nTahun: 2018\nHarga: 215000000 IDR	77094	Perak	manual	f	2023-03-03
3	11	3	Dijual Toyota Yaris Hatchback (2014) - Perak - manual	Informasi mobil:\nBrand: Toyota\nModel: Toyota Yaris\nTipe Body: Hatchback\nTahun: 2014\nHarga: 162000000 IDR\nHarga bisa nego	4815	Perak	manual	t	2022-11-30
4	85	4	Dijual Toyota Yaris Hatchback (2020) - Hijau tua - manual	Informasi mobil:\nBrand: Toyota\nModel: Toyota Yaris\nTipe Body: Hatchback\nTahun: 2020\nHarga: 220000000 IDR	80491	Hijau tua	manual	f	2023-03-06
5	15	5	Dijual Toyota Yaris Hatchback (2012) - Hijau muda - otomatis	Informasi mobil:\nBrand: Toyota\nModel: Toyota Yaris\nTipe Body: Hatchback\nTahun: 2012\nHarga: 124000000 IDR	86673	Hijau muda	otomatis	f	2022-06-07
6	20	6	Dijual Toyota Agya Hatchback (2019) - Zaitun - otomatis	Informasi mobil:\nBrand: Toyota\nModel: Toyota Agya\nTipe Body: Hatchback\nTahun: 2019\nHarga: 114000000 IDR\nHarga bisa nego	75193	Zaitun	otomatis	t	2023-04-08
7	22	7	Dijual Toyota Agya Hatchback (2014) - Nila - manual	Informasi mobil:\nBrand: Toyota\nModel: Toyota Agya\nTipe Body: Hatchback\nTahun: 2014\nHarga: 97000000 IDR	80116	Nila	manual	f	2022-07-17
8	43	8	Dijual Toyota Agya Hatchback (2016) - Biru dongker - otomatis	Informasi mobil:\nBrand: Toyota\nModel: Toyota Agya\nTipe Body: Hatchback\nTahun: 2016\nHarga: 110000000 IDR	12671	Biru dongker	otomatis	f	2022-01-11
9	91	9	Dijual Toyota Agya Hatchback (2022) - Emas - otomatis	Informasi mobil:\nBrand: Toyota\nModel: Toyota Agya\nTipe Body: Hatchback\nTahun: 2022\nHarga: 155500000 IDR	53463	Emas	otomatis	f	2022-06-03
10	34	10	Dijual Toyota Agya Hatchback (2017) - Koral - manual	Informasi mobil:\nBrand: Toyota\nModel: Toyota Agya\nTipe Body: Hatchback\nTahun: 2017\nHarga: 115500000 IDR\nHarga bisa nego	82024	Koral	manual	t	2022-10-30
11	2	11	Dijual Toyota Calya Wagon (2019) - Ungu - manual	Informasi mobil:\nBrand: Toyota\nModel: Toyota Calya\nTipe Body: Wagon\nTahun: 2019\nHarga: 130000000 IDR	20065	Ungu	manual	f	2022-05-30
12	4	12	Dijual Toyota Calya Wagon (2019) - Perak - manual	Informasi mobil:\nBrand: Toyota\nModel: Toyota Calya\nTipe Body: Wagon\nTahun: 2019\nHarga: 137000000 IDR	14140	Perak	manual	f	2022-10-28
13	1	13	Dijual Toyota Calya Wagon (2017) - Nila - manual	Informasi mobil:\nBrand: Toyota\nModel: Toyota Calya\nTipe Body: Wagon\nTahun: 2017\nHarga: 115500000 IDR\nHarga bisa nego	16795	Nila	manual	t	2022-05-31
14	36	14	Dijual Toyota Calya Wagon (2016) - Hitam - otomatis	Informasi mobil:\nBrand: Toyota\nModel: Toyota Calya\nTipe Body: Wagon\nTahun: 2016\nHarga: 104000000 IDR	90290	Hitam	otomatis	f	2022-06-04
15	71	15	Dijual Toyota Calya Wagon (2016) - Merah marun - otomatis	Informasi mobil:\nBrand: Toyota\nModel: Toyota Calya\nTipe Body: Wagon\nTahun: 2016\nHarga: 107000000 IDR\nHarga bisa nego	74339	Merah marun	otomatis	t	2022-03-21
16	2	16	Dijual Daihatsu Ayla Hatchback (2016) - Ungu - otomatis	Informasi mobil:\nBrand: Daihatsu\nModel: Daihatsu Ayla\nTipe Body: Hatchback\nTahun: 2016\nHarga: 83000000 IDR\nHarga bisa nego	24178	Ungu	otomatis	t	2022-09-24
17	1	17	Dijual Daihatsu Ayla Hatchback (2019) - Coklat tua - otomatis	Informasi mobil:\nBrand: Daihatsu\nModel: Daihatsu Ayla\nTipe Body: Hatchback\nTahun: 2019\nHarga: 120000000 IDR	44048	Coklat tua	otomatis	f	2022-10-24
18	43	18	Dijual Daihatsu Ayla Hatchback (2015) - Kuning - manual	Informasi mobil:\nBrand: Daihatsu\nModel: Daihatsu Ayla\nTipe Body: Hatchback\nTahun: 2015\nHarga: 96000000 IDR\nHarga bisa nego	66297	Kuning	manual	t	2023-03-18
19	84	19	Dijual Daihatsu Ayla Hatchback (2017) - Hitam - otomatis	Informasi mobil:\nBrand: Daihatsu\nModel: Daihatsu Ayla\nTipe Body: Hatchback\nTahun: 2017\nHarga: 115000000 IDR\nHarga bisa nego	59436	Hitam	otomatis	t	2022-02-21
20	83	20	Dijual Daihatsu Ayla Hatchback (2017) - Emas - manual	Informasi mobil:\nBrand: Daihatsu\nModel: Daihatsu Ayla\nTipe Body: Hatchback\nTahun: 2017\nHarga: 113000000 IDR\nHarga bisa nego	58457	Emas	manual	t	2022-03-15
21	95	21	Dijual Daihatsu Terios SUV (2018) - Coklat tua - manual	Informasi mobil:\nBrand: Daihatsu\nModel: Daihatsu Terios\nTipe Body: SUV\nTahun: 2018\nHarga: 190000000 IDR\nHarga bisa nego	93554	Coklat tua	manual	t	2023-01-01
22	64	22	Dijual Daihatsu Terios SUV (2022) - Hijau muda - manual	Informasi mobil:\nBrand: Daihatsu\nModel: Daihatsu Terios\nTipe Body: SUV\nTahun: 2022\nHarga: 223000000 IDR	69042	Hijau muda	manual	f	2022-04-24
23	48	23	Dijual Daihatsu Terios SUV (2019) - Merah marun - otomatis	Informasi mobil:\nBrand: Daihatsu\nModel: Daihatsu Terios\nTipe Body: SUV\nTahun: 2019\nHarga: 189900000 IDR\nHarga bisa nego	9429	Merah marun	otomatis	t	2022-12-14
24	50	24	Dijual Daihatsu Terios SUV (2017) - Hijau tua - otomatis	Informasi mobil:\nBrand: Daihatsu\nModel: Daihatsu Terios\nTipe Body: SUV\nTahun: 2017\nHarga: 166000000 IDR	74792	Hijau tua	otomatis	f	2023-02-18
25	57	25	Dijual Daihatsu Terios SUV (2018) - Coklat - otomatis	Informasi mobil:\nBrand: Daihatsu\nModel: Daihatsu Terios\nTipe Body: SUV\nTahun: 2018\nHarga: 201000000 IDR	27233	Coklat	otomatis	f	2023-04-09
26	56	26	Dijual Daihatsu Xenia MPV (2019) - Merah - otomatis	Informasi mobil:\nBrand: Daihatsu\nModel: Daihatsu Xenia\nTipe Body: MPV\nTahun: 2019\nHarga: 170000000 IDR	11580	Merah	otomatis	f	2023-02-12
27	83	27	Dijual Daihatsu Xenia MPV (2022) - Ungu - manual	Informasi mobil:\nBrand: Daihatsu\nModel: Daihatsu Xenia\nTipe Body: MPV\nTahun: 2022\nHarga: 220500000 IDR\nHarga bisa nego	97687	Ungu	manual	t	2022-05-02
28	24	28	Dijual Daihatsu Xenia MPV (2017) - Koral - otomatis	Informasi mobil:\nBrand: Daihatsu\nModel: Daihatsu Xenia\nTipe Body: MPV\nTahun: 2017\nHarga: 135000000 IDR	4308	Koral	otomatis	f	2022-03-04
29	32	29	Dijual Daihatsu Xenia MPV (2014) - Biru dongker - manual	Informasi mobil:\nBrand: Daihatsu\nModel: Daihatsu Xenia\nTipe Body: MPV\nTahun: 2014\nHarga: 100000000 IDR	33696	Biru dongker	manual	f	2022-08-21
30	59	30	Dijual Daihatsu Xenia MPV (2018) - Ungu tua - manual	Informasi mobil:\nBrand: Daihatsu\nModel: Daihatsu Xenia\nTipe Body: MPV\nTahun: 2018\nHarga: 159000000 IDR\nHarga bisa nego	26214	Ungu tua	manual	t	2022-03-17
31	65	31	Dijual Honda Jazz Hatchback (2018) - Hijau muda - otomatis	Informasi mobil:\nBrand: Honda\nModel: Honda Jazz\nTipe Body: Hatchback\nTahun: 2018\nHarga: 236000000 IDR	20652	Hijau muda	otomatis	f	2023-03-15
32	2	32	Dijual Honda Jazz Hatchback (2019) - Coklat tua - manual	Informasi mobil:\nBrand: Honda\nModel: Honda Jazz\nTipe Body: Hatchback\nTahun: 2019\nHarga: 250000000 IDR\nHarga bisa nego	61375	Coklat tua	manual	t	2022-02-19
33	11	33	Dijual Honda Jazz Hatchback (2018) - Abu-abu - otomatis	Informasi mobil:\nBrand: Honda\nModel: Honda Jazz\nTipe Body: Hatchback\nTahun: 2018\nHarga: 216000000 IDR	27582	Abu-abu	otomatis	f	2022-07-18
34	18	34	Dijual Honda Jazz Hatchback (2015) - Perak - otomatis	Informasi mobil:\nBrand: Honda\nModel: Honda Jazz\nTipe Body: Hatchback\nTahun: 2015\nHarga: 192000000 IDR	82394	Perak	otomatis	f	2023-04-22
35	82	35	Dijual Honda Jazz Hatchback (2013) - Nila - otomatis	Informasi mobil:\nBrand: Honda\nModel: Honda Jazz\nTipe Body: Hatchback\nTahun: 2013\nHarga: 178000000 IDR	85642	Nila	otomatis	f	2022-05-31
36	95	36	Dijual Honda CR-V SUV (2018) - Jingga - manual	Informasi mobil:\nBrand: Honda\nModel: Honda CR-V\nTipe Body: SUV\nTahun: 2018\nHarga: 415000000 IDR	7724	Jingga	manual	f	2022-10-16
37	7	37	Dijual Honda CR-V SUV (2017) - Merah - manual	Informasi mobil:\nBrand: Honda\nModel: Honda CR-V\nTipe Body: SUV\nTahun: 2017\nHarga: 345000000 IDR\nHarga bisa nego	63974	Merah	manual	t	2022-05-12
38	9	38	Dijual Honda CR-V SUV (2009) - Koral - otomatis	Informasi mobil:\nBrand: Honda\nModel: Honda CR-V\nTipe Body: SUV\nTahun: 2009\nHarga: 116000000 IDR\nHarga bisa nego	90208	Koral	otomatis	t	2023-03-06
39	48	39	Dijual Honda CR-V SUV (2016) - Coklat - otomatis	Informasi mobil:\nBrand: Honda\nModel: Honda CR-V\nTipe Body: SUV\nTahun: 2016\nHarga: 269000000 IDR	80483	Coklat	otomatis	f	2022-03-31
40	61	40	Dijual Honda CR-V SUV (2018) - Abu-abu - manual	Informasi mobil:\nBrand: Honda\nModel: Honda CR-V\nTipe Body: SUV\nTahun: 2018\nHarga: 398500000 IDR\nHarga bisa nego	98177	Abu-abu	manual	t	2022-09-24
41	24	41	Dijual Honda Civic Hatchback (2018) - Zaitun - otomatis	Informasi mobil:\nBrand: Honda\nModel: Honda Civic\nTipe Body: Hatchback\nTahun: 2018\nHarga: 350000000 IDR	94785	Zaitun	otomatis	f	2022-03-17
42	28	42	Dijual Honda Civic Sedan (2010) - Ungu - otomatis	Informasi mobil:\nBrand: Honda\nModel: Honda Civic\nTipe Body: Sedan\nTahun: 2010\nHarga: 165000000 IDR\nHarga bisa nego	75100	Ungu	otomatis	t	2023-02-19
43	58	43	Dijual Honda Civic Sedan (2013) - Biru - manual	Informasi mobil:\nBrand: Honda\nModel: Honda Civic\nTipe Body: Sedan\nTahun: 2013\nHarga: 186000000 IDR	18115	Biru	manual	f	2022-12-30
44	66	44	Dijual Honda Civic Sedan (2013) - Koral - manual	Informasi mobil:\nBrand: Honda\nModel: Honda Civic\nTipe Body: Sedan\nTahun: 2013\nHarga: 179000000 IDR	28632	Koral	manual	f	2022-02-08
45	67	45	Dijual Honda Civic Hatchback (2019) - Ungu tua - otomatis	Informasi mobil:\nBrand: Honda\nModel: Honda Civic\nTipe Body: Hatchback\nTahun: 2019\nHarga: 397500000 IDR	91598	Ungu tua	otomatis	f	2022-01-25
46	23	46	Dijual Suzuki Ertiga MPV (2015) - Emas - manual	Informasi mobil:\nBrand: Suzuki\nModel: Suzuki Ertiga\nTipe Body: MPV\nTahun: 2015\nHarga: 125000000 IDR\nHarga bisa nego	61232	Emas	manual	t	2022-06-01
47	54	47	Dijual Suzuki Ertiga MPV (2018) - Hitam - manual	Informasi mobil:\nBrand: Suzuki\nModel: Suzuki Ertiga\nTipe Body: MPV\nTahun: 2018\nHarga: 178000000 IDR	7379	Hitam	manual	f	2023-04-18
48	51	48	Dijual Suzuki Ertiga MPV (2016) - Merah - otomatis	Informasi mobil:\nBrand: Suzuki\nModel: Suzuki Ertiga\nTipe Body: MPV\nTahun: 2016\nHarga: 168000000 IDR\nHarga bisa nego	68221	Merah	otomatis	t	2022-12-03
49	90	49	Dijual Suzuki Ertiga MPV (2012) - Putih - manual	Informasi mobil:\nBrand: Suzuki\nModel: Suzuki Ertiga\nTipe Body: MPV\nTahun: 2012\nHarga: 100000000 IDR	51668	Putih	manual	f	2022-10-29
50	62	50	Dijual Suzuki Ertiga MPV (2018) - Hitam - manual	Informasi mobil:\nBrand: Suzuki\nModel: Suzuki Ertiga\nTipe Body: MPV\nTahun: 2018\nHarga: 167000000 IDR	44668	Hitam	manual	f	2022-08-18
\.


--
-- TOC entry 3410 (class 0 OID 16459)
-- Dependencies: 221
-- Data for Name: bids; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bids (bid_id, user_id, ad_id, bid_price_idr, bid_date) FROM stdin;
108	60	46	92547380.00	2023-03-24
109	8	16	11620794.00	2022-07-27
110	63	38	81232121.00	2023-03-25
111	61	32	82713322.00	2022-11-24
112	62	3	50680856.00	2022-07-01
113	38	15	21090764.00	2022-09-12
114	14	46	75455510.00	2022-02-12
115	82	37	87896960.00	2022-04-26
116	6	37	27169262.00	2022-02-20
117	10	13	88797290.00	2022-09-18
118	71	23	89054310.00	2022-04-17
119	7	6	33329630.00	2023-01-18
120	82	37	69018248.00	2022-08-21
121	29	42	12807314.00	2022-03-03
122	74	38	52961439.00	2023-02-23
123	20	18	90590590.00	2022-08-16
124	86	10	24098002.00	2023-03-02
125	62	20	7820793.00	2022-03-06
126	71	10	73024075.00	2022-05-08
127	12	23	98863033.00	2023-02-15
128	19	3	77458083.00	2022-05-16
129	78	3	75786528.00	2023-04-23
130	24	21	44877526.00	2022-09-23
131	97	23	77882670.00	2022-11-22
132	25	16	77379590.00	2022-02-08
133	83	23	71959939.00	2022-07-13
134	44	32	93242467.00	2023-03-09
135	63	40	49952086.00	2022-11-15
136	82	48	54633426.00	2023-02-15
137	54	48	21299723.00	2023-03-15
138	58	42	10400619.00	2022-08-31
139	73	10	87548643.00	2022-03-08
140	50	16	28647262.00	2023-03-05
141	47	6	11142513.00	2023-01-02
142	8	27	52769608.00	2022-08-30
143	83	40	61497802.00	2022-07-04
144	94	3	21340702.00	2023-04-07
145	57	19	24184668.00	2022-01-31
146	91	42	45981094.00	2022-05-10
147	72	18	58938469.00	2022-05-04
148	41	40	6822719.00	2022-09-10
149	72	16	91022477.00	2022-08-08
150	5	10	18514264.00	2022-11-07
151	33	6	76415015.00	2022-01-24
152	15	10	95174334.00	2022-11-08
153	20	42	56125524.00	2022-07-26
154	98	23	75198904.00	2022-11-22
155	16	18	66758128.00	2022-11-29
156	5	46	5955071.00	2023-01-09
157	13	23	60903735.00	2022-12-20
158	49	20	93127122.00	2022-07-18
159	60	16	94767385.00	2023-01-20
160	30	40	43204495.00	2022-05-06
161	58	37	19139279.00	2023-01-31
162	24	3	25309785.00	2022-05-05
163	51	48	56421311.00	2022-01-26
164	62	30	50696369.00	2022-03-20
165	2	20	96902043.00	2022-05-22
166	48	6	74512318.00	2023-04-01
167	41	46	48841525.00	2022-06-24
168	67	15	81816887.00	2022-10-06
169	28	23	68388077.00	2022-06-01
170	5	40	27719936.00	2022-09-14
171	48	48	44221709.00	2022-03-30
172	8	13	33703250.00	2023-02-10
173	26	42	99253147.00	2022-11-27
174	44	42	22695698.00	2022-05-05
175	85	30	62573304.00	2022-12-10
176	48	21	53095013.00	2022-06-28
177	14	20	19229116.00	2022-05-23
178	55	37	46511393.00	2022-08-19
179	42	30	81761121.00	2022-07-20
180	76	21	99754820.00	2022-08-08
181	91	16	91715176.00	2023-02-24
182	56	20	47203373.00	2022-02-28
183	68	19	80934110.00	2022-09-06
184	61	15	26596391.00	2022-02-08
185	77	3	40716655.00	2023-04-03
186	11	10	59203954.00	2022-12-25
187	31	48	26097475.00	2023-04-06
188	47	40	63714596.00	2022-08-06
189	10	13	22952837.00	2022-03-19
190	42	18	82414779.00	2022-03-02
191	29	19	90509662.00	2022-01-02
192	94	40	66245344.00	2023-02-18
193	66	32	74073457.00	2022-09-29
194	49	20	75255372.00	2022-05-08
195	36	38	18378005.00	2022-04-09
196	21	21	63920521.00	2023-02-28
197	27	23	47033978.00	2022-02-07
198	97	15	91202891.00	2022-03-13
199	34	32	37123792.00	2023-01-14
200	91	38	98806633.00	2023-02-06
201	10	42	47953101.00	2022-01-01
202	10	21	90435348.00	2023-02-07
203	1	10	42506413.00	2022-06-10
204	5	18	27733797.00	2022-05-10
205	37	38	72012272.00	2022-02-15
206	30	37	6279156.00	2023-02-20
207	93	13	63542758.00	2022-08-13
\.


--
-- TOC entry 3412 (class 0 OID 16491)
-- Dependencies: 223
-- Data for Name: cars; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cars (car_id, brand, model, body_type, manufacturing_year, price_idr) FROM stdin;
1	Toyota	Toyota Yaris	Hatchback	2016	175000000.00
2	Toyota	Toyota Yaris	Hatchback	2018	215000000.00
3	Toyota	Toyota Yaris	Hatchback	2014	162000000.00
4	Toyota	Toyota Yaris	Hatchback	2020	220000000.00
5	Toyota	Toyota Yaris	Hatchback	2012	124000000.00
6	Toyota	Toyota Agya	Hatchback	2019	114000000.00
7	Toyota	Toyota Agya	Hatchback	2014	97000000.00
8	Toyota	Toyota Agya	Hatchback	2016	110000000.00
9	Toyota	Toyota Agya	Hatchback	2022	155500000.00
10	Toyota	Toyota Agya	Hatchback	2017	115500000.00
11	Toyota	Toyota Calya	Wagon	2019	130000000.00
12	Toyota	Toyota Calya	Wagon	2019	137000000.00
13	Toyota	Toyota Calya	Wagon	2017	115500000.00
14	Toyota	Toyota Calya	Wagon	2016	104000000.00
15	Toyota	Toyota Calya	Wagon	2016	107000000.00
16	Daihatsu	Daihatsu Ayla	Hatchback	2016	83000000.00
17	Daihatsu	Daihatsu Ayla	Hatchback	2019	120000000.00
18	Daihatsu	Daihatsu Ayla	Hatchback	2015	96000000.00
19	Daihatsu	Daihatsu Ayla	Hatchback	2017	115000000.00
20	Daihatsu	Daihatsu Ayla	Hatchback	2017	113000000.00
21	Daihatsu	Daihatsu Terios	SUV	2018	190000000.00
22	Daihatsu	Daihatsu Terios	SUV	2022	223000000.00
23	Daihatsu	Daihatsu Terios	SUV	2019	189900000.00
24	Daihatsu	Daihatsu Terios	SUV	2017	166000000.00
25	Daihatsu	Daihatsu Terios	SUV	2018	201000000.00
26	Daihatsu	Daihatsu Xenia	MPV	2019	170000000.00
27	Daihatsu	Daihatsu Xenia	MPV	2022	220500000.00
28	Daihatsu	Daihatsu Xenia	MPV	2017	135000000.00
29	Daihatsu	Daihatsu Xenia	MPV	2014	100000000.00
30	Daihatsu	Daihatsu Xenia	MPV	2018	159000000.00
31	Honda	Honda Jazz	Hatchback	2018	236000000.00
32	Honda	Honda Jazz	Hatchback	2019	250000000.00
33	Honda	Honda Jazz	Hatchback	2018	216000000.00
34	Honda	Honda Jazz	Hatchback	2015	192000000.00
35	Honda	Honda Jazz	Hatchback	2013	178000000.00
36	Honda	Honda CR-V	SUV	2018	415000000.00
37	Honda	Honda CR-V	SUV	2017	345000000.00
38	Honda	Honda CR-V	SUV	2009	116000000.00
39	Honda	Honda CR-V	SUV	2016	269000000.00
40	Honda	Honda CR-V	SUV	2018	398500000.00
41	Honda	Honda Civic	Hatchback	2018	350000000.00
42	Honda	Honda Civic	Sedan	2010	165000000.00
43	Honda	Honda Civic	Sedan	2013	186000000.00
44	Honda	Honda Civic	Sedan	2013	179000000.00
45	Honda	Honda Civic	Hatchback	2019	397500000.00
46	Suzuki	Suzuki Ertiga	MPV	2015	125000000.00
47	Suzuki	Suzuki Ertiga	MPV	2018	178000000.00
48	Suzuki	Suzuki Ertiga	MPV	2016	168000000.00
49	Suzuki	Suzuki Ertiga	MPV	2012	100000000.00
50	Suzuki	Suzuki Ertiga	MPV	2018	167000000.00
\.


--
-- TOC entry 3404 (class 0 OID 16406)
-- Dependencies: 215
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (city_id, city_name, latitude, longitude) FROM stdin;
3171	Kota Jakarta Pusat	-6.186486	106.834091
3172	Kota Jakarta Utara	-6.121435	106.774124
3173	Kota Jakarta Barat	-6.135200	106.813301
3174	Kota Jakarta Selatan	-6.300641	106.814095
3175	Kota Jakarta Timur	-6.264451	106.895859
3573	Kota Malang	-7.981894	112.626503
3578	Kota Surabaya	-7.289166	112.734398
3471	Kota Yogyakarta	-7.797224	110.368797
3273	Kota Bandung	-6.914744	107.609811
1371	Kota Padang	-0.950000	100.353056
1375	Kota Bukittinggi	-0.305556	100.369167
6471	Kota Balikpapan	-1.263539	116.827883
6472	Kota Samarinda	-0.502183	117.153801
7371	Kota Makassar	-5.133333	119.416667
5171	Kota Denpasar	-8.656290	115.222099
\.


--
-- TOC entry 3406 (class 0 OID 16415)
-- Dependencies: 217
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, name, phone_number, city_id) FROM stdin;
1	Muni Marpaung	(052) 651-0127	3273
2	Mila Safitri	+62 (233) 405-0579	3578
3	Zahra Mandasari	+62 (934) 095 5082	6471
4	Galak Hardiansyah	(0001) 934 8807	3573
5	Hj. Faizah Siregar, M.Pd	+62 (32) 422-3147	1375
6	Cici Yulianti, S.Psi	(0164) 998-3646	3578
7	Dr. Carla Hutagalung, S.Gz	+62-495-734-3432	3578
8	Mujur Mansur	(086) 425-1611	1371
9	Kiandra Hardiansyah	+62 (409) 752-3673	3471
10	Gilda Utama	+62 (0278) 330-1523	3172
11	Warsita Prabowo	+62-0084-429-2017	6471
12	Rahmi Nashiruddin	+62-99-297-6109	3172
13	Bakianto Hidayanto	(094) 686-6305	7371
14	R. Betania Rahmawati, M.M.	+62-51-967-4188	3573
15	Ira Jailani	+62 (0764) 138-5611	3578
16	R. Tirtayasa Ardianto	+62-32-486-5242	3273
17	dr. Galar Astuti	(023) 763-3793	3578
18	Puti Juli Saragih, S.Gz	+62 (86) 120-2681	3175
19	Gadang Maryadi	+62 (078) 387-1007	3172
20	Anita Dabukke	+62-16-194-6995	6471
21	Jarwa Hasanah, S.Pd	+62-099-477-6020	3471
22	Karman Irawan	(027) 572 4162	3172
23	Teddy Pranowo	+62 (021) 870-9886	3273
24	Utama Rajasa	+62-0747-755-4311	3273
25	Gamani Andriani	(018) 891 7673	3273
26	Mulyanto Uyainah	(041) 680-6291	5171
27	Cut Rika Hakim	0838793244	1375
28	Tgk. Fitriani Sinaga, S.E.	+62-783-732-7366	1375
29	Olivia Sihombing, S.IP	+62 (986) 393-9969	3172
30	Sadina Kurniawan, S.IP	+62 (0709) 460-4938	3175
31	Karimah Permadi	(082) 425-3797	3573
32	Malik Sitompul	(0372) 500 1532	7371
33	Sutan Yoga Rajasa, S.Psi	0868900997	6471
34	Reza Laksita	+62-0769-524-1378	7371
35	Ir. Gabriella Laksita, M.Pd	+62 (44) 689-1549	3174
36	Artawan Hidayat, S.Psi	+62 (0793) 982 9779	3174
37	Teguh Tampubolon	080 035 4147	1371
38	Gading Setiawan, S.Pd	+62-0750-942-5383	3573
39	Zulfa Sihotang	0841518546	7371
40	Hj. Julia Megantara, S.E.	+62-78-408-6005	5171
41	R. Najwa Jailani, S.Psi	(061) 178-8462	6471
42	Dr. Carla Damanik, M.M.	+62 (44) 624-2935	3471
43	Nasab Budiman	080 276 0269	1375
44	T. Irwan Wahyuni	+62-0387-668-4429	5171
45	Bakiadi Widiastuti	(066) 962 9968	1371
46	Usyi Zulkarnain	+62 (73) 803-8053	3173
47	drg. Putu Jailani, S.Pd	+62-95-798-8242	1371
48	H. Caraka Lailasari	+62-0236-535-6186	5171
49	Kiandra Permata	+62-244-441-4592	6471
50	Lasmanto Salahudin	+62-0644-658-6457	1375
51	drg. Okto Anggraini	0811338783	6471
52	Hasim Agustina	+62-019-229-5883	6472
53	R.A. Tania Iswahyudi, S.IP	(0042) 477-3624	3174
54	Samsul Suryatmi	+62-096-066-4797	3273
55	Jaiman Setiawan	+62 (89) 715 5647	1375
56	R.M. Salman Prasasta	+62-0727-870-4765	7371
57	Puji Salahudin, S.Gz	(0061) 241-8349	3175
58	Ifa Maulana, S.E.	+62 (0586) 132 0798	1375
59	Drs. Gawati Agustina	+62-073-390-6763	3471
60	Drs. Jayadi Pranowo, M.Pd	+62 (0499) 577 6875	1371
61	Unggul Hartati	+62 (0602) 907 2362	3573
62	Ir. Laila Dabukke, M.Ak	+62 (0234) 819-6676	3175
63	Paramita Novitasari	+62 (0747) 655-0026	3172
64	Prasetyo Prayoga	+62 (285) 255 7881	7371
65	Lanjar Narpati	(0971) 110-4009	3573
66	Irfan Usamah	+62-34-997-7677	3174
67	Fathonah Marbun	082 445 8400	5171
68	Raihan Nugroho	+62 (108) 188 5877	3471
69	Dt. Sidiq Pradana	+62 (126) 372-2595	3171
70	Dian Sihotang	+62 (99) 550-2283	1371
71	Dinda Adriansyah, S.Pt	+62 (0032) 901 0005	3273
72	Maimunah Sinaga	+62-938-711-5644	7371
73	H. Warsa Padmasari, S.Pt	089 545 3370	3573
74	Dr. Paris Mandasari	+62 (771) 093 9299	3573
75	Darmanto Sihombing	+62-946-689-0064	6472
76	Wawan Haryanto	080 051 6262	3471
77	Yuni Oktaviani	085 565 7608	3273
78	Cinta Saefullah	+62 (53) 747 8103	3471
79	Dr. Maida Yulianti	+62 (085) 188 1386	3175
80	drg. Narji Pratama	+62 (0961) 131-3172	1371
81	Among Yulianti, S.Pd	+62 (515) 478-6860	1375
82	Harto Hutasoit	+62 (072) 971-7775	3174
83	Heryanto Susanti	+62 (20) 228 3504	3578
84	Diah Pertiwi	+62 (018) 999-4164	3171
85	Puti Tina Suartini	(023) 212 2115	3174
86	Amelia Irawan	(020) 474-5688	3573
87	Hj. Rahmi Tarihoran, S.E.I	0849233947	3578
88	Eka Laksita	+62 (0600) 793 2600	3171
89	Kasiyah Melani	+62 (76) 137 4532	3174
90	Purwanto Ardianto, S.IP	+62-096-451-6082	1371
91	Drs. Digdaya Suwarno, S.Kom	(027) 636-7179	6472
92	Cut Ade Damanik	+62 (265) 275-0749	3172
93	Bagiya Sinaga, S.E.	+62 (097) 240-7703	1375
94	Malika Najmudin	+62-018-556-8494	3578
95	Dt. Elon Prasetya, M.Ak	(0563) 256 2023	3171
96	Puti Carla Mandasari, S.Pd	+62-0077-050-7704	3471
97	Gilda Maulana	+62 (050) 696 7264	1375
98	Vanesa Uwais	(009) 299 4682	3471
99	Cornelia Firgantoro, S.H.	083 237 8467	3573
100	Jane Suryatmi	+62-041-456-4885	3174
\.


--
-- TOC entry 3423 (class 0 OID 0)
-- Dependencies: 218
-- Name: ads_ad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ads_ad_id_seq', 50, true);


--
-- TOC entry 3424 (class 0 OID 0)
-- Dependencies: 220
-- Name: bids_bid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bids_bid_id_seq', 207, true);


--
-- TOC entry 3425 (class 0 OID 0)
-- Dependencies: 222
-- Name: cars_car_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cars_car_id_seq', 1, false);


--
-- TOC entry 3426 (class 0 OID 0)
-- Dependencies: 214
-- Name: cities_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_city_id_seq', 1, false);


--
-- TOC entry 3427 (class 0 OID 0)
-- Dependencies: 216
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, false);


--
-- TOC entry 3252 (class 2606 OID 16447)
-- Name: ads ads_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ads
    ADD CONSTRAINT ads_pkey PRIMARY KEY (ad_id);


--
-- TOC entry 3254 (class 2606 OID 16464)
-- Name: bids bids_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bids
    ADD CONSTRAINT bids_pkey PRIMARY KEY (bid_id);


--
-- TOC entry 3256 (class 2606 OID 16500)
-- Name: cars cars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_pkey PRIMARY KEY (car_id);


--
-- TOC entry 3244 (class 2606 OID 16411)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (city_id);


--
-- TOC entry 3246 (class 2606 OID 16413)
-- Name: cities uc_latitude_longitude; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT uc_latitude_longitude UNIQUE (latitude, longitude);


--
-- TOC entry 3248 (class 2606 OID 16422)
-- Name: users uc_phone_number; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uc_phone_number UNIQUE (phone_number);


--
-- TOC entry 3250 (class 2606 OID 16420)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3259 (class 2606 OID 16470)
-- Name: bids fk_ad_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bids
    ADD CONSTRAINT fk_ad_id FOREIGN KEY (ad_id) REFERENCES public.ads(ad_id);


--
-- TOC entry 3257 (class 2606 OID 16423)
-- Name: users fk_city_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_city_id FOREIGN KEY (city_id) REFERENCES public.cities(city_id);


--
-- TOC entry 3258 (class 2606 OID 16448)
-- Name: ads fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ads
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 3260 (class 2606 OID 16465)
-- Name: bids fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bids
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id);


-- Completed on 2023-05-07 17:00:59 WIB

--
-- PostgreSQL database dump complete
--

