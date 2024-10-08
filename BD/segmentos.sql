PGDMP  3    	                |         	   segmentos    16.3    16.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16825 	   segmentos    DATABASE        CREATE DATABASE segmentos WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';
    DROP DATABASE segmentos;
                postgres    false            �            1259    16937    bordillo    TABLE     "  CREATE TABLE public.bordillo (
    id integer NOT NULL,
    material character varying NOT NULL,
    altura integer NOT NULL,
    "createsAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAd" timestamp without time zone DEFAULT now() NOT NULL,
    "segmentoId" integer
);
    DROP TABLE public.bordillo;
       public         heap    postgres    false            �            1259    16936    bordillo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.bordillo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.bordillo_id_seq;
       public          postgres    false    220                       0    0    bordillo_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.bordillo_id_seq OWNED BY public.bordillo.id;
          public          postgres    false    219            �            1259    16926    calzada    TABLE       CREATE TABLE public.calzada (
    id integer NOT NULL,
    tipo character varying NOT NULL,
    ancho integer NOT NULL,
    "createsAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAd" timestamp without time zone DEFAULT now() NOT NULL,
    "segmentoId" integer
);
    DROP TABLE public.calzada;
       public         heap    postgres    false            �            1259    16925    calzada_id_seq    SEQUENCE     �   CREATE SEQUENCE public.calzada_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.calzada_id_seq;
       public          postgres    false    218                       0    0    calzada_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.calzada_id_seq OWNED BY public.calzada.id;
          public          postgres    false    217            �            1259    16913    segmento    TABLE     (  CREATE TABLE public.segmento (
    id integer NOT NULL,
    longitud integer NOT NULL,
    direccion character varying NOT NULL,
    numero integer NOT NULL,
    "createsAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAd" timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.segmento;
       public         heap    postgres    false            �            1259    16912    segmento_id_seq    SEQUENCE     �   CREATE SEQUENCE public.segmento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.segmento_id_seq;
       public          postgres    false    216                       0    0    segmento_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.segmento_id_seq OWNED BY public.segmento.id;
          public          postgres    false    215            `           2604    16940    bordillo id    DEFAULT     j   ALTER TABLE ONLY public.bordillo ALTER COLUMN id SET DEFAULT nextval('public.bordillo_id_seq'::regclass);
 :   ALTER TABLE public.bordillo ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            ]           2604    16929 
   calzada id    DEFAULT     h   ALTER TABLE ONLY public.calzada ALTER COLUMN id SET DEFAULT nextval('public.calzada_id_seq'::regclass);
 9   ALTER TABLE public.calzada ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            Z           2604    16916    segmento id    DEFAULT     j   ALTER TABLE ONLY public.segmento ALTER COLUMN id SET DEFAULT nextval('public.segmento_id_seq'::regclass);
 :   ALTER TABLE public.segmento ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            �          0    16937    bordillo 
   TABLE DATA           `   COPY public.bordillo (id, material, altura, "createsAt", "updatedAd", "segmentoId") FROM stdin;
    public          postgres    false    220   _       �          0    16926    calzada 
   TABLE DATA           Z   COPY public.calzada (id, tipo, ancho, "createsAt", "updatedAd", "segmentoId") FROM stdin;
    public          postgres    false    218   |       �          0    16913    segmento 
   TABLE DATA           ]   COPY public.segmento (id, longitud, direccion, numero, "createsAt", "updatedAd") FROM stdin;
    public          postgres    false    216   �       	           0    0    bordillo_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.bordillo_id_seq', 54, true);
          public          postgres    false    219            
           0    0    calzada_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.calzada_id_seq', 62, true);
          public          postgres    false    217                       0    0    segmento_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.segmento_id_seq', 106, true);
          public          postgres    false    215            d           2606    16922 '   segmento PK_0f5c538fc22bd6d5194d936f683 
   CONSTRAINT     g   ALTER TABLE ONLY public.segmento
    ADD CONSTRAINT "PK_0f5c538fc22bd6d5194d936f683" PRIMARY KEY (id);
 S   ALTER TABLE ONLY public.segmento DROP CONSTRAINT "PK_0f5c538fc22bd6d5194d936f683";
       public            postgres    false    216            f           2606    16935 &   calzada PK_34b38ef0d1e0ef951a6c2bd2198 
   CONSTRAINT     f   ALTER TABLE ONLY public.calzada
    ADD CONSTRAINT "PK_34b38ef0d1e0ef951a6c2bd2198" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.calzada DROP CONSTRAINT "PK_34b38ef0d1e0ef951a6c2bd2198";
       public            postgres    false    218            h           2606    16946 '   bordillo PK_f11929e420c50b6743049c023e8 
   CONSTRAINT     g   ALTER TABLE ONLY public.bordillo
    ADD CONSTRAINT "PK_f11929e420c50b6743049c023e8" PRIMARY KEY (id);
 S   ALTER TABLE ONLY public.bordillo DROP CONSTRAINT "PK_f11929e420c50b6743049c023e8";
       public            postgres    false    220            j           2606    16972 '   bordillo FK_3a6c0c10c7405c2d01b1739e5a3    FK CONSTRAINT     �   ALTER TABLE ONLY public.bordillo
    ADD CONSTRAINT "FK_3a6c0c10c7405c2d01b1739e5a3" FOREIGN KEY ("segmentoId") REFERENCES public.segmento(id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.bordillo DROP CONSTRAINT "FK_3a6c0c10c7405c2d01b1739e5a3";
       public          postgres    false    216    220    4708            i           2606    16967 &   calzada FK_7d188aa151431ae604ae8c4aa34    FK CONSTRAINT     �   ALTER TABLE ONLY public.calzada
    ADD CONSTRAINT "FK_7d188aa151431ae604ae8c4aa34" FOREIGN KEY ("segmentoId") REFERENCES public.segmento(id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.calzada DROP CONSTRAINT "FK_7d188aa151431ae604ae8c4aa34";
       public          postgres    false    218    216    4708            �      x������ � �      �      x������ � �      �      x������ � �     