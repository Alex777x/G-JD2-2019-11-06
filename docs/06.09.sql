--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2
-- Dumped by pg_dump version 11.2

-- Started on 2019-09-06 15:50:07

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
-- TOC entry 196 (class 1259 OID 59267)
-- Name: action; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.action (
    id integer NOT NULL,
    player_id integer NOT NULL,
    bet numeric DEFAULT 0 NOT NULL,
    call numeric DEFAULT 0 NOT NULL,
    raise numeric DEFAULT 0 NOT NULL,
    fold boolean DEFAULT false NOT NULL,
    check_check boolean DEFAULT false NOT NULL,
    all_in numeric DEFAULT 0 NOT NULL,
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL
);


ALTER TABLE public.action OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 59273)
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
-- TOC entry 2973 (class 0 OID 0)
-- Dependencies: 197
-- Name: action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.action_id_seq OWNED BY public.action.id;


--
-- TOC entry 198 (class 1259 OID 59275)
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
-- TOC entry 199 (class 1259 OID 59281)
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
-- TOC entry 2974 (class 0 OID 0)
-- Dependencies: 199
-- Name: card_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.card_id_seq OWNED BY public.card.id;


--
-- TOC entry 200 (class 1259 OID 59283)
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
-- TOC entry 201 (class 1259 OID 59289)
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
-- TOC entry 2975 (class 0 OID 0)
-- Dependencies: 201
-- Name: card_in_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.card_in_game_id_seq OWNED BY public.card_in_game.id;


--
-- TOC entry 202 (class 1259 OID 59291)
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
-- TOC entry 203 (class 1259 OID 59294)
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
-- TOC entry 2976 (class 0 OID 0)
-- Dependencies: 203
-- Name: chat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chat_id_seq OWNED BY public.chat.id;


--
-- TOC entry 204 (class 1259 OID 59296)
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
-- TOC entry 205 (class 1259 OID 59299)
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
-- TOC entry 2977 (class 0 OID 0)
-- Dependencies: 205
-- Name: chat_in_home_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chat_in_home_id_seq OWNED BY public.chat_in_home.id;


--
-- TOC entry 206 (class 1259 OID 59301)
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
-- TOC entry 207 (class 1259 OID 59307)
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
-- TOC entry 2978 (class 0 OID 0)
-- Dependencies: 207
-- Name: country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.country_id_seq OWNED BY public.country.id;


--
-- TOC entry 208 (class 1259 OID 59309)
-- Name: game; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.game (
    id integer NOT NULL,
    state character varying NOT NULL,
    bank numeric DEFAULT '0'::numeric NOT NULL,
    created timestamp without time zone NOT NULL,
    updated timestamp without time zone NOT NULL,
    active_player_id integer DEFAULT 0,
    timestamp_end_step bigint
);


ALTER TABLE public.game OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 59317)
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
-- TOC entry 2979 (class 0 OID 0)
-- Dependencies: 209
-- Name: game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.game_id_seq OWNED BY public.game.id;


--
-- TOC entry 210 (class 1259 OID 59319)
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
-- TOC entry 211 (class 1259 OID 59325)
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
-- TOC entry 2980 (class 0 OID 0)
-- Dependencies: 211
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.news_id_seq OWNED BY public.news.id;


--
-- TOC entry 212 (class 1259 OID 59327)
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
    card2 character varying,
    curent_bet integer
);


ALTER TABLE public.player OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 59333)
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
-- TOC entry 2981 (class 0 OID 0)
-- Dependencies: 213
-- Name: player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.player_id_seq OWNED BY public.player.id;


--
-- TOC entry 214 (class 1259 OID 59335)
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
-- TOC entry 215 (class 1259 OID 59341)
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
-- TOC entry 2982 (class 0 OID 0)
-- Dependencies: 215
-- Name: tiket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tiket_id_seq OWNED BY public.tiket.id;


--
-- TOC entry 216 (class 1259 OID 59343)
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
-- TOC entry 217 (class 1259 OID 59349)
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
-- TOC entry 2983 (class 0 OID 0)
-- Dependencies: 217
-- Name: transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaction_id_seq OWNED BY public.transaction.id;


--
-- TOC entry 218 (class 1259 OID 59351)
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
-- TOC entry 219 (class 1259 OID 59357)
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
-- TOC entry 2984 (class 0 OID 0)
-- Dependencies: 219
-- Name: user_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_account_id_seq OWNED BY public.user_account.id;


--
-- TOC entry 2761 (class 2604 OID 59359)
-- Name: action id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action ALTER COLUMN id SET DEFAULT nextval('public.action_id_seq'::regclass);


--
-- TOC entry 2768 (class 2604 OID 59360)
-- Name: card id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card ALTER COLUMN id SET DEFAULT nextval('public.card_id_seq'::regclass);


--
-- TOC entry 2769 (class 2604 OID 59361)
-- Name: card_in_game id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_in_game ALTER COLUMN id SET DEFAULT nextval('public.card_in_game_id_seq'::regclass);


--
-- TOC entry 2770 (class 2604 OID 59362)
-- Name: chat id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat ALTER COLUMN id SET DEFAULT nextval('public.chat_id_seq'::regclass);


--
-- TOC entry 2771 (class 2604 OID 59363)
-- Name: chat_in_home id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_in_home ALTER COLUMN id SET DEFAULT nextval('public.chat_in_home_id_seq'::regclass);


--
-- TOC entry 2772 (class 2604 OID 59364)
-- Name: country id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country ALTER COLUMN id SET DEFAULT nextval('public.country_id_seq'::regclass);


--
-- TOC entry 2775 (class 2604 OID 59365)
-- Name: game id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game ALTER COLUMN id SET DEFAULT nextval('public.game_id_seq'::regclass);


--
-- TOC entry 2776 (class 2604 OID 59366)
-- Name: news id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news ALTER COLUMN id SET DEFAULT nextval('public.news_id_seq'::regclass);


--
-- TOC entry 2777 (class 2604 OID 59367)
-- Name: player id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player ALTER COLUMN id SET DEFAULT nextval('public.player_id_seq'::regclass);


--
-- TOC entry 2778 (class 2604 OID 59368)
-- Name: tiket id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tiket ALTER COLUMN id SET DEFAULT nextval('public.tiket_id_seq'::regclass);


--
-- TOC entry 2779 (class 2604 OID 59369)
-- Name: transaction id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction ALTER COLUMN id SET DEFAULT nextval('public.transaction_id_seq'::regclass);


--
-- TOC entry 2780 (class 2604 OID 59370)
-- Name: user_account id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account ALTER COLUMN id SET DEFAULT nextval('public.user_account_id_seq'::regclass);


--
-- TOC entry 2944 (class 0 OID 59267)
-- Dependencies: 196
-- Data for Name: action; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2946 (class 0 OID 59275)
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
-- TOC entry 2948 (class 0 OID 59283)
-- Dependencies: 200
-- Data for Name: card_in_game; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16643, 33, 207, NULL, 'INDECK', '2019-09-06 14:37:53.998', '2019-09-06 14:37:53.998');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16645, 67, 207, NULL, 'INDECK', '2019-09-06 14:37:54.008', '2019-09-06 14:37:54.008');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16646, 38, 207, NULL, 'INDECK', '2019-09-06 14:37:54.013', '2019-09-06 14:37:54.013');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16647, 78, 207, NULL, 'INDECK', '2019-09-06 14:37:54.018', '2019-09-06 14:37:54.018');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16648, 61, 207, NULL, 'INDECK', '2019-09-06 14:37:54.023', '2019-09-06 14:37:54.023');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16649, 41, 207, NULL, 'INDECK', '2019-09-06 14:37:54.03', '2019-09-06 14:37:54.03');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16650, 77, 207, NULL, 'INDECK', '2019-09-06 14:37:54.037', '2019-09-06 14:37:54.037');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16651, 30, 207, NULL, 'INDECK', '2019-09-06 14:37:54.042', '2019-09-06 14:37:54.042');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16652, 45, 207, NULL, 'INDECK', '2019-09-06 14:37:54.05', '2019-09-06 14:37:54.05');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16653, 51, 207, NULL, 'INDECK', '2019-09-06 14:37:54.057', '2019-09-06 14:37:54.057');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16654, 73, 207, NULL, 'INDECK', '2019-09-06 14:37:54.064', '2019-09-06 14:37:54.064');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16655, 60, 207, NULL, 'INDECK', '2019-09-06 14:37:54.07', '2019-09-06 14:37:54.07');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16656, 64, 207, NULL, 'INDECK', '2019-09-06 14:37:54.078', '2019-09-06 14:37:54.078');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16657, 57, 207, NULL, 'INDECK', '2019-09-06 14:37:54.086', '2019-09-06 14:37:54.086');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16658, 29, 207, NULL, 'INDECK', '2019-09-06 14:37:54.093', '2019-09-06 14:37:54.093');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16659, 31, 207, NULL, 'INDECK', '2019-09-06 14:37:54.098', '2019-09-06 14:37:54.098');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16660, 59, 207, NULL, 'INDECK', '2019-09-06 14:37:54.104', '2019-09-06 14:37:54.104');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16661, 27, 207, NULL, 'INDECK', '2019-09-06 14:37:54.11', '2019-09-06 14:37:54.11');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16662, 54, 207, NULL, 'INDECK', '2019-09-06 14:37:54.115', '2019-09-06 14:37:54.115');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16663, 53, 207, NULL, 'INDECK', '2019-09-06 14:37:54.119', '2019-09-06 14:37:54.119');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16665, 75, 207, NULL, 'INDECK', '2019-09-06 14:37:54.158', '2019-09-06 14:37:54.158');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16666, 66, 207, NULL, 'INDECK', '2019-09-06 14:37:54.205', '2019-09-06 14:37:54.205');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16667, 63, 207, NULL, 'INDECK', '2019-09-06 14:37:54.21', '2019-09-06 14:37:54.21');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16668, 37, 207, NULL, 'INDECK', '2019-09-06 14:37:54.215', '2019-09-06 14:37:54.215');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16669, 47, 207, NULL, 'INDECK', '2019-09-06 14:37:54.219', '2019-09-06 14:37:54.219');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16670, 55, 207, NULL, 'INDECK', '2019-09-06 14:37:54.225', '2019-09-06 14:37:54.225');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16671, 35, 207, NULL, 'INDECK', '2019-09-06 14:37:54.23', '2019-09-06 14:37:54.23');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16672, 42, 207, NULL, 'INDECK', '2019-09-06 14:37:54.235', '2019-09-06 14:37:54.235');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16673, 76, 207, NULL, 'INDECK', '2019-09-06 14:37:54.24', '2019-09-06 14:37:54.24');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16674, 70, 207, NULL, 'INDECK', '2019-09-06 14:37:54.245', '2019-09-06 14:37:54.245');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16675, 49, 207, NULL, 'INDECK', '2019-09-06 14:37:54.25', '2019-09-06 14:37:54.25');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16676, 28, 207, NULL, 'INDECK', '2019-09-06 14:37:54.257', '2019-09-06 14:37:54.257');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16678, 36, 207, NULL, 'INDECK', '2019-09-06 14:37:54.266', '2019-09-06 14:37:54.266');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16679, 39, 207, NULL, 'INDECK', '2019-09-06 14:37:54.272', '2019-09-06 14:37:54.272');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16680, 44, 207, NULL, 'INDECK', '2019-09-06 14:37:54.276', '2019-09-06 14:37:54.276');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16681, 62, 207, NULL, 'INDECK', '2019-09-06 14:37:54.28', '2019-09-06 14:37:54.28');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16682, 71, 207, NULL, 'INDECK', '2019-09-06 14:37:54.284', '2019-09-06 14:37:54.284');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16683, 34, 207, NULL, 'INDECK', '2019-09-06 14:37:54.289', '2019-09-06 14:37:54.289');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16684, 65, 207, NULL, 'INDECK', '2019-09-06 14:37:54.297', '2019-09-06 14:37:54.297');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16685, 58, 207, NULL, 'INDECK', '2019-09-06 14:37:54.304', '2019-09-06 14:37:54.304');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16686, 52, 207, NULL, 'INDECK', '2019-09-06 14:37:54.326', '2019-09-06 14:37:54.326');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16687, 43, 207, NULL, 'INDECK', '2019-09-06 14:37:54.339', '2019-09-06 14:37:54.339');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16688, 74, 207, NULL, 'INDECK', '2019-09-06 14:37:54.347', '2019-09-06 14:37:54.347');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16690, 50, 207, NULL, 'INDECK', '2019-09-06 14:37:54.361', '2019-09-06 14:37:54.361');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16691, 72, 207, NULL, 'INDECK', '2019-09-06 14:37:54.367', '2019-09-06 14:37:54.367');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16692, 56, 207, NULL, 'INDECK', '2019-09-06 14:37:54.377', '2019-09-06 14:37:54.377');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16644, 40, 207, 453, 'PLAYERCARDCLOSED', '2019-09-06 14:37:54.002', '2019-09-06 14:37:54.425');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16677, 69, 207, 453, 'PLAYERCARDCLOSED', '2019-09-06 14:37:54.262', '2019-09-06 14:37:54.433');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16642, 68, 207, 451, 'PLAYERCARDCLOSED', '2019-09-06 14:37:53.991', '2019-09-06 14:37:54.444');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16689, 48, 207, 451, 'PLAYERCARDCLOSED', '2019-09-06 14:37:54.354', '2019-09-06 14:37:54.45');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16664, 46, 207, 452, 'PLAYERCARDCLOSED', '2019-09-06 14:37:54.126', '2019-09-06 14:37:54.462');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (16693, 32, 207, 452, 'PLAYERCARDCLOSED', '2019-09-06 14:37:54.387', '2019-09-06 14:37:54.471');


--
-- TOC entry 2950 (class 0 OID 59291)
-- Dependencies: 202
-- Data for Name: chat; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2952 (class 0 OID 59296)
-- Dependencies: 204
-- Data for Name: chat_in_home; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.chat_in_home (id, user_account_id, message, created, updated) VALUES (1, 1, 'TEST1', '2019-08-22 21:16:19.809', '2019-08-22 21:16:19.809');
INSERT INTO public.chat_in_home (id, user_account_id, message, created, updated) VALUES (2, 1, 'Hello', '2019-08-23 18:37:08.766', '2019-08-23 18:37:08.766');
INSERT INTO public.chat_in_home (id, user_account_id, message, created, updated) VALUES (3, 1, 'TEST2', '2019-08-23 18:39:08.066', '2019-08-23 18:39:08.066');


--
-- TOC entry 2954 (class 0 OID 59301)
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
-- TOC entry 2956 (class 0 OID 59309)
-- Dependencies: 208
-- Data for Name: game; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.game (id, state, bank, created, updated, active_player_id, timestamp_end_step) VALUES (207, 'ACTIVE', 15, '2019-09-06 14:37:17.609', '2019-09-06 14:37:56.05', 452, 1567769891050);


--
-- TOC entry 2958 (class 0 OID 59319)
-- Dependencies: 210
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2960 (class 0 OID 59327)
-- Dependencies: 212
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.player (id, game_id, user_account_id, "position", in_game, state, stack, created, updated, card1, card2, curent_bet) VALUES (452, 207, 2, 2, true, 'USUAL', 970, '2019-09-06 14:37:26.977', '2019-09-06 15:48:53.911', '/resources/img/cards/5OfSpades.png', '/resources/img/cards/2OfDiamonds.png', 0);
INSERT INTO public.player (id, game_id, user_account_id, "position", in_game, state, stack, created, updated, card1, card2, curent_bet) VALUES (451, 207, 1, 1, true, 'BIGBLIND', 1105, '2019-09-06 14:37:19.094', '2019-09-06 15:48:59.154', '/resources/img/cards/jackOfDiamonds.png', '/resources/img/cards/6OfDiamonds.png', 10);
INSERT INTO public.player (id, game_id, user_account_id, "position", in_game, state, stack, created, updated, card1, card2, curent_bet) VALUES (453, 207, 3, 0, false, 'INACTIVE', 855, '2019-09-06 14:37:41.559', '2019-09-06 15:39:47.56', '/resources/img/cards/4OfDiamonds.png', '/resources/img/cards/jackOfHearts.png', 5);


--
-- TOC entry 2962 (class 0 OID 59335)
-- Dependencies: 214
-- Data for Name: tiket; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2964 (class 0 OID 59343)
-- Dependencies: 216
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (3, 3, 1000, 'First bonus transaction', '2019-09-03 13:17:26.287', '2019-09-03 13:17:26.287');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (2, 2, 1000, 'First bonus transaction', '2019-08-22 23:03:27.854', '2019-09-03 14:59:50.02');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1, 1, 1000, 'First bonus transaction', '2019-08-22 21:16:08.673', '2019-09-03 14:59:50.028');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (16, 1, -10, 'preflop', '2019-09-03 16:14:54.93', '2019-09-03 16:14:54.93');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (17, 2, -10, 'preflop', '2019-09-03 16:14:54.931', '2019-09-03 16:14:54.931');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (18, 1, -10, 'preflop', '2019-09-03 16:16:18.838', '2019-09-03 16:16:18.838');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (19, 2, -10, 'preflop', '2019-09-03 16:16:18.84', '2019-09-03 16:16:18.84');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (20, 1, -10, 'preflop', '2019-09-03 17:06:35.361', '2019-09-03 17:06:35.361');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (21, 2, -10, 'preflop', '2019-09-03 17:06:35.364', '2019-09-03 17:06:35.364');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (22, 2, -10, 'preflop', '2019-09-04 09:30:36.599', '2019-09-04 09:30:36.599');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (23, 1, -10, 'preflop', '2019-09-04 09:30:36.605', '2019-09-04 09:30:36.605');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (24, 2, -10, 'preflop', '2019-09-04 09:30:37.145', '2019-09-04 09:30:37.145');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (25, 1, -10, 'preflop', '2019-09-04 09:30:37.148', '2019-09-04 09:30:37.148');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (26, 1, 5, 'smallblind', '2019-09-04 13:32:24.822', '2019-09-04 13:32:24.822');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (27, 2, 10, 'bigblind', '2019-09-04 13:32:24.84', '2019-09-04 13:32:24.84');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (28, 1, 5, 'smallblind', '2019-09-04 13:32:25.437', '2019-09-04 13:32:25.437');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (29, 2, 10, 'bigblind', '2019-09-04 13:32:25.449', '2019-09-04 13:32:25.449');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (30, 1, 5, 'smallblind', '2019-09-04 13:32:26.824', '2019-09-04 13:32:26.824');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (31, 2, 10, 'bigblind', '2019-09-04 13:32:26.834', '2019-09-04 13:32:26.834');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (32, 1, 5, 'smallblind', '2019-09-04 13:32:27.43', '2019-09-04 13:32:27.43');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (33, 2, 10, 'bigblind', '2019-09-04 13:32:27.442', '2019-09-04 13:32:27.442');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (34, 1, 5, 'smallblind', '2019-09-04 13:32:28.83', '2019-09-04 13:32:28.83');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (35, 2, 10, 'bigblind', '2019-09-04 13:32:28.841', '2019-09-04 13:32:28.841');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (36, 1, 5, 'smallblind', '2019-09-04 13:32:29.432', '2019-09-04 13:32:29.432');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (37, 2, 10, 'bigblind', '2019-09-04 13:32:29.442', '2019-09-04 13:32:29.442');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (38, 1, 5, 'smallblind', '2019-09-04 13:32:30.814', '2019-09-04 13:32:30.814');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (39, 2, 10, 'bigblind', '2019-09-04 13:32:30.824', '2019-09-04 13:32:30.824');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (40, 1, 5, 'smallblind', '2019-09-04 13:32:31.405', '2019-09-04 13:32:31.405');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (41, 2, 10, 'bigblind', '2019-09-04 13:32:31.414', '2019-09-04 13:32:31.414');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (42, 1, 5, 'smallblind', '2019-09-04 13:32:32.912', '2019-09-04 13:32:32.912');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (43, 2, 10, 'bigblind', '2019-09-04 13:32:32.923', '2019-09-04 13:32:32.923');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (44, 1, 5, 'smallblind', '2019-09-04 13:32:33.416', '2019-09-04 13:32:33.416');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (45, 2, 10, 'bigblind', '2019-09-04 13:32:33.44', '2019-09-04 13:32:33.44');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (46, 1, 5, 'smallblind', '2019-09-04 13:32:34.904', '2019-09-04 13:32:34.904');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (47, 2, 10, 'bigblind', '2019-09-04 13:32:34.914', '2019-09-04 13:32:34.914');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (48, 1, 5, 'smallblind', '2019-09-04 13:32:35.429', '2019-09-04 13:32:35.429');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (49, 2, 10, 'bigblind', '2019-09-04 13:32:35.441', '2019-09-04 13:32:35.441');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (50, 1, 5, 'smallblind', '2019-09-04 13:32:36.819', '2019-09-04 13:32:36.819');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (51, 2, 10, 'bigblind', '2019-09-04 13:32:36.829', '2019-09-04 13:32:36.829');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (52, 1, 5, 'smallblind', '2019-09-04 13:32:37.418', '2019-09-04 13:32:37.418');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (53, 2, 10, 'bigblind', '2019-09-04 13:32:37.427', '2019-09-04 13:32:37.427');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (54, 1, 5, 'smallblind', '2019-09-04 13:32:38.797', '2019-09-04 13:32:38.797');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (55, 2, 10, 'bigblind', '2019-09-04 13:32:38.807', '2019-09-04 13:32:38.807');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (56, 1, 5, 'smallblind', '2019-09-04 13:32:39.428', '2019-09-04 13:32:39.428');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (57, 2, 10, 'bigblind', '2019-09-04 13:32:39.569', '2019-09-04 13:32:39.569');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (58, 1, 5, 'smallblind', '2019-09-04 13:32:40.812', '2019-09-04 13:32:40.812');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (59, 2, 10, 'bigblind', '2019-09-04 13:32:40.823', '2019-09-04 13:32:40.823');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (60, 1, 5, 'smallblind', '2019-09-04 13:32:41.425', '2019-09-04 13:32:41.425');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (61, 2, 10, 'bigblind', '2019-09-04 13:32:41.434', '2019-09-04 13:32:41.434');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (62, 1, 5, 'smallblind', '2019-09-04 13:32:42.813', '2019-09-04 13:32:42.813');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (63, 2, 10, 'bigblind', '2019-09-04 13:32:42.821', '2019-09-04 13:32:42.821');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (64, 1, 5, 'smallblind', '2019-09-04 13:32:43.405', '2019-09-04 13:32:43.405');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (65, 2, 10, 'bigblind', '2019-09-04 13:32:43.414', '2019-09-04 13:32:43.414');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (66, 1, 5, 'smallblind', '2019-09-04 13:32:44.817', '2019-09-04 13:32:44.817');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (67, 2, 10, 'bigblind', '2019-09-04 13:32:44.825', '2019-09-04 13:32:44.825');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (68, 1, 5, 'smallblind', '2019-09-04 13:32:45.423', '2019-09-04 13:32:45.423');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (69, 2, 10, 'bigblind', '2019-09-04 13:32:45.433', '2019-09-04 13:32:45.433');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (70, 1, 5, 'smallblind', '2019-09-04 13:32:46.82', '2019-09-04 13:32:46.82');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (71, 2, 10, 'bigblind', '2019-09-04 13:32:46.836', '2019-09-04 13:32:46.836');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (72, 1, 5, 'smallblind', '2019-09-04 13:32:47.431', '2019-09-04 13:32:47.431');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (73, 2, 10, 'bigblind', '2019-09-04 13:32:47.44', '2019-09-04 13:32:47.44');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (74, 1, 5, 'smallblind', '2019-09-04 13:32:48.798', '2019-09-04 13:32:48.798');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (75, 2, 10, 'bigblind', '2019-09-04 13:32:48.809', '2019-09-04 13:32:48.809');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (76, 1, 5, 'smallblind', '2019-09-04 13:32:49.424', '2019-09-04 13:32:49.424');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (77, 2, 10, 'bigblind', '2019-09-04 13:32:49.438', '2019-09-04 13:32:49.438');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (78, 1, 5, 'smallblind', '2019-09-04 13:32:50.818', '2019-09-04 13:32:50.818');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (79, 2, 10, 'bigblind', '2019-09-04 13:32:50.827', '2019-09-04 13:32:50.827');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (80, 1, 5, 'smallblind', '2019-09-04 13:32:51.427', '2019-09-04 13:32:51.427');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (81, 2, 10, 'bigblind', '2019-09-04 13:32:51.435', '2019-09-04 13:32:51.435');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (82, 1, 5, 'smallblind', '2019-09-04 13:32:52.807', '2019-09-04 13:32:52.807');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (83, 2, 10, 'bigblind', '2019-09-04 13:32:52.815', '2019-09-04 13:32:52.815');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (84, 1, 5, 'smallblind', '2019-09-04 13:32:53.423', '2019-09-04 13:32:53.423');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (85, 2, 10, 'bigblind', '2019-09-04 13:32:53.434', '2019-09-04 13:32:53.434');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (86, 1, 5, 'smallblind', '2019-09-04 13:32:54.814', '2019-09-04 13:32:54.814');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (87, 2, 10, 'bigblind', '2019-09-04 13:32:54.823', '2019-09-04 13:32:54.823');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (88, 1, 5, 'smallblind', '2019-09-04 13:32:55.434', '2019-09-04 13:32:55.434');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (89, 2, 10, 'bigblind', '2019-09-04 13:32:55.444', '2019-09-04 13:32:55.444');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (90, 1, 5, 'smallblind', '2019-09-04 13:32:56.905', '2019-09-04 13:32:56.905');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (91, 2, 10, 'bigblind', '2019-09-04 13:32:56.915', '2019-09-04 13:32:56.915');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (92, 1, 5, 'smallblind', '2019-09-04 13:32:57.408', '2019-09-04 13:32:57.408');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (93, 2, 10, 'bigblind', '2019-09-04 13:32:57.417', '2019-09-04 13:32:57.417');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (94, 1, 5, 'smallblind', '2019-09-04 13:32:58.972', '2019-09-04 13:32:58.972');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (95, 2, 10, 'bigblind', '2019-09-04 13:32:58.984', '2019-09-04 13:32:58.984');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (96, 1, 5, 'smallblind', '2019-09-04 13:32:59.418', '2019-09-04 13:32:59.418');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (97, 2, 10, 'bigblind', '2019-09-04 13:32:59.428', '2019-09-04 13:32:59.428');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (98, 1, 5, 'smallblind', '2019-09-04 13:33:00.919', '2019-09-04 13:33:00.919');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (99, 2, 10, 'bigblind', '2019-09-04 13:33:00.933', '2019-09-04 13:33:00.933');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (100, 1, 5, 'smallblind', '2019-09-04 13:33:01.408', '2019-09-04 13:33:01.408');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (101, 2, 10, 'bigblind', '2019-09-04 13:33:01.415', '2019-09-04 13:33:01.415');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (102, 1, 5, 'smallblind', '2019-09-04 13:33:02.915', '2019-09-04 13:33:02.915');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (103, 2, 10, 'bigblind', '2019-09-04 13:33:03.021', '2019-09-04 13:33:03.021');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (104, 1, 5, 'smallblind', '2019-09-04 13:33:03.426', '2019-09-04 13:33:03.426');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (105, 2, 10, 'bigblind', '2019-09-04 13:33:03.444', '2019-09-04 13:33:03.444');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (106, 1, 5, 'smallblind', '2019-09-04 13:33:04.899', '2019-09-04 13:33:04.899');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (107, 2, 10, 'bigblind', '2019-09-04 13:33:04.906', '2019-09-04 13:33:04.906');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (108, 1, 5, 'smallblind', '2019-09-04 13:33:05.416', '2019-09-04 13:33:05.416');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (109, 2, 10, 'bigblind', '2019-09-04 13:33:05.426', '2019-09-04 13:33:05.426');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (110, 1, 5, 'smallblind', '2019-09-04 13:33:06.909', '2019-09-04 13:33:06.909');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (111, 2, 10, 'bigblind', '2019-09-04 13:33:06.919', '2019-09-04 13:33:06.919');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (112, 1, 5, 'smallblind', '2019-09-04 13:33:07.408', '2019-09-04 13:33:07.408');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (113, 2, 10, 'bigblind', '2019-09-04 13:33:07.417', '2019-09-04 13:33:07.417');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (114, 1, 5, 'smallblind', '2019-09-04 13:33:08.913', '2019-09-04 13:33:08.913');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (115, 2, 10, 'bigblind', '2019-09-04 13:33:08.92', '2019-09-04 13:33:08.92');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (116, 1, 5, 'smallblind', '2019-09-04 13:33:09.408', '2019-09-04 13:33:09.408');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (117, 2, 10, 'bigblind', '2019-09-04 13:33:09.417', '2019-09-04 13:33:09.417');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (118, 1, 5, 'smallblind', '2019-09-04 13:33:10.925', '2019-09-04 13:33:10.925');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (119, 2, 10, 'bigblind', '2019-09-04 13:33:10.935', '2019-09-04 13:33:10.935');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (120, 1, 5, 'smallblind', '2019-09-04 13:33:11.412', '2019-09-04 13:33:11.412');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (121, 2, 10, 'bigblind', '2019-09-04 13:33:11.42', '2019-09-04 13:33:11.42');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (122, 1, 5, 'smallblind', '2019-09-04 13:33:12.921', '2019-09-04 13:33:12.921');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (123, 2, 10, 'bigblind', '2019-09-04 13:33:12.932', '2019-09-04 13:33:12.932');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (124, 1, 5, 'smallblind', '2019-09-04 13:33:13.408', '2019-09-04 13:33:13.408');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (125, 2, 10, 'bigblind', '2019-09-04 13:33:13.416', '2019-09-04 13:33:13.416');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (126, 1, 5, 'smallblind', '2019-09-04 13:33:14.913', '2019-09-04 13:33:14.913');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (127, 2, 10, 'bigblind', '2019-09-04 13:33:14.922', '2019-09-04 13:33:14.922');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (128, 1, 5, 'smallblind', '2019-09-04 13:33:15.413', '2019-09-04 13:33:15.413');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (129, 2, 10, 'bigblind', '2019-09-04 13:33:15.421', '2019-09-04 13:33:15.421');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (130, 1, 5, 'smallblind', '2019-09-04 13:33:16.898', '2019-09-04 13:33:16.898');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (131, 2, 10, 'bigblind', '2019-09-04 13:33:16.905', '2019-09-04 13:33:16.905');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (132, 1, 5, 'smallblind', '2019-09-04 13:33:17.408', '2019-09-04 13:33:17.408');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (133, 2, 10, 'bigblind', '2019-09-04 13:33:17.415', '2019-09-04 13:33:17.415');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (134, 1, 5, 'smallblind', '2019-09-04 13:33:18.903', '2019-09-04 13:33:18.903');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (135, 2, 10, 'bigblind', '2019-09-04 13:33:18.911', '2019-09-04 13:33:18.911');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (136, 1, 5, 'smallblind', '2019-09-04 13:33:19.429', '2019-09-04 13:33:19.429');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (137, 2, 10, 'bigblind', '2019-09-04 13:33:19.439', '2019-09-04 13:33:19.439');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (138, 1, 5, 'smallblind', '2019-09-04 13:33:20.913', '2019-09-04 13:33:20.913');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (139, 2, 10, 'bigblind', '2019-09-04 13:33:20.921', '2019-09-04 13:33:20.921');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (140, 1, 5, 'smallblind', '2019-09-04 13:33:21.417', '2019-09-04 13:33:21.417');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (141, 2, 10, 'bigblind', '2019-09-04 13:33:21.425', '2019-09-04 13:33:21.425');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (142, 1, 5, 'smallblind', '2019-09-04 13:33:22.917', '2019-09-04 13:33:22.917');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (143, 2, 10, 'bigblind', '2019-09-04 13:33:22.925', '2019-09-04 13:33:22.925');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (144, 1, 5, 'smallblind', '2019-09-04 13:33:23.429', '2019-09-04 13:33:23.429');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (145, 2, 10, 'bigblind', '2019-09-04 13:33:23.435', '2019-09-04 13:33:23.435');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (146, 1, 5, 'smallblind', '2019-09-04 13:33:24.919', '2019-09-04 13:33:24.919');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (147, 2, 10, 'bigblind', '2019-09-04 13:33:24.931', '2019-09-04 13:33:24.931');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (148, 1, 5, 'smallblind', '2019-09-04 13:33:25.412', '2019-09-04 13:33:25.412');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (149, 2, 10, 'bigblind', '2019-09-04 13:33:25.42', '2019-09-04 13:33:25.42');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (150, 1, 5, 'smallblind', '2019-09-04 13:33:26.919', '2019-09-04 13:33:26.919');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (151, 2, 10, 'bigblind', '2019-09-04 13:33:26.935', '2019-09-04 13:33:26.935');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (152, 1, 5, 'smallblind', '2019-09-04 13:33:27.424', '2019-09-04 13:33:27.424');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (153, 2, 10, 'bigblind', '2019-09-04 13:33:27.433', '2019-09-04 13:33:27.433');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (154, 1, 5, 'smallblind', '2019-09-04 13:33:28.915', '2019-09-04 13:33:28.915');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (155, 2, 10, 'bigblind', '2019-09-04 13:33:28.93', '2019-09-04 13:33:28.93');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (156, 1, 5, 'smallblind', '2019-09-04 13:33:29.417', '2019-09-04 13:33:29.417');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (157, 2, 10, 'bigblind', '2019-09-04 13:33:29.426', '2019-09-04 13:33:29.426');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (158, 1, 5, 'smallblind', '2019-09-04 13:33:30.917', '2019-09-04 13:33:30.917');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (159, 2, 10, 'bigblind', '2019-09-04 13:33:30.933', '2019-09-04 13:33:30.933');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (160, 1, 5, 'smallblind', '2019-09-04 13:33:31.417', '2019-09-04 13:33:31.417');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (161, 2, 10, 'bigblind', '2019-09-04 13:33:31.427', '2019-09-04 13:33:31.427');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (162, 1, 5, 'smallblind', '2019-09-04 13:33:32.914', '2019-09-04 13:33:32.914');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (163, 2, 10, 'bigblind', '2019-09-04 13:33:32.923', '2019-09-04 13:33:32.923');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (164, 1, 5, 'smallblind', '2019-09-04 13:33:33.425', '2019-09-04 13:33:33.425');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (165, 2, 10, 'bigblind', '2019-09-04 13:33:33.433', '2019-09-04 13:33:33.433');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (166, 1, 5, 'smallblind', '2019-09-04 13:33:34.903', '2019-09-04 13:33:34.903');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (167, 2, 10, 'bigblind', '2019-09-04 13:33:34.911', '2019-09-04 13:33:34.911');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (168, 1, 5, 'smallblind', '2019-09-04 13:33:35.428', '2019-09-04 13:33:35.428');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (169, 2, 10, 'bigblind', '2019-09-04 13:33:35.435', '2019-09-04 13:33:35.435');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (170, 1, 5, 'smallblind', '2019-09-04 13:33:36.927', '2019-09-04 13:33:36.927');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (171, 2, 10, 'bigblind', '2019-09-04 13:33:36.935', '2019-09-04 13:33:36.935');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (172, 1, 5, 'smallblind', '2019-09-04 13:33:37.427', '2019-09-04 13:33:37.427');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (173, 2, 10, 'bigblind', '2019-09-04 13:33:37.435', '2019-09-04 13:33:37.435');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (174, 1, 5, 'smallblind', '2019-09-04 13:33:38.908', '2019-09-04 13:33:38.908');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (175, 2, 10, 'bigblind', '2019-09-04 13:33:38.916', '2019-09-04 13:33:38.916');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (176, 1, 5, 'smallblind', '2019-09-04 13:33:39.426', '2019-09-04 13:33:39.426');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (177, 2, 10, 'bigblind', '2019-09-04 13:33:39.434', '2019-09-04 13:33:39.434');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (178, 1, 5, 'smallblind', '2019-09-04 13:33:40.917', '2019-09-04 13:33:40.917');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (179, 2, 10, 'bigblind', '2019-09-04 13:33:40.931', '2019-09-04 13:33:40.931');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (180, 1, 5, 'smallblind', '2019-09-04 13:33:41.418', '2019-09-04 13:33:41.418');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (181, 2, 10, 'bigblind', '2019-09-04 13:33:41.427', '2019-09-04 13:33:41.427');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (182, 1, 5, 'smallblind', '2019-09-04 13:33:42.902', '2019-09-04 13:33:42.902');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (183, 2, 10, 'bigblind', '2019-09-04 13:33:42.91', '2019-09-04 13:33:42.91');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (184, 1, 5, 'smallblind', '2019-09-04 13:33:43.412', '2019-09-04 13:33:43.412');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (185, 2, 10, 'bigblind', '2019-09-04 13:33:43.419', '2019-09-04 13:33:43.419');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (186, 1, 5, 'smallblind', '2019-09-04 13:33:44.912', '2019-09-04 13:33:44.912');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (187, 2, 10, 'bigblind', '2019-09-04 13:33:44.918', '2019-09-04 13:33:44.918');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (188, 1, 5, 'smallblind', '2019-09-04 13:33:45.417', '2019-09-04 13:33:45.417');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (189, 2, 10, 'bigblind', '2019-09-04 13:33:45.424', '2019-09-04 13:33:45.424');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (190, 1, 5, 'smallblind', '2019-09-04 13:33:46.919', '2019-09-04 13:33:46.919');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (191, 2, 10, 'bigblind', '2019-09-04 13:33:46.927', '2019-09-04 13:33:46.927');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (192, 1, 5, 'smallblind', '2019-09-04 13:33:47.423', '2019-09-04 13:33:47.423');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (193, 2, 10, 'bigblind', '2019-09-04 13:33:47.432', '2019-09-04 13:33:47.432');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (194, 1, 5, 'smallblind', '2019-09-04 13:33:48.932', '2019-09-04 13:33:48.932');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (195, 2, 10, 'bigblind', '2019-09-04 13:33:48.942', '2019-09-04 13:33:48.942');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (196, 1, 5, 'smallblind', '2019-09-04 13:33:49.424', '2019-09-04 13:33:49.424');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (197, 2, 10, 'bigblind', '2019-09-04 13:33:49.433', '2019-09-04 13:33:49.433');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (198, 1, 5, 'smallblind', '2019-09-04 13:33:50.917', '2019-09-04 13:33:50.917');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (199, 2, 10, 'bigblind', '2019-09-04 13:33:50.924', '2019-09-04 13:33:50.924');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (200, 1, 5, 'smallblind', '2019-09-04 13:33:51.416', '2019-09-04 13:33:51.416');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (201, 2, 10, 'bigblind', '2019-09-04 13:33:51.423', '2019-09-04 13:33:51.423');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (202, 1, 5, 'smallblind', '2019-09-04 13:33:52.915', '2019-09-04 13:33:52.915');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (203, 2, 10, 'bigblind', '2019-09-04 13:33:52.971', '2019-09-04 13:33:52.971');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (204, 1, 5, 'smallblind', '2019-09-04 13:33:53.422', '2019-09-04 13:33:53.422');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (205, 2, 10, 'bigblind', '2019-09-04 13:33:53.43', '2019-09-04 13:33:53.43');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (206, 1, 5, 'smallblind', '2019-09-04 13:33:54.918', '2019-09-04 13:33:54.918');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (207, 2, 10, 'bigblind', '2019-09-04 13:33:54.93', '2019-09-04 13:33:54.93');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (208, 1, 5, 'smallblind', '2019-09-04 13:33:55.423', '2019-09-04 13:33:55.423');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (209, 2, 10, 'bigblind', '2019-09-04 13:33:55.433', '2019-09-04 13:33:55.433');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (210, 1, 5, 'smallblind', '2019-09-04 13:33:56.914', '2019-09-04 13:33:56.914');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (211, 2, 10, 'bigblind', '2019-09-04 13:33:56.921', '2019-09-04 13:33:56.921');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (212, 1, 5, 'smallblind', '2019-09-04 13:33:57.421', '2019-09-04 13:33:57.421');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (213, 2, 10, 'bigblind', '2019-09-04 13:33:57.431', '2019-09-04 13:33:57.431');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (214, 1, 5, 'smallblind', '2019-09-04 13:33:58.917', '2019-09-04 13:33:58.917');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (215, 2, 10, 'bigblind', '2019-09-04 13:33:58.924', '2019-09-04 13:33:58.924');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (216, 1, 5, 'smallblind', '2019-09-04 13:33:59.42', '2019-09-04 13:33:59.42');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (217, 2, 10, 'bigblind', '2019-09-04 13:33:59.428', '2019-09-04 13:33:59.428');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (218, 1, 5, 'smallblind', '2019-09-04 13:34:00.916', '2019-09-04 13:34:00.916');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (219, 2, 10, 'bigblind', '2019-09-04 13:34:00.93', '2019-09-04 13:34:00.93');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (220, 1, 5, 'smallblind', '2019-09-04 13:34:01.422', '2019-09-04 13:34:01.422');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (221, 2, 10, 'bigblind', '2019-09-04 13:34:01.43', '2019-09-04 13:34:01.43');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (222, 1, 5, 'smallblind', '2019-09-04 13:34:02.915', '2019-09-04 13:34:02.915');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (223, 2, 10, 'bigblind', '2019-09-04 13:34:02.923', '2019-09-04 13:34:02.923');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (224, 1, 5, 'smallblind', '2019-09-04 13:34:03.432', '2019-09-04 13:34:03.432');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (225, 2, 10, 'bigblind', '2019-09-04 13:34:03.442', '2019-09-04 13:34:03.442');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (226, 1, 5, 'smallblind', '2019-09-04 13:34:04.922', '2019-09-04 13:34:04.922');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (227, 2, 10, 'bigblind', '2019-09-04 13:34:04.929', '2019-09-04 13:34:04.929');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (228, 1, 5, 'smallblind', '2019-09-04 13:34:05.427', '2019-09-04 13:34:05.427');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (229, 2, 10, 'bigblind', '2019-09-04 13:34:05.442', '2019-09-04 13:34:05.442');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (230, 1, 5, 'smallblind', '2019-09-04 13:34:06.921', '2019-09-04 13:34:06.921');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (231, 2, 10, 'bigblind', '2019-09-04 13:34:06.931', '2019-09-04 13:34:06.931');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (232, 1, 5, 'smallblind', '2019-09-04 13:34:07.422', '2019-09-04 13:34:07.422');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (233, 2, 10, 'bigblind', '2019-09-04 13:34:07.435', '2019-09-04 13:34:07.435');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (234, 1, 5, 'smallblind', '2019-09-04 13:34:08.932', '2019-09-04 13:34:08.932');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (235, 2, 10, 'bigblind', '2019-09-04 13:34:08.982', '2019-09-04 13:34:08.982');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (236, 1, 5, 'smallblind', '2019-09-04 13:34:09.42', '2019-09-04 13:34:09.42');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (237, 2, 10, 'bigblind', '2019-09-04 13:34:09.427', '2019-09-04 13:34:09.427');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (238, 1, 5, 'smallblind', '2019-09-04 13:34:10.905', '2019-09-04 13:34:10.905');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (239, 2, 10, 'bigblind', '2019-09-04 13:34:10.914', '2019-09-04 13:34:10.914');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (240, 1, 5, 'smallblind', '2019-09-04 13:34:11.432', '2019-09-04 13:34:11.432');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (241, 2, 10, 'bigblind', '2019-09-04 13:34:11.439', '2019-09-04 13:34:11.439');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (242, 1, 5, 'smallblind', '2019-09-04 13:34:12.903', '2019-09-04 13:34:12.903');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (243, 2, 10, 'bigblind', '2019-09-04 13:34:12.912', '2019-09-04 13:34:12.912');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (244, 1, 5, 'smallblind', '2019-09-04 13:34:13.437', '2019-09-04 13:34:13.437');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (245, 2, 10, 'bigblind', '2019-09-04 13:34:13.446', '2019-09-04 13:34:13.446');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (246, 1, 5, 'smallblind', '2019-09-04 13:34:14.912', '2019-09-04 13:34:14.912');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (247, 2, 10, 'bigblind', '2019-09-04 13:34:14.921', '2019-09-04 13:34:14.921');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (248, 1, 5, 'smallblind', '2019-09-04 13:34:15.431', '2019-09-04 13:34:15.431');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (249, 2, 10, 'bigblind', '2019-09-04 13:34:15.44', '2019-09-04 13:34:15.44');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (250, 1, 5, 'smallblind', '2019-09-04 13:34:16.914', '2019-09-04 13:34:16.914');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (251, 2, 10, 'bigblind', '2019-09-04 13:34:16.922', '2019-09-04 13:34:16.922');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (252, 1, 5, 'smallblind', '2019-09-04 13:34:17.423', '2019-09-04 13:34:17.423');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (253, 2, 10, 'bigblind', '2019-09-04 13:34:17.432', '2019-09-04 13:34:17.432');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (254, 1, 5, 'smallblind', '2019-09-04 13:34:18.921', '2019-09-04 13:34:18.921');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (255, 2, 10, 'bigblind', '2019-09-04 13:34:18.933', '2019-09-04 13:34:18.933');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (256, 1, 5, 'smallblind', '2019-09-04 13:34:19.427', '2019-09-04 13:34:19.427');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (257, 2, 10, 'bigblind', '2019-09-04 13:34:19.435', '2019-09-04 13:34:19.435');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (258, 1, 5, 'smallblind', '2019-09-04 13:34:20.913', '2019-09-04 13:34:20.913');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (259, 2, 10, 'bigblind', '2019-09-04 13:34:20.921', '2019-09-04 13:34:20.921');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (260, 1, 5, 'smallblind', '2019-09-04 13:34:21.425', '2019-09-04 13:34:21.425');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (261, 2, 10, 'bigblind', '2019-09-04 13:34:21.434', '2019-09-04 13:34:21.434');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (262, 1, 5, 'smallblind', '2019-09-04 13:34:22.919', '2019-09-04 13:34:22.919');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (263, 2, 10, 'bigblind', '2019-09-04 13:34:22.925', '2019-09-04 13:34:22.925');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (264, 1, 5, 'smallblind', '2019-09-04 13:34:23.434', '2019-09-04 13:34:23.434');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (265, 2, 10, 'bigblind', '2019-09-04 13:34:23.44', '2019-09-04 13:34:23.44');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (266, 1, 5, 'smallblind', '2019-09-04 13:34:24.911', '2019-09-04 13:34:24.911');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (267, 2, 10, 'bigblind', '2019-09-04 13:34:24.919', '2019-09-04 13:34:24.919');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (268, 1, 5, 'smallblind', '2019-09-04 13:34:25.439', '2019-09-04 13:34:25.439');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (269, 2, 10, 'bigblind', '2019-09-04 13:34:25.444', '2019-09-04 13:34:25.444');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (270, 1, 5, 'smallblind', '2019-09-04 13:34:26.912', '2019-09-04 13:34:26.912');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (271, 2, 10, 'bigblind', '2019-09-04 13:34:26.92', '2019-09-04 13:34:26.92');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (272, 1, 5, 'smallblind', '2019-09-04 13:34:27.426', '2019-09-04 13:34:27.426');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (273, 2, 10, 'bigblind', '2019-09-04 13:34:27.433', '2019-09-04 13:34:27.433');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (274, 1, 5, 'smallblind', '2019-09-04 13:34:28.919', '2019-09-04 13:34:28.919');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (275, 2, 10, 'bigblind', '2019-09-04 13:34:28.925', '2019-09-04 13:34:28.925');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (276, 1, 5, 'smallblind', '2019-09-04 13:34:29.436', '2019-09-04 13:34:29.436');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (277, 2, 10, 'bigblind', '2019-09-04 13:34:29.444', '2019-09-04 13:34:29.444');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (278, 1, 5, 'smallblind', '2019-09-04 13:34:30.9', '2019-09-04 13:34:30.9');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (279, 2, 10, 'bigblind', '2019-09-04 13:34:30.906', '2019-09-04 13:34:30.906');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (280, 1, 5, 'smallblind', '2019-09-04 13:34:31.433', '2019-09-04 13:34:31.433');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (281, 2, 10, 'bigblind', '2019-09-04 13:34:31.443', '2019-09-04 13:34:31.443');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (282, 1, 5, 'smallblind', '2019-09-04 13:34:32.912', '2019-09-04 13:34:32.912');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (283, 2, 10, 'bigblind', '2019-09-04 13:34:32.92', '2019-09-04 13:34:32.92');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (284, 1, 5, 'smallblind', '2019-09-04 13:34:33.446', '2019-09-04 13:34:33.446');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (285, 2, 10, 'bigblind', '2019-09-04 13:34:33.454', '2019-09-04 13:34:33.454');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (286, 1, 5, 'smallblind', '2019-09-04 13:34:34.922', '2019-09-04 13:34:34.922');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (287, 2, 10, 'bigblind', '2019-09-04 13:34:34.928', '2019-09-04 13:34:34.928');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (288, 1, 5, 'smallblind', '2019-09-04 13:34:35.431', '2019-09-04 13:34:35.431');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (289, 2, 10, 'bigblind', '2019-09-04 13:34:35.44', '2019-09-04 13:34:35.44');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (290, 1, 5, 'smallblind', '2019-09-04 13:34:36.918', '2019-09-04 13:34:36.918');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (291, 2, 10, 'bigblind', '2019-09-04 13:34:36.929', '2019-09-04 13:34:36.929');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (292, 1, 5, 'smallblind', '2019-09-04 13:34:37.431', '2019-09-04 13:34:37.431');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (293, 2, 10, 'bigblind', '2019-09-04 13:34:37.439', '2019-09-04 13:34:37.439');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (294, 1, 5, 'smallblind', '2019-09-04 13:34:38.913', '2019-09-04 13:34:38.913');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (295, 2, 10, 'bigblind', '2019-09-04 13:34:38.927', '2019-09-04 13:34:38.927');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (296, 1, 5, 'smallblind', '2019-09-04 13:34:39.445', '2019-09-04 13:34:39.445');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (297, 2, 10, 'bigblind', '2019-09-04 13:34:39.453', '2019-09-04 13:34:39.453');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (298, 1, 5, 'smallblind', '2019-09-04 13:34:40.914', '2019-09-04 13:34:40.914');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (299, 2, 10, 'bigblind', '2019-09-04 13:34:40.924', '2019-09-04 13:34:40.924');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (300, 1, 5, 'smallblind', '2019-09-04 13:34:41.431', '2019-09-04 13:34:41.431');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (301, 2, 10, 'bigblind', '2019-09-04 13:34:41.439', '2019-09-04 13:34:41.439');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (302, 1, 5, 'smallblind', '2019-09-04 13:34:42.916', '2019-09-04 13:34:42.916');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (303, 2, 10, 'bigblind', '2019-09-04 13:34:42.929', '2019-09-04 13:34:42.929');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (304, 1, 5, 'smallblind', '2019-09-04 13:34:43.428', '2019-09-04 13:34:43.428');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (305, 2, 10, 'bigblind', '2019-09-04 13:34:43.435', '2019-09-04 13:34:43.435');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (306, 1, 5, 'smallblind', '2019-09-04 13:34:44.917', '2019-09-04 13:34:44.917');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (307, 2, 10, 'bigblind', '2019-09-04 13:34:44.933', '2019-09-04 13:34:44.933');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (308, 1, 5, 'smallblind', '2019-09-04 13:34:45.445', '2019-09-04 13:34:45.445');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (309, 2, 10, 'bigblind', '2019-09-04 13:34:45.452', '2019-09-04 13:34:45.452');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (310, 1, 5, 'smallblind', '2019-09-04 13:34:46.915', '2019-09-04 13:34:46.915');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (311, 2, 10, 'bigblind', '2019-09-04 13:34:46.926', '2019-09-04 13:34:46.926');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (312, 1, 5, 'smallblind', '2019-09-04 13:35:27.944', '2019-09-04 13:35:27.944');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (313, 2, 10, 'bigblind', '2019-09-04 13:35:28.059', '2019-09-04 13:35:28.059');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (314, 1, -5, 'smallblind', '2019-09-04 14:28:36.93', '2019-09-04 14:28:36.93');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (315, 2, -10, 'bigblind', '2019-09-04 14:28:36.948', '2019-09-04 14:28:36.948');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (316, 1, -5, 'smallblind', '2019-09-04 14:28:37.377', '2019-09-04 14:28:37.377');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (317, 2, -10, 'bigblind', '2019-09-04 14:28:37.39', '2019-09-04 14:28:37.39');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (318, 1, -5, 'smallblind', '2019-09-04 14:28:38.919', '2019-09-04 14:28:38.919');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (319, 2, -10, 'bigblind', '2019-09-04 14:28:38.931', '2019-09-04 14:28:38.931');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (320, 1, -5, 'smallblind', '2019-09-04 14:28:39.357', '2019-09-04 14:28:39.357');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (321, 2, -10, 'bigblind', '2019-09-04 14:28:39.385', '2019-09-04 14:28:39.385');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (322, 1, -5, 'smallblind', '2019-09-04 14:28:40.983', '2019-09-04 14:28:40.983');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (323, 2, -10, 'bigblind', '2019-09-04 14:28:41.04', '2019-09-04 14:28:41.04');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (324, 1, -5, 'smallblind', '2019-09-04 14:28:41.372', '2019-09-04 14:28:41.372');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (325, 2, -10, 'bigblind', '2019-09-04 14:28:41.384', '2019-09-04 14:28:41.384');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (326, 1, -5, 'smallblind', '2019-09-04 14:28:42.916', '2019-09-04 14:28:42.916');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (327, 2, -10, 'bigblind', '2019-09-04 14:28:42.928', '2019-09-04 14:28:42.928');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (328, 1, -5, 'smallblind', '2019-09-04 14:28:43.382', '2019-09-04 14:28:43.382');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (329, 2, -10, 'bigblind', '2019-09-04 14:28:43.395', '2019-09-04 14:28:43.395');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (330, 1, -5, 'smallblind', '2019-09-04 14:28:44.915', '2019-09-04 14:28:44.915');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (331, 2, -10, 'bigblind', '2019-09-04 14:28:44.926', '2019-09-04 14:28:44.926');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (332, 1, -5, 'smallblind', '2019-09-04 14:28:45.38', '2019-09-04 14:28:45.38');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (333, 2, -10, 'bigblind', '2019-09-04 14:28:45.391', '2019-09-04 14:28:45.391');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (334, 1, -5, 'smallblind', '2019-09-04 14:28:46.92', '2019-09-04 14:28:46.92');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (335, 2, -10, 'bigblind', '2019-09-04 14:28:46.93', '2019-09-04 14:28:46.93');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (336, 1, -5, 'smallblind', '2019-09-04 14:28:47.377', '2019-09-04 14:28:47.377');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (337, 2, -10, 'bigblind', '2019-09-04 14:28:47.387', '2019-09-04 14:28:47.387');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (338, 1, -5, 'smallblind', '2019-09-04 14:28:48.912', '2019-09-04 14:28:48.912');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (339, 2, -10, 'bigblind', '2019-09-04 14:28:48.922', '2019-09-04 14:28:48.922');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (340, 1, -5, 'smallblind', '2019-09-04 14:28:49.382', '2019-09-04 14:28:49.382');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (341, 2, -10, 'bigblind', '2019-09-04 14:28:49.392', '2019-09-04 14:28:49.392');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (342, 1, -5, 'smallblind', '2019-09-04 14:28:50.916', '2019-09-04 14:28:50.916');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (343, 2, -10, 'bigblind', '2019-09-04 14:28:50.928', '2019-09-04 14:28:50.928');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (344, 1, -5, 'smallblind', '2019-09-04 14:28:51.383', '2019-09-04 14:28:51.383');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (345, 2, -10, 'bigblind', '2019-09-04 14:28:51.395', '2019-09-04 14:28:51.395');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (346, 1, -5, 'smallblind', '2019-09-04 14:28:52.917', '2019-09-04 14:28:52.917');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (347, 2, -10, 'bigblind', '2019-09-04 14:28:52.925', '2019-09-04 14:28:52.925');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (348, 1, -5, 'smallblind', '2019-09-04 14:28:53.373', '2019-09-04 14:28:53.373');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (349, 2, -10, 'bigblind', '2019-09-04 14:28:53.382', '2019-09-04 14:28:53.382');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (350, 1, -5, 'smallblind', '2019-09-04 14:28:54.903', '2019-09-04 14:28:54.903');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (351, 2, -10, 'bigblind', '2019-09-04 14:28:54.914', '2019-09-04 14:28:54.914');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (352, 1, -5, 'smallblind', '2019-09-04 14:28:55.362', '2019-09-04 14:28:55.362');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (353, 2, -10, 'bigblind', '2019-09-04 14:28:55.371', '2019-09-04 14:28:55.371');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (354, 1, -5, 'smallblind', '2019-09-04 14:28:56.899', '2019-09-04 14:28:56.899');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (355, 2, -10, 'bigblind', '2019-09-04 14:28:56.908', '2019-09-04 14:28:56.908');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (356, 1, -5, 'smallblind', '2019-09-04 14:28:57.371', '2019-09-04 14:28:57.371');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (357, 2, -10, 'bigblind', '2019-09-04 14:28:57.379', '2019-09-04 14:28:57.379');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (358, 1, -5, 'smallblind', '2019-09-04 14:28:58.907', '2019-09-04 14:28:58.907');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (359, 2, -10, 'bigblind', '2019-09-04 14:28:58.919', '2019-09-04 14:28:58.919');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (360, 1, -5, 'smallblind', '2019-09-04 14:28:59.379', '2019-09-04 14:28:59.379');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (361, 2, -10, 'bigblind', '2019-09-04 14:28:59.391', '2019-09-04 14:28:59.391');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (362, 1, -5, 'smallblind', '2019-09-04 14:29:00.905', '2019-09-04 14:29:00.905');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (363, 2, -10, 'bigblind', '2019-09-04 14:29:00.913', '2019-09-04 14:29:00.913');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (364, 1, -5, 'smallblind', '2019-09-04 14:29:01.378', '2019-09-04 14:29:01.378');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (365, 2, -10, 'bigblind', '2019-09-04 14:29:01.385', '2019-09-04 14:29:01.385');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (366, 1, -5, 'smallblind', '2019-09-04 14:29:02.9', '2019-09-04 14:29:02.9');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (367, 2, -10, 'bigblind', '2019-09-04 14:29:02.911', '2019-09-04 14:29:02.911');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (368, 1, -5, 'smallblind', '2019-09-04 14:29:03.358', '2019-09-04 14:29:03.358');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (369, 2, -10, 'bigblind', '2019-09-04 14:29:03.391', '2019-09-04 14:29:03.391');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (370, 1, -5, 'smallblind', '2019-09-04 14:29:04.909', '2019-09-04 14:29:04.909');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (371, 2, -10, 'bigblind', '2019-09-04 14:29:04.919', '2019-09-04 14:29:04.919');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (372, 1, -5, 'smallblind', '2019-09-04 14:29:05.379', '2019-09-04 14:29:05.379');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (373, 2, -10, 'bigblind', '2019-09-04 14:29:05.399', '2019-09-04 14:29:05.399');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (374, 1, -5, 'smallblind', '2019-09-04 14:29:06.908', '2019-09-04 14:29:06.908');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (375, 2, -10, 'bigblind', '2019-09-04 14:29:06.916', '2019-09-04 14:29:06.916');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (376, 1, -5, 'smallblind', '2019-09-04 14:29:07.38', '2019-09-04 14:29:07.38');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (377, 2, -10, 'bigblind', '2019-09-04 14:29:07.386', '2019-09-04 14:29:07.386');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (378, 1, -5, 'smallblind', '2019-09-04 14:29:08.907', '2019-09-04 14:29:08.907');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (379, 2, -10, 'bigblind', '2019-09-04 14:29:08.915', '2019-09-04 14:29:08.915');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (380, 1, -5, 'smallblind', '2019-09-04 14:29:09.383', '2019-09-04 14:29:09.383');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (381, 2, -10, 'bigblind', '2019-09-04 14:29:09.395', '2019-09-04 14:29:09.395');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (382, 1, -5, 'smallblind', '2019-09-04 14:29:10.919', '2019-09-04 14:29:10.919');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (383, 2, -10, 'bigblind', '2019-09-04 14:29:10.926', '2019-09-04 14:29:10.926');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (384, 1, -5, 'smallblind', '2019-09-04 14:29:11.375', '2019-09-04 14:29:11.375');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (385, 2, -10, 'bigblind', '2019-09-04 14:29:11.384', '2019-09-04 14:29:11.384');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (386, 1, -5, 'smallblind', '2019-09-04 14:29:12.918', '2019-09-04 14:29:12.918');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (387, 2, -10, 'bigblind', '2019-09-04 14:29:12.931', '2019-09-04 14:29:12.931');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (388, 1, -5, 'smallblind', '2019-09-04 14:29:13.38', '2019-09-04 14:29:13.38');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (389, 2, -10, 'bigblind', '2019-09-04 14:29:13.386', '2019-09-04 14:29:13.386');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (390, 1, -5, 'smallblind', '2019-09-04 14:29:14.907', '2019-09-04 14:29:14.907');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (391, 2, -10, 'bigblind', '2019-09-04 14:29:14.915', '2019-09-04 14:29:14.915');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (392, 1, -5, 'smallblind', '2019-09-04 14:29:15.381', '2019-09-04 14:29:15.381');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (393, 2, -10, 'bigblind', '2019-09-04 14:29:15.391', '2019-09-04 14:29:15.391');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (394, 1, -5, 'smallblind', '2019-09-04 14:29:16.921', '2019-09-04 14:29:16.921');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (395, 2, -10, 'bigblind', '2019-09-04 14:29:16.93', '2019-09-04 14:29:16.93');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (396, 1, -5, 'smallblind', '2019-09-04 14:29:17.366', '2019-09-04 14:29:17.366');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (397, 2, -10, 'bigblind', '2019-09-04 14:29:17.374', '2019-09-04 14:29:17.374');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (398, 1, -5, 'smallblind', '2019-09-04 14:29:18.911', '2019-09-04 14:29:18.911');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (399, 2, -10, 'bigblind', '2019-09-04 14:29:18.92', '2019-09-04 14:29:18.92');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (400, 1, -5, 'smallblind', '2019-09-04 14:29:19.379', '2019-09-04 14:29:19.379');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (401, 2, -10, 'bigblind', '2019-09-04 14:29:19.387', '2019-09-04 14:29:19.387');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (402, 1, -5, 'smallblind', '2019-09-04 14:29:20.906', '2019-09-04 14:29:20.906');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (403, 2, -10, 'bigblind', '2019-09-04 14:29:20.914', '2019-09-04 14:29:20.914');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (404, 1, -5, 'smallblind', '2019-09-04 14:29:21.449', '2019-09-04 14:29:21.449');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (405, 2, -10, 'bigblind', '2019-09-04 14:29:21.456', '2019-09-04 14:29:21.456');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (406, 1, -5, 'smallblind', '2019-09-04 14:29:22.929', '2019-09-04 14:29:22.929');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (407, 2, -10, 'bigblind', '2019-09-04 14:29:22.937', '2019-09-04 14:29:22.937');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (408, 1, -5, 'smallblind', '2019-09-04 14:29:23.375', '2019-09-04 14:29:23.375');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (409, 2, -10, 'bigblind', '2019-09-04 14:29:23.385', '2019-09-04 14:29:23.385');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (410, 1, -5, 'smallblind', '2019-09-04 14:29:24.912', '2019-09-04 14:29:24.912');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (411, 2, -10, 'bigblind', '2019-09-04 14:29:24.92', '2019-09-04 14:29:24.92');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (412, 1, -5, 'smallblind', '2019-09-04 14:29:25.379', '2019-09-04 14:29:25.379');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (413, 2, -10, 'bigblind', '2019-09-04 14:29:25.385', '2019-09-04 14:29:25.385');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (414, 1, -5, 'smallblind', '2019-09-04 14:29:26.902', '2019-09-04 14:29:26.902');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (415, 2, -10, 'bigblind', '2019-09-04 14:29:26.911', '2019-09-04 14:29:26.911');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (416, 1, -5, 'smallblind', '2019-09-04 14:29:27.366', '2019-09-04 14:29:27.366');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (417, 2, -10, 'bigblind', '2019-09-04 14:29:27.374', '2019-09-04 14:29:27.374');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (418, 1, -5, 'smallblind', '2019-09-04 14:29:28.91', '2019-09-04 14:29:28.91');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (419, 2, -10, 'bigblind', '2019-09-04 14:29:28.921', '2019-09-04 14:29:28.921');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (420, 1, -5, 'smallblind', '2019-09-04 14:29:29.384', '2019-09-04 14:29:29.384');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (421, 2, -10, 'bigblind', '2019-09-04 14:29:29.399', '2019-09-04 14:29:29.399');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (422, 1, -5, 'smallblind', '2019-09-04 14:33:38.805', '2019-09-04 14:33:38.805');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (423, 2, -10, 'bigblind', '2019-09-04 14:33:38.819', '2019-09-04 14:33:38.819');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (424, 2, -5, 'smallblind', '2019-09-04 14:41:59.383', '2019-09-04 14:41:59.383');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (425, 1, -10, 'bigblind', '2019-09-04 14:41:59.397', '2019-09-04 14:41:59.397');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (426, 1, -5, 'smallblind', '2019-09-04 14:49:25.291', '2019-09-04 14:49:25.291');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (427, 2, -10, 'bigblind', '2019-09-04 14:49:25.317', '2019-09-04 14:49:25.317');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (428, 1, -5, 'smallblind', '2019-09-04 15:05:56.963', '2019-09-04 15:05:56.963');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (429, 2, -10, 'bigblind', '2019-09-04 15:05:56.972', '2019-09-04 15:05:56.972');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (430, 1, -5, 'smallblind', '2019-09-04 15:43:19.863', '2019-09-04 15:43:19.863');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (431, 2, -10, 'bigblind', '2019-09-04 15:43:19.874', '2019-09-04 15:43:19.874');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (432, 1, -5, 'smallblind', '2019-09-04 15:49:28.401', '2019-09-04 15:49:28.401');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (433, 2, -10, 'bigblind', '2019-09-04 15:49:28.417', '2019-09-04 15:49:28.417');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (434, 1, -5, 'smallblind', '2019-09-04 16:14:44.007', '2019-09-04 16:14:44.007');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (435, 2, -10, 'bigblind', '2019-09-04 16:14:44.015', '2019-09-04 16:14:44.015');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (436, 1, -5, 'smallblind', '2019-09-04 16:17:27.212', '2019-09-04 16:17:27.212');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (437, 2, -10, 'bigblind', '2019-09-04 16:17:27.227', '2019-09-04 16:17:27.227');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (438, 1, -5, 'smallblind', '2019-09-04 16:21:18.059', '2019-09-04 16:21:18.059');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (439, 2, -10, 'bigblind', '2019-09-04 16:21:18.08', '2019-09-04 16:21:18.08');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (440, 1, -5, 'smallblind', '2019-09-04 16:33:26.737', '2019-09-04 16:33:26.737');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (441, 2, -10, 'bigblind', '2019-09-04 16:33:26.769', '2019-09-04 16:33:26.769');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (442, 1, -5, 'smallblind', '2019-09-04 17:31:10.287', '2019-09-04 17:31:10.287');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (443, 2, -10, 'bigblind', '2019-09-04 17:31:10.292', '2019-09-04 17:31:10.292');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (444, 2, -5, 'smallblind', '2019-09-04 17:32:34.76', '2019-09-04 17:32:34.76');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (445, 1, -10, 'bigblind', '2019-09-04 17:32:34.763', '2019-09-04 17:32:34.763');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (446, 2, -5, 'smallblind', '2019-09-04 17:37:02.55', '2019-09-04 17:37:02.55');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (447, 1, -10, 'bigblind', '2019-09-04 17:37:02.555', '2019-09-04 17:37:02.555');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (448, 2, -5, 'smallblind', '2019-09-04 17:37:17.779', '2019-09-04 17:37:17.779');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (449, 1, -10, 'bigblind', '2019-09-04 17:37:17.785', '2019-09-04 17:37:17.785');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (450, 2, -5, 'smallblind', '2019-09-04 17:37:22.477', '2019-09-04 17:37:22.477');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (451, 1, -10, 'bigblind', '2019-09-04 17:37:22.488', '2019-09-04 17:37:22.488');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (452, 2, -5, 'smallblind', '2019-09-04 17:37:23.197', '2019-09-04 17:37:23.197');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (453, 1, -10, 'bigblind', '2019-09-04 17:37:23.199', '2019-09-04 17:37:23.199');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (454, 2, -5, 'smallblind', '2019-09-04 17:37:23.559', '2019-09-04 17:37:23.559');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (455, 1, -10, 'bigblind', '2019-09-04 17:37:23.586', '2019-09-04 17:37:23.586');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (456, 2, -5, 'smallblind', '2019-09-04 17:37:23.69', '2019-09-04 17:37:23.69');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (457, 1, -10, 'bigblind', '2019-09-04 17:37:23.692', '2019-09-04 17:37:23.692');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (458, 2, -5, 'smallblind', '2019-09-04 17:37:23.873', '2019-09-04 17:37:23.873');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (459, 1, -10, 'bigblind', '2019-09-04 17:37:23.875', '2019-09-04 17:37:23.875');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (460, 1, -5, 'smallblind', '2019-09-04 17:40:57.87', '2019-09-04 17:40:57.87');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (461, 2, -10, 'bigblind', '2019-09-04 17:40:57.874', '2019-09-04 17:40:57.874');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (462, 1, -5, 'smallblind', '2019-09-04 17:57:02.729', '2019-09-04 17:57:02.729');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (463, 2, -10, 'bigblind', '2019-09-04 17:57:02.732', '2019-09-04 17:57:02.732');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (464, 1, -5, 'smallblind', '2019-09-04 18:00:33.54', '2019-09-04 18:00:33.54');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (465, 2, -10, 'bigblind', '2019-09-04 18:00:33.545', '2019-09-04 18:00:33.545');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (466, 1, -5, 'smallblind', '2019-09-04 18:07:48.716', '2019-09-04 18:07:48.716');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (467, 2, -10, 'bigblind', '2019-09-04 18:07:48.718', '2019-09-04 18:07:48.718');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (468, 1, -5, 'smallblind', '2019-09-04 18:11:44.72', '2019-09-04 18:11:44.72');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (469, 2, -10, 'bigblind', '2019-09-04 18:11:44.723', '2019-09-04 18:11:44.723');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (470, 2, -5, 'smallblind', '2019-09-04 18:19:54.067', '2019-09-04 18:19:54.067');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (471, 1, -10, 'bigblind', '2019-09-04 18:19:54.068', '2019-09-04 18:19:54.068');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (472, 2, -5, 'smallblind', '2019-09-04 18:20:37.035', '2019-09-04 18:20:37.035');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (473, 1, -10, 'bigblind', '2019-09-04 18:20:37.037', '2019-09-04 18:20:37.037');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (474, 2, -5, 'smallblind', '2019-09-04 18:23:27.651', '2019-09-04 18:23:27.651');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (475, 1, -10, 'bigblind', '2019-09-04 18:23:27.653', '2019-09-04 18:23:27.653');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (476, 2, -5, 'smallblind', '2019-09-04 18:25:48.07', '2019-09-04 18:25:48.07');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (477, 1, -10, 'bigblind', '2019-09-04 18:25:48.073', '2019-09-04 18:25:48.073');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (478, 2, -5, 'smallblind', '2019-09-04 18:35:06.526', '2019-09-04 18:35:06.526');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (479, 1, -10, 'bigblind', '2019-09-04 18:35:06.528', '2019-09-04 18:35:06.528');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (480, 3, -5, 'smallblind', '2019-09-05 18:22:20.043', '2019-09-05 18:22:20.043');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (481, 3, -5, 'smallblind', '2019-09-05 18:30:16.366', '2019-09-05 18:30:16.366');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (482, 3, -5, 'smallblind', '2019-09-05 18:30:16.408', '2019-09-05 18:30:16.408');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (483, 1, -10, 'bigblind', '2019-09-05 18:30:16.866', '2019-09-05 18:30:16.866');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (484, 2, -5, 'smallblind', '2019-09-05 18:36:12.352', '2019-09-05 18:36:12.352');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (485, 1, -10, 'bigblind', '2019-09-05 18:36:12.565', '2019-09-05 18:36:12.565');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (486, 1, -10, 'bigblind', '2019-09-05 18:36:12.612', '2019-09-05 18:36:12.612');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (487, 2, -5, 'smallblind', '2019-09-05 18:36:14.351', '2019-09-05 18:36:14.351');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (488, 1, -10, 'bigblind', '2019-09-05 18:36:14.516', '2019-09-05 18:36:14.516');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (489, 3, -5, 'smallblind', '2019-09-05 19:04:59.705', '2019-09-05 19:04:59.705');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (490, 2, -10, 'bigblind', '2019-09-05 19:05:01.187', '2019-09-05 19:05:01.187');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (491, 2, -10, 'bigblind', '2019-09-05 19:05:01.312', '2019-09-05 19:05:01.312');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (492, 3, -5, 'smallblind', '2019-09-05 19:05:01.684', '2019-09-05 19:05:01.684');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (493, 2, -10, 'bigblind', '2019-09-05 19:05:03.108', '2019-09-05 19:05:03.108');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (494, 2, -10, 'bigblind', '2019-09-05 19:05:19.127', '2019-09-05 19:05:19.127');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (495, 3, -5, 'smallblind', '2019-09-05 19:22:39.692', '2019-09-05 19:22:39.692');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (496, 3, -5, 'smallblind', '2019-09-05 19:22:39.821', '2019-09-05 19:22:39.821');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (497, 2, -10, 'bigblind', '2019-09-05 19:23:01.079', '2019-09-05 19:23:01.079');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (498, 1, -5, 'smallblind', '2019-09-05 19:26:22.507', '2019-09-05 19:26:22.507');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (499, 2, -10, 'bigblind', '2019-09-05 19:26:22.94', '2019-09-05 19:26:22.94');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (500, 1, -5, 'smallblind', '2019-09-05 19:26:38.885', '2019-09-05 19:26:38.885');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (501, 1, -5, 'smallblind', '2019-09-05 19:26:40.523', '2019-09-05 19:26:40.523');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (502, 1, -5, 'smallblind', '2019-09-05 19:26:41.775', '2019-09-05 19:26:41.775');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (503, 2, -5, 'smallblind', '2019-09-05 19:28:36.987', '2019-09-05 19:28:36.987');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (504, 3, -10, 'bigblind', '2019-09-05 19:28:37.848', '2019-09-05 19:28:37.848');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (505, 2, -5, 'smallblind', '2019-09-05 19:28:53.874', '2019-09-05 19:28:53.874');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (506, 2, -5, 'smallblind', '2019-09-05 19:28:55.983', '2019-09-05 19:28:55.983');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (507, 2, -5, 'smallblind', '2019-09-05 19:28:57.854', '2019-09-05 19:28:57.854');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (508, 3, -5, 'smallblind', '2019-09-05 19:34:21.498', '2019-09-05 19:34:21.498');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (509, 2, -10, 'bigblind', '2019-09-05 19:34:21.705', '2019-09-05 19:34:21.705');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (510, 3, -5, 'smallblind', '2019-09-05 19:34:22.273', '2019-09-05 19:34:22.273');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (511, 2, -10, 'bigblind', '2019-09-05 19:34:23.549', '2019-09-05 19:34:23.549');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (512, 3, -5, 'smallblind', '2019-09-05 19:34:23.708', '2019-09-05 19:34:23.708');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (513, 2, -10, 'bigblind', '2019-09-05 19:34:24.276', '2019-09-05 19:34:24.276');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (514, 3, -5, 'smallblind', '2019-09-05 19:34:25.506', '2019-09-05 19:34:25.506');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (515, 2, -10, 'bigblind', '2019-09-05 19:34:25.675', '2019-09-05 19:34:25.675');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (516, 2, -10, 'bigblind', '2019-09-05 19:34:26.222', '2019-09-05 19:34:26.222');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (517, 2, -10, 'bigblind', '2019-09-05 19:34:27.486', '2019-09-05 19:34:27.486');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (518, 2, -10, 'bigblind', '2019-09-05 19:34:27.697', '2019-09-05 19:34:27.697');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (519, 2, -10, 'bigblind', '2019-09-05 19:34:28.215', '2019-09-05 19:34:28.215');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (520, 2, -10, 'bigblind', '2019-09-05 19:34:29.511', '2019-09-05 19:34:29.511');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (521, 2, -10, 'bigblind', '2019-09-05 19:34:29.785', '2019-09-05 19:34:29.785');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (522, 2, -10, 'bigblind', '2019-09-05 19:34:30.225', '2019-09-05 19:34:30.225');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (523, 2, -10, 'bigblind', '2019-09-05 19:34:31.475', '2019-09-05 19:34:31.475');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (524, 2, -10, 'bigblind', '2019-09-05 19:34:31.667', '2019-09-05 19:34:31.667');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (525, 2, -10, 'bigblind', '2019-09-05 19:34:32.199', '2019-09-05 19:34:32.199');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (526, 2, -10, 'bigblind', '2019-09-05 19:34:33.479', '2019-09-05 19:34:33.479');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (527, 2, -10, 'bigblind', '2019-09-05 19:34:33.668', '2019-09-05 19:34:33.668');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (528, 2, -10, 'bigblind', '2019-09-05 19:34:34.196', '2019-09-05 19:34:34.196');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (529, 2, -10, 'bigblind', '2019-09-05 19:34:35.469', '2019-09-05 19:34:35.469');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (530, 2, -10, 'bigblind', '2019-09-05 19:34:35.655', '2019-09-05 19:34:35.655');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (531, 2, -10, 'bigblind', '2019-09-05 19:34:36.194', '2019-09-05 19:34:36.194');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (532, 2, -10, 'bigblind', '2019-09-05 19:34:37.487', '2019-09-05 19:34:37.487');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (533, 2, -10, 'bigblind', '2019-09-05 19:34:37.649', '2019-09-05 19:34:37.649');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (534, 2, -10, 'bigblind', '2019-09-05 19:34:38.231', '2019-09-05 19:34:38.231');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (535, 2, -10, 'bigblind', '2019-09-05 19:34:39.495', '2019-09-05 19:34:39.495');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (536, 2, -10, 'bigblind', '2019-09-05 19:34:39.653', '2019-09-05 19:34:39.653');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (537, 2, -10, 'bigblind', '2019-09-05 19:34:40.253', '2019-09-05 19:34:40.253');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (538, 1, -5, 'smallblind', '2019-09-06 09:59:48.429', '2019-09-06 09:59:48.429');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (539, 2, -10, 'bigblind', '2019-09-06 09:59:49.14', '2019-09-06 09:59:49.14');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (540, 1, -5, 'smallblind', '2019-09-06 09:59:50.408', '2019-09-06 09:59:50.408');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (541, 2, -10, 'bigblind', '2019-09-06 09:59:51.145', '2019-09-06 09:59:51.145');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (542, 1, -5, 'smallblind', '2019-09-06 09:59:52.42', '2019-09-06 09:59:52.42');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (543, 2, -10, 'bigblind', '2019-09-06 09:59:53.15', '2019-09-06 09:59:53.15');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (544, 1, -5, 'smallblind', '2019-09-06 09:59:54.409', '2019-09-06 09:59:54.409');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (545, 2, -10, 'bigblind', '2019-09-06 09:59:55.144', '2019-09-06 09:59:55.144');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (546, 2, -10, 'bigblind', '2019-09-06 09:59:57.123', '2019-09-06 09:59:57.123');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (547, 2, -10, 'bigblind', '2019-09-06 09:59:57.2', '2019-09-06 09:59:57.2');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (548, 2, -10, 'bigblind', '2019-09-06 09:59:59.148', '2019-09-06 09:59:59.148');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (549, 2, -10, 'bigblind', '2019-09-06 09:59:59.251', '2019-09-06 09:59:59.251');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (550, 2, -10, 'bigblind', '2019-09-06 10:00:01.143', '2019-09-06 10:00:01.143');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (551, 2, -10, 'bigblind', '2019-09-06 10:00:01.201', '2019-09-06 10:00:01.201');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (552, 2, -10, 'bigblind', '2019-09-06 10:00:03.204', '2019-09-06 10:00:03.204');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (553, 2, -10, 'bigblind', '2019-09-06 10:00:03.249', '2019-09-06 10:00:03.249');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (554, 2, -10, 'bigblind', '2019-09-06 10:00:05.133', '2019-09-06 10:00:05.133');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (555, 2, -10, 'bigblind', '2019-09-06 10:00:05.202', '2019-09-06 10:00:05.202');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (556, 2, -10, 'bigblind', '2019-09-06 10:00:06.408', '2019-09-06 10:00:06.408');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (557, 2, -10, 'bigblind', '2019-09-06 10:00:07.131', '2019-09-06 10:00:07.131');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (558, 2, -10, 'bigblind', '2019-09-06 10:00:09.074', '2019-09-06 10:00:09.074');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (559, 2, -10, 'bigblind', '2019-09-06 10:00:09.134', '2019-09-06 10:00:09.134');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (560, 2, -10, 'bigblind', '2019-09-06 10:00:11.071', '2019-09-06 10:00:11.071');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (561, 2, -10, 'bigblind', '2019-09-06 10:00:11.131', '2019-09-06 10:00:11.131');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (562, 2, -10, 'bigblind', '2019-09-06 10:00:13.07', '2019-09-06 10:00:13.07');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (563, 2, -10, 'bigblind', '2019-09-06 10:00:13.157', '2019-09-06 10:00:13.157');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (564, 2, -10, 'bigblind', '2019-09-06 10:00:15.059', '2019-09-06 10:00:15.059');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (565, 2, -10, 'bigblind', '2019-09-06 10:00:15.148', '2019-09-06 10:00:15.148');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (566, 3, -5, 'smallblind', '2019-09-06 11:11:45.466', '2019-09-06 11:11:45.466');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (567, 2, -10, 'bigblind', '2019-09-06 11:11:46.205', '2019-09-06 11:11:46.205');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (568, 3, -5, 'smallblind', '2019-09-06 11:12:02.222', '2019-09-06 11:12:02.222');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (569, 3, -5, 'smallblind', '2019-09-06 11:12:04.194', '2019-09-06 11:12:04.194');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (570, 3, -5, 'smallblind', '2019-09-06 11:12:04.52', '2019-09-06 11:12:04.52');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (571, 2, -10, 'bigblind', '2019-09-06 11:12:05.467', '2019-09-06 11:12:05.467');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (572, 3, -5, 'smallblind', '2019-09-06 11:24:30.581', '2019-09-06 11:24:30.581');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (573, 2, -10, 'bigblind', '2019-09-06 11:24:30.832', '2019-09-06 11:24:30.832');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (574, 3, -5, 'smallblind', '2019-09-06 11:26:29.662', '2019-09-06 11:26:29.662');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (575, 2, -10, 'bigblind', '2019-09-06 11:26:30.292', '2019-09-06 11:26:30.292');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (576, 2, -10, 'bigblind', '2019-09-06 11:26:47.079', '2019-09-06 11:26:47.079');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (577, 2, -5, 'smallblind', '2019-09-06 12:40:24.193', '2019-09-06 12:40:24.193');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (578, 3, -10, 'bigblind', '2019-09-06 12:40:24.749', '2019-09-06 12:40:24.749');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (579, 2, -5, 'smallblind', '2019-09-06 12:40:40.169', '2019-09-06 12:40:40.169');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (580, 3, -10, 'bigblind', '2019-09-06 12:40:40.855', '2019-09-06 12:40:40.855');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (581, 3, -10, 'bigblind', '2019-09-06 12:40:44.145', '2019-09-06 12:40:44.145');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (582, 2, -5, 'smallblind', '2019-09-06 12:47:14.943', '2019-09-06 12:47:14.943');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (583, 3, -10, 'bigblind', '2019-09-06 12:47:16.464', '2019-09-06 12:47:16.464');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (584, 2, -5, 'smallblind', '2019-09-06 12:47:32.462', '2019-09-06 12:47:32.462');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (585, 3, -10, 'bigblind', '2019-09-06 12:47:32.902', '2019-09-06 12:47:32.902');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (586, 3, -5, 'smallblind', '2019-09-06 14:37:54.937', '2019-09-06 14:37:54.937');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (587, 1, -10, 'bigblind', '2019-09-06 14:37:55.992', '2019-09-06 14:37:55.992');


--
-- TOC entry 2966 (class 0 OID 59351)
-- Dependencies: 218
-- Data for Name: user_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_account (id, nickname, password, email, foto, country_id, user_role, user_status, sum_games, won_games, created, updated) VALUES (1, 'Admin', '$2a$10$QE39xe3rcgW8Cv6hXqQNLubg02aBmNtrfBDCMMwGMNEOA6oG0Lts.', 'aaaa@a.com', 'resources/img/foto.png', 107, 'ADMIN', 'ACTIVE', 0, 0, '2019-08-22 21:16:05.456', '2019-08-22 21:16:05.456');
INSERT INTO public.user_account (id, nickname, password, email, foto, country_id, user_role, user_status, sum_games, won_games, created, updated) VALUES (2, 'Test', '$2a$10$OgNTZQU7I.q7TzILBgU7He4IJJS.1DktexjLp./OgFD.qUUitz8mu', 'makaka@a.com', 'resources/img/foto.png', 1, 'ADMIN', 'ACTIVE', 0, 0, '2019-08-22 23:03:24.411', '2019-08-22 23:03:24.411');
INSERT INTO public.user_account (id, nickname, password, email, foto, country_id, user_role, user_status, sum_games, won_games, created, updated) VALUES (3, 'Test2', '$2a$10$aK2j.mTJ8waf7D9al2yOieXQlrc9CADMT7zRXDj.y.QJJkimkQpCy', 'test2@aol.com', 'resources/img/foto.png', 70, 'MEMBER', 'ACTIVE', 0, 0, '2019-09-03 13:17:22.73', '2019-09-03 13:17:22.73');


--
-- TOC entry 2985 (class 0 OID 0)
-- Dependencies: 197
-- Name: action_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.action_id_seq', 24, true);


--
-- TOC entry 2986 (class 0 OID 0)
-- Dependencies: 199
-- Name: card_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.card_id_seq', 78, true);


--
-- TOC entry 2987 (class 0 OID 0)
-- Dependencies: 201
-- Name: card_in_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.card_in_game_id_seq', 16693, true);


--
-- TOC entry 2988 (class 0 OID 0)
-- Dependencies: 203
-- Name: chat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_id_seq', 1, false);


--
-- TOC entry 2989 (class 0 OID 0)
-- Dependencies: 205
-- Name: chat_in_home_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_in_home_id_seq', 3, true);


--
-- TOC entry 2990 (class 0 OID 0)
-- Dependencies: 207
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_id_seq', 196, true);


--
-- TOC entry 2991 (class 0 OID 0)
-- Dependencies: 209
-- Name: game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.game_id_seq', 207, true);


--
-- TOC entry 2992 (class 0 OID 0)
-- Dependencies: 211
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.news_id_seq', 1, false);


--
-- TOC entry 2993 (class 0 OID 0)
-- Dependencies: 213
-- Name: player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.player_id_seq', 453, true);


--
-- TOC entry 2994 (class 0 OID 0)
-- Dependencies: 215
-- Name: tiket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tiket_id_seq', 1, false);


--
-- TOC entry 2995 (class 0 OID 0)
-- Dependencies: 217
-- Name: transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaction_id_seq', 587, true);


--
-- TOC entry 2996 (class 0 OID 0)
-- Dependencies: 219
-- Name: user_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_account_id_seq', 3, true);


--
-- TOC entry 2782 (class 2606 OID 59372)
-- Name: action action_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action
    ADD CONSTRAINT action_pk PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 59374)
-- Name: card card_filename_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card
    ADD CONSTRAINT card_filename_key UNIQUE (filename);


--
-- TOC entry 2788 (class 2606 OID 59376)
-- Name: card_in_game card_in_game_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_in_game
    ADD CONSTRAINT card_in_game_pk PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 59378)
-- Name: card card_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card
    ADD CONSTRAINT card_pk PRIMARY KEY (id);


--
-- TOC entry 2792 (class 2606 OID 59380)
-- Name: chat_in_home chat_in_home_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_in_home
    ADD CONSTRAINT chat_in_home_pk PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 59382)
-- Name: chat chat_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_pk PRIMARY KEY (id);


--
-- TOC entry 2794 (class 2606 OID 59384)
-- Name: country country_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pk PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 59386)
-- Name: game game_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_pk PRIMARY KEY (id);


--
-- TOC entry 2798 (class 2606 OID 59388)
-- Name: news news_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pk PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 59390)
-- Name: player player_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_pk PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 59392)
-- Name: tiket tiket_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tiket
    ADD CONSTRAINT tiket_pk PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 59394)
-- Name: transaction transaction_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pk PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 59396)
-- Name: user_account user_account_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account
    ADD CONSTRAINT user_account_email_key UNIQUE (email);


--
-- TOC entry 2808 (class 2606 OID 59398)
-- Name: user_account user_account_nickname_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account
    ADD CONSTRAINT user_account_nickname_key UNIQUE (nickname);


--
-- TOC entry 2810 (class 2606 OID 59400)
-- Name: user_account user_account_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account
    ADD CONSTRAINT user_account_pk PRIMARY KEY (id);


--
-- TOC entry 2811 (class 2606 OID 59401)
-- Name: action action_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action
    ADD CONSTRAINT action_fk0 FOREIGN KEY (player_id) REFERENCES public.player(id);


--
-- TOC entry 2812 (class 2606 OID 59406)
-- Name: card_in_game card_in_game_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_in_game
    ADD CONSTRAINT card_in_game_fk0 FOREIGN KEY (card_id) REFERENCES public.card(id);


--
-- TOC entry 2813 (class 2606 OID 59411)
-- Name: card_in_game card_in_game_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_in_game
    ADD CONSTRAINT card_in_game_fk1 FOREIGN KEY (game_id) REFERENCES public.game(id);


--
-- TOC entry 2814 (class 2606 OID 59416)
-- Name: card_in_game card_in_game_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_in_game
    ADD CONSTRAINT card_in_game_fk2 FOREIGN KEY (player_id) REFERENCES public.player(id);


--
-- TOC entry 2815 (class 2606 OID 59421)
-- Name: chat chat_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_fk0 FOREIGN KEY (game_id) REFERENCES public.game(id);


--
-- TOC entry 2816 (class 2606 OID 59426)
-- Name: chat chat_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_fk1 FOREIGN KEY (user_account_id) REFERENCES public.user_account(id);


--
-- TOC entry 2817 (class 2606 OID 59431)
-- Name: chat_in_home chat_in_home_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_in_home
    ADD CONSTRAINT chat_in_home_fk0 FOREIGN KEY (user_account_id) REFERENCES public.user_account(id);


--
-- TOC entry 2818 (class 2606 OID 59436)
-- Name: player player_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_fk0 FOREIGN KEY (game_id) REFERENCES public.game(id);


--
-- TOC entry 2819 (class 2606 OID 59441)
-- Name: player player_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_fk1 FOREIGN KEY (user_account_id) REFERENCES public.user_account(id);


--
-- TOC entry 2820 (class 2606 OID 59446)
-- Name: tiket tiket_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tiket
    ADD CONSTRAINT tiket_fk0 FOREIGN KEY (user_account_id) REFERENCES public.user_account(id);


--
-- TOC entry 2821 (class 2606 OID 59451)
-- Name: transaction transaction_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_fk0 FOREIGN KEY (user_account_id) REFERENCES public.user_account(id);


--
-- TOC entry 2822 (class 2606 OID 59456)
-- Name: user_account user_account_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account
    ADD CONSTRAINT user_account_fk0 FOREIGN KEY (country_id) REFERENCES public.country(id);


-- Completed on 2019-09-06 15:50:07

--
-- PostgreSQL database dump complete
--

