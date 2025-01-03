--
-- PostgreSQL database dump
--

-- Dumped from database version 15.9
-- Dumped by pg_dump version 15.9

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
-- Name: dicom_files; Type: TABLE; Schema: public; Owner: dicom_user
--

CREATE TABLE public.dicom_files (
    id integer NOT NULL,
    patient_id integer NOT NULL,
    file_name character varying(255) NOT NULL,
    file_path text NOT NULL,
    file_size bigint,
    uploaded_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.dicom_files OWNER TO dicom_user;

--
-- Name: dicom_files_id_seq; Type: SEQUENCE; Schema: public; Owner: dicom_user
--

CREATE SEQUENCE public.dicom_files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dicom_files_id_seq OWNER TO dicom_user;

--
-- Name: dicom_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dicom_user
--

ALTER SEQUENCE public.dicom_files_id_seq OWNED BY public.dicom_files.id;


--
-- Name: doctors; Type: TABLE; Schema: public; Owner: dicom_user
--

CREATE TABLE public.doctors (
    id integer NOT NULL,
    full_name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    specialization character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.doctors OWNER TO dicom_user;

--
-- Name: doctors_id_seq; Type: SEQUENCE; Schema: public; Owner: dicom_user
--

CREATE SEQUENCE public.doctors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doctors_id_seq OWNER TO dicom_user;

--
-- Name: doctors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dicom_user
--

ALTER SEQUENCE public.doctors_id_seq OWNED BY public.doctors.id;


--
-- Name: patients; Type: TABLE; Schema: public; Owner: dicom_user
--

CREATE TABLE public.patients (
    id integer NOT NULL,
    full_name character varying(255) NOT NULL,
    date_of_birth date NOT NULL,
    gender character(1),
    doctor_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT patients_gender_check CHECK ((gender = ANY (ARRAY['M'::bpchar, 'F'::bpchar])))
);


ALTER TABLE public.patients OWNER TO dicom_user;

--
-- Name: patients_id_seq; Type: SEQUENCE; Schema: public; Owner: dicom_user
--

CREATE SEQUENCE public.patients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patients_id_seq OWNER TO dicom_user;

--
-- Name: patients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dicom_user
--

ALTER SEQUENCE public.patients_id_seq OWNED BY public.patients.id;


--
-- Name: dicom_files id; Type: DEFAULT; Schema: public; Owner: dicom_user
--

ALTER TABLE ONLY public.dicom_files ALTER COLUMN id SET DEFAULT nextval('public.dicom_files_id_seq'::regclass);


--
-- Name: doctors id; Type: DEFAULT; Schema: public; Owner: dicom_user
--

ALTER TABLE ONLY public.doctors ALTER COLUMN id SET DEFAULT nextval('public.doctors_id_seq'::regclass);


--
-- Name: patients id; Type: DEFAULT; Schema: public; Owner: dicom_user
--

ALTER TABLE ONLY public.patients ALTER COLUMN id SET DEFAULT nextval('public.patients_id_seq'::regclass);


--
-- Data for Name: dicom_files; Type: TABLE DATA; Schema: public; Owner: dicom_user
--

COPY public.dicom_files (id, patient_id, file_name, file_path, file_size, uploaded_at) FROM stdin;
\.


--
-- Data for Name: doctors; Type: TABLE DATA; Schema: public; Owner: dicom_user
--

COPY public.doctors (id, full_name, email, password, specialization, created_at) FROM stdin;
\.


--
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: dicom_user
--

COPY public.patients (id, full_name, date_of_birth, gender, doctor_id, created_at) FROM stdin;
\.


--
-- Name: dicom_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dicom_user
--

SELECT pg_catalog.setval('public.dicom_files_id_seq', 1, false);


--
-- Name: doctors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dicom_user
--

SELECT pg_catalog.setval('public.doctors_id_seq', 1, false);


--
-- Name: patients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dicom_user
--

SELECT pg_catalog.setval('public.patients_id_seq', 1, false);


--
-- Name: dicom_files dicom_files_pkey; Type: CONSTRAINT; Schema: public; Owner: dicom_user
--

ALTER TABLE ONLY public.dicom_files
    ADD CONSTRAINT dicom_files_pkey PRIMARY KEY (id);


--
-- Name: doctors doctors_email_key; Type: CONSTRAINT; Schema: public; Owner: dicom_user
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_email_key UNIQUE (email);


--
-- Name: doctors doctors_pkey; Type: CONSTRAINT; Schema: public; Owner: dicom_user
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (id);


--
-- Name: patients patients_pkey; Type: CONSTRAINT; Schema: public; Owner: dicom_user
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (id);


--
-- Name: dicom_files dicom_files_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dicom_user
--

ALTER TABLE ONLY public.dicom_files
    ADD CONSTRAINT dicom_files_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(id) ON DELETE CASCADE;


--
-- Name: patients patients_doctor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dicom_user
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_doctor_id_fkey FOREIGN KEY (doctor_id) REFERENCES public.doctors(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

