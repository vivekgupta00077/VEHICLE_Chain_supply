PGDMP  *                    |            VEHICLE_CHAIN    16.2    16.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    17343    VEHICLE_CHAIN    DATABASE     �   CREATE DATABASE "VEHICLE_CHAIN" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE "VEHICLE_CHAIN";
                postgres    false            T           1247    17561    customer_gender    DOMAIN     �   CREATE DOMAIN public.customer_gender AS character varying
	CONSTRAINT customer_gender_check CHECK (((VALUE)::text = ANY ((ARRAY['male'::character varying, 'female'::character varying, 'other'::character varying])::text[])));
 $   DROP DOMAIN public.customer_gender;
       public          postgres    false            �            1259    17540    vehicle_customer    TABLE     �   CREATE TABLE public.vehicle_customer (
    cust_id integer NOT NULL,
    name character varying,
    gender character varying,
    age integer,
    contact integer,
    city character varying,
    production_id integer,
    sales_id integer
);
 $   DROP TABLE public.vehicle_customer;
       public         heap    postgres    false            �            1259    17488    vehicle_production    TABLE       CREATE TABLE public.vehicle_production (
    production_id integer NOT NULL,
    price integer,
    brand character varying,
    model character varying,
    year integer,
    color character varying,
    mileage integer,
    body_style character varying,
    engine_type character varying,
    cubic_capacity integer,
    seat_capacity integer,
    fuel_type character varying,
    tansmission character varying,
    region character varying,
    state character varying,
    city character varying,
    pincode integer
);
 &   DROP TABLE public.vehicle_production;
       public         heap    postgres    false            �            1259    17487 $   vehicle_production_production_id_seq    SEQUENCE     �   CREATE SEQUENCE public.vehicle_production_production_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.vehicle_production_production_id_seq;
       public          postgres    false    216            �           0    0 $   vehicle_production_production_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.vehicle_production_production_id_seq OWNED BY public.vehicle_production.production_id;
          public          postgres    false    215            �            1259    17504    vehicle_sales    TABLE     �   CREATE TABLE public.vehicle_sales (
    sales_id integer NOT NULL,
    sales_date integer,
    sales_type character varying,
    payment_mode character varying,
    profit double precision,
    production_id integer
);
 !   DROP TABLE public.vehicle_sales;
       public         heap    postgres    false            \           2604    17491     vehicle_production production_id    DEFAULT     �   ALTER TABLE ONLY public.vehicle_production ALTER COLUMN production_id SET DEFAULT nextval('public.vehicle_production_production_id_seq'::regclass);
 O   ALTER TABLE public.vehicle_production ALTER COLUMN production_id DROP DEFAULT;
       public          postgres    false    215    216    216            �          0    17540    vehicle_customer 
   TABLE DATA           n   COPY public.vehicle_customer (cust_id, name, gender, age, contact, city, production_id, sales_id) FROM stdin;
    public          postgres    false    218          �          0    17488    vehicle_production 
   TABLE DATA           �   COPY public.vehicle_production (production_id, price, brand, model, year, color, mileage, body_style, engine_type, cubic_capacity, seat_capacity, fuel_type, tansmission, region, state, city, pincode) FROM stdin;
    public          postgres    false    216   '        �          0    17504    vehicle_sales 
   TABLE DATA           n   COPY public.vehicle_sales (sales_id, sales_date, sales_type, payment_mode, profit, production_id) FROM stdin;
    public          postgres    false    217   �%                   0    0 $   vehicle_production_production_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.vehicle_production_production_id_seq', 1, false);
          public          postgres    false    215            b           2606    17546 &   vehicle_customer vehicle_customer_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.vehicle_customer
    ADD CONSTRAINT vehicle_customer_pkey PRIMARY KEY (cust_id);
 P   ALTER TABLE ONLY public.vehicle_customer DROP CONSTRAINT vehicle_customer_pkey;
       public            postgres    false    218            ^           2606    17495 *   vehicle_production vehicle_production_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.vehicle_production
    ADD CONSTRAINT vehicle_production_pkey PRIMARY KEY (production_id);
 T   ALTER TABLE ONLY public.vehicle_production DROP CONSTRAINT vehicle_production_pkey;
       public            postgres    false    216            `           2606    17510     vehicle_sales vehicle_sales_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.vehicle_sales
    ADD CONSTRAINT vehicle_sales_pkey PRIMARY KEY (sales_id);
 J   ALTER TABLE ONLY public.vehicle_sales DROP CONSTRAINT vehicle_sales_pkey;
       public            postgres    false    217            d           2606    17547 4   vehicle_customer vehicle_customer_production_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.vehicle_customer
    ADD CONSTRAINT vehicle_customer_production_id_fkey FOREIGN KEY (production_id) REFERENCES public.vehicle_production(production_id);
 ^   ALTER TABLE ONLY public.vehicle_customer DROP CONSTRAINT vehicle_customer_production_id_fkey;
       public          postgres    false    4702    216    218            e           2606    17552 /   vehicle_customer vehicle_customer_sales_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.vehicle_customer
    ADD CONSTRAINT vehicle_customer_sales_id_fkey FOREIGN KEY (sales_id) REFERENCES public.vehicle_sales(sales_id);
 Y   ALTER TABLE ONLY public.vehicle_customer DROP CONSTRAINT vehicle_customer_sales_id_fkey;
       public          postgres    false    4704    218    217            c           2606    17511 .   vehicle_sales vehicle_sales_production_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.vehicle_sales
    ADD CONSTRAINT vehicle_sales_production_id_fkey FOREIGN KEY (production_id) REFERENCES public.vehicle_production(production_id);
 X   ALTER TABLE ONLY public.vehicle_sales DROP CONSTRAINT vehicle_sales_production_id_fkey;
       public          postgres    false    217    216    4702            �     x�U�ݮ�:����"OPŎ�w�>U�i{hT[�tn���A&���@wo���oƒ�l�>�XG�%��
EmSW�.h9��H�$s�h܍��|�@��1N��0�d��G�[G�R�8�1�8���uN�y����C0$�BhZ�=�.�h.�)\RU@���k��� �EIo����x4�}�RQ��6�{�L�-w$[,#*�Lލ�{:�s��!]$���Gӥ
���i=X�4v��(*2oKM�ɛ4X��7s�P���%��&��o�u��5�kD�{c.��tz�H�m4���ʱ��9h3���p���1�K���4*4>
)i�~�h��;��I��B�>�.��=R ������yxHW9�=�VҋN�SQ�`�d����l($eþs;�TK���6W���tfq��*S</vڲ7�+�Pi��|s��������T��x^�+[��T
Y�:�Sv?�si	�z�BR%d*S��_�.K��f�l���̀ț���rVU(��M>F�Tk�X@�Gp'�F7�6���s,a+pf5{� u�'���������))p�r:D����Ôؼ��B�[��t�g��n岉i�[�!r�h����@kJ�t�ƻ�$�Di�S��z�x����^Q �<�b�5�.��Ł����o�D�w���i�u��]����}�\x-��v�ɬN���l7m�s�ne�k؝���nC� ]�Y �G�t��\�,^�M/�I�m��f�, ӡ{�����]ߑ�ª��c+G��Tɰ����G78 ��?!~]�xE      �   Y  x��W]s�8|~`���l�HH69�dI]վL�+����쯿�k;�I�.�X���<`�3�U)���w��<�K�~W9��t	S,�ٓ��[�O�0��V9�,+�a�t��5�3�e*E��[J��!�p0=V2Ec�K48�T��?V0��c�Z���0�J��R�a�*�x�9�J��R��	SG�������s�K���ʑy�D�!����3��&��R��5�#/Jb���"+5¬�=�3�'t�+w�[hn�|�h~z_�%�:�v�c��W�(�p��y���0HΝ@:*/U�,x
^d�ܛ����k�)��|�'����n��G�idB�Ds�Vz/�Y���k����`K5���T%��6	�78a(�Eџ��6��QQ���wM�䦤g��1Nw�%�i�pe��+*;s�{3ݾ������H����y��'9�����p'��ӊ�ǥ$D�1C�Q+4uT԰�T�J�9�x��C��F�VЮ?S�G#�I�7�$��7� �c��00��qJ&[��b�`�=EF�ʪ'��8�&+z�s�<��A�F9�ZG�����W����X$�G���Z�J�S�Xg4���t�%���Ɣ�]���tЏ,���2e�I�ħ���.�EA�S2��""����DCf�B���?R������qI�Ҩ���S���I����.[�IX�\Sl&Ah�x����*j��N���jGv��M~Q��<��B�p�eQI�<_&���%�����풑L3����=�����jDl��(�!3�H'�F������L����-
jUۙ%� ȉ)|Nȧ�B�����ݮ�SW�wT��а�B"�&xC�eC���5�iCM_	��r����mJ�c]��L��i������?����U~�:��p��������{֏��[��0V�=EӸѹG���vel��s�����-Nt����fb�՗��6B?`SO�غ֯7���1�x᯦ٟ� ����x~�5�t��-��]�h�S��F�0�94�9ע%��zx��L�Ac�Gx=jB�7�+E8��s�5�\ӷ�,���874qD�b'�z�~�R�`��E�M���$ڻS����R�S@��6^i�'���\�Ӷ{N�O�l#���>�� 0��j0`��=��o�����!H3'�G������:�'޶͇+�
S2Ԗ��[�c���$}��B�X:��3�T�緗��Y�#�w�������`��W��&na(�A=%f	LnZ��X�M |ߛ����k~/a�7��2����{v�����@�n����L�Us�~g��I���N��#J����W�������      �     x�u��n�0�g�a%�gN��@�u� E����6�X�:����$^�N��t����{�4Q�,�
:}M�:_��	Q].$�a��Lo���5eW*	8�j�p3����@H�kzgF��N���[w�ˑ9݁���R\:23�[������m�?c��.�Re`��̒2%�x�\�wM��p\ƺ����_>������� ~�m���w��0N#e�M�D�]�٫]�@o���wًyG�,��m��Ȉ;��;vx�c�������l��̿���     