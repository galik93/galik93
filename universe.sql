--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    comet_size integer NOT NULL,
    comet_discoverer text,
    seen_in_xxi boolean,
    name character varying(20)
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30),
    galaxy_id integer NOT NULL,
    galaxy_type character varying(30),
    dist_to_milkyway integer,
    galaxy_size numeric(10,0),
    no_planets integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(30),
    moon_id integer NOT NULL,
    planet_id integer,
    diameter_moon integer,
    dist_to_earth integer NOT NULL,
    weight_moon integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(30),
    planet_id integer NOT NULL,
    planet_discoverer text,
    planet_class character(1),
    planet_age integer NOT NULL,
    star_id integer,
    in_milkyway boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(30),
    star_id integer NOT NULL,
    galaxy_id integer,
    star_diameter integer NOT NULL,
    star_class character varying(2),
    star_temp integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 312, 'Haley', false, 'Haley');
INSERT INTO public.comet VALUES (2, 431, 'Brownie', true, 'Brownie');
INSERT INTO public.comet VALUES (3, 818, 'Whitey', false, 'Whitey');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1, 'Sb', 0, 185, 400);
INSERT INTO public.galaxy VALUES ('Andromeda', 2, 'SA', 3, 152, 1000);
INSERT INTO public.galaxy VALUES ('Large Magellanic Cloud', 3, 'SB', 1, 32200, 400);
INSERT INTO public.galaxy VALUES ('Small Magellanic Cloud', 4, 'SB', 2, 6, 100);
INSERT INTO public.galaxy VALUES ('Messier 81', 5, 'SA', 12, 27, 200);
INSERT INTO public.galaxy VALUES ('Triangulum Galaxy', 6, 'SA', 5, 1532, 1440);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon 1', 1, 1, 314, 431, 431);
INSERT INTO public.moon VALUES ('Moon 2', 2, 1, 431, 413, 431);
INSERT INTO public.moon VALUES ('Moon 3', 3, 2, 314, 431, 431);
INSERT INTO public.moon VALUES ('Moon 4', 4, 2, 314, 431, 535);
INSERT INTO public.moon VALUES ('Moon 5', 5, 3, 414, 543, 195);
INSERT INTO public.moon VALUES ('Mooon 6', 6, 4, 884, 843, 143);
INSERT INTO public.moon VALUES ('Moon 7', 7, 4, 841, 953, 431);
INSERT INTO public.moon VALUES ('Moon 8', 8, 5, 841, 832, 431);
INSERT INTO public.moon VALUES ('Moon 9', 9, 5, 431, 949, 841);
INSERT INTO public.moon VALUES ('Moon 10', 10, 6, 884, 912, 431);
INSERT INTO public.moon VALUES ('Moon 11', 11, 6, 943, 182, 432);
INSERT INTO public.moon VALUES ('Moon 12', 12, 7, 914, 884, 812);
INSERT INTO public.moon VALUES ('Moon  13', 13, 7, 843, 819, 943);
INSERT INTO public.moon VALUES ('Moon 14', 14, 8, 813, 843, 483);
INSERT INTO public.moon VALUES ('Moon 15', 15, 8, 943, 843, 194);
INSERT INTO public.moon VALUES ('Moon 16', 16, 9, 843, 818, 848);
INSERT INTO public.moon VALUES ('Moon 17', 17, 9, 848, 994, 123);
INSERT INTO public.moon VALUES ('Moon 18', 18, 10, 849, 994, 818);
INSERT INTO public.moon VALUES ('Moon 19', 19, 11, 813, 123, 312);
INSERT INTO public.moon VALUES ('Moon 20', 20, 12, 999, 293, 199);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', 1, 'Homo Sapiens', 'A', 300000, 1, true);
INSERT INTO public.planet VALUES ('Mars', 2, 'Homo Sapiens', 'A', 400000, 1, true);
INSERT INTO public.planet VALUES ('planet around andromeda star', 3, 'Homo Niewiadomo', 'B', 650000, 2, false);
INSERT INTO public.planet VALUES ('planet l magellan star', 4, 'Homo Niewiadomo', 'C', 43134, 2, false);
INSERT INTO public.planet VALUES ('planet around andromeda star 2', 5, 'Homo Niewiadomo', 'B', 443094, 3, false);
INSERT INTO public.planet VALUES ('planet l magellan star 2', 6, 'Homo Wiadomo', 'C', 43998094, 3, false);
INSERT INTO public.planet VALUES ('planet s magellan star ', 7, 'Homo Erectus', 'D', 8094, 4, false);
INSERT INTO public.planet VALUES ('planet s magellan star 2 ', 8, 'Homo Erectus', 'D', 895094, 4, false);
INSERT INTO public.planet VALUES ('planet messier 81 star', 9, 'Homo Wiadomo', 'E', 831494, 5, false);
INSERT INTO public.planet VALUES ('planet messier 81 star 2', 10, 'Homo WiadomoChyba', 'E', 39431494, 6, false);
INSERT INTO public.planet VALUES ('planet triangle 1', 11, 'Homo homo', 'F', 39493314, 5, false);
INSERT INTO public.planet VALUES ('planet triangle 2', 12, 'Homo homo', 'F', 39494314, 6, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('sun', 1, 1, 2, 'G', 2);
INSERT INTO public.star VALUES ('andromeda star', 2, 2, 3, 'B', 1);
INSERT INTO public.star VALUES ('large magellan star', 3, 3, 2, 'G', 3);
INSERT INTO public.star VALUES ('small magellan star', 4, 4, 1, 'G', 5);
INSERT INTO public.star VALUES ('messier 81 star', 5, 5, 2, 'K', 2);
INSERT INTO public.star VALUES ('triangulum star', 6, 6, 3, 'P', 5);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 1, false);


--
-- Name: comet comet_comet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_comet_id_key UNIQUE (comet_id);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy myprimarykey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT myprimarykey PRIMARY KEY (galaxy_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

