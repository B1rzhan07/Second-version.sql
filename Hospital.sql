--
-- PostgreSQL database dump
--

-- Dumped from database version 15.0
-- Dumped by pg_dump version 15.0

-- Started on 2022-11-23 00:56:24 +06

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
-- TOC entry 855 (class 1247 OID 24618)
-- Name: enum_doctors_category; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_doctors_category AS ENUM (
    'higher',
    'first',
    'second',
    'third',
    'nurse'
);


ALTER TYPE public.enum_doctors_category OWNER TO postgres;

--
-- TOC entry 858 (class 1247 OID 24652)
-- Name: enum_patients_blood_group; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_patients_blood_group AS ENUM (
    'first',
    'second',
    'third',
    'fourth'
);


ALTER TYPE public.enum_patients_blood_group OWNER TO postgres;

--
-- TOC entry 861 (class 1247 OID 24662)
-- Name: enum_patients_marital_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_patients_marital_status AS ENUM (
    'married',
    'widowed',
    'separated',
    'divorced',
    'single'
);


ALTER TYPE public.enum_patients_marital_status OWNER TO postgres;

--
-- TOC entry 870 (class 1247 OID 33007)
-- Name: enum_users_role; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_users_role AS ENUM (
    'patient',
    'doctor',
    'admin'
);


ALTER TYPE public.enum_users_role OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 223 (class 1259 OID 33844)
-- Name: administrative_staffs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.administrative_staffs (
    id integer NOT NULL,
    email character varying(255),
    password character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer
);


ALTER TABLE public.administrative_staffs OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 33843)
-- Name: administrative_staffs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.administrative_staffs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.administrative_staffs_id_seq OWNER TO postgres;

--
-- TOC entry 3723 (class 0 OID 0)
-- Dependencies: 222
-- Name: administrative_staffs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.administrative_staffs_id_seq OWNED BY public.administrative_staffs.id;


--
-- TOC entry 228 (class 1259 OID 33891)
-- Name: appointments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appointments (
    id integer NOT NULL,
    name character varying(255),
    surname character varying(255),
    completed boolean DEFAULT false,
    "startDate" timestamp with time zone,
    "endDate" timestamp with time zone,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "doctorId" integer,
    "patientId" integer,
    "serviceId" integer
);


ALTER TABLE public.appointments OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 33890)
-- Name: appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.appointments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appointments_id_seq OWNER TO postgres;

--
-- TOC entry 3724 (class 0 OID 0)
-- Dependencies: 227
-- Name: appointments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.appointments_id_seq OWNED BY public.appointments.id;


--
-- TOC entry 230 (class 1259 OID 33916)
-- Name: conversations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conversations (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "firstId" integer,
    "secondId" integer
);


ALTER TABLE public.conversations OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 33915)
-- Name: conversations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conversations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conversations_id_seq OWNER TO postgres;

--
-- TOC entry 3725 (class 0 OID 0)
-- Dependencies: 229
-- Name: conversations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.conversations_id_seq OWNED BY public.conversations.id;


--
-- TOC entry 215 (class 1259 OID 24687)
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    id integer NOT NULL,
    department_name character varying(255),
    department_info character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 24686)
-- Name: departments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departments_id_seq OWNER TO postgres;

--
-- TOC entry 3726 (class 0 OID 0)
-- Dependencies: 214
-- Name: departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departments_id_seq OWNED BY public.departments.id;


--
-- TOC entry 226 (class 1259 OID 33875)
-- Name: doctorServices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."doctorServices" (
    price integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "doctorId" integer NOT NULL,
    "serviceId" integer NOT NULL
);


ALTER TABLE public."doctorServices" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 33821)
-- Name: doctors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctors (
    id integer NOT NULL,
    iin character varying(255),
    email character varying(255),
    password character varying(255),
    date_of_birth date,
    government_id character varying(255),
    name character varying(255),
    surname character varying(255),
    middle_name character varying(255),
    contact_number character varying(255),
    experience_in_year integer,
    photo character varying(255),
    category public.enum_doctors_category,
    degree character varying(255),
    rating numeric,
    address character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "departmentId" integer,
    "userId" integer
);


ALTER TABLE public.doctors OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 33820)
-- Name: doctors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.doctors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doctors_id_seq OWNER TO postgres;

--
-- TOC entry 3727 (class 0 OID 0)
-- Dependencies: 220
-- Name: doctors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.doctors_id_seq OWNED BY public.doctors.id;


--
-- TOC entry 232 (class 1259 OID 33935)
-- Name: messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    text character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "senderId" integer,
    "recieverId" integer,
    "conversationId" integer
);


ALTER TABLE public.messages OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 33934)
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO postgres;

--
-- TOC entry 3728 (class 0 OID 0)
-- Dependencies: 231
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- TOC entry 225 (class 1259 OID 33858)
-- Name: patients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patients (
    id integer NOT NULL,
    iin character varying(255),
    email character varying(255),
    password character varying(255),
    date_of_birth date,
    government_id character varying(255),
    name character varying(255),
    surname character varying(255),
    middle_name character varying(255),
    blood_group public.enum_patients_blood_group,
    emergency_contact_number character varying(255),
    contact_number character varying(255),
    address character varying(255),
    marital_status public.enum_patients_marital_status,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer
);


ALTER TABLE public.patients OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 33857)
-- Name: patients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.patients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patients_id_seq OWNER TO postgres;

--
-- TOC entry 3729 (class 0 OID 0)
-- Dependencies: 224
-- Name: patients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.patients_id_seq OWNED BY public.patients.id;


--
-- TOC entry 217 (class 1259 OID 24698)
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    id integer NOT NULL,
    service_name character varying(255),
    price integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "departmentId" integer,
    duration integer DEFAULT 30 NOT NULL
);


ALTER TABLE public.services OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 24697)
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_id_seq OWNER TO postgres;

--
-- TOC entry 3730 (class 0 OID 0)
-- Dependencies: 216
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- TOC entry 219 (class 1259 OID 33812)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(255),
    role public.enum_users_role,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 33811)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3731 (class 0 OID 0)
-- Dependencies: 218
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3500 (class 2604 OID 33847)
-- Name: administrative_staffs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrative_staffs ALTER COLUMN id SET DEFAULT nextval('public.administrative_staffs_id_seq'::regclass);


--
-- TOC entry 3502 (class 2604 OID 33894)
-- Name: appointments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments ALTER COLUMN id SET DEFAULT nextval('public.appointments_id_seq'::regclass);


--
-- TOC entry 3504 (class 2604 OID 33919)
-- Name: conversations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conversations ALTER COLUMN id SET DEFAULT nextval('public.conversations_id_seq'::regclass);


--
-- TOC entry 3495 (class 2604 OID 24690)
-- Name: departments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments ALTER COLUMN id SET DEFAULT nextval('public.departments_id_seq'::regclass);


--
-- TOC entry 3499 (class 2604 OID 33824)
-- Name: doctors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors ALTER COLUMN id SET DEFAULT nextval('public.doctors_id_seq'::regclass);


--
-- TOC entry 3505 (class 2604 OID 33938)
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- TOC entry 3501 (class 2604 OID 33861)
-- Name: patients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients ALTER COLUMN id SET DEFAULT nextval('public.patients_id_seq'::regclass);


--
-- TOC entry 3496 (class 2604 OID 24701)
-- Name: services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- TOC entry 3498 (class 2604 OID 33815)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3708 (class 0 OID 33844)
-- Dependencies: 223
-- Data for Name: administrative_staffs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.administrative_staffs (id, email, password, "createdAt", "updatedAt", "userId") FROM stdin;
1	hospitalswe@gmail.com	$2b$05$aLm70wWlhTfw5/VxNodGqejthmam0GpM2DatJFip69tTMI8FpNAfy	2022-11-20 21:03:25.273+06	2022-11-20 21:03:25.273+06	1
\.


--
-- TOC entry 3713 (class 0 OID 33891)
-- Dependencies: 228
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.appointments (id, name, surname, completed, "startDate", "endDate", "createdAt", "updatedAt", "doctorId", "patientId", "serviceId") FROM stdin;
3	bir	fwef	f	2022-11-11 10:00:00+06	2022-11-11 10:30:00+06	2022-11-21 22:55:22.849+06	2022-11-21 22:55:22.849+06	2	9	26
5	Serikbolsyn	Satov	f	2022-11-11 11:30:00+06	2022-11-11 12:00:00+06	2022-11-23 00:04:39.225+06	2022-11-23 00:04:39.225+06	2	9	29
4	Birzhan	Zhunubbekov	f	2022-11-11 11:00:00+06	2022-11-11 11:30:00+06	2022-11-23 00:03:22.231+06	2022-11-23 00:03:22.231+06	2	9	29
6	Serikbolsyn	Satov	f	2022-11-25 13:30:00+06	2022-11-25 14:00:00+06	2022-11-23 00:11:50.873+06	2022-11-23 00:11:50.873+06	2	9	26
7	Serikbolsyn	Satov	f	2022-11-18 11:30:00+06	2022-11-18 12:00:00+06	2022-11-23 00:19:21.082+06	2022-11-23 00:19:21.082+06	2	9	31
\.


--
-- TOC entry 3715 (class 0 OID 33916)
-- Dependencies: 230
-- Data for Name: conversations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conversations (id, "createdAt", "updatedAt", "firstId", "secondId") FROM stdin;
\.


--
-- TOC entry 3700 (class 0 OID 24687)
-- Dependencies: 215
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (id, department_name, department_info, "createdAt", "updatedAt") FROM stdin;
12	Medicine	The field of health and healing.	2022-11-03 20:24:10.188+06	2022-11-03 20:24:10.188+06
13	Obstetrics	The field of study concentrated on pregnancy, childbirth and the postpartum period. As a medical specialty, obstetrics is combined with gynecology under the discipline known as obstetrics and gynecology, which is a surgical field.	2022-11-03 20:25:26.013+06	2022-11-03 20:25:26.013+06
14	Surgery	Medical specialty that uses operative manual and instrumental techniques on a person to investigate or treat a pathological condition such as a disease or injury, to help improve bodily function, appearance, or to repair unwanted ruptured areas.	2022-11-03 20:28:13.967+06	2022-11-03 20:28:13.967+06
10	Gynecolog	The area of medicine that involves the treatment of women's diseases, especially those of the reproductive organs.	2022-10-29 16:13:59.593+06	2022-10-29 16:13:59.593+06
9	Pediatrics	The branch of medicine that involves the medical care of infants, children, adolescents, and young adults.	2022-10-29 16:13:59.593+06	2022-10-29 16:13:59.593+06
8	Eye	A surgical subspecialty within medicine that deals with the diagnosis and treatment of eye disorders.	2022-10-29 16:13:59.593+06	2022-10-29 16:13:59.593+06
7	ENT	A surgical subspeciality within medicine that deals with the surgical and medical management of conditions of the head and neck. 	2022-10-29 16:13:59.593+06	2022-10-29 16:13:59.593+06
6	Dental	Dental medicine and oral medicine, is the branch of medicine focused on the teeth, gums, and mouth.	2022-10-29 16:13:59.593+06	2022-10-29 16:13:59.593+06
5	Orthopedics	The medical specialty that focuses on injuries and diseases of your body's musculoskeletal system	2022-10-29 16:13:59.593+06	2022-10-29 16:13:59.593+06
4	Neurology	The branch of medicine dealing with the diagnosis and treatment of all categories of conditions and disease involving the brain, the spinal cord and the peripheral nerves.	2022-10-29 16:13:59.593+06	2022-10-29 16:13:59.593+06
3	Cardiology	A branch of medicine that deals with disorders of the heart and the cardiovascular system.	2022-10-29 16:13:59.593+06	2022-10-29 16:13:59.593+06
2	Psychiatry	The medical specialty devoted to the diagnosis, prevention, and treatment of mental disorders.	2022-10-29 16:13:59.593+06	2022-10-29 16:13:59.593+06
1	Skin	Specialist medical doctor who manages diseases related to skin, hair, nails, and some cosmetic problems.	2022-10-29 16:13:59.593+06	2022-10-29 16:13:59.593+06
11	Radiology	A branch of medicine that uses imaging technology to diagnose and treat disease.	2022-10-29 16:13:59.593+06	2022-10-29 16:13:59.593+06
\.


--
-- TOC entry 3711 (class 0 OID 33875)
-- Dependencies: 226
-- Data for Name: doctorServices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."doctorServices" (price, "createdAt", "updatedAt", "doctorId", "serviceId") FROM stdin;
4000	2022-11-20 22:16:29.429+06	2022-11-20 22:16:29.429+06	2	38
3000	2022-11-20 22:16:29.429+06	2022-11-20 22:16:29.429+06	6	35
5000	2022-11-20 22:16:29.429+06	2022-11-20 22:16:29.429+06	13	37
7000	2022-11-20 22:16:29.429+06	2022-11-20 22:16:29.429+06	14	36
4900	2022-11-20 22:16:29.429+06	2022-11-20 22:16:29.429+06	20	1
4000	2022-11-20 22:16:29.429+06	2022-11-20 22:16:29.429+06	22	2
4000	2022-11-20 22:16:29.429+06	2022-11-20 22:16:29.429+06	23	32
5000	2022-11-20 22:16:29.429+06	2022-11-20 22:16:29.429+06	24	31
4000	2022-11-20 22:16:29.429+06	2022-11-20 22:16:29.429+06	25	30
3000	2022-11-20 22:16:29.429+06	2022-11-20 22:16:29.429+06	26	4
4000	2022-11-20 22:16:29.429+06	2022-11-20 22:16:29.429+06	30	3
5000	2022-11-20 22:16:29.429+06	2022-11-20 22:16:29.429+06	31	5
4000	2022-11-20 22:16:29.429+06	2022-11-20 22:16:29.429+06	32	6
3000	2022-11-20 22:16:29.429+06	2022-11-20 22:16:29.429+06	34	7
9000	2022-11-20 22:16:29.429+06	2022-11-20 22:16:29.429+06	25	8
4000	2022-11-20 22:16:29.429+06	2022-11-20 22:16:29.429+06	24	9
8000	2022-11-20 22:16:29.429+06	2022-11-20 22:16:29.429+06	23	16
4000	2022-11-20 22:16:29.429+06	2022-11-20 22:16:29.429+06	22	15
6000	2022-11-20 22:16:29.429+06	2022-11-20 22:16:29.429+06	20	14
5000	2022-11-20 22:16:29.429+06	2022-11-20 22:16:29.429+06	14	13
4000	2022-11-20 22:16:29.429+06	2022-11-20 22:16:29.429+06	13	12
5000	2022-11-20 22:16:29.429+06	2022-11-20 22:16:29.429+06	6	11
4000	2022-11-20 22:16:29.429+06	2022-11-20 22:16:29.429+06	2	10
4000	2022-11-20 22:16:29.429+06	2022-11-20 22:16:29.429+06	14	27
7000	2022-11-20 22:16:29.429+06	2022-11-20 22:16:29.429+06	20	26
5000	2022-11-20 22:16:29.429+06	2022-11-20 22:16:29.429+06	22	25
4000	2022-11-20 22:16:29.429+06	2022-11-20 22:16:29.429+06	23	24
3000	2022-11-20 22:16:29.429+06	2022-11-20 22:16:29.429+06	24	23
5000	2022-11-20 22:16:29.429+06	2022-11-20 22:16:29.429+06	25	22
6000	2022-11-20 22:16:29.429+06	2022-11-20 22:16:29.429+06	26	21
7000	2022-11-20 22:16:29.429+06	2022-11-20 22:16:29.429+06	30	20
8000	2022-11-20 22:16:29.429+06	2022-11-20 22:16:29.429+06	31	19
9000	2022-11-20 22:16:29.429+06	2022-11-20 22:16:29.429+06	34	17
4000	2022-11-20 22:16:29.429+06	2022-11-20 22:16:29.429+06	6	29
2200	2022-11-20 22:16:29.429+06	2022-11-20 22:16:29.429+06	2	28
\.


--
-- TOC entry 3706 (class 0 OID 33821)
-- Dependencies: 221
-- Data for Name: doctors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctors (id, iin, email, password, date_of_birth, government_id, name, surname, middle_name, contact_number, experience_in_year, photo, category, degree, rating, address, "createdAt", "updatedAt", "departmentId", "userId") FROM stdin;
14	424242	almaz.amangeldin@nu.edu.kz	$2b$05$TK35.f/8MnjB.IphkbHySeN5K32CadtjAZpz4DOeJBybuaeMRVyw2	2022-11-18	424242	Almaz	Amangeldin	fwefw	424242	4242	b5d1d13a-5e35-4d9e-9bec-cec28fe0e6fb.jpg	third	424242	3	Almaty	2022-11-21 13:34:33.868+06	2022-11-21 13:34:33.868+06	4	23
2	4242424	islam.yerzhanuly@nu.edu.kz	$2b$05$Vw.3yUFbskblUx0KSRbXte.3icAGkQc23DK7osKP.MPjTMoBAoabC	2022-11-12	42424242	Islam	Yerzhanuly		234242	424	35a7a2e3-0326-4122-9a95-2361b5de0fd6.jpg	second	4234	4	AStana	2022-11-20 22:00:28.437+06	2022-11-20 22:00:28.437+06	1	10
6	424242434242	symbat.mombayeva@nu.edu.kz	$2b$05$iGYcCdD8ndRNac7UJ44x.O3cTbfIMu/p7EpmkbWMGNR0paTfVfjdK	2022-11-05	424242	Symbat	Mombayeva	ffwf	42424	4242	8e1d8723-88a6-4bd9-8122-6bca82cf2851.jpg	second	423	42	Almaty	2022-11-20 22:03:55.637+06	2022-11-20 22:03:55.637+06	2	14
13	424242333	amina.bekbayeva@nu.edu.kz	$2b$05$5vSerN1ZaU7J3As2UdVCOuX6eTEGPHWBM.yTcHXUyz0yw3X1JWitK	2022-11-12	324242	amina	befew	gwgw	42424	424	f98beee1-57db-4e56-94c2-a7619062a421.jpg	second	432	43	almay	2022-11-20 22:08:45.582+06	2022-11-20 22:08:45.582+06	3	21
20	42424244	daulet.maldybaev@nu.edu.kz	$2b$05$4Of9fcPsY0Z9YyamxDlGdegYSAhtbheBLgTtb6X4bKhiArtADLY/6	2022-11-11	4242424	daulet	fwefwef	fwfw	42424	4242	1e9cf871-5735-4ef2-85bf-92a1fe41f18a.jpg	second	4234	4	almaty	2022-11-21 13:43:57.39+06	2022-11-21 13:43:57.39+06	5	29
22	423424	rustem.zhursinbek@nu.edu.kz	$2b$05$evsfuX1A15kSLCeqKG3SduBIesjZ1g.Ex5vQabMclRzaNTz1mQ7LK	2022-11-12	4324242	rus	sdd	dad	4242	23424	0164c441-2457-456d-b5aa-d60426e1e17e.jpg	first	42424	434	almaty	2022-11-21 13:48:04.674+06	2022-11-21 13:48:04.674+06	6	30
23	43332424234	angsar.kabdikarim@nu.edu.kz	$2b$05$wzcR8ab5OMUZodQGIy905ud8bODDtO3tD0Rgfn4casBNET03fihuG	2022-11-05	3424234	nurbek	xalas	fwef	243424	424	46d9f8c2-0b03-42e0-8e25-7502ccf3d7db.jpg	nurse	4242	4	almaty	2022-11-21 13:50:41.931+06	2022-11-21 13:50:41.931+06	7	31
24	3423424	zhansultan.assemzhar@nu.edu.kz	$2b$05$hAjmfDA66zTnxQ7BIgHSpOzLyXVtgvJHMWYP.GL6a0Uf5jPIRfG4O	2022-11-19	424242	zhansul	assemzhar	sddsd	4242	4314	2ed0ca6d-96b2-46ec-9225-6881a451f9b5.jpg	first	341	41341	almaty	2022-11-21 13:51:43.989+06	2022-11-21 13:51:43.989+06	8	32
25	4234234324	birzhan.zhunusbekov@fizmat.kz	$2b$05$tPnE3L2wCATFG5z2qkGnz.ka2SW8ZADm/p5u83jNwV2nCJ05.aDca	2022-11-18	424242	nurlyber	md	fwef	424242	424	c3dc2ae4-31f3-43ae-9b70-9aba243a9dd7.jpg	second	4242	42	424242	2022-11-21 13:52:30.884+06	2022-11-21 13:52:30.884+06	9	33
26	42424	alibek.kulmakhanov@nu.edu.kz	$2b$05$zvH0PqOocXL4P5DcpK/MuuYivrrB472E6573U2yJ4qGWmOLuRKVHO	2022-11-25	4242	alibek	fkuk	fewf	424242	4242	b529c23c-bb54-4704-9a34-7e8358a587e3.jpg	second	422424	4242	4242	2022-11-21 13:53:33.919+06	2022-11-21 13:53:33.919+06	10	34
30	4242432	iliyas.kengeskhan@nu.edu.kz	$2b$05$kxzjU72XywbAC0IFJ9AxpOHLQ4Yte4gd0bzBsSG7A3IpNwk3l/ZQC	2022-11-18	4242	zharaz	bir	zhan	24242	4242	5a95f72d-a626-40a1-9308-735be4bc5c81.jpg	nurse	4242	4	almagy	2022-11-21 13:55:09.539+06	2022-11-21 13:55:09.539+06	11	38
31	324242	zhigulu.mi@nu.edu.kz	$2b$05$uK0h.ZJ1bdgIFKRL.hkdTufXcJkqEyV.dmEqYWkGTNV9ecmrsgnfW	2022-11-12	42424	zhigulu	daraeva	fw	42424	423432	6874b0e1-d433-40c9-b00c-0cebba0d3331.jpg	nurse	4242	34	fknkwef	2022-11-21 13:55:59.303+06	2022-11-21 13:55:59.303+06	12	39
32	23424	meruert.kasengazieva@nu.edu.kz	$2b$05$tJtB7pdLoHf6PO4AHaIlWulR9IbVI6xdXjZsFt63UvnBeL9EN.Vk2	2022-11-25	4242	meuert	kasengaziva	dwefew	42424	4242	d4d103e5-a6f4-40a7-b104-7432ad370b23.jpg	second	42344	424242	almat	2022-11-21 13:57:15.124+06	2022-11-21 13:57:15.124+06	13	40
34	2342432	aiym.zhunubekova@gmail.com	$2b$05$OkKH0unOLxIdiIeYd.osU.lPc/FkazWGREfy38eob3uGMpDH/GBt.	2022-11-18	4242	aiym	zhinis	fjwefw	4242	4242	0c9ce16f-03c4-4162-a938-56a5750686bd.jpg	third	4242	342	4242	2022-11-21 13:58:17.012+06	2022-11-21 13:58:17.012+06	14	42
\.


--
-- TOC entry 3717 (class 0 OID 33935)
-- Dependencies: 232
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.messages (id, text, "createdAt", "updatedAt", "senderId", "recieverId", "conversationId") FROM stdin;
\.


--
-- TOC entry 3710 (class 0 OID 33858)
-- Dependencies: 225
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patients (id, iin, email, password, date_of_birth, government_id, name, surname, middle_name, blood_group, emergency_contact_number, contact_number, address, marital_status, "createdAt", "updatedAt", "userId") FROM stdin;
6	40298424	birzhan.zhunusbekov@nu.edu.kz	$2b$05$96VolrQrBn/VwkgXeFxTeuuIEXlec5pJ7a4allUVuVZ6FBTFCOhj.	2022-11-03	42342342	Birzhan	Zhunusbekov	Kuraluly	first	42425r25	2535252	Almaty	married	2022-11-20 21:58:32.244+06	2022-11-20 21:58:32.244+06	8
7	42424242	birka.zzz0207@gmail.com	$2b$05$oZSXYnbL/FG//TiJbjWvze6oTRalyupzd/9bu7749a8TajlTil4Ei	2022-11-23	234242	Naz	Must 	give	first	42424242	53453535	Astana	single	2022-11-20 21:59:31.104+06	2022-11-20 21:59:31.104+06	9
8	2424	angsar.kabdikari@nu.edu.kz	$2b$05$yJ5TO5fhcKJkGxic.xmyjecGCgNKmgrSHSzPha..mAiGJNC0ccIk.	2022-11-09	4242	Angsar	kabdikarim	fwef	third	242	4242	almaty	married	2022-11-21 14:00:40.758+06	2022-11-21 14:00:40.758+06	45
9	424242	serikbolsyn.satov@nu.edu.kz	$2b$05$w.yPNCU3zzjpK7hkuEBck.Z8VC0rDu3kWYEwG/FRSmTXVtVs2oTt6	2022-11-04	42424	Serikbolsyn	Satov	lfmwfw	second	4242424	42525253	Astana	married	2022-11-21 15:30:19.009+06	2022-11-21 15:30:19.009+06	46
\.


--
-- TOC entry 3702 (class 0 OID 24698)
-- Dependencies: 217
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services (id, service_name, price, "createdAt", "updatedAt", "departmentId", duration) FROM stdin;
1	MRI	5000	2022-10-30 18:31:29.642+06	2022-10-30 18:31:29.642+06	11	30
2	ultrasound	3000	2022-10-30 18:31:29.642+06	2022-10-30 18:31:29.642+06	11	30
3	CTS	4000	2022-10-30 18:31:29.642+06	2022-10-30 18:31:29.642+06	11	30
4	X-Ray	8000	2022-10-30 18:31:29.642+06	2022-10-30 18:31:29.642+06	11	30
5	Chemical Peels	3000	2022-10-30 18:31:29.642+06	2022-10-30 18:31:29.642+06	1	30
6	Laser Resurfacing	4000	2022-10-30 18:31:29.642+06	2022-10-30 18:31:29.642+06	1	30
7	Individual psychotherapy/counseling.	7000	2022-10-30 18:31:29.642+06	2022-10-30 18:31:29.642+06	2	30
8	Medication.	6000	2022-10-30 18:31:29.642+06	2022-10-30 18:31:29.642+06	2	30
9	Heart valve surgery	12000	2022-10-30 18:31:29.642+06	2022-10-30 18:31:29.642+06	3	30
10	Artificial pacemaker surgery.	14000	2022-10-30 18:31:29.642+06	2022-10-30 18:31:29.642+06	3	30
11	Neurological exam	2500	2022-10-30 18:31:29.642+06	2022-10-30 18:31:29.642+06	4	30
12	Cerebral Aneurysm	9000	2022-10-30 18:31:29.642+06	2022-10-30 18:31:29.642+06	4	30
13	Cartilage surgery to knee	9000	2022-10-30 18:31:29.642+06	2022-10-30 18:31:29.642+06	5	30
14	Joint fusion	5000	2022-10-30 18:31:29.642+06	2022-10-30 18:31:29.642+06	5	30
15	Preventative and diagnostic care	4500	2022-10-30 18:31:29.642+06	2022-10-30 18:31:29.642+06	6	30
16	Maxillofacial surgery	14000	2022-10-30 18:31:29.642+06	2022-10-30 18:31:29.642+06	6	30
17	Neck disorders	9000	2022-10-30 18:31:29.642+06	2022-10-30 18:31:29.642+06	7	30
18	Nose disorders	6000	2022-10-30 18:31:29.642+06	2022-10-30 18:31:29.642+06	7	30
19	Fit glasses	6000	2022-10-30 18:31:29.642+06	2022-10-30 18:31:29.642+06	8	30
20	Contact lenses	7000	2022-10-30 18:31:29.642+06	2022-10-30 18:31:29.642+06	8	30
21	Prescribe treatments or therapies	8000	2022-10-30 18:31:29.642+06	2022-10-30 18:31:29.642+06	9	30
22	Order medical diagnostic	5000	2022-10-30 18:31:29.642+06	2022-10-30 18:31:29.642+06	9	30
23	Pelvic exams	4000	2022-10-30 18:31:29.642+06	2022-10-30 18:31:29.642+06	10	30
24	Cancer screenings	4000	2022-10-30 18:31:29.642+06	2022-10-30 18:31:29.642+06	10	30
25	Vaginal infections	7000	2022-10-30 18:31:29.642+06	2022-10-30 18:31:29.642+06	10	30
26	Emergency services	7000	2022-10-30 18:31:29.642+06	2022-10-30 18:31:29.642+06	12	30
27	Physician care	6000	2022-10-30 18:31:29.642+06	2022-10-30 18:31:29.642+06	12	30
28	Vision care	4000	2022-10-30 18:31:29.642+06	2022-10-30 18:31:29.642+06	12	30
29	Antenatal care	10000	2022-10-30 18:31:29.642+06	2022-10-30 18:31:29.642+06	13	30
30	Postnatal care	8000	2022-10-30 18:31:29.642+06	2022-10-30 18:31:29.642+06	13	30
31	Carotid endarterectomy	6000	2022-10-30 18:31:29.642+06	2022-10-30 18:31:29.642+06	14	30
32	Appendectomy	7000	2022-10-30 18:31:29.642+06	2022-10-30 18:31:29.642+06	14	30
35	pathogen	4000	2022-11-20 16:42:34.849+06	2022-11-20 16:42:34.849+06	7	30
36	Examination	8000	2022-11-20 17:00:28.936+06	2022-11-20 17:00:28.936+06	4	30
37	Checking	5000	2022-11-20 17:03:31.327+06	2022-11-20 17:03:31.327+06	8	30
38	byBirka	4000	2022-11-20 22:16:29.425+06	2022-11-20 22:16:29.425+06	13	30
\.


--
-- TOC entry 3704 (class 0 OID 33812)
-- Dependencies: 219
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, role, "createdAt", "updatedAt") FROM stdin;
1	hospitalswe@gmail.com	admin	2022-11-20 21:03:25.259+06	2022-11-20 21:03:25.259+06
8	birzhan.zhunusbekov@nu.edu.kz	patient	2022-11-20 21:58:32.234+06	2022-11-20 21:58:32.234+06
9	birka.zzz0207@gmail.com	patient	2022-11-20 21:59:31.096+06	2022-11-20 21:59:31.096+06
10	islam.yerzhanuly@nu.edu.kz	doctor	2022-11-20 22:00:28.429+06	2022-11-20 22:00:28.429+06
14	symbat.mombayeva@nu.edu.kz	doctor	2022-11-20 22:03:55.633+06	2022-11-20 22:03:55.633+06
21	amina.bekbayeva@nu.edu.kz	doctor	2022-11-20 22:08:45.576+06	2022-11-20 22:08:45.576+06
23	almaz.amangeldin@nu.edu.kz	doctor	2022-11-21 13:34:33.861+06	2022-11-21 13:34:33.861+06
29	daulet.maldybaev@nu.edu.kz	doctor	2022-11-21 13:43:57.381+06	2022-11-21 13:43:57.381+06
30	rustem.zhursinbek@nu.edu.kz	doctor	2022-11-21 13:48:04.664+06	2022-11-21 13:48:04.664+06
31	angsar.kabdikarim@nu.edu.kz	doctor	2022-11-21 13:50:41.926+06	2022-11-21 13:50:41.926+06
32	zhansultan.assemzhar@nu.edu.kz	doctor	2022-11-21 13:51:43.982+06	2022-11-21 13:51:43.982+06
33	birzhan.zhunusbekov@fizmat.kz	doctor	2022-11-21 13:52:30.877+06	2022-11-21 13:52:30.877+06
34	alibek.kulmakhanov@nu.edu.kz	doctor	2022-11-21 13:53:33.913+06	2022-11-21 13:53:33.913+06
38	iliyas.kengeskhan@nu.edu.kz	doctor	2022-11-21 13:55:09.532+06	2022-11-21 13:55:09.532+06
39	zhigulu.mi@nu.edu.kz	doctor	2022-11-21 13:55:59.296+06	2022-11-21 13:55:59.296+06
40	meruert.kasengazieva@nu.edu.kz	doctor	2022-11-21 13:57:15.119+06	2022-11-21 13:57:15.119+06
42	aiym.zhunubekova@gmail.com	doctor	2022-11-21 13:58:17.007+06	2022-11-21 13:58:17.007+06
45	angsar.kabdikari@nu.edu.kz	patient	2022-11-21 14:00:40.752+06	2022-11-21 14:00:40.752+06
46	serikbolsyn.satov@nu.edu.kz	patient	2022-11-21 15:30:18.994+06	2022-11-21 15:30:18.994+06
\.


--
-- TOC entry 3732 (class 0 OID 0)
-- Dependencies: 222
-- Name: administrative_staffs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.administrative_staffs_id_seq', 1, true);


--
-- TOC entry 3733 (class 0 OID 0)
-- Dependencies: 227
-- Name: appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointments_id_seq', 7, true);


--
-- TOC entry 3734 (class 0 OID 0)
-- Dependencies: 229
-- Name: conversations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.conversations_id_seq', 1, false);


--
-- TOC entry 3735 (class 0 OID 0)
-- Dependencies: 214
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departments_id_seq', 78, true);


--
-- TOC entry 3736 (class 0 OID 0)
-- Dependencies: 220
-- Name: doctors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctors_id_seq', 34, true);


--
-- TOC entry 3737 (class 0 OID 0)
-- Dependencies: 231
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.messages_id_seq', 1, false);


--
-- TOC entry 3738 (class 0 OID 0)
-- Dependencies: 224
-- Name: patients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patients_id_seq', 9, true);


--
-- TOC entry 3739 (class 0 OID 0)
-- Dependencies: 216
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.services_id_seq', 38, true);


--
-- TOC entry 3740 (class 0 OID 0)
-- Dependencies: 218
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 46, true);


--
-- TOC entry 3525 (class 2606 OID 33851)
-- Name: administrative_staffs administrative_staffs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrative_staffs
    ADD CONSTRAINT administrative_staffs_pkey PRIMARY KEY (id);


--
-- TOC entry 3535 (class 2606 OID 33899)
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (id);


--
-- TOC entry 3537 (class 2606 OID 33923)
-- Name: conversations conversations_firstId_secondId_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conversations
    ADD CONSTRAINT "conversations_firstId_secondId_key" UNIQUE ("firstId", "secondId");


--
-- TOC entry 3539 (class 2606 OID 33921)
-- Name: conversations conversations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conversations
    ADD CONSTRAINT conversations_pkey PRIMARY KEY (id);


--
-- TOC entry 3507 (class 2606 OID 24696)
-- Name: departments departments_department_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_department_name_key UNIQUE (department_name);


--
-- TOC entry 3509 (class 2606 OID 24694)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- TOC entry 3533 (class 2606 OID 33879)
-- Name: doctorServices doctorServices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."doctorServices"
    ADD CONSTRAINT "doctorServices_pkey" PRIMARY KEY ("doctorId", "serviceId");


--
-- TOC entry 3519 (class 2606 OID 33832)
-- Name: doctors doctors_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_email_key UNIQUE (email);


--
-- TOC entry 3521 (class 2606 OID 33830)
-- Name: doctors doctors_iin_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_iin_key UNIQUE (iin);


--
-- TOC entry 3523 (class 2606 OID 33828)
-- Name: doctors doctors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (id);


--
-- TOC entry 3541 (class 2606 OID 33940)
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- TOC entry 3527 (class 2606 OID 33869)
-- Name: patients patients_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_email_key UNIQUE (email);


--
-- TOC entry 3529 (class 2606 OID 33867)
-- Name: patients patients_iin_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_iin_key UNIQUE (iin);


--
-- TOC entry 3531 (class 2606 OID 33865)
-- Name: patients patients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (id);


--
-- TOC entry 3511 (class 2606 OID 24703)
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- TOC entry 3513 (class 2606 OID 24705)
-- Name: services services_service_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_name_key UNIQUE (service_name);


--
-- TOC entry 3515 (class 2606 OID 33819)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3517 (class 2606 OID 33817)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3545 (class 2606 OID 33852)
-- Name: administrative_staffs administrative_staffs_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrative_staffs
    ADD CONSTRAINT "administrative_staffs_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3549 (class 2606 OID 33900)
-- Name: appointments appointments_doctorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT "appointments_doctorId_fkey" FOREIGN KEY ("doctorId") REFERENCES public.doctors(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3550 (class 2606 OID 33905)
-- Name: appointments appointments_patientId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT "appointments_patientId_fkey" FOREIGN KEY ("patientId") REFERENCES public.patients(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3551 (class 2606 OID 33910)
-- Name: appointments appointments_serviceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT "appointments_serviceId_fkey" FOREIGN KEY ("serviceId") REFERENCES public.services(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3552 (class 2606 OID 33924)
-- Name: conversations conversations_firstId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conversations
    ADD CONSTRAINT "conversations_firstId_fkey" FOREIGN KEY ("firstId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3553 (class 2606 OID 33929)
-- Name: conversations conversations_secondId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conversations
    ADD CONSTRAINT "conversations_secondId_fkey" FOREIGN KEY ("secondId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3547 (class 2606 OID 33880)
-- Name: doctorServices doctorServices_doctorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."doctorServices"
    ADD CONSTRAINT "doctorServices_doctorId_fkey" FOREIGN KEY ("doctorId") REFERENCES public.doctors(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3548 (class 2606 OID 33885)
-- Name: doctorServices doctorServices_serviceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."doctorServices"
    ADD CONSTRAINT "doctorServices_serviceId_fkey" FOREIGN KEY ("serviceId") REFERENCES public.services(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3543 (class 2606 OID 33833)
-- Name: doctors doctors_departmentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT "doctors_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES public.departments(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3544 (class 2606 OID 33838)
-- Name: doctors doctors_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT "doctors_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3554 (class 2606 OID 33951)
-- Name: messages messages_conversationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT "messages_conversationId_fkey" FOREIGN KEY ("conversationId") REFERENCES public.conversations(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3555 (class 2606 OID 33946)
-- Name: messages messages_recieverId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT "messages_recieverId_fkey" FOREIGN KEY ("recieverId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3556 (class 2606 OID 33941)
-- Name: messages messages_senderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT "messages_senderId_fkey" FOREIGN KEY ("senderId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3546 (class 2606 OID 33870)
-- Name: patients patients_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT "patients_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3542 (class 2606 OID 24706)
-- Name: services services_departmentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT "services_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES public.departments(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2022-11-23 00:56:25 +06

--
-- PostgreSQL database dump complete
--

