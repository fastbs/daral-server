PGDMP         :                z            menuDB    15.1    15.1 Y    f           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            g           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            h           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            i           1262    16398    menuDB    DATABASE     |   CREATE DATABASE "menuDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "menuDB";
                postgres    false                        2615    16444    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            j           0    0    SCHEMA public    COMMENT         COMMENT ON SCHEMA public IS '';
                   postgres    false    5            k           0    0    SCHEMA public    ACL     +   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
                   postgres    false    5            ?            1259    16989    Menu    TABLE     ?   CREATE TABLE public."Menu" (
    id integer NOT NULL,
    name text NOT NULL,
    route text NOT NULL,
    icon text,
    "order" integer
);
    DROP TABLE public."Menu";
       public         heap    postgres    false    5            ?            1259    16998    MenuRole    TABLE     h   CREATE TABLE public."MenuRole" (
    id integer NOT NULL,
    "menuId" integer,
    "roleId" integer
);
    DROP TABLE public."MenuRole";
       public         heap    postgres    false    5            ?            1259    16997    MenuRole_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."MenuRole_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."MenuRole_id_seq";
       public          postgres    false    5    224            l           0    0    MenuRole_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."MenuRole_id_seq" OWNED BY public."MenuRole".id;
          public          postgres    false    223            ?            1259    16988    Menu_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Menu_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."Menu_id_seq";
       public          postgres    false    5    222            m           0    0    Menu_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."Menu_id_seq" OWNED BY public."Menu".id;
          public          postgres    false    221            ?            1259    18009    ResMenuCategory    TABLE     z   CREATE TABLE public."ResMenuCategory" (
    id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL
);
 %   DROP TABLE public."ResMenuCategory";
       public         heap    postgres    false    5            ?            1259    18008    ResMenuCategory_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."ResMenuCategory_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."ResMenuCategory_id_seq";
       public          postgres    false    232    5            n           0    0    ResMenuCategory_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."ResMenuCategory_id_seq" OWNED BY public."ResMenuCategory".id;
          public          postgres    false    231            ?            1259    18018    ResMenuItem    TABLE     ?   CREATE TABLE public."ResMenuItem" (
    id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    "categoryId" integer NOT NULL,
    filename text
);
 !   DROP TABLE public."ResMenuItem";
       public         heap    postgres    false    5            ?            1259    18017    ResMenuItem_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."ResMenuItem_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."ResMenuItem_id_seq";
       public          postgres    false    234    5            o           0    0    ResMenuItem_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."ResMenuItem_id_seq" OWNED BY public."ResMenuItem".id;
          public          postgres    false    233            ?            1259    17005    Resource    TABLE     t   CREATE TABLE public."Resource" (
    id integer NOT NULL,
    route text NOT NULL,
    description text NOT NULL
);
    DROP TABLE public."Resource";
       public         heap    postgres    false    5            ?            1259    17014    ResourceAction    TABLE     t   CREATE TABLE public."ResourceAction" (
    id integer NOT NULL,
    name text NOT NULL,
    "resourceId" integer
);
 $   DROP TABLE public."ResourceAction";
       public         heap    postgres    false    5            ?            1259    17023    ResourceActionRoles    TABLE     }   CREATE TABLE public."ResourceActionRoles" (
    id integer NOT NULL,
    "resourceActionId" integer,
    "roleId" integer
);
 )   DROP TABLE public."ResourceActionRoles";
       public         heap    postgres    false    5            ?            1259    17022    ResourceActionRoles_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."ResourceActionRoles_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public."ResourceActionRoles_id_seq";
       public          postgres    false    5    230            p           0    0    ResourceActionRoles_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public."ResourceActionRoles_id_seq" OWNED BY public."ResourceActionRoles".id;
          public          postgres    false    229            ?            1259    17013    ResourceAction_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."ResourceAction_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."ResourceAction_id_seq";
       public          postgres    false    228    5            q           0    0    ResourceAction_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."ResourceAction_id_seq" OWNED BY public."ResourceAction".id;
          public          postgres    false    227            ?            1259    17004    Resource_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Resource_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Resource_id_seq";
       public          postgres    false    226    5            r           0    0    Resource_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Resource_id_seq" OWNED BY public."Resource".id;
          public          postgres    false    225            ?            1259    16973    Role    TABLE     P   CREATE TABLE public."Role" (
    id integer NOT NULL,
    name text NOT NULL
);
    DROP TABLE public."Role";
       public         heap    postgres    false    5            ?            1259    16972    Role_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Role_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."Role_id_seq";
       public          postgres    false    218    5            s           0    0    Role_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."Role_id_seq" OWNED BY public."Role".id;
          public          postgres    false    217            ?            1259    16722    User    TABLE     s   CREATE TABLE public."User" (
    id integer NOT NULL,
    email text NOT NULL,
    name text,
    password text
);
    DROP TABLE public."User";
       public         heap    postgres    false    5            ?            1259    16982    UserRole    TABLE     h   CREATE TABLE public."UserRole" (
    id integer NOT NULL,
    "userId" integer,
    "roleId" integer
);
    DROP TABLE public."UserRole";
       public         heap    postgres    false    5            ?            1259    16981    UserRole_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."UserRole_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."UserRole_id_seq";
       public          postgres    false    220    5            t           0    0    UserRole_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."UserRole_id_seq" OWNED BY public."UserRole".id;
          public          postgres    false    219            ?            1259    16721    User_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."User_id_seq";
       public          postgres    false    5    216            u           0    0    User_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;
          public          postgres    false    215            ?            1259    16710    _prisma_migrations    TABLE     ?  CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);
 &   DROP TABLE public._prisma_migrations;
       public         heap    postgres    false    5            ?           2604    16992    Menu id    DEFAULT     f   ALTER TABLE ONLY public."Menu" ALTER COLUMN id SET DEFAULT nextval('public."Menu_id_seq"'::regclass);
 8   ALTER TABLE public."Menu" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            ?           2604    17001    MenuRole id    DEFAULT     n   ALTER TABLE ONLY public."MenuRole" ALTER COLUMN id SET DEFAULT nextval('public."MenuRole_id_seq"'::regclass);
 <   ALTER TABLE public."MenuRole" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223    224            ?           2604    18012    ResMenuCategory id    DEFAULT     |   ALTER TABLE ONLY public."ResMenuCategory" ALTER COLUMN id SET DEFAULT nextval('public."ResMenuCategory_id_seq"'::regclass);
 C   ALTER TABLE public."ResMenuCategory" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    232    232            ?           2604    18021    ResMenuItem id    DEFAULT     t   ALTER TABLE ONLY public."ResMenuItem" ALTER COLUMN id SET DEFAULT nextval('public."ResMenuItem_id_seq"'::regclass);
 ?   ALTER TABLE public."ResMenuItem" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    234    234            ?           2604    17008    Resource id    DEFAULT     n   ALTER TABLE ONLY public."Resource" ALTER COLUMN id SET DEFAULT nextval('public."Resource_id_seq"'::regclass);
 <   ALTER TABLE public."Resource" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225    226            ?           2604    17017    ResourceAction id    DEFAULT     z   ALTER TABLE ONLY public."ResourceAction" ALTER COLUMN id SET DEFAULT nextval('public."ResourceAction_id_seq"'::regclass);
 B   ALTER TABLE public."ResourceAction" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    228    228            ?           2604    17026    ResourceActionRoles id    DEFAULT     ?   ALTER TABLE ONLY public."ResourceActionRoles" ALTER COLUMN id SET DEFAULT nextval('public."ResourceActionRoles_id_seq"'::regclass);
 G   ALTER TABLE public."ResourceActionRoles" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229    230            ?           2604    16976    Role id    DEFAULT     f   ALTER TABLE ONLY public."Role" ALTER COLUMN id SET DEFAULT nextval('public."Role_id_seq"'::regclass);
 8   ALTER TABLE public."Role" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            ?           2604    16725    User id    DEFAULT     f   ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);
 8   ALTER TABLE public."User" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            ?           2604    16985    UserRole id    DEFAULT     n   ALTER TABLE ONLY public."UserRole" ALTER COLUMN id SET DEFAULT nextval('public."UserRole_id_seq"'::regclass);
 <   ALTER TABLE public."UserRole" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            W          0    16989    Menu 
   TABLE DATA           @   COPY public."Menu" (id, name, route, icon, "order") FROM stdin;
    public          postgres    false    222   ?d       Y          0    16998    MenuRole 
   TABLE DATA           <   COPY public."MenuRole" (id, "menuId", "roleId") FROM stdin;
    public          postgres    false    224   ?e       a          0    18009    ResMenuCategory 
   TABLE DATA           B   COPY public."ResMenuCategory" (id, name, description) FROM stdin;
    public          postgres    false    232   f       c          0    18018    ResMenuItem 
   TABLE DATA           V   COPY public."ResMenuItem" (id, name, description, "categoryId", filename) FROM stdin;
    public          postgres    false    234   ?f       [          0    17005    Resource 
   TABLE DATA           <   COPY public."Resource" (id, route, description) FROM stdin;
    public          postgres    false    226   9g       ]          0    17014    ResourceAction 
   TABLE DATA           B   COPY public."ResourceAction" (id, name, "resourceId") FROM stdin;
    public          postgres    false    228   zg       _          0    17023    ResourceActionRoles 
   TABLE DATA           Q   COPY public."ResourceActionRoles" (id, "resourceActionId", "roleId") FROM stdin;
    public          postgres    false    230   ?g       S          0    16973    Role 
   TABLE DATA           *   COPY public."Role" (id, name) FROM stdin;
    public          postgres    false    218   ?g       Q          0    16722    User 
   TABLE DATA           ;   COPY public."User" (id, email, name, password) FROM stdin;
    public          postgres    false    216   6h       U          0    16982    UserRole 
   TABLE DATA           <   COPY public."UserRole" (id, "userId", "roleId") FROM stdin;
    public          postgres    false    220   ?h       O          0    16710    _prisma_migrations 
   TABLE DATA           ?   COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
    public          postgres    false    214   ?h       v           0    0    MenuRole_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."MenuRole_id_seq"', 86, true);
          public          postgres    false    223            w           0    0    Menu_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Menu_id_seq"', 56, true);
          public          postgres    false    221            x           0    0    ResMenuCategory_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."ResMenuCategory_id_seq"', 1, false);
          public          postgres    false    231            y           0    0    ResMenuItem_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."ResMenuItem_id_seq"', 36, true);
          public          postgres    false    233            z           0    0    ResourceActionRoles_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public."ResourceActionRoles_id_seq"', 1, false);
          public          postgres    false    229            {           0    0    ResourceAction_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."ResourceAction_id_seq"', 5, true);
          public          postgres    false    227            |           0    0    Resource_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Resource_id_seq"', 2, true);
          public          postgres    false    225            }           0    0    Role_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Role_id_seq"', 1, false);
          public          postgres    false    217            ~           0    0    UserRole_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."UserRole_id_seq"', 24, true);
          public          postgres    false    219                       0    0    User_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."User_id_seq"', 10, true);
          public          postgres    false    215            ?           2606    17003    MenuRole MenuRole_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."MenuRole"
    ADD CONSTRAINT "MenuRole_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."MenuRole" DROP CONSTRAINT "MenuRole_pkey";
       public            postgres    false    224            ?           2606    16996    Menu Menu_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Menu"
    ADD CONSTRAINT "Menu_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Menu" DROP CONSTRAINT "Menu_pkey";
       public            postgres    false    222            ?           2606    18016 $   ResMenuCategory ResMenuCategory_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."ResMenuCategory"
    ADD CONSTRAINT "ResMenuCategory_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public."ResMenuCategory" DROP CONSTRAINT "ResMenuCategory_pkey";
       public            postgres    false    232            ?           2606    18025    ResMenuItem ResMenuItem_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."ResMenuItem"
    ADD CONSTRAINT "ResMenuItem_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."ResMenuItem" DROP CONSTRAINT "ResMenuItem_pkey";
       public            postgres    false    234            ?           2606    17028 ,   ResourceActionRoles ResourceActionRoles_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."ResourceActionRoles"
    ADD CONSTRAINT "ResourceActionRoles_pkey" PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public."ResourceActionRoles" DROP CONSTRAINT "ResourceActionRoles_pkey";
       public            postgres    false    230            ?           2606    17021 "   ResourceAction ResourceAction_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."ResourceAction"
    ADD CONSTRAINT "ResourceAction_pkey" PRIMARY KEY (id);
 P   ALTER TABLE ONLY public."ResourceAction" DROP CONSTRAINT "ResourceAction_pkey";
       public            postgres    false    228            ?           2606    17012    Resource Resource_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Resource"
    ADD CONSTRAINT "Resource_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Resource" DROP CONSTRAINT "Resource_pkey";
       public            postgres    false    226            ?           2606    16980    Role Role_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Role"
    ADD CONSTRAINT "Role_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Role" DROP CONSTRAINT "Role_pkey";
       public            postgres    false    218            ?           2606    16987    UserRole UserRole_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."UserRole"
    ADD CONSTRAINT "UserRole_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."UserRole" DROP CONSTRAINT "UserRole_pkey";
       public            postgres    false    220            ?           2606    16729    User User_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_pkey";
       public            postgres    false    216            ?           2606    16718 *   _prisma_migrations _prisma_migrations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public._prisma_migrations DROP CONSTRAINT _prisma_migrations_pkey;
       public            postgres    false    214            ?           1259    16740    User_email_key    INDEX     K   CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);
 $   DROP INDEX public."User_email_key";
       public            postgres    false    216            ?           2606    17039    MenuRole MenuRole_menuId_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."MenuRole"
    ADD CONSTRAINT "MenuRole_menuId_fkey" FOREIGN KEY ("menuId") REFERENCES public."Menu"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public."MenuRole" DROP CONSTRAINT "MenuRole_menuId_fkey";
       public          postgres    false    224    222    3244            ?           2606    17044    MenuRole MenuRole_roleId_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."MenuRole"
    ADD CONSTRAINT "MenuRole_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public."Role"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public."MenuRole" DROP CONSTRAINT "MenuRole_roleId_fkey";
       public          postgres    false    224    218    3240            ?           2606    18035 '   ResMenuItem ResMenuItem_categoryId_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."ResMenuItem"
    ADD CONSTRAINT "ResMenuItem_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public."ResMenuCategory"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 U   ALTER TABLE ONLY public."ResMenuItem" DROP CONSTRAINT "ResMenuItem_categoryId_fkey";
       public          postgres    false    3254    232    234            ?           2606    17054 =   ResourceActionRoles ResourceActionRoles_resourceActionId_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."ResourceActionRoles"
    ADD CONSTRAINT "ResourceActionRoles_resourceActionId_fkey" FOREIGN KEY ("resourceActionId") REFERENCES public."ResourceAction"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 k   ALTER TABLE ONLY public."ResourceActionRoles" DROP CONSTRAINT "ResourceActionRoles_resourceActionId_fkey";
       public          postgres    false    3250    230    228            ?           2606    17059 3   ResourceActionRoles ResourceActionRoles_roleId_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."ResourceActionRoles"
    ADD CONSTRAINT "ResourceActionRoles_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public."Role"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 a   ALTER TABLE ONLY public."ResourceActionRoles" DROP CONSTRAINT "ResourceActionRoles_roleId_fkey";
       public          postgres    false    218    230    3240            ?           2606    17049 -   ResourceAction ResourceAction_resourceId_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."ResourceAction"
    ADD CONSTRAINT "ResourceAction_resourceId_fkey" FOREIGN KEY ("resourceId") REFERENCES public."Resource"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 [   ALTER TABLE ONLY public."ResourceAction" DROP CONSTRAINT "ResourceAction_resourceId_fkey";
       public          postgres    false    228    3248    226            ?           2606    17034    UserRole UserRole_roleId_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."UserRole"
    ADD CONSTRAINT "UserRole_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public."Role"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public."UserRole" DROP CONSTRAINT "UserRole_roleId_fkey";
       public          postgres    false    3240    218    220            ?           2606    17029    UserRole UserRole_userId_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."UserRole"
    ADD CONSTRAINT "UserRole_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public."UserRole" DROP CONSTRAINT "UserRole_userId_fkey";
       public          postgres    false    220    216    3238            W   ?   x?5??
?0?????E|q?Eps)5??6)m????`AG|???????L#ݾ?>??_|?[XT??ʄ?W?f????U??l???\???%?Re?????8?Z(Zd??R??!?=?3~??;?????̙[??$ O?`vV?٫؃ޥ?????juZs?z?T??Nn?0$?!???_B      Y   9   x????@B?3????1k1?_?dO?? \b??FC?
???Z??n?????n??b?	?      a   b   x?M??	?@D??*?A????L#?=?Oo;r3ex?oJ???î???ѓ?l?Vo#kǥ?????T?????h??M?-??sx?O??)u!"/?L?      c   ?   x?U??
?0???)J???B??E$Ji:???*8?;."?!B+??????A???????K.? ???%??Nht>?,+k?e*ʫOΰx?̝??Q?O?6???3??\?n"e?ps?տ%qE????fzTƢ\U?P???Q?A?oJ?)??Rl?l??8?_3?nm      [   1   x?3??M?+??0???{/?)\l???b?Ŧ????^?????? ´?      ]   3   x?3?LK-I??4?2?LO-?Ɯ?? ?	gA)?6?LI?I-I2c???? GW      _   -   x??9 0?????{C&?q??J?P?6)??MF?_???????      S   ,   x??5??K,-??/ʬJM?2?tL????2?-N-?????? ?
-      Q   u   x?3??Mu??ON??K???LL????44261??5?,?K,-??/ʬJMA???qq??!iq?z?!r???9zE??y?ٙ%?P9??????dnjJ?D???X??V#?t? I?7      U   2   x???	  ?wҋbr?Y???a??aA,%???
6?S8??x'???      O   U  x?m?Mn1?דSd?<?_W?? ???"?Y????? ?Ϣ?s????PjF??E?{??Q ħ7?v????g?ޕ	?o?̩<?P?J?c&$1??.?t?r*H??????BrfP????)?>?+?????????????L????Q???H_X??*$????S????N??_ȶ?rm+?2XjȚk?D?tT?.U\;
[??N?????Y6ođ?HX???????/???E??Ư>??\ev?"#???(.?Z???:!0?S߱VkA1?h????F???fK??????cHB?G
???H?sU%?????]?k?=???y??1Ļ]*?????1`??C?ei#????\?K?	q???$?ҡU?k?ƌh?v.?B???SE?b??2???(?G?֋?????
	V??????/:???"R+8V?o`???Y?F.???vڭ?
u??=Rv	???9\@i:??)[mu?????v ??\??޻???AZEt???????P?????2??ԋ,????E??RM?d??	]۲5??l!???.?d?0fY??C?
8|?h8R _?vΰ??
?+^????|??c?sx???????/??     