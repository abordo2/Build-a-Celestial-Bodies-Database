--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(60) NOT NULL,
    galaxy_type character varying(40) NOT NULL,
    distance_from_earth numeric NOT NULL,
    known_star_count bigint NOT NULL,
    has_life boolean NOT NULL,
    description text NOT NULL
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
    planet_id integer NOT NULL,
    diameter_km integer NOT NULL,
    orbital_period_days numeric NOT NULL,
    is_spherical boolean NOT NULL,
    description text NOT NULL
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
    star_id integer NOT NULL,
    planet_type_id integer NOT NULL,
    orbital_period_days integer NOT NULL,
    radius_km numeric NOT NULL,
    has_life boolean NOT NULL,
    description text NOT NULL
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text NOT NULL,
    is_gas_giant boolean NOT NULL
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_class character varying(10) NOT NULL,
    mass_solar numeric NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    is_spherical boolean NOT NULL
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred spiral', 0, 100000000000, true, 'The galaxy that contains our Solar System.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2537000, 1000000000000, false, 'The nearest large galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 2730000, 40000000, false, 'A member of the Local Group.');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Dwarf irregular', 163000, 30000000, false, 'A satellite galaxy of the Milky Way.');
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Dwarf irregular', 200000, 3000000, false, 'A nearby dwarf galaxy.');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 'Spiral', 23000000, 100000000000, false, 'A grand-design spiral galaxy in Canes Venatici.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474, 27.32, true, 'Earth''s natural satellite.');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, 0.32, false, 'The larger and innermost moon of Mars.');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, 1.26, false, 'The smaller outer moon of Mars.');
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, 1.77, true, 'A volcanically active moon of Jupiter.');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3122, 3.55, true, 'An icy moon with a likely subsurface ocean.');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, 7.15, true, 'The largest moon in the Solar System.');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, 16.69, true, 'A heavily cratered moon of Jupiter.');
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 167, 0.50, false, 'A small inner moon of Jupiter.');
INSERT INTO public.moon VALUES (9, 'Himalia', 5, 170, 250.56, false, 'The largest irregular prograde moon of Jupiter.');
INSERT INTO public.moon VALUES (10, 'Metis', 5, 43, 0.29, false, 'A small moon orbiting close to Jupiter.');
INSERT INTO public.moon VALUES (11, 'Adrastea', 5, 16, 0.30, false, 'A small moon within Jupiter''s ring system.');
INSERT INTO public.moon VALUES (12, 'Mimas', 6, 396, 0.94, true, 'A small icy moon of Saturn.');
INSERT INTO public.moon VALUES (13, 'Enceladus', 6, 504, 1.37, true, 'An icy moon with water-rich plumes.');
INSERT INTO public.moon VALUES (14, 'Tethys', 6, 1062, 1.89, true, 'An icy mid-sized moon of Saturn.');
INSERT INTO public.moon VALUES (15, 'Dione', 6, 1123, 2.74, true, 'An icy moon with bright wispy terrain.');
INSERT INTO public.moon VALUES (16, 'Rhea', 6, 1528, 4.52, true, 'The second-largest moon of Saturn.');
INSERT INTO public.moon VALUES (17, 'Titan', 6, 5150, 15.95, true, 'A moon with lakes of liquid methane.');
INSERT INTO public.moon VALUES (18, 'Iapetus', 6, 1469, 79.32, true, 'A moon with contrasting bright and dark hemispheres.');
INSERT INTO public.moon VALUES (19, 'Miranda', 7, 472, 1.41, true, 'A small moon of Uranus.');
INSERT INTO public.moon VALUES (20, 'Ariel', 7, 1158, 2.52, true, 'A bright icy moon of Uranus.');
INSERT INTO public.moon VALUES (21, 'Umbriel', 7, 1169, 4.14, true, 'A dark icy moon of Uranus.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 1, 88, 2439.7, false, 'The smallest planet and closest to the Sun.');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 1, 225, 6051.8, false, 'A rocky world with a dense carbon dioxide atmosphere.');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1, 365, 6371.0, true, 'The only world currently known to host life.');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 1, 687, 3389.5, false, 'A cold desert world with evidence of ancient water.');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 2, 4333, 69911.0, false, 'The largest planet in the Solar System.');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 2, 10759, 58232.0, false, 'A gas giant known for its extensive ring system.');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 3, 30687, 25362.0, false, 'An ice giant that rotates on its side.');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 3, 60190, 24622.0, false, 'A distant ice giant with powerful winds.');
INSERT INTO public.planet VALUES (9, 'Kepler-186f', 7, 1, 130, 7000.0, false, 'An Earth-size exoplanet in its star''s habitable zone.');
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 3, 1, 11, 7000.0, false, 'A nearby exoplanet orbiting Proxima Centauri.');
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', 8, 1, 6, 5790.0, false, 'A rocky exoplanet in the TRAPPIST-1 system.');
INSERT INTO public.planet VALUES (12, '51 Pegasi b', 9, 2, 4, 90000.0, false, 'A hot Jupiter orbiting the star 51 Pegasi.');


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial', 'Rocky planet with a solid surface.', false);
INSERT INTO public.planet_type VALUES (2, 'Gas giant', 'Large planet composed primarily of gases.', true);
INSERT INTO public.planet_type VALUES (3, 'Ice giant', 'Large planet rich in water, ammonia, and methane ices.', true);
INSERT INTO public.planet_type VALUES (4, 'Dwarf planet', 'Small planetary-mass body orbiting the Sun.', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 1.000, 4600, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A1V', 2.063, 242, true);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 'M5.5V', 0.122, 4850, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 'M1-M2 Ia', 16.5, 10, true);
INSERT INTO public.star VALUES (5, 'Vega', 1, 'A0V', 2.135, 455, true);
INSERT INTO public.star VALUES (6, 'Rigel', 1, 'B8 Ia', 21.0, 8, true);
INSERT INTO public.star VALUES (7, 'Kepler-186', 2, 'M1V', 0.48, 4000, true);
INSERT INTO public.star VALUES (8, 'TRAPPIST-1', 1, 'M8V', 0.09, 7600, true);
INSERT INTO public.star VALUES (9, '51 Pegasi', 1, 'G2IV', 1.11, 6500, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


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

