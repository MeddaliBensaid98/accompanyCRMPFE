PGDMP          	            |            Dataware    16.1    16.1 f    %           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            &           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            '           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            (           1262    208753    Dataware    DATABASE     }   CREATE DATABASE "Dataware" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'French_France.1252';
    DROP DATABASE "Dataware";
                postgres    false            �            1259    208812    Dim BU    TABLE     y   CREATE TABLE public."Dim BU" (
    "Key_Bu" integer NOT NULL,
    id integer NOT NULL,
    "typeBu" character varying
);
    DROP TABLE public."Dim BU";
       public         heap    postgres    false            �            1259    208811    Dim BU_Key_Bu_seq    SEQUENCE     �   CREATE SEQUENCE public."Dim BU_Key_Bu_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Dim BU_Key_Bu_seq";
       public          postgres    false    221            )           0    0    Dim BU_Key_Bu_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."Dim BU_Key_Bu_seq" OWNED BY public."Dim BU"."Key_Bu";
          public          postgres    false    220            �            1259    208895    Dim BU_id_seq    SEQUENCE     �   ALTER TABLE public."Dim BU" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Dim BU_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    221            �            1259    208854    dim ResultatOffre    TABLE     �   CREATE TABLE public."dim ResultatOffre" (
    "key_ResultatOffre" integer NOT NULL,
    id integer NOT NULL,
    "Resultat" character varying
);
 '   DROP TABLE public."dim ResultatOffre";
       public         heap    postgres    false            �            1259    208902    dim ResultatOffre_id_seq    SEQUENCE     �   ALTER TABLE public."dim ResultatOffre" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."dim ResultatOffre_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    228            �            1259    208853 '   dim ResultatOffre_key_ResultatOffre_seq    SEQUENCE     �   CREATE SEQUENCE public."dim ResultatOffre_key_ResultatOffre_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public."dim ResultatOffre_key_ResultatOffre_seq";
       public          postgres    false    228            *           0    0 '   dim ResultatOffre_key_ResultatOffre_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public."dim ResultatOffre_key_ResultatOffre_seq" OWNED BY public."dim ResultatOffre"."key_ResultatOffre";
          public          postgres    false    227            �            1259    208795    dim country    TABLE     ~   CREATE TABLE public."dim country" (
    "Key_county" integer NOT NULL,
    id integer NOT NULL,
    name character varying
);
 !   DROP TABLE public."dim country";
       public         heap    postgres    false            �            1259    208794    dim country_Key_county_seq    SEQUENCE     �   CREATE SEQUENCE public."dim country_Key_county_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public."dim country_Key_county_seq";
       public          postgres    false    216            +           0    0    dim country_Key_county_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public."dim country_Key_county_seq" OWNED BY public."dim country"."Key_county";
          public          postgres    false    215            �            1259    208803    dim country_id_seq    SEQUENCE     �   ALTER TABLE public."dim country" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."dim country_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            �            1259    208805    dim date    TABLE     �   CREATE TABLE public."dim date" (
    key_date integer NOT NULL,
    id integer NOT NULL,
    date_de_creation date,
    date_de_remise date
);
    DROP TABLE public."dim date";
       public         heap    postgres    false            �            1259    208901    dim date_id_seq    SEQUENCE     �   ALTER TABLE public."dim date" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."dim date_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    219            �            1259    208804    dim date_key_date_seq    SEQUENCE     �   CREATE SEQUENCE public."dim date_key_date_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."dim date_key_date_seq";
       public          postgres    false    219            ,           0    0    dim date_key_date_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."dim date_key_date_seq" OWNED BY public."dim date".key_date;
          public          postgres    false    218            �            1259    208872    dim departement    TABLE     �   CREATE TABLE public."dim departement" (
    key_departement integer NOT NULL,
    id integer NOT NULL,
    "Nom du departement" character varying
);
 %   DROP TABLE public."dim departement";
       public         heap    postgres    false            �            1259    208900    dim departement_id_seq    SEQUENCE     �   ALTER TABLE public."dim departement" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."dim departement_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    232            �            1259    208871 #   dim departement_key_departement_seq    SEQUENCE     �   CREATE SEQUENCE public."dim departement_key_departement_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public."dim departement_key_departement_seq";
       public          postgres    false    232            -           0    0 #   dim departement_key_departement_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public."dim departement_key_departement_seq" OWNED BY public."dim departement".key_departement;
          public          postgres    false    231            �            1259    208882 
   dim seteur    TABLE     �   CREATE TABLE public."dim seteur" (
    key_secteur integer NOT NULL,
    id integer NOT NULL,
    "Nom_du_secteur" character varying
);
     DROP TABLE public."dim seteur";
       public         heap    postgres    false            �            1259    208899    dim seteur_id_seq    SEQUENCE     �   ALTER TABLE public."dim seteur" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."dim seteur_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    234            �            1259    208881    dim seteur_key_secteur_seq    SEQUENCE     �   CREATE SEQUENCE public."dim seteur_key_secteur_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public."dim seteur_key_secteur_seq";
       public          postgres    false    234            .           0    0    dim seteur_key_secteur_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public."dim seteur_key_secteur_seq" OWNED BY public."dim seteur".key_secteur;
          public          postgres    false    233            �            1259    208834 
   dim_status    TABLE     �   CREATE TABLE public.dim_status (
    key_status integer NOT NULL,
    id integer NOT NULL,
    "libelle_Status" character varying,
    "key_ResultatOffre" integer
);
    DROP TABLE public.dim_status;
       public         heap    postgres    false            �            1259    208898    dim status_id_seq    SEQUENCE     �   ALTER TABLE public.dim_status ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."dim status_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    225            �            1259    208842     dim status_key_ResultatOffre_seq    SEQUENCE     �   CREATE SEQUENCE public."dim status_key_ResultatOffre_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public."dim status_key_ResultatOffre_seq";
       public          postgres    false    225            /           0    0     dim status_key_ResultatOffre_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public."dim status_key_ResultatOffre_seq" OWNED BY public.dim_status."key_ResultatOffre";
          public          postgres    false    226            �            1259    208833    dim status_key_status_seq    SEQUENCE     �   CREATE SEQUENCE public."dim status_key_status_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public."dim status_key_status_seq";
       public          postgres    false    225            0           0    0    dim status_key_status_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."dim status_key_status_seq" OWNED BY public.dim_status.key_status;
          public          postgres    false    224            �            1259    208824    dim transport    TABLE     �   CREATE TABLE public."dim transport" (
    "Key_transport" integer NOT NULL,
    id integer NOT NULL,
    "typeTransport" character varying
);
 #   DROP TABLE public."dim transport";
       public         heap    postgres    false            �            1259    208823    dim transport_Key_transport_seq    SEQUENCE     �   CREATE SEQUENCE public."dim transport_Key_transport_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public."dim transport_Key_transport_seq";
       public          postgres    false    223            1           0    0    dim transport_Key_transport_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public."dim transport_Key_transport_seq" OWNED BY public."dim transport"."Key_transport";
          public          postgres    false    222            �            1259    208897    dim transport_id_seq    SEQUENCE     �   ALTER TABLE public."dim transport" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."dim transport_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    223            �            1259    208863    dim type    TABLE     y   CREATE TABLE public."dim type" (
    "Key_type" integer NOT NULL,
    id integer NOT NULL,
    type character varying
);
    DROP TABLE public."dim type";
       public         heap    postgres    false            �            1259    208862    dim type_Key_type_seq    SEQUENCE     �   CREATE SEQUENCE public."dim type_Key_type_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."dim type_Key_type_seq";
       public          postgres    false    230            2           0    0    dim type_Key_type_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."dim type_Key_type_seq" OWNED BY public."dim type"."Key_type";
          public          postgres    false    229            �            1259    208896    dim type_id_seq    SEQUENCE     �   ALTER TABLE public."dim type" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."dim type_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    230            �            1259    208890 
   fact_offer    TABLE       CREATE TABLE public.fact_offer (
    "Key_BU" integer,
    "Key_Departement" integer,
    "Key_Date" integer,
    "Key_Country" integer,
    "Key_Secteur" integer,
    "Key_Type" integer,
    "key_Status" integer,
    "Key_transport" integer,
    titre character varying,
    "Caution" integer,
    "Montant" integer,
    "Resposable" character varying,
    "Manager" character varying,
    "Consultant" character varying,
    "Groupement" character varying,
    "Client" character varying,
    id integer NOT NULL
);
    DROP TABLE public.fact_offer;
       public         heap    postgres    false            �            1259    241594    fact_offer_id_seq    SEQUENCE     �   ALTER TABLE public.fact_offer ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.fact_offer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    235            S           2604    208815    Dim BU Key_Bu    DEFAULT     t   ALTER TABLE ONLY public."Dim BU" ALTER COLUMN "Key_Bu" SET DEFAULT nextval('public."Dim BU_Key_Bu_seq"'::regclass);
 @   ALTER TABLE public."Dim BU" ALTER COLUMN "Key_Bu" DROP DEFAULT;
       public          postgres    false    221    220    221            V           2604    208857 #   dim ResultatOffre key_ResultatOffre    DEFAULT     �   ALTER TABLE ONLY public."dim ResultatOffre" ALTER COLUMN "key_ResultatOffre" SET DEFAULT nextval('public."dim ResultatOffre_key_ResultatOffre_seq"'::regclass);
 V   ALTER TABLE public."dim ResultatOffre" ALTER COLUMN "key_ResultatOffre" DROP DEFAULT;
       public          postgres    false    227    228    228            Q           2604    208798    dim country Key_county    DEFAULT     �   ALTER TABLE ONLY public."dim country" ALTER COLUMN "Key_county" SET DEFAULT nextval('public."dim country_Key_county_seq"'::regclass);
 I   ALTER TABLE public."dim country" ALTER COLUMN "Key_county" DROP DEFAULT;
       public          postgres    false    216    215    216            R           2604    208808    dim date key_date    DEFAULT     z   ALTER TABLE ONLY public."dim date" ALTER COLUMN key_date SET DEFAULT nextval('public."dim date_key_date_seq"'::regclass);
 B   ALTER TABLE public."dim date" ALTER COLUMN key_date DROP DEFAULT;
       public          postgres    false    218    219    219            X           2604    208875    dim departement key_departement    DEFAULT     �   ALTER TABLE ONLY public."dim departement" ALTER COLUMN key_departement SET DEFAULT nextval('public."dim departement_key_departement_seq"'::regclass);
 P   ALTER TABLE public."dim departement" ALTER COLUMN key_departement DROP DEFAULT;
       public          postgres    false    231    232    232            Y           2604    208885    dim seteur key_secteur    DEFAULT     �   ALTER TABLE ONLY public."dim seteur" ALTER COLUMN key_secteur SET DEFAULT nextval('public."dim seteur_key_secteur_seq"'::regclass);
 G   ALTER TABLE public."dim seteur" ALTER COLUMN key_secteur DROP DEFAULT;
       public          postgres    false    234    233    234            T           2604    208827    dim transport Key_transport    DEFAULT     �   ALTER TABLE ONLY public."dim transport" ALTER COLUMN "Key_transport" SET DEFAULT nextval('public."dim transport_Key_transport_seq"'::regclass);
 N   ALTER TABLE public."dim transport" ALTER COLUMN "Key_transport" DROP DEFAULT;
       public          postgres    false    223    222    223            W           2604    208866    dim type Key_type    DEFAULT     |   ALTER TABLE ONLY public."dim type" ALTER COLUMN "Key_type" SET DEFAULT nextval('public."dim type_Key_type_seq"'::regclass);
 D   ALTER TABLE public."dim type" ALTER COLUMN "Key_type" DROP DEFAULT;
       public          postgres    false    229    230    230            U           2604    208837    dim_status key_status    DEFAULT     �   ALTER TABLE ONLY public.dim_status ALTER COLUMN key_status SET DEFAULT nextval('public."dim status_key_status_seq"'::regclass);
 D   ALTER TABLE public.dim_status ALTER COLUMN key_status DROP DEFAULT;
       public          postgres    false    225    224    225                      0    208812    Dim BU 
   TABLE DATA           :   COPY public."Dim BU" ("Key_Bu", id, "typeBu") FROM stdin;
    public          postgres    false    221   z                 0    208854    dim ResultatOffre 
   TABLE DATA           R   COPY public."dim ResultatOffre" ("key_ResultatOffre", id, "Resultat") FROM stdin;
    public          postgres    false    228   �z                 0    208795    dim country 
   TABLE DATA           ?   COPY public."dim country" ("Key_county", id, name) FROM stdin;
    public          postgres    false    216   V{       	          0    208805    dim date 
   TABLE DATA           T   COPY public."dim date" (key_date, id, date_de_creation, date_de_remise) FROM stdin;
    public          postgres    false    219   }                 0    208872    dim departement 
   TABLE DATA           V   COPY public."dim departement" (key_departement, id, "Nom du departement") FROM stdin;
    public          postgres    false    232   V�                 0    208882 
   dim seteur 
   TABLE DATA           I   COPY public."dim seteur" (key_secteur, id, "Nom_du_secteur") FROM stdin;
    public          postgres    false    234   ��                 0    208824    dim transport 
   TABLE DATA           O   COPY public."dim transport" ("Key_transport", id, "typeTransport") FROM stdin;
    public          postgres    false    223   ��                 0    208863    dim type 
   TABLE DATA           :   COPY public."dim type" ("Key_type", id, type) FROM stdin;
    public          postgres    false    230   U�                 0    208834 
   dim_status 
   TABLE DATA           [   COPY public.dim_status (key_status, id, "libelle_Status", "key_ResultatOffre") FROM stdin;
    public          postgres    false    225   	�                 0    208890 
   fact_offer 
   TABLE DATA           �   COPY public.fact_offer ("Key_BU", "Key_Departement", "Key_Date", "Key_Country", "Key_Secteur", "Key_Type", "key_Status", "Key_transport", titre, "Caution", "Montant", "Resposable", "Manager", "Consultant", "Groupement", "Client", id) FROM stdin;
    public          postgres    false    235   K�       3           0    0    Dim BU_Key_Bu_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Dim BU_Key_Bu_seq"', 44, true);
          public          postgres    false    220            4           0    0    Dim BU_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Dim BU_id_seq"', 43, true);
          public          postgres    false    236            5           0    0    dim ResultatOffre_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public."dim ResultatOffre_id_seq"', 465, true);
          public          postgres    false    243            6           0    0 '   dim ResultatOffre_key_ResultatOffre_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public."dim ResultatOffre_key_ResultatOffre_seq"', 465, true);
          public          postgres    false    227            7           0    0    dim country_Key_county_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."dim country_Key_county_seq"', 600, true);
          public          postgres    false    215            8           0    0    dim country_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."dim country_id_seq"', 599, true);
          public          postgres    false    217            9           0    0    dim date_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."dim date_id_seq"', 13800, true);
          public          postgres    false    242            :           0    0    dim date_key_date_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."dim date_key_date_seq"', 13800, true);
          public          postgres    false    218            ;           0    0    dim departement_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."dim departement_id_seq"', 25, true);
          public          postgres    false    241            <           0    0 #   dim departement_key_departement_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public."dim departement_key_departement_seq"', 25, true);
          public          postgres    false    231            =           0    0    dim seteur_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."dim seteur_id_seq"', 43, true);
          public          postgres    false    240            >           0    0    dim seteur_key_secteur_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public."dim seteur_key_secteur_seq"', 43, true);
          public          postgres    false    233            ?           0    0    dim status_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."dim status_id_seq"', 19874, true);
          public          postgres    false    239            @           0    0     dim status_key_ResultatOffre_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public."dim status_key_ResultatOffre_seq"', 1, false);
          public          postgres    false    226            A           0    0    dim status_key_status_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public."dim status_key_status_seq"', 19874, true);
          public          postgres    false    224            B           0    0    dim transport_Key_transport_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public."dim transport_Key_transport_seq"', 663, true);
          public          postgres    false    222            C           0    0    dim transport_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."dim transport_id_seq"', 663, true);
          public          postgres    false    238            D           0    0    dim type_Key_type_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."dim type_Key_type_seq"', 375, true);
          public          postgres    false    229            E           0    0    dim type_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."dim type_id_seq"', 375, true);
          public          postgres    false    237            F           0    0    fact_offer_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.fact_offer_id_seq', 294131, true);
          public          postgres    false    244            e           2606    208861 (   dim ResultatOffre dim ResultatOffre_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."dim ResultatOffre"
    ADD CONSTRAINT "dim ResultatOffre_pkey" PRIMARY KEY (id);
 V   ALTER TABLE ONLY public."dim ResultatOffre" DROP CONSTRAINT "dim ResultatOffre_pkey";
       public            postgres    false    228            [           2606    208802    dim country dim country_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."dim country"
    ADD CONSTRAINT "dim country_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."dim country" DROP CONSTRAINT "dim country_pkey";
       public            postgres    false    216            ]           2606    208810    dim date dim date_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."dim date"
    ADD CONSTRAINT "dim date_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."dim date" DROP CONSTRAINT "dim date_pkey";
       public            postgres    false    219            i           2606    208879 $   dim departement dim departement_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."dim departement"
    ADD CONSTRAINT "dim departement_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public."dim departement" DROP CONSTRAINT "dim departement_pkey";
       public            postgres    false    232            k           2606    208889    dim seteur dim seteur_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."dim seteur"
    ADD CONSTRAINT "dim seteur_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."dim seteur" DROP CONSTRAINT "dim seteur_pkey";
       public            postgres    false    234            c           2606    208841    dim_status dim status_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.dim_status
    ADD CONSTRAINT "dim status_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.dim_status DROP CONSTRAINT "dim status_pkey";
       public            postgres    false    225            a           2606    208831     dim transport dim transport_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."dim transport"
    ADD CONSTRAINT "dim transport_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."dim transport" DROP CONSTRAINT "dim transport_pkey";
       public            postgres    false    223            g           2606    208870    dim type dim type_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."dim type"
    ADD CONSTRAINT "dim type_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."dim type" DROP CONSTRAINT "dim type_pkey";
       public            postgres    false    230            _           2606    233315    Dim BU idbu 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Dim BU"
    ADD CONSTRAINT idbu PRIMARY KEY (id) INCLUDE ("Key_Bu");
 7   ALTER TABLE ONLY public."Dim BU" DROP CONSTRAINT idbu;
       public            postgres    false    221    221            m           2606    233413    fact_offer fkbu    FK CONSTRAINT     |   ALTER TABLE ONLY public.fact_offer
    ADD CONSTRAINT fkbu FOREIGN KEY ("Key_BU") REFERENCES public."Dim BU"(id) NOT VALID;
 9   ALTER TABLE ONLY public.fact_offer DROP CONSTRAINT fkbu;
       public          postgres    false    221    235    4703            n           2606    233326    fact_offer fkoffer_country    FK CONSTRAINT     �   ALTER TABLE ONLY public.fact_offer
    ADD CONSTRAINT fkoffer_country FOREIGN KEY ("Key_Country") REFERENCES public."dim country"(id) ON DELETE RESTRICT NOT VALID;
 D   ALTER TABLE ONLY public.fact_offer DROP CONSTRAINT fkoffer_country;
       public          postgres    false    216    235    4699            o           2606    233351    fact_offer fkoffer_date    FK CONSTRAINT     �   ALTER TABLE ONLY public.fact_offer
    ADD CONSTRAINT fkoffer_date FOREIGN KEY ("Key_Date") REFERENCES public."dim date"(id) ON DELETE RESTRICT NOT VALID;
 A   ALTER TABLE ONLY public.fact_offer DROP CONSTRAINT fkoffer_date;
       public          postgres    false    235    219    4701            p           2606    233336    fact_offer fkoffer_departement    FK CONSTRAINT     �   ALTER TABLE ONLY public.fact_offer
    ADD CONSTRAINT fkoffer_departement FOREIGN KEY ("Key_Departement") REFERENCES public."dim departement"(id) ON DELETE RESTRICT NOT VALID;
 H   ALTER TABLE ONLY public.fact_offer DROP CONSTRAINT fkoffer_departement;
       public          postgres    false    235    4713    232            q           2606    233331    fact_offer fkoffer_secteur    FK CONSTRAINT     �   ALTER TABLE ONLY public.fact_offer
    ADD CONSTRAINT fkoffer_secteur FOREIGN KEY ("Key_Secteur") REFERENCES public."dim seteur"(id) ON DELETE RESTRICT NOT VALID;
 D   ALTER TABLE ONLY public.fact_offer DROP CONSTRAINT fkoffer_secteur;
       public          postgres    false    235    4715    234            r           2606    233346    fact_offer fkoffer_transport    FK CONSTRAINT     �   ALTER TABLE ONLY public.fact_offer
    ADD CONSTRAINT fkoffer_transport FOREIGN KEY ("Key_transport") REFERENCES public."dim transport"(id) ON DELETE RESTRICT NOT VALID;
 F   ALTER TABLE ONLY public.fact_offer DROP CONSTRAINT fkoffer_transport;
       public          postgres    false    4705    223    235            s           2606    233321    fact_offer fkoffer_type    FK CONSTRAINT     �   ALTER TABLE ONLY public.fact_offer
    ADD CONSTRAINT fkoffer_type FOREIGN KEY ("Key_Type") REFERENCES public."dim type"(id) ON DELETE RESTRICT NOT VALID;
 A   ALTER TABLE ONLY public.fact_offer DROP CONSTRAINT fkoffer_type;
       public          postgres    false    230    235    4711            t           2606    233399    fact_offer fkofferseteur    FK CONSTRAINT     �   ALTER TABLE ONLY public.fact_offer
    ADD CONSTRAINT fkofferseteur FOREIGN KEY ("Key_Secteur") REFERENCES public."dim seteur"(id) NOT VALID;
 B   ALTER TABLE ONLY public.fact_offer DROP CONSTRAINT fkofferseteur;
       public          postgres    false    4715    234    235            l           2606    233383    dim_status fkrs    FK CONSTRAINT     �   ALTER TABLE ONLY public.dim_status
    ADD CONSTRAINT fkrs FOREIGN KEY ("key_ResultatOffre") REFERENCES public."dim ResultatOffre"(id) NOT VALID;
 9   ALTER TABLE ONLY public.dim_status DROP CONSTRAINT fkrs;
       public          postgres    false    225    228    4709            u           2606    241600    fact_offer fks    FK CONSTRAINT     �   ALTER TABLE ONLY public.fact_offer
    ADD CONSTRAINT fks FOREIGN KEY ("key_Status") REFERENCES public.dim_status(id) NOT VALID;
 8   ALTER TABLE ONLY public.fact_offer DROP CONSTRAINT fks;
       public          postgres    false    225    235    4707               .   x�31�41�tt�21�41�t�L�,I̩�21��8:�p��qqq ��         �   x�%�;�0��9�O�x$<�k��eq��E�H=G/��7��l�>\����D2Kv>\�q���j�̝^�|ރɌϺ��)�ܶu�FR*��̀})�fG01��X<�������vL=��G� &��=vι/�1         �  x�-�A��0@��)�c��&˶�W�Dʎ�$1�Eb��܀�t�r1�S��ƚy3�,PY�Q�`�dt��o�T%�!x�"�$x3�]��Uď^l�LE�_n�X�\E�����>��[_�����W�i����7��*>���U�J��"�h�Q�`ԙ=P��\n���;
��]H�Ё�'uX���W�g<Ͷ�@��z� �����nt~�;��Nz�Z� \��`h�a�Ļ6�
l!�w������gD˟Y���Wv��!4��� ��P�@���|Iw�H��d�k|�"��S ���������ťg7J4��AO�z�6N[�Jf祡�$.tf���&wp6��D�dz�:J�!����7+q��W�XA�/p/�����4��2��(���n�O^�������$� n�zNs?�7I��7N�7      	   )	  x�m�[r��E���|��	�r�?�?�����"�,�۩}�qU�V����Uv�~ß����(���B/+�*��(�e�+��^Q��J�G�{�(�rY��Ӻ{z��ʗu�h��V�����藕^���Pܗ�BY�n��=S����� :9���������@��=S�PX��론���(�<~CS�t�oŽg�t$�����(��0���0��#��ޏ�S�I�x�Ek��cF��Vv���wQ�`�h�R^s0���:�;�V��\��z���T�:�OL%-�P�Tb+���9������~��
LE�:�R��S�i�=V��T֫���0��wt��*L��Ɉ�2/
SMMS���_�Ta��x��fNa���G[)DS����i0ըn_����ȑV!����)�(&Lg��*)D�Y��~���l�(iX�˄��K�v~L����.����^]W
Q�tJT���s�t�+��.��霮(멀��KL����+PbX�t�t�7��t�tm�e�<)D�ս��Oȼ,��۫�J.s߷�k�"B���%�������-5h���o�=���4�1)���EA+R�e�+�h�vY��Xv�I闕Gqf��V�}Y�Ww��qY�$���e�U��d��B/+�������^]"�(�e婮1�tRaZ�5��	#�^���
�ڼ��c����":�i)��0�(��i��d������(`z/W�0�)����S��Wa�`z���{�$�>6s���&�(`�����i���n�.�!
��F����L[0M��{]LB���Q��.���$��h0��;���5�`j$�M�Ï���\9���:L}�i��o;L{E��n9`�{4^<�
���;ǽ�⣤�P�%���GI�.g�6S|�t}U�N�Q�gT�)DӾ�5���(��i�b0�S�A�%w0-9D�;gY)D��~-/�G����A�s|�oS��NL����(�c����/�G�}���Xv���z���@�Q2�/���N\|����7P�'>JF���a3LG���L��խ�LG�.Ѡ�u|��!~��C�tE:�>J�|kŘ�d�E��mٸ=�>J�D?ƣ�(�ô�]�����i���Q��>J����%r{u��Le���L%�}M�P�T����
Le�*�/&�(9>�ě�xB�G�Ӛ���(����{�D�&��t�N\�Q��x�iX(`z|���a�6>J4�N'.'>J4_;����G��;j>0�4�i1�ha����>��d���ٿ���dƽ_r��3��Z+0�=U��d|��ۏH�Qg^�Q2�+�}��C�)�H�lL�F+
Lg,��R��sEu�S|��s���ƾ��Q��w?�>��Q�Z�������ꑣ<0]�����+�i�G���Gɒ�y�K(`������Q��yTFJ��k������(-���E����6w	E��t�B���s��⾬|��Y늏��~"��+>J} �#[8Q�e�s,�(�e幁Z����.3N���Gi�5��W|�֔:�p�+>J}�ȟ�����k�2s�(��r�F�Qz���6p�S���[J���(��:�:>JS꺞
����́�R�k�����>]���Y(>J[0�����R7O�A�<U|��`��1��(M��	`�⣴ń�
�Ӧo��=���>��:���G���Le�l|��a�L�a����"��(��m��S|���J=�)>J{���R��=���_ ��Ҟ6�s���}T��
����0b0��4X���Qz��};�Qz�:M'����(��i���(��y'.�E�Qz�{?�s�B|���޿�
��qG��P��^�G��Q�{.]�6Z���(9DS�Q�=!�G���q�v�ǧx�t��Q�(`:Z�����G��Q�������G�8Wy���v����1�{��L��J�`+`:��� �:>JGxS_c������_�Q*�i�S{�N�Q�>��[�F��Ri�#yd�SI~�Q�T�3~�����T�-��r\SI�)��Q*����3��>iė�M������>J���ط:>J5>���=s�(��^��CO�Q����0�s4ո	��+�G���O9�Q��=���Qz|�g%�g+0���.>�ɏ�R])��|��H]ӰXA�(��SdR0|���5�(`�|T��}|����<9#��|�ΰh-��9���޴��;3��R�Q���U�Qz���e�;
��j|H9�Qz��{?��+>JW>"�
�&��\mL���g��t���(`�ҳd>[��g��.\���Ŗs�t͇"��o�~�u{)M|�,�[�9�~������� [�=a         9   x�32�42�t��+N���22�"ϼ��+ӋK2��L9��%3=�$1�+F��� ��w         P   x�3��4��tJ�+,M�2���`�`.N r,-)J�21�"����Ģ�d ߈�rR�3�ҹL�9�(?-�2F��� 3�         F   x�333�4b��+o)Q(Ȩ,�,,M�233�a�D@~qIbHܘ�a�W�^�\R������� 	��         �   x�U�A
�0@���0��ftT�����4��>�ŋ�'�Ń���J<ֹ<��n�w�
bb�1��͑q)&��JL�s%L�4��LLL�y.�~�j^̩���_�,b��r��ڏ����@I
t��(IJJ�ҁ��J	J���J���J�б��8�>)O?�         2  x�}�K��6E��UxA��w5���0^@&���F�	�%y�������ۨ��Id�I:���Ѷ�|{��ӿO��R��m���������O�먉ڱ�|q���l#�Ѵo#����V��H+�m��6�
����^��i��|eU��|�����g�vKp�,���~����������ӷ����_?~�n�]8��8|=���ۗ�8�/���y�rV��[g�K_��ϓ��¾��}y�F�>+o#m����}y�F��mi��FZA�H+�ț�dg�v_���:���/_��:g�GY�3�,ř�Q�wG�A���h;�{x���w���
	�3���@M��mJ^ 8M۟(���_����0'��s��N0'�b$��=@[�9�g��cg��cg��w};;v��w���~>wv�wv�w���pg�.p���.�]�.Ks�������˳a.K{���w���txϜ�[� [��+��a+�u��+��w�[�;��Z��mu�
m�� W��+�ՙ+��7��ܖ���|w�-�807��v[v��ܖ;�ܖ�m�6o�m�h3hϜ�	PcAPc�ۀ3�. �!��[7��ioy�!~m��hcif���M �|\���������{cZ|�ɛ�k��Bf93�����^��3��������!`����^�u4������+�>�{��9�p`�������8\O
��X���dj����z.��Y�e����b/���zZ�n#_�G�_q1���zΧki��ȕ �
����z�3�\=ߝ�����_t�;_E?.~ѯ@�zڀ���) �k3���Ťb�,Ĭb����;P��V`!��TT,fcfT��|:�ɷ�i�ӏx�8-ێ��,a� 홓�
��1)
����P����(Xdot,��`=m����
,�o1��30��~c`1�h
,���iC�]�M����س����^D,��63��oq\,�c�bQ}�q��V �ί���z��A��E���Ƣzocc�6�XT��Ƣ:56թ���V��95B����E��v d=m(�[�.@�zZ���hY4�q�,-���z:f�s���Y,r�Y����Y�#g����Y g���,·?����B��(Z����s���B�����g4 ~�g���|��w8~�F�B����� �8������2�,?�����+Z�hq�V�h�(Z�⁢�a*.M�p�hrE���ٸP4]�.M�hB�t�7��4�W2ai����/�\X�.&'���&,M�u����vػ=̄�i�?!�ϴ۽-�L��Lh����2���B��Z&�L���2%�Saf=��E˔|�1����0'gF˔�3����uE��r&�L��L虲79z&�B&�L�gB��z&�L��L虲}Bz���Z�i�3��	=� z�s7���p3�pܬ�<�Ł3�j�L��	1���������2aer+V&�2ae�� b��
0ץ�Ѳ��Qh�B��ɅL��o/B&2!dZ>�	�ۘ�����6GEŴ|��ۘ�05{Q		�"aB�z�G�l��H���e	S؛YHXO+@K'#a=��������+ۛ�            x��}Io�x���)�>�mD8C�ɺQm�R[�RdE"�-�63��I�Q�:v�q�4��X1	�з��1_�?ɼ�_��E���=���r��_�����LM�E3,�R,���bض�y��(��)�4���F]���C��7�D}�Y]�j��m7�D]��(T�N��h�?e8�*��a��d��x���c�&^���S���oծ?��<Pt�p�7&�dC�a(�bx0��_��>��'٩��q��e�lv1������_�u��?%�^�?�翭ax�����)�Ir5�իt3J�,W��_���?��������q��pҽd�گ�S{0���_�0�w�Ϟ�t�bK�^s�W�{��>�b���ZǴt�BG��f�4�pUz�5���?ϕap�n�_�����ևo�S�*����a�~b/^�M�ٚ<���oq���j���و�}���/aV���F}\�8v���l�՞-��j{���l�>�3�����.�n��'�a����g�2�qv��#[��Eō�f]>��ǅ���������_� ��_���Oq7��_�����1������mHvb��qvÇ���v8��zOx̞���y��}�i��v�����V����ʞ���iߦ�t��E�>����Uw��M]l�#<~�K�Uub���)�����d�<%p���]-F�����ͱ݆��磹�xH������=u�ϧ�����dQ�����M���6ߥ������e���װ��6K����{�Yنo�
�]y�`���n���m��M���:�̛=<*�e�5a���/�_�W�����������Q�������$p�,��7�J��v���ԛ�z����a��ċ��������In�?��%�*�1�Յ�v�͏��.y�v��&������v�-����6\�4MwP��w��L���*Y5��w���d��,^�&]��O�����G�7p�`��1�K$�?û�����;ޘ�M���N~T�ɏ����#�����z�i��q�c���I��b�T�2y���[������`��m*��E�|A�oPlW�A�����f��Y����ȬVl�}*u�����S֢�ۍ�7g�Cy
"O�E���$��c����.ɲ-���ﾻ�)�v!�j�����;��!Pq�Iv�ҝE&������՘�j���+PbyV�&��6�<����(S!�A^-v�[�yw��&=���e�n���bꆣ�-�����e��y�*���/�Y@d��88�maS����ϻ74]��xJ����$S@{p�\���D�x���7�N�S�GJd17*��;� �C�=M�~W���p��`<28P����O� σ
���� ����V�=3�a4g7C���Kl8R��w.Y�7	l�l�O9������U�+a� ��Ŏ�X ]l\ �_��ڟ�Q�&�j?��Y0��zG7/�?�����?������S8�a$�Dj�!�C������!�c�����*�'� ��O{�D�,�nj��lBU��*l~�\:!|�p2�q�fbh8֑:z8�a�c����h�ğ��췽iЇ1#u������;:
���u�f�4`�q��Q~�ם��q4��hZ���`�4*�Ҧ�ީ�������4Y�_��#`�\$v�МH� ��������J.�����½|�e݈<��u��?�a8ai������ꊝkPH+>F�U���.�ߋ�[��v�_�?����Ī��t��,�C{|G��O��S�	���j2�@Ko�hp�g��@.�?��k<k:HTP��w�(Œ�)�e��ÿ����7`m��`Y�������5i�5����J!v��iB��b]m��v�����T��G��d��bo3��Y/쪗�?îb{�!��q:2�ޮ��Y�فIF!��T'h�/`O����� �	t3��Ey���Oqܭ��O�}�FN}P�p����p9�`��Uswi���k�s�~\���'J����k�DT&��F��8�	��-���<M��������/$��崯l��f�`�JK���8��/�&�z���v)Z���X��Xd\�%2����AQ1����<�B*����I� b:�u �{����0졒bRc���=x�������N��xD���Jtu��F�"��n/��|�6��Wu���b����4������v�w���(c��	�� 1�̓_w�}�y��O8~�ј?��7n���	Yr��p%l�q�/�`�������Z�����X�>��^�p|��6��ZxK\�M�K,���I}�U�e���XhX㌝8�A�x�f�V�'yz��f�F��*��0ǎ(�s����S�2�U1-]C+�s���4�V��!9�x�0T�#�(g�]��0Fpy�/�Ae(?�Z�ęRs�6��+��혫���v/=���y�L�fs�޾��=֯��l�l�}G���PM���uO�������q�ӥ�CqmG(��]6� �q���8�`�.X��WN����6ڝl���9�~�?��>.��ί���&���i����rǀၖ�u�,��"6>�ѹ�2X��f��*�~�̨�0�F_J ԕ����x���.��B�g�`1{a
s	���
��[+�a%�u��'����ݕ�,�$Y�_�qa���Ŀ�
��d~-Ms�2P@ �t����(
�h) �����:��ٮKo��%9_l��l�!�~����Gz������[4&1����_2.��'^��'A[�
G(�+�i�����+��?��B:dcj�1�1�urF�Z�i��b�>�B�L F�[��0󯌃�b����^���pI��ψG
��I�Z�{L�����CMXLo�o���b�ow�d������O�B6�_Ec���v����(�PF�l��!�7�lWl�}�\��N�뀩�#2�x�X.@0�3��S�.�C���i?�q�a�0�-�\w�{�?}�B���8w ����~7�G�u0U߲���`��_Q�󧠌u[�]�sN��x`��d�_�~�S�-wi ��F�b=[�lŖ��7ݰr��	��㟴8d�M�kx�����xג2��N�t��ī�.���Î����^y�?I�¹0tv.N�KE{���-!�8ueK����
�.yE��x�	�NP��-�o�2- ��)X?8 �v��6e3D��+^ǁ�x�w�L��&U���������T�X`�����-�G.�@b<>��M��S(���T�8�r=�˘�����>�R� 7?���L��C�+7`�*��I�u�%� ��|��j>�ª7�mDᒏ�8?P�0�R��j��+Y�Zf��Q2�af. 4�L7�0�,����W�F�ΝS'j�滌�%{V��m��~�q�d�7��q]���]�-�B,W5����{��@L�����x���"���*4ٯ��4ۂ\���vHG��j��NC���'����=��0��"�P|f�z�U6)#b#q
WcX��OF!�u��&�����{�.��2�A�AE�����ϗ�,�����Y|��b"�%��m�焆�r\�Mʷ��=z<���!� �2�¶�:��#ABTq*<"w�����t�x(�q�qqMo�����Z�i�i!_'�'��%�A��h	~�z�i�NH8�f��|i�6a.T& xKeS�8�SS�6��h�s��0�u{� ����C�~�s
'�,�S�R��>�㗲���]x���/��^q�s\�x�n�_6�xu�J������C����R����\U7���\���9ڋ�RFF\bk�z�s��sq��e�n��͐��W�m���K��*��0��Y
�ۗ���C��)ȉ=�8�@|)����K�)hR��pݓ�ݹF)�]���D]�lT�k����-l�eI6��f�v���&A��}г��t2_���a'��:�!�S�t!';n>����St��K,ġ�=k`    ��~�އ��/5�K��3� (��e�Fx?�1� ���>n�y�K�(�3�o�珛��,r�^��8�i��,�)��Z�������'������g�h�D|�ah��o��-`��0a��]���?���[&2M��1�+���`�uM��%x�O��l��
�&0 RK02�dw��vAw��kLN�2�Wu<��L` y��Z��S��,����t���`��/ɻ\��,�3tV@5�G�V\jf�	kN��&j�,���WG&��T~< =�w+P�B��gh9�O6��C ��֤��5 [U�Ֆ��E5�T{�W"7������s���q#�����w��-FG~5�OG�l>ނ�t0�y"�L�Q���`��8xq4�����o������2�(���xԏ��&�/�H��L���z~uM..asO��:цd�"��}�Y�%px.q��qt����}0��qS��������]񼺽��'ت�ώ� jn�;����h�E�$����Mx��r͢�� ��� ~@@��6�U�����w�Ǵ��n)����^|��px����s�Qˤ�D)л�����'M��S�[��s"�/�4]t=0!C�N�w|�m���Y|�z�=
Sn�����.\ 8�8�`6�c�O�8
�����x8�G���GKoR>�~Rg�Q��h�b���$/��������|��
G�d�  �۝v�RS�+�y���h���#�Ogip���Ǎ�OE�:�uЬx�e����`�G`�g�`�Y���8�괄)7�u�"�x|PG�^����╱�
lb��"7� �`<���e? z�f��S3���B��d9�k6�W"Q�r9{�t|������ݯ�N�Q�g�	7M!��2�SW|ҳ�G�/���]9BV��?�*�U�h#�}x��(���+`��F�̫���f�;��,d�n�o��<������P��$,�s�.���xp�תD6�/y�r�M'��'4�D�+?r�5Ȝ�C0��/�:��
�{���H�C+���b(��
<��5T������\���E`@�l���ﺁ�{]_���O�E�� 2��SLI� tk���[%ɏ�Aƴ��e�;��ê�K3�Qgŏ`Q�?��?^U��ge�;_�I�]�
�� M� ����� �7�.X<ۦQz���$n�O<[�2������ʍZ��������'6��䍧�'NYH���\�k�\�&Xi��������Hk^��x� .�(���mGJ�6�1���d���sY�H�.����D�֚��9�	̬�ʓb$p1Flk�FF�9rW`G�Lcexf�d )X�'X0-��y%Xqd��,]lq��,�r����$����==�I(��n8�ӻ��� ƙ��˗�p�i��\�؀��Q���|��2�n�ݠ�e0g��7���x��b�|��#�c�R�ө�F� _Qib%��$��vRLߣ]�p�|6����10�M��e�mw�㷝�ڽ�I�����/���J�"�F���\��ey��r�cϠ"�V��| ��a��<\aH�7����"b�5��k�Y�q|e��3gwt&����{t��`�"]�$�>��b��xG��%�-��/�T慀��]m<��E$��bj��bx���u�pa8�>����`2����N%.���v�q�SN��~ӗ���/r;�g�ֺ���|E�&�m��2�4�"u�x�N�%�,1d-5
�l�lK3�}�r�ZY����p?��)W�+A%i�[+�d�#Ht���{d�v���Z�)B�h�B�ʀ�V�%��`,O��x:�8
w��j4���a�L�
/J_<��n���r��ֺђ�Z�+u���*^K�Zf�~��X8-#��x�P�2���^|�L�ט�ӳ���2&T��,���g�\.�^qݥu���S�Z/?�H'���,�Ǫ?��`����|毈��Ӵ�`ܖ�H�(a*bI�	V�z?�����L���k�n���Pr�T��jƫa"��Ǭ����S��'��X�sd��c�3�f���>�U#�K�w@{�+'ˬ>�*c�R�) ����K���x2a�n��,����ǿ��1�����Q����xڿ�1�Gzo@+�F̍+�͍���U!Q�G���NN��9��>��ip-J� � R�
��Ϫ+³�7.ox12��
�l�s�U��^�E2����{�iXy�o�5c͕�@Z��bb��R�(��&Vo�u���� d}����ۛ�K��Jo
ؤ���E��La";	��L��d��.t�H]�hB�(
}�[\��I;���4lrL�墪�K��]�q�Xd	`�S�zj~�V����勘�ا�Q[�YIZ�N�&*��f�=bN��r���8���h�z��Ќ��X�5�+o�\��OgA�f4�j%�+���ٿ�U�I�8'];� )�G��,���t|w�%j-�;��cu��U���71��)���{�Ԡ?QKsMst�G��_��GW{8�N�f��x/��ZTɈ��d�Sl�����siUU�%,��R	*=�:Ѡ�(��p��	/�A%��L�AZ�
�F!w'ƵR�%�Sʯ�O��ޑ ��q^���G�礓�RB�
6$��[Ш��Vٌ���6Ox�z����(�+�h�5�/����}�a���<��(��M��O'*[�'D˨K�g#r1��޹^Q�#�l.�|E��I�	�!��X��[��ø���Y�[u\[�uY�Vu���AMQV�o��_d(���y������u�t��i�pb�<����N8�xzM8� :An�_�Q'�����l��Z���)�?����2���ݳ; ���C6P9ܕ�~h^u^�\�����6�y��v�y��T����3�	Gt�JGá��y���::b9�Z6��v�T��������	՟\]�T}����~ɵץ�?�;�ᚫ�P�<�B��y/��9/��ߵd�q-C�A��(���tO��;^XU]�N�J���ƃ�C�{���kE�CEC34�����p,C��hI*��$�@�V��F37�L��ϟI�&�a8�C�"�6XQP/�Ao:�	$"����7����>�C�z4�fa��8bD`E�5��`
���4?��t�!�0�g�w���~XE� �h>�%s	�f�ܗ�\��;��
�Lyo\�%�I]`�S)�i�t��S�ZW���pT(B����!:xm�X�yw��}�����_��	f�^#�!�Bg��F2L�LM���.|��`"���:��7��)ih��<v[�X��N+�Y�+y	-ܥڋ1�Z�S��λ�:D^4�	?��֦��D���Zy�8�tӭ�p	7Yo����P�����Y16V}C�����7�Y�����U�U8�gC���<�]��,�Q�n���2����9Z:Zp6���x���"9]�Hk8�l:�����d�m)�F�83� &<�}�^ 6b���<]�*�i��
Ú��Vb�O'�7�m�f��d��7��6`!�&&�0�6�A�[��PXM�PE�A�p�ie�-6_V�O�ˋ�a�x��:�S��XS�ͷ�u����t �D"�;�{��e�z�8�
���1�7�|	r� ��7
�)�c���o�;���L}�?NL*{����?�Q�`t�}O5�Y%̊�1��/����<� �m�\���]���s�6��+���SI
!��S��Vg`�`��8
����h�3�
[���P��� 
�5;G4l��~�G-5d�lQL����}���j��W	�b��~�Ra��$�Q������,!1_�#�����Ʃ���L��˟La��h|5�·?�S'H��a��I�A�M�ѥ?| ��~�,�Q�il0�	��X,�'��0��3@���ܺ3��ʺ�+��< �Dd(��a@�<�Q�r���R4 ���dcy&���v������p���I-�;    �)"-%#��pk�����ơo�m���0��8r�I�ۨ�^��~;����ML����+;E�E��Sh�(I��VDa�.m[�1c�e�΄��B�2��c$,�H$���_�{^���B�hd�i��S����nf�N����˫��7���s���8�����,����)���P�l�����%>4��|`�q�朖 *J�v|�<��,}ɿq�����4�D��"� �p�t{�k���$b*M�N��}��}"y�T��k�Z��B�(K�`<P��D��i�'��]�F����Xw@e���.8��c�Jk��$��B���F⒑ ~r�f�����
�!�ͻcQ����j7�`����q��V�����:֫@j��%�Q'+r�*8��_0��p���P$)p�M���h�h.6������^Ń�t�q�r�c �����b�e�G��X�/<J:�!e��Vd�q��J�X����DB�K�#�L��k*����5�͸חk� d�|��s��Ż���V+�I�`2)O:��G�z����g�h֋���&b�J�s��Aѐ��#���˼�wL�@�- �+��"��fk������W����Cl�b����@F�d�V���XY�`a��@�� ��@/�-��E��1�}��~7,mYBBh#��불2��R�x�ʻ�HT��ʺ~��v��]����b_JwUV�E�V�m����I��+$�G�	]��6؈�z6�-	�Vr�¹�����T�x�LӜ���-�� �[���ӳһ
��Hr�Yfl�wNt���iϟ��p���,gs�S��ga0e!�k��?`�C�!<aixe�������{��[P�J����Í������f�>�1PG��Eta��z��,�Gn7 ��[,�gP-H��ͻ*s 3�w�N�"����T�b[3��1��wn�I�>W��jA��S��X��q%V� .R�'�׉d��\ �T�ye�����bmw����ɗl�O)C�X̹ ���%�1�9��ë��p�cJ���<��ǔ���kY\W�����Y���x^0����N��Q���5W����$P#?��i��,�M�cD	͚0���fA���|�8�@�Lo.��Bb�8
q,|J�|���%E}Ҏd_�ҭ�����>������
�l1~��eG�i*�k�����itF�M0_F�C���<�5
yn�R��
Xz��^��:��O�����I�墄���=ʺ3���,�����lˡ7����px�����4�mO���)�3�l�V�ZM�b��(#�ϥp�.`c� iv��<���V`I��X����y|����D��M"}*���fp��GV	өM��MN2u~,� !�q� ]�ˡQ%���;^���lb_�����K5����nYΩ0��[������+�*��RQ��>>�:��P%2z|�!�,^XM�E�O�^�Yu��57�(��q΅�Pmd�LVVHc=���b��j-�Z�~o6�$�"
z7�N�6\��;�4��즃���ζ�vۣ���{J���g�yx�I�(���
�a�V#/v� Ha������[,qHJ��o��w�V�CդW=^2��b;�cLU�C2��
���
�֖+-e^�"�	���*/���{a-�4V�8'���%t^:H+DV$�p�9�r�*f����e�ۮR��(meI$g�l��R$��*?ַ[��Ӄ�mz����BQ��Qdmvm�f!�J�5[�׬�-����˶��}�;n�F:����S����{�A#��2� z��g�����-5�:�D���b"�LM&���?ǀ��l,Y��!Y��Bd}Y���L>|��2��a���RB]�����2��bYب�5��8#H̩����T�}�Sſ�"�6ky�5�M"#{8[f����U���&�6����ͳJ�Eȿ����h�?%8-�}�k�X���^��`!ed���t,�z!�;�XPυ�_�\�[@��輸�������e���!�hv÷a���J7�N�����b�V�x�"���ٶ]ˢ�����*�f;���c��&�y����g�E3���$����F<���1���	�e�f�}�Q�V@��`��nj�K�H���lwRy�����ׇ8�mGie|#YNZ�43��zF7'���~`�\p�0�8N�>C�2Y��ᨤ���ɞm�����ڂM��L��x?�w�A|&�QH0_'�Z�E�3��V$��kt�jv�J}f�"���E�G ��L��7�P�Z�s�%o�
 � $����l9*EP:s~��ꠣ3���qq72Ȕ.�ax-��1c�� N�t�����\�|ؤI���n��2�)�<hI�Ƽ��yI�W6
��yİ���)�\^9���2�����	��2��V�@B��eBϱ�Q3�Xg"�R!d�B�mY���F$)���d�
����3:!*!Y��$1"h�)_+�³��v�_W\��D����!\��Ҩ�G8�'�q��23��ڱ^4��D~��E�fO�lP��E6^�R�b�6�	�*�h�pa��~
�����x�nV�����FH{��K&��O��]�[�"*`��)J� g�ȥnH�DD����3��Ա�����%�O|�������	�G�uN�m�n��[�N���Q��q��=t�׽\�+�:����f"��[4�?R9F[6�_r��Y^R� -����3&��̎�	�ߏ���q��\1M��az����~���ƃﴘ@G1g��/���lڹ<���x�%��0�8�%V
cVIVt<���K�yB�3�B�I2D���҅��fu&?#q�y	/�3�N��Bv�9@_Ҧi�y�<�|��%�k6��$�z6co�@�����]�e�"�Tt��ץ�z>�-���n�t��cE���w�������$^��B�gp���6�+�Dك�9!���[\�p�.�/���2�$��x�	SMA�C�C�w�'N5���4FDo����{fE�<4�r[�%e3@�?±\a�K�a��F�����1�!���O��G�s��W�
_Ǜ�@���I�00Q&v�_&A_�>%��m�୥$n������ӆ�#*C��">����T��ʶ�����r���w�v�\�����<�Y�eHX�s�uD��h�"�)l6�eFwMHD)�`�(���H�n�#�1��3o��ŵn�X���We?�HJ�yJ��A/h]JlU���;�������C0��!E�t̸�<�Fh�l$�vMz;uP�KH\=��ֹv]`� �}�l�]�|��A/k��Z�P��aW$�lK]e����564+໼?AnLH�X�i� ��/it/pO>���s����*^�I:�wĜ�e64ů����L�1�����O��A��8K��>� �m�w��[k�2�q��G�z�&�F��
��)H4�VY���\�m6_��JK&d,�{�L�-o�Y�!����(-��-��Α>�>�.�2X�0y�n�'�����<�&�����b��5��L�«6�k�{�L���E�t�̊��C��ogG� `mH�:}˦f��u�$��JneI:OuEZQ@\����G��aDpo��zı��m6�h#���hK�������z���	����+�vV��?�,�3�?�i&Z3H�/5��x!�F"o�Ǯ(�\F���Lt�ϲ9����eC��XEǃp�PF�W\�B�О�t+��\�ţە�9�Q$$Sq��Qd �X�sE�`�iw�&�wH/���XuƆ�D�<��#�hn�����	�Uђf����XyB���v�9ŗ� Ɖ�4%j�< �.���ڿ�]t	f�-�*'�H}-x��@���F���o���M$W,��Pqܖ��-���-�Y�8�+��>S�C Jyz��;��yR�ݮwE�����2Ƃ$�g��*��'->FNP	���&����Py܋��j�^��p	o~�����v���<���´I�Zc�    y5^Ə���6`�i�(����L�%O��d�>��f�<_��i`|�"k~>	z!����a><�:<�%}��*���Z��D�SGr$�FC���6of�5��	z��c[�}/���[guc��3�qژҸӵ��8�f�J�Ҍ� !O��,�2ąz���.]W�3ZO��t,���Ay��N�F0�7�
�h��>^!�3)��`�m��7L��	�Pa�T����c������i�E)�L�d��⡨1t]&��hA��?�L��Y;7R	���"a@���]�B�:�4����߰���FB�9�k6H�Hid#�"6���u.�Kɝ����	�I�@�	��� ��P�����2���CM������S�j'��t�EQx�oBM)C�����y!�.0T���};�H�NoQJ�7����6�:)��=�8d#"�Hh�Xf_8�kH;O������1Ȅ��«���\E�#�6S���,���(q�[�� R�y�"�V�'�"K���Zht�Q<�D{����ϳ�hې��� ��yS�m��{�bW�^�0����T>��+��HZޖH��7�]I��/����#�|@��y��)̝y>�q����7;-Y�cYz)8�0�wi��E��?`��v���;�i�/W茷�#)�^�Ą� ��@H�N����v��t\;5�N��J;�`V��7��t���Qe�yF�����1KC�o� �r����`�.��KWɥ� �a�m�� �8��G�iWW�6��	�1Z��H��Wن��D�͏��|�-e�H�M(�
������kQ� ^Y��!��&)�¢ D����� ����d<0-v��HѢYE����~v�ߍ�eL���e����jdM��ؿ�~
D�@�N1�"̢z�s�e����<8�okI�oA9��z��K�f��oW�%�J���J���Y�1:�W5{��x*�L!�G�w� �aF�m�2��SI{z����b�#^��^��x-^��t���0�����ـ��E���҈��9����p�����l*Dq;�!��R+Ǹ���9�ߵD	/�p�&��8�$�3i�97�q��/����ڶ#�N!���Ɠ��̹,_��^S�C�
%�t����%��e��H���*�0��T8\�	=,�q?�pSJ���ak�u�͉��h�_�L��ݎ~4��|���y�SK�iI/����+�|,%�2iw�8���W��:�?��04�����ҵ�-���FT����}M�Kn�W.|�}��&�Nw	�g ��7��s�����a����vS���+]���i��~0�C��˜_����F�+��\rz�`z n��{��������:�Ծ,9���>�he����6��[cѵ�`��E���qG8Z�T�
ў'��1JBzTZb��w����������ޤ���"�E��-�S���pO!�s��2$U��L��>\f�H�m���R��N���ĥ�&xwY��ݯX�X�f�VG�~��9V c�X�6样��i��?���s��X.V�)ʎ�ytQ3[�:�-����MpxMq�9p�ڌ�'�0Ӱ������~�Zw�X�v��9�V=}m�[��6J�ʲ���)��\	�F\��Z�5i+�C�i���*zY� ߶g6��c>��UoȂ�ާ.�ul�W8@����O��4�}-��R:�Ѐl�b˄fL3)��
��s�Ľ��"[��4i2�-�Ah�
������!m>0}B{2F�9H���AݳN�J��A�]{z���#DT ��"�Q䶿e��jQg�!))e ���Wr�~���X��-��'o)	��ͭ��x�zٖ�J��`ٖn��U쐿w�6�
}#O����֔T��U&�Ys�"�g$:&�){�(|�����5���ǖ�����X���۴�K�era���t�@�F&�>ߤ�.]D�M�Iy�`�~��2�����#��l������ �0���[�zy��G��Zu$s'&��̅�I:�ҽ�cS+XS�=�o[��ar�u�s���-��h���o�G}LG����}�\q·�Q8�/d۾�̅�Ra�"nLXI���8e��w��N�Oۤ�%��v��"�|By�L�1F=�g�!��v³=�81�t�y�?��٬m�i�4�-+%����|��p�fӀ�#��,Pl�`7�|�Ĩ<<��Q0�c�I�u�F0р��� ������S[���)��&х����A�)����� P5k{��o!�4��������,'����Gؓ�� :<O������XR2�;�)�
��25cNxڊн�B�R\��u��$DV9]�)1��x�bm�S��2K���N4-rM���K{�R��fE� ��^��aF�q�Q�%����a�S�x�p���j4����-5��dҴviF��E��뺧y~*�t�x:���J�vlWi� �Q=�+��M�(���TkKtẤ߭�1��t�]Q&Az��]�*�7�Z`oZ/��&�H$K�+�.��e��1%hK*��|	6��<@�8���۬�n�����b�ia�����q��8�g�`M���i�C���
��KH`�n�|�y��O�4�bk6A�Uv��	��bw<��2d��k�"�"J���=�)�'�b��h����sK�s�'^ia3�>�~�M���B6-���싔��?�:yx�ĳ�,�$q�|�]\;퀭]F�Zz][v"��J�W�U��P��Qy�/<R��]vE�F1�Yz!S����l/$vV�_*�.�z����,7�9�?�����c��a����~�/9��tA�����Kʬ��[�D�+1��z��|���#���m�E �������挡�Bc@�����'vu�!T[��[�g�(�m�ԯӨ�Q��.��A�G����UHRi��Mq�P Q)L��ZG.��tǩ��7���a��q��)GW���ñ;�Q͔B�!;j�(�[I�d^�;�G�x�.r��!�Ω�E1D�K�SYeB(aT.�U0U-=���������ۆ��~p^�dcQѽH��V�IKԲ][;�si���&�aD������Ej�c8�.�k�`�xd9���,�8�i7 I�E��9i�oG���Z�Q�Z�V�r�����,U�~��a���t�5;nk��-c�XzUm�&���Ӱ�,D���.�dl��{��r��+l���[���&̅��_]GL�Y�2���rɷ����[CJ􎩿��^尃E��kE��$���T��5)�2Ԇ"�d��݈uFӱ�	�u����)�n���M��ΫX��+auᓢSV��V�VC4W�O��a����A���qV�.��	��l�ՄF�%�ɘ;R҃MJ����̯{5�	֏wf>XP��6�L��a/��V�M+i�A?D��/�]��`��b�XId�C�g�<�_����!^]0�\c�NY����P��x"�w�	o��dնռ��S��h����-���0��H�#�8''�h ^ M�'/H�MX �xM�ߤ����H�v��m���E��X����t[�]����ڦk0�q���~�~��i��ތ���*��Q]I/v�3�1������.�,�%���v���Ӹ� ��k'#Df�	KR�I��G����E�`��ǋϼ�
1	χ�	;�9e��)����e�]���tj�j=�ןsja�R;=N)��*�O�*W��Ȓ���/g��("�߅c�!�������ʼ��O�H!/�Ì����4�t��H�߉��� ӭmL��C�_%�T4���fX��˗��!�H��;P��/kZ�h�O'��+���8=�=������8�C"ʷ�i-�0i�@@�K�T֛�`�ق��^��pܧ�E�p$;�ˇA0���D�rO��F*�J#�Cf����dl�岞���w�QX��aٛ��XPU��d�zazW��>��翨C��W2�$�x������d��7����X����_Et�����''� �  � ��AJ.����5B��X�k{��#Ѯ����&3���Nl��d�Q�@so7�5�q��G2�!�Y^ˑ��%G����7�*�A1_d���_��kN���:��̗S��DMɠ&b�`q|�ucB+̘�Z!�:S�� #ў��cZ!��~a�񬗥�r� v���Yd��б�>��NJ��,�'���d�;M�^a��� �8��V��<~��i��G �2��-��g�9~Zo��:F������͝x%vA���IDS
�P������ʾii��߱g���Q\���)���9�4YAqT�D�u�M7x���J�����}s�u����_-���S�it�}Ƙ�X��"]���(�"]3t�;��#�7��@O��m!Q����pC������I��ހ�N&t��|���� ���*A��X�$F��ë��C=�yl]�>|�D�Jx'�7ǿ�%�p�i�1?���Z�;���i�H�������^/�)��9���t�iOg|4��,|?d�(�`�i�HW<�?��Tj���4���%�p��K1�W�U�1�XbyQ�������
��C�c/�.��T�"S�n��f,�-���L���U�?�� 7%��Q1`�N���JD]]i�'t�Q��v��V(O�'�9�a��������v�A�s��Ɯ!�󲧸�4@Ŋ���ki�rФ9!$��d�G��N�
�S[H�T�at�#'��Cn����)U+��9��!5$6`��\�gɚ�˦^�:�d���%��0N�IR��u-�Q���D��!M{L�����n)��1Ƭ�z�����1���T4�t[�Q+�ߨ~�;�?��x��͂�ȱZN!�>\s�%���[�&B��X.н�n��${�`$D��B;�
{�ؖ�7�y���rRu����(�颞FV�b�9�;5 CJdÄհ���(5����C���W�uR�JP>"l���O�֊����p�9�	[�!��sv�8������p��������с\�J	�YY���H$8�a�汵t���6xd��4]��V��V�0t�mѩb�V5����4O�]��I��g������1h5��H�e�	f���RF\�l5��bI��ѐ�l�/냝bh���1^.���ea�D�����P0���A]�>foX;KuZm�����Ω�q)���:EVo��g{P��,���WJy}F�A��-N�� =�pRe� �pg�5���QA3jd�fx��0������t�/�p�X�΁������*��9��v����q��yE	��f�z�h��H��x+݋��*����Y^�*n�G�F���p0���	.�U&q��!z�v[�q��,�|�dG8��^���0Ps���5�㯼�Z����f��f/cw�v��V��R����"��:f�k�+!�KY��gh #��k;Oðh���ޓzYv#{s���d�>;A ���X����M�����½�~>�9@M��-(V����`sf;����k�{�^��DҞ�\����|�5κ�'��cgbj2�)�ǒ2�!VA��Q��,�W��Ѐ��Y�v;�Ta�������A��J���dP��d�fF�� ^Ն�$��w\�'Yoʎ��&���a��i=����Fj�_�uH@y��O�
g��J��EW#Q�,y@���wt�"Cv�d�^��v�b�(�ˍ�����!�����F7�l���cL�p��6z�Sj�9�< U]���R)�rGC!d����"��mg�x�������5�+6 �I\΋Ҹ�-�U�ULK�@'�r�ɯKð���4\��x���9���O���G���T�`B�����M�+�P_���X>�b�ibGG�xGw�Կ�J}��R�r� �p�ə¶WgZ�m��lf���5��,��~���,�u���Q��e�އ]�zBH����ٰ���-��[:l
iQ,��\ɉ�قbդ}*q�(�����_��L�4{M��!Me~�z_���o���*���i��Cz�gBӈ���.���|~��Pb8*g~��8P\8�
�s;-��m��!k�C"�P�@}Ȑnir֭~Y�D��?ы��u���wKe�Y��l��&��ښ0����_9fn�X�]�s;�keW�_��ײ$�=��(�|-#�q������̡��y�N�\�Ti�S�R�1Ua�{�mA��Dӈ�u����3�C��74��/�n�� ��*��Ώ&����D�2Jc�	� ��W)�'F��3�9�gy��%���S����{��$�Ö�wP�Uj�v��[�O<%��f̃����z�f�Fu�׎�$m)!�+�B�A\�W�Q�8���Ez'&H(�+nc�0a-F^[1�z4�eI,��_�L+�2�y��t��oe�ß�z��j[���t�2n�9�5����d4纍Қb�Vz��g��{%�6���7N�҃hW�b���VəV�P��oֵZ�Ϙ���;dc���|���G�w�j��Y|=��ZV�*�e�L~�#Ç�R'���I#�
6�K���Q�	��	�������I��J
�E�{[?���l����;�:`�ӂ�M=���u�|���N*h�JQ�����%��_:AH�%��H'�:���i�岻%+��s4�)o8�b��;��^I�[zXt�@sl	mp9��(]cZ�W�=�{����Axց��	*�&�i���-�;�~Zm����)�" QЌ/V#x"��l�?��^���"��!�\"�<���g"R/�6��!~�[�tE�8�i,��*=k�0�����3��:�*96��L��[��)�"�,�V���	t��X�\j� ��^�<-M��� ���64T�{�|���y����p�{Z�6}���[`�����u4Y��>}J�Wr�k�3&�*�A&��#�d�^;�Z¶/���b�׍F���o~���O���     