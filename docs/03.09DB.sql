--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2
-- Dumped by pg_dump version 11.2

-- Started on 2019-09-03 17:08:59

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
    card2 character varying
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

INSERT INTO public.action (id, player_id, bet, call, raise, fold, check_check, all_in, created, updated) VALUES (1, 206, 5, 0, 0, false, false, 0, '2019-09-03 14:59:49.923', '2019-09-03 14:59:49.923');
INSERT INTO public.action (id, player_id, bet, call, raise, fold, check_check, all_in, created, updated) VALUES (2, 205, 10, 0, 0, false, false, 0, '2019-09-03 14:59:50.01', '2019-09-03 14:59:50.01');
INSERT INTO public.action (id, player_id, bet, call, raise, fold, check_check, all_in, created, updated) VALUES (3, 207, 5, 0, 0, false, false, 0, '2019-09-03 15:31:06.024', '2019-09-03 15:31:06.024');
INSERT INTO public.action (id, player_id, bet, call, raise, fold, check_check, all_in, created, updated) VALUES (4, 208, 10, 0, 0, false, false, 0, '2019-09-03 15:31:06.027', '2019-09-03 15:31:06.027');
INSERT INTO public.action (id, player_id, bet, call, raise, fold, check_check, all_in, created, updated) VALUES (5, 207, 5, 0, 0, false, false, 0, '2019-09-03 15:31:06.471', '2019-09-03 15:31:06.471');
INSERT INTO public.action (id, player_id, bet, call, raise, fold, check_check, all_in, created, updated) VALUES (6, 208, 10, 0, 0, false, false, 0, '2019-09-03 15:31:06.475', '2019-09-03 15:31:06.475');
INSERT INTO public.action (id, player_id, bet, call, raise, fold, check_check, all_in, created, updated) VALUES (7, 210, 5, 0, 0, false, false, 0, '2019-09-03 15:35:33.727', '2019-09-03 15:35:33.727');
INSERT INTO public.action (id, player_id, bet, call, raise, fold, check_check, all_in, created, updated) VALUES (8, 209, 10, 0, 0, false, false, 0, '2019-09-03 15:35:33.737', '2019-09-03 15:35:33.737');
INSERT INTO public.action (id, player_id, bet, call, raise, fold, check_check, all_in, created, updated) VALUES (9, 211, 5, 0, 0, false, false, 0, '2019-09-03 15:42:57.051', '2019-09-03 15:42:57.051');
INSERT INTO public.action (id, player_id, bet, call, raise, fold, check_check, all_in, created, updated) VALUES (10, 212, 10, 0, 0, false, false, 0, '2019-09-03 15:42:57.054', '2019-09-03 15:42:57.054');
INSERT INTO public.action (id, player_id, bet, call, raise, fold, check_check, all_in, created, updated) VALUES (11, 214, 5, 0, 0, false, false, 0, '2019-09-03 15:51:26.709', '2019-09-03 15:51:26.709');
INSERT INTO public.action (id, player_id, bet, call, raise, fold, check_check, all_in, created, updated) VALUES (12, 213, 10, 0, 0, false, false, 0, '2019-09-03 15:51:26.712', '2019-09-03 15:51:26.712');
INSERT INTO public.action (id, player_id, bet, call, raise, fold, check_check, all_in, created, updated) VALUES (13, 216, 5, 0, 0, false, false, 0, '2019-09-03 16:07:27.182', '2019-09-03 16:07:27.182');
INSERT INTO public.action (id, player_id, bet, call, raise, fold, check_check, all_in, created, updated) VALUES (14, 215, 10, 0, 0, false, false, 0, '2019-09-03 16:07:27.187', '2019-09-03 16:07:27.187');
INSERT INTO public.action (id, player_id, bet, call, raise, fold, check_check, all_in, created, updated) VALUES (15, 217, 5, 0, 0, false, false, 0, '2019-09-03 16:14:54.921', '2019-09-03 16:14:54.921');
INSERT INTO public.action (id, player_id, bet, call, raise, fold, check_check, all_in, created, updated) VALUES (16, 218, 10, 0, 0, false, false, 0, '2019-09-03 16:14:54.924', '2019-09-03 16:14:54.924');
INSERT INTO public.action (id, player_id, bet, call, raise, fold, check_check, all_in, created, updated) VALUES (17, 220, 5, 0, 0, false, false, 0, '2019-09-03 16:16:18.831', '2019-09-03 16:16:18.831');
INSERT INTO public.action (id, player_id, bet, call, raise, fold, check_check, all_in, created, updated) VALUES (18, 219, 10, 0, 0, false, false, 0, '2019-09-03 16:16:18.833', '2019-09-03 16:16:18.833');
INSERT INTO public.action (id, player_id, bet, call, raise, fold, check_check, all_in, created, updated) VALUES (19, 224, 5, 0, 0, false, false, 0, '2019-09-03 17:06:35.353', '2019-09-03 17:06:35.353');
INSERT INTO public.action (id, player_id, bet, call, raise, fold, check_check, all_in, created, updated) VALUES (20, 223, 10, 0, 0, false, false, 0, '2019-09-03 17:06:35.356', '2019-09-03 17:06:35.356');


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

INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2706, 68, 95, NULL, 'INDECK', '2019-09-03 14:59:48.089', '2019-09-03 14:59:48.089');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2707, 33, 95, NULL, 'INDECK', '2019-09-03 14:59:48.106', '2019-09-03 14:59:48.106');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2708, 40, 95, NULL, 'INDECK', '2019-09-03 14:59:48.207', '2019-09-03 14:59:48.207');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2709, 67, 95, NULL, 'INDECK', '2019-09-03 14:59:48.218', '2019-09-03 14:59:48.218');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2710, 38, 95, NULL, 'INDECK', '2019-09-03 14:59:48.23', '2019-09-03 14:59:48.23');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2711, 78, 95, NULL, 'INDECK', '2019-09-03 14:59:48.242', '2019-09-03 14:59:48.242');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2712, 61, 95, NULL, 'INDECK', '2019-09-03 14:59:48.253', '2019-09-03 14:59:48.253');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2713, 41, 95, NULL, 'INDECK', '2019-09-03 14:59:48.264', '2019-09-03 14:59:48.264');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2714, 77, 95, NULL, 'INDECK', '2019-09-03 14:59:48.273', '2019-09-03 14:59:48.273');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2715, 30, 95, NULL, 'INDECK', '2019-09-03 14:59:48.282', '2019-09-03 14:59:48.282');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2716, 45, 95, NULL, 'INDECK', '2019-09-03 14:59:48.292', '2019-09-03 14:59:48.292');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2717, 51, 95, NULL, 'INDECK', '2019-09-03 14:59:48.3', '2019-09-03 14:59:48.3');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2718, 73, 95, NULL, 'INDECK', '2019-09-03 14:59:48.309', '2019-09-03 14:59:48.309');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2719, 60, 95, NULL, 'INDECK', '2019-09-03 14:59:48.318', '2019-09-03 14:59:48.318');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2720, 64, 95, NULL, 'INDECK', '2019-09-03 14:59:48.325', '2019-09-03 14:59:48.325');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2721, 57, 95, NULL, 'INDECK', '2019-09-03 14:59:48.334', '2019-09-03 14:59:48.334');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2722, 29, 95, NULL, 'INDECK', '2019-09-03 14:59:48.342', '2019-09-03 14:59:48.342');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2723, 31, 95, NULL, 'INDECK', '2019-09-03 14:59:48.35', '2019-09-03 14:59:48.35');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2724, 59, 95, NULL, 'INDECK', '2019-09-03 14:59:48.357', '2019-09-03 14:59:48.357');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2725, 27, 95, NULL, 'INDECK', '2019-09-03 14:59:48.363', '2019-09-03 14:59:48.363');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2726, 54, 95, NULL, 'INDECK', '2019-09-03 14:59:48.371', '2019-09-03 14:59:48.371');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2727, 53, 95, NULL, 'INDECK', '2019-09-03 14:59:48.378', '2019-09-03 14:59:48.378');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2728, 46, 95, NULL, 'INDECK', '2019-09-03 14:59:48.385', '2019-09-03 14:59:48.385');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2729, 75, 95, NULL, 'INDECK', '2019-09-03 14:59:48.392', '2019-09-03 14:59:48.392');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2730, 66, 95, NULL, 'INDECK', '2019-09-03 14:59:48.4', '2019-09-03 14:59:48.4');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2731, 63, 95, NULL, 'INDECK', '2019-09-03 14:59:48.408', '2019-09-03 14:59:48.408');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2732, 37, 95, NULL, 'INDECK', '2019-09-03 14:59:48.415', '2019-09-03 14:59:48.415');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2733, 47, 95, NULL, 'INDECK', '2019-09-03 14:59:48.424', '2019-09-03 14:59:48.424');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2734, 55, 95, NULL, 'INDECK', '2019-09-03 14:59:48.431', '2019-09-03 14:59:48.431');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2735, 35, 95, NULL, 'INDECK', '2019-09-03 14:59:48.438', '2019-09-03 14:59:48.438');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2736, 42, 95, NULL, 'INDECK', '2019-09-03 14:59:48.444', '2019-09-03 14:59:48.444');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2737, 76, 95, NULL, 'INDECK', '2019-09-03 14:59:48.449', '2019-09-03 14:59:48.449');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2738, 70, 95, NULL, 'INDECK', '2019-09-03 14:59:48.456', '2019-09-03 14:59:48.456');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2739, 49, 95, NULL, 'INDECK', '2019-09-03 14:59:48.462', '2019-09-03 14:59:48.462');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2740, 28, 95, NULL, 'INDECK', '2019-09-03 14:59:48.468', '2019-09-03 14:59:48.468');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2741, 69, 95, NULL, 'INDECK', '2019-09-03 14:59:48.476', '2019-09-03 14:59:48.476');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2742, 36, 95, NULL, 'INDECK', '2019-09-03 14:59:48.484', '2019-09-03 14:59:48.484');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2743, 39, 95, NULL, 'INDECK', '2019-09-03 14:59:48.492', '2019-09-03 14:59:48.492');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2744, 44, 95, NULL, 'INDECK', '2019-09-03 14:59:48.498', '2019-09-03 14:59:48.498');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2745, 62, 95, NULL, 'INDECK', '2019-09-03 14:59:48.505', '2019-09-03 14:59:48.505');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2746, 71, 95, NULL, 'INDECK', '2019-09-03 14:59:48.511', '2019-09-03 14:59:48.511');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2747, 34, 95, NULL, 'INDECK', '2019-09-03 14:59:48.517', '2019-09-03 14:59:48.517');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2748, 65, 95, NULL, 'INDECK', '2019-09-03 14:59:48.524', '2019-09-03 14:59:48.524');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2749, 58, 95, NULL, 'INDECK', '2019-09-03 14:59:48.53', '2019-09-03 14:59:48.53');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2750, 52, 95, NULL, 'INDECK', '2019-09-03 14:59:48.537', '2019-09-03 14:59:48.537');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2751, 43, 95, NULL, 'INDECK', '2019-09-03 14:59:48.543', '2019-09-03 14:59:48.543');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2752, 74, 95, NULL, 'INDECK', '2019-09-03 14:59:48.551', '2019-09-03 14:59:48.551');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2753, 48, 95, NULL, 'INDECK', '2019-09-03 14:59:48.559', '2019-09-03 14:59:48.559');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2754, 50, 95, NULL, 'INDECK', '2019-09-03 14:59:48.567', '2019-09-03 14:59:48.567');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2755, 72, 95, NULL, 'INDECK', '2019-09-03 14:59:48.573', '2019-09-03 14:59:48.573');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2756, 56, 95, NULL, 'INDECK', '2019-09-03 14:59:48.58', '2019-09-03 14:59:48.58');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2757, 32, 95, NULL, 'INDECK', '2019-09-03 14:59:48.588', '2019-09-03 14:59:48.588');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2758, 68, 99, NULL, 'INDECK', '2019-09-03 15:31:05.682', '2019-09-03 15:31:05.682');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2759, 33, 99, NULL, 'INDECK', '2019-09-03 15:31:05.699', '2019-09-03 15:31:05.699');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2760, 40, 99, NULL, 'INDECK', '2019-09-03 15:31:05.714', '2019-09-03 15:31:05.714');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2761, 67, 99, NULL, 'INDECK', '2019-09-03 15:31:05.73', '2019-09-03 15:31:05.73');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2762, 38, 99, NULL, 'INDECK', '2019-09-03 15:31:05.743', '2019-09-03 15:31:05.743');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2763, 78, 99, NULL, 'INDECK', '2019-09-03 15:31:05.754', '2019-09-03 15:31:05.754');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2764, 61, 99, NULL, 'INDECK', '2019-09-03 15:31:05.764', '2019-09-03 15:31:05.764');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2765, 41, 99, NULL, 'INDECK', '2019-09-03 15:31:05.774', '2019-09-03 15:31:05.774');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2766, 77, 99, NULL, 'INDECK', '2019-09-03 15:31:05.782', '2019-09-03 15:31:05.782');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2767, 30, 99, NULL, 'INDECK', '2019-09-03 15:31:05.789', '2019-09-03 15:31:05.789');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2768, 45, 99, NULL, 'INDECK', '2019-09-03 15:31:05.797', '2019-09-03 15:31:05.797');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2769, 51, 99, NULL, 'INDECK', '2019-09-03 15:31:05.805', '2019-09-03 15:31:05.805');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2770, 73, 99, NULL, 'INDECK', '2019-09-03 15:31:05.813', '2019-09-03 15:31:05.813');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2771, 60, 99, NULL, 'INDECK', '2019-09-03 15:31:05.821', '2019-09-03 15:31:05.821');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2772, 64, 99, NULL, 'INDECK', '2019-09-03 15:31:05.829', '2019-09-03 15:31:05.829');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2773, 57, 99, NULL, 'INDECK', '2019-09-03 15:31:05.837', '2019-09-03 15:31:05.837');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2774, 29, 99, NULL, 'INDECK', '2019-09-03 15:31:05.846', '2019-09-03 15:31:05.846');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2775, 31, 99, NULL, 'INDECK', '2019-09-03 15:31:05.853', '2019-09-03 15:31:05.853');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2776, 59, 99, NULL, 'INDECK', '2019-09-03 15:31:05.86', '2019-09-03 15:31:05.86');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2777, 27, 99, NULL, 'INDECK', '2019-09-03 15:31:05.867', '2019-09-03 15:31:05.867');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2778, 54, 99, NULL, 'INDECK', '2019-09-03 15:31:05.873', '2019-09-03 15:31:05.873');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2779, 53, 99, NULL, 'INDECK', '2019-09-03 15:31:05.88', '2019-09-03 15:31:05.88');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2780, 46, 99, NULL, 'INDECK', '2019-09-03 15:31:05.888', '2019-09-03 15:31:05.888');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2781, 75, 99, NULL, 'INDECK', '2019-09-03 15:31:05.896', '2019-09-03 15:31:05.896');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2782, 66, 99, NULL, 'INDECK', '2019-09-03 15:31:05.904', '2019-09-03 15:31:05.904');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2783, 63, 99, NULL, 'INDECK', '2019-09-03 15:31:05.913', '2019-09-03 15:31:05.913');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2784, 37, 99, NULL, 'INDECK', '2019-09-03 15:31:05.922', '2019-09-03 15:31:05.922');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2785, 47, 99, NULL, 'INDECK', '2019-09-03 15:31:05.929', '2019-09-03 15:31:05.929');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2786, 55, 99, NULL, 'INDECK', '2019-09-03 15:31:05.936', '2019-09-03 15:31:05.936');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2787, 35, 99, NULL, 'INDECK', '2019-09-03 15:31:05.942', '2019-09-03 15:31:05.942');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2788, 42, 99, NULL, 'INDECK', '2019-09-03 15:31:05.949', '2019-09-03 15:31:05.949');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2789, 76, 99, NULL, 'INDECK', '2019-09-03 15:31:05.955', '2019-09-03 15:31:05.955');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2790, 70, 99, NULL, 'INDECK', '2019-09-03 15:31:05.961', '2019-09-03 15:31:05.961');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2791, 49, 99, NULL, 'INDECK', '2019-09-03 15:31:05.968', '2019-09-03 15:31:05.968');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2792, 28, 99, NULL, 'INDECK', '2019-09-03 15:31:05.974', '2019-09-03 15:31:05.974');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2793, 69, 99, NULL, 'INDECK', '2019-09-03 15:31:05.981', '2019-09-03 15:31:05.981');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2794, 36, 99, NULL, 'INDECK', '2019-09-03 15:31:05.988', '2019-09-03 15:31:05.988');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2795, 39, 99, NULL, 'INDECK', '2019-09-03 15:31:05.997', '2019-09-03 15:31:05.997');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2796, 44, 99, NULL, 'INDECK', '2019-09-03 15:31:06.006', '2019-09-03 15:31:06.006');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2797, 62, 99, NULL, 'INDECK', '2019-09-03 15:31:06.014', '2019-09-03 15:31:06.014');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2798, 71, 99, NULL, 'INDECK', '2019-09-03 15:31:06.023', '2019-09-03 15:31:06.023');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2799, 34, 99, NULL, 'INDECK', '2019-09-03 15:31:06.031', '2019-09-03 15:31:06.031');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2800, 65, 99, NULL, 'INDECK', '2019-09-03 15:31:06.045', '2019-09-03 15:31:06.045');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2801, 58, 99, NULL, 'INDECK', '2019-09-03 15:31:06.056', '2019-09-03 15:31:06.056');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2802, 52, 99, NULL, 'INDECK', '2019-09-03 15:31:06.063', '2019-09-03 15:31:06.063');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2803, 43, 99, NULL, 'INDECK', '2019-09-03 15:31:06.07', '2019-09-03 15:31:06.07');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2804, 74, 99, NULL, 'INDECK', '2019-09-03 15:31:06.077', '2019-09-03 15:31:06.077');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2805, 48, 99, NULL, 'INDECK', '2019-09-03 15:31:06.086', '2019-09-03 15:31:06.086');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2806, 50, 99, NULL, 'INDECK', '2019-09-03 15:31:06.093', '2019-09-03 15:31:06.093');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2807, 72, 99, NULL, 'INDECK', '2019-09-03 15:31:06.1', '2019-09-03 15:31:06.1');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2808, 56, 99, NULL, 'INDECK', '2019-09-03 15:31:06.107', '2019-09-03 15:31:06.107');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2809, 32, 99, NULL, 'INDECK', '2019-09-03 15:31:06.113', '2019-09-03 15:31:06.113');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2810, 68, 100, NULL, 'INDECK', '2019-09-03 15:35:32.847', '2019-09-03 15:35:32.847');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2811, 33, 100, NULL, 'INDECK', '2019-09-03 15:35:32.857', '2019-09-03 15:35:32.857');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2812, 40, 100, NULL, 'INDECK', '2019-09-03 15:35:32.865', '2019-09-03 15:35:32.865');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2813, 67, 100, NULL, 'INDECK', '2019-09-03 15:35:32.871', '2019-09-03 15:35:32.871');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2814, 38, 100, NULL, 'INDECK', '2019-09-03 15:35:32.877', '2019-09-03 15:35:32.877');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2815, 78, 100, NULL, 'INDECK', '2019-09-03 15:35:32.884', '2019-09-03 15:35:32.884');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2816, 61, 100, NULL, 'INDECK', '2019-09-03 15:35:32.89', '2019-09-03 15:35:32.89');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2817, 41, 100, NULL, 'INDECK', '2019-09-03 15:35:32.896', '2019-09-03 15:35:32.896');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2818, 77, 100, NULL, 'INDECK', '2019-09-03 15:35:32.902', '2019-09-03 15:35:32.902');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2819, 30, 100, NULL, 'INDECK', '2019-09-03 15:35:32.908', '2019-09-03 15:35:32.908');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2820, 45, 100, NULL, 'INDECK', '2019-09-03 15:35:32.914', '2019-09-03 15:35:32.914');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2821, 51, 100, NULL, 'INDECK', '2019-09-03 15:35:32.92', '2019-09-03 15:35:32.92');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2822, 73, 100, NULL, 'INDECK', '2019-09-03 15:35:32.927', '2019-09-03 15:35:32.927');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2823, 60, 100, NULL, 'INDECK', '2019-09-03 15:35:32.933', '2019-09-03 15:35:32.933');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2824, 64, 100, NULL, 'INDECK', '2019-09-03 15:35:32.94', '2019-09-03 15:35:32.94');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2825, 57, 100, NULL, 'INDECK', '2019-09-03 15:35:32.948', '2019-09-03 15:35:32.948');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2826, 29, 100, NULL, 'INDECK', '2019-09-03 15:35:32.956', '2019-09-03 15:35:32.956');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2827, 31, 100, NULL, 'INDECK', '2019-09-03 15:35:32.963', '2019-09-03 15:35:32.963');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2828, 59, 100, NULL, 'INDECK', '2019-09-03 15:35:32.97', '2019-09-03 15:35:32.97');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2829, 27, 100, NULL, 'INDECK', '2019-09-03 15:35:32.978', '2019-09-03 15:35:32.978');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2830, 54, 100, NULL, 'INDECK', '2019-09-03 15:35:32.985', '2019-09-03 15:35:32.985');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2831, 53, 100, NULL, 'INDECK', '2019-09-03 15:35:32.991', '2019-09-03 15:35:32.991');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2832, 46, 100, NULL, 'INDECK', '2019-09-03 15:35:32.999', '2019-09-03 15:35:32.999');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2833, 75, 100, NULL, 'INDECK', '2019-09-03 15:35:33.007', '2019-09-03 15:35:33.007');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2834, 66, 100, NULL, 'INDECK', '2019-09-03 15:35:33.014', '2019-09-03 15:35:33.014');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2835, 63, 100, NULL, 'INDECK', '2019-09-03 15:35:33.022', '2019-09-03 15:35:33.022');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2836, 37, 100, NULL, 'INDECK', '2019-09-03 15:35:33.029', '2019-09-03 15:35:33.029');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2837, 47, 100, NULL, 'INDECK', '2019-09-03 15:35:33.036', '2019-09-03 15:35:33.036');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2838, 55, 100, NULL, 'INDECK', '2019-09-03 15:35:33.042', '2019-09-03 15:35:33.042');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2839, 35, 100, NULL, 'INDECK', '2019-09-03 15:35:33.048', '2019-09-03 15:35:33.048');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2840, 42, 100, NULL, 'INDECK', '2019-09-03 15:35:33.054', '2019-09-03 15:35:33.054');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2841, 76, 100, NULL, 'INDECK', '2019-09-03 15:35:33.06', '2019-09-03 15:35:33.06');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2842, 70, 100, NULL, 'INDECK', '2019-09-03 15:35:33.066', '2019-09-03 15:35:33.066');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2843, 49, 100, NULL, 'INDECK', '2019-09-03 15:35:33.072', '2019-09-03 15:35:33.072');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2844, 28, 100, NULL, 'INDECK', '2019-09-03 15:35:33.078', '2019-09-03 15:35:33.078');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2845, 69, 100, NULL, 'INDECK', '2019-09-03 15:35:33.084', '2019-09-03 15:35:33.084');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2846, 36, 100, NULL, 'INDECK', '2019-09-03 15:35:33.091', '2019-09-03 15:35:33.091');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2847, 39, 100, NULL, 'INDECK', '2019-09-03 15:35:33.097', '2019-09-03 15:35:33.097');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2848, 44, 100, NULL, 'INDECK', '2019-09-03 15:35:33.103', '2019-09-03 15:35:33.103');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2849, 62, 100, NULL, 'INDECK', '2019-09-03 15:35:33.109', '2019-09-03 15:35:33.109');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2850, 71, 100, NULL, 'INDECK', '2019-09-03 15:35:33.115', '2019-09-03 15:35:33.115');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2851, 34, 100, NULL, 'INDECK', '2019-09-03 15:35:33.122', '2019-09-03 15:35:33.122');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2852, 65, 100, NULL, 'INDECK', '2019-09-03 15:35:33.128', '2019-09-03 15:35:33.128');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2853, 58, 100, NULL, 'INDECK', '2019-09-03 15:35:33.134', '2019-09-03 15:35:33.134');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2854, 52, 100, NULL, 'INDECK', '2019-09-03 15:35:33.141', '2019-09-03 15:35:33.141');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2855, 43, 100, NULL, 'INDECK', '2019-09-03 15:35:33.147', '2019-09-03 15:35:33.147');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2856, 74, 100, NULL, 'INDECK', '2019-09-03 15:35:33.153', '2019-09-03 15:35:33.153');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2857, 48, 100, NULL, 'INDECK', '2019-09-03 15:35:33.159', '2019-09-03 15:35:33.159');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2858, 50, 100, NULL, 'INDECK', '2019-09-03 15:35:33.165', '2019-09-03 15:35:33.165');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2859, 72, 100, NULL, 'INDECK', '2019-09-03 15:35:33.175', '2019-09-03 15:35:33.175');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2860, 56, 100, NULL, 'INDECK', '2019-09-03 15:35:33.184', '2019-09-03 15:35:33.184');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2861, 32, 100, NULL, 'INDECK', '2019-09-03 15:35:33.192', '2019-09-03 15:35:33.192');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2862, 68, 101, NULL, 'INDECK', '2019-09-03 15:42:56.793', '2019-09-03 15:42:56.793');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2863, 33, 101, NULL, 'INDECK', '2019-09-03 15:42:56.802', '2019-09-03 15:42:56.802');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2864, 40, 101, NULL, 'INDECK', '2019-09-03 15:42:56.811', '2019-09-03 15:42:56.811');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2865, 67, 101, NULL, 'INDECK', '2019-09-03 15:42:56.82', '2019-09-03 15:42:56.82');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2866, 38, 101, NULL, 'INDECK', '2019-09-03 15:42:56.828', '2019-09-03 15:42:56.828');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2867, 78, 101, NULL, 'INDECK', '2019-09-03 15:42:56.837', '2019-09-03 15:42:56.837');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2868, 61, 101, NULL, 'INDECK', '2019-09-03 15:42:56.843', '2019-09-03 15:42:56.843');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2869, 41, 101, NULL, 'INDECK', '2019-09-03 15:42:56.847', '2019-09-03 15:42:56.847');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2870, 77, 101, NULL, 'INDECK', '2019-09-03 15:42:56.851', '2019-09-03 15:42:56.851');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2871, 30, 101, NULL, 'INDECK', '2019-09-03 15:42:56.856', '2019-09-03 15:42:56.856');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2872, 45, 101, NULL, 'INDECK', '2019-09-03 15:42:56.86', '2019-09-03 15:42:56.86');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2873, 51, 101, NULL, 'INDECK', '2019-09-03 15:42:56.865', '2019-09-03 15:42:56.865');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2874, 73, 101, NULL, 'INDECK', '2019-09-03 15:42:56.869', '2019-09-03 15:42:56.869');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2875, 60, 101, NULL, 'INDECK', '2019-09-03 15:42:56.872', '2019-09-03 15:42:56.872');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2876, 64, 101, NULL, 'INDECK', '2019-09-03 15:42:56.875', '2019-09-03 15:42:56.875');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2877, 57, 101, NULL, 'INDECK', '2019-09-03 15:42:56.878', '2019-09-03 15:42:56.878');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2878, 29, 101, NULL, 'INDECK', '2019-09-03 15:42:56.882', '2019-09-03 15:42:56.882');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2879, 31, 101, NULL, 'INDECK', '2019-09-03 15:42:56.885', '2019-09-03 15:42:56.885');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2880, 59, 101, NULL, 'INDECK', '2019-09-03 15:42:56.888', '2019-09-03 15:42:56.888');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2881, 27, 101, NULL, 'INDECK', '2019-09-03 15:42:56.891', '2019-09-03 15:42:56.891');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2882, 54, 101, NULL, 'INDECK', '2019-09-03 15:42:56.894', '2019-09-03 15:42:56.894');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2883, 53, 101, NULL, 'INDECK', '2019-09-03 15:42:56.898', '2019-09-03 15:42:56.898');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2884, 46, 101, NULL, 'INDECK', '2019-09-03 15:42:56.902', '2019-09-03 15:42:56.902');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2885, 75, 101, NULL, 'INDECK', '2019-09-03 15:42:56.906', '2019-09-03 15:42:56.906');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2886, 66, 101, NULL, 'INDECK', '2019-09-03 15:42:56.909', '2019-09-03 15:42:56.909');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2887, 63, 101, NULL, 'INDECK', '2019-09-03 15:42:56.913', '2019-09-03 15:42:56.913');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2888, 37, 101, NULL, 'INDECK', '2019-09-03 15:42:56.916', '2019-09-03 15:42:56.916');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2889, 47, 101, NULL, 'INDECK', '2019-09-03 15:42:56.92', '2019-09-03 15:42:56.92');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2890, 55, 101, NULL, 'INDECK', '2019-09-03 15:42:56.923', '2019-09-03 15:42:56.923');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2891, 35, 101, NULL, 'INDECK', '2019-09-03 15:42:56.926', '2019-09-03 15:42:56.926');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2892, 42, 101, NULL, 'INDECK', '2019-09-03 15:42:56.93', '2019-09-03 15:42:56.93');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2893, 76, 101, NULL, 'INDECK', '2019-09-03 15:42:56.934', '2019-09-03 15:42:56.934');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2894, 70, 101, NULL, 'INDECK', '2019-09-03 15:42:56.938', '2019-09-03 15:42:56.938');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2895, 49, 101, NULL, 'INDECK', '2019-09-03 15:42:56.941', '2019-09-03 15:42:56.941');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2896, 28, 101, NULL, 'INDECK', '2019-09-03 15:42:56.944', '2019-09-03 15:42:56.944');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2897, 69, 101, NULL, 'INDECK', '2019-09-03 15:42:56.947', '2019-09-03 15:42:56.947');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2898, 36, 101, NULL, 'INDECK', '2019-09-03 15:42:56.95', '2019-09-03 15:42:56.95');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2899, 39, 101, NULL, 'INDECK', '2019-09-03 15:42:56.953', '2019-09-03 15:42:56.953');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2900, 44, 101, NULL, 'INDECK', '2019-09-03 15:42:56.956', '2019-09-03 15:42:56.956');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2901, 62, 101, NULL, 'INDECK', '2019-09-03 15:42:56.96', '2019-09-03 15:42:56.96');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2902, 71, 101, NULL, 'INDECK', '2019-09-03 15:42:56.963', '2019-09-03 15:42:56.963');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2903, 34, 101, NULL, 'INDECK', '2019-09-03 15:42:56.968', '2019-09-03 15:42:56.968');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2904, 65, 101, NULL, 'INDECK', '2019-09-03 15:42:56.974', '2019-09-03 15:42:56.974');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2905, 58, 101, NULL, 'INDECK', '2019-09-03 15:42:56.985', '2019-09-03 15:42:56.985');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2906, 52, 101, NULL, 'INDECK', '2019-09-03 15:42:56.992', '2019-09-03 15:42:56.992');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2907, 43, 101, NULL, 'INDECK', '2019-09-03 15:42:56.999', '2019-09-03 15:42:56.999');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2908, 74, 101, NULL, 'INDECK', '2019-09-03 15:42:57.007', '2019-09-03 15:42:57.007');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2909, 48, 101, NULL, 'INDECK', '2019-09-03 15:42:57.015', '2019-09-03 15:42:57.015');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2910, 50, 101, NULL, 'INDECK', '2019-09-03 15:42:57.026', '2019-09-03 15:42:57.026');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2911, 72, 101, NULL, 'INDECK', '2019-09-03 15:42:57.035', '2019-09-03 15:42:57.035');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2912, 56, 101, NULL, 'INDECK', '2019-09-03 15:42:57.041', '2019-09-03 15:42:57.041');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2913, 32, 101, NULL, 'INDECK', '2019-09-03 15:42:57.046', '2019-09-03 15:42:57.046');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2914, 68, 102, NULL, 'INDECK', '2019-09-03 15:51:25.97', '2019-09-03 15:51:25.97');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2915, 33, 102, NULL, 'INDECK', '2019-09-03 15:51:25.975', '2019-09-03 15:51:25.975');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2916, 40, 102, NULL, 'INDECK', '2019-09-03 15:51:25.979', '2019-09-03 15:51:25.979');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2917, 67, 102, NULL, 'INDECK', '2019-09-03 15:51:25.982', '2019-09-03 15:51:25.982');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2918, 38, 102, NULL, 'INDECK', '2019-09-03 15:51:25.985', '2019-09-03 15:51:25.985');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2919, 78, 102, NULL, 'INDECK', '2019-09-03 15:51:25.989', '2019-09-03 15:51:25.989');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2920, 61, 102, NULL, 'INDECK', '2019-09-03 15:51:25.992', '2019-09-03 15:51:25.992');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2921, 41, 102, NULL, 'INDECK', '2019-09-03 15:51:25.995', '2019-09-03 15:51:25.995');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2922, 77, 102, NULL, 'INDECK', '2019-09-03 15:51:25.998', '2019-09-03 15:51:25.998');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2923, 30, 102, NULL, 'INDECK', '2019-09-03 15:51:26.001', '2019-09-03 15:51:26.001');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2924, 45, 102, NULL, 'INDECK', '2019-09-03 15:51:26.005', '2019-09-03 15:51:26.005');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2925, 51, 102, NULL, 'INDECK', '2019-09-03 15:51:26.008', '2019-09-03 15:51:26.008');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2926, 73, 102, NULL, 'INDECK', '2019-09-03 15:51:26.012', '2019-09-03 15:51:26.012');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2927, 60, 102, NULL, 'INDECK', '2019-09-03 15:51:26.016', '2019-09-03 15:51:26.016');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2928, 64, 102, NULL, 'INDECK', '2019-09-03 15:51:26.019', '2019-09-03 15:51:26.019');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2929, 57, 102, NULL, 'INDECK', '2019-09-03 15:51:26.022', '2019-09-03 15:51:26.022');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2930, 29, 102, NULL, 'INDECK', '2019-09-03 15:51:26.025', '2019-09-03 15:51:26.025');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2931, 31, 102, NULL, 'INDECK', '2019-09-03 15:51:26.028', '2019-09-03 15:51:26.028');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2932, 59, 102, NULL, 'INDECK', '2019-09-03 15:51:26.031', '2019-09-03 15:51:26.031');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2933, 27, 102, NULL, 'INDECK', '2019-09-03 15:51:26.034', '2019-09-03 15:51:26.034');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2934, 54, 102, NULL, 'INDECK', '2019-09-03 15:51:26.036', '2019-09-03 15:51:26.036');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2935, 53, 102, NULL, 'INDECK', '2019-09-03 15:51:26.039', '2019-09-03 15:51:26.039');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2936, 46, 102, NULL, 'INDECK', '2019-09-03 15:51:26.042', '2019-09-03 15:51:26.042');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2937, 75, 102, NULL, 'INDECK', '2019-09-03 15:51:26.045', '2019-09-03 15:51:26.045');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2938, 66, 102, NULL, 'INDECK', '2019-09-03 15:51:26.048', '2019-09-03 15:51:26.048');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2939, 63, 102, NULL, 'INDECK', '2019-09-03 15:51:26.05', '2019-09-03 15:51:26.05');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2940, 37, 102, NULL, 'INDECK', '2019-09-03 15:51:26.053', '2019-09-03 15:51:26.053');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2941, 47, 102, NULL, 'INDECK', '2019-09-03 15:51:26.056', '2019-09-03 15:51:26.056');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2942, 55, 102, NULL, 'INDECK', '2019-09-03 15:51:26.059', '2019-09-03 15:51:26.059');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2943, 35, 102, NULL, 'INDECK', '2019-09-03 15:51:26.062', '2019-09-03 15:51:26.062');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2944, 42, 102, NULL, 'INDECK', '2019-09-03 15:51:26.065', '2019-09-03 15:51:26.065');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2945, 76, 102, NULL, 'INDECK', '2019-09-03 15:51:26.068', '2019-09-03 15:51:26.068');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2946, 70, 102, NULL, 'INDECK', '2019-09-03 15:51:26.072', '2019-09-03 15:51:26.072');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2947, 49, 102, NULL, 'INDECK', '2019-09-03 15:51:26.075', '2019-09-03 15:51:26.075');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2948, 28, 102, NULL, 'INDECK', '2019-09-03 15:51:26.123', '2019-09-03 15:51:26.123');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2949, 69, 102, NULL, 'INDECK', '2019-09-03 15:51:26.148', '2019-09-03 15:51:26.148');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2950, 36, 102, NULL, 'INDECK', '2019-09-03 15:51:26.255', '2019-09-03 15:51:26.255');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2951, 39, 102, NULL, 'INDECK', '2019-09-03 15:51:26.258', '2019-09-03 15:51:26.258');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2952, 44, 102, NULL, 'INDECK', '2019-09-03 15:51:26.261', '2019-09-03 15:51:26.261');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2953, 62, 102, NULL, 'INDECK', '2019-09-03 15:51:26.264', '2019-09-03 15:51:26.264');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2954, 71, 102, NULL, 'INDECK', '2019-09-03 15:51:26.267', '2019-09-03 15:51:26.267');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2955, 34, 102, NULL, 'INDECK', '2019-09-03 15:51:26.27', '2019-09-03 15:51:26.27');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2956, 65, 102, NULL, 'INDECK', '2019-09-03 15:51:26.273', '2019-09-03 15:51:26.273');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2957, 58, 102, NULL, 'INDECK', '2019-09-03 15:51:26.277', '2019-09-03 15:51:26.277');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2958, 52, 102, NULL, 'INDECK', '2019-09-03 15:51:26.281', '2019-09-03 15:51:26.281');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2959, 43, 102, NULL, 'INDECK', '2019-09-03 15:51:26.285', '2019-09-03 15:51:26.285');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2960, 74, 102, NULL, 'INDECK', '2019-09-03 15:51:26.288', '2019-09-03 15:51:26.288');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2961, 48, 102, NULL, 'INDECK', '2019-09-03 15:51:26.291', '2019-09-03 15:51:26.291');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2962, 50, 102, NULL, 'INDECK', '2019-09-03 15:51:26.294', '2019-09-03 15:51:26.294');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2963, 72, 102, NULL, 'INDECK', '2019-09-03 15:51:26.296', '2019-09-03 15:51:26.296');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2964, 56, 102, NULL, 'INDECK', '2019-09-03 15:51:26.3', '2019-09-03 15:51:26.3');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2965, 32, 102, NULL, 'INDECK', '2019-09-03 15:51:26.303', '2019-09-03 15:51:26.303');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2966, 68, 96, NULL, 'INDECK', '2019-09-03 16:07:26.393', '2019-09-03 16:07:26.393');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2967, 33, 96, NULL, 'INDECK', '2019-09-03 16:07:26.405', '2019-09-03 16:07:26.405');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2968, 40, 96, NULL, 'INDECK', '2019-09-03 16:07:26.417', '2019-09-03 16:07:26.417');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2969, 67, 96, NULL, 'INDECK', '2019-09-03 16:07:26.427', '2019-09-03 16:07:26.427');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2970, 38, 96, NULL, 'INDECK', '2019-09-03 16:07:26.438', '2019-09-03 16:07:26.438');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2971, 78, 96, NULL, 'INDECK', '2019-09-03 16:07:26.448', '2019-09-03 16:07:26.448');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2972, 61, 96, NULL, 'INDECK', '2019-09-03 16:07:26.457', '2019-09-03 16:07:26.457');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2973, 41, 96, NULL, 'INDECK', '2019-09-03 16:07:26.466', '2019-09-03 16:07:26.466');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2974, 77, 96, NULL, 'INDECK', '2019-09-03 16:07:26.473', '2019-09-03 16:07:26.473');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2975, 30, 96, NULL, 'INDECK', '2019-09-03 16:07:26.481', '2019-09-03 16:07:26.481');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2976, 45, 96, NULL, 'INDECK', '2019-09-03 16:07:26.49', '2019-09-03 16:07:26.49');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2977, 51, 96, NULL, 'INDECK', '2019-09-03 16:07:26.498', '2019-09-03 16:07:26.498');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2978, 73, 96, NULL, 'INDECK', '2019-09-03 16:07:26.506', '2019-09-03 16:07:26.506');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2979, 60, 96, NULL, 'INDECK', '2019-09-03 16:07:26.513', '2019-09-03 16:07:26.513');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2980, 64, 96, NULL, 'INDECK', '2019-09-03 16:07:26.521', '2019-09-03 16:07:26.521');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2981, 57, 96, NULL, 'INDECK', '2019-09-03 16:07:26.528', '2019-09-03 16:07:26.528');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2982, 29, 96, NULL, 'INDECK', '2019-09-03 16:07:26.536', '2019-09-03 16:07:26.536');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2983, 31, 96, NULL, 'INDECK', '2019-09-03 16:07:26.543', '2019-09-03 16:07:26.543');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2984, 59, 96, NULL, 'INDECK', '2019-09-03 16:07:26.551', '2019-09-03 16:07:26.551');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2985, 27, 96, NULL, 'INDECK', '2019-09-03 16:07:26.56', '2019-09-03 16:07:26.56');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2986, 54, 96, NULL, 'INDECK', '2019-09-03 16:07:26.568', '2019-09-03 16:07:26.568');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2987, 53, 96, NULL, 'INDECK', '2019-09-03 16:07:26.577', '2019-09-03 16:07:26.577');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2988, 46, 96, NULL, 'INDECK', '2019-09-03 16:07:26.586', '2019-09-03 16:07:26.586');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2989, 75, 96, NULL, 'INDECK', '2019-09-03 16:07:26.595', '2019-09-03 16:07:26.595');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2990, 66, 96, NULL, 'INDECK', '2019-09-03 16:07:26.613', '2019-09-03 16:07:26.613');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2991, 63, 96, NULL, 'INDECK', '2019-09-03 16:07:26.623', '2019-09-03 16:07:26.623');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2992, 37, 96, NULL, 'INDECK', '2019-09-03 16:07:26.637', '2019-09-03 16:07:26.637');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2993, 47, 96, NULL, 'INDECK', '2019-09-03 16:07:26.646', '2019-09-03 16:07:26.646');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2994, 55, 96, NULL, 'INDECK', '2019-09-03 16:07:26.655', '2019-09-03 16:07:26.655');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2995, 35, 96, NULL, 'INDECK', '2019-09-03 16:07:26.663', '2019-09-03 16:07:26.663');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2996, 42, 96, NULL, 'INDECK', '2019-09-03 16:07:26.672', '2019-09-03 16:07:26.672');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2997, 76, 96, NULL, 'INDECK', '2019-09-03 16:07:26.682', '2019-09-03 16:07:26.682');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2998, 70, 96, NULL, 'INDECK', '2019-09-03 16:07:26.692', '2019-09-03 16:07:26.692');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (2999, 49, 96, NULL, 'INDECK', '2019-09-03 16:07:26.701', '2019-09-03 16:07:26.701');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3000, 28, 96, NULL, 'INDECK', '2019-09-03 16:07:26.709', '2019-09-03 16:07:26.709');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3001, 69, 96, NULL, 'INDECK', '2019-09-03 16:07:26.716', '2019-09-03 16:07:26.716');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3002, 36, 96, NULL, 'INDECK', '2019-09-03 16:07:26.724', '2019-09-03 16:07:26.724');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3003, 39, 96, NULL, 'INDECK', '2019-09-03 16:07:26.732', '2019-09-03 16:07:26.732');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3004, 44, 96, NULL, 'INDECK', '2019-09-03 16:07:26.739', '2019-09-03 16:07:26.739');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3005, 62, 96, NULL, 'INDECK', '2019-09-03 16:07:26.746', '2019-09-03 16:07:26.746');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3006, 71, 96, NULL, 'INDECK', '2019-09-03 16:07:26.752', '2019-09-03 16:07:26.752');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3007, 34, 96, NULL, 'INDECK', '2019-09-03 16:07:26.759', '2019-09-03 16:07:26.759');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3008, 65, 96, NULL, 'INDECK', '2019-09-03 16:07:26.765', '2019-09-03 16:07:26.765');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3009, 58, 96, NULL, 'INDECK', '2019-09-03 16:07:26.772', '2019-09-03 16:07:26.772');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3010, 52, 96, NULL, 'INDECK', '2019-09-03 16:07:26.778', '2019-09-03 16:07:26.778');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3011, 43, 96, NULL, 'INDECK', '2019-09-03 16:07:26.785', '2019-09-03 16:07:26.785');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3012, 74, 96, NULL, 'INDECK', '2019-09-03 16:07:26.791', '2019-09-03 16:07:26.791');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3013, 48, 96, NULL, 'INDECK', '2019-09-03 16:07:26.798', '2019-09-03 16:07:26.798');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3014, 50, 96, NULL, 'INDECK', '2019-09-03 16:07:26.807', '2019-09-03 16:07:26.807');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3015, 72, 96, NULL, 'INDECK', '2019-09-03 16:07:26.815', '2019-09-03 16:07:26.815');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3016, 56, 96, NULL, 'INDECK', '2019-09-03 16:07:26.823', '2019-09-03 16:07:26.823');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3017, 32, 96, NULL, 'INDECK', '2019-09-03 16:07:26.832', '2019-09-03 16:07:26.832');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3018, 68, 103, NULL, 'INDECK', '2019-09-03 16:14:54.01', '2019-09-03 16:14:54.01');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3019, 33, 103, NULL, 'INDECK', '2019-09-03 16:14:54.015', '2019-09-03 16:14:54.015');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3020, 40, 103, NULL, 'INDECK', '2019-09-03 16:14:54.018', '2019-09-03 16:14:54.018');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3021, 67, 103, NULL, 'INDECK', '2019-09-03 16:14:54.021', '2019-09-03 16:14:54.021');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3022, 38, 103, NULL, 'INDECK', '2019-09-03 16:14:54.025', '2019-09-03 16:14:54.025');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3023, 78, 103, NULL, 'INDECK', '2019-09-03 16:14:54.028', '2019-09-03 16:14:54.028');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3024, 61, 103, NULL, 'INDECK', '2019-09-03 16:14:54.031', '2019-09-03 16:14:54.031');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3025, 41, 103, NULL, 'INDECK', '2019-09-03 16:14:54.034', '2019-09-03 16:14:54.034');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3026, 77, 103, NULL, 'INDECK', '2019-09-03 16:14:54.037', '2019-09-03 16:14:54.037');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3027, 30, 103, NULL, 'INDECK', '2019-09-03 16:14:54.041', '2019-09-03 16:14:54.041');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3028, 45, 103, NULL, 'INDECK', '2019-09-03 16:14:54.044', '2019-09-03 16:14:54.044');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3029, 51, 103, NULL, 'INDECK', '2019-09-03 16:14:54.048', '2019-09-03 16:14:54.048');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3030, 73, 103, NULL, 'INDECK', '2019-09-03 16:14:54.051', '2019-09-03 16:14:54.051');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3031, 60, 103, NULL, 'INDECK', '2019-09-03 16:14:54.055', '2019-09-03 16:14:54.055');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3032, 64, 103, NULL, 'INDECK', '2019-09-03 16:14:54.058', '2019-09-03 16:14:54.058');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3033, 57, 103, NULL, 'INDECK', '2019-09-03 16:14:54.061', '2019-09-03 16:14:54.061');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3034, 29, 103, NULL, 'INDECK', '2019-09-03 16:14:54.064', '2019-09-03 16:14:54.064');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3035, 31, 103, NULL, 'INDECK', '2019-09-03 16:14:54.068', '2019-09-03 16:14:54.068');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3036, 59, 103, NULL, 'INDECK', '2019-09-03 16:14:54.071', '2019-09-03 16:14:54.071');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3037, 27, 103, NULL, 'INDECK', '2019-09-03 16:14:54.075', '2019-09-03 16:14:54.075');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3038, 54, 103, NULL, 'INDECK', '2019-09-03 16:14:54.078', '2019-09-03 16:14:54.078');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3039, 53, 103, NULL, 'INDECK', '2019-09-03 16:14:54.081', '2019-09-03 16:14:54.081');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3040, 46, 103, NULL, 'INDECK', '2019-09-03 16:14:54.084', '2019-09-03 16:14:54.084');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3041, 75, 103, NULL, 'INDECK', '2019-09-03 16:14:54.087', '2019-09-03 16:14:54.087');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3042, 66, 103, NULL, 'INDECK', '2019-09-03 16:14:54.09', '2019-09-03 16:14:54.09');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3043, 63, 103, NULL, 'INDECK', '2019-09-03 16:14:54.093', '2019-09-03 16:14:54.093');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3044, 37, 103, NULL, 'INDECK', '2019-09-03 16:14:54.097', '2019-09-03 16:14:54.097');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3045, 47, 103, NULL, 'INDECK', '2019-09-03 16:14:54.1', '2019-09-03 16:14:54.1');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3046, 55, 103, NULL, 'INDECK', '2019-09-03 16:14:54.103', '2019-09-03 16:14:54.103');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3047, 35, 103, NULL, 'INDECK', '2019-09-03 16:14:54.107', '2019-09-03 16:14:54.107');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3048, 42, 103, NULL, 'INDECK', '2019-09-03 16:14:54.11', '2019-09-03 16:14:54.11');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3049, 76, 103, NULL, 'INDECK', '2019-09-03 16:14:54.114', '2019-09-03 16:14:54.114');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3050, 70, 103, NULL, 'INDECK', '2019-09-03 16:14:54.117', '2019-09-03 16:14:54.117');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3051, 49, 103, NULL, 'INDECK', '2019-09-03 16:14:54.121', '2019-09-03 16:14:54.121');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3052, 28, 103, NULL, 'INDECK', '2019-09-03 16:14:54.124', '2019-09-03 16:14:54.124');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3053, 69, 103, NULL, 'INDECK', '2019-09-03 16:14:54.128', '2019-09-03 16:14:54.128');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3054, 36, 103, NULL, 'INDECK', '2019-09-03 16:14:54.131', '2019-09-03 16:14:54.131');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3055, 39, 103, NULL, 'INDECK', '2019-09-03 16:14:54.135', '2019-09-03 16:14:54.135');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3056, 44, 103, NULL, 'INDECK', '2019-09-03 16:14:54.139', '2019-09-03 16:14:54.139');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3057, 62, 103, NULL, 'INDECK', '2019-09-03 16:14:54.142', '2019-09-03 16:14:54.142');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3058, 71, 103, NULL, 'INDECK', '2019-09-03 16:14:54.146', '2019-09-03 16:14:54.146');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3059, 34, 103, NULL, 'INDECK', '2019-09-03 16:14:54.149', '2019-09-03 16:14:54.149');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3060, 65, 103, NULL, 'INDECK', '2019-09-03 16:14:54.153', '2019-09-03 16:14:54.153');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3061, 58, 103, NULL, 'INDECK', '2019-09-03 16:14:54.157', '2019-09-03 16:14:54.157');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3062, 52, 103, NULL, 'INDECK', '2019-09-03 16:14:54.16', '2019-09-03 16:14:54.16');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3063, 43, 103, NULL, 'INDECK', '2019-09-03 16:14:54.164', '2019-09-03 16:14:54.164');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3064, 74, 103, NULL, 'INDECK', '2019-09-03 16:14:54.168', '2019-09-03 16:14:54.168');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3065, 48, 103, NULL, 'INDECK', '2019-09-03 16:14:54.172', '2019-09-03 16:14:54.172');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3066, 50, 103, NULL, 'INDECK', '2019-09-03 16:14:54.177', '2019-09-03 16:14:54.177');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3067, 72, 103, NULL, 'INDECK', '2019-09-03 16:14:54.181', '2019-09-03 16:14:54.181');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3068, 56, 103, NULL, 'INDECK', '2019-09-03 16:14:54.185', '2019-09-03 16:14:54.185');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3069, 32, 103, NULL, 'INDECK', '2019-09-03 16:14:54.189', '2019-09-03 16:14:54.189');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3070, 68, 104, NULL, 'INDECK', '2019-09-03 16:16:17.986', '2019-09-03 16:16:17.986');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3071, 33, 104, NULL, 'INDECK', '2019-09-03 16:16:18.004', '2019-09-03 16:16:18.004');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3072, 40, 104, NULL, 'INDECK', '2019-09-03 16:16:18.015', '2019-09-03 16:16:18.015');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3073, 67, 104, NULL, 'INDECK', '2019-09-03 16:16:18.036', '2019-09-03 16:16:18.036');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3074, 38, 104, NULL, 'INDECK', '2019-09-03 16:16:18.142', '2019-09-03 16:16:18.142');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3075, 78, 104, NULL, 'INDECK', '2019-09-03 16:16:18.187', '2019-09-03 16:16:18.187');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3076, 61, 104, NULL, 'INDECK', '2019-09-03 16:16:18.297', '2019-09-03 16:16:18.297');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3077, 41, 104, NULL, 'INDECK', '2019-09-03 16:16:18.336', '2019-09-03 16:16:18.336');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3078, 77, 104, NULL, 'INDECK', '2019-09-03 16:16:18.34', '2019-09-03 16:16:18.34');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3079, 30, 104, NULL, 'INDECK', '2019-09-03 16:16:18.344', '2019-09-03 16:16:18.344');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3080, 45, 104, NULL, 'INDECK', '2019-09-03 16:16:18.347', '2019-09-03 16:16:18.347');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3081, 51, 104, NULL, 'INDECK', '2019-09-03 16:16:18.35', '2019-09-03 16:16:18.35');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3082, 73, 104, NULL, 'INDECK', '2019-09-03 16:16:18.353', '2019-09-03 16:16:18.353');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3083, 60, 104, NULL, 'INDECK', '2019-09-03 16:16:18.356', '2019-09-03 16:16:18.356');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3084, 64, 104, NULL, 'INDECK', '2019-09-03 16:16:18.359', '2019-09-03 16:16:18.359');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3085, 57, 104, NULL, 'INDECK', '2019-09-03 16:16:18.362', '2019-09-03 16:16:18.362');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3086, 29, 104, NULL, 'INDECK', '2019-09-03 16:16:18.367', '2019-09-03 16:16:18.367');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3087, 31, 104, NULL, 'INDECK', '2019-09-03 16:16:18.37', '2019-09-03 16:16:18.37');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3088, 59, 104, NULL, 'INDECK', '2019-09-03 16:16:18.372', '2019-09-03 16:16:18.372');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3089, 27, 104, NULL, 'INDECK', '2019-09-03 16:16:18.375', '2019-09-03 16:16:18.375');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3090, 54, 104, NULL, 'INDECK', '2019-09-03 16:16:18.378', '2019-09-03 16:16:18.378');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3091, 53, 104, NULL, 'INDECK', '2019-09-03 16:16:18.381', '2019-09-03 16:16:18.381');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3092, 46, 104, NULL, 'INDECK', '2019-09-03 16:16:18.384', '2019-09-03 16:16:18.384');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3093, 75, 104, NULL, 'INDECK', '2019-09-03 16:16:18.389', '2019-09-03 16:16:18.389');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3094, 66, 104, NULL, 'INDECK', '2019-09-03 16:16:18.393', '2019-09-03 16:16:18.393');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3095, 63, 104, NULL, 'INDECK', '2019-09-03 16:16:18.396', '2019-09-03 16:16:18.396');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3096, 37, 104, NULL, 'INDECK', '2019-09-03 16:16:18.401', '2019-09-03 16:16:18.401');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3097, 47, 104, NULL, 'INDECK', '2019-09-03 16:16:18.405', '2019-09-03 16:16:18.405');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3098, 55, 104, NULL, 'INDECK', '2019-09-03 16:16:18.408', '2019-09-03 16:16:18.408');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3099, 35, 104, NULL, 'INDECK', '2019-09-03 16:16:18.411', '2019-09-03 16:16:18.411');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3100, 42, 104, NULL, 'INDECK', '2019-09-03 16:16:18.414', '2019-09-03 16:16:18.414');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3101, 76, 104, NULL, 'INDECK', '2019-09-03 16:16:18.418', '2019-09-03 16:16:18.418');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3102, 70, 104, NULL, 'INDECK', '2019-09-03 16:16:18.422', '2019-09-03 16:16:18.422');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3103, 49, 104, NULL, 'INDECK', '2019-09-03 16:16:18.425', '2019-09-03 16:16:18.425');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3104, 28, 104, NULL, 'INDECK', '2019-09-03 16:16:18.428', '2019-09-03 16:16:18.428');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3105, 69, 104, NULL, 'INDECK', '2019-09-03 16:16:18.432', '2019-09-03 16:16:18.432');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3106, 36, 104, NULL, 'INDECK', '2019-09-03 16:16:18.436', '2019-09-03 16:16:18.436');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3107, 39, 104, NULL, 'INDECK', '2019-09-03 16:16:18.44', '2019-09-03 16:16:18.44');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3108, 44, 104, NULL, 'INDECK', '2019-09-03 16:16:18.444', '2019-09-03 16:16:18.444');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3109, 62, 104, NULL, 'INDECK', '2019-09-03 16:16:18.447', '2019-09-03 16:16:18.447');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3110, 71, 104, NULL, 'INDECK', '2019-09-03 16:16:18.452', '2019-09-03 16:16:18.452');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3111, 34, 104, NULL, 'INDECK', '2019-09-03 16:16:18.456', '2019-09-03 16:16:18.456');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3112, 65, 104, NULL, 'INDECK', '2019-09-03 16:16:18.46', '2019-09-03 16:16:18.46');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3113, 58, 104, NULL, 'INDECK', '2019-09-03 16:16:18.464', '2019-09-03 16:16:18.464');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3114, 52, 104, NULL, 'INDECK', '2019-09-03 16:16:18.468', '2019-09-03 16:16:18.468');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3115, 43, 104, NULL, 'INDECK', '2019-09-03 16:16:18.472', '2019-09-03 16:16:18.472');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3116, 74, 104, NULL, 'INDECK', '2019-09-03 16:16:18.475', '2019-09-03 16:16:18.475');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3117, 48, 104, NULL, 'INDECK', '2019-09-03 16:16:18.478', '2019-09-03 16:16:18.478');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3118, 50, 104, NULL, 'INDECK', '2019-09-03 16:16:18.481', '2019-09-03 16:16:18.481');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3119, 72, 104, NULL, 'INDECK', '2019-09-03 16:16:18.485', '2019-09-03 16:16:18.485');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3120, 56, 104, NULL, 'INDECK', '2019-09-03 16:16:18.488', '2019-09-03 16:16:18.488');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3121, 32, 104, NULL, 'INDECK', '2019-09-03 16:16:18.491', '2019-09-03 16:16:18.491');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3122, 68, 107, NULL, 'INDECK', '2019-09-03 17:06:34.868', '2019-09-03 17:06:34.868');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3123, 33, 107, NULL, 'INDECK', '2019-09-03 17:06:34.884', '2019-09-03 17:06:34.884');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3124, 40, 107, NULL, 'INDECK', '2019-09-03 17:06:34.896', '2019-09-03 17:06:34.896');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3125, 67, 107, NULL, 'INDECK', '2019-09-03 17:06:34.903', '2019-09-03 17:06:34.903');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3126, 38, 107, NULL, 'INDECK', '2019-09-03 17:06:34.911', '2019-09-03 17:06:34.911');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3127, 78, 107, NULL, 'INDECK', '2019-09-03 17:06:34.916', '2019-09-03 17:06:34.916');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3128, 61, 107, NULL, 'INDECK', '2019-09-03 17:06:34.924', '2019-09-03 17:06:34.924');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3129, 41, 107, NULL, 'INDECK', '2019-09-03 17:06:34.93', '2019-09-03 17:06:34.93');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3130, 77, 107, NULL, 'INDECK', '2019-09-03 17:06:34.937', '2019-09-03 17:06:34.937');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3131, 30, 107, NULL, 'INDECK', '2019-09-03 17:06:34.943', '2019-09-03 17:06:34.943');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3132, 45, 107, NULL, 'INDECK', '2019-09-03 17:06:34.951', '2019-09-03 17:06:34.951');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3133, 51, 107, NULL, 'INDECK', '2019-09-03 17:06:34.957', '2019-09-03 17:06:34.957');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3134, 73, 107, NULL, 'INDECK', '2019-09-03 17:06:34.965', '2019-09-03 17:06:34.965');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3135, 60, 107, NULL, 'INDECK', '2019-09-03 17:06:34.974', '2019-09-03 17:06:34.974');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3136, 64, 107, NULL, 'INDECK', '2019-09-03 17:06:34.982', '2019-09-03 17:06:34.982');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3137, 57, 107, NULL, 'INDECK', '2019-09-03 17:06:34.991', '2019-09-03 17:06:34.991');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3138, 29, 107, NULL, 'INDECK', '2019-09-03 17:06:34.999', '2019-09-03 17:06:34.999');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3139, 31, 107, NULL, 'INDECK', '2019-09-03 17:06:35.007', '2019-09-03 17:06:35.007');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3140, 59, 107, NULL, 'INDECK', '2019-09-03 17:06:35.014', '2019-09-03 17:06:35.014');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3141, 27, 107, NULL, 'INDECK', '2019-09-03 17:06:35.021', '2019-09-03 17:06:35.021');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3142, 54, 107, NULL, 'INDECK', '2019-09-03 17:06:35.027', '2019-09-03 17:06:35.027');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3143, 53, 107, NULL, 'INDECK', '2019-09-03 17:06:35.034', '2019-09-03 17:06:35.034');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3144, 46, 107, NULL, 'INDECK', '2019-09-03 17:06:35.041', '2019-09-03 17:06:35.041');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3145, 75, 107, NULL, 'INDECK', '2019-09-03 17:06:35.049', '2019-09-03 17:06:35.049');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3146, 66, 107, NULL, 'INDECK', '2019-09-03 17:06:35.055', '2019-09-03 17:06:35.055');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3147, 63, 107, NULL, 'INDECK', '2019-09-03 17:06:35.062', '2019-09-03 17:06:35.062');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3148, 37, 107, NULL, 'INDECK', '2019-09-03 17:06:35.068', '2019-09-03 17:06:35.068');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3149, 47, 107, NULL, 'INDECK', '2019-09-03 17:06:35.074', '2019-09-03 17:06:35.074');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3150, 55, 107, NULL, 'INDECK', '2019-09-03 17:06:35.08', '2019-09-03 17:06:35.08');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3151, 35, 107, NULL, 'INDECK', '2019-09-03 17:06:35.086', '2019-09-03 17:06:35.086');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3152, 42, 107, NULL, 'INDECK', '2019-09-03 17:06:35.091', '2019-09-03 17:06:35.091');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3153, 76, 107, NULL, 'INDECK', '2019-09-03 17:06:35.097', '2019-09-03 17:06:35.097');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3154, 70, 107, NULL, 'INDECK', '2019-09-03 17:06:35.103', '2019-09-03 17:06:35.103');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3155, 49, 107, NULL, 'INDECK', '2019-09-03 17:06:35.109', '2019-09-03 17:06:35.109');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3156, 28, 107, NULL, 'INDECK', '2019-09-03 17:06:35.114', '2019-09-03 17:06:35.114');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3157, 69, 107, NULL, 'INDECK', '2019-09-03 17:06:35.12', '2019-09-03 17:06:35.12');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3158, 36, 107, NULL, 'INDECK', '2019-09-03 17:06:35.125', '2019-09-03 17:06:35.125');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3159, 39, 107, NULL, 'INDECK', '2019-09-03 17:06:35.131', '2019-09-03 17:06:35.131');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3160, 44, 107, NULL, 'INDECK', '2019-09-03 17:06:35.136', '2019-09-03 17:06:35.136');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3161, 62, 107, NULL, 'INDECK', '2019-09-03 17:06:35.141', '2019-09-03 17:06:35.141');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3162, 71, 107, NULL, 'INDECK', '2019-09-03 17:06:35.145', '2019-09-03 17:06:35.145');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3163, 34, 107, NULL, 'INDECK', '2019-09-03 17:06:35.151', '2019-09-03 17:06:35.151');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3164, 65, 107, NULL, 'INDECK', '2019-09-03 17:06:35.158', '2019-09-03 17:06:35.158');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3165, 58, 107, NULL, 'INDECK', '2019-09-03 17:06:35.164', '2019-09-03 17:06:35.164');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3166, 52, 107, NULL, 'INDECK', '2019-09-03 17:06:35.17', '2019-09-03 17:06:35.17');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3167, 43, 107, NULL, 'INDECK', '2019-09-03 17:06:35.176', '2019-09-03 17:06:35.176');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3168, 74, 107, NULL, 'INDECK', '2019-09-03 17:06:35.182', '2019-09-03 17:06:35.182');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3169, 48, 107, NULL, 'INDECK', '2019-09-03 17:06:35.188', '2019-09-03 17:06:35.188');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3170, 50, 107, NULL, 'INDECK', '2019-09-03 17:06:35.194', '2019-09-03 17:06:35.194');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3171, 72, 107, NULL, 'INDECK', '2019-09-03 17:06:35.199', '2019-09-03 17:06:35.199');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3172, 56, 107, NULL, 'INDECK', '2019-09-03 17:06:35.206', '2019-09-03 17:06:35.206');
INSERT INTO public.card_in_game (id, card_id, game_id, player_id, card_status, created, updated) VALUES (3173, 32, 107, NULL, 'INDECK', '2019-09-03 17:06:35.212', '2019-09-03 17:06:35.212');


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

INSERT INTO public.game (id, state, bank, created, updated, active_player_id, timestamp_end_step) VALUES (105, 'END', 0, '2019-09-03 17:00:13.112', '2019-09-03 17:00:13.112', 0, 0);
INSERT INTO public.game (id, state, bank, created, updated, active_player_id, timestamp_end_step) VALUES (106, 'END', 0, '2019-09-03 17:01:10.327', '2019-09-03 17:06:12.895', 0, 0);
INSERT INTO public.game (id, state, bank, created, updated, active_player_id, timestamp_end_step) VALUES (99, 'END', 0, '2019-09-03 15:30:49.613', '2019-09-03 17:06:22.742', 207, 1567513881150);
INSERT INTO public.game (id, state, bank, created, updated, active_player_id, timestamp_end_step) VALUES (97, 'END', 0, '2019-09-03 15:22:53.201', '2019-09-03 15:23:05.864', 0, 0);
INSERT INTO public.game (id, state, bank, created, updated, active_player_id, timestamp_end_step) VALUES (98, 'END', 0, '2019-09-03 15:24:26.528', '2019-09-03 15:25:12.382', 0, 0);
INSERT INTO public.game (id, state, bank, created, updated, active_player_id, timestamp_end_step) VALUES (95, 'ACTIVE2', 0, '2019-09-03 14:59:34.985', '2019-09-03 14:59:50.032', 206, 1567512003627);
INSERT INTO public.game (id, state, bank, created, updated, active_player_id, timestamp_end_step) VALUES (101, 'ACTIVE2', 0, '2019-09-03 15:42:47.276', '2019-09-03 15:42:57.088', 211, 1567514592087);
INSERT INTO public.game (id, state, bank, created, updated, active_player_id, timestamp_end_step) VALUES (100, 'ACTIVE2', 0, '2019-09-03 15:35:20.166', '2019-09-03 15:35:33.827', 210, 1567514148234);
INSERT INTO public.game (id, state, bank, created, updated, active_player_id, timestamp_end_step) VALUES (96, 'ACTIVE2', 20, '2019-09-03 15:02:55.776', '2019-09-03 16:07:27.2', 216, 1567516061880);
INSERT INTO public.game (id, state, bank, created, updated, active_player_id, timestamp_end_step) VALUES (103, 'ACTIVE2', 20, '2019-09-03 16:14:44.239', '2019-09-03 16:14:54.934', 217, 1567516509219);
INSERT INTO public.game (id, state, bank, created, updated, active_player_id, timestamp_end_step) VALUES (102, 'ACTIVE2', 0, '2019-09-03 15:51:10.534', '2019-09-03 15:51:26.72', 214, 1567515101329);
INSERT INTO public.game (id, state, bank, created, updated, active_player_id, timestamp_end_step) VALUES (104, 'ACTIVE2', 20, '2019-09-03 16:16:07.348', '2019-09-03 16:16:18.842', 220, 1567516593516);
INSERT INTO public.game (id, state, bank, created, updated, active_player_id, timestamp_end_step) VALUES (107, 'ACTIVE2', 20, '2019-09-03 17:06:25.463', '2019-09-03 17:06:35.367', 0, 0);


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

INSERT INTO public.player (id, game_id, user_account_id, "position", in_game, state, stack, created, updated, card1, card2) VALUES (224, 107, 1, 0, true, 'INACTIVE', 980, '2019-09-03 17:06:33.586', '2019-09-03 17:06:43.471', NULL, NULL);
INSERT INTO public.player (id, game_id, user_account_id, "position", in_game, state, stack, created, updated, card1, card2) VALUES (223, 107, 2, 2, true, 'INACTIVE', 980, '2019-09-03 17:06:26.53', '2019-09-03 17:06:43.826', NULL, NULL);
INSERT INTO public.player (id, game_id, user_account_id, "position", in_game, state, stack, created, updated, card1, card2) VALUES (210, 100, 1, 1, false, 'INACTIVE', 990, '2019-09-03 15:35:30.881', '2019-09-03 17:06:18.868', '/resources/img/cards/2OfHearts.png', '/resources/img/cards/7OfHearts.png');
INSERT INTO public.player (id, game_id, user_account_id, "position", in_game, state, stack, created, updated, card1, card2) VALUES (205, 95, 1, 2, false, 'INACTIVE', 1000, '2019-09-03 14:59:36.899', '2019-09-03 17:06:18.872', '/resources/img/cards/3OfClubs.png', '/resources/img/cards/2OfHearts.png');
INSERT INTO public.player (id, game_id, user_account_id, "position", in_game, state, stack, created, updated, card1, card2) VALUES (206, 95, 2, 1, false, 'INACTIVE', 1000, '2019-09-03 14:59:46.937', '2019-09-03 17:06:18.877', '/resources/img/cards/5OfClubs.png', '/resources/img/cards/3OfSpades.png');
INSERT INTO public.player (id, game_id, user_account_id, "position", in_game, state, stack, created, updated, card1, card2) VALUES (220, 104, 1, 0, false, 'INACTIVE', 990, '2019-09-03 16:16:16.484', '2019-09-03 17:06:18.882', '/resources/img/cards/6OfClubs.png', '/resources/img/cards/6OfSpades.png');
INSERT INTO public.player (id, game_id, user_account_id, "position", in_game, state, stack, created, updated, card1, card2) VALUES (207, 99, 1, 3, false, 'INACTIVE', 1000, '2019-09-03 15:30:51.848', '2019-09-03 17:06:18.886', '/resources/img/cards/5OfHearts.png', '/resources/img/cards/3OfSpades.png');
INSERT INTO public.player (id, game_id, user_account_id, "position", in_game, state, stack, created, updated, card1, card2) VALUES (215, 96, 2, 2, false, 'INACTIVE', 990, '2019-09-03 16:07:16.868', '2019-09-03 17:06:18.919', '/resources/img/cards/2OfSpades.png', '/resources/img/cards/9OfClubs.png');
INSERT INTO public.player (id, game_id, user_account_id, "position", in_game, state, stack, created, updated, card1, card2) VALUES (221, 105, 2, 2, false, 'INACTIVE', 980, '2019-09-03 17:00:14.525', '2019-09-03 17:06:18.941', NULL, NULL);
INSERT INTO public.player (id, game_id, user_account_id, "position", in_game, state, stack, created, updated, card1, card2) VALUES (211, 101, 2, 1, false, 'INACTIVE', 970, '2019-09-03 15:42:49.09', '2019-09-03 17:06:18.944', '/resources/img/cards/aceOfSpades.png', '/resources/img/cards/9OfDiamonds.png');
INSERT INTO public.player (id, game_id, user_account_id, "position", in_game, state, stack, created, updated, card1, card2) VALUES (209, 100, 2, 2, false, 'INACTIVE', 980, '2019-09-03 15:35:22.466', '2019-09-03 17:06:18.947', '/resources/img/cards/10OfHearts.png', '/resources/img/cards/6OfDiamonds.png');
INSERT INTO public.player (id, game_id, user_account_id, "position", in_game, state, stack, created, updated, card1, card2) VALUES (218, 103, 2, 2, false, 'INACTIVE', 1000, '2019-09-03 16:14:51.177', '2019-09-03 17:06:18.949', '/resources/img/cards/10OfHearts.png', '/resources/img/cards/jackOfSpades.png');
INSERT INTO public.player (id, game_id, user_account_id, "position", in_game, state, stack, created, updated, card1, card2) VALUES (208, 99, 2, 5, false, 'INACTIVE', 1000, '2019-09-03 15:31:03.257', '2019-09-03 17:06:18.952', '/resources/img/cards/10OfClubs.png', '/resources/img/cards/queenOfSpades.png');
INSERT INTO public.player (id, game_id, user_account_id, "position", in_game, state, stack, created, updated, card1, card2) VALUES (219, 104, 2, 2, false, 'INACTIVE', 990, '2019-09-03 16:16:09.073', '2019-09-03 17:06:18.954', '/resources/img/cards/queenOfHearts.png', '/resources/img/cards/6OfDiamonds.png');
INSERT INTO public.player (id, game_id, user_account_id, "position", in_game, state, stack, created, updated, card1, card2) VALUES (216, 96, 1, 1, false, 'INACTIVE', 995, '2019-09-03 16:07:24.698', '2019-09-03 17:06:18.956', '/resources/img/cards/jackOfHearts.png', '/resources/img/cards/5OfSpades.png');
INSERT INTO public.player (id, game_id, user_account_id, "position", in_game, state, stack, created, updated, card1, card2) VALUES (217, 103, 1, 1, false, 'INACTIVE', 1000, '2019-09-03 16:14:45.963', '2019-09-03 17:06:18.958', '/resources/img/cards/5OfDiamonds.png', '/resources/img/cards/6OfClubs.png');
INSERT INTO public.player (id, game_id, user_account_id, "position", in_game, state, stack, created, updated, card1, card2) VALUES (212, 101, 1, 2, false, 'INACTIVE', 985, '2019-09-03 15:42:54.019', '2019-09-03 17:06:18.96', '/resources/img/cards/9OfHearts.png', '/resources/img/cards/kingOfSpades.png');
INSERT INTO public.player (id, game_id, user_account_id, "position", in_game, state, stack, created, updated, card1, card2) VALUES (213, 102, 2, 2, false, 'INACTIVE', 1000, '2019-09-03 15:51:14.141', '2019-09-03 17:06:18.963', '/resources/img/cards/8OfHearts.png', '/resources/img/cards/6OfSpades.png');
INSERT INTO public.player (id, game_id, user_account_id, "position", in_game, state, stack, created, updated, card1, card2) VALUES (214, 102, 1, 1, false, 'INACTIVE', 1000, '2019-09-03 15:51:23.16', '2019-09-03 17:06:18.966', '/resources/img/cards/4OfSpades.png', '/resources/img/cards/7OfHearts.png');
INSERT INTO public.player (id, game_id, user_account_id, "position", in_game, state, stack, created, updated, card1, card2) VALUES (222, 106, 2, 2, false, 'INACTIVE', 980, '2019-09-03 17:01:11.765', '2019-09-03 17:06:24.87', NULL, NULL);


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

SELECT pg_catalog.setval('public.action_id_seq', 20, true);


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

SELECT pg_catalog.setval('public.card_in_game_id_seq', 3173, true);


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

SELECT pg_catalog.setval('public.game_id_seq', 107, true);


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

SELECT pg_catalog.setval('public.player_id_seq', 224, true);


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

SELECT pg_catalog.setval('public.transaction_id_seq', 21, true);


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


-- Completed on 2019-09-03 17:09:00

--
-- PostgreSQL database dump complete
--

