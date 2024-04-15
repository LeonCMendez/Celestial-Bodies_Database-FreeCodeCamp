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
    description text,
    has_life boolean NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    distance_from_earth numeric
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
    description text,
    has_life boolean NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    planet_id integer
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
-- Name: moon_phases; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_phases (
    moon_phases_id integer NOT NULL,
    name character varying(50) NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    moon_id integer,
    phase_number integer
);


ALTER TABLE public.moon_phases OWNER TO freecodecamp;

--
-- Name: moon_phases_moon_phases_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_phases_moon_phases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_phases_moon_phases_id_seq OWNER TO freecodecamp;

--
-- Name: moon_phases_moon_phases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_phases_moon_phases_id_seq OWNED BY public.moon_phases.moon_phases_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    age_in_millions_of_years integer,
    planet_type character varying(50) NOT NULL,
    star_id integer
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
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    galaxy_id integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: moon_phases moon_phases_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_phases ALTER COLUMN moon_phases_id SET DEFAULT nextval('public.moon_phases_moon_phases_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', true, 'Spiral', 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Closest galaxy to the Milky Way', false, 'Spiral', 2.537);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 'Located in the Virgo Cluster', false, 'Elliptical', 55);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 'Third-largest galaxy in the Local Group', false, 'Spiral', 2.723);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Nicknamed for its resemblance to a wide-brimmed hat', false, 'Spiral', 28.1);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Interacting galaxy with NGC 5195', false, 'Spiral', 23.5);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth''s only natural satellite', false, 4500, 384400, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Largest moon of Mars', false, 4500, 9378, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Smaller moon of Mars', false, 4500, 23460, 2);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'Largest moon in the Solar System', false, 4500, 1070400, 3);
INSERT INTO public.moon VALUES (5, 'Titan', 'Largest moon of Saturn', false, 4500, 1221870, 4);
INSERT INTO public.moon VALUES (6, 'Triton', 'Largest moon of Neptune', false, 4500, 354759, 5);
INSERT INTO public.moon VALUES (7, 'Europa', 'Moon of Jupiter', false, 4500, 670900, 3);
INSERT INTO public.moon VALUES (8, 'Callisto', 'Moon of Jupiter', false, 4500, 1882700, 3);
INSERT INTO public.moon VALUES (9, 'Io', 'Moon of Jupiter', false, 4500, 421800, 3);
INSERT INTO public.moon VALUES (10, 'Enceladus', 'Moon of Saturn', false, 4500, 238040, 4);
INSERT INTO public.moon VALUES (11, 'Rhea', 'Moon of Saturn', false, 4500, 527040, 4);
INSERT INTO public.moon VALUES (12, 'Mimas', 'Moon of Saturn', false, 4500, 185520, 4);
INSERT INTO public.moon VALUES (13, 'Titania', 'Moon of Uranus', false, 4500, 435910, 6);
INSERT INTO public.moon VALUES (14, 'Oberon', 'Moon of Uranus', false, 4500, 582600, 6);
INSERT INTO public.moon VALUES (15, 'Ariel', 'Moon of Uranus', false, 4500, 191020, 6);
INSERT INTO public.moon VALUES (16, 'Umbriel', 'Moon of Uranus', false, 4500, 266000, 6);
INSERT INTO public.moon VALUES (17, 'Miranda', 'Moon of Uranus', false, 4500, 129390, 6);
INSERT INTO public.moon VALUES (18, 'Charon', 'Moon of Pluto', false, 4500, 19591, 7);
INSERT INTO public.moon VALUES (19, 'Nix', 'Moon of Pluto', false, 4500, 48671, 7);
INSERT INTO public.moon VALUES (20, 'Hydra', 'Moon of Pluto', false, 4500, 64578, 7);


--
-- Data for Name: moon_phases; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_phases VALUES (1, 'New Moon', '2024-01-01', '2024-01-07', 1, 1);
INSERT INTO public.moon_phases VALUES (2, 'First Quarter', '2024-01-08', '2024-01-14', 1, 2);
INSERT INTO public.moon_phases VALUES (3, 'Full Moon', '2024-01-15', '2024-01-21', 1, 3);
INSERT INTO public.moon_phases VALUES (4, 'Last Quarter', '2024-01-22', '2024-01-29', 1, 4);
INSERT INTO public.moon_phases VALUES (5, 'New Moon', '2024-02-01', '2024-02-07', 1, 5);
INSERT INTO public.moon_phases VALUES (6, 'First Quarter', '2024-02-08', '2024-02-14', 1, 6);
INSERT INTO public.moon_phases VALUES (7, 'Full Moon', '2024-02-15', '2024-02-21', 1, 7);
INSERT INTO public.moon_phases VALUES (8, 'Last Quarter', '2024-02-22', '2024-02-29', 1, 8);
INSERT INTO public.moon_phases VALUES (9, 'New Moon', '2024-01-01', '2024-01-07', 2, 1);
INSERT INTO public.moon_phases VALUES (10, 'First Quarter', '2024-01-08', '2024-01-14', 2, 2);
INSERT INTO public.moon_phases VALUES (11, 'Full Moon', '2024-01-15', '2024-01-21', 2, 3);
INSERT INTO public.moon_phases VALUES (12, 'Last Quarter', '2024-01-22', '2024-01-29', 2, 4);
INSERT INTO public.moon_phases VALUES (13, 'New Moon', '2024-02-01', '2024-02-07', 2, 5);
INSERT INTO public.moon_phases VALUES (14, 'First Quarter', '2024-02-08', '2024-02-14', 2, 6);
INSERT INTO public.moon_phases VALUES (15, 'Full Moon', '2024-02-15', '2024-02-21', 2, 7);
INSERT INTO public.moon_phases VALUES (16, 'Last Quarter', '2024-02-22', '2024-02-29', 2, 8);
INSERT INTO public.moon_phases VALUES (17, 'New Moon', '2024-01-01', '2024-01-07', 4, 1);
INSERT INTO public.moon_phases VALUES (18, 'First Quarter', '2024-01-08', '2024-01-14', 4, 2);
INSERT INTO public.moon_phases VALUES (19, 'Full Moon', '2024-01-15', '2024-01-21', 4, 3);
INSERT INTO public.moon_phases VALUES (20, 'Last Quarter', '2024-01-22', '2024-01-29', 4, 4);
INSERT INTO public.moon_phases VALUES (21, 'New Moon', '2024-02-01', '2024-02-07', 4, 5);
INSERT INTO public.moon_phases VALUES (22, 'First Quarter', '2024-02-08', '2024-02-14', 4, 6);
INSERT INTO public.moon_phases VALUES (23, 'Full Moon', '2024-02-15', '2024-02-21', 4, 7);
INSERT INTO public.moon_phases VALUES (24, 'Last Quarter', '2024-02-22', '2024-02-29', 4, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Home to various forms of life', true, 4500, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Known as the Red Planet', false, 4500, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Largest planet in the Solar System', false, 4500, 'Gas giant', 1);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Famous for its rings', false, 4500, 'Gas giant', 1);
INSERT INTO public.planet VALUES (5, 'Neptune', 'Farthest planet from the Sun', false, 4500, 'Ice giant', 1);
INSERT INTO public.planet VALUES (6, 'Uranus', 'Tilted on its side', false, 4500, 'Ice giant', 1);
INSERT INTO public.planet VALUES (7, 'Mercury', 'Closest planet to the Sun', false, 4500, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (8, 'Venus', 'Known for its thick atmosphere', false, 4500, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (9, 'Kepler-186f', 'First Earth-size planet discovered in the habitable zone of another star', true, 10000, 'Terrestrial', 3);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 'Exoplanet orbiting Proxima Centauri', true, 5000, 'Terrestrial', 3);
INSERT INTO public.planet VALUES (11, 'Gliese 581g', 'Habitable exoplanet', true, 10000, 'Terrestrial', 3);
INSERT INTO public.planet VALUES (12, 'HD 40307g', 'Super-Earth exoplanet', false, 8000, 'Terrestrial', 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Our solar system star', false, true, 4600, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'Brightest star in the night sky', false, true, 250, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 'Closest star system to the Sun', false, true, 6000, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Red supergiant in the constellation Orion', false, false, 8, 1);
INSERT INTO public.star VALUES (5, 'Vega', 'Bright star in the northern constellation of Lyra', false, true, 455, 1);
INSERT INTO public.star VALUES (6, 'Arcturus', 'Brightest star in the constellation of Bootes', false, true, 7, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: moon_phases_moon_phases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_phases_moon_phases_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon_phases moon_phases_moon_id_phase_number_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_phases
    ADD CONSTRAINT moon_phases_moon_id_phase_number_key UNIQUE (moon_id, phase_number);


--
-- Name: moon_phases moon_phases_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_phases
    ADD CONSTRAINT moon_phases_pkey PRIMARY KEY (moon_phases_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon_phases moon_phases_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_phases
    ADD CONSTRAINT moon_phases_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


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
-- PostgreSQL database dump complete
--

