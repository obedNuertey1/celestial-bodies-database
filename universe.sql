--
-- PostgreSQL database dump
--

-- Dumped from database version 12.14 (Ubuntu 12.14-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.14 (Ubuntu 12.14-0ubuntu0.20.04.1)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    number_of_stars integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constelation_constelation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constelation_constelation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constelation_constelation_id_seq OWNER TO freecodecamp;

--
-- Name: constelation_constelation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constelation_constelation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years numeric(6,1),
    galaxy_types character varying(40),
    distance_from_earth_in_ly integer,
    diameter_in_km integer
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
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years numeric(4,1),
    moon_type character varying(40),
    distance_from_earth_in_ly numeric(10,1),
    planet_id integer NOT NULL
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
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years numeric(4,1),
    planet_type character varying(40),
    distance_from_earth_in_ly numeric(10,1),
    star_id integer NOT NULL
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
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years numeric(4,1),
    star_type character varying(40),
    distance_from_earth_in_ly numeric(7,1),
    galaxy_id integer NOT NULL,
    constellation_id integer NOT NULL
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constelation_constelation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'No_constellation', NULL);
INSERT INTO public.constellation VALUES (2, 'Andromeda', 67);
INSERT INTO public.constellation VALUES (3, 'Cassiopeia', 43);
INSERT INTO public.constellation VALUES (4, 'Draco', 105);
INSERT INTO public.constellation VALUES (5, 'Lyra', 28);
INSERT INTO public.constellation VALUES (6, 'Orion', 78);
INSERT INTO public.constellation VALUES (7, 'Pegasus', 61);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'A spiral galaxy approximately 2.5 million light years away from Earth.', false, true, 400.5, 'Spiral', 25300, 2200);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'A barred spiral galaxy that is home to our solar system.', true, true, 460.2, 'Barred Spiral', 0, 1000000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A small spiral galaxy that is a neighbor of the Andromeda Galaxy.', false, true, 3500.7, 'Spiral', 2900000, 50000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'A spiral galaxy that is part of the M51 Group, located approximately 31 million light years away from Earth.', false, true, 2200.4, 'Spiral', 31000000, 70000);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', 'A face-on spiral galaxy approximately 21 million light years away from Earth.', false, true, 2950.0, 'Spiral', 21000000, 95000);
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 'A spiral galaxy located approcimately 24 million light years away from Earth.', false, true, 2100.1, 'Spiral', 24000000, 80000);
INSERT INTO public.galaxy VALUES (7, 'Bode''s', 'A spiral galaxy located approximately 12 million light years away from Earth.', false, true, 1880.6, 'Spiral', 12000000, 600000);
INSERT INTO public.galaxy VALUES (8, 'Cigar', 'An irregular galaxy located approximately 12 million light years away from Earth.', false, false, 1975.9, 'Irregular', 12000000, 25000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (8, 'Moon1', 'First moon of the first planet', false, true, 4.5, 'Terrestrial', 238855.0, 10);
INSERT INTO public.moon VALUES (9, 'Moon2', 'Second moon of the first planet', false, true, 4.5, 'Terrestrial', 238855.0, 17);
INSERT INTO public.moon VALUES (10, 'Moon3', 'Third moon of the first planet', false, true, 4.5, 'Terrestrial', 238855.0, 10);
INSERT INTO public.moon VALUES (11, 'Moon4', 'First moon of the second planet', false, true, 6.0, 'Jovian', 3000000.0, 12);
INSERT INTO public.moon VALUES (12, 'Moon5', 'Second moon of the second planet', false, true, 6.0, 'Jovian', 3000000.0, 18);
INSERT INTO public.moon VALUES (13, 'Moon6', 'Third moon of the second planet', false, true, 6.0, 'Jovian', 3000000.0, 12);
INSERT INTO public.moon VALUES (14, 'Moon7', 'First moon of the third planet', false, true, 5.5, 'Terrestrial', 149600000.0, 13);
INSERT INTO public.moon VALUES (15, 'Moon8', 'Second moon of the third planet', false, true, 5.5, 'Terrestiral', 149600000.0, 19);
INSERT INTO public.moon VALUES (16, 'Moon9', 'Third moon of the third planet', false, true, 5.5, 'Terrestrial', 149600000.0, 13);
INSERT INTO public.moon VALUES (17, 'Moon10', 'First moon of the fourth planet', false, true, 4.8, 'Terrestrial', 227940000.0, 14);
INSERT INTO public.moon VALUES (18, 'Moon11', 'Second moon of the fourth planet', false, true, 4.8, 'Terrestrial', 227940000.0, 20);
INSERT INTO public.moon VALUES (19, 'Moon12', 'Third moon of the fourth planet', false, true, 4.8, 'Terrestiral', 227940000.0, 14);
INSERT INTO public.moon VALUES (20, 'Moon13', 'First moon of the fifth planet', false, true, 6.8, 'Jovian', 778330000.0, 15);
INSERT INTO public.moon VALUES (21, 'Moon14', 'Second moon of the fifth planet', false, true, 6.8, 'Jovian', 778330000.0, 21);
INSERT INTO public.moon VALUES (22, 'Moon15', 'Third moon of the fifth planet', false, true, 6.8, 'Jovian', 778330000.0, 15);
INSERT INTO public.moon VALUES (23, 'Moon16', 'First moon of the sixth planet', false, true, 4.0, 'Terrestrial', 142700000.0, 16);
INSERT INTO public.moon VALUES (24, 'Moon17', 'Second moon of the sixth planet', false, true, 4.0, 'Terrestrial', 142700000.0, 16);
INSERT INTO public.moon VALUES (25, 'Moon18', 'Third moon of the sixth planet', false, true, 4.0, 'Terrestrial', 142700000.0, 22);
INSERT INTO public.moon VALUES (26, 'Puck', 'A small, irregularly shaped moon Uranus', false, true, 4.0, NULL, 387000.0, 23);
INSERT INTO public.moon VALUES (27, 'Titania', 'A large, icy moon of Uranus with heavily cratered surface', false, true, 3.6, NULL, 435910.0, 15);
INSERT INTO public.moon VALUES (28, 'Ariel', 'A moon of Uranus with a complex surface that includes valleys, craters, and plains', false, true, 4.5, NULL, 191240.0, 15);
INSERT INTO public.moon VALUES (29, 'Oberon', 'The outermost of the large moons of Uranus, with a heavily cratered surface', false, true, 4.0, NULL, 584270.0, 24);
INSERT INTO public.moon VALUES (30, 'Rhea', 'The second-largest moon of Saturn, with a heavily cratered surface and a prominent equatorial ridge', false, true, 4.5, NULL, 527108.0, 20);
INSERT INTO public.moon VALUES (31, 'Tethys', 'A small, heavily cratered moon of Saturn with a prominent impact crater called Odysseus', false, true, 4.5, NULL, 294619.0, 15);
INSERT INTO public.moon VALUES (32, 'Iapetus', 'A moon of Saturn with a dark, heavily cratered leading hemisphere and a bright, icy trailing hemisphere', false, true, 3.6, NULL, 356082.0, 24);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (10, 'Mercury', 'The smallest planet in the Solar System.', false, true, 4.5, 'Terrestrial', 77.0, 1);
INSERT INTO public.planet VALUES (11, 'Venus', 'The second planet from the Syn and the hottest planet in the Solar System.', false, true, 4.5, 'Terrestrial', 261.0, 2);
INSERT INTO public.planet VALUES (12, 'Earth', 'The third planet from the Sun and the only astronomical object know to harbor life.', true, true, 4.5, 'Terrestrial', 149.6, 3);
INSERT INTO public.planet VALUES (13, 'Mars', 'The fourth planet from the Sun and the second smallest planet in the Solar System.', false, true, 4.6, 'Terrestrial', 78.3, 4);
INSERT INTO public.planet VALUES (14, 'Jupiter', 'The largest planet in the Solar System, and the fifth from the Sun.', false, false, 4.6, 'Gas giant', 628.7, 5);
INSERT INTO public.planet VALUES (15, 'Saturn', 'The second-largest planet in the Solar System, after Jupiter.', false, false, 4.6, 'Gas giant', 1270.4, 6);
INSERT INTO public.planet VALUES (16, 'Uranus', 'The seventh planet from the Sun.', false, false, 4.6, 'Ice giant', 2723.1, 7);
INSERT INTO public.planet VALUES (17, 'Neptune', 'The eight and farthest known planet from the Sun in the Solar System.', false, false, 4.5, 'Ice giant', 4351.0, 8);
INSERT INTO public.planet VALUES (18, 'Ceres', 'The largest object in the asteroid belt between Mars and Jupiter.', false, true, 4.6, 'Dwarf planet', 414.2, 1);
INSERT INTO public.planet VALUES (19, 'Pluto', 'A dwarf planet in the Kuiper belt, a ring of bodies beyond Neptune.', false, true, 4.6, 'Dwarf planet', 5906.4, 2);
INSERT INTO public.planet VALUES (20, 'Haumea', 'A dwarf located beyond Neptune.', false, true, 4.5, 'Dwarf planet', 43.1, 3);
INSERT INTO public.planet VALUES (21, 'Makemake', 'A dwarf planet and one of the largest objects in the Kuiper belt.', false, true, 4.4, 'Dwarf planet', 52.8, 4);
INSERT INTO public.planet VALUES (22, 'Eris', 'The most massive and second-largest dwarf planet in the known Solar System.', false, true, 4.5, 'Dwarf planet', 96.4, 5);
INSERT INTO public.planet VALUES (23, 'Kepler-10b', 'The first confirmed rocky exoplanet discovered.', false, true, 4.6, 'Terrestrial', 173.0, 6);
INSERT INTO public.planet VALUES (24, 'HD 189733 b', 'A gas giant exoplanet that orbits very close to its star.', false, false, 4.6, 'Gas giant', 63.0, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Betelgeuse', 'Red supergiant in Orion', false, true, 10.1, 'M-type', 643.0, 2, 2);
INSERT INTO public.star VALUES (2, 'Rigel', 'Blue supergiant in Orion', false, true, 9.9, 'B-type', 860.0, 1, 7);
INSERT INTO public.star VALUES (3, 'Sirius', 'Brightest star in the night sky', true, false, 0.3, 'A-type', 8.6, 3, 6);
INSERT INTO public.star VALUES (4, 'Vega', 'Bright star in the Lyra constellation', false, true, 0.5, 'A-type', 25.0, 5, 4);
INSERT INTO public.star VALUES (5, 'Aldebaran', 'Red giant in the Taurus constellation', false, true, 0.5, 'A-type', 65.0, 6, 7);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 'Nearest star to the Sun', false, true, 4.8, 'M-type', 4.2, 8, 3);
INSERT INTO public.star VALUES (7, 'Antares', 'Red supergiant in Scorpius', false, true, 12.4, 'M-type', 550.0, 7, 5);
INSERT INTO public.star VALUES (8, 'Tau Ceti', 'Nearby star with potentially habitable planets', true, true, 7.2, 'G-type', 11.9, 4, 1);


--
-- Name: constelation_constelation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constelation_constelation_id_seq', 7, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 32, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: constellation constelation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constelation_pkey PRIMARY KEY (constellation_id);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


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
-- Name: star star_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_key UNIQUE (galaxy_id);


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
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

