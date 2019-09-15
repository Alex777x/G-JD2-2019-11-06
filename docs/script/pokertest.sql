--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2
-- Dumped by pg_dump version 11.2

-- Started on 2019-09-15 14:16:33

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
    curent_bet integer,
    curent_hand character varying
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

INSERT INTO public.chat_in_home (id, user_account_id, message, created, updated) VALUES (15, 12, 'Привет', '2019-09-10 13:59:55.868', '2019-09-10 13:59:55.868');
INSERT INTO public.chat_in_home (id, user_account_id, message, created, updated) VALUES (16, 4, 'Приветствую', '2019-09-10 14:00:22.166', '2019-09-10 14:00:22.166');
INSERT INTO public.chat_in_home (id, user_account_id, message, created, updated) VALUES (17, 1, 'Все хорошо?', '2019-09-10 14:00:45.609', '2019-09-10 14:00:45.609');
INSERT INTO public.chat_in_home (id, user_account_id, message, created, updated) VALUES (18, 4, 'Да', '2019-09-10 14:00:54.037', '2019-09-10 14:00:54.037');


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
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (588, 3, -5, 'smallblind', '2019-09-08 14:24:07.815', '2019-09-08 14:24:07.815');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (589, 2, -10, 'bigblind', '2019-09-08 14:24:08.623', '2019-09-08 14:24:08.623');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (590, 1, -5, 'smallblind', '2019-09-08 16:58:51.879', '2019-09-08 16:58:51.879');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (591, 2, -10, 'bigblind', '2019-09-08 16:58:52.989', '2019-09-08 16:58:52.989');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (592, 1, -5, 'smallblind', '2019-09-08 18:03:43.942', '2019-09-08 18:03:43.942');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (593, 2, -10, 'bigblind', '2019-09-08 18:03:45.016', '2019-09-08 18:03:45.016');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (594, 1, -5, 'smallblind', '2019-09-08 18:07:02.41', '2019-09-08 18:07:02.41');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (595, 2, -10, 'bigblind', '2019-09-08 18:07:02.804', '2019-09-08 18:07:02.804');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (596, 1, -5, 'smallblind', '2019-09-08 18:10:52.095', '2019-09-08 18:10:52.095');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (597, 1, -5, 'smallblind', '2019-09-08 18:10:52.196', '2019-09-08 18:10:52.196');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (598, 1, -5, 'smallblind', '2019-09-08 18:14:15.324', '2019-09-08 18:14:15.324');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (599, 1, -5, 'smallblind', '2019-09-08 18:14:16.066', '2019-09-08 18:14:16.066');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (600, 1, -5, 'smallblind', '2019-09-08 18:14:16.35', '2019-09-08 18:14:16.35');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (601, 1, -5, 'smallblind', '2019-09-08 18:14:17.261', '2019-09-08 18:14:17.261');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (602, 1, -5, 'smallblind', '2019-09-08 18:14:18.074', '2019-09-08 18:14:18.074');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (603, 1, -5, 'smallblind', '2019-09-08 18:14:19.295', '2019-09-08 18:14:19.295');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (604, 1, -5, 'smallblind', '2019-09-08 18:14:20.132', '2019-09-08 18:14:20.132');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (605, 1, -5, 'smallblind', '2019-09-08 18:14:21.275', '2019-09-08 18:14:21.275');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (606, 1, -5, 'smallblind', '2019-09-08 18:14:22.086', '2019-09-08 18:14:22.086');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (607, 1, -5, 'smallblind', '2019-09-08 18:14:23.264', '2019-09-08 18:14:23.264');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (608, 1, -5, 'smallblind', '2019-09-08 18:14:24.085', '2019-09-08 18:14:24.085');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (609, 1, -5, 'smallblind', '2019-09-08 18:14:25.276', '2019-09-08 18:14:25.276');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (610, 1, -5, 'smallblind', '2019-09-08 18:14:26.051', '2019-09-08 18:14:26.051');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (611, 1, -5, 'smallblind', '2019-09-08 18:14:28.111', '2019-09-08 18:14:28.111');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (612, 1, -5, 'smallblind', '2019-09-08 18:14:30.07', '2019-09-08 18:14:30.07');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (613, 2, -10, 'bigblind', '2019-09-08 18:14:32.097', '2019-09-08 18:14:32.097');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (614, 2, -10, 'bigblind', '2019-09-08 18:14:32.282', '2019-09-08 18:14:32.282');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (615, 2, -10, 'bigblind', '2019-09-08 18:14:34.096', '2019-09-08 18:14:34.096');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (616, 2, -10, 'bigblind', '2019-09-08 18:14:36.102', '2019-09-08 18:14:36.102');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (617, 2, -10, 'bigblind', '2019-09-08 18:14:38.106', '2019-09-08 18:14:38.106');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (618, 1, -5, 'smallblind', '2019-09-08 18:14:38.28', '2019-09-08 18:14:38.28');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (619, 1, -5, 'smallblind', '2019-09-08 18:14:39.787', '2019-09-08 18:14:39.787');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (620, 1, -5, 'smallblind', '2019-09-08 18:14:59.807', '2019-09-08 18:14:59.807');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (621, 1, -5, 'smallblind', '2019-09-08 18:14:59.808', '2019-09-08 18:14:59.808');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (622, 1, -5, 'smallblind', '2019-09-08 18:14:59.815', '2019-09-08 18:14:59.815');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (623, 1, -5, 'smallblind', '2019-09-08 18:17:16.664', '2019-09-08 18:17:16.664');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (624, 1, -5, 'smallblind', '2019-09-08 18:17:18.227', '2019-09-08 18:17:18.227');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (625, 1, -5, 'smallblind', '2019-09-08 18:17:18.605', '2019-09-08 18:17:18.605');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (626, 1, -5, 'smallblind', '2019-09-08 18:17:20.125', '2019-09-08 18:17:20.125');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (627, 1, -5, 'smallblind', '2019-09-08 18:17:20.61', '2019-09-08 18:17:20.61');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (628, 1, -5, 'smallblind', '2019-09-08 18:17:22.14', '2019-09-08 18:17:22.14');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (629, 1, -5, 'smallblind', '2019-09-08 18:17:22.601', '2019-09-08 18:17:22.601');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (630, 1, -5, 'smallblind', '2019-09-08 18:17:24.144', '2019-09-08 18:17:24.144');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (631, 1, -5, 'smallblind', '2019-09-08 18:17:24.61', '2019-09-08 18:17:24.61');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (632, 1, -5, 'smallblind', '2019-09-08 18:17:26.138', '2019-09-08 18:17:26.138');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (633, 1, -5, 'smallblind', '2019-09-08 18:17:26.6', '2019-09-08 18:17:26.6');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (634, 1, -5, 'smallblind', '2019-09-08 18:17:28.148', '2019-09-08 18:17:28.148');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (635, 1, -5, 'smallblind', '2019-09-08 18:17:28.598', '2019-09-08 18:17:28.598');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (636, 1, -5, 'smallblind', '2019-09-08 18:17:30.142', '2019-09-08 18:17:30.142');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (637, 1, -5, 'smallblind', '2019-09-08 18:17:32.171', '2019-09-08 18:17:32.171');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (638, 1, -5, 'smallblind', '2019-09-08 18:17:34.152', '2019-09-08 18:17:34.152');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (639, 1, -5, 'smallblind', '2019-09-08 18:17:36.14', '2019-09-08 18:17:36.14');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (640, 1, -5, 'smallblind', '2019-09-08 18:17:38.153', '2019-09-08 18:17:38.153');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (641, 1, -5, 'smallblind', '2019-09-08 18:17:38.642', '2019-09-08 18:17:38.642');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (642, 1, -5, 'smallblind', '2019-09-08 18:17:40.154', '2019-09-08 18:17:40.154');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (643, 1, -5, 'smallblind', '2019-09-08 18:17:40.629', '2019-09-08 18:17:40.629');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (644, 1, -5, 'smallblind', '2019-09-08 18:17:42.685', '2019-09-08 18:17:42.685');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (645, 1, -5, 'smallblind', '2019-09-08 18:17:44.635', '2019-09-08 18:17:44.635');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (646, 1, -5, 'smallblind', '2019-09-08 18:17:47.263', '2019-09-08 18:17:47.263');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (647, 1, -5, 'smallblind', '2019-09-08 18:17:49.311', '2019-09-08 18:17:49.311');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (648, 1, -5, 'smallblind', '2019-09-08 18:17:56.974', '2019-09-08 18:17:56.974');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (649, 1, -5, 'smallblind', '2019-09-08 18:23:29.048', '2019-09-08 18:23:29.048');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (650, 2, -10, 'bigblind', '2019-09-08 18:23:29.289', '2019-09-08 18:23:29.289');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (651, 1, -5, 'smallblind', '2019-09-08 18:23:29.604', '2019-09-08 18:23:29.604');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (652, 2, -10, 'bigblind', '2019-09-08 18:23:30.996', '2019-09-08 18:23:30.996');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (653, 1, -5, 'smallblind', '2019-09-08 18:26:34.151', '2019-09-08 18:26:34.151');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (654, 2, -10, 'bigblind', '2019-09-08 18:26:34.586', '2019-09-08 18:26:34.586');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (655, 1, -5, 'smallblind', '2019-09-08 18:27:54.027', '2019-09-08 18:27:54.027');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (656, 1, -5, 'smallblind', '2019-09-08 18:27:54.425', '2019-09-08 18:27:54.425');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (657, 2, -10, 'bigblind', '2019-09-08 18:27:54.509', '2019-09-08 18:27:54.509');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (658, 1, -5, 'smallblind', '2019-09-08 18:28:20.004', '2019-09-08 18:28:20.004');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (659, 1, -5, 'smallblind', '2019-09-08 18:28:20.479', '2019-09-08 18:28:20.479');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (660, 2, -10, 'bigblind', '2019-09-08 18:28:21.345', '2019-09-08 18:28:21.345');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (661, 1, -5, 'smallblind', '2019-09-08 18:28:24.492', '2019-09-08 18:28:24.492');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (662, 2, -10, 'bigblind', '2019-09-08 18:28:25.306', '2019-09-08 18:28:25.306');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (663, 1, -5, 'smallblind', '2019-09-08 18:30:27.727', '2019-09-08 18:30:27.727');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (664, 2, -10, 'bigblind', '2019-09-08 18:30:27.849', '2019-09-08 18:30:27.849');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (665, 2, -10, 'bigblind', '2019-09-08 18:30:28.852', '2019-09-08 18:30:28.852');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (666, 1, -5, 'smallblind', '2019-09-08 18:30:31.697', '2019-09-08 18:30:31.697');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (667, 2, -10, 'bigblind', '2019-09-08 18:30:31.847', '2019-09-08 18:30:31.847');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (668, 1, -5, 'smallblind', '2019-09-08 18:30:32.833', '2019-09-08 18:30:32.833');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (669, 2, -10, 'bigblind', '2019-09-08 18:30:33.71', '2019-09-08 18:30:33.71');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (670, 1, -5, 'smallblind', '2019-09-08 18:30:45.706', '2019-09-08 18:30:45.706');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (671, 2, -10, 'bigblind', '2019-09-08 18:30:45.932', '2019-09-08 18:30:45.932');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (672, 2, -10, 'bigblind', '2019-09-08 18:30:46.825', '2019-09-08 18:30:46.825');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (673, 1, -5, 'smallblind', '2019-09-08 18:30:51.857', '2019-09-08 18:30:51.857');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (674, 1, -5, 'smallblind', '2019-09-08 18:30:52.277', '2019-09-08 18:30:52.277');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (675, 1, -5, 'smallblind', '2019-09-08 18:30:52.848', '2019-09-08 18:30:52.848');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (676, 2, -10, 'bigblind', '2019-09-08 18:30:53.877', '2019-09-08 18:30:53.877');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (677, 2, -10, 'bigblind', '2019-09-08 18:30:54.273', '2019-09-08 18:30:54.273');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (678, 1, -5, 'smallblind', '2019-09-08 18:31:01.698', '2019-09-08 18:31:01.698');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (679, 2, -10, 'bigblind', '2019-09-08 18:31:01.863', '2019-09-08 18:31:01.863');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (680, 1, -5, 'smallblind', '2019-09-08 18:31:02.865', '2019-09-08 18:31:02.865');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (681, 2, -10, 'bigblind', '2019-09-08 18:31:03.728', '2019-09-08 18:31:03.728');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (682, 1, -5, 'smallblind', '2019-09-08 18:33:33.506', '2019-09-08 18:33:33.506');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (683, 2, -10, 'bigblind', '2019-09-08 18:33:33.657', '2019-09-08 18:33:33.657');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (684, 3, -5, 'smallblind', '2019-09-08 18:42:59.539', '2019-09-08 18:42:59.539');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (685, 2, -10, 'bigblind', '2019-09-08 18:42:59.872', '2019-09-08 18:42:59.872');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (686, 1, -10, 'firstbet', '2019-09-08 19:22:11.137', '2019-09-08 19:22:11.137');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (687, 1, -10, 'firstbet', '2019-09-08 19:29:38.392', '2019-09-08 19:29:38.392');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (688, 1, -10, 'firstbet', '2019-09-08 19:30:57.865', '2019-09-08 19:30:57.865');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (689, 1, -10, 'firstbet', '2019-09-08 19:31:44.709', '2019-09-08 19:31:44.709');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (690, 1, -10, 'firstbet', '2019-09-08 19:33:31.273', '2019-09-08 19:33:31.273');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (691, 1, -10, 'firstbet', '2019-09-08 19:39:07.961', '2019-09-08 19:39:07.961');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (692, 1, -10, 'firstbet', '2019-09-08 19:44:56.074', '2019-09-08 19:44:56.074');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (693, 1, -10, 'firstbet', '2019-09-08 19:45:06.081', '2019-09-08 19:45:06.081');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (694, 1, -10, 'firstbet', '2019-09-08 19:45:21.337', '2019-09-08 19:45:21.337');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (695, 3, -10, 'firstbet', '2019-09-08 19:45:45.698', '2019-09-08 19:45:45.698');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (696, 2, -10, 'firstbet', '2019-09-08 19:45:57.546', '2019-09-08 19:45:57.546');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (697, 2, -10, 'firstbet', '2019-09-08 19:47:44.617', '2019-09-08 19:47:44.617');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (698, 1, -10, 'firstbet', '2019-09-08 19:54:21.156', '2019-09-08 19:54:21.156');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (699, 3, -10, 'firstbet', '2019-09-08 19:54:55.052', '2019-09-08 19:54:55.052');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (700, 1, -10, 'firstbet', '2019-09-08 20:05:03.664', '2019-09-08 20:05:03.664');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (701, 2, -10, 'firstbet', '2019-09-08 20:05:18.246', '2019-09-08 20:05:18.246');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (702, 1, -10, 'firstbet', '2019-09-08 20:14:58.09', '2019-09-08 20:14:58.09');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (703, 2, -10, 'firstbet', '2019-09-08 20:15:09.734', '2019-09-08 20:15:09.734');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (704, 1, -10, 'firstbet', '2019-09-08 21:19:49.269', '2019-09-08 21:19:49.269');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (705, 2, -10, 'firstbet', '2019-09-08 21:19:58.946', '2019-09-08 21:19:58.946');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (706, 1, -10, 'firstbet', '2019-09-08 21:24:00.112', '2019-09-08 21:24:00.112');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (707, 2, -10, 'firstbet', '2019-09-08 21:24:09.887', '2019-09-08 21:24:09.887');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (708, 1, -10, 'firstbet', '2019-09-08 21:28:23.29', '2019-09-08 21:28:23.29');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (709, 2, -10, 'firstbet', '2019-09-08 21:28:33.225', '2019-09-08 21:28:33.225');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (710, 1, -10, 'firstbet', '2019-09-08 21:41:51.689', '2019-09-08 21:41:51.689');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (711, 1, -10, 'firstbet', '2019-09-08 21:44:37.512', '2019-09-08 21:44:37.512');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (712, 1, -10, 'firstbet', '2019-09-08 21:48:37.671', '2019-09-08 21:48:37.671');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (713, 1, -10, 'firstbet', '2019-09-09 11:12:30.601', '2019-09-09 11:12:30.601');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (714, 2, -10, 'firstbet', '2019-09-09 11:12:48.429', '2019-09-09 11:12:48.429');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (715, 1, -10, 'firstbet', '2019-09-09 11:19:56.801', '2019-09-09 11:19:56.801');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (716, 1, -10, 'firstbet', '2019-09-09 11:25:06.792', '2019-09-09 11:25:06.792');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (717, 2, -10, 'firstbet', '2019-09-09 11:25:16.958', '2019-09-09 11:25:16.958');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (718, 1, -10, 'firstbet', '2019-09-09 12:36:27.331', '2019-09-09 12:36:27.331');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (719, 3, -10, 'firstbet', '2019-09-09 12:36:33.608', '2019-09-09 12:36:33.608');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (720, 2, -10, 'firstbet', '2019-09-09 12:36:41.271', '2019-09-09 12:36:41.271');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (721, 1, -10, 'firstbet', '2019-09-09 15:50:11.703', '2019-09-09 15:50:11.703');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (722, 2, -10, 'firstbet', '2019-09-09 15:50:16.084', '2019-09-09 15:50:16.084');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (723, 3, -10, 'firstbet', '2019-09-09 15:50:20.917', '2019-09-09 15:50:20.917');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (724, 1, -10, 'firstbet', '2019-09-09 15:55:40.846', '2019-09-09 15:55:40.846');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (725, 2, -10, 'firstbet', '2019-09-09 15:55:45.912', '2019-09-09 15:55:45.912');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (726, 3, -10, 'firstbet', '2019-09-09 15:55:51.033', '2019-09-09 15:55:51.033');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (727, 1, -10, 'firstbet', '2019-09-09 16:03:20.329', '2019-09-09 16:03:20.329');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (728, 3, -10, 'firstbet', '2019-09-09 16:03:37.029', '2019-09-09 16:03:37.029');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (729, 2, -10, 'firstbet', '2019-09-09 16:03:50.8', '2019-09-09 16:03:50.8');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (730, 1, -10, 'firstbet', '2019-09-09 16:12:37.576', '2019-09-09 16:12:37.576');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (731, 3, -10, 'firstbet', '2019-09-09 16:12:44.913', '2019-09-09 16:12:44.913');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (732, 2, -10, 'firstbet', '2019-09-09 16:12:49.529', '2019-09-09 16:12:49.529');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (733, 1, -10, 'firstbet', '2019-09-09 17:10:26.842', '2019-09-09 17:10:26.842');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (734, 3, -10, 'firstbet', '2019-09-09 17:10:31.266', '2019-09-09 17:10:31.266');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (735, 2, -10, 'firstbet', '2019-09-09 17:10:35.555', '2019-09-09 17:10:35.555');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (736, 1, -10, 'firstbet', '2019-09-09 17:18:58.05', '2019-09-09 17:18:58.05');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (737, 3, -10, 'firstbet', '2019-09-09 17:19:03.264', '2019-09-09 17:19:03.264');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (738, 2, -10, 'firstbet', '2019-09-09 17:19:07.637', '2019-09-09 17:19:07.637');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (739, 1, -10, 'firstbet', '2019-09-09 17:21:42.741', '2019-09-09 17:21:42.741');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (740, 3, -10, 'firstbet', '2019-09-09 17:21:48.759', '2019-09-09 17:21:48.759');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (741, 2, -10, 'firstbet', '2019-09-09 17:21:52.01', '2019-09-09 17:21:52.01');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (742, 1, -10, 'firstbet', '2019-09-09 17:23:52.934', '2019-09-09 17:23:52.934');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (743, 3, -10, 'firstbet', '2019-09-09 17:23:57.2', '2019-09-09 17:23:57.2');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (744, 2, -10, 'firstbet', '2019-09-09 17:24:08.043', '2019-09-09 17:24:08.043');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (745, 1, -10, 'firstbet', '2019-09-09 17:33:15.246', '2019-09-09 17:33:15.246');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (746, 3, -10, 'firstbet', '2019-09-09 17:33:18.821', '2019-09-09 17:33:18.821');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (747, 2, -10, 'firstbet', '2019-09-09 17:33:22.413', '2019-09-09 17:33:22.413');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (748, 1, -10, 'firstbet', '2019-09-09 17:39:06.263', '2019-09-09 17:39:06.263');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (749, 2, -10, 'firstbet', '2019-09-09 17:39:08.866', '2019-09-09 17:39:08.866');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (750, 3, -10, 'firstbet', '2019-09-09 17:39:14.02', '2019-09-09 17:39:14.02');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (751, 1, -10, 'firstbet', '2019-09-09 17:40:00.118', '2019-09-09 17:40:00.118');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (752, 3, -10, 'firstbet', '2019-09-09 17:40:06.863', '2019-09-09 17:40:06.863');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (753, 2, -10, 'firstbet', '2019-09-09 17:40:09.87', '2019-09-09 17:40:09.87');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (754, 1, -10, 'firstbet', '2019-09-09 17:49:29.224', '2019-09-09 17:49:29.224');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (755, 3, -10, 'firstbet', '2019-09-09 17:49:37.908', '2019-09-09 17:49:37.908');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (756, 2, -10, 'firstbet', '2019-09-09 17:49:41.614', '2019-09-09 17:49:41.614');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (757, 1, -10, 'firstbet', '2019-09-09 17:55:30.287', '2019-09-09 17:55:30.287');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (758, 3, -10, 'firstbet', '2019-09-09 17:55:35.02', '2019-09-09 17:55:35.02');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (759, 2, -10, 'firstbet', '2019-09-09 17:55:37.812', '2019-09-09 17:55:37.812');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (760, 1, -10, 'firstbet', '2019-09-09 18:05:35.787', '2019-09-09 18:05:35.787');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (761, 3, -10, 'firstbet', '2019-09-09 18:05:39.66', '2019-09-09 18:05:39.66');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (762, 2, -10, 'firstbet', '2019-09-09 18:05:42.369', '2019-09-09 18:05:42.369');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (763, 1, -10, 'firstbet', '2019-09-09 18:07:19.301', '2019-09-09 18:07:19.301');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (764, 3, -10, 'firstbet', '2019-09-09 18:07:23.049', '2019-09-09 18:07:23.049');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (765, 2, -10, 'firstbet', '2019-09-09 18:07:26.99', '2019-09-09 18:07:26.99');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (766, 1, -10, 'firstbet', '2019-09-09 18:09:41.331', '2019-09-09 18:09:41.331');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (767, 2, -10, 'firstbet', '2019-09-09 18:09:43.385', '2019-09-09 18:09:43.385');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (768, 3, -10, 'firstbet', '2019-09-09 18:09:47.267', '2019-09-09 18:09:47.267');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (769, 1, -10, 'firstbet', '2019-09-09 18:19:00.211', '2019-09-09 18:19:00.211');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (770, 2, -10, 'firstbet', '2019-09-09 18:19:02.572', '2019-09-09 18:19:02.572');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (771, 3, -10, 'firstbet', '2019-09-09 18:19:06.483', '2019-09-09 18:19:06.483');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (772, 1, -10, 'firstbet', '2019-09-09 18:24:56.245', '2019-09-09 18:24:56.245');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (773, 2, -10, 'firstbet', '2019-09-09 18:24:58.249', '2019-09-09 18:24:58.249');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (774, 3, -10, 'firstbet', '2019-09-09 18:25:01.893', '2019-09-09 18:25:01.893');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (775, 1, -10, 'firstbet', '2019-09-09 18:26:33.939', '2019-09-09 18:26:33.939');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (776, 2, -10, 'firstbet', '2019-09-09 18:26:37.541', '2019-09-09 18:26:37.541');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (777, 3, -10, 'firstbet', '2019-09-09 18:26:42.992', '2019-09-09 18:26:42.992');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (778, 1, -10, 'firstbet', '2019-09-09 18:43:23.441', '2019-09-09 18:43:23.441');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (779, 2, -10, 'firstbet', '2019-09-09 18:43:28.018', '2019-09-09 18:43:28.018');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (780, 1, -10, 'firstbet', '2019-09-09 18:47:26.154', '2019-09-09 18:47:26.154');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (781, 2, -10, 'firstbet', '2019-09-09 18:47:29.372', '2019-09-09 18:47:29.372');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (782, 1, -10, 'firstbet', '2019-09-09 18:51:34.131', '2019-09-09 18:51:34.131');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (783, 2, -10, 'firstbet', '2019-09-09 18:51:37.13', '2019-09-09 18:51:37.13');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (784, 1, -10, 'firstbet', '2019-09-09 19:09:37.781', '2019-09-09 19:09:37.781');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (785, 2, -10, 'firstbet', '2019-09-09 19:09:40.248', '2019-09-09 19:09:40.248');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (786, 1, -10, 'call', '2019-09-09 19:11:35.361', '2019-09-09 19:11:35.361');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (787, 2, -10, 'call', '2019-09-09 19:11:46.44', '2019-09-09 19:11:46.44');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (788, 1, -10, 'firstbet', '2019-09-09 19:19:49.148', '2019-09-09 19:19:49.148');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (789, 2, -10, 'firstbet', '2019-09-09 19:19:56.732', '2019-09-09 19:19:56.732');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (790, 1, -10, 'call', '2019-09-09 19:20:08.638', '2019-09-09 19:20:08.638');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (791, 1, -10, 'firstbet', '2019-09-09 19:36:23.776', '2019-09-09 19:36:23.776');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (792, 2, -10, 'firstbet', '2019-09-09 19:36:25.626', '2019-09-09 19:36:25.626');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (793, 1, -10, 'call', '2019-09-09 19:36:38.011', '2019-09-09 19:36:38.011');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (794, 2, -10, 'call', '2019-09-09 19:38:25.893', '2019-09-09 19:38:25.893');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (795, 1, -10, 'firstbet', '2019-09-09 19:40:23.393', '2019-09-09 19:40:23.393');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (796, 2, -10, 'firstbet', '2019-09-09 19:40:25.082', '2019-09-09 19:40:25.082');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (797, 1, -10, 'call', '2019-09-09 19:40:30.002', '2019-09-09 19:40:30.002');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (798, 2, -10, 'call', '2019-09-09 19:40:33.951', '2019-09-09 19:40:33.951');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (799, 2, -10, 'call', '2019-09-09 19:40:51.923', '2019-09-09 19:40:51.923');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (800, 1, -10, 'firstbet', '2019-09-09 20:07:55.833', '2019-09-09 20:07:55.833');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (801, 2, -10, 'firstbet', '2019-09-09 20:07:58.514', '2019-09-09 20:07:58.514');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (802, 3, -10, 'firstbet', '2019-09-09 20:08:09.261', '2019-09-09 20:08:09.261');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (803, 1, -10, 'call', '2019-09-09 20:08:17.098', '2019-09-09 20:08:17.098');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (804, 1, -10, 'firstbet', '2019-09-09 20:11:13.968', '2019-09-09 20:11:13.968');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (805, 2, -10, 'firstbet', '2019-09-09 20:11:17.26', '2019-09-09 20:11:17.26');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (806, 3, -10, 'firstbet', '2019-09-09 20:11:23.536', '2019-09-09 20:11:23.536');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (807, 1, -10, 'call', '2019-09-09 20:11:44.743', '2019-09-09 20:11:44.743');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (808, 2, -15, 'raise', '2019-09-09 20:15:10.048', '2019-09-09 20:15:10.048');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (809, 3, -10, 'call', '2019-09-09 20:15:26.362', '2019-09-09 20:15:26.362');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (810, 1, -10, 'firstbet', '2019-09-09 20:23:55.977', '2019-09-09 20:23:55.977');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (811, 2, -10, 'firstbet', '2019-09-09 20:23:58.01', '2019-09-09 20:23:58.01');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (812, 3, -10, 'firstbet', '2019-09-09 20:24:05.416', '2019-09-09 20:24:05.416');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (813, 2, -15, 'raise', '2019-09-09 20:24:19.034', '2019-09-09 20:24:19.034');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (814, 3, -15, 'call', '2019-09-09 20:24:32.706', '2019-09-09 20:24:32.706');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (815, 1, -10, 'firstbet', '2019-09-09 20:29:11.407', '2019-09-09 20:29:11.407');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (816, 2, -10, 'firstbet', '2019-09-09 20:29:14.373', '2019-09-09 20:29:14.373');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (817, 3, -10, 'firstbet', '2019-09-09 20:29:17.722', '2019-09-09 20:29:17.722');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (818, 2, -15, 'raise', '2019-09-09 20:29:29.719', '2019-09-09 20:29:29.719');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (819, 3, -15, 'call', '2019-09-09 20:29:35.845', '2019-09-09 20:29:35.845');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (820, 1, -15, 'call', '2019-09-09 20:29:43.731', '2019-09-09 20:29:43.731');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (821, 1, -10, 'firstbet', '2019-09-09 20:33:29.637', '2019-09-09 20:33:29.637');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (822, 2, -10, 'firstbet', '2019-09-09 20:33:33.031', '2019-09-09 20:33:33.031');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (823, 3, -10, 'firstbet', '2019-09-09 20:33:35.93', '2019-09-09 20:33:35.93');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (824, 2, -15, 'raise', '2019-09-09 20:33:58.564', '2019-09-09 20:33:58.564');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (825, 3, -15, 'call', '2019-09-09 20:34:04.97', '2019-09-09 20:34:04.97');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (826, 1, -15, 'call', '2019-09-09 20:34:14.276', '2019-09-09 20:34:14.276');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (827, 1, -20, 'raise', '2019-09-09 20:34:33.723', '2019-09-09 20:34:33.723');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (828, 2, 0, 'call', '2019-09-09 20:34:42.758', '2019-09-09 20:34:42.758');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (829, 1, -10, 'firstbet', '2019-09-09 20:41:50.131', '2019-09-09 20:41:50.131');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (830, 2, -10, 'firstbet', '2019-09-09 20:41:53.631', '2019-09-09 20:41:53.631');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (831, 3, -10, 'firstbet', '2019-09-09 20:41:59.133', '2019-09-09 20:41:59.133');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (832, 2, -15, 'raise', '2019-09-09 20:42:19.317', '2019-09-09 20:42:19.317');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (833, 3, -15, 'call', '2019-09-09 20:42:26.944', '2019-09-09 20:42:26.944');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (834, 1, -15, 'call', '2019-09-09 20:42:34.595', '2019-09-09 20:42:34.595');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (835, 1, -15, 'raise', '2019-09-09 20:42:46.943', '2019-09-09 20:42:46.943');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (836, 2, 0, 'call', '2019-09-09 20:42:53.544', '2019-09-09 20:42:53.544');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (837, 3, 0, 'call', '2019-09-09 20:43:03.344', '2019-09-09 20:43:03.344');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (838, 1, -10, 'firstbet', '2019-09-09 20:59:20.806', '2019-09-09 20:59:20.806');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (839, 2, -10, 'firstbet', '2019-09-09 20:59:23.005', '2019-09-09 20:59:23.005');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (840, 3, -10, 'firstbet', '2019-09-09 20:59:27.441', '2019-09-09 20:59:27.441');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (841, 2, -15, 'raise', '2019-09-09 20:59:34.83', '2019-09-09 20:59:34.83');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (842, 3, -15, 'call', '2019-09-09 20:59:38.844', '2019-09-09 20:59:38.844');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (843, 1, -15, 'call', '2019-09-09 20:59:47.633', '2019-09-09 20:59:47.633');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (844, 1, -15, 'raise', '2019-09-09 21:00:11.886', '2019-09-09 21:00:11.886');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (845, 2, -15, 'call', '2019-09-09 21:00:16.302', '2019-09-09 21:00:16.302');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (846, 1, -10, 'firstbet', '2019-09-09 21:09:33.852', '2019-09-09 21:09:33.852');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (847, 2, -10, 'firstbet', '2019-09-09 21:09:36.055', '2019-09-09 21:09:36.055');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (848, 3, -10, 'firstbet', '2019-09-09 21:09:39.278', '2019-09-09 21:09:39.278');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (849, 2, -15, 'raise', '2019-09-09 21:09:47.095', '2019-09-09 21:09:47.095');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (850, 1, 1000, 'Add from personal area', '2019-09-10 12:36:39.758', '2019-09-10 12:36:39.758');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (851, 1, 1000, 'Add from personal area', '2019-09-10 12:37:24.061', '2019-09-10 12:37:24.061');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (852, 1, 1000, 'Add from personal area', '2019-09-10 12:38:52.665', '2019-09-10 12:38:52.665');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (853, 1, 1000, 'Add from personal area', '2019-09-10 12:40:36.901', '2019-09-10 12:40:36.901');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (854, 1, 1000, 'Add from personal area', '2019-09-10 12:42:24.25', '2019-09-10 12:42:24.25');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (855, 1, -10, 'firstbet', '2019-09-11 17:39:19.547', '2019-09-11 17:39:19.547');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (856, 2, -10, 'firstbet', '2019-09-11 17:39:23.003', '2019-09-11 17:39:23.003');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (857, 2, 5000, 'Add from personal area', '2019-09-11 17:52:47.855', '2019-09-11 17:52:47.855');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (858, 1, -10, 'firstbet', '2019-09-11 17:56:05.15', '2019-09-11 17:56:05.15');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (859, 2, -10, 'firstbet', '2019-09-11 17:56:08.785', '2019-09-11 17:56:08.785');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (860, 1, -10, 'firstbet', '2019-09-11 18:07:27.948', '2019-09-11 18:07:27.948');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (861, 3, 5000, 'Add from personal area', '2019-09-12 09:59:37.661', '2019-09-12 09:59:37.661');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (862, 1, -10, 'firstbet', '2019-09-12 10:00:30.371', '2019-09-12 10:00:30.371');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (863, 2, -10, 'firstbet', '2019-09-12 10:00:35.354', '2019-09-12 10:00:35.354');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (864, 3, -10, 'firstbet', '2019-09-12 10:00:40.895', '2019-09-12 10:00:40.895');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (865, 3, -10, 'firstbet', '2019-09-12 10:29:01.037', '2019-09-12 10:29:01.037');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (866, 2, -10, 'firstbet', '2019-09-12 10:29:05.137', '2019-09-12 10:29:05.137');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (867, 1, -10, 'firstbet', '2019-09-12 10:29:20.865', '2019-09-12 10:29:20.865');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (868, 2, -10, 'firstbet', '2019-09-12 11:07:37.729', '2019-09-12 11:07:37.729');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (869, 1, -10, 'firstbet', '2019-09-12 11:07:40.758', '2019-09-12 11:07:40.758');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (870, 3, -10, 'firstbet', '2019-09-12 11:07:49.69', '2019-09-12 11:07:49.69');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (871, 1, -10, 'firstbet', '2019-09-12 11:17:04.629', '2019-09-12 11:17:04.629');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (872, 2, -10, 'firstbet', '2019-09-12 11:17:09.066', '2019-09-12 11:17:09.066');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (873, 3, -10, 'firstbet', '2019-09-12 11:17:15.454', '2019-09-12 11:17:15.454');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (874, 1, -10, 'firstbet', '2019-09-12 11:25:24.254', '2019-09-12 11:25:24.254');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (875, 2, -10, 'firstbet', '2019-09-12 11:25:29.823', '2019-09-12 11:25:29.823');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (876, 3, -10, 'firstbet', '2019-09-12 11:25:33.825', '2019-09-12 11:25:33.825');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (877, 1, -10, 'firstbet', '2019-09-12 11:39:33.788', '2019-09-12 11:39:33.788');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (878, 2, -10, 'firstbet', '2019-09-12 11:39:39.232', '2019-09-12 11:39:39.232');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (879, 3, -10, 'firstbet', '2019-09-12 11:39:43.962', '2019-09-12 11:39:43.962');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (880, 1, -10, 'firstbet', '2019-09-12 13:20:35.982', '2019-09-12 13:20:35.982');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (881, 2, -10, 'firstbet', '2019-09-12 13:20:39.006', '2019-09-12 13:20:39.006');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (882, 3, -10, 'firstbet', '2019-09-12 13:20:42.691', '2019-09-12 13:20:42.691');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (883, 1, -10, 'firstbet', '2019-09-12 14:15:26.114', '2019-09-12 14:15:26.114');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (884, 2, -10, 'firstbet', '2019-09-12 14:15:27.633', '2019-09-12 14:15:27.633');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (885, 3, -10, 'firstbet', '2019-09-12 14:15:30.583', '2019-09-12 14:15:30.583');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (886, 1, -10, 'firstbet', '2019-09-12 14:25:51.323', '2019-09-12 14:25:51.323');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (887, 2, -10, 'firstbet', '2019-09-12 14:25:55.147', '2019-09-12 14:25:55.147');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (888, 3, -10, 'firstbet', '2019-09-12 14:26:00.49', '2019-09-12 14:26:00.49');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (889, 1, -10, 'firstbet', '2019-09-12 15:50:44.883', '2019-09-12 15:50:44.883');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (890, 2, -10, 'firstbet', '2019-09-12 15:50:48.3', '2019-09-12 15:50:48.3');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (891, 3, -10, 'firstbet', '2019-09-12 15:50:52.073', '2019-09-12 15:50:52.073');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (892, 1, -10, 'firstbet', '2019-09-12 16:14:23.224', '2019-09-12 16:14:23.224');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (893, 2, -10, 'firstbet', '2019-09-12 16:14:25.97', '2019-09-12 16:14:25.97');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (894, 3, -10, 'firstbet', '2019-09-12 16:14:31.684', '2019-09-12 16:14:31.684');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (895, 1, 10, 'win', '2019-09-12 16:14:50.505', '2019-09-12 16:14:50.505');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (896, 2, 10, 'win', '2019-09-12 16:14:50.671', '2019-09-12 16:14:50.671');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (897, 3, 10, 'win', '2019-09-12 16:14:50.704', '2019-09-12 16:14:50.704');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (898, 1, -10, 'firstbet', '2019-09-13 11:03:45.792', '2019-09-13 11:03:45.792');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (899, 2, -10, 'firstbet', '2019-09-13 11:03:48.001', '2019-09-13 11:03:48.001');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (900, 3, -10, 'firstbet', '2019-09-13 11:03:51.289', '2019-09-13 11:03:51.289');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (901, 1, 10, 'win', '2019-09-13 11:04:06.594', '2019-09-13 11:04:06.594');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (902, 2, 10, 'win', '2019-09-13 11:04:06.601', '2019-09-13 11:04:06.601');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (903, 3, 10, 'win', '2019-09-13 11:04:06.736', '2019-09-13 11:04:06.736');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (904, 3, 30, 'win', '2019-09-13 11:04:06.737', '2019-09-13 11:04:06.737');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (905, 1, -10, 'firstbet', '2019-09-13 12:00:35.677', '2019-09-13 12:00:35.677');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (906, 2, -10, 'firstbet', '2019-09-13 12:00:37.505', '2019-09-13 12:00:37.505');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (907, 3, -10, 'firstbet', '2019-09-13 12:00:40.647', '2019-09-13 12:00:40.647');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (908, 1, 10, 'win', '2019-09-13 12:01:04.999', '2019-09-13 12:01:04.999');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (909, 2, 10, 'win', '2019-09-13 12:01:05.003', '2019-09-13 12:01:05.003');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (910, 3, 10, 'win', '2019-09-13 12:01:05.008', '2019-09-13 12:01:05.008');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (911, 1, 0, 'win', '2019-09-13 12:01:05.55', '2019-09-13 12:01:05.55');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (912, 2, 0, 'win', '2019-09-13 12:01:05.553', '2019-09-13 12:01:05.553');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (913, 3, 0, 'win', '2019-09-13 12:01:05.557', '2019-09-13 12:01:05.557');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (914, 1, 0, 'win', '2019-09-13 12:01:06.181', '2019-09-13 12:01:06.181');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (915, 2, 0, 'win', '2019-09-13 12:01:06.189', '2019-09-13 12:01:06.189');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (916, 3, 0, 'win', '2019-09-13 12:01:06.198', '2019-09-13 12:01:06.198');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (917, 1, 0, 'win', '2019-09-13 12:01:07.826', '2019-09-13 12:01:07.826');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (918, 2, 0, 'win', '2019-09-13 12:01:07.831', '2019-09-13 12:01:07.831');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (919, 3, 0, 'win', '2019-09-13 12:01:07.84', '2019-09-13 12:01:07.84');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (920, 1, 0, 'win', '2019-09-13 12:01:08.641', '2019-09-13 12:01:08.641');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (921, 2, 0, 'win', '2019-09-13 12:01:08.715', '2019-09-13 12:01:08.715');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (922, 3, 0, 'win', '2019-09-13 12:01:08.756', '2019-09-13 12:01:08.756');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (923, 1, 0, 'win', '2019-09-13 12:01:09.135', '2019-09-13 12:01:09.135');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (924, 2, 0, 'win', '2019-09-13 12:01:09.273', '2019-09-13 12:01:09.273');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (925, 3, 0, 'win', '2019-09-13 12:01:09.31', '2019-09-13 12:01:09.31');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (926, 1, 0, 'win', '2019-09-13 12:01:10.801', '2019-09-13 12:01:10.801');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (927, 2, 0, 'win', '2019-09-13 12:01:10.806', '2019-09-13 12:01:10.806');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (928, 3, 0, 'win', '2019-09-13 12:01:10.813', '2019-09-13 12:01:10.813');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (929, 1, 0, 'win', '2019-09-13 12:01:11.545', '2019-09-13 12:01:11.545');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (930, 2, 0, 'win', '2019-09-13 12:01:11.548', '2019-09-13 12:01:11.548');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (931, 3, 0, 'win', '2019-09-13 12:01:11.552', '2019-09-13 12:01:11.552');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (932, 1, 0, 'win', '2019-09-13 12:01:12.135', '2019-09-13 12:01:12.135');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (933, 2, 0, 'win', '2019-09-13 12:01:12.144', '2019-09-13 12:01:12.144');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (934, 3, 0, 'win', '2019-09-13 12:01:12.152', '2019-09-13 12:01:12.152');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (935, 1, 0, 'win', '2019-09-13 12:01:13.796', '2019-09-13 12:01:13.796');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (936, 2, 0, 'win', '2019-09-13 12:01:13.801', '2019-09-13 12:01:13.801');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (937, 3, 0, 'win', '2019-09-13 12:01:13.805', '2019-09-13 12:01:13.805');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (938, 1, 0, 'win', '2019-09-13 12:01:14.557', '2019-09-13 12:01:14.557');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (939, 2, 0, 'win', '2019-09-13 12:01:14.562', '2019-09-13 12:01:14.562');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (940, 3, 0, 'win', '2019-09-13 12:01:14.567', '2019-09-13 12:01:14.567');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (941, 1, 0, 'win', '2019-09-13 12:01:15.12', '2019-09-13 12:01:15.12');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (942, 2, 0, 'win', '2019-09-13 12:01:15.123', '2019-09-13 12:01:15.123');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (943, 3, 0, 'win', '2019-09-13 12:01:15.128', '2019-09-13 12:01:15.128');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (944, 1, 0, 'win', '2019-09-13 12:01:17.343', '2019-09-13 12:01:17.343');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (945, 2, 0, 'win', '2019-09-13 12:01:17.348', '2019-09-13 12:01:17.348');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (946, 3, 0, 'win', '2019-09-13 12:01:17.352', '2019-09-13 12:01:17.352');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (947, 1, 0, 'win', '2019-09-13 12:01:17.544', '2019-09-13 12:01:17.544');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (948, 2, 0, 'win', '2019-09-13 12:01:17.547', '2019-09-13 12:01:17.547');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (949, 3, 0, 'win', '2019-09-13 12:01:17.55', '2019-09-13 12:01:17.55');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (950, 1, 0, 'win', '2019-09-13 12:01:18.138', '2019-09-13 12:01:18.138');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (951, 2, 0, 'win', '2019-09-13 12:01:18.145', '2019-09-13 12:01:18.145');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (952, 3, 0, 'win', '2019-09-13 12:01:18.15', '2019-09-13 12:01:18.15');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (953, 1, 0, 'win', '2019-09-13 12:01:20.328', '2019-09-13 12:01:20.328');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (954, 2, 0, 'win', '2019-09-13 12:01:20.33', '2019-09-13 12:01:20.33');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (955, 3, 0, 'win', '2019-09-13 12:01:20.333', '2019-09-13 12:01:20.333');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (956, 1, 0, 'win', '2019-09-13 12:01:20.553', '2019-09-13 12:01:20.553');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (957, 2, 0, 'win', '2019-09-13 12:01:20.557', '2019-09-13 12:01:20.557');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (958, 3, 0, 'win', '2019-09-13 12:01:20.561', '2019-09-13 12:01:20.561');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (959, 1, 0, 'win', '2019-09-13 12:01:21.128', '2019-09-13 12:01:21.128');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (960, 2, 0, 'win', '2019-09-13 12:01:21.132', '2019-09-13 12:01:21.132');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (961, 3, 0, 'win', '2019-09-13 12:01:21.136', '2019-09-13 12:01:21.136');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (962, 1, 0, 'win', '2019-09-13 12:01:23.364', '2019-09-13 12:01:23.364');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (963, 2, 0, 'win', '2019-09-13 12:01:23.369', '2019-09-13 12:01:23.369');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (964, 3, 0, 'win', '2019-09-13 12:01:23.373', '2019-09-13 12:01:23.373');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (965, 1, 0, 'win', '2019-09-13 12:01:23.547', '2019-09-13 12:01:23.547');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (966, 2, 0, 'win', '2019-09-13 12:01:23.55', '2019-09-13 12:01:23.55');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (967, 3, 0, 'win', '2019-09-13 12:01:23.554', '2019-09-13 12:01:23.554');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (968, 1, 0, 'win', '2019-09-13 12:01:24.14', '2019-09-13 12:01:24.14');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (969, 2, 0, 'win', '2019-09-13 12:01:24.146', '2019-09-13 12:01:24.146');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (970, 3, 0, 'win', '2019-09-13 12:01:24.151', '2019-09-13 12:01:24.151');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (971, 1, 0, 'win', '2019-09-13 12:01:26.347', '2019-09-13 12:01:26.347');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (972, 2, 0, 'win', '2019-09-13 12:01:26.493', '2019-09-13 12:01:26.493');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (973, 3, 0, 'win', '2019-09-13 12:01:26.552', '2019-09-13 12:01:26.552');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (974, 1, 0, 'win', '2019-09-13 12:01:26.664', '2019-09-13 12:01:26.664');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (975, 2, 0, 'win', '2019-09-13 12:01:26.67', '2019-09-13 12:01:26.67');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (976, 3, 0, 'win', '2019-09-13 12:01:26.674', '2019-09-13 12:01:26.674');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (977, 1, 0, 'win', '2019-09-13 12:01:27.121', '2019-09-13 12:01:27.121');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (978, 2, 0, 'win', '2019-09-13 12:01:27.124', '2019-09-13 12:01:27.124');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (979, 3, 0, 'win', '2019-09-13 12:01:27.127', '2019-09-13 12:01:27.127');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (980, 1, 0, 'win', '2019-09-13 12:01:29.341', '2019-09-13 12:01:29.341');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (981, 2, 0, 'win', '2019-09-13 12:01:29.346', '2019-09-13 12:01:29.346');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (982, 3, 0, 'win', '2019-09-13 12:01:29.352', '2019-09-13 12:01:29.352');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (983, 1, 0, 'win', '2019-09-13 12:01:29.545', '2019-09-13 12:01:29.545');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (984, 2, 0, 'win', '2019-09-13 12:01:29.548', '2019-09-13 12:01:29.548');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (985, 3, 0, 'win', '2019-09-13 12:01:29.551', '2019-09-13 12:01:29.551');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (986, 1, 0, 'win', '2019-09-13 12:01:30.157', '2019-09-13 12:01:30.157');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (987, 2, 0, 'win', '2019-09-13 12:01:30.17', '2019-09-13 12:01:30.17');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (988, 3, 0, 'win', '2019-09-13 12:01:30.179', '2019-09-13 12:01:30.179');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (989, 1, 0, 'win', '2019-09-13 12:01:32.325', '2019-09-13 12:01:32.325');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (990, 2, 0, 'win', '2019-09-13 12:01:32.328', '2019-09-13 12:01:32.328');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (991, 3, 0, 'win', '2019-09-13 12:01:32.331', '2019-09-13 12:01:32.331');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (992, 1, 0, 'win', '2019-09-13 12:01:32.554', '2019-09-13 12:01:32.554');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (993, 2, 0, 'win', '2019-09-13 12:01:32.558', '2019-09-13 12:01:32.558');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (994, 3, 0, 'win', '2019-09-13 12:01:32.561', '2019-09-13 12:01:32.561');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (995, 1, 0, 'win', '2019-09-13 12:01:33.109', '2019-09-13 12:01:33.109');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (996, 2, 0, 'win', '2019-09-13 12:01:33.112', '2019-09-13 12:01:33.112');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (997, 3, 0, 'win', '2019-09-13 12:01:33.115', '2019-09-13 12:01:33.115');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (998, 1, 0, 'win', '2019-09-13 12:01:35.489', '2019-09-13 12:01:35.489');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (999, 2, 0, 'win', '2019-09-13 12:01:35.494', '2019-09-13 12:01:35.494');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1000, 3, 0, 'win', '2019-09-13 12:01:35.498', '2019-09-13 12:01:35.498');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1001, 1, 0, 'win', '2019-09-13 12:01:35.55', '2019-09-13 12:01:35.55');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1002, 2, 0, 'win', '2019-09-13 12:01:35.553', '2019-09-13 12:01:35.553');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1003, 3, 0, 'win', '2019-09-13 12:01:35.557', '2019-09-13 12:01:35.557');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1004, 1, 0, 'win', '2019-09-13 12:01:36.14', '2019-09-13 12:01:36.14');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1005, 2, 0, 'win', '2019-09-13 12:01:36.144', '2019-09-13 12:01:36.144');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1006, 3, 0, 'win', '2019-09-13 12:01:36.148', '2019-09-13 12:01:36.148');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1007, 1, 0, 'win', '2019-09-13 12:01:38.356', '2019-09-13 12:01:38.356');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1008, 2, 0, 'win', '2019-09-13 12:01:38.359', '2019-09-13 12:01:38.359');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1009, 3, 0, 'win', '2019-09-13 12:01:38.362', '2019-09-13 12:01:38.362');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1010, 1, 0, 'win', '2019-09-13 12:01:38.55', '2019-09-13 12:01:38.55');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1011, 2, 0, 'win', '2019-09-13 12:01:38.553', '2019-09-13 12:01:38.553');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1012, 3, 0, 'win', '2019-09-13 12:01:38.556', '2019-09-13 12:01:38.556');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1013, 1, 0, 'win', '2019-09-13 12:01:39.132', '2019-09-13 12:01:39.132');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1014, 2, 0, 'win', '2019-09-13 12:01:39.138', '2019-09-13 12:01:39.138');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1015, 3, 0, 'win', '2019-09-13 12:01:39.142', '2019-09-13 12:01:39.142');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1025, 1, 0, 'win', '2019-09-13 12:01:44.344', '2019-09-13 12:01:44.344');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1026, 2, 0, 'win', '2019-09-13 12:01:44.347', '2019-09-13 12:01:44.347');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1027, 3, 0, 'win', '2019-09-13 12:01:44.35', '2019-09-13 12:01:44.35');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1028, 1, 0, 'win', '2019-09-13 12:01:44.55', '2019-09-13 12:01:44.55');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1029, 2, 0, 'win', '2019-09-13 12:01:44.553', '2019-09-13 12:01:44.553');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1030, 3, 0, 'win', '2019-09-13 12:01:44.557', '2019-09-13 12:01:44.557');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1034, 1, 0, 'win', '2019-09-13 12:01:47.352', '2019-09-13 12:01:47.352');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1035, 2, 0, 'win', '2019-09-13 12:01:47.356', '2019-09-13 12:01:47.356');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1036, 3, 0, 'win', '2019-09-13 12:01:47.36', '2019-09-13 12:01:47.36');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1037, 1, 0, 'win', '2019-09-13 12:01:47.547', '2019-09-13 12:01:47.547');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1038, 2, 0, 'win', '2019-09-13 12:01:47.55', '2019-09-13 12:01:47.55');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1039, 3, 0, 'win', '2019-09-13 12:01:47.553', '2019-09-13 12:01:47.553');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1061, 1, 0, 'win', '2019-09-13 12:01:56.322', '2019-09-13 12:01:56.322');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1062, 2, 0, 'win', '2019-09-13 12:01:56.325', '2019-09-13 12:01:56.325');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1063, 3, 0, 'win', '2019-09-13 12:01:56.327', '2019-09-13 12:01:56.327');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1079, 1, 0, 'win', '2019-09-13 12:02:02.32', '2019-09-13 12:02:02.32');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1080, 2, 0, 'win', '2019-09-13 12:02:02.323', '2019-09-13 12:02:02.323');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1081, 3, 0, 'win', '2019-09-13 12:02:02.325', '2019-09-13 12:02:02.325');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1082, 1, 0, 'win', '2019-09-13 12:02:02.552', '2019-09-13 12:02:02.552');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1083, 2, 0, 'win', '2019-09-13 12:02:02.555', '2019-09-13 12:02:02.555');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1084, 3, 0, 'win', '2019-09-13 12:02:02.558', '2019-09-13 12:02:02.558');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1085, 1, 0, 'win', '2019-09-13 12:02:03.122', '2019-09-13 12:02:03.122');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1086, 2, 0, 'win', '2019-09-13 12:02:03.124', '2019-09-13 12:02:03.124');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1087, 3, 0, 'win', '2019-09-13 12:02:03.126', '2019-09-13 12:02:03.126');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1016, 1, 0, 'win', '2019-09-13 12:01:41.385', '2019-09-13 12:01:41.385');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1017, 2, 0, 'win', '2019-09-13 12:01:41.389', '2019-09-13 12:01:41.389');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1018, 3, 0, 'win', '2019-09-13 12:01:41.392', '2019-09-13 12:01:41.392');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1019, 1, 0, 'win', '2019-09-13 12:01:41.585', '2019-09-13 12:01:41.585');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1020, 2, 0, 'win', '2019-09-13 12:01:41.588', '2019-09-13 12:01:41.588');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1021, 3, 0, 'win', '2019-09-13 12:01:41.592', '2019-09-13 12:01:41.592');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1022, 1, 0, 'win', '2019-09-13 12:01:42.139', '2019-09-13 12:01:42.139');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1023, 2, 0, 'win', '2019-09-13 12:01:42.144', '2019-09-13 12:01:42.144');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1024, 3, 0, 'win', '2019-09-13 12:01:42.149', '2019-09-13 12:01:42.149');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1031, 1, 0, 'win', '2019-09-13 12:01:45.186', '2019-09-13 12:01:45.186');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1032, 2, 0, 'win', '2019-09-13 12:01:45.188', '2019-09-13 12:01:45.188');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1033, 3, 0, 'win', '2019-09-13 12:01:45.191', '2019-09-13 12:01:45.191');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1040, 1, 0, 'win', '2019-09-13 12:01:48.12', '2019-09-13 12:01:48.12');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1041, 2, 0, 'win', '2019-09-13 12:01:48.126', '2019-09-13 12:01:48.126');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1042, 3, 0, 'win', '2019-09-13 12:01:48.131', '2019-09-13 12:01:48.131');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1043, 1, 0, 'win', '2019-09-13 12:01:50.318', '2019-09-13 12:01:50.318');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1044, 2, 0, 'win', '2019-09-13 12:01:50.321', '2019-09-13 12:01:50.321');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1045, 3, 0, 'win', '2019-09-13 12:01:50.323', '2019-09-13 12:01:50.323');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1046, 1, 0, 'win', '2019-09-13 12:01:50.553', '2019-09-13 12:01:50.553');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1047, 2, 0, 'win', '2019-09-13 12:01:50.557', '2019-09-13 12:01:50.557');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1048, 3, 0, 'win', '2019-09-13 12:01:50.56', '2019-09-13 12:01:50.56');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1049, 1, 0, 'win', '2019-09-13 12:01:51.11', '2019-09-13 12:01:51.11');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1050, 2, 0, 'win', '2019-09-13 12:01:51.113', '2019-09-13 12:01:51.113');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1051, 3, 0, 'win', '2019-09-13 12:01:51.116', '2019-09-13 12:01:51.116');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1052, 1, 0, 'win', '2019-09-13 12:01:53.345', '2019-09-13 12:01:53.345');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1053, 2, 0, 'win', '2019-09-13 12:01:53.35', '2019-09-13 12:01:53.35');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1054, 3, 0, 'win', '2019-09-13 12:01:53.354', '2019-09-13 12:01:53.354');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1055, 1, 0, 'win', '2019-09-13 12:01:53.548', '2019-09-13 12:01:53.548');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1056, 2, 0, 'win', '2019-09-13 12:01:53.551', '2019-09-13 12:01:53.551');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1057, 3, 0, 'win', '2019-09-13 12:01:53.554', '2019-09-13 12:01:53.554');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1058, 1, 0, 'win', '2019-09-13 12:01:54.128', '2019-09-13 12:01:54.128');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1059, 2, 0, 'win', '2019-09-13 12:01:54.133', '2019-09-13 12:01:54.133');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1060, 3, 0, 'win', '2019-09-13 12:01:54.138', '2019-09-13 12:01:54.138');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1064, 1, 0, 'win', '2019-09-13 12:01:56.552', '2019-09-13 12:01:56.552');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1065, 2, 0, 'win', '2019-09-13 12:01:56.556', '2019-09-13 12:01:56.556');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1066, 3, 0, 'win', '2019-09-13 12:01:56.559', '2019-09-13 12:01:56.559');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1067, 1, 0, 'win', '2019-09-13 12:01:57.16', '2019-09-13 12:01:57.16');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1068, 2, 0, 'win', '2019-09-13 12:01:57.163', '2019-09-13 12:01:57.163');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1069, 3, 0, 'win', '2019-09-13 12:01:57.166', '2019-09-13 12:01:57.166');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1070, 1, 0, 'win', '2019-09-13 12:01:59.451', '2019-09-13 12:01:59.451');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1071, 2, 0, 'win', '2019-09-13 12:01:59.455', '2019-09-13 12:01:59.455');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1072, 3, 0, 'win', '2019-09-13 12:01:59.46', '2019-09-13 12:01:59.46');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1073, 1, 0, 'win', '2019-09-13 12:01:59.552', '2019-09-13 12:01:59.552');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1074, 2, 0, 'win', '2019-09-13 12:01:59.555', '2019-09-13 12:01:59.555');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1075, 3, 0, 'win', '2019-09-13 12:01:59.558', '2019-09-13 12:01:59.558');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1076, 1, 0, 'win', '2019-09-13 12:02:00.12', '2019-09-13 12:02:00.12');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1077, 2, 0, 'win', '2019-09-13 12:02:00.126', '2019-09-13 12:02:00.126');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1078, 3, 0, 'win', '2019-09-13 12:02:00.132', '2019-09-13 12:02:00.132');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1088, 1, 0, 'win', '2019-09-13 12:02:05.422', '2019-09-13 12:02:05.422');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1089, 2, 0, 'win', '2019-09-13 12:02:05.426', '2019-09-13 12:02:05.426');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1090, 3, 0, 'win', '2019-09-13 12:02:05.43', '2019-09-13 12:02:05.43');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1091, 1, 0, 'win', '2019-09-13 12:02:05.55', '2019-09-13 12:02:05.55');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1092, 2, 0, 'win', '2019-09-13 12:02:05.553', '2019-09-13 12:02:05.553');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1093, 3, 0, 'win', '2019-09-13 12:02:05.555', '2019-09-13 12:02:05.555');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1094, 1, 0, 'win', '2019-09-13 12:02:06.287', '2019-09-13 12:02:06.287');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1095, 2, 0, 'win', '2019-09-13 12:02:06.377', '2019-09-13 12:02:06.377');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1096, 3, 0, 'win', '2019-09-13 12:02:06.382', '2019-09-13 12:02:06.382');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1097, 1, 0, 'win', '2019-09-13 12:02:08.325', '2019-09-13 12:02:08.325');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1098, 2, 0, 'win', '2019-09-13 12:02:08.363', '2019-09-13 12:02:08.363');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1099, 3, 0, 'win', '2019-09-13 12:02:08.464', '2019-09-13 12:02:08.464');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1100, 1, 0, 'win', '2019-09-13 12:02:09.108', '2019-09-13 12:02:09.108');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1101, 2, 0, 'win', '2019-09-13 12:02:09.111', '2019-09-13 12:02:09.111');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1102, 3, 0, 'win', '2019-09-13 12:02:09.114', '2019-09-13 12:02:09.114');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1103, 1, 0, 'win', '2019-09-13 12:02:09.434', '2019-09-13 12:02:09.434');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1104, 2, 0, 'win', '2019-09-13 12:02:09.438', '2019-09-13 12:02:09.438');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1105, 3, 0, 'win', '2019-09-13 12:02:09.441', '2019-09-13 12:02:09.441');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1106, 1, 0, 'win', '2019-09-13 12:02:11.341', '2019-09-13 12:02:11.341');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1107, 2, 0, 'win', '2019-09-13 12:02:11.345', '2019-09-13 12:02:11.345');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1108, 3, 0, 'win', '2019-09-13 12:02:11.349', '2019-09-13 12:02:11.349');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1109, 1, 0, 'win', '2019-09-13 12:02:12.127', '2019-09-13 12:02:12.127');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1110, 2, 0, 'win', '2019-09-13 12:02:12.131', '2019-09-13 12:02:12.131');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1111, 3, 0, 'win', '2019-09-13 12:02:12.136', '2019-09-13 12:02:12.136');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1112, 1, 0, 'win', '2019-09-13 12:02:12.403', '2019-09-13 12:02:12.403');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1113, 2, 0, 'win', '2019-09-13 12:02:12.406', '2019-09-13 12:02:12.406');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1114, 3, 0, 'win', '2019-09-13 12:02:12.409', '2019-09-13 12:02:12.409');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1115, 1, 0, 'win', '2019-09-13 12:02:14.329', '2019-09-13 12:02:14.329');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1116, 2, 0, 'win', '2019-09-13 12:02:14.333', '2019-09-13 12:02:14.333');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1117, 3, 0, 'win', '2019-09-13 12:02:14.336', '2019-09-13 12:02:14.336');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1118, 1, 0, 'win', '2019-09-13 12:02:15.11', '2019-09-13 12:02:15.11');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1119, 2, 0, 'win', '2019-09-13 12:02:15.113', '2019-09-13 12:02:15.113');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1120, 3, 0, 'win', '2019-09-13 12:02:15.116', '2019-09-13 12:02:15.116');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1121, 1, 0, 'win', '2019-09-13 12:02:15.468', '2019-09-13 12:02:15.468');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1122, 2, 0, 'win', '2019-09-13 12:02:15.473', '2019-09-13 12:02:15.473');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1123, 3, 0, 'win', '2019-09-13 12:02:15.476', '2019-09-13 12:02:15.476');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1124, 1, 0, 'win', '2019-09-13 12:02:17.487', '2019-09-13 12:02:17.487');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1125, 2, 0, 'win', '2019-09-13 12:02:17.493', '2019-09-13 12:02:17.493');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1126, 3, 0, 'win', '2019-09-13 12:02:17.498', '2019-09-13 12:02:17.498');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1127, 1, 0, 'win', '2019-09-13 12:02:18.127', '2019-09-13 12:02:18.127');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1128, 2, 0, 'win', '2019-09-13 12:02:18.135', '2019-09-13 12:02:18.135');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1129, 3, 0, 'win', '2019-09-13 12:02:18.139', '2019-09-13 12:02:18.139');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1130, 1, 0, 'win', '2019-09-13 12:02:18.418', '2019-09-13 12:02:18.418');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1131, 2, 0, 'win', '2019-09-13 12:02:18.422', '2019-09-13 12:02:18.422');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1132, 3, 0, 'win', '2019-09-13 12:02:18.425', '2019-09-13 12:02:18.425');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1133, 1, 0, 'win', '2019-09-13 12:02:20.327', '2019-09-13 12:02:20.327');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1134, 2, 0, 'win', '2019-09-13 12:02:20.363', '2019-09-13 12:02:20.363');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1135, 3, 0, 'win', '2019-09-13 12:02:20.478', '2019-09-13 12:02:20.478');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1136, 1, 0, 'win', '2019-09-13 12:02:21.225', '2019-09-13 12:02:21.225');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1137, 2, 0, 'win', '2019-09-13 12:02:21.228', '2019-09-13 12:02:21.228');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1138, 3, 0, 'win', '2019-09-13 12:02:21.232', '2019-09-13 12:02:21.232');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1139, 1, 0, 'win', '2019-09-13 12:02:21.427', '2019-09-13 12:02:21.427');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1140, 2, 0, 'win', '2019-09-13 12:02:21.431', '2019-09-13 12:02:21.431');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1141, 3, 0, 'win', '2019-09-13 12:02:21.435', '2019-09-13 12:02:21.435');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1142, 1, 0, 'win', '2019-09-13 12:02:23.34', '2019-09-13 12:02:23.34');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1143, 2, 0, 'win', '2019-09-13 12:02:23.344', '2019-09-13 12:02:23.344');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1144, 3, 0, 'win', '2019-09-13 12:02:23.347', '2019-09-13 12:02:23.347');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1145, 1, 0, 'win', '2019-09-13 12:02:24.145', '2019-09-13 12:02:24.145');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1146, 2, 0, 'win', '2019-09-13 12:02:24.152', '2019-09-13 12:02:24.152');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1147, 3, 0, 'win', '2019-09-13 12:02:24.158', '2019-09-13 12:02:24.158');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1148, 1, 0, 'win', '2019-09-13 12:02:24.419', '2019-09-13 12:02:24.419');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1149, 2, 0, 'win', '2019-09-13 12:02:24.422', '2019-09-13 12:02:24.422');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1150, 3, 0, 'win', '2019-09-13 12:02:24.425', '2019-09-13 12:02:24.425');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1151, 1, 0, 'win', '2019-09-13 12:02:25.819', '2019-09-13 12:02:25.819');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1152, 2, 0, 'win', '2019-09-13 12:02:25.823', '2019-09-13 12:02:25.823');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1153, 3, 0, 'win', '2019-09-13 12:02:25.826', '2019-09-13 12:02:25.826');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1154, 1, 0, 'win', '2019-09-13 12:02:27.109', '2019-09-13 12:02:27.109');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1155, 2, 0, 'win', '2019-09-13 12:02:27.111', '2019-09-13 12:02:27.111');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1156, 3, 0, 'win', '2019-09-13 12:02:27.114', '2019-09-13 12:02:27.114');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1157, 1, 0, 'win', '2019-09-13 12:02:27.422', '2019-09-13 12:02:27.422');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1158, 2, 0, 'win', '2019-09-13 12:02:27.425', '2019-09-13 12:02:27.425');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1159, 3, 0, 'win', '2019-09-13 12:02:27.428', '2019-09-13 12:02:27.428');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1160, 1, 0, 'win', '2019-09-13 12:02:28.934', '2019-09-13 12:02:28.934');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1161, 2, 0, 'win', '2019-09-13 12:02:28.938', '2019-09-13 12:02:28.938');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1162, 3, 0, 'win', '2019-09-13 12:02:28.942', '2019-09-13 12:02:28.942');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1166, 1, 0, 'win', '2019-09-13 12:02:30.425', '2019-09-13 12:02:30.425');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1167, 2, 0, 'win', '2019-09-13 12:02:30.428', '2019-09-13 12:02:30.428');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1168, 3, 0, 'win', '2019-09-13 12:02:30.43', '2019-09-13 12:02:30.43');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1178, 1, 0, 'win', '2019-09-13 12:02:34.884', '2019-09-13 12:02:34.884');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1179, 2, 0, 'win', '2019-09-13 12:02:34.888', '2019-09-13 12:02:34.888');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1180, 3, 0, 'win', '2019-09-13 12:02:34.891', '2019-09-13 12:02:34.891');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1187, 1, 0, 'win', '2019-09-13 12:02:37.786', '2019-09-13 12:02:37.786');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1188, 2, 0, 'win', '2019-09-13 12:02:37.789', '2019-09-13 12:02:37.789');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1189, 3, 0, 'win', '2019-09-13 12:02:37.792', '2019-09-13 12:02:37.792');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1200, 2, 0, 'win', '2019-09-13 12:02:42.136', '2019-09-13 12:02:42.136');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1201, 3, 0, 'win', '2019-09-13 12:02:42.14', '2019-09-13 12:02:42.14');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1202, 1, 0, 'win', '2019-09-13 12:02:42.427', '2019-09-13 12:02:42.427');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1203, 2, 0, 'win', '2019-09-13 12:02:42.429', '2019-09-13 12:02:42.429');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1204, 3, 0, 'win', '2019-09-13 12:02:42.432', '2019-09-13 12:02:42.432');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1205, 1, 0, 'win', '2019-09-13 12:02:43.805', '2019-09-13 12:02:43.805');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1206, 2, 0, 'win', '2019-09-13 12:02:43.824', '2019-09-13 12:02:43.824');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1207, 3, 0, 'win', '2019-09-13 12:02:43.828', '2019-09-13 12:02:43.828');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1211, 1, 0, 'win', '2019-09-13 12:02:45.429', '2019-09-13 12:02:45.429');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1212, 2, 0, 'win', '2019-09-13 12:02:45.431', '2019-09-13 12:02:45.431');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1213, 3, 0, 'win', '2019-09-13 12:02:45.434', '2019-09-13 12:02:45.434');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1214, 1, 0, 'win', '2019-09-13 12:02:46.825', '2019-09-13 12:02:46.825');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1215, 2, 0, 'win', '2019-09-13 12:02:46.83', '2019-09-13 12:02:46.83');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1216, 3, 0, 'win', '2019-09-13 12:02:46.835', '2019-09-13 12:02:46.835');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1217, 1, 0, 'win', '2019-09-13 12:02:48.153', '2019-09-13 12:02:48.153');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1218, 2, 0, 'win', '2019-09-13 12:02:48.156', '2019-09-13 12:02:48.156');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1219, 3, 0, 'win', '2019-09-13 12:02:48.159', '2019-09-13 12:02:48.159');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1226, 1, 0, 'win', '2019-09-13 12:02:51.139', '2019-09-13 12:02:51.139');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1227, 2, 0, 'win', '2019-09-13 12:02:51.141', '2019-09-13 12:02:51.141');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1228, 3, 0, 'win', '2019-09-13 12:02:51.144', '2019-09-13 12:02:51.144');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1229, 1, 0, 'win', '2019-09-13 12:02:51.433', '2019-09-13 12:02:51.433');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1230, 2, 0, 'win', '2019-09-13 12:02:51.436', '2019-09-13 12:02:51.436');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1231, 3, 0, 'win', '2019-09-13 12:02:51.438', '2019-09-13 12:02:51.438');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1163, 1, 0, 'win', '2019-09-13 12:02:30.129', '2019-09-13 12:02:30.129');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1164, 2, 0, 'win', '2019-09-13 12:02:30.136', '2019-09-13 12:02:30.136');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1165, 3, 0, 'win', '2019-09-13 12:02:30.141', '2019-09-13 12:02:30.141');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1169, 1, 0, 'win', '2019-09-13 12:02:31.806', '2019-09-13 12:02:31.806');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1170, 2, 0, 'win', '2019-09-13 12:02:31.809', '2019-09-13 12:02:31.809');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1171, 3, 0, 'win', '2019-09-13 12:02:31.812', '2019-09-13 12:02:31.812');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1172, 1, 0, 'win', '2019-09-13 12:02:33.114', '2019-09-13 12:02:33.114');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1173, 2, 0, 'win', '2019-09-13 12:02:33.117', '2019-09-13 12:02:33.117');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1174, 3, 0, 'win', '2019-09-13 12:02:33.119', '2019-09-13 12:02:33.119');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1175, 1, 0, 'win', '2019-09-13 12:02:33.424', '2019-09-13 12:02:33.424');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1176, 2, 0, 'win', '2019-09-13 12:02:33.426', '2019-09-13 12:02:33.426');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1177, 3, 0, 'win', '2019-09-13 12:02:33.429', '2019-09-13 12:02:33.429');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1181, 1, 0, 'win', '2019-09-13 12:02:36.14', '2019-09-13 12:02:36.14');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1182, 2, 0, 'win', '2019-09-13 12:02:36.144', '2019-09-13 12:02:36.144');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1183, 3, 0, 'win', '2019-09-13 12:02:36.149', '2019-09-13 12:02:36.149');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1184, 1, 0, 'win', '2019-09-13 12:02:36.429', '2019-09-13 12:02:36.429');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1185, 2, 0, 'win', '2019-09-13 12:02:36.431', '2019-09-13 12:02:36.431');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1186, 3, 0, 'win', '2019-09-13 12:02:36.434', '2019-09-13 12:02:36.434');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1190, 1, 0, 'win', '2019-09-13 12:02:39.116', '2019-09-13 12:02:39.116');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1191, 2, 0, 'win', '2019-09-13 12:02:39.118', '2019-09-13 12:02:39.118');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1192, 3, 0, 'win', '2019-09-13 12:02:39.12', '2019-09-13 12:02:39.12');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1193, 1, 0, 'win', '2019-09-13 12:02:39.425', '2019-09-13 12:02:39.425');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1194, 2, 0, 'win', '2019-09-13 12:02:39.427', '2019-09-13 12:02:39.427');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1195, 3, 0, 'win', '2019-09-13 12:02:39.429', '2019-09-13 12:02:39.429');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1196, 1, 0, 'win', '2019-09-13 12:02:40.831', '2019-09-13 12:02:40.831');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1197, 2, 0, 'win', '2019-09-13 12:02:40.836', '2019-09-13 12:02:40.836');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1198, 3, 0, 'win', '2019-09-13 12:02:40.841', '2019-09-13 12:02:40.841');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1199, 1, 0, 'win', '2019-09-13 12:02:42.131', '2019-09-13 12:02:42.131');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1208, 1, 0, 'win', '2019-09-13 12:02:45.111', '2019-09-13 12:02:45.111');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1209, 2, 0, 'win', '2019-09-13 12:02:45.114', '2019-09-13 12:02:45.114');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1210, 3, 0, 'win', '2019-09-13 12:02:45.117', '2019-09-13 12:02:45.117');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1220, 1, 0, 'win', '2019-09-13 12:02:48.429', '2019-09-13 12:02:48.429');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1221, 2, 0, 'win', '2019-09-13 12:02:48.432', '2019-09-13 12:02:48.432');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1222, 3, 0, 'win', '2019-09-13 12:02:48.435', '2019-09-13 12:02:48.435');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1223, 1, 0, 'win', '2019-09-13 12:02:49.79', '2019-09-13 12:02:49.79');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1224, 2, 0, 'win', '2019-09-13 12:02:49.793', '2019-09-13 12:02:49.793');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1225, 3, 0, 'win', '2019-09-13 12:02:49.796', '2019-09-13 12:02:49.796');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1238, 1, 0, 'win', '2019-09-13 12:02:54.505', '2019-09-13 12:02:54.505');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1239, 2, 0, 'win', '2019-09-13 12:02:54.538', '2019-09-13 12:02:54.538');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1240, 3, 0, 'win', '2019-09-13 12:02:54.542', '2019-09-13 12:02:54.542');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1241, 1, 0, 'win', '2019-09-13 12:02:55.825', '2019-09-13 12:02:55.825');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1242, 2, 0, 'win', '2019-09-13 12:02:55.828', '2019-09-13 12:02:55.828');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1243, 3, 0, 'win', '2019-09-13 12:02:55.832', '2019-09-13 12:02:55.832');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1250, 1, 0, 'win', '2019-09-13 12:02:58.82', '2019-09-13 12:02:58.82');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1251, 2, 0, 'win', '2019-09-13 12:02:58.824', '2019-09-13 12:02:58.824');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1252, 3, 0, 'win', '2019-09-13 12:02:58.904', '2019-09-13 12:02:58.904');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1256, 1, 0, 'win', '2019-09-13 12:03:00.443', '2019-09-13 12:03:00.443');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1257, 2, 0, 'win', '2019-09-13 12:03:00.446', '2019-09-13 12:03:00.446');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1258, 3, 0, 'win', '2019-09-13 12:03:00.448', '2019-09-13 12:03:00.448');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1259, 1, 0, 'win', '2019-09-13 12:03:01.784', '2019-09-13 12:03:01.784');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1260, 2, 0, 'win', '2019-09-13 12:03:01.788', '2019-09-13 12:03:01.788');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1261, 3, 0, 'win', '2019-09-13 12:03:01.79', '2019-09-13 12:03:01.79');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1232, 1, 0, 'win', '2019-09-13 12:02:52.789', '2019-09-13 12:02:52.789');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1233, 2, 0, 'win', '2019-09-13 12:02:52.795', '2019-09-13 12:02:52.795');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1234, 3, 0, 'win', '2019-09-13 12:02:52.801', '2019-09-13 12:02:52.801');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1235, 1, 0, 'win', '2019-09-13 12:02:54.153', '2019-09-13 12:02:54.153');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1236, 2, 0, 'win', '2019-09-13 12:02:54.19', '2019-09-13 12:02:54.19');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1237, 3, 0, 'win', '2019-09-13 12:02:54.273', '2019-09-13 12:02:54.273');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1244, 1, 0, 'win', '2019-09-13 12:02:57.11', '2019-09-13 12:02:57.11');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1245, 2, 0, 'win', '2019-09-13 12:02:57.112', '2019-09-13 12:02:57.112');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1246, 3, 0, 'win', '2019-09-13 12:02:57.115', '2019-09-13 12:02:57.115');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1247, 1, 0, 'win', '2019-09-13 12:02:57.433', '2019-09-13 12:02:57.433');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1248, 2, 0, 'win', '2019-09-13 12:02:57.436', '2019-09-13 12:02:57.436');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1249, 3, 0, 'win', '2019-09-13 12:02:57.448', '2019-09-13 12:02:57.448');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1253, 1, 0, 'win', '2019-09-13 12:03:00.123', '2019-09-13 12:03:00.123');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1254, 2, 0, 'win', '2019-09-13 12:03:00.13', '2019-09-13 12:03:00.13');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1255, 3, 0, 'win', '2019-09-13 12:03:00.134', '2019-09-13 12:03:00.134');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1262, 1, 0, 'win', '2019-09-13 12:03:03.106', '2019-09-13 12:03:03.106');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1263, 2, 0, 'win', '2019-09-13 12:03:03.109', '2019-09-13 12:03:03.109');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1264, 3, 0, 'win', '2019-09-13 12:03:03.111', '2019-09-13 12:03:03.111');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1265, 1, 0, 'win', '2019-09-13 12:03:03.431', '2019-09-13 12:03:03.431');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1266, 2, 0, 'win', '2019-09-13 12:03:03.434', '2019-09-13 12:03:03.434');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1267, 3, 0, 'win', '2019-09-13 12:03:03.436', '2019-09-13 12:03:03.436');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1268, 1, 0, 'win', '2019-09-13 12:03:04.913', '2019-09-13 12:03:04.913');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1269, 2, 0, 'win', '2019-09-13 12:03:04.918', '2019-09-13 12:03:04.918');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1270, 3, 0, 'win', '2019-09-13 12:03:04.922', '2019-09-13 12:03:04.922');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1271, 1, 0, 'win', '2019-09-13 12:03:06.134', '2019-09-13 12:03:06.134');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1272, 2, 0, 'win', '2019-09-13 12:03:06.14', '2019-09-13 12:03:06.14');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1273, 3, 0, 'win', '2019-09-13 12:03:06.144', '2019-09-13 12:03:06.144');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1274, 1, 0, 'win', '2019-09-13 12:03:06.437', '2019-09-13 12:03:06.437');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1275, 2, 0, 'win', '2019-09-13 12:03:06.439', '2019-09-13 12:03:06.439');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1276, 3, 0, 'win', '2019-09-13 12:03:06.441', '2019-09-13 12:03:06.441');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1277, 1, 0, 'win', '2019-09-13 12:03:07.786', '2019-09-13 12:03:07.786');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1278, 2, 0, 'win', '2019-09-13 12:03:07.79', '2019-09-13 12:03:07.79');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1279, 3, 0, 'win', '2019-09-13 12:03:07.793', '2019-09-13 12:03:07.793');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1280, 1, 0, 'win', '2019-09-13 12:03:09.107', '2019-09-13 12:03:09.107');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1281, 2, 0, 'win', '2019-09-13 12:03:09.146', '2019-09-13 12:03:09.146');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1282, 3, 0, 'win', '2019-09-13 12:03:09.232', '2019-09-13 12:03:09.232');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1283, 1, 0, 'win', '2019-09-13 12:03:09.63', '2019-09-13 12:03:09.63');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1284, 2, 0, 'win', '2019-09-13 12:03:09.634', '2019-09-13 12:03:09.634');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1285, 3, 0, 'win', '2019-09-13 12:03:09.674', '2019-09-13 12:03:09.674');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1286, 1, 0, 'win', '2019-09-13 12:03:10.894', '2019-09-13 12:03:10.894');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1287, 2, 0, 'win', '2019-09-13 12:03:11.048', '2019-09-13 12:03:11.048');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1288, 3, 0, 'win', '2019-09-13 12:03:11.089', '2019-09-13 12:03:11.089');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1289, 1, 0, 'win', '2019-09-13 12:03:12.275', '2019-09-13 12:03:12.275');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1290, 2, 0, 'win', '2019-09-13 12:03:12.278', '2019-09-13 12:03:12.278');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1291, 3, 0, 'win', '2019-09-13 12:03:12.28', '2019-09-13 12:03:12.28');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1292, 1, 0, 'win', '2019-09-13 12:03:12.435', '2019-09-13 12:03:12.435');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1293, 2, 0, 'win', '2019-09-13 12:03:12.438', '2019-09-13 12:03:12.438');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1294, 3, 0, 'win', '2019-09-13 12:03:12.44', '2019-09-13 12:03:12.44');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1295, 1, 0, 'win', '2019-09-13 12:03:13.781', '2019-09-13 12:03:13.781');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1296, 2, 0, 'win', '2019-09-13 12:03:13.783', '2019-09-13 12:03:13.783');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1297, 3, 0, 'win', '2019-09-13 12:03:13.786', '2019-09-13 12:03:13.786');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1298, 1, 0, 'win', '2019-09-13 12:03:15.436', '2019-09-13 12:03:15.436');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1299, 2, 0, 'win', '2019-09-13 12:03:15.439', '2019-09-13 12:03:15.439');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1300, 3, 0, 'win', '2019-09-13 12:03:15.442', '2019-09-13 12:03:15.442');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1301, 1, 0, 'win', '2019-09-13 12:03:15.653', '2019-09-13 12:03:15.653');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1302, 2, 0, 'win', '2019-09-13 12:03:15.655', '2019-09-13 12:03:15.655');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1303, 3, 0, 'win', '2019-09-13 12:03:15.657', '2019-09-13 12:03:15.657');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1304, 1, 0, 'win', '2019-09-13 12:03:16.856', '2019-09-13 12:03:16.856');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1305, 2, 0, 'win', '2019-09-13 12:03:16.861', '2019-09-13 12:03:16.861');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1306, 3, 0, 'win', '2019-09-13 12:03:16.865', '2019-09-13 12:03:16.865');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1307, 1, 0, 'win', '2019-09-13 12:03:18.451', '2019-09-13 12:03:18.451');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1308, 2, 0, 'win', '2019-09-13 12:03:18.454', '2019-09-13 12:03:18.454');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1309, 3, 0, 'win', '2019-09-13 12:03:18.457', '2019-09-13 12:03:18.457');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1310, 1, 0, 'win', '2019-09-13 12:03:18.664', '2019-09-13 12:03:18.664');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1311, 2, 0, 'win', '2019-09-13 12:03:18.669', '2019-09-13 12:03:18.669');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1312, 3, 0, 'win', '2019-09-13 12:03:18.673', '2019-09-13 12:03:18.673');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1313, 1, 0, 'win', '2019-09-13 12:03:19.784', '2019-09-13 12:03:19.784');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1314, 2, 0, 'win', '2019-09-13 12:03:19.786', '2019-09-13 12:03:19.786');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1315, 3, 0, 'win', '2019-09-13 12:03:19.789', '2019-09-13 12:03:19.789');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1316, 1, 0, 'win', '2019-09-13 12:03:21.451', '2019-09-13 12:03:21.451');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1317, 2, 0, 'win', '2019-09-13 12:03:21.454', '2019-09-13 12:03:21.454');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1318, 3, 0, 'win', '2019-09-13 12:03:21.457', '2019-09-13 12:03:21.457');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1319, 1, 0, 'win', '2019-09-13 12:03:21.66', '2019-09-13 12:03:21.66');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1320, 2, 0, 'win', '2019-09-13 12:03:21.662', '2019-09-13 12:03:21.662');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1321, 3, 0, 'win', '2019-09-13 12:03:21.665', '2019-09-13 12:03:21.665');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1322, 1, 0, 'win', '2019-09-13 12:03:22.79', '2019-09-13 12:03:22.79');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1323, 2, 0, 'win', '2019-09-13 12:03:22.794', '2019-09-13 12:03:22.794');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1324, 3, 0, 'win', '2019-09-13 12:03:22.797', '2019-09-13 12:03:22.797');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1325, 1, 0, 'win', '2019-09-13 12:03:24.457', '2019-09-13 12:03:24.457');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1326, 2, 0, 'win', '2019-09-13 12:03:24.459', '2019-09-13 12:03:24.459');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1327, 3, 0, 'win', '2019-09-13 12:03:24.461', '2019-09-13 12:03:24.461');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1328, 1, 0, 'win', '2019-09-13 12:03:24.669', '2019-09-13 12:03:24.669');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1329, 2, 0, 'win', '2019-09-13 12:03:24.673', '2019-09-13 12:03:24.673');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1330, 3, 0, 'win', '2019-09-13 12:03:24.678', '2019-09-13 12:03:24.678');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1331, 1, 0, 'win', '2019-09-13 12:03:25.789', '2019-09-13 12:03:25.789');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1332, 2, 0, 'win', '2019-09-13 12:03:25.791', '2019-09-13 12:03:25.791');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1333, 3, 0, 'win', '2019-09-13 12:03:25.794', '2019-09-13 12:03:25.794');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1334, 1, 0, 'win', '2019-09-13 12:03:27.436', '2019-09-13 12:03:27.436');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1335, 2, 0, 'win', '2019-09-13 12:03:27.438', '2019-09-13 12:03:27.438');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1336, 3, 0, 'win', '2019-09-13 12:03:27.441', '2019-09-13 12:03:27.441');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1337, 1, 0, 'win', '2019-09-13 12:03:27.665', '2019-09-13 12:03:27.665');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1338, 2, 0, 'win', '2019-09-13 12:03:27.667', '2019-09-13 12:03:27.667');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1339, 3, 0, 'win', '2019-09-13 12:03:27.669', '2019-09-13 12:03:27.669');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1340, 1, 0, 'win', '2019-09-13 12:03:28.843', '2019-09-13 12:03:28.843');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1341, 2, 0, 'win', '2019-09-13 12:03:28.848', '2019-09-13 12:03:28.848');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1342, 3, 0, 'win', '2019-09-13 12:03:28.851', '2019-09-13 12:03:28.851');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1343, 1, 0, 'win', '2019-09-13 12:03:30.481', '2019-09-13 12:03:30.481');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1344, 2, 0, 'win', '2019-09-13 12:03:30.597', '2019-09-13 12:03:30.597');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1345, 3, 0, 'win', '2019-09-13 12:03:30.625', '2019-09-13 12:03:30.625');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1346, 1, 0, 'win', '2019-09-13 12:03:30.66', '2019-09-13 12:03:30.66');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1347, 2, 0, 'win', '2019-09-13 12:03:30.666', '2019-09-13 12:03:30.666');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1348, 3, 0, 'win', '2019-09-13 12:03:30.671', '2019-09-13 12:03:30.671');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1349, 1, 0, 'win', '2019-09-13 12:03:31.779', '2019-09-13 12:03:31.779');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1350, 2, 0, 'win', '2019-09-13 12:03:31.782', '2019-09-13 12:03:31.782');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1351, 3, 0, 'win', '2019-09-13 12:03:31.784', '2019-09-13 12:03:31.784');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1352, 1, 0, 'win', '2019-09-13 12:03:33.44', '2019-09-13 12:03:33.44');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1353, 2, 0, 'win', '2019-09-13 12:03:33.442', '2019-09-13 12:03:33.442');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1354, 3, 0, 'win', '2019-09-13 12:03:33.445', '2019-09-13 12:03:33.445');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1355, 1, 0, 'win', '2019-09-13 12:03:33.676', '2019-09-13 12:03:33.676');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1356, 2, 0, 'win', '2019-09-13 12:03:33.683', '2019-09-13 12:03:33.683');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1357, 3, 0, 'win', '2019-09-13 12:03:33.688', '2019-09-13 12:03:33.688');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1358, 1, 0, 'win', '2019-09-13 12:03:34.809', '2019-09-13 12:03:34.809');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1359, 2, 0, 'win', '2019-09-13 12:03:34.813', '2019-09-13 12:03:34.813');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1360, 3, 0, 'win', '2019-09-13 12:03:34.816', '2019-09-13 12:03:34.816');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1361, 1, 0, 'win', '2019-09-13 12:03:36.441', '2019-09-13 12:03:36.441');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1362, 2, 0, 'win', '2019-09-13 12:03:36.444', '2019-09-13 12:03:36.444');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1363, 3, 0, 'win', '2019-09-13 12:03:36.446', '2019-09-13 12:03:36.446');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1364, 1, 0, 'win', '2019-09-13 12:03:36.673', '2019-09-13 12:03:36.673');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1365, 2, 0, 'win', '2019-09-13 12:03:36.677', '2019-09-13 12:03:36.677');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1366, 3, 0, 'win', '2019-09-13 12:03:36.682', '2019-09-13 12:03:36.682');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1367, 1, 0, 'win', '2019-09-13 12:03:37.779', '2019-09-13 12:03:37.779');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1368, 2, 0, 'win', '2019-09-13 12:03:37.782', '2019-09-13 12:03:37.782');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1369, 3, 0, 'win', '2019-09-13 12:03:37.784', '2019-09-13 12:03:37.784');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1370, 1, 0, 'win', '2019-09-13 12:03:39.441', '2019-09-13 12:03:39.441');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1371, 2, 0, 'win', '2019-09-13 12:03:39.443', '2019-09-13 12:03:39.443');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1372, 3, 0, 'win', '2019-09-13 12:03:39.445', '2019-09-13 12:03:39.445');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1373, 1, 0, 'win', '2019-09-13 12:03:39.68', '2019-09-13 12:03:39.68');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1374, 2, 0, 'win', '2019-09-13 12:03:39.683', '2019-09-13 12:03:39.683');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1375, 3, 0, 'win', '2019-09-13 12:03:39.687', '2019-09-13 12:03:39.687');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1376, 1, 0, 'win', '2019-09-13 12:03:40.855', '2019-09-13 12:03:40.855');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1377, 2, 0, 'win', '2019-09-13 12:03:40.859', '2019-09-13 12:03:40.859');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1378, 3, 0, 'win', '2019-09-13 12:03:40.862', '2019-09-13 12:03:40.862');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1379, 1, 0, 'win', '2019-09-13 12:03:42.442', '2019-09-13 12:03:42.442');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1380, 2, 0, 'win', '2019-09-13 12:03:42.444', '2019-09-13 12:03:42.444');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1381, 3, 0, 'win', '2019-09-13 12:03:42.446', '2019-09-13 12:03:42.446');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1439, 1, 0, 'win', '2019-09-13 12:04:02.346', '2019-09-13 12:04:02.346');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1440, 2, 0, 'win', '2019-09-13 12:04:02.361', '2019-09-13 12:04:02.361');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1441, 3, 0, 'win', '2019-09-13 12:04:02.364', '2019-09-13 12:04:02.364');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1442, 1, 0, 'win', '2019-09-13 12:04:03.462', '2019-09-13 12:04:03.462');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1443, 2, 0, 'win', '2019-09-13 12:04:03.465', '2019-09-13 12:04:03.465');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1444, 3, 0, 'win', '2019-09-13 12:04:03.467', '2019-09-13 12:04:03.467');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1445, 1, 0, 'win', '2019-09-13 12:04:03.665', '2019-09-13 12:04:03.665');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1446, 2, 0, 'win', '2019-09-13 12:04:03.668', '2019-09-13 12:04:03.668');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1447, 3, 0, 'win', '2019-09-13 12:04:03.67', '2019-09-13 12:04:03.67');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1454, 1, 0, 'win', '2019-09-13 12:04:06.677', '2019-09-13 12:04:06.677');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1455, 2, 0, 'win', '2019-09-13 12:04:06.681', '2019-09-13 12:04:06.681');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1456, 3, 0, 'win', '2019-09-13 12:04:06.688', '2019-09-13 12:04:06.688');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1457, 1, 0, 'win', '2019-09-13 12:04:08.32', '2019-09-13 12:04:08.32');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1458, 2, 0, 'win', '2019-09-13 12:04:08.323', '2019-09-13 12:04:08.323');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1459, 3, 0, 'win', '2019-09-13 12:04:08.325', '2019-09-13 12:04:08.325');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1460, 1, 0, 'win', '2019-09-13 12:04:09.446', '2019-09-13 12:04:09.446');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1461, 2, 0, 'win', '2019-09-13 12:04:09.449', '2019-09-13 12:04:09.449');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1462, 3, 0, 'win', '2019-09-13 12:04:09.451', '2019-09-13 12:04:09.451');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1463, 1, 0, 'win', '2019-09-13 12:04:09.66', '2019-09-13 12:04:09.66');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1464, 2, 0, 'win', '2019-09-13 12:04:09.662', '2019-09-13 12:04:09.662');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1465, 3, 0, 'win', '2019-09-13 12:04:09.665', '2019-09-13 12:04:09.665');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1466, 1, 0, 'win', '2019-09-13 12:04:11.334', '2019-09-13 12:04:11.334');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1467, 2, 0, 'win', '2019-09-13 12:04:11.337', '2019-09-13 12:04:11.337');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1468, 3, 0, 'win', '2019-09-13 12:04:11.341', '2019-09-13 12:04:11.341');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1475, 1, 0, 'win', '2019-09-13 12:04:14.341', '2019-09-13 12:04:14.341');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1476, 2, 0, 'win', '2019-09-13 12:04:14.386', '2019-09-13 12:04:14.386');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1477, 3, 0, 'win', '2019-09-13 12:04:14.389', '2019-09-13 12:04:14.389');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1484, 1, 0, 'win', '2019-09-13 12:04:17.327', '2019-09-13 12:04:17.327');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1485, 2, 0, 'win', '2019-09-13 12:04:17.329', '2019-09-13 12:04:17.329');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1486, 3, 0, 'win', '2019-09-13 12:04:17.333', '2019-09-13 12:04:17.333');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1508, 1, 0, 'win', '2019-09-13 12:04:26.08', '2019-09-13 12:04:26.08');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1509, 2, 0, 'win', '2019-09-13 12:04:26.083', '2019-09-13 12:04:26.083');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1510, 3, 0, 'win', '2019-09-13 12:04:26.085', '2019-09-13 12:04:26.085');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1511, 1, 0, 'win', '2019-09-13 12:04:26.381', '2019-09-13 12:04:26.381');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1512, 2, 0, 'win', '2019-09-13 12:04:26.383', '2019-09-13 12:04:26.383');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1513, 3, 0, 'win', '2019-09-13 12:04:26.386', '2019-09-13 12:04:26.386');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1514, 1, 0, 'win', '2019-09-13 12:04:27.656', '2019-09-13 12:04:27.656');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1515, 2, 0, 'win', '2019-09-13 12:04:27.658', '2019-09-13 12:04:27.658');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1516, 3, 0, 'win', '2019-09-13 12:04:27.66', '2019-09-13 12:04:27.66');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1517, 1, 0, 'win', '2019-09-13 12:04:29.077', '2019-09-13 12:04:29.077');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1518, 2, 0, 'win', '2019-09-13 12:04:29.079', '2019-09-13 12:04:29.079');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1519, 3, 0, 'win', '2019-09-13 12:04:29.081', '2019-09-13 12:04:29.081');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1520, 1, 0, 'win', '2019-09-13 12:04:29.358', '2019-09-13 12:04:29.358');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1521, 2, 0, 'win', '2019-09-13 12:04:29.361', '2019-09-13 12:04:29.361');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1522, 3, 0, 'win', '2019-09-13 12:04:29.365', '2019-09-13 12:04:29.365');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1538, 1, 0, 'win', '2019-09-13 12:04:35.412', '2019-09-13 12:04:35.412');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1539, 2, 0, 'win', '2019-09-13 12:04:35.452', '2019-09-13 12:04:35.452');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1540, 3, 0, 'win', '2019-09-13 12:04:35.454', '2019-09-13 12:04:35.454');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1559, 1, 0, 'win', '2019-09-13 12:04:42.668', '2019-09-13 12:04:42.668');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1560, 2, 0, 'win', '2019-09-13 12:04:42.672', '2019-09-13 12:04:42.672');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1561, 3, 0, 'win', '2019-09-13 12:04:42.675', '2019-09-13 12:04:42.675');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1562, 1, 0, 'win', '2019-09-13 12:04:44.087', '2019-09-13 12:04:44.087');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1563, 2, 0, 'win', '2019-09-13 12:04:44.089', '2019-09-13 12:04:44.089');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1564, 3, 0, 'win', '2019-09-13 12:04:44.092', '2019-09-13 12:04:44.092');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1565, 1, 0, 'win', '2019-09-13 12:04:44.316', '2019-09-13 12:04:44.316');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1566, 2, 0, 'win', '2019-09-13 12:04:44.318', '2019-09-13 12:04:44.318');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1567, 3, 0, 'win', '2019-09-13 12:04:44.32', '2019-09-13 12:04:44.32');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1568, 1, 0, 'win', '2019-09-13 12:04:45.651', '2019-09-13 12:04:45.651');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1569, 2, 0, 'win', '2019-09-13 12:04:45.653', '2019-09-13 12:04:45.653');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1570, 3, 0, 'win', '2019-09-13 12:04:45.655', '2019-09-13 12:04:45.655');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1604, 1, 0, 'win', '2019-09-13 12:04:57.663', '2019-09-13 12:04:57.663');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1605, 2, 0, 'win', '2019-09-13 12:04:57.665', '2019-09-13 12:04:57.665');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1606, 3, 0, 'win', '2019-09-13 12:04:57.666', '2019-09-13 12:04:57.666');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1607, 1, 0, 'win', '2019-09-13 12:04:59.46', '2019-09-13 12:04:59.46');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1608, 2, 0, 'win', '2019-09-13 12:04:59.464', '2019-09-13 12:04:59.464');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1609, 3, 0, 'win', '2019-09-13 12:04:59.469', '2019-09-13 12:04:59.469');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1382, 1, 0, 'win', '2019-09-13 12:03:42.67', '2019-09-13 12:03:42.67');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1383, 2, 0, 'win', '2019-09-13 12:03:42.675', '2019-09-13 12:03:42.675');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1384, 3, 0, 'win', '2019-09-13 12:03:42.679', '2019-09-13 12:03:42.679');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1397, 1, 0, 'win', '2019-09-13 12:03:48.446', '2019-09-13 12:03:48.446');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1398, 2, 0, 'win', '2019-09-13 12:03:48.449', '2019-09-13 12:03:48.449');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1399, 3, 0, 'win', '2019-09-13 12:03:48.452', '2019-09-13 12:03:48.452');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1412, 1, 0, 'win', '2019-09-13 12:03:53.364', '2019-09-13 12:03:53.364');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1413, 2, 0, 'win', '2019-09-13 12:03:53.485', '2019-09-13 12:03:53.485');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1414, 3, 0, 'win', '2019-09-13 12:03:53.513', '2019-09-13 12:03:53.513');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1415, 1, 0, 'win', '2019-09-13 12:03:54.443', '2019-09-13 12:03:54.443');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1416, 2, 0, 'win', '2019-09-13 12:03:54.446', '2019-09-13 12:03:54.446');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1417, 3, 0, 'win', '2019-09-13 12:03:54.448', '2019-09-13 12:03:54.448');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1418, 1, 0, 'win', '2019-09-13 12:03:54.67', '2019-09-13 12:03:54.67');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1419, 2, 0, 'win', '2019-09-13 12:03:54.673', '2019-09-13 12:03:54.673');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1420, 3, 0, 'win', '2019-09-13 12:03:54.678', '2019-09-13 12:03:54.678');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1421, 1, 0, 'win', '2019-09-13 12:03:56.317', '2019-09-13 12:03:56.317');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1422, 2, 0, 'win', '2019-09-13 12:03:56.319', '2019-09-13 12:03:56.319');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1423, 3, 0, 'win', '2019-09-13 12:03:56.321', '2019-09-13 12:03:56.321');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1424, 1, 0, 'win', '2019-09-13 12:03:57.443', '2019-09-13 12:03:57.443');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1425, 2, 0, 'win', '2019-09-13 12:03:57.446', '2019-09-13 12:03:57.446');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1426, 3, 0, 'win', '2019-09-13 12:03:57.448', '2019-09-13 12:03:57.448');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1427, 1, 0, 'win', '2019-09-13 12:03:57.654', '2019-09-13 12:03:57.654');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1428, 2, 0, 'win', '2019-09-13 12:03:57.657', '2019-09-13 12:03:57.657');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1429, 3, 0, 'win', '2019-09-13 12:03:57.659', '2019-09-13 12:03:57.659');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1430, 1, 0, 'win', '2019-09-13 12:03:59.394', '2019-09-13 12:03:59.394');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1431, 2, 0, 'win', '2019-09-13 12:03:59.398', '2019-09-13 12:03:59.398');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1432, 3, 0, 'win', '2019-09-13 12:03:59.402', '2019-09-13 12:03:59.402');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1433, 1, 0, 'win', '2019-09-13 12:04:00.444', '2019-09-13 12:04:00.444');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1434, 2, 0, 'win', '2019-09-13 12:04:00.446', '2019-09-13 12:04:00.446');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1435, 3, 0, 'win', '2019-09-13 12:04:00.448', '2019-09-13 12:04:00.448');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1469, 1, 0, 'win', '2019-09-13 12:04:12.477', '2019-09-13 12:04:12.477');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1470, 2, 0, 'win', '2019-09-13 12:04:12.48', '2019-09-13 12:04:12.48');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1471, 3, 0, 'win', '2019-09-13 12:04:12.482', '2019-09-13 12:04:12.482');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1472, 1, 0, 'win', '2019-09-13 12:04:12.68', '2019-09-13 12:04:12.68');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1473, 2, 0, 'win', '2019-09-13 12:04:12.683', '2019-09-13 12:04:12.683');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1474, 3, 0, 'win', '2019-09-13 12:04:12.685', '2019-09-13 12:04:12.685');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1478, 1, 0, 'win', '2019-09-13 12:04:15.446', '2019-09-13 12:04:15.446');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1479, 2, 0, 'win', '2019-09-13 12:04:15.448', '2019-09-13 12:04:15.448');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1480, 3, 0, 'win', '2019-09-13 12:04:15.451', '2019-09-13 12:04:15.451');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1481, 1, 0, 'win', '2019-09-13 12:04:15.669', '2019-09-13 12:04:15.669');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1482, 2, 0, 'win', '2019-09-13 12:04:15.673', '2019-09-13 12:04:15.673');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1483, 3, 0, 'win', '2019-09-13 12:04:15.677', '2019-09-13 12:04:15.677');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1493, 1, 0, 'win', '2019-09-13 12:04:20.318', '2019-09-13 12:04:20.318');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1494, 2, 0, 'win', '2019-09-13 12:04:20.321', '2019-09-13 12:04:20.321');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1495, 3, 0, 'win', '2019-09-13 12:04:20.324', '2019-09-13 12:04:20.324');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1523, 1, 0, 'win', '2019-09-13 12:04:30.671', '2019-09-13 12:04:30.671');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1524, 2, 0, 'win', '2019-09-13 12:04:30.675', '2019-09-13 12:04:30.675');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1525, 3, 0, 'win', '2019-09-13 12:04:30.679', '2019-09-13 12:04:30.679');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1526, 1, 0, 'win', '2019-09-13 12:04:32.078', '2019-09-13 12:04:32.078');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1527, 2, 0, 'win', '2019-09-13 12:04:32.081', '2019-09-13 12:04:32.081');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1528, 3, 0, 'win', '2019-09-13 12:04:32.083', '2019-09-13 12:04:32.083');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1529, 1, 0, 'win', '2019-09-13 12:04:32.35', '2019-09-13 12:04:32.35');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1530, 2, 0, 'win', '2019-09-13 12:04:32.391', '2019-09-13 12:04:32.391');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1531, 3, 0, 'win', '2019-09-13 12:04:32.396', '2019-09-13 12:04:32.396');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1532, 1, 0, 'win', '2019-09-13 12:04:33.658', '2019-09-13 12:04:33.658');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1533, 2, 0, 'win', '2019-09-13 12:04:33.66', '2019-09-13 12:04:33.66');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1534, 3, 0, 'win', '2019-09-13 12:04:33.663', '2019-09-13 12:04:33.663');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1535, 1, 0, 'win', '2019-09-13 12:04:35.082', '2019-09-13 12:04:35.082');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1536, 2, 0, 'win', '2019-09-13 12:04:35.084', '2019-09-13 12:04:35.084');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1537, 3, 0, 'win', '2019-09-13 12:04:35.086', '2019-09-13 12:04:35.086');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1541, 1, 0, 'win', '2019-09-13 12:04:36.666', '2019-09-13 12:04:36.666');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1542, 2, 0, 'win', '2019-09-13 12:04:36.677', '2019-09-13 12:04:36.677');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1543, 3, 0, 'win', '2019-09-13 12:04:36.682', '2019-09-13 12:04:36.682');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1556, 1, 0, 'win', '2019-09-13 12:04:41.426', '2019-09-13 12:04:41.426');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1557, 2, 0, 'win', '2019-09-13 12:04:41.45', '2019-09-13 12:04:41.45');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1558, 3, 0, 'win', '2019-09-13 12:04:41.453', '2019-09-13 12:04:41.453');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1571, 1, 0, 'win', '2019-09-13 12:04:47.091', '2019-09-13 12:04:47.091');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1572, 2, 0, 'win', '2019-09-13 12:04:47.093', '2019-09-13 12:04:47.093');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1573, 3, 0, 'win', '2019-09-13 12:04:47.096', '2019-09-13 12:04:47.096');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1577, 1, 0, 'win', '2019-09-13 12:04:48.668', '2019-09-13 12:04:48.668');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1578, 2, 0, 'win', '2019-09-13 12:04:48.672', '2019-09-13 12:04:48.672');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1579, 3, 0, 'win', '2019-09-13 12:04:48.675', '2019-09-13 12:04:48.675');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1586, 1, 0, 'win', '2019-09-13 12:04:51.663', '2019-09-13 12:04:51.663');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1587, 2, 0, 'win', '2019-09-13 12:04:51.665', '2019-09-13 12:04:51.665');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1588, 3, 0, 'win', '2019-09-13 12:04:51.668', '2019-09-13 12:04:51.668');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1595, 1, 0, 'win', '2019-09-13 12:04:54.674', '2019-09-13 12:04:54.674');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1596, 2, 0, 'win', '2019-09-13 12:04:54.678', '2019-09-13 12:04:54.678');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1597, 3, 0, 'win', '2019-09-13 12:04:54.681', '2019-09-13 12:04:54.681');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1598, 1, 0, 'win', '2019-09-13 12:04:56.325', '2019-09-13 12:04:56.325');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1599, 2, 0, 'win', '2019-09-13 12:04:56.369', '2019-09-13 12:04:56.369');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1600, 3, 0, 'win', '2019-09-13 12:04:56.466', '2019-09-13 12:04:56.466');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1601, 1, 0, 'win', '2019-09-13 12:04:57.091', '2019-09-13 12:04:57.091');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1602, 2, 0, 'win', '2019-09-13 12:04:57.093', '2019-09-13 12:04:57.093');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1603, 3, 0, 'win', '2019-09-13 12:04:57.095', '2019-09-13 12:04:57.095');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1385, 1, 0, 'win', '2019-09-13 12:03:43.869', '2019-09-13 12:03:43.869');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1386, 2, 0, 'win', '2019-09-13 12:03:43.899', '2019-09-13 12:03:43.899');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1387, 3, 0, 'win', '2019-09-13 12:03:43.939', '2019-09-13 12:03:43.939');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1388, 1, 0, 'win', '2019-09-13 12:03:45.44', '2019-09-13 12:03:45.44');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1389, 2, 0, 'win', '2019-09-13 12:03:45.443', '2019-09-13 12:03:45.443');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1390, 3, 0, 'win', '2019-09-13 12:03:45.445', '2019-09-13 12:03:45.445');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1391, 1, 0, 'win', '2019-09-13 12:03:45.66', '2019-09-13 12:03:45.66');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1392, 2, 0, 'win', '2019-09-13 12:03:45.662', '2019-09-13 12:03:45.662');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1393, 3, 0, 'win', '2019-09-13 12:03:45.664', '2019-09-13 12:03:45.664');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1394, 1, 0, 'win', '2019-09-13 12:03:47.425', '2019-09-13 12:03:47.425');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1395, 2, 0, 'win', '2019-09-13 12:03:47.428', '2019-09-13 12:03:47.428');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1396, 3, 0, 'win', '2019-09-13 12:03:47.431', '2019-09-13 12:03:47.431');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1400, 1, 0, 'win', '2019-09-13 12:03:48.667', '2019-09-13 12:03:48.667');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1401, 2, 0, 'win', '2019-09-13 12:03:48.674', '2019-09-13 12:03:48.674');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1402, 3, 0, 'win', '2019-09-13 12:03:48.678', '2019-09-13 12:03:48.678');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1403, 1, 0, 'win', '2019-09-13 12:03:50.317', '2019-09-13 12:03:50.317');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1404, 2, 0, 'win', '2019-09-13 12:03:50.319', '2019-09-13 12:03:50.319');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1405, 3, 0, 'win', '2019-09-13 12:03:50.322', '2019-09-13 12:03:50.322');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1406, 1, 0, 'win', '2019-09-13 12:03:51.444', '2019-09-13 12:03:51.444');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1407, 2, 0, 'win', '2019-09-13 12:03:51.447', '2019-09-13 12:03:51.447');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1408, 3, 0, 'win', '2019-09-13 12:03:51.449', '2019-09-13 12:03:51.449');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1409, 1, 0, 'win', '2019-09-13 12:03:51.668', '2019-09-13 12:03:51.668');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1410, 2, 0, 'win', '2019-09-13 12:03:51.67', '2019-09-13 12:03:51.67');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1411, 3, 0, 'win', '2019-09-13 12:03:51.673', '2019-09-13 12:03:51.673');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1436, 1, 0, 'win', '2019-09-13 12:04:00.722', '2019-09-13 12:04:00.722');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1437, 2, 0, 'win', '2019-09-13 12:04:00.781', '2019-09-13 12:04:00.781');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1438, 3, 0, 'win', '2019-09-13 12:04:00.784', '2019-09-13 12:04:00.784');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1448, 1, 0, 'win', '2019-09-13 12:04:05.44', '2019-09-13 12:04:05.44');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1449, 2, 0, 'win', '2019-09-13 12:04:05.443', '2019-09-13 12:04:05.443');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1450, 3, 0, 'win', '2019-09-13 12:04:05.446', '2019-09-13 12:04:05.446');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1451, 1, 0, 'win', '2019-09-13 12:04:06.448', '2019-09-13 12:04:06.448');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1452, 2, 0, 'win', '2019-09-13 12:04:06.45', '2019-09-13 12:04:06.45');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1453, 3, 0, 'win', '2019-09-13 12:04:06.452', '2019-09-13 12:04:06.452');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1487, 1, 0, 'win', '2019-09-13 12:04:18.66', '2019-09-13 12:04:18.66');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1488, 2, 0, 'win', '2019-09-13 12:04:18.666', '2019-09-13 12:04:18.666');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1489, 3, 0, 'win', '2019-09-13 12:04:18.684', '2019-09-13 12:04:18.684');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1490, 1, 0, 'win', '2019-09-13 12:04:19.075', '2019-09-13 12:04:19.075');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1491, 2, 0, 'win', '2019-09-13 12:04:19.078', '2019-09-13 12:04:19.078');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1492, 3, 0, 'win', '2019-09-13 12:04:19.08', '2019-09-13 12:04:19.08');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1496, 1, 0, 'win', '2019-09-13 12:04:21.662', '2019-09-13 12:04:21.662');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1497, 2, 0, 'win', '2019-09-13 12:04:21.664', '2019-09-13 12:04:21.664');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1498, 3, 0, 'win', '2019-09-13 12:04:21.667', '2019-09-13 12:04:21.667');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1499, 1, 0, 'win', '2019-09-13 12:04:22.074', '2019-09-13 12:04:22.074');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1500, 2, 0, 'win', '2019-09-13 12:04:22.077', '2019-09-13 12:04:22.077');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1501, 3, 0, 'win', '2019-09-13 12:04:22.079', '2019-09-13 12:04:22.079');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1502, 1, 0, 'win', '2019-09-13 12:04:23.404', '2019-09-13 12:04:23.404');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1503, 2, 0, 'win', '2019-09-13 12:04:23.408', '2019-09-13 12:04:23.408');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1504, 3, 0, 'win', '2019-09-13 12:04:23.411', '2019-09-13 12:04:23.411');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1505, 1, 0, 'win', '2019-09-13 12:04:24.66', '2019-09-13 12:04:24.66');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1506, 2, 0, 'win', '2019-09-13 12:04:24.665', '2019-09-13 12:04:24.665');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1507, 3, 0, 'win', '2019-09-13 12:04:24.67', '2019-09-13 12:04:24.67');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1544, 1, 0, 'win', '2019-09-13 12:04:38.087', '2019-09-13 12:04:38.087');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1545, 2, 0, 'win', '2019-09-13 12:04:38.089', '2019-09-13 12:04:38.089');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1546, 3, 0, 'win', '2019-09-13 12:04:38.091', '2019-09-13 12:04:38.091');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1547, 1, 0, 'win', '2019-09-13 12:04:38.312', '2019-09-13 12:04:38.312');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1548, 2, 0, 'win', '2019-09-13 12:04:38.314', '2019-09-13 12:04:38.314');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1549, 3, 0, 'win', '2019-09-13 12:04:38.316', '2019-09-13 12:04:38.316');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1550, 1, 0, 'win', '2019-09-13 12:04:39.652', '2019-09-13 12:04:39.652');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1551, 2, 0, 'win', '2019-09-13 12:04:39.654', '2019-09-13 12:04:39.654');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1552, 3, 0, 'win', '2019-09-13 12:04:39.655', '2019-09-13 12:04:39.655');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1553, 1, 0, 'win', '2019-09-13 12:04:41.083', '2019-09-13 12:04:41.083');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1554, 2, 0, 'win', '2019-09-13 12:04:41.086', '2019-09-13 12:04:41.086');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1555, 3, 0, 'win', '2019-09-13 12:04:41.088', '2019-09-13 12:04:41.088');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1574, 1, 0, 'win', '2019-09-13 12:04:47.326', '2019-09-13 12:04:47.326');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1575, 2, 0, 'win', '2019-09-13 12:04:47.329', '2019-09-13 12:04:47.329');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1576, 3, 0, 'win', '2019-09-13 12:04:47.332', '2019-09-13 12:04:47.332');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1580, 1, 0, 'win', '2019-09-13 12:04:50.091', '2019-09-13 12:04:50.091');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1581, 2, 0, 'win', '2019-09-13 12:04:50.094', '2019-09-13 12:04:50.094');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1582, 3, 0, 'win', '2019-09-13 12:04:50.099', '2019-09-13 12:04:50.099');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1583, 1, 0, 'win', '2019-09-13 12:04:50.316', '2019-09-13 12:04:50.316');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1584, 2, 0, 'win', '2019-09-13 12:04:50.319', '2019-09-13 12:04:50.319');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1585, 3, 0, 'win', '2019-09-13 12:04:50.321', '2019-09-13 12:04:50.321');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1589, 1, 0, 'win', '2019-09-13 12:04:53.091', '2019-09-13 12:04:53.091');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1590, 2, 0, 'win', '2019-09-13 12:04:53.093', '2019-09-13 12:04:53.093');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1591, 3, 0, 'win', '2019-09-13 12:04:53.095', '2019-09-13 12:04:53.095');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1592, 1, 0, 'win', '2019-09-13 12:04:53.325', '2019-09-13 12:04:53.325');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1593, 2, 0, 'win', '2019-09-13 12:04:53.328', '2019-09-13 12:04:53.328');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1594, 3, 0, 'win', '2019-09-13 12:04:53.331', '2019-09-13 12:04:53.331');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1610, 1, 0, 'win', '2019-09-13 12:05:00.095', '2019-09-13 12:05:00.095');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1611, 2, 0, 'win', '2019-09-13 12:05:00.097', '2019-09-13 12:05:00.097');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1612, 3, 0, 'win', '2019-09-13 12:05:00.099', '2019-09-13 12:05:00.099');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1613, 1, 0, 'win', '2019-09-13 12:05:00.663', '2019-09-13 12:05:00.663');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1614, 2, 0, 'win', '2019-09-13 12:05:00.667', '2019-09-13 12:05:00.667');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1615, 3, 0, 'win', '2019-09-13 12:05:00.67', '2019-09-13 12:05:00.67');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1616, 1, 0, 'win', '2019-09-13 12:05:02.373', '2019-09-13 12:05:02.373');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1617, 2, 0, 'win', '2019-09-13 12:05:02.538', '2019-09-13 12:05:02.538');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1618, 3, 0, 'win', '2019-09-13 12:05:02.622', '2019-09-13 12:05:02.622');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1619, 1, 0, 'win', '2019-09-13 12:05:03.103', '2019-09-13 12:05:03.103');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1620, 2, 0, 'win', '2019-09-13 12:05:03.106', '2019-09-13 12:05:03.106');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1621, 3, 0, 'win', '2019-09-13 12:05:03.109', '2019-09-13 12:05:03.109');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1622, 1, 0, 'win', '2019-09-13 12:05:03.694', '2019-09-13 12:05:03.694');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1623, 2, 0, 'win', '2019-09-13 12:05:03.697', '2019-09-13 12:05:03.697');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1624, 3, 0, 'win', '2019-09-13 12:05:03.699', '2019-09-13 12:05:03.699');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1625, 1, 0, 'win', '2019-09-13 12:05:05.368', '2019-09-13 12:05:05.368');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1626, 2, 0, 'win', '2019-09-13 12:05:05.402', '2019-09-13 12:05:05.402');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1627, 3, 0, 'win', '2019-09-13 12:05:05.406', '2019-09-13 12:05:05.406');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1628, 1, -10, 'firstbet', '2019-09-13 12:06:38.157', '2019-09-13 12:06:38.157');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1629, 2, -10, 'firstbet', '2019-09-13 12:06:40.294', '2019-09-13 12:06:40.294');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1630, 3, -10, 'firstbet', '2019-09-13 12:06:45.13', '2019-09-13 12:06:45.13');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1631, 1, 10, 'win', '2019-09-13 12:07:30.139', '2019-09-13 12:07:30.139');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1632, 2, 10, 'win', '2019-09-13 12:07:30.145', '2019-09-13 12:07:30.145');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1633, 3, 10, 'win', '2019-09-13 12:07:30.149', '2019-09-13 12:07:30.149');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1634, 1, -10, 'firstbet', '2019-09-13 12:12:29.248', '2019-09-13 12:12:29.248');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1635, 2, -10, 'firstbet', '2019-09-13 12:12:31.852', '2019-09-13 12:12:31.852');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1636, 3, -10, 'firstbet', '2019-09-13 12:12:34.694', '2019-09-13 12:12:34.694');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1637, 1, 10, 'win', '2019-09-13 12:13:18.638', '2019-09-13 12:13:18.638');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1638, 2, 10, 'win', '2019-09-13 12:13:18.644', '2019-09-13 12:13:18.644');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1639, 3, 10, 'win', '2019-09-13 12:13:18.647', '2019-09-13 12:13:18.647');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1640, 1, -10, 'firstbet', '2019-09-13 13:46:51.091', '2019-09-13 13:46:51.091');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1641, 2, -10, 'firstbet', '2019-09-13 13:46:53.546', '2019-09-13 13:46:53.546');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1642, 3, -10, 'firstbet', '2019-09-13 13:46:56.724', '2019-09-13 13:46:56.724');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1643, 1, 10, 'win', '2019-09-13 13:47:21.385', '2019-09-13 13:47:21.385');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1644, 2, 10, 'win', '2019-09-13 13:47:21.393', '2019-09-13 13:47:21.393');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1645, 3, 10, 'win', '2019-09-13 13:47:21.398', '2019-09-13 13:47:21.398');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1646, 1, -10, 'firstbet', '2019-09-13 14:01:45.849', '2019-09-13 14:01:45.849');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1647, 2, -10, 'firstbet', '2019-09-13 14:01:47.587', '2019-09-13 14:01:47.587');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1648, 3, -10, 'firstbet', '2019-09-13 14:01:50.478', '2019-09-13 14:01:50.478');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1649, 1, -10, 'firstbet', '2019-09-13 14:05:53.298', '2019-09-13 14:05:53.298');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1650, 2, -10, 'firstbet', '2019-09-13 14:05:56.642', '2019-09-13 14:05:56.642');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1651, 3, -10, 'firstbet', '2019-09-13 14:06:00.222', '2019-09-13 14:06:00.222');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1652, 1, -10, 'firstbet', '2019-09-13 14:14:37.779', '2019-09-13 14:14:37.779');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1653, 2, -10, 'firstbet', '2019-09-13 14:14:39.662', '2019-09-13 14:14:39.662');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1654, 3, -10, 'firstbet', '2019-09-13 14:14:42.537', '2019-09-13 14:14:42.537');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1655, 1, -10, 'firstbet', '2019-09-13 14:20:33.181', '2019-09-13 14:20:33.181');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1656, 2, -10, 'firstbet', '2019-09-13 14:20:34.799', '2019-09-13 14:20:34.799');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1657, 3, -10, 'firstbet', '2019-09-13 14:20:37.534', '2019-09-13 14:20:37.534');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1658, 1, -10, 'call', '2019-09-13 14:21:43.791', '2019-09-13 14:21:43.791');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1659, 3, -10, 'call', '2019-09-13 14:21:53.596', '2019-09-13 14:21:53.596');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1660, 1, -10, 'firstbet', '2019-09-13 14:27:44.12', '2019-09-13 14:27:44.12');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1661, 2, -10, 'firstbet', '2019-09-13 14:27:48.071', '2019-09-13 14:27:48.071');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1662, 3, -10, 'firstbet', '2019-09-13 14:27:52.633', '2019-09-13 14:27:52.633');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1663, 1, -10, 'call', '2019-09-13 14:29:42.843', '2019-09-13 14:29:42.843');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1664, 3, -10, 'call', '2019-09-13 14:29:51.049', '2019-09-13 14:29:51.049');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1665, 1, -10, 'firstbet', '2019-09-13 14:32:44.774', '2019-09-13 14:32:44.774');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1666, 2, -10, 'firstbet', '2019-09-13 14:32:48.522', '2019-09-13 14:32:48.522');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1667, 3, -10, 'firstbet', '2019-09-13 14:32:53.66', '2019-09-13 14:32:53.66');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1668, 1, -10, 'firstbet', '2019-09-14 11:18:04.748', '2019-09-14 11:18:04.748');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1669, 2, -10, 'firstbet', '2019-09-14 11:18:08.528', '2019-09-14 11:18:08.528');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1670, 3, -10, 'firstbet', '2019-09-14 11:18:11.901', '2019-09-14 11:18:11.901');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1671, 1, -10, 'firstbet', '2019-09-14 11:42:48.82', '2019-09-14 11:42:48.82');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1672, 2, -10, 'firstbet', '2019-09-14 11:42:50.775', '2019-09-14 11:42:50.775');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1673, 1, -10, 'firstbet', '2019-09-14 11:45:23.618', '2019-09-14 11:45:23.618');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1674, 2, -10, 'firstbet', '2019-09-14 11:45:31.702', '2019-09-14 11:45:31.702');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1675, 3, -10, 'firstbet', '2019-09-14 11:45:35.971', '2019-09-14 11:45:35.971');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1676, 1, -10, 'firstbet', '2019-09-14 11:47:21.759', '2019-09-14 11:47:21.759');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1677, 2, -10, 'firstbet', '2019-09-14 11:47:29.494', '2019-09-14 11:47:29.494');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1678, 3, -10, 'firstbet', '2019-09-14 11:47:34.761', '2019-09-14 11:47:34.761');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1679, 1, -10, 'firstbet', '2019-09-14 12:01:46.234', '2019-09-14 12:01:46.234');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1680, 2, -10, 'firstbet', '2019-09-14 12:01:48.461', '2019-09-14 12:01:48.461');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1681, 3, -10, 'firstbet', '2019-09-14 12:01:52.038', '2019-09-14 12:01:52.038');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1682, 1, -10, 'firstbet', '2019-09-14 12:14:57.339', '2019-09-14 12:14:57.339');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1683, 2, -10, 'firstbet', '2019-09-14 12:14:58.984', '2019-09-14 12:14:58.984');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1684, 3, -10, 'firstbet', '2019-09-14 12:15:03.29', '2019-09-14 12:15:03.29');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1685, 1, -10, 'firstbet', '2019-09-14 12:18:34.604', '2019-09-14 12:18:34.604');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1686, 2, -10, 'firstbet', '2019-09-14 12:18:36.882', '2019-09-14 12:18:36.882');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1687, 3, -10, 'firstbet', '2019-09-14 12:18:40.228', '2019-09-14 12:18:40.228');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1688, 1, -10, 'firstbet', '2019-09-14 12:41:51.796', '2019-09-14 12:41:51.796');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1689, 2, -10, 'firstbet', '2019-09-14 12:41:53.361', '2019-09-14 12:41:53.361');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1690, 3, -10, 'firstbet', '2019-09-14 12:41:56.906', '2019-09-14 12:41:56.906');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1691, 1, -10, 'firstbet', '2019-09-14 12:52:51.97', '2019-09-14 12:52:51.97');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1692, 2, -10, 'firstbet', '2019-09-14 12:52:53.74', '2019-09-14 12:52:53.74');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1693, 1, -10, 'firstbet', '2019-09-14 12:58:20.166', '2019-09-14 12:58:20.166');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1694, 2, -10, 'firstbet', '2019-09-14 12:58:21.718', '2019-09-14 12:58:21.718');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1695, 3, -10, 'firstbet', '2019-09-14 12:58:24.762', '2019-09-14 12:58:24.762');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1696, 1, -10, 'firstbet', '2019-09-14 14:05:59.103', '2019-09-14 14:05:59.103');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1697, 2, -10, 'firstbet', '2019-09-14 14:06:00.941', '2019-09-14 14:06:00.941');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1698, 3, -10, 'firstbet', '2019-09-14 14:06:04.53', '2019-09-14 14:06:04.53');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1699, 1, -10, 'firstbet', '2019-09-14 14:12:06.822', '2019-09-14 14:12:06.822');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1700, 2, -10, 'firstbet', '2019-09-14 14:12:09.427', '2019-09-14 14:12:09.427');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1701, 3, -10, 'firstbet', '2019-09-14 14:12:13.631', '2019-09-14 14:12:13.631');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1702, 1, -10, 'firstbet', '2019-09-14 14:25:58.634', '2019-09-14 14:25:58.634');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1703, 2, -10, 'firstbet', '2019-09-14 14:26:01.298', '2019-09-14 14:26:01.298');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1704, 3, -10, 'firstbet', '2019-09-14 14:26:05.058', '2019-09-14 14:26:05.058');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1705, 2, -10, 'firstbet', '2019-09-15 10:46:10.836', '2019-09-15 10:46:10.836');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1706, 1, -10, 'firstbet', '2019-09-15 10:46:12.654', '2019-09-15 10:46:12.654');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1707, 1, -10, 'firstbet', '2019-09-15 11:02:29.303', '2019-09-15 11:02:29.303');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1708, 2, -10, 'firstbet', '2019-09-15 11:02:31.087', '2019-09-15 11:02:31.087');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1709, 1, -10, 'firstbet', '2019-09-15 11:03:13.557', '2019-09-15 11:03:13.557');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1710, 2, -10, 'firstbet', '2019-09-15 11:03:16.083', '2019-09-15 11:03:16.083');
INSERT INTO public.transaction (id, user_account_id, amount, comment, created, updated) VALUES (1711, 3, -10, 'firstbet', '2019-09-15 11:03:57.493', '2019-09-15 11:03:57.493');


--
-- TOC entry 2966 (class 0 OID 59351)
-- Dependencies: 218
-- Data for Name: user_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_account (id, nickname, password, email, foto, country_id, user_role, user_status, sum_games, won_games, created, updated) VALUES (4, 'Player1', '$2a$10$ArD/5cvDVw0Nf0js1YAN1uGpKy1Ss3qTtMCpqO/nW09XO/0buR2Ku', '1@g.com', 'resources/img/foto.png', 189, 'MEMBER', 'ACTIVE', 54, 4, '2019-09-10 12:47:02.508', '2019-09-10 12:47:02.508');
INSERT INTO public.user_account (id, nickname, password, email, foto, country_id, user_role, user_status, sum_games, won_games, created, updated) VALUES (8, 'Player2', '$2a$10$1sC8Yy1s2GVtLVZlmHb9fOsZJrqNlr4va8NdR.QvF1NHXz6QODrSm', '2@g.com', '', 187, 'MEMBER', 'ACTIVE', 72, 15, '2019-09-10 13:07:34.888', '2019-09-10 13:07:34.888');
INSERT INTO public.user_account (id, nickname, password, email, foto, country_id, user_role, user_status, sum_games, won_games, created, updated) VALUES (9, 'Player3', '$2a$10$0OX7RFHikXRyt0zshcPILOcRwuwTknfYNvoA1d656aw.6eJflMfSe', '3@g.com', '', 191, 'MEMBER', 'ACTIVE', 28, 3, '2019-09-10 13:08:46.484', '2019-09-10 13:08:46.484');
INSERT INTO public.user_account (id, nickname, password, email, foto, country_id, user_role, user_status, sum_games, won_games, created, updated) VALUES (10, 'Player4', '$2a$10$.ns9ngMzKZSOGE5h6fbp0OvqNkhzKQCMnd85mPCQPzHZTrDXxiOnS', '4@g.com', '', 53, 'MEMBER', 'ACTIVE', 251, 20, '2019-09-10 13:09:19.74', '2019-09-10 13:09:19.74');
INSERT INTO public.user_account (id, nickname, password, email, foto, country_id, user_role, user_status, sum_games, won_games, created, updated) VALUES (11, 'Player5', '$2a$10$MKhXcwrX3lsYIHvCJ7GsgOXnkieAo.7dXMV.sbQ.vFBmds3gz2B8q', '5@g.com', '', 117, 'MEMBER', 'ACTIVE', 28, 6, '2019-09-10 13:09:46.708', '2019-09-10 13:09:46.708');
INSERT INTO public.user_account (id, nickname, password, email, foto, country_id, user_role, user_status, sum_games, won_games, created, updated) VALUES (12, 'Player6', '$2a$10$xRZtm8W/.7sUGdu8u7Zl/OQ.2td6X48NWNsw860wf.UXQJOjtAc8q', '6@g.com', '', 102, 'MEMBER', 'ACTIVE', 85, 24, '2019-09-10 13:10:26.528', '2019-09-10 13:10:26.528');
INSERT INTO public.user_account (id, nickname, password, email, foto, country_id, user_role, user_status, sum_games, won_games, created, updated) VALUES (13, 'Player7', '$2a$10$JksegFTZCaHXLYEcHQ0Aj.D7EBHU03JDew48NWb3dhqM/sZh5Sxpq', '7@g.com', '', 106, 'MEMBER', 'ACTIVE', 84, 12, '2019-09-10 13:10:59.025', '2019-09-10 13:10:59.025');
INSERT INTO public.user_account (id, nickname, password, email, foto, country_id, user_role, user_status, sum_games, won_games, created, updated) VALUES (14, 'Player8', '$2a$10$BShzKiEoAUs9Pw6YmUhoX.slrMjJUI4wm7bh42NeqnQiNAsnzrkZO', '8@g.com', '', 109, 'MEMBER', 'ACTIVE', 54, 2, '2019-09-10 13:11:37.931', '2019-09-10 13:11:37.931');
INSERT INTO public.user_account (id, nickname, password, email, foto, country_id, user_role, user_status, sum_games, won_games, created, updated) VALUES (15, 'Player9', '$2a$10$of/wPoNFXTSrHnWnCJIQQuuaZ.lE5cmjcF9DB.vEQvXcf/iDAo.ba', '9@g.com', '', 105, 'MEMBER', 'ACTIVE', 66, 6, '2019-09-10 13:12:05.829', '2019-09-10 13:12:05.829');
INSERT INTO public.user_account (id, nickname, password, email, foto, country_id, user_role, user_status, sum_games, won_games, created, updated) VALUES (16, 'Player10', '$2a$10$j2Oz04pPZ8eBz3nB1BcCsevGug7lk7F.p2yahsBEJ56kvLfOXVPAO', '10@g.com', '', 193, 'MEMBER', 'ACTIVE', 50, 9, '2019-09-10 13:12:37.042', '2019-09-10 13:12:37.042');
INSERT INTO public.user_account (id, nickname, password, email, foto, country_id, user_role, user_status, sum_games, won_games, created, updated) VALUES (17, 'Player11', '$2a$10$62KW5yLSz1qXMcYsL.RSXeOfY31iVc.uwK2NYwVXP9MShVHJWUShW', '11@g.com', '', 7, 'MEMBER', 'ACTIVE', 34, 8, '2019-09-10 13:13:10.452', '2019-09-10 13:13:10.452');
INSERT INTO public.user_account (id, nickname, password, email, foto, country_id, user_role, user_status, sum_games, won_games, created, updated) VALUES (18, 'Player13', '$2a$10$iDXOukFKrVApgJeTkv2eaObWO2q784X5MGyu2t4ltoWo9sLoCO/ba', '13@g.com', '', 7, 'MEMBER', 'ACTIVE', 44, 20, '2019-09-10 13:13:37.019', '2019-09-10 13:13:37.019');
INSERT INTO public.user_account (id, nickname, password, email, foto, country_id, user_role, user_status, sum_games, won_games, created, updated) VALUES (19, 'Player14', '$2a$10$844C2sV1H8QJYdzD9pm/FumLo9.FxT3z0.CwxlxaFzirRYO91mMmi', '14@g.com', '', 7, 'MEMBER', 'ACTIVE', 41, 10, '2019-09-10 13:15:22.425', '2019-09-10 13:15:22.425');
INSERT INTO public.user_account (id, nickname, password, email, foto, country_id, user_role, user_status, sum_games, won_games, created, updated) VALUES (20, 'Player15', '$2a$10$Eb7JulJxBHOz/BpJTymq2.8knNBsLS7MmpCHDc7wfnuBppmBN518O', '15@g.com', '', 196, 'MEMBER', 'ACTIVE', 55, 20, '2019-09-10 13:15:49.992', '2019-09-10 13:15:49.992');
INSERT INTO public.user_account (id, nickname, password, email, foto, country_id, user_role, user_status, sum_games, won_games, created, updated) VALUES (1, 'Admin', '$2a$10$QE39xe3rcgW8Cv6hXqQNLubg02aBmNtrfBDCMMwGMNEOA6oG0Lts.', 'aaaa@a.com', 'resources/img/foto.png', 107, 'ADMIN', 'ACTIVE', 45, 11, '2019-08-22 21:16:05.456', '2019-08-22 21:16:05.456');
INSERT INTO public.user_account (id, nickname, password, email, foto, country_id, user_role, user_status, sum_games, won_games, created, updated) VALUES (2, 'Test', '$2a$10$OgNTZQU7I.q7TzILBgU7He4IJJS.1DktexjLp./OgFD.qUUitz8mu', 'makaka@a.com', 'resources/img/foto.png', 1, 'ADMIN', 'ACTIVE', 15, 1, '2019-08-22 23:03:24.411', '2019-08-22 23:03:24.411');
INSERT INTO public.user_account (id, nickname, password, email, foto, country_id, user_role, user_status, sum_games, won_games, created, updated) VALUES (3, 'Test2', '$2a$10$aK2j.mTJ8waf7D9al2yOieXQlrc9CADMT7zRXDj.y.QJJkimkQpCy', 'test2@aol.com', 'resources/img/foto.png', 70, 'MEMBER', 'ACTIVE', 25, 5, '2019-09-03 13:17:22.73', '2019-09-03 13:17:22.73');


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

SELECT pg_catalog.setval('public.card_in_game_id_seq', 22413, true);


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

SELECT pg_catalog.setval('public.chat_in_home_id_seq', 18, true);


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

SELECT pg_catalog.setval('public.game_id_seq', 313, true);


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

SELECT pg_catalog.setval('public.player_id_seq', 771, true);


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

SELECT pg_catalog.setval('public.transaction_id_seq', 1711, true);


--
-- TOC entry 2996 (class 0 OID 0)
-- Dependencies: 219
-- Name: user_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_account_id_seq', 20, true);


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


-- Completed on 2019-09-15 14:16:33

--
-- PostgreSQL database dump complete
--

