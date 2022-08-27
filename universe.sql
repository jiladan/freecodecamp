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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(60) NOT NULL,
    emission_spectra character varying(30) NOT NULL,
    description text,
    has_water boolean,
    size_in_km integer,
    orbital_radius_au integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    galaxy_type text NOT NULL,
    galaxy_star_count character varying(30)
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
    name character varying(60) NOT NULL,
    planet_id integer,
    description text,
    year_discovered numeric NOT NULL
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
    name character varying(60) NOT NULL,
    star_id integer,
    description text,
    has_life boolean,
    planet_type text NOT NULL,
    num_moons numeric
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
    name character varying(60) NOT NULL,
    galaxy_id integer,
    description text,
    age_in_millions_of_years numeric,
    star_type text NOT NULL
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'C-type', 'First asteroid discovered, 1 Jan 1801', true, 940, 3);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 'V-type', 'Discovered 1807 and possibly the second-largest asteroid in the belt', true, 525, 2);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 'B-type', 'Second asteroid discovered, in 1802', true, 515, 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Our closest neighbor!', 'Barred Spiral', 'about 1 trillion');
INSERT INTO public.galaxy VALUES (2, 'Backward', 'AKA NGC 4622', 'Unbarred Spiral', 'unknown');
INSERT INTO public.galaxy VALUES (3, 'Black Eye', 'The eye is actually absorbing dust!', 'Spiral', 'unknown');
INSERT INTO public.galaxy VALUES (4, 'Cartwheel', 'Also ESO 350-40 or PGC 2248', 'Lenticular Ring', 'unknown');
INSERT INTO public.galaxy VALUES (5, 'Cigar', 'Also Messier 82 or NCG 3034 or M82', 'Starburst', 'unknown');
INSERT INTO public.galaxy VALUES (6, 'Eye of Sauron', 'Also NCG 4151', 'Spiral Seyfert', 'unknown');
INSERT INTO public.galaxy VALUES (7, 'Milky Way', 'This is home!', 'Barred Spiral', '100-400 billion');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Titan', 6, 'Largest of Saturn', 1655);
INSERT INTO public.moon VALUES (2, 'Moon', 3, 'Our closest friend!', 0);
INSERT INTO public.moon VALUES (3, 'Io', 5, 'Innermost of the four Galilean moons', 1610);
INSERT INTO public.moon VALUES (4, 'Callisto', 5, 'Second-largest moon of Jupiter', 1610);
INSERT INTO public.moon VALUES (5, 'Amalthea', 5, 'Third nearest to Jupiter', 1892);
INSERT INTO public.moon VALUES (6, 'Europa', 5, 'Smallest of the Galileans', 1610);
INSERT INTO public.moon VALUES (7, 'Elara', 5, 'Prograde irregular', 1905);
INSERT INTO public.moon VALUES (8, 'Ganymede', 5, 'Largest in the whole solar system', 1610);
INSERT INTO public.moon VALUES (9, 'Adrastea', 5, 'Smallest of the inner moons of Jupiter', 1979);
INSERT INTO public.moon VALUES (10, 'Minas', 6, 'large crater named Herschel', 1789);
INSERT INTO public.moon VALUES (11, 'Tethys', 6, 'mid-sized', 1684);
INSERT INTO public.moon VALUES (12, 'Dione', 6, '15th largest in the solar system', 1684);
INSERT INTO public.moon VALUES (13, 'Phobos', 4, 'innermost and larger', 1877);
INSERT INTO public.moon VALUES (14, 'Deimos', 4, 'Outermost and smaller', 1877);
INSERT INTO public.moon VALUES (15, 'Titania', 7, 'largest moon of Uranus', 1878);
INSERT INTO public.moon VALUES (17, 'Oberon', 7, 'Outermost moon of Uranus', 1787);
INSERT INTO public.moon VALUES (18, 'Triton', 8, 'Largest moon of Neptune - fitting!', 1846);
INSERT INTO public.moon VALUES (19, 'Thalassa', 8, 'second-innermost', 1989);
INSERT INTO public.moon VALUES (20, 'Galatea', 8, 'fourth-innermost', 1989);
INSERT INTO public.moon VALUES (21, 'Ariel', 7, 'fourth-largest of Uranus', 1851);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 7, 'First and smallest', false, 'Terrestrial', 0);
INSERT INTO public.planet VALUES (2, 'Venus', 7, 'Second and third-smallest', false, 'Terrestrial', 0);
INSERT INTO public.planet VALUES (3, 'Earth', 7, 'This is home!', true, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 7, 'Fourth and second-smallest', false, 'Terrestrial', 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 7, 'Fifth and largest', false, 'Gas Giant', 80);
INSERT INTO public.planet VALUES (6, 'Saturn', 7, 'Sixth and second-largest', false, 'Gas Giant', 83);
INSERT INTO public.planet VALUES (7, 'Uranus', 7, 'Seventh', false, 'Ice Giant', 27);
INSERT INTO public.planet VALUES (8, 'Neptune', 7, 'Eighth', false, 'Ice Giant', 14);
INSERT INTO public.planet VALUES (9, 'Proxima b', 1, 'Earth-sized!', false, 'Exoplanet', 0);
INSERT INTO public.planet VALUES (10, 'Proxima c', 1, 'Super-Earth', false, 'Exoplanet', 0);
INSERT INTO public.planet VALUES (11, 'Proxima d', 1, 'Sub-Earth', false, 'Exoplanet', 0);
INSERT INTO public.planet VALUES (12, '55 Cancri b', 4, 'Like a warm Jupiter', false, 'Exoplanet', 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha Centauri C', 7, 'Discovered 1915', 4850, 'Red Dwarf');
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 7, 'Rigil Kentaurus', 5300, 'Binary');
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', 7, 'Toliman', 5300, 'Binary');
INSERT INTO public.star VALUES (4, 'Alpha Cancri', 7, 'Acubens', 0, 'Am star');
INSERT INTO public.star VALUES (5, 'Epsilon Canis Majoris', 7, '22nd-brightest star in the sky', 22500, 'Binary');
INSERT INTO public.star VALUES (6, 'Aldebaran', 7, 'Brightest star in Taurus', 6400, 'Giant');
INSERT INTO public.star VALUES (7, 'Sun', 7, 'This is our star!', 4603, 'Yellow Dwarf');


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: asteroid constraint_ast_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT constraint_ast_name UNIQUE (name);


--
-- Name: galaxy constraint_gal_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT constraint_gal_name UNIQUE (name);


--
-- Name: moon constraint_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT constraint_moon_name UNIQUE (name);


--
-- Name: planet constraint_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT constraint_name UNIQUE (name);


--
-- Name: star constraint_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT constraint_star_name UNIQUE (name);


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
-- Name: moon moon_fk_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_fk_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_fk_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_fk_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_fk_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_fk_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

