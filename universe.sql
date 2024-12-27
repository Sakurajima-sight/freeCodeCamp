--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type character varying(50),
    distance_from_earth double precision,
    description text,
    number_of_stars integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    distance_from_planet double precision,
    orbit_period integer DEFAULT 30
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer,
    is_spherical boolean,
    has_life boolean,
    age_in_millions_of_years double precision,
    distance_from_star integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    star_type character varying(50),
    age_in_millions_of_years numeric(10,2)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: stellar_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.stellar_system (
    stellar_system_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer,
    number_of_planets integer,
    description text
);


ALTER TABLE public.stellar_system OWNER TO freecodecamp;

--
-- Name: stellar_system_stellar_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.stellar_system_stellar_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stellar_system_stellar_system_id_seq OWNER TO freecodecamp;

--
-- Name: stellar_system_stellar_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.stellar_system_stellar_system_id_seq OWNED BY public.stellar_system.stellar_system_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: stellar_system stellar_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stellar_system ALTER COLUMN stellar_system_id SET DEFAULT nextval('public.stellar_system_stellar_system_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0, 'Our home galaxy.', 2500);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2537000, 'Nearest major galaxy to the Milky Way.', 1000);
INSERT INTO public.galaxy VALUES (3, 'Sombrero Galaxy', 'Spiral', 29000000, 'Notable for its bright nucleus and large central bulge.', 8000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 'Spiral', 23000000, 'A classic spiral galaxy located in the constellation Canes Venatici.', 1000);
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', 'Spiral', 3000000, 'A member of the Local Group and the third-largest galaxy.', 40000);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', 163000, 'A nearby dwarf galaxy and a satellite of the Milky Way.', 3000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 384400, 30);
INSERT INTO public.moon VALUES (2, 'Phobos', 1, 9377, 30);
INSERT INTO public.moon VALUES (3, 'Deimos', 1, 23459, 30);
INSERT INTO public.moon VALUES (4, 'Proxima b Moon 1', 4, 12000, 30);
INSERT INTO public.moon VALUES (5, 'Betelgeuse Moon', 5, 5000000, 30);
INSERT INTO public.moon VALUES (6, 'Europa Moon 1', 9, 1000, 30);
INSERT INTO public.moon VALUES (7, 'Mars Moon 1', 8, 9376, 30);
INSERT INTO public.moon VALUES (8, 'Mars Moon 2', 8, 11200, 30);
INSERT INTO public.moon VALUES (9, 'Rigel A Moon 1', 6, 500000, 30);
INSERT INTO public.moon VALUES (10, 'Rigel B Moon 1', 12, 300000, 30);
INSERT INTO public.moon VALUES (11, 'Betelgeuse II Moon', 11, 450000, 30);
INSERT INTO public.moon VALUES (12, 'Proxima c Moon', 10, 15000, 30);
INSERT INTO public.moon VALUES (13, 'Venus Moon', 2, 8700, 30);
INSERT INTO public.moon VALUES (14, 'Mercury Moon', 1, 5000, 30);
INSERT INTO public.moon VALUES (15, 'Sirius B Moon', 7, 4500, 30);
INSERT INTO public.moon VALUES (16, 'Earth Moon 2', 3, 500000, 30);
INSERT INTO public.moon VALUES (17, 'Earth Moon 3', 3, 750000, 30);
INSERT INTO public.moon VALUES (18, 'Betelgeuse III Moon', 11, 350000, 30);
INSERT INTO public.moon VALUES (19, 'Proxima b Moon 2', 4, 14000, 30);
INSERT INTO public.moon VALUES (20, 'Mars Moon 3', 8, 11500, 30);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, true, false, 4500, 5790);
INSERT INTO public.planet VALUES (2, 'Venus', 1, true, false, 4500, 1082);
INSERT INTO public.planet VALUES (3, 'Earth', 1, true, true, 4500, 1496);
INSERT INTO public.planet VALUES (4, 'Proxima b', 2, true, false, 5000, 7500);
INSERT INTO public.planet VALUES (5, 'Betelgeuse I', 3, true, false, 7000, 5000);
INSERT INTO public.planet VALUES (6, 'Rigel A', 4, true, false, 8000, 1200);
INSERT INTO public.planet VALUES (7, 'Sirius B', 5, true, false, 250, 2000);
INSERT INTO public.planet VALUES (8, 'Mars', 1, true, false, 4500, 2279);
INSERT INTO public.planet VALUES (9, 'Europa', 1, true, false, 4500, 670);
INSERT INTO public.planet VALUES (10, 'Proxima c', 2, true, false, 5000, 12500);
INSERT INTO public.planet VALUES (11, 'Betelgeuse II', 3, true, false, 7000, 7000);
INSERT INTO public.planet VALUES (12, 'Rigel B', 4, true, false, 8000, 1500);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type main-sequence', 4600.00);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 2, 'Red dwarf', 4900.00);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'Red supergiant', 8000.00);
INSERT INTO public.star VALUES (4, 'Rigel', 1, 'Blue supergiant', 8500.00);
INSERT INTO public.star VALUES (5, 'Sirius', 1, 'Main-sequence star', 300.00);
INSERT INTO public.star VALUES (6, 'Vega', 1, 'Main-sequence star', 455.00);


--
-- Data for Name: stellar_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.stellar_system VALUES (1, 'Solar System', 1, 8, 'The solar system consists of the Sun and its eight planets.');
INSERT INTO public.stellar_system VALUES (2, 'Proxima Centauri System', 2, 1, 'A nearby stellar system with a known exoplanet, Proxima b.');
INSERT INTO public.stellar_system VALUES (3, 'Betelgeuse System', 3, 0, 'A red supergiant star with no confirmed planets.');
INSERT INTO public.stellar_system VALUES (4, 'Rigel System', 4, 0, 'A blue supergiant star system in Orion.');
INSERT INTO public.stellar_system VALUES (5, 'Sirius System', 5, 1, 'The system around Sirius, the brightest star in the night sky.');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: stellar_system_stellar_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stellar_system_stellar_system_id_seq', 1, false);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: stellar_system stellar_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stellar_system
    ADD CONSTRAINT stellar_system_pkey PRIMARY KEY (stellar_system_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name, planet_id);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name, star_id);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: stellar_system unique_stellar_system_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stellar_system
    ADD CONSTRAINT unique_stellar_system_name UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: stellar_system stellar_system_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stellar_system
    ADD CONSTRAINT stellar_system_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

