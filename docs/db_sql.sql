--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2
-- Dumped by pg_dump version 11.2

-- Started on 2019-08-23 17:33:15

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 211 (class 1259 OID 51171)
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
-- TOC entry 210 (class 1259 OID 51169)
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
-- TOC entry 2977 (class 0 OID 0)
-- Dependencies: 210
-- Name: action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.action_id_seq OWNED BY public.action.id;


--
-- TOC entry 209 (class 1259 OID 51158)
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
-- TOC entry 208 (class 1259 OID 51156)
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
-- TOC entry 2978 (class 0 OID 0)
-- Dependencies: 208
-- Name: card_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.card_id_seq OWNED BY public.card.id;


--
-- TOC entry 215 (class 1259 OID 51190)
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
-- TOC entry 214 (class 1259 OID 51188)
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
-- TOC entry 2979 (class 0 OID 0)
-- Dependencies: 214
-- Name: card_in_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.card_in_game_id_seq OWNED BY public.card_in_game.id;


--
-- TOC entry 213 (class 1259 OID 51182)
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
-- TOC entry 212 (class 1259 OID 51180)
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
-- TOC entry 2980 (class 0 OID 0)
-- Dependencies: 212
-- Name: chat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chat_id_seq OWNED BY public.chat.id;


--
-- TOC entry 219 (class 1259 OID 51212)
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
-- TOC entry 218 (class 1259 OID 51210)
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
-- TOC entry 2981 (class 0 OID 0)
-- Dependencies: 218
-- Name: chat_in_home_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chat_in_home_id_seq OWNED BY public.chat_in_home.id;


--
-- TOC entry 201 (class 1259 OID 51103)
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
-- TOC entry 200 (class 1259 OID 51101)
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
-- TOC entry 2982 (class 0 OID 0)
-- Dependencies: 200
-- Name: country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.country_id_seq OWNED BY public.country.id;


--
-- TOC entry 207 (class 1259 OID 51136)
-- Name: game; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.game (
    id integer NOT NULL,
    state character varying NOT NULL,
    bank numeric DEFAULT '0'::numeric NOT NULL,
    position1 boolean DEFAULT false NOT NULL,
    position2 boolean DEFAULT false NOT NULL,
    position3 boolean DEFAULT false NOT NULL,
    position4 boolean DEFAULT false NOT NULL,
    position5 boolean DEFAULT false NOT NULL,
    position6 boolean DEFAULT false NOT NULL,
    position7 boolean DEFAULT false NOT NULL,
    position8 boolean DEFAULT false NOT NULL,
    position9 boolean DEFAULT false NOT NULL,
    position10 boolean DEFAULT false NOT NULL,
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    number_of_players integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.game OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 51134)
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
-- TOC entry 2983 (class 0 OID 0)
-- Dependencies: 206
-- Name: game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.game_id_seq OWNED BY public.game.id;


--
-- TOC entry 217 (class 1259 OID 51201)
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
-- TOC entry 216 (class 1259 OID 51199)
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
-- TOC entry 2984 (class 0 OID 0)
-- Dependencies: 216
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.news_id_seq OWNED BY public.news.id;


--
-- TOC entry 205 (class 1259 OID 51125)
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
    updated timestamp without time zone NOT NULL
);


ALTER TABLE public.player OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 51123)
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
-- TOC entry 2985 (class 0 OID 0)
-- Dependencies: 204
-- Name: player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.player_id_seq OWNED BY public.player.id;


--
-- TOC entry 199 (class 1259 OID 51092)
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
-- TOC entry 198 (class 1259 OID 51090)
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
-- TOC entry 2986 (class 0 OID 0)
-- Dependencies: 198
-- Name: tiket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tiket_id_seq OWNED BY public.tiket.id;


--
-- TOC entry 203 (class 1259 OID 51114)
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
-- TOC entry 202 (class 1259 OID 51112)
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
-- TOC entry 2987 (class 0 OID 0)
-- Dependencies: 202
-- Name: transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaction_id_seq OWNED BY public.transaction.id;


--
-- TOC entry 197 (class 1259 OID 51077)
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
-- TOC entry 196 (class 1259 OID 51075)
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
-- TOC entry 2988 (class 0 OID 0)
-- Dependencies: 196
-- Name: user_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_account_id_seq OWNED BY public.user_account.id;


--
-- TOC entry 2780 (class 2604 OID 51174)
-- Name: action id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action ALTER COLUMN id SET DEFAULT nextval('public.action_id_seq'::regclass);


--
-- TOC entry 2779 (class 2604 OID 51161)
-- Name: card id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card ALTER COLUMN id SET DEFAULT nextval('public.card_id_seq'::regclass);


--
-- TOC entry 2782 (class 2604 OID 51193)
-- Name: card_in_game id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_in_game ALTER COLUMN id SET DEFAULT nextval('public.card_in_game_id_seq'::regclass);


--
-- TOC entry 2781 (class 2604 OID 51185)
-- Name: chat id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat ALTER COLUMN id SET DEFAULT nextval('public.chat_id_seq'::regclass);


--
-- TOC entry 2784 (class 2604 OID 51215)
-- Name: chat_in_home id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_in_home ALTER COLUMN id SET DEFAULT nextval('public.chat_in_home_id_seq'::regclass);


--
-- TOC entry 2763 (class 2604 OID 51106)
-- Name: country id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country ALTER COLUMN id SET DEFAULT nextval('public.country_id_seq'::regclass);


--
-- TOC entry 2766 (class 2604 OID 51139)
-- Name: game id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game ALTER COLUMN id SET DEFAULT nextval('public.game_id_seq'::regclass);


--
-- TOC entry 2783 (class 2604 OID 51204)
-- Name: news id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news ALTER COLUMN id SET DEFAULT nextval('public.news_id_seq'::regclass);


--
-- TOC entry 2765 (class 2604 OID 51128)
-- Name: player id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player ALTER COLUMN id SET DEFAULT nextval('public.player_id_seq'::regclass);


--
-- TOC entry 2762 (class 2604 OID 51095)
-- Name: tiket id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tiket ALTER COLUMN id SET DEFAULT nextval('public.tiket_id_seq'::regclass);


--
-- TOC entry 2764 (class 2604 OID 51117)
-- Name: transaction id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction ALTER COLUMN id SET DEFAULT nextval('public.transaction_id_seq'::regclass);


--
-- TOC entry 2761 (class 2604 OID 51080)
-- Name: user_account id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account ALTER COLUMN id SET DEFAULT nextval('public.user_account_id_seq'::regclass);


--
-- TOC entry 2963 (class 0 OID 51171)
-- Dependencies: 211
-- Data for Name: action; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2961 (class 0 OID 51158)
-- Dependencies: 209
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
-- TOC entry 2967 (class 0 OID 51190)
-- Dependencies: 215
-- Data for Name: card_in_game; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2965 (class 0 OID 51182)
-- Dependencies: 213
-- Data for Name: chat; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2971 (class 0 OID 51212)
-- Dependencies: 219
-- Data for Name: chat_in_home; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.chat_in_home (id, user_account_id, message, created, updated) VALUES (1, 1, 'TEST1', '2019-08-22 21:16:19.809', '2019-08-22 21:16:19.809');


--
-- TOC entry 2953 (class 0 OID 51103)
-- Dependencies: 201
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
-- TOC entry 2959 (class 0 OID 51136)
-- Dependencies: 207
-- Data for Name: game; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.game (id, state, bank, position1, position2, position3, position4, position5, position6, position7, position8, position9, position10, created, updated, number_of_players) VALUES (21, 'END', 0, false, false, false, false, false, false, false, false, false, false, '2019-08-23 09:37:07.331', '2019-08-23 09:37:07.331', 0);
INSERT INTO public.game (id, state, bank, position1, position2, position3, position4, position5, position6, position7, position8, position9, position10, created, updated, number_of_players) VALUES (22, 'END', 0, true, false, false, false, false, false, false, false, false, false, '2019-08-23 09:37:21.172', '2019-08-23 09:37:23.503', 0);
INSERT INTO public.game (id, state, bank, position1, position2, position3, position4, position5, position6, position7, position8, position9, position10, created, updated, number_of_players) VALUES (23, 'END', 0, true, true, false, false, false, false, false, false, false, false, '2019-08-23 10:05:31.923', '2019-08-23 10:05:42.845', 0);
INSERT INTO public.game (id, state, bank, position1, position2, position3, position4, position5, position6, position7, position8, position9, position10, created, updated, number_of_players) VALUES (24, 'END', 0, true, true, false, false, false, false, false, false, false, false, '2019-08-23 10:06:34.754', '2019-08-23 10:07:10.428', 0);
INSERT INTO public.game (id, state, bank, position1, position2, position3, position4, position5, position6, position7, position8, position9, position10, created, updated, number_of_players) VALUES (25, 'END', 0, true, true, false, false, false, false, false, false, false, false, '2019-08-23 10:07:52.106', '2019-08-23 10:08:01.195', 0);
INSERT INTO public.game (id, state, bank, position1, position2, position3, position4, position5, position6, position7, position8, position9, position10, created, updated, number_of_players) VALUES (26, 'END', 0, true, true, false, false, false, false, false, false, false, false, '2019-08-23 10:35:19.585', '2019-08-23 10:35:46.287', 0);
INSERT INTO public.game (id, state, bank, position1, position2, position3, position4, position5, position6, position7, position8, position9, position10, created, updated, number_of_players) VALUES (27, 'ACTIVE', 0, true, true, false, false, false, false, false, false, false, false, '2019-08-23 10:55:52.731', '2019-08-23 10:56:24.164', 2);
INSERT INTO public.game (id, state, bank, position1, position2, position3, position4, position5, position6, position7, position8, position9, position10, created, updated, number_of_players) VALUES (28, 'END', 0, false, false, false, false, false, false, false, false, false, false, '2019-08-23 15:30:02.558', '2019-08-23 15:30:02.558', 0);
INSERT INTO public.game (id, state, bank, position1, position2, position3, position4, position5, position6, position7, position8, position9, position10, created, updated, number_of_players) VALUES (29, 'END', 0, false, false, true, false, false, false, false, false, false, false, '2019-08-23 15:30:27.945', '2019-08-23 15:30:30.103', 1);
INSERT INTO public.game (id, state, bank, position1, position2, position3, position4, position5, position6, position7, position8, position9, position10, created, updated, number_of_players) VALUES (17, 'END', 0, true, true, false, false, false, false, false, false, false, false, '2019-08-22 23:53:16.555', '2019-08-23 16:15:39.524', 1);
INSERT INTO public.game (id, state, bank, position1, position2, position3, position4, position5, position6, position7, position8, position9, position10, created, updated, number_of_players) VALUES (18, 'END', 0, true, false, false, false, false, false, false, false, false, false, '2019-08-22 23:56:38.621', '2019-08-23 16:17:01.056', 1);
INSERT INTO public.game (id, state, bank, position1, position2, position3, position4, position5, position6, position7, position8, position9, position10, created, updated, number_of_players) VALUES (19, 'END', 0, true, true, false, false, false, false, false, false, false, false, '2019-08-22 23:57:04.937', '2019-08-23 16:22:46.597', 1);
INSERT INTO public.game (id, state, bank, position1, position2, position3, position4, position5, position6, position7, position8, position9, position10, created, updated, number_of_players) VALUES (20, 'ACTIVE', 0, true, true, true, false, false, false, false, false, false, false, '2019-08-23 00:01:45.89', '2019-08-23 16:31:04.228', 2);


--
-- TOC entry 2969 (class 0 OID 51201)
-- Dependencies: 217
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2957 (class 0 OID 51125)
-- Dependencies: 205
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.player (id, game_id, user_account_id, "position", in_game, state, stack, created, updated) VALUES (43, 20, 1, 3, true, 'INACTIVE', 1000, '2019-08-23 16:30:45.841', '2019-08-23 16:56:49.731');
INSERT INTO public.player (id, game_id, user_account_id, "position", in_game, state, stack, created, updated) VALUES (44, 20, 2, 2, true, 'INACTIVE', 1000, '2019-08-23 16:30:51.718', '2019-08-23 16:31:28.721');


--
-- TOC entry 2951 (class 0 OID 51092)
-- Dependencies: 199
-- Data for Name: tiket; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2955 (class 0 OID 51114)
-- Dependencies: 203
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1, 1, 1000, 'First bonus transaction', '2019-08-22 21:16:08.673', '2019-08-22 21:16:08.673');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (2, 2, 1000, 'First bonus transaction', '2019-08-22 23:03:27.854', '2019-08-22 23:03:27.854');


--
-- TOC entry 2949 (class 0 OID 51077)
-- Dependencies: 197
-- Data for Name: user_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_account (id, nickname, password, email, foto, country_id, user_role, user_status, sum_games, won_games, created, updated) VALUES (1, 'Admin', '$2a$10$QE39xe3rcgW8Cv6hXqQNLubg02aBmNtrfBDCMMwGMNEOA6oG0Lts.', 'aaaa@a.com', 'resources/img/foto.png', 107, 'MEMBER', 'ACTIVE', 0, 0, '2019-08-22 21:16:05.456', '2019-08-22 21:16:05.456');
INSERT INTO public.user_account (id, nickname, password, email, foto, country_id, user_role, user_status, sum_games, won_games, created, updated) VALUES (2, 'Test', '$2a$10$OgNTZQU7I.q7TzILBgU7He4IJJS.1DktexjLp./OgFD.qUUitz8mu', 'makaka@a.com', 'resources/img/foto.png', 1, 'MEMBER', 'ACTIVE', 0, 0, '2019-08-22 23:03:24.411', '2019-08-22 23:03:24.411');


--
-- TOC entry 2989 (class 0 OID 0)
-- Dependencies: 210
-- Name: action_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.action_id_seq', 1, false);


--
-- TOC entry 2990 (class 0 OID 0)
-- Dependencies: 208
-- Name: card_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.card_id_seq', 78, true);


--
-- TOC entry 2991 (class 0 OID 0)
-- Dependencies: 214
-- Name: card_in_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.card_in_game_id_seq', 1, false);


--
-- TOC entry 2992 (class 0 OID 0)
-- Dependencies: 212
-- Name: chat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_id_seq', 1, false);


--
-- TOC entry 2993 (class 0 OID 0)
-- Dependencies: 218
-- Name: chat_in_home_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_in_home_id_seq', 1, true);


--
-- TOC entry 2994 (class 0 OID 0)
-- Dependencies: 200
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_id_seq', 196, true);


--
-- TOC entry 2995 (class 0 OID 0)
-- Dependencies: 206
-- Name: game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.game_id_seq', 29, true);


--
-- TOC entry 2996 (class 0 OID 0)
-- Dependencies: 216
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.news_id_seq', 1, false);


--
-- TOC entry 2997 (class 0 OID 0)
-- Dependencies: 204
-- Name: player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.player_id_seq', 44, true);


--
-- TOC entry 2998 (class 0 OID 0)
-- Dependencies: 198
-- Name: tiket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tiket_id_seq', 1, false);


--
-- TOC entry 2999 (class 0 OID 0)
-- Dependencies: 202
-- Name: transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaction_id_seq', 2, true);


--
-- TOC entry 3000 (class 0 OID 0)
-- Dependencies: 196
-- Name: user_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_account_id_seq', 2, true);


--
-- TOC entry 2806 (class 2606 OID 51179)
-- Name: action action_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action
    ADD CONSTRAINT action_pk PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 51168)
-- Name: card card_filename_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card
    ADD CONSTRAINT card_filename_key UNIQUE (filename);


--
-- TOC entry 2810 (class 2606 OID 51198)
-- Name: card_in_game card_in_game_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_in_game
    ADD CONSTRAINT card_in_game_pk PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 51166)
-- Name: card card_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card
    ADD CONSTRAINT card_pk PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 51217)
-- Name: chat_in_home chat_in_home_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_in_home
    ADD CONSTRAINT chat_in_home_pk PRIMARY KEY (id);


--
-- TOC entry 2808 (class 2606 OID 51187)
-- Name: chat chat_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_pk PRIMARY KEY (id);


--
-- TOC entry 2794 (class 2606 OID 51111)
-- Name: country country_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pk PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 51155)
-- Name: game game_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_pk PRIMARY KEY (id);


--
-- TOC entry 2812 (class 2606 OID 51209)
-- Name: news news_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pk PRIMARY KEY (id);


--
-- TOC entry 2798 (class 2606 OID 51133)
-- Name: player player_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_pk PRIMARY KEY (id);


--
-- TOC entry 2792 (class 2606 OID 51100)
-- Name: tiket tiket_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tiket
    ADD CONSTRAINT tiket_pk PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 51122)
-- Name: transaction transaction_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pk PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 51089)
-- Name: user_account user_account_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account
    ADD CONSTRAINT user_account_email_key UNIQUE (email);


--
-- TOC entry 2788 (class 2606 OID 51087)
-- Name: user_account user_account_nickname_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account
    ADD CONSTRAINT user_account_nickname_key UNIQUE (nickname);


--
-- TOC entry 2790 (class 2606 OID 51085)
-- Name: user_account user_account_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account
    ADD CONSTRAINT user_account_pk PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 51243)
-- Name: action action_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action
    ADD CONSTRAINT action_fk0 FOREIGN KEY (player_id) REFERENCES public.player(id);


--
-- TOC entry 2823 (class 2606 OID 51258)
-- Name: card_in_game card_in_game_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_in_game
    ADD CONSTRAINT card_in_game_fk0 FOREIGN KEY (card_id) REFERENCES public.card(id);


--
-- TOC entry 2824 (class 2606 OID 51263)
-- Name: card_in_game card_in_game_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_in_game
    ADD CONSTRAINT card_in_game_fk1 FOREIGN KEY (game_id) REFERENCES public.game(id);


--
-- TOC entry 2825 (class 2606 OID 51268)
-- Name: card_in_game card_in_game_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_in_game
    ADD CONSTRAINT card_in_game_fk2 FOREIGN KEY (player_id) REFERENCES public.player(id);


--
-- TOC entry 2821 (class 2606 OID 51248)
-- Name: chat chat_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_fk0 FOREIGN KEY (game_id) REFERENCES public.game(id);


--
-- TOC entry 2822 (class 2606 OID 51253)
-- Name: chat chat_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_fk1 FOREIGN KEY (user_account_id) REFERENCES public.user_account(id);


--
-- TOC entry 2826 (class 2606 OID 51273)
-- Name: chat_in_home chat_in_home_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_in_home
    ADD CONSTRAINT chat_in_home_fk0 FOREIGN KEY (user_account_id) REFERENCES public.user_account(id);


--
-- TOC entry 2818 (class 2606 OID 51233)
-- Name: player player_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_fk0 FOREIGN KEY (game_id) REFERENCES public.game(id);


--
-- TOC entry 2819 (class 2606 OID 51238)
-- Name: player player_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_fk1 FOREIGN KEY (user_account_id) REFERENCES public.user_account(id);


--
-- TOC entry 2816 (class 2606 OID 51223)
-- Name: tiket tiket_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tiket
    ADD CONSTRAINT tiket_fk0 FOREIGN KEY (user_account_id) REFERENCES public.user_account(id);


--
-- TOC entry 2817 (class 2606 OID 51228)
-- Name: transaction transaction_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_fk0 FOREIGN KEY (user_account_id) REFERENCES public.user_account(id);


--
-- TOC entry 2815 (class 2606 OID 51218)
-- Name: user_account user_account_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account
    ADD CONSTRAINT user_account_fk0 FOREIGN KEY (country_id) REFERENCES public.country(id);


-- Completed on 2019-08-23 17:33:16

--
-- PostgreSQL database dump complete
--

