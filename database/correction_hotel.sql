--
-- PostgreSQL database dump
--

\restrict 0Ss6pRiz1jKCbFe9Zed60gUxlMNsCBp229JnOqAX0SrWgRTYVfBYfxPDAJ6E1rb

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: customer; Type: TABLE; Schema: public; Owner: hotel
--

CREATE TABLE public.customer (
    id character varying(50) NOT NULL
);


ALTER TABLE public.customer OWNER TO hotel;

--
-- Name: employee; Type: TABLE; Schema: public; Owner: hotel
--

CREATE TABLE public.employee (
    id character varying(50) NOT NULL,
    salary numeric(10,2) NOT NULL
);


ALTER TABLE public.employee OWNER TO hotel;

--
-- Name: payment; Type: TABLE; Schema: public; Owner: hotel
--

CREATE TABLE public.payment (
    id integer NOT NULL,
    payment_date timestamp without time zone NOT NULL,
    amount numeric(10,2) NOT NULL,
    customer_id character varying(50) NOT NULL,
    reservation_id character varying(50) NOT NULL
);


ALTER TABLE public.payment OWNER TO hotel;

--
-- Name: person; Type: TABLE; Schema: public; Owner: hotel
--

CREATE TABLE public.person (
    id character varying(50) NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(50) NOT NULL,
    cin character varying(50),
    passport_id character varying(150),
    phone character varying(50)
);


ALTER TABLE public.person OWNER TO hotel;

--
-- Name: reservation; Type: TABLE; Schema: public; Owner: hotel
--

CREATE TABLE public.reservation (
    id character varying(50) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    has_checked_in boolean DEFAULT false,
    has_checked_out boolean DEFAULT false,
    status character varying(20) NOT NULL,
    customer_id character varying(50) NOT NULL,
    employee_id character varying(50),
    CONSTRAINT reservation_status_check CHECK (((status)::text = ANY ((ARRAY['DONE'::character varying, 'PENDING'::character varying, 'CANCELED'::character varying])::text[])))
);


ALTER TABLE public.reservation OWNER TO hotel;

--
-- Name: room; Type: TABLE; Schema: public; Owner: hotel
--

CREATE TABLE public.room (
    id character varying(50) NOT NULL,
    price numeric(10,2) NOT NULL,
    capacity integer NOT NULL
);


ALTER TABLE public.room OWNER TO hotel;

--
-- Name: room_features; Type: TABLE; Schema: public; Owner: hotel
--

CREATE TABLE public.room_features (
    room_id character varying(50) NOT NULL,
    feature character varying(50) NOT NULL,
    CONSTRAINT room_features_feature_check CHECK (((feature)::text = ANY ((ARRAY['DOUBLE_SIZED_BED'::character varying, 'SINGLE_SIZED_BED'::character varying, 'PRIVATE_POOL'::character varying, 'AIR_CONDITIONNING'::character varying, 'WIFI'::character varying, 'TV'::character varying, 'SEAVIEW'::character varying])::text[])))
);


ALTER TABLE public.room_features OWNER TO hotel;

--
-- Name: room_reservation; Type: TABLE; Schema: public; Owner: hotel
--

CREATE TABLE public.room_reservation (
    id character varying(50) NOT NULL,
    start_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone NOT NULL,
    reservation_id character varying(50) NOT NULL,
    room_id character varying(50) NOT NULL
);


ALTER TABLE public.room_reservation OWNER TO hotel;

--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: hotel
--

COPY public.customer (id) FROM stdin;
\.


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: hotel
--

COPY public.employee (id, salary) FROM stdin;
\.


--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: hotel
--

COPY public.payment (id, payment_date, amount, customer_id, reservation_id) FROM stdin;
\.


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: hotel
--

COPY public.person (id, first_name, last_name, cin, passport_id, phone) FROM stdin;
\.


--
-- Data for Name: reservation; Type: TABLE DATA; Schema: public; Owner: hotel
--

COPY public.reservation (id, created_at, has_checked_in, has_checked_out, status, customer_id, employee_id) FROM stdin;
\.


--
-- Data for Name: room; Type: TABLE DATA; Schema: public; Owner: hotel
--

COPY public.room (id, price, capacity) FROM stdin;
\.


--
-- Data for Name: room_features; Type: TABLE DATA; Schema: public; Owner: hotel
--

COPY public.room_features (room_id, feature) FROM stdin;
\.


--
-- Data for Name: room_reservation; Type: TABLE DATA; Schema: public; Owner: hotel
--

COPY public.room_reservation (id, start_date, end_date, reservation_id, room_id) FROM stdin;
\.


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: hotel
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: hotel
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: hotel
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id);


--
-- Name: payment payment_reservation_id_key; Type: CONSTRAINT; Schema: public; Owner: hotel
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_reservation_id_key UNIQUE (reservation_id);


--
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: hotel
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- Name: reservation reservation_pkey; Type: CONSTRAINT; Schema: public; Owner: hotel
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_pkey PRIMARY KEY (id);


--
-- Name: room_features room_features_pkey; Type: CONSTRAINT; Schema: public; Owner: hotel
--

ALTER TABLE ONLY public.room_features
    ADD CONSTRAINT room_features_pkey PRIMARY KEY (room_id, feature);


--
-- Name: room room_pkey; Type: CONSTRAINT; Schema: public; Owner: hotel
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_pkey PRIMARY KEY (id);


--
-- Name: room_reservation room_reservation_pkey; Type: CONSTRAINT; Schema: public; Owner: hotel
--

ALTER TABLE ONLY public.room_reservation
    ADD CONSTRAINT room_reservation_pkey PRIMARY KEY (id);


--
-- Name: customer customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hotel
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_id_fkey FOREIGN KEY (id) REFERENCES public.person(id) ON DELETE CASCADE;


--
-- Name: employee employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hotel
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_id_fkey FOREIGN KEY (id) REFERENCES public.person(id) ON DELETE CASCADE;


--
-- Name: payment payment_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hotel
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(id);


--
-- Name: payment payment_reservation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hotel
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_reservation_id_fkey FOREIGN KEY (reservation_id) REFERENCES public.reservation(id);


--
-- Name: reservation reservation_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hotel
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(id);


--
-- Name: reservation reservation_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hotel
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employee(id);


--
-- Name: room_features room_features_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hotel
--

ALTER TABLE ONLY public.room_features
    ADD CONSTRAINT room_features_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.room(id) ON DELETE CASCADE;


--
-- Name: room_reservation room_reservation_reservation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hotel
--

ALTER TABLE ONLY public.room_reservation
    ADD CONSTRAINT room_reservation_reservation_id_fkey FOREIGN KEY (reservation_id) REFERENCES public.reservation(id) ON DELETE CASCADE;


--
-- Name: room_reservation room_reservation_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hotel
--

ALTER TABLE ONLY public.room_reservation
    ADD CONSTRAINT room_reservation_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.room(id);


--
-- PostgreSQL database dump complete
--

\unrestrict 0Ss6pRiz1jKCbFe9Zed60gUxlMNsCBp229JnOqAX0SrWgRTYVfBYfxPDAJ6E1rb

