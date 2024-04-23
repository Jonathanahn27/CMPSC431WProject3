PGDMP                      |           CMPSC431W_project    16.2    16.2                 0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16398    CMPSC431W_project    DATABASE     �   CREATE DATABASE "CMPSC431W_project" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
 #   DROP DATABASE "CMPSC431W_project";
                postgres    false            �            1259    16589 	   customers    TABLE     �   CREATE TABLE public.customers (
    customer_id character varying(50) NOT NULL,
    customer_zipcode character varying(25) NOT NULL,
    customer_city character varying(25) NOT NULL,
    customer_state character varying(25) NOT NULL
);
    DROP TABLE public.customers;
       public         heap    postgres    false            �            1259    16677    orderdetails    TABLE       CREATE TABLE public.orderdetails (
    order_id character varying(50) NOT NULL,
    product_id character varying(50) NOT NULL,
    seller_id character varying(50) NOT NULL,
    shipping_date character varying(25) NOT NULL,
    price real NOT NULL,
    freight_value real NOT NULL
);
     DROP TABLE public.orderdetails;
       public         heap    postgres    false            �            1259    16605    orders    TABLE       CREATE TABLE public.orders (
    order_id character varying(50) NOT NULL,
    customer_id character varying(50) NOT NULL,
    order_state character varying(25) NOT NULL,
    purchase_time character varying(50) NOT NULL,
    delivery_time character varying(50)
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    16617    payments    TABLE     �   CREATE TABLE public.payments (
    order_id character varying(50) NOT NULL,
    payment_sequential integer NOT NULL,
    payment_type character varying(25) NOT NULL,
    payment_installments integer NOT NULL,
    payment_value real NOT NULL
);
    DROP TABLE public.payments;
       public         heap    postgres    false            �            1259    16657 
   productdim    TABLE     �   CREATE TABLE public.productdim (
    product_id character varying(50) NOT NULL,
    product_weight integer NOT NULL,
    product_length integer NOT NULL,
    product_height integer NOT NULL,
    product_width integer NOT NULL
);
    DROP TABLE public.productdim;
       public         heap    postgres    false            �            1259    16643    products    TABLE       CREATE TABLE public.products (
    product_id character varying(50) NOT NULL,
    product_category_name character varying(50) NOT NULL,
    product_name_length integer NOT NULL,
    product_desc_length integer NOT NULL,
    product_photo_quantity integer NOT NULL
);
    DROP TABLE public.products;
       public         heap    postgres    false            �            1259    16626    reviews    TABLE     �   CREATE TABLE public.reviews (
    review_id character varying(50) NOT NULL,
    order_id character varying(50) NOT NULL,
    review_score integer NOT NULL,
    review_creation_date character varying(50) NOT NULL
);
    DROP TABLE public.reviews;
       public         heap    postgres    false            �            1259    16666    sellers    TABLE     �   CREATE TABLE public.sellers (
    seller_id character varying(50) NOT NULL,
    seller_zipcode integer NOT NULL,
    seller_city character varying(25) NOT NULL,
    seller_state character varying(25) NOT NULL
);
    DROP TABLE public.sellers;
       public         heap    postgres    false                      0    16589 	   customers 
   TABLE DATA           a   COPY public.customers (customer_id, customer_zipcode, customer_city, customer_state) FROM stdin;
    public          postgres    false    215   )                 0    16677    orderdetails 
   TABLE DATA           l   COPY public.orderdetails (order_id, product_id, seller_id, shipping_date, price, freight_value) FROM stdin;
    public          postgres    false    222   �3                 0    16605    orders 
   TABLE DATA           b   COPY public.orders (order_id, customer_id, order_state, purchase_time, delivery_time) FROM stdin;
    public          postgres    false    216   �M                 0    16617    payments 
   TABLE DATA           s   COPY public.payments (order_id, payment_sequential, payment_type, payment_installments, payment_value) FROM stdin;
    public          postgres    false    217   �a                 0    16657 
   productdim 
   TABLE DATA           o   COPY public.productdim (product_id, product_weight, product_length, product_height, product_width) FROM stdin;
    public          postgres    false    220   �k                 0    16643    products 
   TABLE DATA           �   COPY public.products (product_id, product_category_name, product_name_length, product_desc_length, product_photo_quantity) FROM stdin;
    public          postgres    false    219   ju                 0    16626    reviews 
   TABLE DATA           Z   COPY public.reviews (review_id, order_id, review_score, review_creation_date) FROM stdin;
    public          postgres    false    218   ��                 0    16666    sellers 
   TABLE DATA           W   COPY public.sellers (seller_id, seller_zipcode, seller_city, seller_state) FROM stdin;
    public          postgres    false    221   e�       l           2606    16593    customers customers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    215            n           2606    16609    orders orders_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    216            r           2606    16647    products products_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    219            p           2606    16630    reviews reviews_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (review_id);
 >   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_pkey;
       public            postgres    false    218            t           2606    16670    sellers sellers_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.sellers
    ADD CONSTRAINT sellers_pkey PRIMARY KEY (seller_id);
 >   ALTER TABLE ONLY public.sellers DROP CONSTRAINT sellers_pkey;
       public            postgres    false    221            y           2606    16680 '   orderdetails orderdetails_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orderdetails
    ADD CONSTRAINT orderdetails_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 Q   ALTER TABLE ONLY public.orderdetails DROP CONSTRAINT orderdetails_order_id_fkey;
       public          postgres    false    4718    222    216            z           2606    16685 )   orderdetails orderdetails_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orderdetails
    ADD CONSTRAINT orderdetails_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);
 S   ALTER TABLE ONLY public.orderdetails DROP CONSTRAINT orderdetails_product_id_fkey;
       public          postgres    false    4722    222    219            {           2606    16690 (   orderdetails orderdetails_seller_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orderdetails
    ADD CONSTRAINT orderdetails_seller_id_fkey FOREIGN KEY (seller_id) REFERENCES public.sellers(seller_id);
 R   ALTER TABLE ONLY public.orderdetails DROP CONSTRAINT orderdetails_seller_id_fkey;
       public          postgres    false    221    4724    222            u           2606    16610    orders orders_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);
 H   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_customer_id_fkey;
       public          postgres    false    216    4716    215            v           2606    16620    payments payments_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 I   ALTER TABLE ONLY public.payments DROP CONSTRAINT payments_order_id_fkey;
       public          postgres    false    4718    216    217            x           2606    16660 %   productdim productdim_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productdim
    ADD CONSTRAINT productdim_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);
 O   ALTER TABLE ONLY public.productdim DROP CONSTRAINT productdim_product_id_fkey;
       public          postgres    false    219    220    4722            w           2606    16631    reviews reviews_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 G   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_order_id_fkey;
       public          postgres    false    4718    218    216               �
  x�}��n�������$�}9f� f��To2������5ES�0d[���me���bۈ3����Ci�d_L�NE���Nrj����/��Ft�Q��6S�4��f��Z��V����6��&��V�Mѣ�̜}m2]�e��SQ�d��a{���8������z�g	�{���~ji#�����\�ѫ�q����I.��G�6k}�͙0�nIʬ�go�I�ݛ\^�O�&�n��Qb����%N�u��*�l��]^�����{Ii�otlNG)���B�"e���g�m�~�ǵ"J��{�F)��R�CW���VY��q����=�a�ۭ0�:�N3b���H;Mm���T�I����\[J��vLo-K1i�7����e��	����i�;_����ֵ�Qf�Dӄ[mu��2�%E���Yb�|W��<����H9Iȹ[{������Tq���m�U^������l���a�	�FhN�4b��m�zߟ��^v]vm;���?�E���U^$��,Q���r�e���L13\&�����rn��XӜ7���ԝuɴН+A�\P���8���Q���LX��$J+Yb��N_T)>jն��(���iҰ���j3P*:��m�a������E��?�t~�*/�p/�>t��e�<[�)j#p��ؒ�zc�M ����dI��b��Bnnڙ\
*��)������k��5e�2n>t䘚�NTp9�8e����l钴iÛ1�Չ�R/�]�u���"�����`��6{����m��8	}emx�Al,����J5)�����9�J�O�����pF;f��8�'�
�K�Y�
߶�y�������7*�A[\����%JP��u���s6k�M�Q�L��]`��C����6�z.hI�҄����=��sx(��V/�T�c�YN���L6K���r��9�~�1A�7y���b�Vu��F��m;��mV!L��f�֙\Dٴʴ�b����OYl=d�z7��1?}��C͊���	�!>��}4ލ\�	=��(�5��i��vڭ#��^�>��ø��R��9�,�AG�z��qQ��F�ki�8�	&���;{/��y_E���*�M�霋�7)-kp;}dJc�2V��D��>��g�F�5�d���4�&ZW�0�+gO���rx����""��h�Ϙ�1�����!�����a�b`_O~�V������N:`�r�I��P� c\�	D�t����~��� ��D�˰O�]�D��v�.?Py,�F��H�iݳ��H��N?�i[ס�&YhA�ҳGVc4W�m��#��W�N�����z�H���ΐ����O���ѺQ���~�����`7(1�*�W��9�w�r�*w�^� +8�nc���E��9D<o�}�tڀ�O��"�~ᨶ�'	����E�n,W��t�+7`Y���0�����{�ҮY�ڟ/o���wK�������Ѻ�%������Y��q;l�+����=)C���uřR�$x�0t�G��z$�D���k�Oj)��M�K��qGrAU����v;$� N# ��R���0wU	��!D��m ]�;� ԫ'Q�	aO��\��.�\���
��N�c��<����P�0�/�|�z���E�$}��gj�?��� ji�Br�m�3����,��yaMv�w���Umʪ^�a��Y��ѽ�T��,&��kr�ٮ���X���l,1w��)�J܏��L�F����G&}F+@�6+�F����1|p�U��r+BZ����Acx�����-b�'$�����Rn(j/�n�PM$���vEwW\�b
��\��xL�I��#)�N7�atn���3�\Mo�5�â��>�.��-q#&�ā�V	�،Z��X��al�{Ojw�"�nQOg�|Y��>��
,��$�A�������p:BX;��pA�ǒ��R���Q�o�{s�yR��w���Q
��f�ZFF6����,��\�!Cha�Wg����>�;+�����,:S��u%ǆ�+���:B�A��$�������I��c�+�p�L�5����jd��o��n�#�]g�,!�b�i�6��B����>�ʌ����9N�
� �TF� pC����$�Q-�k}��8�����j�-A?tǺ���@њ?(ߖ��	.�: �&�8�<�|���27t@�M���ȁW5f�x�_�p���N�l#Z���H~���<(#0��u	LM���r����5S�e����~�:L@oz�T;C��p3������:+�\�s�i,�'C��7�F�b�_���;��������./�:Buq�O�'�.���McVF`�P��8�^�i�`Wur��7�d���B���!�a���������� �+陝��(xi r�Ǖ%G�8���vE,�OT��'!ѥ�<��!ve�N�I2���s���Er�^:c1iƎo�˥]��8���� <O��QT�����HτlѪ�qb�f��xM�U�InX=t�ɬdk��`Sf@o��}�_n%V����2�(�M�kN#~�d�	;�m}����ag$���D������|rγD�ks-5��~��8�Ƥ� ��a�����n�Zj�r=�� oV�o�JT�\m�(}ygg?~x.%�5���<�[������UΫ�������C�������,ż�f�le݌������6�H�="�w�:4kd[��	�F[q��1�N, ��~5w��f�ֹ�+��h�d5�`ł��J:$�������2��_�|��kk�            x��I�e9�e����|'����&l���<x_U�Jj`��T�D����>v��1�y�(k�{���9W�yו���{>�ά���ts����J��~B�gW3My�S��{�+���Qd�`��?S�O�_�B���!黾���Lb+�����u��}����L��k�%�i?GҺ����d�3ZnRӾ�R/}��s�{���\���䗕 ���ޢ�XoY:��c�Ҋ�o�qe����=Fͽ�t,[Ki����֟���e���ݳk�%��&Uw;A�i��S��b��V<�����X��� �MWO�6�s&45iY6%~`6��2
{;�
y�]�͚�:��ӵf-�ck-��O�����ߑ��XTv}��Z��8�|����D��8X���(2K.I��3��j��i�m����2F[]��难�-�����ȥ�����5�QK�[k����h�jȢ)F9-n|�lM��ɳ��ÊI����X�1��KIVS�������#�wc���ލ�kf�������,����mڮ}�����k��=�s�Ω��n=Ekm���\���_x�2�y�^�=�ACg{�eK/c���bL�ͥY)i�Q����;Y�=�J����(f�fe��y�����=~U[������[��x3�Qۭ)6&cF9`��â:'��'�dT~�m�֝iD}`V�H�I�l�/5����3�1�S���+5���T�AqԻ pb�w*c����ͥ�2�HCr��΅�R�5�54�t��9�N��aQKH�T?�K��a&���^�"�VS[��I�j�+m�~��c���]�-$�r����R�ZQ��.gƛeIꙊ0-2YV�(����g�\CjN5��jK9OHfGv[s���p�k�*���{�h�&�q؞=o�zC��p���2v��y���[���<�;���NJHd��a6��TʘZ#(`��V9T݂=8�#����3�R&k���b���=Wx��\E���[^����gjCuXe��d�Q(�0��c�Tra�T�`ۧ��#,�QK��&eMm�Sk��G�ֿ�&~��[}��<�$V>$�^2�����zq�TUmS B�N���o+�Z8���f�mÅ��96�*(�4��{���K�f/)�J�����X�|˺�F�nK�P��/ω��jO+"��L����PJ9����D�Ǝ�$���K�w֗t��P�u���P�c��Z����홭�:Ք��c� q��l!��^��nC�Lz�ifZ��X���S��KS���Q�r0��
�&�n�	�kJ:��B���9�\�Ts��D�Ps���8_iF/���hj��[z��	�A;kW�-Pq��c�8�u�m8EFP�m}���a3���b)o������B�ȵ��$/밌�Xpߒ�n��{z�r�X��"{g�����8��sdJ�آ�f�}J_��6��oSw7\ȍ	�c?����W/5��\ޭ��k���!�%1�8ơ�� (������'ڼ����v�D�˪u�<a�-X<��/rz�D�~�����������M���jq�m��6��bw����m8�ӛ� "���jϡ��@⸸���N�2E�j���7�}��g������a`ˀ��}6	�3J���w��Qvv[ E�xj��q-e7�EC�:S���)-���s�:V�|1ђ���8)
�����Cvj��"��l��:��ߩ����D(��1��	���,�z�N4���e�'a����
^��ذ]I8<�^�a�6*R9�Ѳ���#5<��R4y-(a���Β
�N�h�g�";!���,7�`�r�M �E�0d�8l�dC�-������_�����8� �d�j�M���%�5�i��4��v��o������ml{��FڜVdY9�=�!̐!lUi�F�iN� #	"�S�]�ΐ$��b|��ب� ������/��`�� T"ՏvL�$�����P���q������%1�������E�R�M_y�D\̰Q���hIE��j7���$1|%���'�&�wW
5a<��n�q��ߋ�[��d	#�u�F"���;�xOF`5]WoW	$C��u�aG�5y
�b�&T�Ji�,D����7�MH1/�
���Y5}y8A]�ǽC3�e���d0��0��6�CKs��!l,V�,(C��FO�$��3�>L5�)��]��78�~W�N��}���3vBZ��-���H��|g�O�)D6����L�7X�3��S�v_�F1�j�Ѕ���1��H�������W:y9��rE�ùk�L1�ڙU+Q9�@�as�)�����R�� * R�����Q,(� 9����#��i���I�=5�0�%q/s/�uÎ��4T7X�4��5߁Q�W!�$�v��^���D��N����{#�(:�}��zhJ�����a�Ϛ*f�?�@���Z.�芈�g�ò;�w
~�B��Ԁ��hTye��{���r��j��g��yb2��5y���I�mS�+x�b�9]��1a��/�^V׏��o<JN�#�q�\���Q���������#H�b��l/[)az�+�	qC;B�-T0�ĝH8\�!R��;�A0�vP.�������`��Y��e��Gw���?�<-����gI�]�=�PK�;��#j��$�!8l�V�H����<����N2D�~��f$}�z�C'=��?�_lV�.�(D*��H���<�X8�E
��
1|}6lt����w}r�3:�A<$�H'��*��Ċ5GW��p*��|]3��VGR�OI����<��NH*�$K�z��NL��w�~���@�n!9��X�|��/e���^��,�#�o=!>�B���]�\f	)�m 8�;��ݷٍ=9��wc�C�ǵ�ګ�t�F^�50�m?�p'8���=D����5��;�D�b��B�X��n��@n�䔊4�쉁�J\u'U~�<�h�1<�ȑ-� 0	��ʣ��Tx[��}�U,�&#�S��{�Ф�Pq�c��@D�习���$���ޜI�㠅����G2��Ip㋃M�L�̊~}�`,�V�*���  VL�S=�-���P٪vdc�
�6؍�(Ld��;�S{d��Wů$����-�6"	L'I`UȌ���� %7��&_�K�� �g�In������#5}3l��X�J�����_�No0�H;�P�E��U\�ষ ���dP��W��ߙe��:�U�w�A�48=3��X(@ ެy������>pUޜn�܀�a���3[rN�h�3'���o�+�ga������Z*ƕ��0�:�,�O�?�SO�b�a�{7�j��Nq��$l	?{�1O9)�t��W�e�8b��~���,���7Q�l&�t����Ct;aؽ3���:����.����&�|	Fv��q���*;�Ym2�eӽ�5;|p���ɩbk{���aI�;�	�Y��b��(p�ޡy�b���p�Q�z��$��3�r7+en�"@�
dN���u�9�M������$��[¶�g������p��.�j�>2.�l��@��7�m��!��V�7b�+�ez�����.C�Q��� g�~I��j�?�Ft�����^m���"v	�NE����n>>�%�@3�H�� /�����"���:�q�Q�<+���⾑'�M��; 8{<�F�&<m�
�-�>q�ʹ�����@?��AĴ�+�	w�Hڠ�n(dQo���?E�}wc�=ݩ�o��&��&�F�pb�<A�
:�ռ�pu��9
i����Q^�wm՟�Fn��[��;f'��P�&z�Im^�
Ϟ�����g���g%��Hy��F�3a��{����c"<-�؉���M�����9�Hkǖ��#��N�+K$X�aP��L�Ζ�s�������p$���r\Lp�W����%���c�߲�l;դ�zbw�;�&�g�m�h�Ϝ��X��L&V�Bo�ΜI��K�7�?�Mžh�m'��ᥰ3g�
��(/�!�`��%�v��-b��%3���a@9�9�700ً����s��S~ �	  �	O��d���鹻�
�p���z�aq��3��N��p���Ȟ��$b ���b��1Z^h�.��4������Q�T)�wMO�ok����*SM+U+�o r�*~q��\?N���ڽ<S���L�5����IF��ϱ?L��roÂ�Z9;x|��"!?D>0-m�.n��K�mL���f��+aU��ī�J4y�B�qPɺ��$���0o|�K���k��1�p�A^��H�~��Χ)�K�'�1���i��^H�
B���0���
�%���z�.3ԟ[��Ѿn?,18ب�""��� ONMm��7H�J�u1��"�l��������V'���V�
�>�{���-��n�FY�o�{���	G���if�����3bGP�p]l?Ɵ�nl�	��Ps��	C��_�B���?vV^�熕c���8���#�V�ݡ^�G��F�����{����}W�Mذ�_�ajX9,0����m���"�r�:�M��U�����~��]`����jL>��=��aY�G�-T7o������6�������#i�zC�i�����kc���q3o~^4ȋp�c-;�6ʹJ��$�F~���a0�����&�#�l?f� �t�a7�<��`7����Q癯���9V>+��_��̖ċ���C�B�zr�$�x�����p�b"7U}J%r&	g��l�{�ֹSA ����ds��ϺaEz9E�$T�YU%yC�1�J8FX-�;�_����1�N'����������𭿰�cﳓD?��7N}����]����`�1e�ۋ�(��N/uQ/�3i�qU���K���nQC����ֻy`�7�D����w��LA����ډ2�|j�����#AyUC@F�ۺ�#�x#�y�O��g������G��T�$��}K�k!|���V�m�n��a~KQu/���s���J n5h�x� =��2�b��x���L�i_�G�x÷��ż�̺��А'0.!H=�X��{�t����_q�������B�v��lC	�~�B~��G2l}�����T&;������|"�x�$t��Nu�ʞ^��8��1'd%���FL�6���|�l�^i��x�\�Q��^�m''�4�Z1sl��0��\��;���@D��^�`aE�E�&,�fCi-�S� ����;�~2����'��|���3-"��uf�h��{�_k�u�=�Of�I��\�:�|��a�ʜ�M>~����UV��o}~<4�3kg-��]�`��>{�������#��k.{M%s�&��$��Z����ϵ�#�mȕ���﯐��
i�� e��@1���H`�k����+(!�=[a t��e菿P*��g�}�$磷R��}0$�Qpބ�&�'�Y�j��-I���b�*noĿ������r��q�X��g�ip�����=cɎ�"J)�j2����?�ކ���7���-�_�_���z$����$�/���Sr������.Q�?%8yS&��Tf��h҆L<BG�:i�L��@���/䅝�?�����1r��y/����MR:	�f���=�xǄ�I$Ђ���N��!��r��F�Sp�/x���K�_��43�E����U
��$B(���I�$�%��q��֔Sh���1'�������[}Bo�I��}������2�)��*#���@ñ��F���-�U�;y,7Ii�}�Ǿ�P�.������<�մ#�DS�s�'���I��S>7�~���{��A��ܩ �ß%��>H���~����u�-���s0	F�g���mLF +�#�}�z��g�퓁��u���> I�@W	!.4~�i?o���O��'��|&�6_l"e6�u�T�I�OOK@��?�ه���Ί՟i!Q�*6��1�n���{�)�OHgN��^#��]���x����'�p���N�q����4�:m.�6'z �Y���,�߯�~_�fOއ��{���������2�����{�>�� ��@���{��{���ڟ�W,�c5�Ca�Jm8���"�5���r�OP�m��ڭ&6]�~	��QW�k���ˀ�1~|c�/��(⯏�|�)t,{0Q���k%b�.�AYo=vB���t(ݮ�io1������`���)��B����$�~��V�«����߮{K����k&�O�R��:l�,Z��	:(�Nn���i��=���_(�1������?/������9�>�����n���̴�r�ej�fJir���`��3Q�u�$H�s�MQ��tԟ����#�?�._�����;BpZ�q)�����\ށ�0���!X�D���ܭ7��X솳L��)���X�%��?<)�����'{9�������*�<~���J�����4|#�C*�NQ$�(k����y��m)��?�W7s���z��lG�o            x�u�[��F���K��L�\Ĭ�_�:c��mL�>�䑎
���J�
�_�;���^f�[Z�Z��)�:[Z?�s�M�J��1���b��P%;�c�����ך?D~J��N�?$}�r� � ~y=Z����_^.;��I��t�5x�EK�\,ɹ���\ޭ��Y����Jz=�~�,�w�����G���Ǡ+����}�>"[9C홤�5[ۥ�>��3�5���#�����l�r��)׮4�hKW)3���/���zo����j��+������X�i�2�G�r�J<۰u�B�p����fh�
ύ~T)�����򹎹F�UCu�K\ٍ����8+{t�PAY��e�9��1r8K��r��]^�{M-�a���0յ�j�m��CM��.�#��k��Ǐ��/N8��N��ؓ�)�AH�#�B�C��U�Z�=&s�T|��צ�W�,�k��\>��T��8��f���
��6g�3��R���`����嘖�ⶖ�M��(���u_1�UG:|ky�T�b��S�^,Zt}�xY�N��*R���{��#Z�[��
�~�"����K+W�铪��w^]��}ƪ�׵�E�S�mx��w�"��$�[��u�
rh�D}v�k�S�leP����ڝ=��C�A�c��V��3�U��ٴq��;t��|ue�I�����0��S��K
*i�~���^5���ػ��Z�Q�SF�[�����Z(��&�W}� rin�W�鵭����i���ϸ7�T-�������%�����~�r(8�|j�Ki�W�#���NN�l���y�(�8|�@������A���~H:��K�� ��$m�P�����"*���]�ӫ�2���~�]���gk%�`c�UC!A`�$�mTb��[0~��(<'�-�QKKE��P���.<����!���^�5����+��+��hF�-�����+V��8��˧!��z�XO"�� fv��TDYW�j(����I&{�H�@&+�=R��������{U�Y���P���J�[H1��f�������Hն�갴�{���9�k������f*0��ڿk�q^4�*�u�iA�kUZ�藜��tPr�Kjv4sIyx�ʷ���3�\�ؖ�ךCtux��`l������׶h: ᑝ�d��.��<?S(W7��Zl��m�Ъ���4����qY=��A�3VJ���k�m��)�-��Y����K�P�!�*>���SG�Z�T|C	X(t�Rq���%g��$P��P(W��^�^���O-9P��MR�@Z)�N�R���N
c�J2*�]�A�>!Cߪ�K�5�;���@W��!�GPjם�U?5��Zb�2v���oW��'��+_���w��g��Br�4%h�Fh��g�T ����Af1ݑ��l�NB!�GY��0�!?��f�U0uD	ȦY(Îl�<���3}~̲|t-��Sɨ51���T�gM�c5��#�AZ��F�ڕ�`^�t�Mf`�fs���2e��LH�m��.�<�+�N�ɔz �:g�Q|Hp;"�8+�A}FJP jh�
�S<���M�39}e�-��#�hN��!E���>g�J��1ŸDC�B�~�IE�v��#{opU+l[�7(Q�c�&��m�h���c"zkE��3Tc"�� ��3lR�f��������~���ߗA�~j������< �$sg^|�e��n�v����:�S���$ :,6�x l��=[l�yv!�#�{"�B�aN�S�M^�΃_
y���O�Ta�������7>������c:hG���PK�#'wh����[n'%t���@���C��Z����^y	�xmR��Gk�,�29�B� �Egd�x����ɇ��(��`$�|D�?����F�x�6�r�	��f��QI���G�Yv&�-�1�n!ﰚ�����rN>�T��@�x+県?&<4 ��+�Y,Hm�M��?B�ŉ���<��ݵ�S�W�������Ń%�O������t�{GL��f7�ݜ9,Hy2��oTm]�5:3�Y�\�����l�������Q�7b(@K�B8��O��%����B"��	�y�S�̦�Ṗ�+��x,�|->��k���^J��N)�n����2�lm�5��2���W��Y,H|�`F��֨RKj�����:�¹��䋝���S��HC��b8�j��h#��E�a ��5��b�(���.�!ho�P�!�o�y����z�HC�8�VMv�K�W:7�1% թjH�K6n YbaÏ��w�fH���n�z`�R.�$��2�	��Q���0ST�N���dgW[6ķ<*_]�Ռ���,�e9��C��ڎk��8)�P���DyL���ErE��_����H��m��^1m�!��*���,t>���lA����(s���G�օ�MO��z�w�Li�}�`FX�b�d/�c퍅Q'b��+`�HS�i�6�4��N����믿~��~�]jz�JƠ0. SR��"(s'
koG�����FȤt#��`�R{���ِOnin�4@�&g�����RM���2x}�2�Z��EC@�5/yy���垐���$��E�X�7~Ц!+��P�f�ך��"�j:��1���IY������-7
��G\���|n+U`����`aQ���c�(����R.x[�� b���묲��u+2uN�R��O�f���Pl㴓���I�;e�n�u��.+�V0Jh����G�%�>r��$Md��>��	׻�� m�"WC{���P�֒D���2 �j>��3�O��\
�_*y�!��׏X�R3�B4hƣ��8���ɗA�ց*:���5��`��M�l��C�ǜ��� `��Ɯv>걷��M��@n�:�6iޙ����z�@"��\�.0ޣ>g�wթ�����(��o�\���v�d �mp����><�tk����woY�uM����s�\�J ���ֲ����
ڮ�8Ň48
i.6�L`R��7�A ��a��.T�:jjbDzj ��&��"�"F����st�B��[�cP�V2ζ���r�4ǋ�P��,��nC��`�3=�(Ú˰�i�Q%;��폱~��' ��
m��'�vÈ"�fm;�c$�A��v�J�Qnd�+=��=����k��I1�$�*�h@��x�@���>�-a�l+�v�+܂h�瑮�+]'Dm���������#G���p��D!/hQw�P+(}���<��ݩ�6o��t�Ln:�|��G=������ܔi�P�� YE�*�J�e��oA�t�-�k!�����v��h��t�` �KXg�-+����ue|GY�RD�D����=�Fc~��7��6@����{&��q�pJY_���r�*�7����$��+}�rW>g���z�=��z��0T Ȉ����ͳ���L��)x"h2��6�ˌ�r�^>�vzz�E�yS�GFU��h
�%��:
�}�)��L�e�?7vԡ��yy��Z�ì��zl���	��g�^���ΰKP�
�t6���z����J�!V�Q\�jN�e�eh�B���)��9�W��5+R$������`���gl�n�"���s��"h ;��؃\b∄;�lQ�cTd�*�2�֫�b�v��5�|�W��A�� ) S�U�w��p8��X0%A�?$~�/!��e��C]�yA{q�Zu��]����F� �Vs'��3����͍-�u��.ie�g�z��ǘ�OP.�Y�y�����(_!�;oM��A�dL�`q�&������9��_2�4���u0�,�NB�����s��g��m����\�Fݦ#`��Wp#�C��\�u[��z�)�1�3�a3�T-J}[kW]�9�����aB,�rD�t�n���Ө!�	l팅I��\ �fS��#��sԡ��+�E��"~�`����z�A�ԣB�c�'R����2���SZ�=B?)�
�ߓ,����
G¨�����I�(���I��t᐀z�MB��G
�ӂ�` �  ?x��ڜ�*�nm��V9�5��a�s��g4k�gA�P*�z�*��x:T��A?&���t�z�8/D_��l�>1nf��Bጫ�l�L�|q ��-�FJ�|6���̏f�wDr2r�Vؘ�<N.�HP�Xq�5��+�3U�h��/���]!�����x�+���}  3w3P�a�e԰^Ѻw�L��Ҏ��M���c_����1��1
qҮ	s,{��bJ��E�50BʩBa�nSgVM8�=��ȕ�`����XІ�s(keq@m� �<��v�e�m6}��8�l#�Ģ�QZ�At�����bz�K=" ]�,��W+�#'TJLWTv�&2�^V��OTN�*�����<L�9�m,�H�6����C�AL�H,lTHkվ�-uK'�p��	vw,�)G��ξ`�Q"�h�'_�D|�69��p$��L�>�ix�~�V�M�ݜ�N��G�w总�d���c8�5Hпf��C�(H�]�cFr}'rz)��N���O�'P�e#�̎�N�&Jg�a����k(�LrȞ]?I��m�"����D��WR罚-F����	H#�6����aK�Y�\���d�Kz�̓�[��A�e�<�D;����b�q�l�$m�A �p���tH?�������%�?��)���� *����`��Q��9#o��]���Ap<�D�d��PK����"��ւÒt���g5S(vU��H��n_����c�D\D���	'�% M�˕�M���t�i��RE�y�����/I�u����  �(Δ�"�	d��H��>�g��eձ�W�`H�>�Y�������6d�*~��5����Q �9hj��H�=;��t��C�O�*@> �-�)��ם:���i��v�ަV �	�Q��������I�Ò{6�����^ R��������퓢6�1�Ԡu��''��e<����o�y}��J9���q�b
@'         �	  x����-�Fw=LaK�e�K �J��!��g�I��@�4lUٺ���V�-�1[��{	�6}X�����k������Wt��Ri#I(Yga&_:v�0��2�f����<��]�(���s���0bu�G�}Y��
����i�F��t�X��鍨��?�?;�~�x�YVP8b/�k�����zO���Rn'���JY5��5���L!����W�w!l�9g�-����8%�V;��J���,v�8J��m�2��ͧmI>xmz�.~%�U�譆D�,��e{���Sk����O:b����*3-��|-r�s{V��k�c�b�)��Z1'��2HQ�s����4j$�q;�f�������b�XV)�πlw�$��5�8�Y�|yĜ[W���d��~�b��}��1��s�!-�}���������O���%e1k�ci�+ϑ[�!���&�w%�r�d"4	�f+%�?����U��.�tx�f�},�z�<[�=k$_���V�x�}I����^����*�(��/i���!�3��E�8�g�T�"$.�&���)���vy1���t�\�:���.Sr0J���3��a�Ϝ�ߞ.�2c����i���ɵ����s����.�Ҫ9cȜ���6$��|���_��]����$���ʬ��i����㸑��`�-��[Mui�5;1Ely��C�B����YG�5�#Ҫ[]S콾G��j����ܺ�ҋ�׸떙����>%U������ʇ�:[��Vz
=KzV-������J-m
�g����4^dN��̻�F�=Eb��vX B<�._��r�!8�w*�"Z�Ki�y*���I2v7��t���ܻ��@.[{���+i�Q��IL�)�h���%�g�P�Z� W2ϰ}�>���W��jtWG��y30P�S�!l�n��6������h�[YK:7sD��F�m�&sȪ�r�d}~	�^E�X�J�	ȡ(kG�[�r��V�iĸD�)�=Y��Wυ*>�G+�##i{�j�Ywl&�T�Rgr�z�A�h����W�}V5���v�Z��	$WQ���/I�#�r�8�3u��RE�s�·�N�f�$��0�=�CIu�}IW��k6�{Ρ��{�
�w�_���R9��XdE�^�BW�Uf�츋H��I��%�"q�����l�8�r$ݲj�/T~�\.��9\JNU��ԥ�1����O���S�hF�8�c�J5�_G����*ٸ���5ػAE��5(�4����ƛ�|�`�hb�'3-s8���7z�-N��-t2M��
�;��JnO)_d=��|°�¡|s4�3bz"�S�����E�$���m����;<�xR�e�8Z'i5�F���ٶ͞=����ЯB���6�tZ�̛oY3��`~�k�
��-�!"Щ� �m�I���r�&  )�l�d���	}W�Z�$�?���HzU �[S���d��?L\C�w��  �8�ї�Y4��'< ��j���Û��b���$3��f�h{��!��S�9e�>eE�_����7�8��1�(���Cet�F\p�`[j���:�<���f����ʞr�"���ƶas���G"�[3gfz���rפ������ن0;uS������sp��h&�}PIǗ6�C��?R�b��e#��z�ב��"a	��my\��a�V�a�W�Nw������0�.R�Q)[��_l8�*��U�����9P���L3ܥ����rJ@w���I���`#*x{���vG�]�N���wh��
�DcY�Ǘ�f��1�(5��`�CdݩEJЎwG=�5G��J`��"h��@�I)�j1ѩ�4��ӱ��PAE`�
��s��������r ��a�.��ܬ���?F(:�R��� �s�R�9�������x���dg��4��;))�$�|�����k��[~��6ͱ�j�|©�rhv�ra>6��tz�A�l����9Ki��6X+S�Z��B<���K�U{�:����y�g���-��1x�� <�1��m+��ǆ)^�����z���I�4
�H�X�)��θn�s��,�bhD.�-�6-[�"�i�� �⩉���S��+vs������]�i*�`�Y���-T��x�>���9Z��l�v�n��ڂq���1����:����#�OG�ψt8P��S����_d�(��j��/�<'������2g�\t";HH���#|[%�c
�!`����O,�`�~U���˲�� ���V��������X�脕X����:���٠G�qG���:�Q
(�(ۛĈ���c�ɞ�k�8'*r<���r�G�l����V4�w��܊�ql�og�.���՟���VO�C[�OY��s��;��8��_�K�;2�%�
ގm�8R�I�n�L�)�6�[��c'6���5EUK���yv�h�PէDM��X����t�[_ێ�O��QdV�X#���8���o��u�微�?d���         �	  x�U�[r$+���sB��y��/a>eٞ9ն�;M
鿩O�uR�>ܽ��=�aE�^����{JOMON��OKb���%�ռ��<��e�J{�����sN^�.����6��Tϑ����ΓM9�}Z?��&W;c�#�����x;�ᛧ9\*%=�}N�4]��'������>J~��G��'�'�N�*�.���Zm�����/�iq4���9��q�ժ=�ݫܞ��QVoK?����)��6|�]G���,.��]˫�8�.�"�����\�0Z\�g�s���^+��H.��OK�m��k9�Sn��"}�+g�us>�9-mi�]�H��q���.��Ǔo�ߖz.����lf:�N^���p_[��(�R��>Gv�u
�uڸ.�qn���|����wMksQ�I��<N?6wK��|�;}@Li��s�h��<��A�r�ν+�kߩGSZ��yr�=����Nց`�9� ��K�h=e�ϣ֬̚�՝@e	HR.]L'~��YO�4������m����os�!�7^��m]%5y���.?^�����ї=��ŏ�೮�����m`�T���w>2��J!k[a{Е�t����?%�)��3}8O57��7h�YM��M|��o��t��G;4�ӗU*թ%-��k�ڶG�)p(��M�m�>�	�f�Y�Ⱥu��G�����Np�Y)U����H�wej���0��?c�j��UjW�4e�z!�jIy�AߖT�ظ��"��y���yكR��<5��2O�������a��"c�P�W!�S�J�mz�����u�5?���.D���g3�ǭ���HmrG�;�;��T�D�B��lМ��3нᅟ�y���y1us2$�k�B$n�������fL$3�����̹uj�m�.��)���򪣫�h�q���^ǭ"f���<GW-��d�.H}��z�[�3.�i�����C�qM)�/v�O��= ���H���ҏH	Uc�=��@@S�sC:~Ɠ���������K9�f�XAn�k���"�@���BԀ�Pnх��(�4{j{dP��Y��-q͑+n�����%I(!u��Ԅ\��=i�.~:w�u���}��_�sk:��3�Tn�������{Jb��⶚_�i	y��B+LwK�������)����������Ȕ�_���B�o���ӄ�s���1B+�Y�����	~�(��8C ��?%1 �z_z�9p���s���
�Z�7H 4��OL����M_��/ zU"�؃E�)�8�EB�M�����3�MI}ʹ�ԓm��N�%��)����V������g��2�!Yʖ�o���o:HN>:���p&�u��N8A���
>zK��t} 3�;�hD� :�l<moO���Yo5�� ��&7�|M�h��7t��G�6�yά������i�W��[�l���L�5�RDǀP�g~D%�SG�C�A��m����bVJ��%>2�ݭ�/mc��8Z�@���F	�-QI>"~#�͜�#T�䔒�[n��A�"|@7���G���%���W�g��/U��=����s��>�5ɀ����Jr�?� �7eq����v�gD����_�
ޕ�o�Gpo�Ԃ_V,���������~����.�!C�1�:FX�����!@M��}g�e���p{��:��9��@�Yk�nM�y�	d��LF��@���H4}��X���o.x�,p��8T䪔IJ�#YǤ��G秇�2=��Yw�mTb���6���.�ſ�2nZA��m�O�tb0X@���z�R4;�~�G5�� P��$ܟs������3��	�$�b�1�fr������h�c�B��	��C|��
y
��W�����4֞���X�Ɨ���2I*�Q��i(������Q�\�F�C�f
0��s�A~� ��-/|�t�i�ѿ�t+��I4��	�/R^n�E�Ha�mD5ڈ��1������tW�c*��{�V����(�=�(�s6��J/�[�=/ ��N{RZp3��������?��D"d�]�W�9�')� ��in��{FW:���#<HM��$�E�G(��
-�P�c�c)Ύ�i3XD�w��N�&��  ZP�|�OXDg�@}�wK����Y$�@r��q���1�T`6z1<�x��h	5��"�g��LӃ_���$	k�̌�g��Mf�@��F�8#��h�㰉v�E'=�J,�~����fB�G�/����ԁ�wY��z�NQn�)���	�
�e7t����/�i���$�ݰ+6��c+�ࢾQ)�,�8�-�uk�w�z���kv}P��"tO�e�a��=�h�9���������T3��Frj�qb!!���F{�ס"+�E�ex�upD{N]w;>��0�l9��d ����0�1]�F� V��Ƽ�o{%�C�,�I=#���̬�m�W2_	��$<�rH]�+V�{�a��W ��������|�[o�           x�}��n\9��~��D��e��p�۝�v�<�~jO_:8�7�D�XU<��R
yu�nZ�y����������z�>�5�z>R;b	�?��G�:�J�fj��e�ﾸ��NhGno�]]o��/c_Gra�U$��Z=.�������������u]�����O��ay�IkNc�b�j(�8�ɝs%�E��)�ZVQ�CbÜ+I|�=���1�Y��U���y>b<��EZ����F�qŒu��Ө�r|�o�I/�z$2m��l�*w6i�9��Z�͕���Z�;�l9K���N�$�2-�<��8��������׭�p聾�\i�Yg��$��,��?N�)��|�:���[S{�nٜ��W�_����z�������5r�_9��f�9�ԣw���܈9ӏ�u=-;��p^��I�n������,�S��b�>$��(���u�@é�5�.V�b!�i��D��}d�ys���
��>�k��z<����p}�nv�x��v�\i�Ҭ�Hs&�yڙ��{>l].��Qz}��^���N2y�8����3�%ּ�<�$g�W�E/��}�������7d� Cߧo~�i�ͤ�b�A�x�'Nӱ���l��C|ݡ������44I$���-��n�:�(��g��<�j+��~7�r������ �>J�b�<��-��b���e�4X��V�Z���K��#���=��rڕ�᜚3� \�30W�S��?=>��㏟l�%��f��˘�ԑ[+1�1���_gE
C��;'��L�Ms�O ;���m�>\�<;�;J��i�D�M��C6�V��K��\�2���)�L+\����`k%�ʥhq4g��U���ݹ5D����%�A��� Qӹ|����u=<�u,��܊�7hӲ,u�{��j�&�A(On��Z���g�n��u������e�]��԰Rt�ڒ��)�_ ��a�a\٬�ꓞ������}/��<� �lJ�t�9?]^�*�Y�n��J�͂@��p���>��L%�����fQ�[
l�_�c��.��K4�I\Ot ��t�^�|<�<��ӕ�Y��A��(Tl= �M�=�-�w���O]�*���pJc�ɴ�����!DAr��=���'7S��Kd]L6Cqҋut�12�t�#A��,?�E#���%�S_ w������y�IM�7���o�vR!6�Ez����A'_/睤�"���S�iC9�� �<��T�(1C�wC#\r#��NDmET3�"�V�&��օ��j��&{��0Q��և/V�Q����.Rϊ��S�"n�sPVdD���� �Pz���{�ߛU���OR��H��sh-�#�Ha�#�'
e�S�\3� lg�;�Z�����{c���Rd
k�э�-̲q�N,Aoyy;�|�z�P���S=ܞ�:<z.��{$�(p<�|�3!��f�v�5�J�ܩ��� ����Zū�ѐ���`�5���uW��ia��h���ѱz�|N��sdX��R�w70x�Y|	�5�M�d�a	�ۜ_#q��"M��5j
��`���/��'X9��|M[�oU-1�k���p��QW�)C�Z^�4�m�^B=�}���m�cu�0!g#��q���ƸbU��;��ݶ�Z�#jiH>������ �@F��K�.5�wB͂%~����$�J$�h��#�=���!�Y(��ے� �c|&Hi�[�ބ��RqCJ��V\9�ZWOq�~��0�.��h|\��D�@���4c�a6hƆ
�5�	��'��l�{���-�s2����pҡ`Fq&�I�O����1J]�OX-2Z�c�Vf�pP�^p�q���}r��,m�3�L��J������3���X(;x���+��=����1�`��%}�we��ʌ#���Y�2����B����z��7<}$�x��ih�e���ͅՋ��b��廨�Ǵ�b�X�:e��ƨ����;�C.�� ��ʞvs*K���'G��FK8��;_������_��28%7�c��2Z :��M6���R�;�|�bߍ��`fjea��H]�҂�UnD�:��J�g��y{_lD�5X{=Mw��o��#��H|g%�nԥ�N�J)���&��-���B�N�����.�=�jw8��|*�a����DlY��Cuk����;������bD>d�M8+�]L2�����i�Pڰw̙������/c#���
�g):��� �VJ{@��m�S�V͠����x�5�iimz�n�����
�����4�dҭf(��&�Z=�E�2-�����C��̱���+b�1�I0��"{{��@,9�N��-;L+.���l�4��W��/c8gnw��T���_v^����ج1��7G�����BD����d�����{���cFbS�E[l�$o��u˘b?�F	��cJ#���D-`������0�ž?���f�JS�������bfZ�,������d������k�[���v}a���x�B�� ��*���|p_�cG����x��>3�5�P	7�]�!���� H���K f�N�y���;Mj&��y�f�s}Z5፛�g���3��(Vp�����"ۿ�
`��WL��oo�
�?�w�ܬw���/�m���������j~����t����v2�_�52z��61<�Z�:֍���wG�����4\f� �m���m�5ЄG�"~��l�'�k6l��ې��VO��� ���U��~����� �o��������.	�            x���M�d7nDǯW���$@����	��,��lO�-�T�1I���Tu�{�9�mʯ�����sm+=��<k���H���4�T���u?������#�WJ�ZV�j~�d�Ŋ߹������'U���MwZiW;�n�im�Y�iZ�����j�6����>[ͽ�����$�m�����[�-��+,��=��\�K��ƐY�z����CK^9�'�iw&g����)UW7?��.����<��y�Q�]g��U{�}����'m?I9���fg�[��mp�k~�-��dO2�Э�ۧ��qz�W�K����d.$�V�����5�eʒ��6�E�r�����7�=Zg�n*O�k���P%�";�:����Ċ����
��jc�4
eK��Z����="ˇN{��K/+��r��n�~���汼�V���K�Gj�J3Z��<b��J�K;��0I�ШU�E�{��Z�yZ���������-c$�j�<�ڧ�y������5��oi#:=���ֺ�:�qMe�utخ����]ŗ�C�WK�O_T��}:-�.��>�	?�RSI�q��z4I㢮�>R
��6��9�N�?�Կ�����*���e�ͳ4�V�bt~�ON�k��/ep����1�bc�����s�֊]F�X�t)���U���4mO��ӳ�դM��$գ���"��?I�w��4��d�Z��]��XyZ}�Ri�TF��#�i��s[yӭ�]�?R��/���s�Et:�OW�H���|ri҄���no�]�tgxö́%�{m��t��{�r�Ö�ܫ��,9On���N���ܣw����:ۻ:�:���fe$�JVN}�Y�T��{��h���>�ꝺU�N��Y�}���Ť�j�({���L2=�ڣ43�ز֒:N��I��\�����=�?�,�zo�=��8TG=�׺/�@\������wn��?w����YQ^{<y����\�Ќ+���,�.V�-cq�'g������vG�kJ����{I��s�9�D�F������d�vm� m�niʐ��|��Ss�/���]��8�R)�eL�i-��u��`[�=���=���X٣-crb����[/Lý^{�"w
�E�1�G齃p�m�G�����`$�j�Ț�3�?���/٩��4�W���-�^+�5��ݦӜ�5(��6�tYq-�����c��WM����&����,�1�]��槡X��D=%$fe ��r;-֨'������΋��ޠ��%��ey�%�0����LSU����Y�Q���)�^k9�Aԑ�K�����̒F�٧���E�����.d��A��I9�*�z�2B	S$f�c��n��#fVv�193S������a�/���/Wx� �r��>%�}�[}u���or
�ѡ,Y��!�a�k�9G����K�#���x��'��Q�0�S��s��|���Cj���m�u]z�y�0^	�̷ӥ�c"�G���J��P~�o,X���l�NKh"Ke�� =]����l_��{!kmc��=��Fab����چ�L'����52r�T�oT�;�|\�L�:���e�w��E.;;�,���h�n���:\p�A*����8'��u��M"��� v���v�#�v�e��S��A����Z:������P~�ycvkT!5�9��O���z_�� �v�+`]�H;�*�T�7���|<g����f�l��a��`/�=���(2D��,�5�C��R|�F�@� :�s`��Ĭ���4��jg�F����K��E�W+�Mjg(�uDÞ���k5���w^�5-��~��%��$��$K��:�*f]��t�a>/�8
7�qO������\?���$��:�����*iM��<��#&�Q�;�p'�j����s����<f��s	E֨NHm���k�Y��#�P|܉�h�T��`!�?T ��!x���ő�P�\([y,�͍�Tz �3؋��Ǒ=���[.�b��+���K�e�E*��8��\�0���1`��<o��3�0	Tc#;�#DνPTz���_�K�=�M^0������. �ܮ����E�XHa�9�?x7��En�4=Wuw,�F��-ϻ:;�ԛC`�V{�@O�&'�$����̜',D���6J�ou`�1���H�������x��}��f��r�j��@�8:��@�Z2���F�$K��p4ԁ���Ä��-�>�P%�aC$8p���M���ˎ��#�� 7����~���8����KOwЩ�,#{K�߶�Ql��ȗ�Ғ��ڐJ<h8M�ɟ	�1<4i�?Sv]�o<�3�F^�O��U9�z9�^r��p�ᑌj�М�Ea�Ǧ�}7��Wĵ*~��׎�PiGfq��ߞ�u���iZa��Ă�{UH�3��̼�zJc�+̇㏤���fb�@��2����[	���ӕ������E�&x,_JDO�p2	�Wg����*���؈ב18(��X_��d��qBQ��7�ƬP��t""2?O[;( ���O�-���T�נ��]G�����J�W��p&ŌN�Q�xmݩ�G�~l�D�!zn�*�~�A1m�C�O�� RDZ��w!"C���s��S����%A��rY3�mxI�O���a>�Ę�bd�����е�}
\O?W9	�DZ�l2[��L�z�V���k��p{��j�"�ȇ��٥F�4+�@�y^�zB�y:D�9`�d�2Ch�����ց��Ղ����s�phݞ�Y��æ@�RZ&Y�<� �k���%���H%v48�`����eɊ�B�A�4o�& Z�mK���=^�N�v&��c�����S* �z���H������	(��� B�ϋ|G����(�eF/��g,��Æ���e��鍧n�����d?�m?\�
K|Z<�J_����Qη����J�W�S�Gys� څ�=Sћ�b7� c�=�'���ϒ�	E��D���cX��/"w��8V��J��IdRO�^��P` �]q�
ݪ�݉ދ�btS�uq��%�������pgT�R�c+����xF���\��3�Y s��3=���4aX���s.snx�N�	��6���޽���T�o� ���L��	� �q5P Qz���/��}�F�r��;r� �Zf�[����a�}�k�-$c�����5To%#m���,�ÒG؛۝eqd��_v��D�y�ڜ�ҸK�mu�Im��u�A�0$|NJ�F{,ސ%]�� q�̏�r��;�Oy`��o�4%"b����<�xH:�Y�=G <@�I����<�L�̔��A��6�Mq.��}֢��#f�$F�C�0��/f�_�M�
J��A�)7�}�	z����.�3Y�(���O ���1��DRZ�* \�.#�H�q 5�{��<��`�A��g$b6��f����P���n5�h�;�>P&�d�˴="�� :�p�����?I꟒+�;��[X0��	h��$i�L��r�.i�!%�r`�7I�z������\�^Fyf��!oK���g����}HeI��*j��Ē���:��2"[���x�(�D�7��5pO�f�DE����i��L�(�{���Qw��7�O�%^��ū��sw���!ZhmX����)1���%�b�|���n�ՊO#��kk�K�:�;=�:"}�pb~<�X��㫝'^4Q?H��X����=U���N��~3@�7��O�#�d_�j�l��1��'�?��\Ieّ���(8H7�v��O�!��c���c�+�n���V;��4����_��֓�԰�{PǍ��>�1.���	e0��8����<�֟7�m���hQ�x�2Ȣ� �u"�f� ����H�#d��Z>�~�$p��xZP���F�,�\9��o>�6�����t����ʿ���d|�'�;�F����P�n2�!�����
$��oo�i :�P�̾�p���M�?LsA�R|�"�ǜ  #�����/��%��IA��X���m�# �   J��Â&H��"�:�V������X�ʙj�]�&��x���b�ɖl��0�`�耽��i�7i8�Lܤ��db5�1��)�sw�ŠГ�����6�E ��-�π��X ??���!_�������l b���E�3��װ�������2�'%�$h��Hq6����h�/��x�����Z��_6�p�������<�]         	  x�u�Mnd���O�����0�m6�"9�AK=h���r��,?��d�=��~|dU��(�C����u%U;u�!�6r?��-}�/Ͽ\���.��y��oO�|���+I]��'�=�K��o�)��M/Ϧ������ǧ�K]m�1�6���Em�ꓟ����_Oc��z���SQ�!�>��ecH�{��9i������q֫�~���}?��n�wk+���_Q��ٜהm��䪓tD��~½�r?`�C-�Zb��TL���}ώ�p����]Η�~9~����h-��{V�n���j�eʱ7��]>_���<_O�x��������B��|�EKmJH��|x��T��m���-�6˒6ꈾ!����K^%�y��b�������zx��S?�N���ݛ�XB�}��]kmIR�ikb	dH�v�Q�B(1�\�7	�WX~H.�ay�x/�㺝^�"ϔV��	Xho�G�,g�4�Y��J��0[*�������xr���s�+��<����|ɻФ����rY��Bե��ȋ�@�[�r���5:?�=��&.S��_�g׍���������>�U���r?�W��VJk�mJ/�.F��VI�X:��/p��UO�������C�͛�`��jIJu��p�O/$��)[ə@,�!k��!B��8]	�o{��f" t����^�ru���!)��՚�34�nU�r:�r��ݎ�%<:��D�1�,F-�EsG��]���BITؕA-?iw/ҫ;���!8󦯗����'9�ڗ���hnލ�y~�&����Y��]���_>�
�ӸJ�-Y�Sl�ye�k�h��=L+P�Q<5�r��X'���K|eX�7��ʊ=���	���}PfO����]\�R���2q�Qr9*,�a��&��zDjm�������F��R�/[ܟ�<?]�W��)��LS���w������z9��O??�n�l�fŤչZ*	Q`�졤��\�.��ؘʲs0�[IDYӉĂ�Bp�q��=����4��R�p����ސ#~V{�8��!Z7Pn�SPNO��L�|G}1m}KoCy�V���L�3�B�
��ڶ��x'>��&��Dp�g�
�&:XO���۞ՆW�� -x {ҿ�&�
�)%��7�h�
z�kVui��xcw�e�=aKhx�]is�����斾�s�a��:���±��0���6S�xqM�|�!-��<f=jI�>���۳]��TµC�i	Cbm��׼�n"^P���j���5�ǂGsa�}@��F,1�8�����t*�8��gY��c�8h����L羝��U#�`�C6����F7�;���6W�C.�ٜn�U*�U�z���<�}��I�����W�$��f)n\j�Gh�gi��lٍP� �P*MG�Wڞ$e�Y��t����Ĳ�Pw�DL#!�%m�����z��樑��7��w@�A��S��@�w�z��}�J�Ljw�#fxN&@U�!����y��cy�ϱ\8���k�Z�H�qv_tJ;�Y�hH�Q�9�y����鋳Z̓��hF����4��,3μ�����˅�x���'�:�s�����h4�6q��p�C�N�1�*�	4<���"�� �<ĵZt��F�	����#'3����#���^����Ć`�%Gg�zn$�|�gu*�Ί6_f
c�ZК9)M�U�c������-�\%���Fh���6���zI�!0��u�2A)�n��y����A�H%6�*�q�W�yr˨�,�����>7* �hHaqM4��nǒ�� �|F:=���㺀��4�vb| M!-t��Qy��ݬq�S �@H�G�o�|����FW����5����r@�r�	��8���_櫾�ܖ:��c�Ӈq��ZC4v�?D��Ag/n`bm�8������IN
�3	�c��
r�ƾc��ȷ!��ǫ�:?m����!�*��u��p��VqJnA9d��6)
hF"'<�Ͷ�?�3?�"w��t��5,:5$7�Z��pl����f����J4�l�F�N�h�qyY�.W�,0�����is���6:A�,�K�"�p3����Nhrt}����Sf�����6d���G��8���[ȔLb�6D�'[�{&E[�ƕ�����ȒJ��k��ˑ%�Z����Z��<�5pY�-�#8�5`���d�XA��ߩe^�:�a���ˇ}d�̡c��I�fז���{�&�;0ɱ6g'�(�DT���J߽'Z��N��vI��GVBKu��H\�]~'7���ק��� ���     