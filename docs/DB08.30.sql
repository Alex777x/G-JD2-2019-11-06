--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.4

-- Started on 2019-08-30 21:39:05

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2954 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 162321)
-- Name: action; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.action (
    id integer NOT NULL,
    player_id integer NOT NULL,
    bet numeric NOT NULL,
    call numeric NOT NULL,
    raise numeric NOT NULL,
    fold boolean NOT NULL,
    check_check boolean NOT NULL,
    all_in numeric NOT NULL,
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL
);


ALTER TABLE public.action OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 162327)
-- Name: action_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.action_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.action_id_seq OWNER TO postgres;

--
-- TOC entry 2955 (class 0 OID 0)
-- Dependencies: 197
-- Name: action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.action_id_seq OWNED BY public.action.id;


--
-- TOC entry 198 (class 1259 OID 162329)
-- Name: card; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.card (
    id integer NOT NULL,
    suit character varying(50) NOT NULL,
    rank character varying NOT NULL,
    filename character varying NOT NULL,
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL
);


ALTER TABLE public.card OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 162335)
-- Name: card_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.card_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.card_id_seq OWNER TO postgres;

--
-- TOC entry 2956 (class 0 OID 0)
-- Dependencies: 199
-- Name: card_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.card_id_seq OWNED BY public.card.id;


--
-- TOC entry 200 (class 1259 OID 162337)
-- Name: card_in_game; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.card_in_game (
    id integer NOT NULL,
    card_id integer NOT NULL,
    game_id integer NOT NULL,
    player_id integer,
    card_status character varying NOT NULL,
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL
);


ALTER TABLE public.card_in_game OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 162343)
-- Name: card_in_game_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.card_in_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.card_in_game_id_seq OWNER TO postgres;

--
-- TOC entry 2957 (class 0 OID 0)
-- Dependencies: 201
-- Name: card_in_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.card_in_game_id_seq OWNED BY public.card_in_game.id;


--
-- TOC entry 202 (class 1259 OID 162345)
-- Name: chat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat (
    id integer NOT NULL,
    game_id integer NOT NULL,
    user_account_id integer NOT NULL,
    message character varying(50) NOT NULL,
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL
);


ALTER TABLE public.chat OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 162348)
-- Name: chat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chat_id_seq OWNER TO postgres;

--
-- TOC entry 2958 (class 0 OID 0)
-- Dependencies: 203
-- Name: chat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chat_id_seq OWNED BY public.chat.id;


--
-- TOC entry 204 (class 1259 OID 162350)
-- Name: chat_in_home; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat_in_home (
    id integer NOT NULL,
    user_account_id integer NOT NULL,
    message character varying(50) NOT NULL,
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL
);


ALTER TABLE public.chat_in_home OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 162353)
-- Name: chat_in_home_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chat_in_home_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chat_in_home_id_seq OWNER TO postgres;

--
-- TOC entry 2959 (class 0 OID 0)
-- Dependencies: 205
-- Name: chat_in_home_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chat_in_home_id_seq OWNED BY public.chat_in_home.id;


--
-- TOC entry 206 (class 1259 OID 162355)
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    id integer NOT NULL,
    country character varying NOT NULL,
    created timestamp without time zone,
    updated timestamp without time zone
);


ALTER TABLE public.country OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 162361)
-- Name: country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.country_id_seq OWNER TO postgres;

--
-- TOC entry 2960 (class 0 OID 0)
-- Dependencies: 207
-- Name: country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.country_id_seq OWNED BY public.country.id;


--
-- TOC entry 208 (class 1259 OID 162363)
-- Name: game; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.game (
    id integer NOT NULL,
    state character varying NOT NULL,
    bank numeric DEFAULT '0'::numeric NOT NULL,
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    active_player_id integer DEFAULT 0,
    timestamp_end_step time without time zone
);


ALTER TABLE public.game OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 162381)
-- Name: game_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_id_seq OWNER TO postgres;

--
-- TOC entry 2961 (class 0 OID 0)
-- Dependencies: 209
-- Name: game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.game_id_seq OWNED BY public.game.id;


--
-- TOC entry 210 (class 1259 OID 162383)
-- Name: news; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.news (
    id integer NOT NULL,
    news_title character varying NOT NULL,
    news_text text NOT NULL,
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL
);


ALTER TABLE public.news OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 162389)
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.news_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.news_id_seq OWNER TO postgres;

--
-- TOC entry 2962 (class 0 OID 0)
-- Dependencies: 211
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.news_id_seq OWNED BY public.news.id;


--
-- TOC entry 212 (class 1259 OID 162391)
-- Name: player; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player (
    id integer NOT NULL,
    game_id integer NOT NULL,
    user_account_id integer NOT NULL,
    "position" integer,
    in_game boolean NOT NULL,
    state character varying(50) NOT NULL,
    stack numeric NOT NULL,
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    card1 character varying,
    card2 character varying
);


ALTER TABLE public.player OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 162397)
-- Name: player_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_id_seq OWNER TO postgres;

--
-- TOC entry 2963 (class 0 OID 0)
-- Dependencies: 213
-- Name: player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.player_id_seq OWNED BY public.player.id;


--
-- TOC entry 214 (class 1259 OID 162399)
-- Name: tiket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tiket (
    id integer NOT NULL,
    user_account_id integer NOT NULL,
    tiket_title character varying(50) NOT NULL,
    tiket_text text NOT NULL,
    status character varying(50) NOT NULL,
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone
);


ALTER TABLE public.tiket OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 162405)
-- Name: tiket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tiket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tiket_id_seq OWNER TO postgres;

--
-- TOC entry 2964 (class 0 OID 0)
-- Dependencies: 215
-- Name: tiket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tiket_id_seq OWNED BY public.tiket.id;


--
-- TOC entry 216 (class 1259 OID 162407)
-- Name: transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction (
    id integer NOT NULL,
    user_account_id bigint NOT NULL,
    amount numeric NOT NULL,
    comment character varying(50) NOT NULL,
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone
);


ALTER TABLE public.transaction OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 162413)
-- Name: transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transaction_id_seq OWNER TO postgres;

--
-- TOC entry 2965 (class 0 OID 0)
-- Dependencies: 217
-- Name: transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaction_id_seq OWNED BY public.transaction.id;


--
-- TOC entry 218 (class 1259 OID 162415)
-- Name: user_account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_account (
    id integer NOT NULL,
    nickname character varying(50) NOT NULL,
    password character varying(250) NOT NULL,
    email character varying(250) NOT NULL,
    foto character varying,
    country_id integer NOT NULL,
    user_role character varying NOT NULL,
    user_status character varying,
    sum_games integer,
    won_games integer,
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone
);


ALTER TABLE public.user_account OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 162421)
-- Name: user_account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_account_id_seq OWNER TO postgres;

--
-- TOC entry 2966 (class 0 OID 0)
-- Dependencies: 219
-- Name: user_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_account_id_seq OWNED BY public.user_account.id;


--
-- TOC entry 2746 (class 2604 OID 162423)
-- Name: action id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action ALTER COLUMN id SET DEFAULT nextval('public.action_id_seq'::regclass);


--
-- TOC entry 2747 (class 2604 OID 162424)
-- Name: card id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card ALTER COLUMN id SET DEFAULT nextval('public.card_id_seq'::regclass);


--
-- TOC entry 2748 (class 2604 OID 162425)
-- Name: card_in_game id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_in_game ALTER COLUMN id SET DEFAULT nextval('public.card_in_game_id_seq'::regclass);


--
-- TOC entry 2749 (class 2604 OID 162426)
-- Name: chat id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat ALTER COLUMN id SET DEFAULT nextval('public.chat_id_seq'::regclass);


--
-- TOC entry 2750 (class 2604 OID 162427)
-- Name: chat_in_home id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_in_home ALTER COLUMN id SET DEFAULT nextval('public.chat_in_home_id_seq'::regclass);


--
-- TOC entry 2751 (class 2604 OID 162428)
-- Name: country id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country ALTER COLUMN id SET DEFAULT nextval('public.country_id_seq'::regclass);


--
-- TOC entry 2754 (class 2604 OID 162429)
-- Name: game id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game ALTER COLUMN id SET DEFAULT nextval('public.game_id_seq'::regclass);


--
-- TOC entry 2755 (class 2604 OID 162430)
-- Name: news id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news ALTER COLUMN id SET DEFAULT nextval('public.news_id_seq'::regclass);


--
-- TOC entry 2756 (class 2604 OID 162431)
-- Name: player id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player ALTER COLUMN id SET DEFAULT nextval('public.player_id_seq'::regclass);


--
-- TOC entry 2757 (class 2604 OID 162432)
-- Name: tiket id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tiket ALTER COLUMN id SET DEFAULT nextval('public.tiket_id_seq'::regclass);


--
-- TOC entry 2758 (class 2604 OID 162433)
-- Name: transaction id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction ALTER COLUMN id SET DEFAULT nextval('public.transaction_id_seq'::regclass);


--
-- TOC entry 2759 (class 2604 OID 162434)
-- Name: user_account id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account ALTER COLUMN id SET DEFAULT nextval('public.user_account_id_seq'::regclass);


--
-- TOC entry 2923 (class 0 OID 162321)
-- Dependencies: 196
-- Data for Name: action; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2925 (class 0 OID 162329)
-- Dependencies: 198
-- Data for Name: card; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (27, 'CLUBS', 'TEN', '/resources/img/cards/10OfClubs.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (28, 'DIAMONDS', 'TEN', '/resources/img/cards/10OfDiamonds.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (29, 'HEARTS', 'TEN', '/resources/img/cards/10OfHearts.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (30, 'SPADES', 'TEN', '/resources/img/cards/10OfSpades.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (31, 'CLUBS', 'TWO', '/resources/img/cards/2OfClubs.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (32, 'DIAMONDS', 'TWO', '/resources/img/cards/2OfDiamonds.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (33, 'HEARTS', 'TWO', '/resources/img/cards/2OfHearts.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (34, 'SPADES', 'TWO', '/resources/img/cards/2OfSpades.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (35, 'CLUBS', 'THREE', '/resources/img/cards/3OfClubs.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (36, 'DIAMONDS', 'THREE', '/resources/img/cards/3OfDiamonds.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (37, 'HEARTS', 'THREE', '/resources/img/cards/3OfHearts.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (38, 'SPADES', 'THREE', '/resources/img/cards/3OfSpades.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (39, 'CLUBS', 'FOUR', '/resources/img/cards/4OfClubs.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (40, 'DIAMONDS', 'FOUR', '/resources/img/cards/4OfDiamonds.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (41, 'HEARTS', 'FOUR', '/resources/img/cards/4OfHearts.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (42, 'SPADES', 'FOUR', '/resources/img/cards/4OfSpades.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (43, 'CLUBS', 'FIVE', '/resources/img/cards/5OfClubs.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (44, 'DIAMONDS', 'FIVE', '/resources/img/cards/5OfDiamonds.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (45, 'HEARTS', 'FIVE', '/resources/img/cards/5OfHearts.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (46, 'SPADES', 'FIVE', '/resources/img/cards/5OfSpades.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (47, 'CLUBS', 'SIX', '/resources/img/cards/6OfClubs.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (48, 'DIAMONDS', 'SIX', '/resources/img/cards/6OfDiamonds.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (49, 'HEARTS', 'SIX', '/resources/img/cards/6OfHearts.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (50, 'SPADES', 'SIX', '/resources/img/cards/6OfSpades.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (51, 'CLUBS', 'SEVEN', '/resources/img/cards/7OfClubs.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (52, 'DIAMONDS', 'SEVEN', '/resources/img/cards/7OfDiamonds.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (53, 'HEARTS', 'SEVEN', '/resources/img/cards/7OfHearts.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (54, 'SPADES', 'SEVEN', '/resources/img/cards/7OfSpades.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (55, 'CLUBS', 'EIGHT', '/resources/img/cards/8OfClubs.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (56, 'DIAMONDS', 'EIGHT', '/resources/img/cards/8OfDiamonds.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (57, 'HEARTS', 'EIGHT', '/resources/img/cards/8OfHearts.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (58, 'SPADES', 'EIGHT', '/resources/img/cards/8OfSpades.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (59, 'CLUBS', 'NINE', '/resources/img/cards/9OfClubs.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (60, 'DIAMONDS', 'NINE', '/resources/img/cards/9OfDiamonds.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (61, 'HEARTS', 'NINE', '/resources/img/cards/9OfHearts.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (62, 'SPADES', 'NINE', '/resources/img/cards/9OfSpades.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (63, 'CLUBS', 'ACE', '/resources/img/cards/aceOfClubs.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (64, 'DIAMONDS', 'ACE', '/resources/img/cards/aceOfDiamonds.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (65, 'HEARTS', 'ACE', '/resources/img/cards/aceOfHearts.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (66, 'SPADES', 'ACE', '/resources/img/cards/aceOfSpades.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (67, 'CLUBS', 'JACK', '/resources/img/cards/jackOfClubs.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (68, 'DIAMONDS', 'JACK', '/resources/img/cards/jackOfDiamonds.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (69, 'HEARTS', 'JACK', '/resources/img/cards/jackOfHearts.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (70, 'SPADES', 'JACK', '/resources/img/cards/jackOfSpades.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (71, 'CLUBS', 'KING', '/resources/img/cards/kingOfClubs.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (72, 'DIAMONDS', 'KING', '/resources/img/cards/kingOfDiamonds.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (73, 'HEARTS', 'KING', '/resources/img/cards/kingOfHearts.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (74, 'SPADES', 'KING', '/resources/img/cards/kingOfSpades.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (75, 'CLUBS', 'QUEEN', '/resources/img/cards/queenOfClubs.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (76, 'DIAMONDS', 'QUEEN', '/resources/img/cards/queenOfDiamonds.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (77, 'HEARTS', 'QUEEN', '/resources/img/cards/queenOfHearts.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');
INSERT INTO public.card (id, suit, rank, filename, created, updated) VALUES (78, 'SPADES', 'QUEEN', '/resources/img/cards/queenOfSpades.png', '2019-08-22 23:53:16.555', '2019-08-22 23:53:16.555');


--
-- TOC entry 2927 (class 0 OID 162337)
-- Dependencies: 200
-- Data for Name: card_in_game; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (1, 68, 43, NULL, 'INDECK', '2019-08-30 19:01:35.98', '2019-08-30 19:01:35.98');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2, 33, 43, NULL, 'INDECK', '2019-08-30 19:01:36.046', '2019-08-30 19:01:36.046');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3, 40, 43, NULL, 'INDECK', '2019-08-30 19:01:36.054', '2019-08-30 19:01:36.054');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (4, 67, 43, NULL, 'INDECK', '2019-08-30 19:01:36.061', '2019-08-30 19:01:36.061');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (5, 38, 43, NULL, 'INDECK', '2019-08-30 19:01:36.069', '2019-08-30 19:01:36.069');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (6, 78, 43, NULL, 'INDECK', '2019-08-30 19:01:36.076', '2019-08-30 19:01:36.076');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (7, 61, 43, NULL, 'INDECK', '2019-08-30 19:01:36.084', '2019-08-30 19:01:36.084');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (8, 41, 43, NULL, 'INDECK', '2019-08-30 19:01:36.091', '2019-08-30 19:01:36.091');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (9, 77, 43, NULL, 'INDECK', '2019-08-30 19:01:36.1', '2019-08-30 19:01:36.1');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (10, 30, 43, NULL, 'INDECK', '2019-08-30 19:01:36.107', '2019-08-30 19:01:36.107');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (11, 45, 43, NULL, 'INDECK', '2019-08-30 19:01:36.114', '2019-08-30 19:01:36.114');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (12, 51, 43, NULL, 'INDECK', '2019-08-30 19:01:36.121', '2019-08-30 19:01:36.121');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (13, 73, 43, NULL, 'INDECK', '2019-08-30 19:01:36.127', '2019-08-30 19:01:36.127');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (14, 60, 43, NULL, 'INDECK', '2019-08-30 19:01:36.134', '2019-08-30 19:01:36.134');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (15, 64, 43, NULL, 'INDECK', '2019-08-30 19:01:36.141', '2019-08-30 19:01:36.141');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16, 57, 43, NULL, 'INDECK', '2019-08-30 19:01:36.149', '2019-08-30 19:01:36.149');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (17, 29, 43, NULL, 'INDECK', '2019-08-30 19:01:36.156', '2019-08-30 19:01:36.156');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (18, 31, 43, NULL, 'INDECK', '2019-08-30 19:01:36.163', '2019-08-30 19:01:36.163');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (19, 59, 43, NULL, 'INDECK', '2019-08-30 19:01:36.17', '2019-08-30 19:01:36.17');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (20, 27, 43, NULL, 'INDECK', '2019-08-30 19:01:36.176', '2019-08-30 19:01:36.176');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (21, 54, 43, NULL, 'INDECK', '2019-08-30 19:01:36.183', '2019-08-30 19:01:36.183');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (22, 53, 43, NULL, 'INDECK', '2019-08-30 19:01:36.189', '2019-08-30 19:01:36.189');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (23, 46, 43, NULL, 'INDECK', '2019-08-30 19:01:36.195', '2019-08-30 19:01:36.195');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (24, 75, 43, NULL, 'INDECK', '2019-08-30 19:01:36.202', '2019-08-30 19:01:36.202');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (25, 66, 43, NULL, 'INDECK', '2019-08-30 19:01:36.207', '2019-08-30 19:01:36.207');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (26, 63, 43, NULL, 'INDECK', '2019-08-30 19:01:36.213', '2019-08-30 19:01:36.213');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (27, 37, 43, NULL, 'INDECK', '2019-08-30 19:01:36.219', '2019-08-30 19:01:36.219');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (28, 47, 43, NULL, 'INDECK', '2019-08-30 19:01:36.225', '2019-08-30 19:01:36.225');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (29, 55, 43, NULL, 'INDECK', '2019-08-30 19:01:36.231', '2019-08-30 19:01:36.231');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (30, 35, 43, NULL, 'INDECK', '2019-08-30 19:01:36.236', '2019-08-30 19:01:36.236');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (31, 42, 43, NULL, 'INDECK', '2019-08-30 19:01:36.25', '2019-08-30 19:01:36.25');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (32, 76, 43, NULL, 'INDECK', '2019-08-30 19:01:36.256', '2019-08-30 19:01:36.256');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (33, 70, 43, NULL, 'INDECK', '2019-08-30 19:01:36.262', '2019-08-30 19:01:36.262');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (34, 49, 43, NULL, 'INDECK', '2019-08-30 19:01:36.267', '2019-08-30 19:01:36.267');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (35, 28, 43, NULL, 'INDECK', '2019-08-30 19:01:36.271', '2019-08-30 19:01:36.271');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (36, 69, 43, NULL, 'INDECK', '2019-08-30 19:01:36.277', '2019-08-30 19:01:36.277');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (37, 36, 43, NULL, 'INDECK', '2019-08-30 19:01:36.286', '2019-08-30 19:01:36.286');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (38, 39, 43, NULL, 'INDECK', '2019-08-30 19:01:36.301', '2019-08-30 19:01:36.301');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (39, 44, 43, NULL, 'INDECK', '2019-08-30 19:01:36.306', '2019-08-30 19:01:36.306');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (40, 62, 43, NULL, 'INDECK', '2019-08-30 19:01:36.311', '2019-08-30 19:01:36.311');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (41, 71, 43, NULL, 'INDECK', '2019-08-30 19:01:36.316', '2019-08-30 19:01:36.316');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (42, 34, 43, NULL, 'INDECK', '2019-08-30 19:01:36.323', '2019-08-30 19:01:36.323');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (43, 65, 43, NULL, 'INDECK', '2019-08-30 19:01:36.329', '2019-08-30 19:01:36.329');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (44, 58, 43, NULL, 'INDECK', '2019-08-30 19:01:36.336', '2019-08-30 19:01:36.336');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (45, 52, 43, NULL, 'INDECK', '2019-08-30 19:01:36.342', '2019-08-30 19:01:36.342');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (46, 43, 43, NULL, 'INDECK', '2019-08-30 19:01:36.351', '2019-08-30 19:01:36.351');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (47, 74, 43, NULL, 'INDECK', '2019-08-30 19:01:36.36', '2019-08-30 19:01:36.36');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (48, 48, 43, NULL, 'INDECK', '2019-08-30 19:01:36.367', '2019-08-30 19:01:36.367');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (49, 50, 43, NULL, 'INDECK', '2019-08-30 19:01:36.372', '2019-08-30 19:01:36.372');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (50, 72, 43, NULL, 'INDECK', '2019-08-30 19:01:36.388', '2019-08-30 19:01:36.388');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (51, 56, 43, NULL, 'INDECK', '2019-08-30 19:01:36.394', '2019-08-30 19:01:36.394');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (52, 32, 43, NULL, 'INDECK', '2019-08-30 19:01:36.4', '2019-08-30 19:01:36.4');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (53, 68, 44, NULL, 'INDECK', '2019-08-30 19:57:58.822', '2019-08-30 19:57:58.822');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (54, 33, 44, NULL, 'INDECK', '2019-08-30 19:57:58.837', '2019-08-30 19:57:58.837');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (55, 40, 44, NULL, 'INDECK', '2019-08-30 19:57:58.844', '2019-08-30 19:57:58.844');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (56, 67, 44, NULL, 'INDECK', '2019-08-30 19:57:58.853', '2019-08-30 19:57:58.853');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (57, 38, 44, NULL, 'INDECK', '2019-08-30 19:57:58.861', '2019-08-30 19:57:58.861');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (58, 78, 44, NULL, 'INDECK', '2019-08-30 19:57:58.868', '2019-08-30 19:57:58.868');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (59, 61, 44, NULL, 'INDECK', '2019-08-30 19:57:58.876', '2019-08-30 19:57:58.876');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (60, 41, 44, NULL, 'INDECK', '2019-08-30 19:57:58.884', '2019-08-30 19:57:58.884');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (61, 77, 44, NULL, 'INDECK', '2019-08-30 19:57:58.89', '2019-08-30 19:57:58.89');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (62, 30, 44, NULL, 'INDECK', '2019-08-30 19:57:58.903', '2019-08-30 19:57:58.903');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (63, 45, 44, NULL, 'INDECK', '2019-08-30 19:57:58.91', '2019-08-30 19:57:58.91');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (64, 51, 44, NULL, 'INDECK', '2019-08-30 19:57:58.918', '2019-08-30 19:57:58.918');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (65, 73, 44, NULL, 'INDECK', '2019-08-30 19:57:58.924', '2019-08-30 19:57:58.924');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (66, 60, 44, NULL, 'INDECK', '2019-08-30 19:57:58.931', '2019-08-30 19:57:58.931');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (67, 64, 44, NULL, 'INDECK', '2019-08-30 19:57:58.938', '2019-08-30 19:57:58.938');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (68, 57, 44, NULL, 'INDECK', '2019-08-30 19:57:58.945', '2019-08-30 19:57:58.945');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (69, 29, 44, NULL, 'INDECK', '2019-08-30 19:57:58.951', '2019-08-30 19:57:58.951');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (70, 31, 44, NULL, 'INDECK', '2019-08-30 19:57:58.956', '2019-08-30 19:57:58.956');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (71, 59, 44, NULL, 'INDECK', '2019-08-30 19:57:58.961', '2019-08-30 19:57:58.961');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (72, 27, 44, NULL, 'INDECK', '2019-08-30 19:57:58.967', '2019-08-30 19:57:58.967');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (73, 54, 44, NULL, 'INDECK', '2019-08-30 19:57:58.972', '2019-08-30 19:57:58.972');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (74, 53, 44, NULL, 'INDECK', '2019-08-30 19:57:58.978', '2019-08-30 19:57:58.978');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (75, 46, 44, NULL, 'INDECK', '2019-08-30 19:57:58.983', '2019-08-30 19:57:58.983');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (76, 75, 44, NULL, 'INDECK', '2019-08-30 19:57:58.991', '2019-08-30 19:57:58.991');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (77, 66, 44, NULL, 'INDECK', '2019-08-30 19:57:59.007', '2019-08-30 19:57:59.007');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (78, 63, 44, NULL, 'INDECK', '2019-08-30 19:57:59.016', '2019-08-30 19:57:59.016');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (79, 37, 44, NULL, 'INDECK', '2019-08-30 19:57:59.023', '2019-08-30 19:57:59.023');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (80, 47, 44, NULL, 'INDECK', '2019-08-30 19:57:59.03', '2019-08-30 19:57:59.03');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (81, 55, 44, NULL, 'INDECK', '2019-08-30 19:57:59.036', '2019-08-30 19:57:59.036');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (82, 35, 44, NULL, 'INDECK', '2019-08-30 19:57:59.043', '2019-08-30 19:57:59.043');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (83, 42, 44, NULL, 'INDECK', '2019-08-30 19:57:59.049', '2019-08-30 19:57:59.049');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (84, 76, 44, NULL, 'INDECK', '2019-08-30 19:57:59.054', '2019-08-30 19:57:59.054');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (85, 70, 44, NULL, 'INDECK', '2019-08-30 19:57:59.06', '2019-08-30 19:57:59.06');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (86, 49, 44, NULL, 'INDECK', '2019-08-30 19:57:59.066', '2019-08-30 19:57:59.066');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (87, 28, 44, NULL, 'INDECK', '2019-08-30 19:57:59.071', '2019-08-30 19:57:59.071');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (88, 69, 44, NULL, 'INDECK', '2019-08-30 19:57:59.077', '2019-08-30 19:57:59.077');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (89, 36, 44, NULL, 'INDECK', '2019-08-30 19:57:59.083', '2019-08-30 19:57:59.083');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (90, 39, 44, NULL, 'INDECK', '2019-08-30 19:57:59.089', '2019-08-30 19:57:59.089');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (91, 44, 44, NULL, 'INDECK', '2019-08-30 19:57:59.097', '2019-08-30 19:57:59.097');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (92, 62, 44, NULL, 'INDECK', '2019-08-30 19:57:59.104', '2019-08-30 19:57:59.104');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (93, 71, 44, NULL, 'INDECK', '2019-08-30 19:57:59.11', '2019-08-30 19:57:59.11');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (94, 34, 44, NULL, 'INDECK', '2019-08-30 19:57:59.116', '2019-08-30 19:57:59.116');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (95, 65, 44, NULL, 'INDECK', '2019-08-30 19:57:59.122', '2019-08-30 19:57:59.122');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (96, 58, 44, NULL, 'INDECK', '2019-08-30 19:57:59.127', '2019-08-30 19:57:59.127');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (97, 52, 44, NULL, 'INDECK', '2019-08-30 19:57:59.133', '2019-08-30 19:57:59.133');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (98, 43, 44, NULL, 'INDECK', '2019-08-30 19:57:59.139', '2019-08-30 19:57:59.139');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (99, 74, 44, NULL, 'INDECK', '2019-08-30 19:57:59.145', '2019-08-30 19:57:59.145');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (100, 48, 44, NULL, 'INDECK', '2019-08-30 19:57:59.15', '2019-08-30 19:57:59.15');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (101, 50, 44, NULL, 'INDECK', '2019-08-30 19:57:59.156', '2019-08-30 19:57:59.156');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (102, 72, 44, NULL, 'INDECK', '2019-08-30 19:57:59.164', '2019-08-30 19:57:59.164');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (103, 56, 44, NULL, 'INDECK', '2019-08-30 19:57:59.171', '2019-08-30 19:57:59.171');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (104, 32, 44, NULL, 'INDECK', '2019-08-30 19:57:59.176', '2019-08-30 19:57:59.176');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (105, 68, 43, NULL, 'INDECK', '2019-08-30 21:30:49.79', '2019-08-30 21:30:49.79');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (106, 33, 43, NULL, 'INDECK', '2019-08-30 21:30:49.866', '2019-08-30 21:30:49.866');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (107, 40, 43, NULL, 'INDECK', '2019-08-30 21:30:49.871', '2019-08-30 21:30:49.871');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (108, 67, 43, NULL, 'INDECK', '2019-08-30 21:30:49.877', '2019-08-30 21:30:49.877');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (109, 38, 43, NULL, 'INDECK', '2019-08-30 21:30:49.884', '2019-08-30 21:30:49.884');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (110, 78, 43, NULL, 'INDECK', '2019-08-30 21:30:49.89', '2019-08-30 21:30:49.89');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (111, 61, 43, NULL, 'INDECK', '2019-08-30 21:30:49.897', '2019-08-30 21:30:49.897');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (112, 41, 43, NULL, 'INDECK', '2019-08-30 21:30:49.904', '2019-08-30 21:30:49.904');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (113, 77, 43, NULL, 'INDECK', '2019-08-30 21:30:49.91', '2019-08-30 21:30:49.91');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (114, 30, 43, NULL, 'INDECK', '2019-08-30 21:30:49.917', '2019-08-30 21:30:49.917');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (115, 45, 43, NULL, 'INDECK', '2019-08-30 21:30:49.923', '2019-08-30 21:30:49.923');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (116, 51, 43, NULL, 'INDECK', '2019-08-30 21:30:49.929', '2019-08-30 21:30:49.929');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (117, 73, 43, NULL, 'INDECK', '2019-08-30 21:30:49.935', '2019-08-30 21:30:49.935');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (118, 60, 43, NULL, 'INDECK', '2019-08-30 21:30:49.942', '2019-08-30 21:30:49.942');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (119, 64, 43, NULL, 'INDECK', '2019-08-30 21:30:49.948', '2019-08-30 21:30:49.948');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (120, 57, 43, NULL, 'INDECK', '2019-08-30 21:30:49.955', '2019-08-30 21:30:49.955');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (121, 29, 43, NULL, 'INDECK', '2019-08-30 21:30:49.961', '2019-08-30 21:30:49.961');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (122, 31, 43, NULL, 'INDECK', '2019-08-30 21:30:49.968', '2019-08-30 21:30:49.968');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (123, 59, 43, NULL, 'INDECK', '2019-08-30 21:30:49.974', '2019-08-30 21:30:49.974');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (124, 27, 43, NULL, 'INDECK', '2019-08-30 21:30:49.979', '2019-08-30 21:30:49.979');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (125, 54, 43, NULL, 'INDECK', '2019-08-30 21:30:49.985', '2019-08-30 21:30:49.985');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (126, 53, 43, NULL, 'INDECK', '2019-08-30 21:30:49.992', '2019-08-30 21:30:49.992');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (127, 46, 43, NULL, 'INDECK', '2019-08-30 21:30:49.996', '2019-08-30 21:30:49.996');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (128, 75, 43, NULL, 'INDECK', '2019-08-30 21:30:50.001', '2019-08-30 21:30:50.001');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (129, 66, 43, NULL, 'INDECK', '2019-08-30 21:30:50.006', '2019-08-30 21:30:50.006');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (130, 63, 43, NULL, 'INDECK', '2019-08-30 21:30:50.012', '2019-08-30 21:30:50.012');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (131, 37, 43, NULL, 'INDECK', '2019-08-30 21:30:50.016', '2019-08-30 21:30:50.016');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (132, 47, 43, NULL, 'INDECK', '2019-08-30 21:30:50.021', '2019-08-30 21:30:50.021');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (133, 55, 43, NULL, 'INDECK', '2019-08-30 21:30:50.026', '2019-08-30 21:30:50.026');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (134, 35, 43, NULL, 'INDECK', '2019-08-30 21:30:50.031', '2019-08-30 21:30:50.031');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (135, 42, 43, NULL, 'INDECK', '2019-08-30 21:30:50.036', '2019-08-30 21:30:50.036');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (136, 76, 43, NULL, 'INDECK', '2019-08-30 21:30:50.041', '2019-08-30 21:30:50.041');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (137, 70, 43, NULL, 'INDECK', '2019-08-30 21:30:50.046', '2019-08-30 21:30:50.046');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (138, 49, 43, NULL, 'INDECK', '2019-08-30 21:30:50.05', '2019-08-30 21:30:50.05');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (139, 28, 43, NULL, 'INDECK', '2019-08-30 21:30:50.055', '2019-08-30 21:30:50.055');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (140, 69, 43, NULL, 'INDECK', '2019-08-30 21:30:50.06', '2019-08-30 21:30:50.06');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (141, 36, 43, NULL, 'INDECK', '2019-08-30 21:30:50.065', '2019-08-30 21:30:50.065');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (142, 39, 43, NULL, 'INDECK', '2019-08-30 21:30:50.072', '2019-08-30 21:30:50.072');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (143, 44, 43, NULL, 'INDECK', '2019-08-30 21:30:50.078', '2019-08-30 21:30:50.078');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (144, 62, 43, NULL, 'INDECK', '2019-08-30 21:30:50.083', '2019-08-30 21:30:50.083');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (145, 71, 43, NULL, 'INDECK', '2019-08-30 21:30:50.091', '2019-08-30 21:30:50.091');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (146, 34, 43, NULL, 'INDECK', '2019-08-30 21:30:50.097', '2019-08-30 21:30:50.097');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (147, 65, 43, NULL, 'INDECK', '2019-08-30 21:30:50.102', '2019-08-30 21:30:50.102');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (148, 58, 43, NULL, 'INDECK', '2019-08-30 21:30:50.107', '2019-08-30 21:30:50.107');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (149, 52, 43, NULL, 'INDECK', '2019-08-30 21:30:50.111', '2019-08-30 21:30:50.111');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (150, 43, 43, NULL, 'INDECK', '2019-08-30 21:30:50.117', '2019-08-30 21:30:50.117');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (151, 74, 43, NULL, 'INDECK', '2019-08-30 21:30:50.122', '2019-08-30 21:30:50.122');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (152, 48, 43, NULL, 'INDECK', '2019-08-30 21:30:50.126', '2019-08-30 21:30:50.126');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (153, 50, 43, NULL, 'INDECK', '2019-08-30 21:30:50.133', '2019-08-30 21:30:50.133');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (154, 72, 43, NULL, 'INDECK', '2019-08-30 21:30:50.138', '2019-08-30 21:30:50.138');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (155, 56, 43, NULL, 'INDECK', '2019-08-30 21:30:50.143', '2019-08-30 21:30:50.143');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (156, 32, 43, NULL, 'INDECK', '2019-08-30 21:30:50.15', '2019-08-30 21:30:50.15');


--
-- TOC entry 2929 (class 0 OID 162345)
-- Dependencies: 202
-- Data for Name: chat; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2931 (class 0 OID 162350)
-- Dependencies: 204
-- Data for Name: chat_in_home; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.chat_in_home (id, user_account_id, message, created, updated) VALUES (1, 1, 'TEST1', '2019-08-22 21:16:19.809', '2019-08-22 21:16:19.809');
INSERT INTO public.chat_in_home (id, user_account_id, message, created, updated) VALUES (2, 1, 'Hello', '2019-08-23 18:37:08.766', '2019-08-23 18:37:08.766');
INSERT INTO public.chat_in_home (id, user_account_id, message, created, updated) VALUES (3, 1, 'TEST2', '2019-08-23 18:39:08.066', '2019-08-23 18:39:08.066');


--
-- TOC entry 2933 (class 0 OID 162355)
-- Dependencies: 206
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.country (id, country, created, updated) VALUES (1, 'Afghanistan', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (2, 'Albania', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (3, 'Algeria', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (4, 'Andorra', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (5, 'Angola', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (6, 'Antigua & Deps', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (7, 'Argentina', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (8, 'Armenia', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (9, 'Australia', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (10, 'Austria', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (11, 'Azerbaijan', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (12, 'Bahamas', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (13, 'Bahrain', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (14, 'Bangladesh', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (15, 'Barbados', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (16, 'Belarus', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (17, 'Belgium', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (18, 'Belize', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (19, 'Benin', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (20, 'Bhutan', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (21, 'Bolivia', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (22, 'Bosnia Herzegovina', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (23, 'Botswana', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (24, 'Brazil', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (25, 'Brunei', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (26, 'Bulgaria', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (27, 'Burkina', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (28, 'Burundi', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (29, 'Cambodia', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (30, 'Cameroon', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (31, 'Canada', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (32, 'Cape Verde', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (33, 'Central African Rep', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (34, 'Chad', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (35, 'Chile', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (36, 'China', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (37, 'Colombia', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (38, 'Comoros', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (39, 'Congo', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (40, 'Congo {Democratic Rep}', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (41, 'Costa Rica', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (42, 'Croatia', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (43, 'Cuba', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (44, 'Cyprus', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (45, 'Czech Republic', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (46, 'Denmark', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (47, 'Djibouti', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (48, 'Dominica', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (49, 'Dominican Republic', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (50, 'East Timor', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (51, 'Ecuador', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (52, 'Egypt', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (53, 'El Salvador', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (54, 'Equatorial Guinea', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (55, 'Eritrea', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (56, 'Estonia', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (57, 'Ethiopia', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (58, 'Fiji', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (59, 'Finland', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (60, 'France', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (61, 'Gabon', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (62, 'Gambia', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (63, 'Georgia', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (64, 'Germany', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (65, 'Ghana', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (66, 'Greece', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (67, 'Grenada', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (68, 'Guatemala', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (69, 'Guinea', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (70, 'Guinea-Bissau', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (71, 'Guyana', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (72, 'Haiti', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (73, 'Honduras', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (74, 'Hungary', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (75, 'Iceland', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (76, 'India', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (77, 'Indonesia', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (78, 'Iran', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (79, 'Iraq', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (80, 'Ireland {Republic}', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (81, 'Israel', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (82, 'Italy', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (83, 'Ivory Coast', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (84, 'Jamaica', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (85, 'Japan', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (86, 'Jordan', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (87, 'Kazakhstan', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (88, 'Kenya', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (89, 'Kiribati', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (90, 'Korea North', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (91, 'Korea South', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (92, 'Kosovo', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (93, 'Kuwait', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (94, 'Kyrgyzstan', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (95, 'Laos', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (96, 'Latvia', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (97, 'Lebanon', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (98, 'Lesotho', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (99, 'Liberia', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (100, 'Libya', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (101, 'Liechtenstein', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (102, 'Lithuania', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (103, 'Luxembourg', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (104, 'Macedonia', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (105, 'Madagascar', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (106, 'Malawi', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (107, 'Malaysia', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (108, 'Maldives', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (109, 'Mali', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (110, 'Malta', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (111, 'Marshall Islands', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (112, 'Mauritania', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (113, 'Mauritius', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (114, 'Mexico', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (115, 'Micronesia', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (116, 'Moldova', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (117, 'Monaco', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (118, 'Mongolia', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (119, 'Montenegro', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (120, 'Morocco', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (121, 'Mozambique', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (122, 'Myanmar, {Burma}', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (123, 'Namibia', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (124, 'Nauru', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (125, 'Nepal', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (126, 'Netherlands', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (127, 'New Zealand', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (128, 'Nicaragua', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (129, 'Niger', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (130, 'Nigeria', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (131, 'Norway', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (132, 'Oman', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (133, 'Pakistan', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (134, 'Palau', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (135, 'Panama', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (136, 'Papua New Guinea', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (137, 'Paraguay', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (138, 'Peru', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (139, 'Philippines', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (140, 'Poland', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (141, 'Portugal', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (142, 'Qatar', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (143, 'Romania', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (144, 'Russian Federation', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (145, 'Rwanda', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (146, 'St Kitts & Nevis', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (147, 'St Lucia', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (148, 'Saint Vincent & the Grenadines', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (149, 'Samoa', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (150, 'San Marino', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (151, 'Sao Tome & Principe', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (152, 'Saudi Arabia', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (153, 'Senegal', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (154, 'Serbia', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (155, 'Seychelles', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (156, 'Sierra Leone', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (157, 'Singapore', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (158, 'Slovakia', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (159, 'Slovenia', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (160, 'Solomon Islands', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (161, 'Somalia', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (162, 'South Africa', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (163, 'South Sudan', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (164, 'Spain', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (165, 'Sri Lanka', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (166, 'Sudan', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (167, 'Suriname', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (168, 'Swaziland', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (169, 'Sweden', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (170, 'Switzerland', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (171, 'Syria', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (172, 'Taiwan', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (173, 'Tajikistan', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (174, 'Tanzania', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (175, 'Thailand', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (176, 'Togo', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (177, 'Tonga', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (178, 'Trinidad & Tobago', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (179, 'Tunisia', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (180, 'Turkey', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (181, 'Turkmenistan', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (182, 'Tuvalu', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (183, 'Uganda', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (184, 'Ukraine', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (185, 'United Arab Emirates', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (186, 'United Kingdom', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (187, 'United States', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (188, 'Uruguay', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (189, 'Uzbekistan', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (190, 'Vanuatu', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (191, 'Vatican City', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (192, 'Venezuela', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (193, 'Vietnam', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (194, 'Yemen', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (195, 'Zambia', NULL, NULL);
INSERT INTO public.country (id, country, created, updated) VALUES (196, 'Zimbabwe', NULL, NULL);


--
-- TOC entry 2935 (class 0 OID 162363)
-- Dependencies: 208
-- Data for Name: game; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.game (id, state, bank, created, updated, active_player_id, timestamp_end_step) VALUES (44, 'END', 0, '2019-08-30 19:57:47.608', '2019-08-30 20:55:32.442', 0, NULL);
INSERT INTO public.game (id, state, bank, created, updated, active_player_id, timestamp_end_step) VALUES (40, 'END', 0, '2019-08-30 18:54:35.672', '2019-08-30 18:54:35.672', 0, NULL);
INSERT INTO public.game (id, state, bank, created, updated, active_player_id, timestamp_end_step) VALUES (41, 'END', 0, '2019-08-30 18:56:50.107', '2019-08-30 18:56:58.918', 0, NULL);
INSERT INTO public.game (id, state, bank, created, updated, active_player_id, timestamp_end_step) VALUES (42, 'END', 0, '2019-08-30 18:58:08.784', '2019-08-30 18:58:17.605', 0, NULL);
INSERT INTO public.game (id, state, bank, created, updated, active_player_id, timestamp_end_step) VALUES (43, 'ACTIVE', 0, '2019-08-30 19:01:06.747', '2019-08-30 21:30:50.152', 0, NULL);


--
-- TOC entry 2937 (class 0 OID 162383)
-- Dependencies: 210
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2939 (class 0 OID 162391)
-- Dependencies: 212
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.player (id, game_id, user_account_id, "position", in_game, state, stack, created, updated, card1, card2) VALUES (84, 43, 2, 9, true, 'DEALER', 1000, '2019-08-30 21:30:47.643', '2019-08-30 21:31:36.376', '/resources/img/cards/jackOfClubs.png', '/resources/img/cards/kingOfHearts.png');
INSERT INTO public.player (id, game_id, user_account_id, "position", in_game, state, stack, created, updated, card1, card2) VALUES (83, 43, 1, 0, true, 'DEALER', 1000, '2019-08-30 21:29:48.029', '2019-08-30 21:31:37.772', '/resources/img/cards/4OfHearts.png', '/resources/img/cards/jackOfSpades.png');


--
-- TOC entry 2941 (class 0 OID 162399)
-- Dependencies: 214
-- Data for Name: tiket; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2943 (class 0 OID 162407)
-- Dependencies: 216
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1, 1, 1000, 'First bonus transaction', '2019-08-22 21:16:08.673', '2019-08-22 21:16:08.673');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (2, 2, 1000, 'First bonus transaction', '2019-08-22 23:03:27.854', '2019-08-22 23:03:27.854');


--
-- TOC entry 2945 (class 0 OID 162415)
-- Dependencies: 218
-- Data for Name: user_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_account (id, nickname, password, email, foto, country_id, user_role, user_status, sum_games, won_games, created, updated) VALUES (1, 'Admin', '$2a$10$QE39xe3rcgW8Cv6hXqQNLubg02aBmNtrfBDCMMwGMNEOA6oG0Lts.', 'aaaa@a.com', 'resources/img/foto.png', 107, 'ADMIN', 'ACTIVE', 0, 0, '2019-08-22 21:16:05.456', '2019-08-22 21:16:05.456');
INSERT INTO public.user_account (id, nickname, password, email, foto, country_id, user_role, user_status, sum_games, won_games, created, updated) VALUES (2, 'Test', '$2a$10$OgNTZQU7I.q7TzILBgU7He4IJJS.1DktexjLp./OgFD.qUUitz8mu', 'makaka@a.com', 'resources/img/foto.png', 1, 'ADMIN', 'ACTIVE', 0, 0, '2019-08-22 23:03:24.411', '2019-08-22 23:03:24.411');


--
-- TOC entry 2967 (class 0 OID 0)
-- Dependencies: 197
-- Name: action_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.action_id_seq', 1, false);


--
-- TOC entry 2968 (class 0 OID 0)
-- Dependencies: 199
-- Name: card_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.card_id_seq', 78, true);


--
-- TOC entry 2969 (class 0 OID 0)
-- Dependencies: 201
-- Name: card_in_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.card_in_game_id_seq', 156, true);


--
-- TOC entry 2970 (class 0 OID 0)
-- Dependencies: 203
-- Name: chat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_id_seq', 1, false);


--
-- TOC entry 2971 (class 0 OID 0)
-- Dependencies: 205
-- Name: chat_in_home_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_in_home_id_seq', 3, true);


--
-- TOC entry 2972 (class 0 OID 0)
-- Dependencies: 207
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_id_seq', 196, true);


--
-- TOC entry 2973 (class 0 OID 0)
-- Dependencies: 209
-- Name: game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.game_id_seq', 44, true);


--
-- TOC entry 2974 (class 0 OID 0)
-- Dependencies: 211
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.news_id_seq', 1, false);


--
-- TOC entry 2975 (class 0 OID 0)
-- Dependencies: 213
-- Name: player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.player_id_seq', 84, true);


--
-- TOC entry 2976 (class 0 OID 0)
-- Dependencies: 215
-- Name: tiket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tiket_id_seq', 1, false);


--
-- TOC entry 2977 (class 0 OID 0)
-- Dependencies: 217
-- Name: transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaction_id_seq', 2, true);


--
-- TOC entry 2978 (class 0 OID 0)
-- Dependencies: 219
-- Name: user_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_account_id_seq', 2, true);


--
-- TOC entry 2761 (class 2606 OID 162436)
-- Name: action action_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action
    ADD CONSTRAINT action_pk PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 162438)
-- Name: card card_filename_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card
    ADD CONSTRAINT card_filename_key UNIQUE (filename);


--
-- TOC entry 2767 (class 2606 OID 162440)
-- Name: card_in_game card_in_game_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_in_game
    ADD CONSTRAINT card_in_game_pk PRIMARY KEY (id);


--
-- TOC entry 2765 (class 2606 OID 162442)
-- Name: card card_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card
    ADD CONSTRAINT card_pk PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 162444)
-- Name: chat_in_home chat_in_home_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_in_home
    ADD CONSTRAINT chat_in_home_pk PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 162446)
-- Name: chat chat_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_pk PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 162448)
-- Name: country country_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pk PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 162450)
-- Name: game game_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_pk PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 162452)
-- Name: news news_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pk PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 162454)
-- Name: player player_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_pk PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 162456)
-- Name: tiket tiket_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tiket
    ADD CONSTRAINT tiket_pk PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 162458)
-- Name: transaction transaction_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pk PRIMARY KEY (id);


--
-- TOC entry 2785 (class 2606 OID 162460)
-- Name: user_account user_account_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account
    ADD CONSTRAINT user_account_email_key UNIQUE (email);


--
-- TOC entry 2787 (class 2606 OID 162462)
-- Name: user_account user_account_nickname_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account
    ADD CONSTRAINT user_account_nickname_key UNIQUE (nickname);


--
-- TOC entry 2789 (class 2606 OID 162464)
-- Name: user_account user_account_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account
    ADD CONSTRAINT user_account_pk PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 162465)
-- Name: action action_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action
    ADD CONSTRAINT action_fk0 FOREIGN KEY (player_id) REFERENCES public.player(id);


--
-- TOC entry 2791 (class 2606 OID 162470)
-- Name: card_in_game card_in_game_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_in_game
    ADD CONSTRAINT card_in_game_fk0 FOREIGN KEY (card_id) REFERENCES public.card(id);


--
-- TOC entry 2792 (class 2606 OID 162475)
-- Name: card_in_game card_in_game_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_in_game
    ADD CONSTRAINT card_in_game_fk1 FOREIGN KEY (game_id) REFERENCES public.game(id);


--
-- TOC entry 2793 (class 2606 OID 162480)
-- Name: card_in_game card_in_game_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_in_game
    ADD CONSTRAINT card_in_game_fk2 FOREIGN KEY (player_id) REFERENCES public.player(id);


--
-- TOC entry 2794 (class 2606 OID 162485)
-- Name: chat chat_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_fk0 FOREIGN KEY (game_id) REFERENCES public.game(id);


--
-- TOC entry 2795 (class 2606 OID 162490)
-- Name: chat chat_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_fk1 FOREIGN KEY (user_account_id) REFERENCES public.user_account(id);


--
-- TOC entry 2796 (class 2606 OID 162495)
-- Name: chat_in_home chat_in_home_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_in_home
    ADD CONSTRAINT chat_in_home_fk0 FOREIGN KEY (user_account_id) REFERENCES public.user_account(id);


--
-- TOC entry 2797 (class 2606 OID 162500)
-- Name: player player_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_fk0 FOREIGN KEY (game_id) REFERENCES public.game(id);


--
-- TOC entry 2798 (class 2606 OID 162505)
-- Name: player player_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_fk1 FOREIGN KEY (user_account_id) REFERENCES public.user_account(id);


--
-- TOC entry 2799 (class 2606 OID 162510)
-- Name: tiket tiket_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tiket
    ADD CONSTRAINT tiket_fk0 FOREIGN KEY (user_account_id) REFERENCES public.user_account(id);


--
-- TOC entry 2800 (class 2606 OID 162515)
-- Name: transaction transaction_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_fk0 FOREIGN KEY (user_account_id) REFERENCES public.user_account(id);


--
-- TOC entry 2801 (class 2606 OID 162520)
-- Name: user_account user_account_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account
    ADD CONSTRAINT user_account_fk0 FOREIGN KEY (country_id) REFERENCES public.country(id);


-- Completed on 2019-08-30 21:39:08

--
-- PostgreSQL database dump complete
--

