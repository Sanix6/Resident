--
-- PostgreSQL database dump
--

-- Dumped from database version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: navis
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO navis;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: navis
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO navis;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: navis
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: navis
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO navis;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: navis
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO navis;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: navis
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: navis
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO navis;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: navis
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO navis;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: navis
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: navis
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO navis;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: navis
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO navis;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: navis
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO navis;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: navis
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: navis
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO navis;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: navis
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: navis
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO navis;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: navis
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO navis;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: navis
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: navis
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO navis;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: navis
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO navis;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: navis
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: navis
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO navis;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: navis
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO navis;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: navis
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: navis
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO navis;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: navis
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO navis;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: navis
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: navis
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO navis;

--
-- Name: main_category; Type: TABLE; Schema: public; Owner: navis
--

CREATE TABLE public.main_category (
    id bigint NOT NULL,
    name character varying(255),
    slug character varying(50),
    is_active boolean NOT NULL
);


ALTER TABLE public.main_category OWNER TO navis;

--
-- Name: main_category_id_seq; Type: SEQUENCE; Schema: public; Owner: navis
--

CREATE SEQUENCE public.main_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_category_id_seq OWNER TO navis;

--
-- Name: main_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: navis
--

ALTER SEQUENCE public.main_category_id_seq OWNED BY public.main_category.id;


--
-- Name: main_resident; Type: TABLE; Schema: public; Owner: navis
--

CREATE TABLE public.main_resident (
    id bigint NOT NULL,
    slug character varying(50),
    image character varying(100) NOT NULL,
    title character varying(255),
    lang character varying(2555),
    data date,
    updated_at timestamp with time zone NOT NULL,
    last_mod timestamp with time zone NOT NULL,
    save_state boolean NOT NULL,
    header_id bigint NOT NULL,
    name_id bigint
);


ALTER TABLE public.main_resident OWNER TO navis;

--
-- Name: main_resident_id_seq; Type: SEQUENCE; Schema: public; Owner: navis
--

CREATE SEQUENCE public.main_resident_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_resident_id_seq OWNER TO navis;

--
-- Name: main_resident_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: navis
--

ALTER SEQUENCE public.main_resident_id_seq OWNED BY public.main_resident.id;


--
-- Name: main_residentdetail; Type: TABLE; Schema: public; Owner: navis
--

CREATE TABLE public.main_residentdetail (
    id bigint NOT NULL,
    description text,
    key_id bigint NOT NULL
);


ALTER TABLE public.main_residentdetail OWNER TO navis;

--
-- Name: main_residentdetail_id_seq; Type: SEQUENCE; Schema: public; Owner: navis
--

CREATE SEQUENCE public.main_residentdetail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_residentdetail_id_seq OWNER TO navis;

--
-- Name: main_residentdetail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: navis
--

ALTER SEQUENCE public.main_residentdetail_id_seq OWNED BY public.main_residentdetail.id;


--
-- Name: main_slider; Type: TABLE; Schema: public; Owner: navis
--

CREATE TABLE public.main_slider (
    id bigint NOT NULL,
    image character varying(100) NOT NULL,
    title character varying(255),
    description character varying(255)
);


ALTER TABLE public.main_slider OWNER TO navis;

--
-- Name: main_slider_id_seq; Type: SEQUENCE; Schema: public; Owner: navis
--

CREATE SEQUENCE public.main_slider_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_slider_id_seq OWNER TO navis;

--
-- Name: main_slider_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: navis
--

ALTER SEQUENCE public.main_slider_id_seq OWNED BY public.main_slider.id;


--
-- Name: main_subheader; Type: TABLE; Schema: public; Owner: navis
--

CREATE TABLE public.main_subheader (
    id bigint NOT NULL,
    slug character varying(50),
    header_id bigint NOT NULL,
    title character varying(255)
);


ALTER TABLE public.main_subheader OWNER TO navis;

--
-- Name: main_subheader_id_seq; Type: SEQUENCE; Schema: public; Owner: navis
--

ALTER TABLE public.main_subheader ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.main_subheader_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users_user; Type: TABLE; Schema: public; Owner: navis
--

CREATE TABLE public.users_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    phone character varying(30) NOT NULL,
    user_type character varying(100) NOT NULL,
    code integer,
    activated boolean NOT NULL
);


ALTER TABLE public.users_user OWNER TO navis;

--
-- Name: users_user_groups; Type: TABLE; Schema: public; Owner: navis
--

CREATE TABLE public.users_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_user_groups OWNER TO navis;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: navis
--

CREATE SEQUENCE public.users_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_groups_id_seq OWNER TO navis;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: navis
--

ALTER SEQUENCE public.users_user_groups_id_seq OWNED BY public.users_user_groups.id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: navis
--

CREATE SEQUENCE public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO navis;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: navis
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users_user.id;


--
-- Name: users_user_user_permissions; Type: TABLE; Schema: public; Owner: navis
--

CREATE TABLE public.users_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_user_user_permissions OWNER TO navis;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: navis
--

CREATE SEQUENCE public.users_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_user_permissions_id_seq OWNER TO navis;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: navis
--

ALTER SEQUENCE public.users_user_user_permissions_id_seq OWNED BY public.users_user_user_permissions.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: main_category id; Type: DEFAULT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.main_category ALTER COLUMN id SET DEFAULT nextval('public.main_category_id_seq'::regclass);


--
-- Name: main_resident id; Type: DEFAULT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.main_resident ALTER COLUMN id SET DEFAULT nextval('public.main_resident_id_seq'::regclass);


--
-- Name: main_residentdetail id; Type: DEFAULT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.main_residentdetail ALTER COLUMN id SET DEFAULT nextval('public.main_residentdetail_id_seq'::regclass);


--
-- Name: main_slider id; Type: DEFAULT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.main_slider ALTER COLUMN id SET DEFAULT nextval('public.main_slider_id_seq'::regclass);


--
-- Name: users_user id; Type: DEFAULT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.users_user ALTER COLUMN id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: users_user_groups id; Type: DEFAULT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.users_user_groups ALTER COLUMN id SET DEFAULT nextval('public.users_user_groups_id_seq'::regclass);


--
-- Name: users_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.users_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_user_user_permissions_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: navis
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: navis
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: navis
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add user	7	add_user
26	Can change user	7	change_user
27	Can delete user	7	delete_user
28	Can view user	7	view_user
29	Can add 	8	add_category
30	Can change 	8	change_category
31	Can delete 	8	delete_category
32	Can view 	8	view_category
33	Can add 	9	add_resident
34	Can change 	9	change_resident
35	Can delete 	9	delete_resident
36	Can view 	9	view_resident
37	Can add 	10	add_slider
38	Can change 	10	change_slider
39	Can delete 	10	delete_slider
40	Can view 	10	view_slider
41	Can add sub category	11	add_subcategory
42	Can change sub category	11	change_subcategory
43	Can delete sub category	11	delete_subcategory
44	Can view sub category	11	view_subcategory
45	Can add Дополнительно	12	add_residentdetail
46	Can change Дополнительно	12	change_residentdetail
47	Can delete Дополнительно	12	delete_residentdetail
48	Can view Дополнительно	12	view_residentdetail
49	Can add 	13	add_header
50	Can change 	13	change_header
51	Can delete 	13	delete_header
52	Can view 	13	view_header
53	Can add Подшапка	14	add_subheader
54	Can change Подшапка	14	change_subheader
55	Can delete Подшапка	14	delete_subheader
56	Can view Подшапка	14	view_subheader
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: navis
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$600000$9AvU2ZZhxCe3jtiNBtAxyf$sNM6qSySZREShh2FjLjNlJpl+jAcR+NTeQm6sATMu+s=	2024-03-02 13:06:54.054903+00	t	admin				t	t	2024-03-01 00:01:10.736159+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: navis
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: navis
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: navis
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2024-03-01 08:55:08.873987+00	1	Недвижимость	1	[{"added": {}}, {"added": {"name": "sub category", "object": "\\u041e\\u0442\\u0435\\u043b\\u044c"}}, {"added": {"name": "sub category", "object": "\\u0421\\u043f\\u0430-\\u0441\\u0430\\u043b\\u043e\\u043d\\u044b"}}, {"added": {"name": "sub category", "object": "\\u0420\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d\\u044b"}}]	8	1
2	2024-03-01 08:55:38.756823+00	2	Раскошный отдых	1	[{"added": {}}, {"added": {"name": "sub category", "object": "\\u041e\\u0442\\u0435\\u043b\\u044c"}}, {"added": {"name": "sub category", "object": "\\u0421\\u043f\\u0430-\\u0441\\u0430\\u043b\\u043e\\u043d\\u044b"}}, {"added": {"name": "sub category", "object": "\\u0420\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d\\u044b"}}]	8	1
3	2024-03-01 08:56:36.230249+00	3	Раскошный отдых	1	[{"added": {}}, {"added": {"name": "sub category", "object": "\\u041e\\u0442\\u0435\\u043b\\u044c"}}, {"added": {"name": "sub category", "object": "\\u0421\\u043f\\u0430-\\u0441\\u0430\\u043b\\u043e\\u043d\\u044b"}}, {"added": {"name": "sub category", "object": "\\u0420\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d\\u044b"}}]	8	1
4	2024-03-01 08:57:00.276118+00	3	Популярные	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	8	1
5	2024-03-01 08:59:40.093136+00	4	Интервью	1	[{"added": {}}, {"added": {"name": "sub category", "object": "\\u041e\\u0442\\u0435\\u043b\\u044c"}}, {"added": {"name": "sub category", "object": "\\u0421\\u043f\\u0430-\\u0441\\u0430\\u043b\\u043e\\u043d\\u044b"}}, {"added": {"name": "sub category", "object": "\\u0420\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d\\u044b"}}]	8	1
6	2024-03-01 09:01:21.809025+00	1	Взять квартиру в ипотеку в Бишкеке	1	[{"added": {}}]	9	1
7	2024-03-01 09:02:54.062384+00	1	Взять квартиру в ипотеку в Бишкеке	2	[{"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (1)"}}]	9	1
8	2024-03-01 09:43:19.937207+00	1	Взять квартиру в ипотеку в Бишкеке	2	[]	9	1
9	2024-03-01 09:44:16.236583+00	3	Популярные	2	[]	8	1
10	2024-03-01 09:45:50.88245+00	3	Популярные	2	[{"deleted": {"name": "sub category", "object": "\\u041e\\u0442\\u0435\\u043b\\u044c"}}, {"deleted": {"name": "sub category", "object": "\\u0421\\u043f\\u0430-\\u0441\\u0430\\u043b\\u043e\\u043d\\u044b"}}, {"deleted": {"name": "sub category", "object": "\\u0420\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d\\u044b"}}]	8	1
11	2024-03-01 09:46:13.738252+00	3	Популярные	2	[{"added": {"name": "sub category", "object": "\\u041e\\u0442\\u0435\\u043b\\u044c"}}, {"added": {"name": "sub category", "object": "\\u0421\\u043f\\u0430-\\u0441\\u0430\\u043b\\u043e\\u043d\\u044b"}}, {"added": {"name": "sub category", "object": "\\u0420\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d\\u044b"}}]	8	1
12	2024-03-01 09:46:38.640946+00	4	Интервью	2	[{"deleted": {"name": "sub category", "object": "\\u041e\\u0442\\u0435\\u043b\\u044c"}}, {"deleted": {"name": "sub category", "object": "\\u0421\\u043f\\u0430-\\u0441\\u0430\\u043b\\u043e\\u043d\\u044b"}}, {"deleted": {"name": "sub category", "object": "\\u0420\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d\\u044b"}}]	8	1
13	2024-03-01 09:48:00.082465+00	4	Интервью	2	[{"added": {"name": "sub category", "object": "\\u041e\\u0442\\u0435\\u043b\\u044c"}}, {"added": {"name": "sub category", "object": "\\u0421\\u043f\\u0430-\\u0441\\u0430\\u043b\\u043e\\u043d\\u044b"}}, {"added": {"name": "sub category", "object": "\\u0420\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d\\u044b"}}]	8	1
14	2024-03-01 09:48:13.994212+00	2	Раскошный отдых	2	[{"deleted": {"name": "sub category", "object": "\\u041e\\u0442\\u0435\\u043b\\u044c"}}, {"deleted": {"name": "sub category", "object": "\\u0421\\u043f\\u0430-\\u0441\\u0430\\u043b\\u043e\\u043d\\u044b"}}, {"deleted": {"name": "sub category", "object": "\\u0420\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d\\u044b"}}]	8	1
15	2024-03-01 09:48:34.568087+00	2	Раскошный отдых	2	[{"added": {"name": "sub category", "object": "\\u041e\\u0442\\u0435\\u043b\\u044c"}}, {"added": {"name": "sub category", "object": "\\u0421\\u043f\\u0430-\\u0441\\u0430\\u043b\\u043e\\u043d\\u044b"}}, {"added": {"name": "sub category", "object": "\\u0420\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d\\u044b"}}]	8	1
16	2024-03-01 09:48:51.715296+00	1	Недвижимость	2	[{"deleted": {"name": "sub category", "object": "\\u041e\\u0442\\u0435\\u043b\\u044c"}}, {"deleted": {"name": "sub category", "object": "\\u0421\\u043f\\u0430-\\u0441\\u0430\\u043b\\u043e\\u043d\\u044b"}}, {"deleted": {"name": "sub category", "object": "\\u0420\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d\\u044b"}}]	8	1
17	2024-03-01 09:49:12.844296+00	1	Недвижимость	2	[{"added": {"name": "sub category", "object": "\\u041e\\u0442\\u0435\\u043b\\u044c"}}, {"added": {"name": "sub category", "object": "\\u0421\\u043f\\u0430-\\u0441\\u0430\\u043b\\u043e\\u043d\\u044b"}}, {"added": {"name": "sub category", "object": "\\u0420\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d\\u044b"}}]	8	1
18	2024-03-01 09:55:47.446181+00	5	Продукт	1	[{"added": {}}]	8	1
19	2024-03-01 09:56:11.000447+00	6	Предложение от компании	1	[{"added": {}}, {"added": {"name": "sub category", "object": "\\u041e\\u0442\\u0435\\u043b\\u044c"}}, {"added": {"name": "sub category", "object": "\\u0421\\u043f\\u0430-\\u0441\\u0430\\u043b\\u043e\\u043d\\u044b"}}, {"added": {"name": "sub category", "object": "\\u0420\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d\\u044b"}}]	8	1
20	2024-03-01 09:57:35.367158+00	1	Slider object (1)	1	[{"added": {}}]	10	1
21	2024-03-01 09:57:47.947154+00	2	Slider object (2)	1	[{"added": {}}]	10	1
22	2024-03-01 09:57:58.972072+00	3	Slider object (3)	1	[{"added": {}}]	10	1
23	2024-03-01 10:08:12.138828+00	2	Секреты Дубай, недвижимость за рубежом	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (2)"}}]	9	1
24	2024-03-01 10:12:48.198897+00	3	Взять квартиру в ипотеку в Бишкеке:	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (3)"}}]	9	1
25	2024-03-01 10:13:00.053569+00	2	Секреты Дубай, недвижимость за рубежом	2	[{"changed": {"fields": ["\\u0421\\u043e\\u0445\\u0440\\u0430\\u043d\\u0438\\u0442\\u044c"]}}]	9	1
26	2024-03-01 10:15:23.935108+00	4	Галерея -  оптом и в розницу под одной крышей	1	[{"added": {}}]	9	1
27	2024-03-01 10:16:15.184612+00	5	Москва - жилой дом премиум-класса	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (4)"}}]	9	1
28	2024-03-01 10:18:15.545542+00	4	Галерея -  оптом и в розницу под одной крышей	2	[{"changed": {"fields": ["Name"]}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (5)"}}]	9	1
29	2024-03-01 10:20:38.121704+00	6	UNO City - новый город-курорт в Кыргызстане	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (6)"}}]	9	1
30	2024-03-01 10:22:20.007307+00	7	Место для деловых встреч	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (7)"}}]	9	1
31	2024-03-01 10:23:58.848272+00	8	UNO City - новый город-курорт	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (8)"}}]	9	1
32	2024-03-01 10:27:15.109483+00	9	Москва - жилой дом премиум	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (9)"}}]	9	1
33	2024-03-01 10:31:44.826568+00	10	Sumbule - SPA центр незабываемого	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (10)"}}]	9	1
34	2024-03-01 10:33:49.387572+00	12	Взять квартиру в ипотеку в караколе	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (11)"}}]	9	1
35	2024-03-01 10:43:53.852608+00	13	Галерея - отделочные материалы оптом и в розницу	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (12)"}}]	9	1
36	2024-03-01 10:46:18.51677+00	14	Orion Hotel	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (13)"}}]	9	1
37	2024-03-01 10:48:04.276441+00	16	Москва - лучший жилой дом	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (14)"}}]	9	1
38	2024-03-01 10:48:15.367678+00	17	продукты	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (15)"}}]	9	1
39	2024-03-01 10:50:09.673106+00	19	Место для лучших деловых встреч	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (16)"}}]	9	1
40	2024-03-01 10:51:12.631975+00	20	otel	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (17)"}}]	9	1
41	2024-03-01 10:51:45.32462+00	20	Отель Орион	2	[{"changed": {"fields": ["\\u0421\\u043b\\u0430\\u0433", "\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	9	1
42	2024-03-01 10:52:34.994313+00	22	Лучшее место для деловых встреч	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (18)"}}]	9	1
43	2024-03-01 10:52:50.105917+00	23	продуктыs	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (19)"}}]	9	1
44	2024-03-01 10:53:48.652812+00	19	Место для лучших деловых встреч	2	[{"changed": {"fields": ["\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435"]}}]	9	1
45	2024-03-01 10:54:03.616136+00	16	Москва - лучший жилой дом	2	[{"changed": {"fields": ["\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435"]}}]	9	1
46	2024-03-01 10:56:16.099418+00	24	Анна Шишкина - основатель дизайн Freedom Group	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (20)"}}]	9	1
47	2024-03-01 10:56:58.281963+00	25	Sumbule - SPA центр	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (21)"}}]	9	1
48	2024-03-01 10:57:21.613837+00	27	продуктыss	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (22)"}}]	9	1
49	2024-03-01 10:57:54.72235+00	28	Отель Орион - место для отдыха	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (23)"}}]	9	1
50	2024-03-01 10:59:48.780425+00	29	Владислав - основатель дизайн-студии Freedom Group	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (24)"}}]	9	1
51	2024-03-01 11:00:00.757801+00	30	продуктыы	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (25)"}}]	9	1
52	2024-03-01 11:00:03.172198+00	31	Миссия - За гранью обычного	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (26)"}}]	9	1
53	2024-03-01 11:00:38.513612+00	23	На нашем отеле	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435", "\\u0421\\u043e\\u0445\\u0440\\u0430\\u043d\\u0438\\u0442\\u044c"]}}]	9	1
54	2024-03-01 11:01:32.500665+00	27	В отеле можно найти все	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	9	1
55	2024-03-01 11:01:44.354324+00	30	Отличный сервис	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	9	1
56	2024-03-01 11:01:51.96784+00	32	Отель Орион-место	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (27)"}}]	9	1
57	2024-03-01 11:01:53.407135+00	30	Отличный сервис	2	[{"changed": {"fields": ["\\u0414\\u0430\\u0442\\u0430 \\u0434\\u043e\\u0431\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435"]}}]	9	1
58	2024-03-01 11:02:34.646414+00	33	Palazzo - ресторан премиум-класса	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (28)"}}]	9	1
59	2024-03-01 11:03:47.688075+00	34	Владислав Попов - основатель дизайн-студии Freedom	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (29)"}}]	9	1
60	2024-03-01 11:04:27.458249+00	35	продуктыыы	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (30)"}}]	9	1
61	2024-03-01 11:04:30.477472+00	36	Timeout	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (31)"}}]	9	1
62	2024-03-01 11:05:44.180518+00	39	Владислав - основатель студии Freedom Group	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (32)"}}]	9	1
63	2024-03-01 11:06:36.13028+00	41	Место для деловых встреч для бизнесменов	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (33)"}}]	9	1
64	2024-03-01 11:06:51.98179+00	42	Relacs	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (34)"}}]	9	1
65	2024-03-01 11:06:52.223763+00	35	Спортивные залы	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	9	1
66	2024-03-01 11:07:06.226554+00	36	Хорошие отзывы	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	9	1
67	2024-03-01 11:07:17.149739+00	42	Уютные комнаты	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	9	1
68	2024-03-01 11:08:15.068703+00	43	i love you	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (35)"}}]	9	1
69	2024-03-01 11:09:28.241386+00	44	Hotel	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (36)"}}]	9	1
70	2024-03-01 11:10:16.786059+00	45	how are you	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (37)"}}]	9	1
71	2024-03-01 11:10:24.434429+00	46	Попов - основатель студии Freedom Group	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (38)"}}]	9	1
72	2024-03-01 11:10:47.281108+00	43	Уютная атмасфера	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	9	1
73	2024-03-01 11:11:16.085375+00	44	Красивый вид квартир	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	9	1
74	2024-03-01 11:11:36.105555+00	45	Отличные сервисы для клиентов	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	9	1
75	2024-03-01 11:11:43.866071+00	45	Отличные сервисы для клиентов	2	[{"changed": {"fields": ["\\u0414\\u0430\\u0442\\u0430 \\u0434\\u043e\\u0431\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435"]}}]	9	1
76	2024-03-01 11:11:54.960917+00	47	Kaketime	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (39)"}}]	9	1
77	2024-03-01 11:12:03.656291+00	43	Уютная атмасфера	2	[{"changed": {"fields": ["\\u0414\\u0430\\u0442\\u0430 \\u0434\\u043e\\u0431\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435"]}}]	9	1
78	2024-03-01 11:12:34.92628+00	47	Семейный отдых	2	[{"changed": {"fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	9	1
79	2024-03-01 11:14:05.626767+00	48	Lake	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (40)"}}]	9	1
80	2024-03-01 11:17:08.564597+00	49	Province	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (41)"}}]	9	1
81	2024-03-01 11:17:25.259741+00	50	Resident - первый журнал	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (42)"}}]	9	1
82	2024-03-01 11:20:43.011948+00	51	Отель Орион - не только место для отдыха	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (43)"}}]	9	1
83	2024-03-01 11:23:56.856972+00	54	Palazzo - ресторан премиум-class	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (44)"}}]	9	1
84	2024-03-01 11:27:51.961925+00	56	Миссия - За гранью	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (45)"}}]	9	1
85	2024-03-01 11:30:35.903695+00	57	Sumbule - SPA центр незабываемого веселье	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (46)"}}]	9	1
86	2024-03-01 11:35:06.243374+00	62	Уютные места для клиентов	1	[{"added": {}}, {"added": {"name": "\\u0414\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e", "object": "ResidentDetail object (47)"}}]	9	1
87	2024-03-01 17:40:20.260512+00	1	Header object (1)	1	[{"added": {}}, {"added": {"name": "\\u041f\\u043e\\u0434\\u0448\\u0430\\u043f\\u043a\\u0430", "object": "\\u041e\\u0442\\u0435\\u043b\\u044c"}}, {"added": {"name": "\\u041f\\u043e\\u0434\\u0448\\u0430\\u043f\\u043a\\u0430", "object": "\\u0421\\u043f\\u0430-\\u0441\\u0430\\u043b\\u043e\\u043d\\u044b"}}, {"added": {"name": "\\u041f\\u043e\\u0434\\u0448\\u0430\\u043f\\u043a\\u0430", "object": "\\u0420\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d\\u044b"}}]	13	1
88	2024-03-01 17:47:05.338225+00	1	Header object (1)	2	[{"changed": {"name": "\\u041f\\u043e\\u0434\\u0448\\u0430\\u043f\\u043a\\u0430", "object": "\\u041e\\u0442\\u0435\\u043b\\u044c", "fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}, {"changed": {"name": "\\u041f\\u043e\\u0434\\u0448\\u0430\\u043f\\u043a\\u0430", "object": "\\u0420\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d", "fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}, {"changed": {"name": "\\u041f\\u043e\\u0434\\u0448\\u0430\\u043f\\u043a\\u0430", "object": "\\u0421\\u043f\\u0430-\\u0441\\u0430\\u043b\\u043e\\u043d\\u044b", "fields": ["\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435"]}}]	13	1
89	2024-03-01 18:13:35.767666+00	2	Header object (2)	1	[{"added": {}}, {"added": {"name": "\\u041f\\u043e\\u0434\\u0448\\u0430\\u043f\\u043a\\u0430", "object": "\\u041e\\u0442\\u0435\\u043b\\u044c"}}, {"added": {"name": "\\u041f\\u043e\\u0434\\u0448\\u0430\\u043f\\u043a\\u0430", "object": "\\u0420\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d"}}, {"added": {"name": "\\u041f\\u043e\\u0434\\u0448\\u0430\\u043f\\u043a\\u0430", "object": "\\u0420\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d"}}]	13	1
90	2024-03-02 09:04:14.622223+00	6	Предложение от компании	2	[]	8	1
91	2024-03-02 09:04:22.696914+00	5	Продукт	2	[]	8	1
92	2024-03-02 09:04:27.485682+00	4	Интервью	2	[]	8	1
93	2024-03-02 09:04:31.13112+00	3	Популярные	2	[]	8	1
94	2024-03-02 09:04:39.521922+00	2	Раскошный отдых	2	[]	8	1
95	2024-03-02 09:04:45.358303+00	1	Недвижимость	2	[]	8	1
96	2024-03-02 09:05:25.779974+00	7	Отель	1	[{"added": {}}]	8	1
97	2024-03-02 09:05:36.980897+00	8	Спа-салоны	1	[{"added": {}}]	8	1
98	2024-03-02 09:05:46.260483+00	9	Рестораны	1	[{"added": {}}]	8	1
99	2024-03-02 09:06:21.513246+00	47	Семейный отдых	2	[{"changed": {"fields": ["\\u041a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u044f"]}}]	9	1
100	2024-03-02 10:00:53.395295+00	4	Интервью	2	[{"added": {"name": "\\u041f\\u043e\\u0434\\u0448\\u0430\\u043f\\u043a\\u0430", "object": "\\u041e\\u0442\\u0435\\u043b\\u044c"}}]	8	1
101	2024-03-02 10:01:15.36023+00	7	Отель	3		8	1
102	2024-03-02 10:01:29.303632+00	8	Спа-салоны	3		8	1
103	2024-03-02 10:01:37.564878+00	9	Рестораны	3		8	1
104	2024-03-02 10:01:54.05738+00	5	Продукт	2	[{"added": {"name": "\\u041f\\u043e\\u0434\\u0448\\u0430\\u043f\\u043a\\u0430", "object": "\\u0421\\u043f\\u0430 \\u0441\\u0430\\u043b\\u043e\\u043d\\u044b"}}]	8	1
105	2024-03-02 10:26:39.377153+00	62	Уютные места для клиентов	2	[]	9	1
106	2024-03-02 10:27:48.084016+00	62	Уютные места для клиентов	2	[{"changed": {"fields": ["\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435"]}}]	9	1
107	2024-03-02 11:06:40.658593+00	3	Популярные	2	[{"added": {"name": "", "object": "\\u041e\\u0442\\u0435\\u043b\\u044c"}}, {"added": {"name": "", "object": "\\u0420\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d"}}, {"added": {"name": "", "object": "\\u0421\\u043f\\u0430-\\u0441\\u0430\\u043b\\u043e\\u043d\\u044b"}}]	8	1
108	2024-03-02 11:06:57.622267+00	5	Продукт	2	[{"deleted": {"name": "", "object": "None"}}]	8	1
109	2024-03-02 11:07:16.109814+00	6	Предложение от компании	2	[{"added": {"name": "", "object": "\\u041e\\u0442\\u0435\\u043b\\u044c"}}, {"added": {"name": "", "object": "\\u0420\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d"}}, {"added": {"name": "", "object": "\\u0421\\u043f\\u0430-\\u0441\\u0430\\u043b\\u043e\\u043d\\u044b"}}]	8	1
110	2024-03-02 12:26:30.809462+00	6	Предложение от компании	2	[]	8	1
111	2024-03-02 12:27:05.334922+00	6	Предложение от компании	2	[]	8	1
112	2024-03-02 16:49:03.833368+00	4	Интервью	2	[{"changed": {"fields": ["\\u0410\\u043a\\u0442\\u0438\\u0432\\u043d\\u043e"]}}]	8	1
113	2024-03-02 16:49:09.594024+00	5	Продукт	2	[{"changed": {"fields": ["\\u0410\\u043a\\u0442\\u0438\\u0432\\u043d\\u043e"]}}]	8	1
114	2024-03-02 16:49:34.657354+00	10	Контакт	1	[{"added": {}}]	8	1
115	2024-03-02 16:49:41.374907+00	10	Контакт	2	[{"changed": {"fields": ["\\u0410\\u043a\\u0442\\u0438\\u0432\\u043d\\u043e"]}}]	8	1
116	2024-03-02 16:52:07.029729+00	6	Предложение от компании	2	[{"changed": {"fields": ["\\u0410\\u043a\\u0442\\u0438\\u0432\\u043d\\u043e"]}}]	8	1
117	2024-03-03 07:29:46.835844+00	1	Недвижимость	2	[{"deleted": {"name": "", "object": "\\u041e\\u0442\\u0435\\u043b\\u044c"}}, {"deleted": {"name": "", "object": "\\u0420\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d"}}, {"deleted": {"name": "", "object": "\\u0421\\u043f\\u0430-\\u0441\\u0430\\u043b\\u043e\\u043d\\u044b"}}]	8	1
118	2024-03-03 07:30:05.629963+00	1	Недвижимость	2	[{"added": {"name": "", "object": "\\u041e\\u0442\\u0435\\u043b\\u044c"}}, {"added": {"name": "", "object": "\\u0420\\u0435\\u0441\\u0442\\u043e\\u0440\\u0430\\u043d"}}, {"added": {"name": "", "object": "\\u0421\\u043f\\u0430-\\u0441\\u0430\\u043b\\u043e\\u043d\\u044b"}}]	8	1
119	2024-03-03 07:38:14.933055+00	11	Нурбек	1	[{"added": {}}, {"added": {"name": "", "object": "\\u041e\\u0442\\u0435\\u043b\\u044c"}}]	8	1
120	2024-03-03 07:40:16.683672+00	11	Нурбек	3		8	1
121	2024-03-03 07:40:28.762937+00	12	test	1	[{"added": {}}, {"added": {"name": "", "object": "\\u0421\\u043f\\u0430 \\u0441\\u0430\\u043b\\u043e\\u043d\\u044b"}}]	8	1
122	2024-03-03 07:40:52.393223+00	12	test	3		8	1
123	2024-03-03 07:47:49.47609+00	13	test	1	[{"added": {}}, {"added": {"name": "", "object": "\\u0421\\u043f\\u0430 \\u0441\\u0430\\u043b\\u043e\\u043d\\u044b"}}]	8	1
124	2024-03-03 07:49:00.757004+00	54	Palazzo - ресторан премиум-class	2	[]	9	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: navis
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	users	user
8	main	category
9	main	resident
10	main	slider
11	main	subcategory
12	main	residentdetail
13	main	header
14	main	subheader
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: navis
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2024-02-29 23:56:13.515108+00
2	auth	0001_initial	2024-02-29 23:56:13.577346+00
3	admin	0001_initial	2024-02-29 23:56:13.596596+00
4	admin	0002_logentry_remove_auto_add	2024-02-29 23:56:13.605649+00
5	admin	0003_logentry_add_action_flag_choices	2024-02-29 23:56:13.61587+00
6	contenttypes	0002_remove_content_type_name	2024-02-29 23:56:13.632353+00
7	auth	0002_alter_permission_name_max_length	2024-02-29 23:56:13.640806+00
8	auth	0003_alter_user_email_max_length	2024-02-29 23:56:13.65136+00
9	auth	0004_alter_user_username_opts	2024-02-29 23:56:13.659423+00
10	auth	0005_alter_user_last_login_null	2024-02-29 23:56:13.668531+00
11	auth	0006_require_contenttypes_0002	2024-02-29 23:56:13.670586+00
12	auth	0007_alter_validators_add_error_messages	2024-02-29 23:56:13.679538+00
13	auth	0008_alter_user_username_max_length	2024-02-29 23:56:13.691285+00
14	auth	0009_alter_user_last_name_max_length	2024-02-29 23:56:13.701741+00
15	auth	0010_alter_group_name_max_length	2024-02-29 23:56:13.712358+00
16	auth	0011_update_proxy_permissions	2024-02-29 23:56:13.721731+00
17	auth	0012_alter_user_first_name_max_length	2024-02-29 23:56:13.734014+00
18	main	0001_initial	2024-02-29 23:56:13.785918+00
19	sessions	0001_initial	2024-02-29 23:56:13.796076+00
20	users	0001_initial	2024-02-29 23:56:13.834652+00
21	main	0002_alter_subcategory_slug	2024-03-01 09:47:55.152125+00
22	main	0003_alter_subcategory_options	2024-03-01 10:43:27.499926+00
23	main	0004_header_subheader	2024-03-01 17:38:39.221078+00
24	main	0005_remove_subheader_sub_category_subheader_title	2024-03-01 17:43:19.530061+00
25	main	0006_alter_subheader_header	2024-03-01 17:55:24.565578+00
26	main	0007_remove_resident_name_category_slug_and_more	2024-03-02 09:03:34.576199+00
27	main	0008_category_header	2024-03-02 09:23:33.189514+00
28	main	0009_remove_category_header	2024-03-02 09:39:14.678073+00
29	main	0010_alter_subheader_header	2024-03-02 10:00:29.788757+00
30	main	0011_delete_header_alter_subheader_options_resident_name	2024-03-02 10:15:19.254658+00
31	main	0012_alter_resident_save_state	2024-03-02 10:46:14.848001+00
32	main	0013_rename_category_resident_header_remove_resident_name	2024-03-02 12:49:08.038946+00
33	main	0014_resident_name	2024-03-02 13:04:49.898323+00
34	main	0015_category_is_active	2024-03-02 16:24:21.910904+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: navis
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
dki5572ce50hdao5sh3t0gpyya29jfjj	.eJxVjEEOgjAQRe_StWmmgJ3i0j1nINOZjkVNSSisjHdXEha6_e-9_zIjbWset5qWcRJzMc6cfrdI_EhlB3Kncpstz2Vdpmh3xR602mGW9Lwe7t9Bppq_dQAJEDGqJ1EIiAl7lOilaxk9YePOjNwpMEGbVLveo2u1AUrqYwDz_gDxgDg9:1rfyaX:nDAEhmbtCyU43M9kb3kcjX57m7ak5zjsmPoDzLqIsuc	2024-03-15 08:49:53.239384+00
u1uehaptrat2uskye6ame00v93aafab3	.eJxVjEEOgjAQRe_StWmmgJ3i0j1nINOZjkVNSSisjHdXEha6_e-9_zIjbWset5qWcRJzMc6cfrdI_EhlB3Kncpstz2Vdpmh3xR602mGW9Lwe7t9Bppq_dQAJEDGqJ1EIiAl7lOilaxk9YePOjNwpMEGbVLveo2u1AUrqYwDz_gDxgDg9:1rfyc3:xKagm1On-dg7OF6pIReCbvhNmU6781W4A3Nr36KagxY	2024-03-15 08:51:27.762957+00
uccqs736oms39pl92kdp3z42rkw3q6jg	.eJxVjEEOgjAQRe_StWmmgJ3i0j1nINOZjkVNSSisjHdXEha6_e-9_zIjbWset5qWcRJzMc6cfrdI_EhlB3Kncpstz2Vdpmh3xR602mGW9Lwe7t9Bppq_dQAJEDGqJ1EIiAl7lOilaxk9YePOjNwpMEGbVLveo2u1AUrqYwDz_gDxgDg9:1rfyib:bhjPkh4g7YDNUmNhaGSKKVuHwW8vor54L5OGPNcxVAo	2024-03-15 08:58:13.615932+00
pc7ein8s0ewpqcd4bvxphvn5lm5k7ufe	.eJxVjEEOgjAQRe_StWmmgJ3i0j1nINOZjkVNSSisjHdXEha6_e-9_zIjbWset5qWcRJzMc6cfrdI_EhlB3Kncpstz2Vdpmh3xR602mGW9Lwe7t9Bppq_dQAJEDGqJ1EIiAl7lOilaxk9YePOjNwpMEGbVLveo2u1AUrqYwDz_gDxgDg9:1rfzq2:TVDNC2giUdmsJZ9GMFasQwZfPKsFIX0NGIITFn3-ZUc	2024-03-15 10:09:58.471751+00
dp3xjukyvttucesf4pfesexl8dy8nu68	.eJxVjEEOgjAQRe_StWmmgJ3i0j1nINOZjkVNSSisjHdXEha6_e-9_zIjbWset5qWcRJzMc6cfrdI_EhlB3Kncpstz2Vdpmh3xR602mGW9Lwe7t9Bppq_dQAJEDGqJ1EIiAl7lOilaxk9YePOjNwpMEGbVLveo2u1AUrqYwDz_gDxgDg9:1rg07B:VZmkKbmY7fygssst_ruCyQQTpFkyb207OVH_kRsEKMg	2024-03-15 10:27:41.922669+00
r6mjmi10wowwxfbvtrq3r55o8au6d1l4	.eJxVjEEOgjAQRe_StWmmgJ3i0j1nINOZjkVNSSisjHdXEha6_e-9_zIjbWset5qWcRJzMc6cfrdI_EhlB3Kncpstz2Vdpmh3xR602mGW9Lwe7t9Bppq_dQAJEDGqJ1EIiAl7lOilaxk9YePOjNwpMEGbVLveo2u1AUrqYwDz_gDxgDg9:1rg0BO:_4G5DIpPNdkRyxxrdBVzSeLBN2BjxJ-VnyBhWQ8UIOQ	2024-03-15 10:32:02.77915+00
bsebhbfypsw551414jugrbpiisn3avc1	.eJxVjEEOgjAQRe_StWmmgJ3i0j1nINOZjkVNSSisjHdXEha6_e-9_zIjbWset5qWcRJzMc6cfrdI_EhlB3Kncpstz2Vdpmh3xR602mGW9Lwe7t9Bppq_dQAJEDGqJ1EIiAl7lOilaxk9YePOjNwpMEGbVLveo2u1AUrqYwDz_gDxgDg9:1rgOmX:PDzwtMqQWcVyBQH0h3QBjlKNsbPHj0ZKCzgSBeB52Lo	2024-03-16 12:48:01.401986+00
stve8i3loy95hedsozwp2s3szyixsrij	.eJxVjEEOgjAQRe_StWmmgJ3i0j1nINOZjkVNSSisjHdXEha6_e-9_zIjbWset5qWcRJzMc6cfrdI_EhlB3Kncpstz2Vdpmh3xR602mGW9Lwe7t9Bppq_dQAJEDGqJ1EIiAl7lOilaxk9YePOjNwpMEGbVLveo2u1AUrqYwDz_gDxgDg9:1rgP4o:20-PEl1DhQoy1HJMjAAKqi2NcmY-lyPJ5hS2CJQfkko	2024-03-16 13:06:54.058088+00
\.


--
-- Data for Name: main_category; Type: TABLE DATA; Schema: public; Owner: navis
--

COPY public.main_category (id, name, slug, is_active) FROM stdin;
2	Раскошный отдых	raskoshnyj-otdyh	t
3	Популярные	populjarnye	t
4	Интервью	intervju	f
5	Продукт	produkt	f
10	Контакт	kontakt	f
6	Предложение от компании	predlozhenie-ot-kompanii	f
1	Недвижимость	nedvizhimost	t
13	test	test	f
\.


--
-- Data for Name: main_resident; Type: TABLE DATA; Schema: public; Owner: navis
--

COPY public.main_resident (id, slug, image, title, lang, data, updated_at, last_mod, save_state, header_id, name_id) FROM stdin;
31	missija-za-granju-obychnogo	thumb_qIQFFiE.jpg	Миссия - За гранью обычного	Русский язык	2024-03-01	2024-03-01 11:00:03.168552+00	2024-03-01 11:00:03.168574+00	t	3	\N
3	vzjat-kvartiru-v-ipoteku-v-bishkeke	thumb_xKAMdhw.jpg	Взять квартиру в ипотеку в Бишкеке:	Русский язык	2024-03-01	2024-03-01 10:12:48.196481+00	2024-03-01 10:12:48.196498+00	t	1	\N
2	sekrety-dubaj-nedvizhimost-za-rubezhom	thumb_NB9rvwE.jpg	Секреты Дубай, недвижимость за рубежом	Русский язык	2024-03-01	2024-03-01 10:13:00.051608+00	2024-03-01 10:13:00.051616+00	t	1	\N
5	moskva-zhiloj-dom-premium-klassa	thumb_sLlTamS.jpg	Москва - жилой дом премиум-класса	Русский язык	2024-03-01	2024-03-01 10:16:15.182193+00	2024-03-01 10:16:15.182211+00	t	1	\N
4	galereja-optom-i-v-roznitsu-pod-odnoj-kryshej	thumb_E0KqtBf.jpg	Галерея -  оптом и в розницу под одной крышей	Русский язык	2024-03-01	2024-03-01 10:18:15.543232+00	2024-03-01 10:18:15.543238+00	t	3	\N
6	uno-city-novyj-gorod-kurort-v-kyrgyzstane	thumb_5TDqRWT.jpg	UNO City - новый город-курорт в Кыргызстане	Русский язык	2024-03-01	2024-03-01 10:20:38.117504+00	2024-03-01 10:20:38.117529+00	t	1	\N
7	mesto-dlja-delovyh-vstrech	thumb_aNDukdS.jpg	Место для деловых встреч	Русский язык	2024-03-01	2024-03-01 10:22:19.999505+00	2024-03-01 10:22:19.999524+00	t	3	\N
8	uno-city-novyj-gorod-kurort	thumb_WXMwWj4.jpg	UNO City - новый город-курорт	Русский язык	2024-03-01	2024-03-01 10:23:58.842463+00	2024-03-01 10:23:58.842483+00	t	1	\N
9	moskva-zhiloj-dom-premium	thumb_MrBeMas.jpg	Москва - жилой дом премиум	Русский язык	2024-03-01	2024-03-01 10:27:15.106163+00	2024-03-01 10:27:15.106182+00	t	1	\N
10	sumbule-spa-tsentr-nezabyvaemogo	thumb_SKnXIri.jpg	Sumbule - SPA центр незабываемого	Русский язык	2024-03-01	2024-03-01 10:31:44.823501+00	2024-03-01 10:31:44.823523+00	t	3	\N
12	vzjat-kvartiru-v-ipoteku-v-karakole	thumb_K0Pjaq5.jpg	Взять квартиру в ипотеку в караколе	Русский язык	2024-03-01	2024-03-01 10:33:49.384661+00	2024-03-01 10:33:49.384689+00	t	1	\N
13	galereja-otdelochnye-materialy-optom-i-v-roznitsu	thumb_fO80pRC.jpg	Галерея - отделочные материалы оптом и в розницу	Русский язык	\N	2024-03-01 10:43:53.846909+00	2024-03-01 10:43:53.846944+00	t	5	\N
14	orion-hotel	thumb_OJyLb68.jpg	Orion Hotel	Русский язык	2024-03-01	2024-03-01 10:46:18.51389+00	2024-03-01 10:46:18.513911+00	t	1	\N
17	produkty	thumb_YrLfKnw.jpg	продукты	Кыргыз тили	\N	2024-03-01 10:48:15.365668+00	2024-03-01 10:48:15.365686+00	f	5	\N
20	otel-orion	thumb_FWiZfYY.jpg	Отель Орион	Русский язык	2024-03-01	2024-03-01 10:51:45.323161+00	2024-03-01 10:51:45.323167+00	t	2	\N
22	luchshee-mesto-dlja-delovyh-vstrech	thumb_S5qCm5G.jpg	Лучшее место для деловых встреч	Русский язык	2024-03-01	2024-03-01 10:52:34.99201+00	2024-03-01 10:52:34.99203+00	t	3	\N
19	mesto-dlja-luchshih-delovyh-vstrech	thumb_4sArUit.jpg	Место для лучших деловых встреч	Русский язык	2024-03-01	2024-03-01 10:53:48.650524+00	2024-03-01 10:53:48.650531+00	t	4	\N
16	moskva-luchshij-zhiloj-dom	thumb_KkgyrT2.jpg	Москва - лучший жилой дом	Русский язык	2024-03-01	2024-03-01 10:54:03.614205+00	2024-03-01 10:54:03.614213+00	t	4	\N
24	anna-shishkina-osnovatel-dizajn-freedom-group	thumb_o2uveVs.jpg	Анна Шишкина - основатель дизайн Freedom Group	Русский язык	2024-03-01	2024-03-01 10:56:16.097032+00	2024-03-01 10:56:16.097052+00	t	4	\N
25	sumbule-spa-tsentr	thumb_7ImFUNd.jpg	Sumbule - SPA центр	Русский язык	2024-03-01	2024-03-01 10:56:58.279605+00	2024-03-01 10:56:58.279632+00	t	3	\N
28	otel-orion-mesto-dlja-otdyha	thumb_KhZwoXr.jpg	Отель Орион - место для отдыха	Русский язык	2024-03-01	2024-03-01 10:57:54.71995+00	2024-03-01 10:57:54.719972+00	t	4	\N
29	vladislav-osnovatel-dizajn-studii-freedom-group	thumb_1nKN7rp.jpg	Владислав - основатель дизайн-студии Freedom Group	Русский язык	2024-03-01	2024-03-01 10:59:48.777886+00	2024-03-01 10:59:48.777906+00	t	4	\N
23	na-nashem-otele	thumb_krQUR2I.jpg	На нашем отеле	Русский язык	\N	2024-03-01 11:00:38.512135+00	2024-03-01 11:00:38.512141+00	t	5	\N
27	v-otele-mozhno-najti-vse	thumb_NogWhtQ.jpg	В отеле можно найти все	Русский язык	\N	2024-03-01 11:01:32.499346+00	2024-03-01 11:01:32.499352+00	t	5	\N
32	otel-orion-mesto	thumb_VYbZbZI.jpg	Отель Орион-место	Русский язык	2024-03-01	2024-03-01 11:01:51.965258+00	2024-03-01 11:01:51.965282+00	t	2	\N
30	otlichnyj-servis	thumb_Ze7wmcm.jpg	Отличный сервис	Русский язык	2024-03-01	2024-03-01 11:01:53.4057+00	2024-03-01 11:01:53.405707+00	t	5	\N
33	palazzo-restoran-premium-klassa	thumb_Xacp17k.jpg	Palazzo - ресторан премиум-класса	Русский язык	2024-03-01	2024-03-01 11:02:34.643161+00	2024-03-01 11:02:34.643183+00	t	3	\N
34	vladislav-popov-osnovatel-dizajn-studii-freedom	thumb_0aKFDKC.jpg	Владислав Попов - основатель дизайн-студии Freedom	Русский язык	2024-03-01	2024-03-01 11:03:47.685134+00	2024-03-01 11:03:47.685154+00	t	4	\N
39	vladislav-osnovatel-studii-freedom-group	thumb_h5CGUtT.jpg	Владислав - основатель студии Freedom Group	Русский язык	2024-03-01	2024-03-01 11:05:44.177664+00	2024-03-01 11:05:44.177687+00	t	4	\N
41	mesto-dlja-delovyh-vstrech-dlja-biznesmenov	thumb_GY5iZx9.jpg	Место для деловых встреч для бизнесменов	Русский язык	2024-03-01	2024-03-01 11:06:36.12841+00	2024-03-01 11:06:36.128427+00	t	3	\N
35	sportivnye-zaly	thumb_AQ7Ki02.jpg	Спортивные залы	Русский язык	\N	2024-03-01 11:06:52.222183+00	2024-03-01 11:06:52.222191+00	t	5	\N
36	horoshie-otzyvy	thumb_SzA5AO2.jpg	Хорошие отзывы	Русский язык	2024-03-01	2024-03-01 11:07:06.224898+00	2024-03-01 11:07:06.224904+00	t	2	\N
42	ujutnye-komnaty	thumb_IRPU93p.jpg	Уютные комнаты	Русский язык	2024-03-01	2024-03-01 11:07:17.14813+00	2024-03-01 11:07:17.148136+00	t	2	\N
46	popov-osnovatel-studii-freedom-group	thumb_dreWlPI.jpg	Попов - основатель студии Freedom Group	Русский язык	2024-03-01	2024-03-01 11:10:24.431514+00	2024-03-01 11:10:24.431538+00	t	6	\N
44	krasivyj-vid-kvartir	thumb_mBaca2f.jpg	Красивый вид квартир	Русский язык	2024-03-01	2024-03-01 11:11:16.082764+00	2024-03-01 11:11:16.082772+00	t	2	\N
45	otlichnye-servisy-dlja-klientov	thumb_XjxCLtI.jpg	Отличные сервисы для клиентов	Русский язык	2024-03-01	2024-03-01 11:11:43.86462+00	2024-03-01 11:11:43.864628+00	t	5	\N
43	ujutnaja-atmasfera	thumb_XDYSOX8.jpg	Уютная атмасфера	Русский язык	2024-03-01	2024-03-01 11:12:03.654771+00	2024-03-01 11:12:03.654777+00	t	5	\N
48	lake	thumb_4dL4y9e.jpg	Lake	Русский язык	2024-03-01	2024-03-01 11:14:05.624154+00	2024-03-01 11:14:05.624179+00	t	2	\N
49	province	thumb_j1kkJiI.jpg	Province	Русский язык	2024-03-01	2024-03-01 11:17:08.562554+00	2024-03-01 11:17:08.562572+00	t	2	\N
50	resident-pervyj-zhurnal	thumb_9iA5vAq.jpg	Resident - первый журнал	Русский язык	2024-03-01	2024-03-01 11:17:25.256964+00	2024-03-01 11:17:25.256983+00	t	6	\N
51	otel-orion-ne-tolko-mesto-dlja-otdyha	thumb_26gWoKX.jpg	Отель Орион - не только место для отдыха	Русский язык	2024-03-01	2024-03-01 11:20:43.007672+00	2024-03-01 11:20:43.007694+00	t	6	\N
56	missija-za-granju	thumb_2EXvsKP.jpg	Миссия - За гранью	Русский язык	2024-03-01	2024-03-01 11:27:51.95929+00	2024-03-01 11:27:51.959309+00	t	6	\N
57	sumbule-spa-tsentr-nezabyvaemogo-vesele	thumb_KkhtAG3.jpg	Sumbule - SPA центр незабываемого веселье	\N	2024-03-01	2024-03-01 11:30:35.900336+00	2024-03-01 11:30:35.900358+00	t	6	\N
62	ujutnye-mesta-dlja-klientov	thumb_cBfsLqx.jpg	Уютные места для клиентов	Русский язык	2024-03-01	2024-03-02 10:27:48.08014+00	2024-03-02 10:27:48.080148+00	t	6	\N
54	palazzo-restoran-premium-class	thumb_6Sc1jvg.jpg	Palazzo - ресторан премиум-class	Русский язык	2024-03-01	2024-03-03 07:49:00.754636+00	2024-03-03 07:49:00.754643+00	t	6	\N
\.


--
-- Data for Name: main_residentdetail; Type: TABLE DATA; Schema: public; Owner: navis
--

COPY public.main_residentdetail (id, description, key_id) FROM stdin;
2	<h1>Миссия - За гранью обычного</h1>\r\n\r\n<p>Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников. Главная цель - превзойти ожидания наших гостей. Орион - больше, чем отель! Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://www.orionbishkek.com/uploads/ebfbd96d9cdfe6abcddcbe438e113de44758ef48.jpeg" style="border-style:solid; border-width:20px; height:300px; width:450px" /><img alt="" src="https://www.orionbishkek.com/uploads/ebfbd96d9cdfe6abcddcbe438e113de44758ef48.jpeg" style="border-style:solid; border-width:20px; height:300px; width:450px" />`</span></p>	2
3	<h1>Миссия - За гранью обычного</h1>\r\n\r\n<p>Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников. Главная цель - превзойти ожидания наших гостей. Орион - больше, чем отель! Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/90380260.jpg?k=ae35c6b802e3210469076ec57b2ec0336483c3548148a68efe687a5f06fc5e04&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /><img alt="" src="https://www.orionbishkek.com/uploads/784ed788bf02e64fc78a56eda561dd4160547cd3.jpeg" style="border-style:solid; border-width:20px; height:338px; width:450px" /></span></p>	3
4	<h1>Миссия - За гранью обычного</h1>\r\n\r\n<p>Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников. Главная цель - превзойти ожидания наших гостей. Орион - больше, чем отель! Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://www.orionbishkek.com/uploads/784ed788bf02e64fc78a56eda561dd4160547cd3.jpeg" style="border-style:solid; border-width:20px; height:338px; width:450px" /><img alt="" src="https://1b4da894acfad722fb46-08ede53a5c8850764384bc99fd6145bb.ssl.cf3.rackcdn.com/4419043/72929697_u.jpg" style="border-style:solid; border-width:20px; height:270px; width:450px" /></span></p>	5
5	<h1>Миссия - За гранью обычного</h1>\r\n\r\n<p>Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников. Главная цель - превзойти ожидания наших гостей. Орион - больше, чем отель! Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/100083446.jpg?k=4b2c45a50ffff255c349eacb71f74a4d2ec2a07f6e862877a394d4acaaf221c3&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:253px; width:450px" /><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/100083446.jpg?k=4b2c45a50ffff255c349eacb71f74a4d2ec2a07f6e862877a394d4acaaf221c3&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:253px; width:450px" /></span></p>	4
6	<h1>Миссия - За гранью обычного</h1>\r\n\r\n<p>Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников. Главная цель - превзойти ожидания наших гостей. Орион - больше, чем отель! Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://1b4da894acfad722fb46-08ede53a5c8850764384bc99fd6145bb.ssl.cf3.rackcdn.com/4419043/72929697_u.jpg" style="border-style:solid; border-width:20px; height:270px; width:450px" /><img alt="" src="https://www.ticati.com/img/hotel/10273772s.jpg" style="border-style:solid; border-width:20px; height:300px; width:450px" /></span></p>	6
7	<h1>Место для деловых встреч</h1>\r\n\r\n<p>В&nbsp;отеле &laquo;Орион&raquo; есть&nbsp;не&nbsp;только уютные номера и&nbsp;прекрасный ресторан, но&nbsp;и&nbsp;высококлассный конференц-зал, который поразит своей современной аудиовизуальной техникой и&nbsp;функциональностью. Он&nbsp;является идеальным местом для&nbsp;проведения деловых встреч, конференций и&nbsp;частных ужинов.<br />\r\nКонференц-зал &laquo;Ак-Сай&raquo; имеет площадь в&nbsp;123&nbsp;квадратных метра, а&nbsp;его&nbsp;вместимость составляет от&nbsp;35&nbsp;до&nbsp;100&nbsp;человек в&nbsp;зависимости от&nbsp;рассадки. П-образная рассадка вмещает до&nbsp;30&nbsp;человек, а&nbsp;в&nbsp;театральной версии зала могут поместиться до&nbsp;100&nbsp;гостей.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1280x900/90380140.jpg?k=6920383037ffa495246f4837159ad286f31be3ddf167381cd32c8c959375d9f6&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:240px; width:450px" /><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1280x900/90380295.jpg?k=fb9d797d70d7fe985fd64ac9f83f51b1bf612d3bf74ece30c0bcb6abddfaaa52&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:237px; width:450px" /></span></p>	7
8	<h1>Миссия - За гранью обычного</h1>\r\n\r\n<p>Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников. Главная цель - превзойти ожидания наших гостей. Орион - больше, чем отель! Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://www.ticati.com/img/hotel/10273772s.jpg" style="border-style:solid; border-width:20px; height:300px; width:450px" /><img alt="" src="https://www.ticati.com/img/hotel/10273772s.jpg" style="border-style:solid; border-width:20px; height:300px; width:450px" /></span></p>	8
9	<h1>Миссия - За гранью обычного</h1>\r\n\r\n<p>Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников. Главная цель - превзойти ожидания наших гостей. Орион - больше, чем отель! Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://orion-hotel-bishkek.megotel.ru/images/hotels/122830/4.jpg" style="border-style:solid; border-width:20px; height:242px; width:450px" /><img alt="" src="https://orion-hotel-bishkek.megotel.ru/images/hotels/122830/4.jpg" style="border-style:solid; border-width:20px; height:242px; width:450px" /></span></p>	9
10	<h1>Sumbule - SPA центр незабываемого отдыха, красоты и здоровья</h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников. Главная цель - превзойти ожидания наших гостей. Орион - больше, чем отель! Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1280x900/287471867.jpg?k=14d850c1c1805c9e42ff69699feddd2ce83442c5a9707328d68bba41911cbd22&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1280x900/90380211.jpg?k=7b4ec241e0b576a19076c95585ded6e1da73c21227f38f31f087d02a541d9eca&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /></span></p>	10
11	<h1>Миссия - За гранью обычного</h1>\r\n\r\n<p>Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников. Главная цель - превзойти ожидания наших гостей. Орион - больше, чем отель! Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://orion-hotel-bishkek.megotel.ru/images/hotels/122830/4.jpg" style="border-style:solid; border-width:20px; height:242px; width:450px" /><img alt="" src="https://i6.photo.2gis.com/images/branch/0/30258560067824074_1a03.jpg" style="border-style:solid; border-width:20px; height:300px; width:450px" /></span></p>	12
12	<h1><span style="color:#ffffff">rertbrbwrt2qergeb</span>Галерея - отделочные материалы оптом и в розницу</h1>\r\n\r\n<h1>Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников. Главная цель - превзойти ожидания наших гостей. Орион - больше, чем отель! Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников.</h1>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/294997045.jpg?k=ba9161d63366a2509975fac0147a5cfd519dc3b311f5594fc8e3351bf75687e1&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/294997002.jpg?k=1cd9434de65794611891ce48f2c33fb10478cf0bee670c1df33689698f20274f&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /></span></p>	13
13	<h1>Миссия - За гранью обычного</h1>\r\n\r\n<p>Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников. Главная цель - превзойти ожидания наших гостей. Орион - больше, чем отель! Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/83395964.jpg?k=e173c6544485d1d08f2a908ad9ffc55f916d568057001684b5638959ef2b9f17&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /><img alt="" src="https://images.trvl-media.com/hotels/16000000/15290000/15282800/15282721/702dd81c_z.jpg" style="border-style:solid; border-width:20px; height:300px; width:450px" /></span></p>	14
14	<h1>Москва - жилой дом премиум-класса</h1>\r\n\r\n<p>Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников. Главная цель - превзойти ожидания наших гостей. Орион - больше, чем отель! Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://www.orionbishkek.com/uploads/54d0b99afbc61ab2cd55df18e1a67d7c267230ab.jpeg?method=fit&amp;width=550&amp;height=550" style="border-style:solid; border-width:20px; height:300px; width:450px" /><img alt="" src="https://www.orionbishkek.com/uploads/a6d7cfbaf3dd39f1c4387d14c5afe54a2259f6f5.jpeg?method=fit&amp;width=550&amp;height=550" style="border-style:solid; border-width:20px; height:300px; width:450px" /></span></p>	16
15	<h1>Все под одной крышей: стройматериалы, сантехника, инструменты, электротовары и мн.</h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>В&nbsp;отеле &laquo;Орион&raquo; - это не только место для отдыха и проживания, но и идеальное место для проведения деловых и культурных мероприятий в самом центре Бишкека. Конференц-зал - прекрасный выбор для тех, кто ищет место для проведения важных мероприятий в комфортном и уютном атмосферном. Современное оборудование и внимательный персонал гарантируют, что каждое мероприятие.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/90380295.jpg?k=fb9d797d70d7fe985fd64ac9f83f51b1bf612d3bf74ece30c0bcb6abddfaaa52&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:237px; width:450px" /><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/83812939.jpg?k=e8de6f69cbd57635dc7e14bd9457f55f837e318ce4505f16c8973da30b672f4a&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /></span></p>	17
16	<h1>Место для деловых встреч</h1>\r\n\r\n<p>Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников. Главная цель - превзойти ожидания наших гостей. Орион - больше, чем отель! Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://www.orionbishkek.com/uploads/c1bd0732ef02d08a76bbbd9253e8eec34c3bc57a.jpeg?method=fit&amp;width=550&amp;height=550" style="border-style:solid; border-width:20px; height:300px; width:450px" /><img alt="" src="https://www.orionbishkek.com/uploads/c1bd0732ef02d08a76bbbd9253e8eec34c3bc57a.jpeg?method=fit&amp;width=550&amp;height=550" style="border-style:solid; border-width:20px; height:300px; width:450px" /></span></p>	19
17	<h1>Миссия - За гранью обычного</h1>\r\n\r\n<p>Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников. Главная цель - превзойти ожидания наших гостей. Орион - больше, чем отель! Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://img.freepik.com/premium-photo/luxury-hotel-with-water-villas-and-palm-tree-leaves-sand-sea-beach-resort-vacation-maldives-island_663265-1220.jpg" style="border-style:solid; border-width:20px; height:300px; width:450px" /><img alt="" src="https://www.atorus.ru/sites/default/files/upload/image/TOP10/3520/5.jpg" style="border-style:solid; border-width:20px; height:269px; width:450px" /></span></p>	20
18	<h1>Место для деловых встреч</h1>\r\n\r\n<p>В&nbsp;отеле &laquo;Орион&raquo; есть&nbsp;не&nbsp;только уютные номера и&nbsp;прекрасный ресторан, но&nbsp;и&nbsp;высококлассный конференц-зал, который поразит своей современной аудиовизуальной техникой и&nbsp;функциональностью. Он&nbsp;является идеальным местом для&nbsp;проведения деловых встреч, конференций и&nbsp;частных ужинов.<br />\r\nКонференц-зал &laquo;Ак-Сай&raquo; имеет площадь в&nbsp;123&nbsp;квадратных метра, а&nbsp;его&nbsp;вместимость составляет от&nbsp;35&nbsp;до&nbsp;100&nbsp;человек в&nbsp;зависимости от&nbsp;рассадки. П-образная рассадка вмещает до&nbsp;30&nbsp;человек, а&nbsp;в&nbsp;театральной версии зала могут поместиться до&nbsp;100&nbsp;гостей.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1280x900/83812901.jpg?k=0f48ee47b9c6f7597ee9187806cbf29b0533c605c08e7e2f4e239dc4e324c7ee&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1280x900/90380135.jpg?k=682c974df07a2c86c21987fe15c745ba1eb2328f6b6cfb9f552e8ef27ab4f8cd&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:249px; width:450px" /></span></p>\r\n\r\n<p>&nbsp;</p>	22
19	<h1>Tesoro Home - текстильная компания в области декора с 2005 года</h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Конференц-зал &laquo;Ак-Сай&raquo; имеет площадь в&nbsp;123&nbsp;квадратных метра, а&nbsp;его&nbsp;вместимость составляет от&nbsp;35&nbsp;до&nbsp;100&nbsp;человек в&nbsp;зависимости от&nbsp;рассадки. П-образная рассадка вмещает до&nbsp;30&nbsp;человек, а&nbsp;в&nbsp;театральной версии зала .<span style="color:#ffffff"><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/90380189.jpg?k=e74ce070d92e89e352efbfeb957ae4e4bb5a2df81d55804fb7aafeaaef46945a&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/90380280.jpg?k=a4cb85c40d5813bd6849839dcc05cb8e29f0765cd4dd1316eb6ecaf2351062e6&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /></span></p>	23
20	<h1>Анна Шишкина - основатель дизайн-студии Freedom Group</h1>\r\n\r\n<p>Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников. Главная цель - превзойти ожидания наших гостей. Орион - больше, чем отель! Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/83395964.jpg?k=e173c6544485d1d08f2a908ad9ffc55f916d568057001684b5638959ef2b9f17&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/83396581.jpg?k=e7588cd6a54c781670648b3683ec25193e60f88a1e6f809c8d66240790fe2406&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /></span></p>	24
21	<h1>Sumbule - SPA центр незабываемого отдыха, красоты и здоровья</h1>\r\n\r\n<p>Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников. Главная цель - превзойти ожидания наших гостей. Орион - больше, чем отель! Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1280x900/90448179.jpg?k=3c86235c1f23cd45c3dd359e14f4112ce7c0c8e77509b7c4ca31dfec23b20be3&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1280x900/83814484.jpg?k=706a7edaf2f00d3d18d35f7995cb30b1d3f808147b911791981c2ca2833f6dcf&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>	25
22	<h1>Галерея - отделочные материалы оптом и в розницу</h1>\r\n\r\n<p>В&nbsp;отеле &laquo;Орион&raquo; есть&nbsp;не&nbsp;только уютные номера и&nbsp;прекрасный ресторан, но&nbsp;и&nbsp;высококлассный конференц-зал, который поразит своей современной аудиовизуальной техникой и&nbsp;функциональностью. Он&nbsp;является идеальным местом для&nbsp;проведения деловых встреч, конференций и&nbsp;частных ужинов.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/287471499.jpg?k=21dc7900777473c089f4745df4464b00f5c8039b75d1de8451e7ec821e03753e&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/287471508.jpg?k=29405f8c72b3e6fc23f9a52da4b70611ab98a48e78220225a28b46b343ee5fce&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /></span></p>	27
23	<h1>Отель Орион - не только место для отдыха</h1>\r\n\r\n<p>Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников. Главная цель - превзойти ожидания наших гостей. Орион - больше, чем отель! Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/83396581.jpg?k=e7588cd6a54c781670648b3683ec25193e60f88a1e6f809c8d66240790fe2406&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/90380295.jpg?k=fb9d797d70d7fe985fd64ac9f83f51b1bf612d3bf74ece30c0bcb6abddfaaa52&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:237px; width:450px" /></span></p>	28
24	<h1>Владислав Попов - основатель дизайн-студии Freedom Group</h1>\r\n\r\n<p>Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников. Главная цель - превзойти ожидания наших гостей. Орион - больше, чем отель! Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/83396581.jpg?k=e7588cd6a54c781670648b3683ec25193e60f88a1e6f809c8d66240790fe2406&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/90380256.jpg?k=6729cda00b2b451c11f728444e2486412f7386f2c0732016ac3788591b03dd85&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /></span></p>	29
25	<h1>Галерея - отделочные материалы оптом и в розницу</h1>\r\n\r\n<p>Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников. Главная цель - превзойти ожидания наших гостей. Орион - больше, чем отель! Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/287471499.jpg?k=21dc7900777473c089f4745df4464b00f5c8039b75d1de8451e7ec821e03753e&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/90380318.jpg?k=ee36e562d879ad53ef3ca4f3b2b18e7d45bd84dfa970380eb2ebfc52f3c636cd&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /></span></p>	30
26	<h1>Миссия - За гранью обычного</h1>\r\n\r\n<p>Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников. Главная цель - превзойти ожидания наших гостей. Орион - больше, чем отель! Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1280x900/90380280.jpg?k=a4cb85c40d5813bd6849839dcc05cb8e29f0765cd4dd1316eb6ecaf2351062e6&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1280x900/90380216.jpg?k=eeea8009326beba9c55e3b90666621d275c12545147699872a5ef758dfa97449&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /></span></p>\r\n\r\n<p>&nbsp;</p>	31
27	<h1>Миссия - За гранью обычного</h1>\r\n\r\n<p>Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников. Главная цель - превзойти ожидания наших гостей. Орион - больше, чем отель! Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://cotravel.shop/images/2023/vip_img_1.jpeg" style="border-style:solid; border-width:20px; height:450px; width:450px" /><img alt="" src="https://krym-portal.ru/wp-content/uploads/2017/10/372-800x445.jpg" style="border-style:solid; border-width:20px; height:250px; width:450px" /></span></p>	32
28	<h1>Palazzo - ресторан премиум-класса</h1>\r\n\r\n<p>В&nbsp;отеле &laquo;Орион&raquo; есть&nbsp;не&nbsp;только уютные номера и&nbsp;прекрасный ресторан, но&nbsp;и&nbsp;высококлассный конференц-зал, который поразит своей современной аудиовизуальной техникой и&nbsp;функциональностью. Он&nbsp;является идеальным местом для&nbsp;проведения деловых встреч, конференций и&nbsp;частных ужинов.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1280x900/90380151.jpg?k=007ce76a60417abe74f6da1a201044cc3a4b067030ac9aed60f4496b1d74ab8e&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:245px; width:450px" /><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1280x900/81925020.jpg?k=708de3cac9494c54de2e6a29e7d5f7461bf1f641471c1512180f6f71139493e1&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /></span></p>	33
29	<h1>Владислав Попов - основатель дизайн-студии Freedom Group</h1>\r\n\r\n<p>Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников. Главная цель - превзойти ожидания наших гостей. Орион - больше, чем отель! Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/90380295.jpg?k=fb9d797d70d7fe985fd64ac9f83f51b1bf612d3bf74ece30c0bcb6abddfaaa52&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:237px; width:450px" /><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/83814484.jpg?k=706a7edaf2f00d3d18d35f7995cb30b1d3f808147b911791981c2ca2833f6dcf&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /></span></p>\r\n\r\n<p>&nbsp;</p>	34
30	<h1>Все под одной крышей: стройматериалы, сантехника, инструменты, электротовары и мн.</h1>\r\n\r\n<p>В&nbsp;отеле &laquo;Орион&raquo; есть&nbsp;не&nbsp;только уютные номера и&nbsp;прекрасный ресторан, но&nbsp;и&nbsp;высококлассный конференц-зал, который поразит своей современной аудиовизуальной техникой и&nbsp;функциональностью. Он&nbsp;является идеальным местом для&nbsp;проведения деловых встреч, конференций и&nbsp;частных ужинов.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/287471568.jpg?k=7c76482d9c8fd0b3cc8b8eeff7f96958c3dc1da4524730340f3f7fcb63fe9a96&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/90380318.jpg?k=ee36e562d879ad53ef3ca4f3b2b18e7d45bd84dfa970380eb2ebfc52f3c636cd&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /></span></p>	35
31	<h1>Миссия - За гранью обычного</h1>\r\n\r\n<p>Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников. Главная цель - превзойти ожидания наших гостей. Орион - больше, чем отель! Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://img.freepik.com/free-photo/hotel-terrace-sitting-zone-around-the-swimming-pool_114579-2725.jpg" style="border-style:solid; border-width:20px; height:300px; width:450px" /><img alt="" src="https://riviera.kz/assets/cache/images/maldivy0-632x388-d5d.jpg" style="border-style:solid; border-width:20px; height:300px; width:450px" /></span></p>	36
42	<h1>Resident - первый журнал о&nbsp;строительстве в&nbsp;кыргызстане</h1>\r\n\r\n<p>Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1280x900/90380268.jpg?k=a00056e1704094b0ac519cc467b0d0c903b4bf66bf099b010cbb8f9c0519f513&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1280x900/90380245.jpg?k=7d1e58138b52e6fdd9f505de2e1dbf3d9c86b69be261739b44e414a19a94d498&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /></span></p>\r\n\r\n<p>&nbsp;</p>	50
32	<h1>Владислав Попов - основатель дизайн-студии Freedom Group</h1>\r\n\r\n<p>Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников. Главная цель - превзойти ожидания наших гостей. Орион - больше, чем отель! Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/90380189.jpg?k=e74ce070d92e89e352efbfeb957ae4e4bb5a2df81d55804fb7aafeaaef46945a&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/83812939.jpg?k=e8de6f69cbd57635dc7e14bd9457f55f837e318ce4505f16c8973da30b672f4a&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /></span></p>	39
33	<h1>Место для деловых встреч</h1>\r\n\r\n<p>В&nbsp;отеле &laquo;Орион&raquo; есть&nbsp;не&nbsp;только уютные номера и&nbsp;прекрасный ресторан, но&nbsp;и&nbsp;высококлассный конференц-зал, который поразит своей современной аудиовизуальной техникой и&nbsp;функциональностью. Он&nbsp;является идеальным местом для&nbsp;проведения деловых встреч, конференций и&nbsp;частных ужинов.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1280x900/83812839.jpg?k=c23a1dbde9545621f75f1b9f74855083dc120885bca6dd85c998355bace1ed84&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1280x900/83812939.jpg?k=e8de6f69cbd57635dc7e14bd9457f55f837e318ce4505f16c8973da30b672f4a&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /></span></p>	41
34	<h1>Место для деловых встреч</h1>\r\n\r\n<p>В&nbsp;отеле &laquo;Орион&raquo; есть&nbsp;не&nbsp;только уютные номера и&nbsp;прекрасный ресторан, но&nbsp;и&nbsp;высококлассный конференц-зал, который поразит своей современной аудиовизуальной техникой и&nbsp;функциональностью. Он&nbsp;является идеальным местом для&nbsp;проведения деловых встреч, конференций и&nbsp;частных ужинов.<br />\r\nКонференц-зал &laquo;Ак-Сай&raquo; имеет площадь в&nbsp;123&nbsp;квадратных метра, а&nbsp;его&nbsp;вместимость составляет от&nbsp;35&nbsp;до&nbsp;100&nbsp;человек в&nbsp;зависимости от&nbsp;рассадки. П-образная рассадка вмещает до&nbsp;30&nbsp;человек, а&nbsp;в&nbsp;театральной версии зала могут поместиться до&nbsp;100&nbsp;гостей.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://eleganttravel.ru/images/asset/003/556/312/3556312/desktop.jpg?1466998958" style="border-style:solid; border-width:20px; height:299px; width:450px" /><img alt="" src="https://www.coronatours.ru/media/cache/3f/34/3f3409f8d3c01a16c88fe842421bb934.jpg" style="border-style:solid; border-width:20px; height:253px; width:450px" /></span></p>	42
35	<h1>Галерея - отделочные материалы оптом и в розницу</h1>\r\n\r\n<p>Конференц-зал &laquo;Ак-Сай&raquo; имеет площадь в&nbsp;123&nbsp;квадратных метра, а&nbsp;его&nbsp;вместимость составляет от&nbsp;35&nbsp;до&nbsp;100&nbsp;человек в&nbsp;зависимости от&nbsp;рассадки. П-образная рассадка вмещает до&nbsp;30&nbsp;человек, а&nbsp;в&nbsp;театральной версии зала могут поместиться до&nbsp;100&nbsp;гостей.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/297021087.jpg?k=70c1dd9eec999716a0069e2b82dc2b66f26208c3df80c3a240d63be6bf8b46d3&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:289px; width:450px" /><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/310927551.jpg?k=89b8a66e2a3a1bb3cfe02e4e33362dce15ee8c86dbc2d48e04b45411c2d5f18f&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /></span></p>	43
36	<h1>Место для деловых встреч</h1>\r\n\r\n<p>В&nbsp;отеле &laquo;Орион&raquo; есть&nbsp;не&nbsp;только уютные номера и&nbsp;прекрасный ресторан, но&nbsp;и&nbsp;высококлассный конференц-зал, который поразит своей современной аудиовизуальной техникой и&nbsp;функциональностью. Он&nbsp;является идеальным местом для&nbsp;проведения деловых встреч, конференций и&nbsp;частных ужинов.<br />\r\nКонференц-зал &laquo;Ак-Сай&raquo; имеет площадь в&nbsp;123&nbsp;квадратных метра, а&nbsp;его&nbsp;вместимость составляет от&nbsp;35&nbsp;до&nbsp;100&nbsp;человек в&nbsp;зависимости от&nbsp;рассадки. П-образная рассадка вмещает до&nbsp;30&nbsp;человек, а&nbsp;в&nbsp;театральной версии зала могут поместиться до&nbsp;100&nbsp;гостей.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://www.vzavtra.net/wp-content/uploads/2023/10/one_of_a_kind_glamping_experience_offers_a_luxurious_escape_into_nature_hero-1200x750.jpg" style="border-style:solid; border-width:20px; height:281px; width:450px" /><img alt="" src="https://www.vzavtra.net/wp-content/uploads/2023/10/one_of_a_kind_glamping_experience_offers_a_luxurious_escape_into_nature_6.jpg" style="border-style:solid; border-width:20px; height:287px; width:450px" /></span></p>	44
37	<h1>Галерея - отделочные материалы оптом и в розницу</h1>\r\n\r\n<p>В&nbsp;отеле &laquo;Орион&raquo; - это не только место для отдыха и проживания, но и идеальное место для проведения деловых и культурных мероприятий в самом центре Бишкека. Конференц-зал - прекрасный выбор для тех, кто ищет место для проведения важных мероприятий в комфортном и уютном атмосферном. Современное оборудование и внимательный персонал гарантируют, что каждое мероприятие.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/287471571.jpg?k=8e1ca8691cc81475f1fe09633876d0f0f1aaaf5efbbe4212eaf259b24d7c4da8&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/310927549.jpg?k=0de36a249d46562ef60a45cd9d05c955fd4700a9016e67c1ad7e5d328ecc00d1&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /></span></p>	45
38	<h1>Владислав Попов - основатель дизайн-студии Freedom Group</h1>\r\n\r\n<p>Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников. Главная цель - превзойти ожидания наших гостей. Орион - больше, чем отель! Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/90380260.jpg?k=ae35c6b802e3210469076ec57b2ec0336483c3548148a68efe687a5f06fc5e04&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/81925038.jpg?k=e33b18be94dee42271bf5184377dd4d21cf5a7c86dabe62a26e12ea77ddfb9c0&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /></span></p>	46
40	<h1>Миссия - За гранью обычного</h1>\r\n\r\n<p>Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников. Главная цель - превзойти ожидания наших гостей. Орион - больше, чем отель! Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://i0.wp.com/lifereport.net/wp-content/uploads/2023/04/bayou-villas-antalya__4.jpg?resize=1110%2C740&amp;ssl=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /><img alt="" src="https://dynamic-media-cdn.tripadvisor.com/media/photo-o/28/0e/d1/dc/bayou-villas-3-bedroom.jpg?w=700&amp;h=-1&amp;s=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /></span></p>	48
41	<h1>Миссия - За гранью обычного</h1>\r\n\r\n<p>Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников. Главная цель - превзойти ожидания наших гостей. Орион - больше, чем отель! Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://www.atorus.ru/sites/default/files/upload/image/News/58032/InterContinental%20Durrat%20Al%20Riyadh.jpg" style="border-style:solid; border-width:20px; height:225px; width:450px" /><img alt="" src="https://www.vzavtra.net/wp-content/uploads/2021/03/foster-partners-saudi-arabia-red-sea-project-ummahat-alshaykh-hotel-12_2364_hero_4-2048x1151-1-1200x750.jpg" style="border-style:solid; border-width:20px; height:281px; width:450px" /></span></p>	49
43	<h1>Отель Орион - не только место для отдыха</h1>\r\n\r\n<p>В&nbsp;отеле &laquo;Орион&raquo; - это не только место для отдыха и проживания, но и идеальное место для проведения деловых и культурных мероприятий в самом центре Бишкека. Конференц-зал - прекрасный выбор для тех, кто ищет место для проведения важных мероприятий в комфортном и уютном атмосферном. Современное оборудование и внимательный персонал гарантируют, что каждое мероприятие.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1280x900/90380318.jpg?k=ee36e562d879ad53ef3ca4f3b2b18e7d45bd84dfa970380eb2ebfc52f3c636cd&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1280x900/81925038.jpg?k=e33b18be94dee42271bf5184377dd4d21cf5a7c86dabe62a26e12ea77ddfb9c0&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /></span></p>	51
44	<h1>Palazzo - ресторан премиум-класса</h1>\r\n\r\n<p>Конференц-зал &laquo;Ак-Сай&raquo; имеет площадь в&nbsp;123&nbsp;квадратных метра, а&nbsp;его&nbsp;вместимость составляет от&nbsp;35&nbsp;до&nbsp;100&nbsp;человек в&nbsp;зависимости от&nbsp;рассадки. П-образная рассадка вмещает до&nbsp;30&nbsp;человек, а&nbsp;в&nbsp;театральной версии зала могут поместиться до&nbsp;100&nbsp;гостей.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1280x900/287471499.jpg?k=21dc7900777473c089f4745df4464b00f5c8039b75d1de8451e7ec821e03753e&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1280x900/287471508.jpg?k=29405f8c72b3e6fc23f9a52da4b70611ab98a48e78220225a28b46b343ee5fce&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /></span></p>	54
45	<h1>Миссия - За гранью обычного</h1>\r\n\r\n<p>Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников. Главная цель - превзойти ожидания наших гостей. Орион - больше, чем отель! Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1280x900/287471958.jpg?k=29348e0c255c2dc1282d91701cf82732b4e14777e3c330928a24c0ded5240c5e&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1280x900/297020794.jpg?k=c3b8a4e20cd2900bca7453af3803dc1a2d272e62f8e3a21ca383ae397650da57&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:263px; width:450px" /></span></p>	56
46	<h1>Sumbule - SPA центр незабываемого веселье</h1>\r\n\r\n<p>Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников. Главная цель - превзойти ожидания наших гостей. Орион - больше, чем отель! Мы видим свое предназначение в том, чтобы объединить мир через истинное кыргызское гостеприимство и национальную культуру. Через улучшение качества сервиса, обеспечивать процветание компании и сотрудников.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1280x900/310927549.jpg?k=0de36a249d46562ef60a45cd9d05c955fd4700a9016e67c1ad7e5d328ecc00d1&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1280x900/310927551.jpg?k=89b8a66e2a3a1bb3cfe02e4e33362dce15ee8c86dbc2d48e04b45411c2d5f18f&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:300px; width:450px" /></span></p>	57
47	<h1>UNO City - новый город-курорт в Кыргызстане</h1>\r\n\r\n<p>В&nbsp;отеле &laquo;Орион&raquo; - это не только место для отдыха и проживания, но и идеальное место для проведения деловых и культурных мероприятий в самом центре Бишкека. Конференц-зал - прекрасный выбор для тех, кто ищет место для проведения важных мероприятий в комфортном и уютном атмосферном. Современное оборудование и внимательный персонал гарантируют, что каждое мероприятие.</p>\r\n\r\n<p><span style="color:#ffffff"><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1280x900/478219186.jpg?k=8222e08e12cce368a192c2a79a4144895bb4da8a8004212174fdb07280c29ab9&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:675px; width:450px" /><img alt="" src="https://cf.bstatic.com/xdata/images/hotel/max1280x900/100083446.jpg?k=4b2c45a50ffff255c349eacb71f74a4d2ec2a07f6e862877a394d4acaaf221c3&amp;o=&amp;hp=1" style="border-style:solid; border-width:20px; height:253px; width:450px" /></span></p>	62
\.


--
-- Data for Name: main_slider; Type: TABLE DATA; Schema: public; Owner: navis
--

COPY public.main_slider (id, image, title, description) FROM stdin;
1	5_2.png	Монолит - создаем надежность и комфорт вместе!	-это первый в своем роде комплекс, который объединяет в себе бизнес-центр и торговый комплекс
2	2_1.png	Монолит - создаем надежность и комфорт вместе!	-это первый в своем роде комплекс, который объединяет в себе бизнес-центр и торговый комплекс
3	2_1_L2TLPfG.png	Монолит - создаем надежность и комфорт вместе!	-это первый в своем роде комплекс, который объединяет в себе бизнес-центр и торговый комплекс
\.


--
-- Data for Name: main_subheader; Type: TABLE DATA; Schema: public; Owner: navis
--

COPY public.main_subheader (id, slug, header_id, title) FROM stdin;
4	otel	2	Отель
5	restoran	2	Ресторан
6	restoran	2	Ресторан
7	otel	4	Отель
9	otel	3	Отель
10	restoran	3	Ресторан
11	spa-salony	3	Спа-салоны
12	otel	6	Отель
13	restoran	6	Ресторан
14	spa-salony	6	Спа-салоны
15	otel	1	Отель
16	restoran	1	Ресторан
17	spa-salony	1	Спа-салоны
20	spa-salony	13	Спа салоны
\.


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: navis
--

COPY public.users_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, phone, user_type, code, activated) FROM stdin;
\.


--
-- Data for Name: users_user_groups; Type: TABLE DATA; Schema: public; Owner: navis
--

COPY public.users_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: navis
--

COPY public.users_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: navis
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: navis
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: navis
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 56, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: navis
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: navis
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: navis
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: navis
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 124, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: navis
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 14, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: navis
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 34, true);


--
-- Name: main_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: navis
--

SELECT pg_catalog.setval('public.main_category_id_seq', 13, true);


--
-- Name: main_resident_id_seq; Type: SEQUENCE SET; Schema: public; Owner: navis
--

SELECT pg_catalog.setval('public.main_resident_id_seq', 62, true);


--
-- Name: main_residentdetail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: navis
--

SELECT pg_catalog.setval('public.main_residentdetail_id_seq', 47, true);


--
-- Name: main_slider_id_seq; Type: SEQUENCE SET; Schema: public; Owner: navis
--

SELECT pg_catalog.setval('public.main_slider_id_seq', 3, true);


--
-- Name: main_subheader_id_seq; Type: SEQUENCE SET; Schema: public; Owner: navis
--

SELECT pg_catalog.setval('public.main_subheader_id_seq', 20, true);


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: navis
--

SELECT pg_catalog.setval('public.users_user_groups_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: navis
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, false);


--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: navis
--

SELECT pg_catalog.setval('public.users_user_user_permissions_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: main_category main_category_pkey; Type: CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.main_category
    ADD CONSTRAINT main_category_pkey PRIMARY KEY (id);


--
-- Name: main_resident main_resident_pkey; Type: CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.main_resident
    ADD CONSTRAINT main_resident_pkey PRIMARY KEY (id);


--
-- Name: main_resident main_resident_slug_key; Type: CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.main_resident
    ADD CONSTRAINT main_resident_slug_key UNIQUE (slug);


--
-- Name: main_residentdetail main_residentdetail_pkey; Type: CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.main_residentdetail
    ADD CONSTRAINT main_residentdetail_pkey PRIMARY KEY (id);


--
-- Name: main_slider main_slider_pkey; Type: CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.main_slider
    ADD CONSTRAINT main_slider_pkey PRIMARY KEY (id);


--
-- Name: main_subheader main_subheader_pkey; Type: CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.main_subheader
    ADD CONSTRAINT main_subheader_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups users_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups users_user_groups_user_id_group_id_b88eab82_uniq; Type: CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);


--
-- Name: users_user users_user_phone_key; Type: CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_phone_key UNIQUE (phone);


--
-- Name: users_user users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_permission_id_43338c45_uniq; Type: CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);


--
-- Name: users_user users_user_username_key; Type: CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_username_key UNIQUE (username);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: navis
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: navis
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: navis
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: navis
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: navis
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: navis
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: navis
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: navis
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: navis
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: navis
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: navis
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: navis
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: navis
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: main_category_slug_7ae6758d; Type: INDEX; Schema: public; Owner: navis
--

CREATE INDEX main_category_slug_7ae6758d ON public.main_category USING btree (slug);


--
-- Name: main_category_slug_7ae6758d_like; Type: INDEX; Schema: public; Owner: navis
--

CREATE INDEX main_category_slug_7ae6758d_like ON public.main_category USING btree (slug varchar_pattern_ops);


--
-- Name: main_resident_category_id_d4b615ab; Type: INDEX; Schema: public; Owner: navis
--

CREATE INDEX main_resident_category_id_d4b615ab ON public.main_resident USING btree (header_id);


--
-- Name: main_resident_name_id_3db20dde; Type: INDEX; Schema: public; Owner: navis
--

CREATE INDEX main_resident_name_id_3db20dde ON public.main_resident USING btree (name_id);


--
-- Name: main_resident_slug_9bd03034_like; Type: INDEX; Schema: public; Owner: navis
--

CREATE INDEX main_resident_slug_9bd03034_like ON public.main_resident USING btree (slug varchar_pattern_ops);


--
-- Name: main_residentdetail_key_id_29ba28bd; Type: INDEX; Schema: public; Owner: navis
--

CREATE INDEX main_residentdetail_key_id_29ba28bd ON public.main_residentdetail USING btree (key_id);


--
-- Name: main_subheader_header_id_f463b3c0; Type: INDEX; Schema: public; Owner: navis
--

CREATE INDEX main_subheader_header_id_f463b3c0 ON public.main_subheader USING btree (header_id);


--
-- Name: main_subheader_slug_061e301f; Type: INDEX; Schema: public; Owner: navis
--

CREATE INDEX main_subheader_slug_061e301f ON public.main_subheader USING btree (slug);


--
-- Name: main_subheader_slug_061e301f_like; Type: INDEX; Schema: public; Owner: navis
--

CREATE INDEX main_subheader_slug_061e301f_like ON public.main_subheader USING btree (slug varchar_pattern_ops);


--
-- Name: users_user_groups_group_id_9afc8d0e; Type: INDEX; Schema: public; Owner: navis
--

CREATE INDEX users_user_groups_group_id_9afc8d0e ON public.users_user_groups USING btree (group_id);


--
-- Name: users_user_groups_user_id_5f6f5a90; Type: INDEX; Schema: public; Owner: navis
--

CREATE INDEX users_user_groups_user_id_5f6f5a90 ON public.users_user_groups USING btree (user_id);


--
-- Name: users_user_phone_fe37f55c_like; Type: INDEX; Schema: public; Owner: navis
--

CREATE INDEX users_user_phone_fe37f55c_like ON public.users_user USING btree (phone varchar_pattern_ops);


--
-- Name: users_user_user_permissions_permission_id_0b93982e; Type: INDEX; Schema: public; Owner: navis
--

CREATE INDEX users_user_user_permissions_permission_id_0b93982e ON public.users_user_user_permissions USING btree (permission_id);


--
-- Name: users_user_user_permissions_user_id_20aca447; Type: INDEX; Schema: public; Owner: navis
--

CREATE INDEX users_user_user_permissions_user_id_20aca447 ON public.users_user_user_permissions USING btree (user_id);


--
-- Name: users_user_username_06e46fe6_like; Type: INDEX; Schema: public; Owner: navis
--

CREATE INDEX users_user_username_06e46fe6_like ON public.users_user USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_resident main_resident_header_id_88d7e13e_fk_main_category_id; Type: FK CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.main_resident
    ADD CONSTRAINT main_resident_header_id_88d7e13e_fk_main_category_id FOREIGN KEY (header_id) REFERENCES public.main_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_resident main_resident_name_id_3db20dde_fk_main_subheader_id; Type: FK CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.main_resident
    ADD CONSTRAINT main_resident_name_id_3db20dde_fk_main_subheader_id FOREIGN KEY (name_id) REFERENCES public.main_subheader(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_residentdetail main_residentdetail_key_id_29ba28bd_fk_main_resident_id; Type: FK CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.main_residentdetail
    ADD CONSTRAINT main_residentdetail_key_id_29ba28bd_fk_main_resident_id FOREIGN KEY (key_id) REFERENCES public.main_resident(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_subheader main_subheader_header_id_f463b3c0_fk_main_category_id; Type: FK CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.main_subheader
    ADD CONSTRAINT main_subheader_header_id_f463b3c0_fk_main_category_id FOREIGN KEY (header_id) REFERENCES public.main_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_group_id_9afc8d0e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_user_id_5f6f5a90_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_perm_permission_id_0b93982e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_20aca447_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: navis
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

