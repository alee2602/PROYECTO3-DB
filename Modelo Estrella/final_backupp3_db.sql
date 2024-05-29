PGDMP                       |            dwhproyecto3    16.1    16.1 $    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    277472    dwhproyecto3    DATABASE     �   CREATE DATABASE dwhproyecto3 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE dwhproyecto3;
                postgres    false            �            1259    286313    dimCustomer    TABLE     �   CREATE TABLE public."dimCustomer" (
    "CUSTOMERID" character varying NOT NULL,
    "COMPANYNAME" character varying,
    "CITY" character varying,
    "COUNTRY" character varying
);
 !   DROP TABLE public."dimCustomer";
       public         heap    postgres    false            �            1259    286322    dimEmployee    TABLE     �   CREATE TABLE public."dimEmployee" (
    "EMPLOYEEID" integer NOT NULL,
    "EMPLOYEENAME" character varying,
    "MNGNAME" character varying
);
 !   DROP TABLE public."dimEmployee";
       public         heap    postgres    false            �            1259    286305    dimProducts    TABLE     �   CREATE TABLE public."dimProducts" (
    "PRODUCTID" integer NOT NULL,
    "PRODUCTNAME" character varying,
    "CATEGORYNAME" character varying
);
 !   DROP TABLE public."dimProducts";
       public         heap    postgres    false            �            1259    286330    dimSuppliers    TABLE     o   CREATE TABLE public."dimSuppliers" (
    "SUPPLIERID" integer NOT NULL,
    "COMPANYNAME" character varying
);
 "   DROP TABLE public."dimSuppliers";
       public         heap    postgres    false            �            1259    286338    dimTime    TABLE     �   CREATE TABLE public."dimTime" (
    "ORDERID" integer NOT NULL,
    "DATE" date,
    "YEAR" integer,
    "QUARTER" character varying,
    "MONTH" integer,
    "DAY" integer
);
    DROP TABLE public."dimTime";
       public         heap    postgres    false            �            1259    286346 
   factOrders    TABLE     �   CREATE TABLE public."factOrders" (
    "CUSTOMERID" character varying,
    "ORDERID" integer,
    "EMPLOYEEID" integer,
    "SUPPLIERID" integer,
    "PRODUCTID" integer,
    "UNITPRICE" double precision,
    "QUANTITY" integer
);
     DROP TABLE public."factOrders";
       public         heap    postgres    false            �          0    286313    dimCustomer 
   TABLE DATA           W   COPY public."dimCustomer" ("CUSTOMERID", "COMPANYNAME", "CITY", "COUNTRY") FROM stdin;
    public          postgres    false    216   O)       �          0    286322    dimEmployee 
   TABLE DATA           P   COPY public."dimEmployee" ("EMPLOYEEID", "EMPLOYEENAME", "MNGNAME") FROM stdin;
    public          postgres    false    217   �1       �          0    286305    dimProducts 
   TABLE DATA           S   COPY public."dimProducts" ("PRODUCTID", "PRODUCTNAME", "CATEGORYNAME") FROM stdin;
    public          postgres    false    215   x2       �          0    286330    dimSuppliers 
   TABLE DATA           E   COPY public."dimSuppliers" ("SUPPLIERID", "COMPANYNAME") FROM stdin;
    public          postgres    false    218   C7       �          0    286338    dimTime 
   TABLE DATA           Y   COPY public."dimTime" ("ORDERID", "DATE", "YEAR", "QUARTER", "MONTH", "DAY") FROM stdin;
    public          postgres    false    219   �7       �          0    286346 
   factOrders 
   TABLE DATA           �   COPY public."factOrders" ("CUSTOMERID", "ORDERID", "EMPLOYEEID", "SUPPLIERID", "PRODUCTID", "UNITPRICE", "QUANTITY") FROM stdin;
    public          postgres    false    220   �G       .           2606    286311    dimProducts Key1 
   CONSTRAINT     [   ALTER TABLE ONLY public."dimProducts"
    ADD CONSTRAINT "Key1" PRIMARY KEY ("PRODUCTID");
 >   ALTER TABLE ONLY public."dimProducts" DROP CONSTRAINT "Key1";
       public            postgres    false    215            1           2606    286319    dimCustomer Key2 
   CONSTRAINT     \   ALTER TABLE ONLY public."dimCustomer"
    ADD CONSTRAINT "Key2" PRIMARY KEY ("CUSTOMERID");
 >   ALTER TABLE ONLY public."dimCustomer" DROP CONSTRAINT "Key2";
       public            postgres    false    216            4           2606    286328    dimEmployee Key3 
   CONSTRAINT     \   ALTER TABLE ONLY public."dimEmployee"
    ADD CONSTRAINT "Key3" PRIMARY KEY ("EMPLOYEEID");
 >   ALTER TABLE ONLY public."dimEmployee" DROP CONSTRAINT "Key3";
       public            postgres    false    217            7           2606    286336    dimSuppliers Key4 
   CONSTRAINT     ]   ALTER TABLE ONLY public."dimSuppliers"
    ADD CONSTRAINT "Key4" PRIMARY KEY ("SUPPLIERID");
 ?   ALTER TABLE ONLY public."dimSuppliers" DROP CONSTRAINT "Key4";
       public            postgres    false    218            :           2606    286344    dimTime Key5 
   CONSTRAINT     U   ALTER TABLE ONLY public."dimTime"
    ADD CONSTRAINT "Key5" PRIMARY KEY ("ORDERID");
 :   ALTER TABLE ONLY public."dimTime" DROP CONSTRAINT "Key5";
       public            postgres    false    219            2           1259    286320    idx_dimcustomers_customerid    INDEX     ]   CREATE INDEX idx_dimcustomers_customerid ON public."dimCustomer" USING btree ("CUSTOMERID");
 /   DROP INDEX public.idx_dimcustomers_customerid;
       public            postgres    false    216            5           1259    286329    idx_dimemployees_employeeid    INDEX     ]   CREATE INDEX idx_dimemployees_employeeid ON public."dimEmployee" USING btree ("EMPLOYEEID");
 /   DROP INDEX public.idx_dimemployees_employeeid;
       public            postgres    false    217            /           1259    286312    idx_dimproducts_productid    INDEX     Z   CREATE INDEX idx_dimproducts_productid ON public."dimProducts" USING btree ("PRODUCTID");
 -   DROP INDEX public.idx_dimproducts_productid;
       public            postgres    false    215            8           1259    286337    idx_dimsuppliers_supplierid    INDEX     ^   CREATE INDEX idx_dimsuppliers_supplierid ON public."dimSuppliers" USING btree ("SUPPLIERID");
 /   DROP INDEX public.idx_dimsuppliers_supplierid;
       public            postgres    false    218            ;           1259    286345    idx_dimtime_orderid    INDEX     N   CREATE INDEX idx_dimtime_orderid ON public."dimTime" USING btree ("ORDERID");
 '   DROP INDEX public.idx_dimtime_orderid;
       public            postgres    false    219            <           1259    286376    idx_facts_customerid    INDEX     U   CREATE INDEX idx_facts_customerid ON public."factOrders" USING btree ("CUSTOMERID");
 (   DROP INDEX public.idx_facts_customerid;
       public            postgres    false    220            =           1259    286378    idx_facts_employeeid    INDEX     U   CREATE INDEX idx_facts_employeeid ON public."factOrders" USING btree ("EMPLOYEEID");
 (   DROP INDEX public.idx_facts_employeeid;
       public            postgres    false    220            >           1259    286377    idx_facts_orderid    INDEX     O   CREATE INDEX idx_facts_orderid ON public."factOrders" USING btree ("ORDERID");
 %   DROP INDEX public.idx_facts_orderid;
       public            postgres    false    220            ?           1259    286380    idx_facts_productid    INDEX     S   CREATE INDEX idx_facts_productid ON public."factOrders" USING btree ("PRODUCTID");
 '   DROP INDEX public.idx_facts_productid;
       public            postgres    false    220            @           1259    286379    idx_facts_supplierid    INDEX     U   CREATE INDEX idx_facts_supplierid ON public."factOrders" USING btree ("SUPPLIERID");
 (   DROP INDEX public.idx_facts_supplierid;
       public            postgres    false    220            A           2606    286351    factOrders fk_fact_customer    FK CONSTRAINT     �   ALTER TABLE ONLY public."factOrders"
    ADD CONSTRAINT fk_fact_customer FOREIGN KEY ("CUSTOMERID") REFERENCES public."dimCustomer"("CUSTOMERID");
 G   ALTER TABLE ONLY public."factOrders" DROP CONSTRAINT fk_fact_customer;
       public          postgres    false    4657    216    220            B           2606    286361    factOrders fk_fact_employee    FK CONSTRAINT     �   ALTER TABLE ONLY public."factOrders"
    ADD CONSTRAINT fk_fact_employee FOREIGN KEY ("EMPLOYEEID") REFERENCES public."dimEmployee"("EMPLOYEEID");
 G   ALTER TABLE ONLY public."factOrders" DROP CONSTRAINT fk_fact_employee;
       public          postgres    false    220    4660    217            C           2606    286356    factOrders fk_fact_order    FK CONSTRAINT     �   ALTER TABLE ONLY public."factOrders"
    ADD CONSTRAINT fk_fact_order FOREIGN KEY ("ORDERID") REFERENCES public."dimTime"("ORDERID");
 D   ALTER TABLE ONLY public."factOrders" DROP CONSTRAINT fk_fact_order;
       public          postgres    false    219    4666    220            D           2606    286371    factOrders fk_fact_product    FK CONSTRAINT     �   ALTER TABLE ONLY public."factOrders"
    ADD CONSTRAINT fk_fact_product FOREIGN KEY ("PRODUCTID") REFERENCES public."dimProducts"("PRODUCTID");
 F   ALTER TABLE ONLY public."factOrders" DROP CONSTRAINT fk_fact_product;
       public          postgres    false    220    4654    215            E           2606    286366    factOrders fk_fact_supplier    FK CONSTRAINT     �   ALTER TABLE ONLY public."factOrders"
    ADD CONSTRAINT fk_fact_supplier FOREIGN KEY ("SUPPLIERID") REFERENCES public."dimSuppliers"("SUPPLIERID");
 G   ALTER TABLE ONLY public."factOrders" DROP CONSTRAINT fk_fact_supplier;
       public          postgres    false    218    220    4663            �   j  x�uW�r�]C_�Ufe�@���!%��T6	�Q�. �c��!�L*wR5������c9��k<�l�v�>}N�%�yLX�hDm�sN���N�@�V*2f��ˈelY�8]��l[M�������/�����⋬4�{9����<�Y���4�F(M���N��;�D����ݩ��FЙ6�$Z�Z��|DŴ�)n[DXj�lv���t���M�gQ5
�B\��*Z
AǢ�;B��+���$y�@8�#l]ۖ�?����G�ZR:��FwfK&��J��<��$���F	z/kn��@��+�QY���%��3�����p���+ �x�m�L����n�ۖ���p�,-�C�!W�z�A�@���I������B+��׼�����!A�.Xʤ�9f�B9��(��eHB�e4��^�J�M��8v�w���EI�F�l'^h�H%�@!�NHw���Ga��1A6�7\* NMJ��w�&��G�"0+gTVX���Z��m�ゅc26�j�ڴ�{�^6|~m�x�����}{��W�q��K"V���c �lJ��I}K���EFYGg(J�d��	�3��&,���l%�����o�w���e�H���1��4F6枖��Y5�Yy��߲h�M��K�`�ާ`n���y�vTW}��Y�7�_����Ǥ`�|8�
��������|Tq���-�w����Ǖ�?��>�6Ri;��Ud�'���蘒�9P���'m\���hʒhL��Ԃp�E�L�C�=���X~Fg���L�W�PW�+V�� pI)� �k�H�0߉�Z+��	���s�Ҩi1D�}��O��ϓI��#Ȫd�˂�g�$�8c�p'h�+{정�$� �7���R`(�Ϳ��\��?�ƈq�ݱʇҖ5��v{�*��d֩��0���� JK�%Q�����}h~	͟[���.���ѩ�(�)4;1Lp\&lIb���p?��xFye��*�mA_��2@P��y!U�¼ 	�ƠrZ����
=���JX�b���B=��Jna�:+^�V� a������*CC���#Rw��EF��9_��a8H�`Zs���s +�fiIѠe��;t33��c��}z�Zd�,��ƕ��*9tn�Y�J��Fs��]�p�;�솀X	��'q����yɫ����޳ym�)�o�Y��*&,4�.<$���ͷt�%eS�-�[~<J%A	�^9O�BvJ:98/�_��)�80�f,��Z�}C�u�Q� �t���M-H��w��=�#͋�{C:��TXx�N[$��(_I��Ų$�o�Z��57:���H^�rl̵�?��p�����W��'�uN�km�;��o�L��xNr�� �����+�0 ��|.0�%Y >�)����S��o��م����C���v��
y[���]�a����*�}��J{�Ы=�v�Eg1Y@�+aa2�o��R5����W�8"�aY�#�_���
o��J�6���8���y�G����0Dq��H10�Z��l	.�s�HA�!���;��6�M��J�M*�)��ۭ���,�GY��G~��6}�1 E.�����Q;���#�\�����r[/	(L�<�7�O���o���ƶ����o��Ģ<�� vг1a��O~�˟�b"��'q��Z���a��=�\FQ��})8t���ͩ��< ��*d����z#��'E�B�BF�"�~U�r�����-y�E�D-0�XI�_ Ҋps�l�(paw0�� y��xy�m���ky���,
b����-6J��72���"BX���_aN���r��C{�x���{?6�-W.�#+���	������-6���������t&_��<���x��f�ח�҅�Ow�2�i.��Z��L"���h?�� B�7�6�!���X�Of���b/�v$�D\:�g�a�3^��R��z<�� (�����5��s2������y׀�@�⮈�Y��� ��\�(��u$�ڎL���
�5L ^�o~g#AA7�1?A����u#����߯�������$���l��s��L�V��|}k�|bd�w��O�3?�>M{ķ'�g���h4�?3a"�      �   �   x�e�;�0D��)�H��"
H"D�4��J"�Z2v��Sb��̛7��DO��`Mo!��Odu$ji�xư��TK���ǜv��6eVP�k��͍I[�Lk�|��A�L�kQ(�X��*L��t��p�v�_��_�Y3ۼG�|���3����]�      �   �  x�uV�r7<�_�S|R�2m1�D��*��pw�-0xH�Ʃ��=��O�K��H\�r"�i���Þ���k�eG9�N�>0���@��3�ܹ�k2�a|g0��	ּ�rB7��%��F��r�DN�fe�L��c�b��d��y6+vn'�[ǔ�#�I5����dT*�8� L΋��YL�s,�օ������7���1S�P�ܮX�UŌ)����Fܮ��wet$���:���)���z�H�oH��ח�����Iέ� � ,�b�ܚU|�>�v���Ĕ������zo,t��-էkN��ǉ8�*e9�Eo�s,&��[k��E{z�D\�rR��j
���iT�7�w�R9ye3�;�bFnC�2n�zM�2����4�@k���%�\��ՌP�#�	��������u7�6�<#Pl��>�Gb�qB��1��ǣ��9�����A� #8Z}r5W7���&�&(˴�y�d�Y�v���z�\�ؕ�bxjju.�/��uy| ��]t>�kЭ��]��"�����z6艩u�5��f��=d٠/f�Sr[�Z)�U4 �T@0-�P,��)��<ռ�#�̚wH4X�g�wFS�PZ?�����Lj�>-��A��Ӵk<rRk���g�Ӱov�k6c�W��ߓ�aO�N�[s��oM��3r�iS�.c�탫&���������؝=jˌ�͹�@���BN�z͍�j2�3LD�RC8G���$�����c��2�6�+�Aʥ��C���0oE�{�����QW�']ZU������l�z�gn�&n�	��v[����ř�_ŻU��@,З�Q�n�xT�ZtAU9nGbQ���2-�^վ��46�UfJk0��B ���ۚ��99k��X���!��?���67�T��	�`��qk�"�ùw!��`��PX0��y�@��٫�3���g�� 6K��Iꚭ�{���"�/j��x�<����C��Ⱥ��x$.lT^=
$"݁����[Pk)��{��ܢؙ���5p�����i���un0mXw���yC.mX��|Ug�\��L������BIW\ưz遤'δ�ٽx�g?| �C	Mv�1-L�hg��geH���Z�5��nN0�E�P�OQ�k��n�����T��UY=��?\I".�ʕ!�!S�1���U_��K[}l4��;�ο�Vv      �   B   x�3�.HMM�Tp�((J-.�2���,IMQHL�NLO�2�tKMI-J�Q��,(��K����� .~6      �   �  x�}�K�$��D�Y{��G������V��nV���'�I��H1+�k�����k�gY���?�����K�8��p���!x
���@� �*�F�
���	zA� ��0�$�[�"�>p��o���)H�H���CA���T�64��C�Tl�X)K��`�q�Xek^`��N��X���0���?SA�1#X��Pc����\
B��8+sv�V�յ���
�2!�6�
�"Cd��r��0䤯�v���:���R���㕟CN��
І!'}]���!'}]������S������f(~�OEhO0���%��R�X���s�-�Z�1�l�UvN��J�I���.��R��K+kg)5F��c���}��$g^�s^�Y��#uUx�#wUx�Ja�i�u��������0��*�y����*�i0䤯
o�)CN�cm9����i� e�
o��gK��Ц��?�X����Xp��&Xe�l�U�<`���|���j���s�,?�X���I����
B��֮�H!�HP�^��C�RKA���G��!'�]�	CNn����!'	]��
S,봜	CN٫�r�R����yd��w/x&�CE{�h��������gl~c,�*���|�I�n����6� ��x���L͇��t�O�r���t������y�Tf�m��	5FJ�I̥ �	�j�G�=8����^����|��
�!��d��d��wY0������0��>��pÐS(���0�䶛�va�I|w��
��.�CA��c/���zA�Mmw�{r~�����N��߳��r{��0 '��p���p .��{~��M��w����%����`��	��*
E�j X�K
I��4����t7���(<�ְ�%)Lo@5�uE��]�$����X��2�����zє��w�z�2�r�\Mbْ��mx�8�:���L��\q$�S,wI�*x�W,OI�*x�/�uO�f\�V5��	�n�$X�	�����{���I��|O��0 �ڛ{�~������̘��X�B�9ӊqE���w�Ix26��$]R�2��%�))��L+�I�ӊq.I��y���Qt���.t�p�l�K~��p�֚�HI��9�59�WΞ���%)��]�V3���n�Ӄ����!��`%���a �J�=������=�� X��1�n�M�%:+���Y��Y,�����~���d,��ł&c==�%)D�����aE�%)�ZL+��%%W�C�hvJ:$%W��݆������]�G�sI
W�%�3�qI�ʹ�����tH
W���w��䊳���A�uIJ�x�jZڗK
W�Z�ҾR�!)\�oMZ�Z����#�������﬛�/��̋�`6�F�l6�&X�f�/��,�U������l�]�#/�R�)�^������� �|7�a<ƥ �|��at��h��ّ
����KA2Dޫ��8� }S֥S= ]Ar*�Rw��CAr��I.a�)	u��<�KA2D�ҽ{��d�ʶ��=R�� ���yx�� �$�Q2���R��b���toCN��G�=S�!���˹�`	V�`��ٺ3�V�`�`�e�U�V
6#/�vp-���.��`�#��3���+9F���N���c��>H�R������x.��"XMขdh�&pR�� ���Ar��0䔄>H����R��v����\Ar*��3�\��P��j���8�R�Q� 9��.MAW0$C��:�����������3;���;{f砖���3;�1,K��x<������V��-���y�`��a��`!y9`��l
/8`��[�#`BN����)�
���c�:�N��d��Z��ɭ�p�!��:��0]�P�-��9�Pp*H�6�]p+x�d�b[�ᙦ�+
S����C�� 9%�R����}��;B�ا�x'(p���.f�9�;��a]�ͪ�������Vp :A/8i��X���,9�/\a�h���c���g�� 9-��D�	C��_X[9a�i+k��	CNjx�	CNjV�	CN�����PЖ�_�>a(h���}݆�ۢ�s��e�9����`�ָl��� [`��k�m����X�Y�aF��#�`�}�0cI��q��pc��N��#��;F+�Hn���&o�qګ�� ��Y%aÐ���!�Oۑ<0�_5��1a�i7�W�����N��� 	��s:ʾ��g�X��,���<l��^�6�>r���)f����}���
@#h�V_Q�j��_Q�n��a��A���"�v�}���eV����i���0S���R��!����CN{Y�7��$T��`�IB�9��>m���z�����W�����w�z�z�"�:`,	_g�z�z_g�]�]_g�@�@_g�@w��,|���Bip82�����v�Kp�tg��"LRx2V���2v���r^Qu���6�v6��y�:�W�6:�W�6:�WΟ�:k$\9o`��H�����S�pl����ەq�7��0	�js���\��`��=Q?�������8���^�3�s{����q���δ������[7�}�d,��`@�����O����ôvv��_D���r^o�|�z;��$�+�u�'\9on�㙒��w��p��kd.I����'��.T�.Tܓ�s�)p�)�Q�:`�\���s�)p�)�i��I����s�)p�)����A���"Q�|���G��|�I
K�
��64/����B�o	b�����c/I�����p�l�����z�9&)\9'���WΩ��<))\9���<p�l��,I�*�F@��sUP>������o�����7�`��,��X
6�&�,6��*��`l;`쓰4x�o&�گ�� ����-j��ϕ��Tr������H�#sU�iKA�1rW�AN�*K�!�t��n
sv*<CN��:�SAr�W��CN�J_
S���K'C�:�2`(H_�e�)CA��d���:�P���4���+=�cq5��+���b���`��W�Ne�]�Ϗb�*�{���W�F��$Ԙ�de*9F�jv��ua�R~�ty%�&X�d��dS���u�r�ׅ9RArZg�׀!���ɗc)CN	�S19��0䤯s�����*�W��}lP��פ��<���Vk|~T%��e>��}cl�����P$�/��elP�|�	�痱�jP$�/�r����.��
��.�=F��"YKAB}�!�E��*�CN��H�)CN��H69���d��0䔟.�CN!�"�KAr���a�I_Ɂ��u�tL��P>s�f�b�`��Y�76�����*��(UvY>�ʼ���J��L>s���8�̜�(U��7�����oR��i�b����7W*5FK�q.���Ƃ��ҵ�<X���.�1R�oR���7���!�u��oC�񨧓,�!����TCN��M*[
��~��`�i���ÐSJ��77a((C�&�3;*��oR=��`V��yЫn�_u{��7��&X�癚��7���yP�.�gf~cv�JZ�����նHaƂ`]Ry.���[8ύ�7�\����=	�s����� ]ޠ�Z};���
��ty����5��<n2DWj��6]�P�p�<���
Na(�ZV��go��������){���o������s���M�X�U�<Wz�����u��	6��`.XF^�*6������m������;�L0,����=��eC�� �m����V����������`(H��Qp(8$CV���V�d��j�0]�P������
Naȩ�}��ϗ
��;�4]�P�Q��B�C�� ��z�6��G�A�h��6{���`(H��'z5�1�
�!j}^�ol����r��i
����mhЩ_|ާl
���R���o��Ξ�y<�6����ylH0,#/����M��/����ϟ?�s47�      �      x�u��r������@�K���QXgS�qx�z��� �X�{�;?Vwu���������(�4���G{m�^����^���|���M�c��#]���K����s�6��(���%W��#�����D~����Q̿}��ȯe}�Irx\}��8�~��˷	�{�#��\^���1���޾�}�����ޮ��e�A$�_~����&�c�'W�|���/����뗍��ϋ�t̏��2�y����П���c�4�`�̘^cy4du}�k�7�?�����s�߼r�_��^� ��?���~Qy������F4��z����������&u>����+��@��痷�>~l@c$ϑ:zA0�*����^>~������z?�k=�yϧ<�_����5앦��o���AU����Y,���z+���m��D�}�x�����o(>J y����^����+}E�SN&��X�c���V��Hy�����r��(���  ��� ��?���珟nD#lN�>���5K}�5�O������ß�������n��3S�\��|d{�>�&�9�^��F����_��Hϴg��ך�i��iz�hj��:Y�hn����� �ڞRe���(�ANө���򿷼�&��T ��k�7z�<�XOm�|���/���'�6kM� ��!u�aΥ��X`�=��: �A������9`��Oe=�ry��[NT��X�F�2��R���@�'f� Ok�x��/��d��/���?�Ҟ���g��ͅ ���Kg�@~�T>�ɤ��k� �{^*�`�h+Y�歩�Zz|}^]J
 ��k����kO��#2�¹\��U�)���ܜ���Y��r��?>�߾m�i�܊.��'w0-����/s����&s���*k����2�� 4��M���/{�Ϸ�tDd�F�P9�.�xM[#e=��/�o{��aϢ�)����OZ���(���.u����>����e-T��O�<�'���4��GKoc�d:��fL}�g�~������t�Ҍ@������J�mk�'`iD�h�%$���8M��[c����|ڼ�De+Ǌ�y[�<�x����~E�巟�����}[���4��G]��&s1�����H�>w�n{��KO �Z#]�SAfd��%d2q�������F�0=!���.X[��u=i����8��1�@��L�iO���0�X6շ�d��|�u�7����K��W������/��꾭m�>��@<��vt5ˍ���7 ��������'�n'��3�@�������6�J�� �hy.��{+akH��O��}]�0��jQO������6"�@�֌��tD�FۼH�Rد���Pƭ�e��64��ͧ}��J�5� 8�h��j�[�����=�#�e�=A+���e�nj���ķNO�֩
N"nZBc'⇩�����zu�ނ���J��i��u޺�����ͯz�����F���K8M�����&��D: Z?�t�?~��XƎ��t��ؐ�/��|��_�\�a]�L���je���]�+ ��:͂��?��fN�������7�u��x�a��R, ���j���S���V�U:��$�t|��{Bt�\�v]1�������kȞ���Z�fIED:���թ߾�oӸvY�������:!����S@��\��	h�Uch˹s����?��)Z���"0Zɼ��@C��d��@WKn�Y�� ��� @�h�ܯ�2��lie �q� �������=KWH���`Γh�KD��z"��h����!wF��TIL�~)Q���iW@��8{����|�6V��O�<w	;@z�-f=�n�!\���@�Fu�ž�P\�Xi��*7���Kr�}g;@����gH�Oī�cV���NU#n~���o;6�Eh���Auy'M���2��i'��C�����}���[�/#"M��K3��͢X������~��ۧ"���_�ڷ5.�ߥH��?�j�rq*��%F�o�a�6��y�CXs|��ޤ��Ј�/�~��^*�w���\<����� �8'P�:>a��j��ƨ�Ƞ�墽�x=���5,�3]���'���"��S���7�u��� �{�jgp���Z��E5�r�X�@ت3/��(m'������2�j�{���5۹vT���; MΉsSEj5�S�B!Ӧ
Iz��dC@��!��|Y���j�Z&nr����bO�Ѳ��n. g� ����D��k$�՗����봀~���62jȦ�;�)# ��+��z��O����o��oj�pU����r��Xp��.� ��Wиs�� ���E����p%kw��ȶ��+�9Jl@���L����~���-/{š�Vt��W���R='��=�����+�D0�h�"p�g���~]�6�X�c���sf}]A~}*sL �b�u����^t��ן��~m�E���~;�0G�)�g� {V�5֝1��| �_n.r���o�`*@�y�'��( �������[��U\O�|����~��"V���� 2�
�5�(.U��������k��pM�Km�Z� �%���3��j����� P}*��e�=4��;le,5]7��k
����*�A�ܢ!b+�Ď(E�+���K WSѥ�����;P������H�r��^B!��Q�������S!�~i�e'�mt%�5R�"�JM�K���������F�ES?A�o��i]�I����o�irpu+��ɲ_-_ӠW��ڍ�L����'�%B��zr/��b�T��]�<!p�Ϸo����9�ʲV�@�D�'p����F���X9 ���.M����H�	����D��Sk�x"'����m�;uckn~aK?/�M������/�.���;w�|�݉��,�s��"2���؄0��n��k�-�g)�&��s0%�c� 4 -��ղ�vs3N��μ�"�ïS,��p��U��p��{��T�����Bb�ԓ�W�j� H�"#����48t��ƙ����m��S����s"�0�@�9U]�����>�FS3 ғ����������zQ�w��u�uy�Cs��R,NG+Ω���{KO��О@�D�o�,!��S|'`W"��Fqw͎�| �&�\�})f��J�ou�'�[pVN��!Z�r��{6R���BB^ay�bk\Ȓ
&��V��p�r�R/���7����B�%�f��v�5��� �R565�8\ѓ���ٶ���q&@4�+ʩ��\2N`�G�O�˙O���Dr�I�:��Q��9�K�OSH���F�?��0�gSmٺ��oA#&V�t��"s��:>m�-�	���h��̩��k�nM�y��l��hM�	t�EK�U�`؃8	��e����F�:��O��K��������J��H/d�ѰB o.#��D�k��+��� o�&�����%����9!�X��w�s��{1#]�C�eS!��i���=�=�t6��m0�v���)�ߘ��ytfg`Z!��Ydsj��6c�A�p�T���W�2���p93hP�q��#����O.�Ȩ2������T��;���,�jj�$�q�>�h�W��=��ȽN?�B�r���T�;B��r7Y"@]B+~ �Bׄy��In��}��0"�Y�/��{�5���pQu{D .�H�X2�[�Z��N�b6����(�8�X3S'� ���-d�}�cVAl�<�@2S�v������] ��Y��߲\�5QG"�"��V��B�	��d� �e�����=�K�,ᴊ.;-��
����l�w �]f����b#B"�'�A��������D�ID@vC��,���D6,��񬓥�ޘ;��^O���".�>�rV��<6�����@����Wl��$� � �|q_�܈�y��V@N���ܗ˲ޮ�VH�0pYN�AM+�n%�5���̓��\=�T����@�/�X M�[��0��m�[8����v[�%�0ʏ��� v�8'�u� ����8m�����))�iχ�6;�����/�� �[KV���=��    y���ZlΖvE�xN=�4Y0��~�C^�сh���)s�E��.�;t�5�Ud�����.(����������[�t��	�����b2\���D�W�*0�>�%��-��C	m眉ܿ����N�
,�q".<�5'��i}j9 s���|�����u��n������~᩟���N���~fsщ��E�� �pF��a@�nA�|Y^}��_��oy|�����9�hmjqߑ(�N���-�1h���j�ox��Pd��
���@n����-7T�b�l>��Q	EF-:�2�%-�yJ��M�x�����ld�N;X�3ȵ�	/��%	��<��)�#� �H�$y��~�U�.)�܀=�:��n��V��E`>)v2K#S�^����߇~1� 3����s �L֛$�[ɴ{O2���-�u6�����=R���_߾~nPoV�4�N�ug�m"�oe�'@��	�57�k���ٽ�~���M�V�k�I
gZa�-�$-�*�
G p�i�k�MV��*9Q�an� �����4(���Qsu"HɄT���\|8?ۅ�(�(��`Z�a.�	��w��a��!E�n��Vɠ��<�r)�9�>>��_��V�{g%o+V��\�rg͟H���<���jT�@d�;��`Iܶ��k&-:��uO"Y���;n\ĭT�lȆ#E� yt��� ��g�od�@(�P���5��n���{�/����* ޒp5Q�uV.��Z���D����m\������#�|�yW�76���Qׂ�6�u���e��H*���%k:�z��4�@mv*�UI�ӭ����I� �������'}M�()_�@��s.;�Z�a���Ng���.���+7�}ɣ�î���C�
�UKv�����<W(@��'׸J[ۃ~�����&.Q7Ւ�)ao�v����"w�� �0Z�2�q�&�m��-04�>�*���HU��� 2�]rBiK+	l�ޣ<���`�>�d��?�������9��T����fU� ��4��J𶻏r3N���t6�!<��C	 X�>��4��}�}�R�.2'�M<)5��p+�4��"d�y-��!Q��&x�@���K��=�L�B��[������vtX���#a-$N��)�Ģj�"����Jm�jrYƢ���kI�Y��}e:����'6(��S��_��a��bz�䜶�`_�������6Bt��B3�u�+�"�W$s/�U��R�O��P���)���ڋ&/d7�K^�
_ ����lu�\�m8�;N
Q:�0|?��9�G�I���oqs2��'s��'�o3�_\DmY ��D���e�l w�H�{��U�5c��G��*�pO ͏d7v_�Z�J@�)���=&J��p�8D���j��E�w����DtcC����]�X�ɴڊ�z��p�ې"��"���H)0�h���z�;�E���:m]�q<��� rj��r�
wʹ��ҽ�=Q xG�+��7t�{�� �ܲ��I�������Q.M���rO�B�	ļZ >h|23�4v�>l �\�� "�n�'F%fht`���Tq�D��.�'�l�X�=U���EA ��N��΀���� 
\�qi{jfV�������$���9=qS�b�+z".��c�S0�,�`n�~�dh
�Ҟr�!ᦞ��B�'0�~���U�R��i'���rג�D�cək99�7kf���v�$K���!��^k��W/��Z# �2���cr��Ɲc��@�%j �I��=7۴؟ȡ�Fu(�x	�\�d!��� ��])/_>xJ��8)9�?�D����M�<��j��<@n�3�
�Ѩ��6�2 }�j}��#�]A�(����I9�N��e\��V���f;�{��Ӭ�i��IT,=![�R
=)����^�kDj�{�;d�b���G�q�P�7�����޾|���x���b�)��
J�hx���8���@~����r�+��uʵ�@r��"	�md<�u?�� f�K����M��38n%��^����S�k�$�kv5�Fw�Ͻrw��^6Xe꘩��*�;���+ ���m��s�Zr(��^I�����t��	8$-V­�.n�rٱ|�C�r��Jܲ7��IwrN��y�mֻ��"��a;�4ܓ��E߽9 pN7 �_��b-��%�1z�}\�V�M�����h�Mܻo�QD��L8(�y���v|�yHx���)9�j-��B��m�N���En���W�=eM�������u�q��H�6���E�v"��]M�9�t�����'c{��_��'~���;'�k,��X�l�N�{N�ܢ��/@m��f�c)N���������S�r
���Up���p�1�ں�i�p���X�9E%�B��\Sy���D��*�<K0��%�W(qt����+�O���|y���X�)�Z�/�6�6��G)z�A_�� -ЪK�kN�l��Kv�-��Ft"_j4�V2���^+�~�8L�m뾂�'��W=����qN� ���a����=t�wD���w�g���,�y�]:���'�i��X�V#�YEV!�E��k�c�Dh���}J�5�Nu�Sao��r&������j-@��(����/�ٛ�5��S��Oc��ԃ]b$�EJ����@��x'�{�Z�ج�2?G�q��R��,�\^NE$� YYjl��\��iD@|�Mc۱q��UrB��V��7��u�	E��i���e`�<��{"��i:6>�*s��
���m��J����@ڞ�؎mh��"��p��=��� �n}4J??���w�K��m�� �� D�eG�T��w��J�����2�5 �[�@�:pe(�d\�g�q�,��A�V]�LA�U�������J�Dgǃ��Gnc� Y�Su�F�<r�_��lq�؛n`��������8�D����;.��,ocUiH��ة���x����2�r�||��͗Am8�ʹ�Z���y@�����[��
��BD�!S:j7���킜qp�Zߵ���b�D�E�-#��GGGbz�D�<=A:�/@z��w/ר&���G�f[�hDDb@�G��S�bmuwv~��J-[1��-��CqYß ��O�I�?|���-$j�B�$�~��)�3�u�J���y2y}'Rs����U"2 2"]; +Q����a�v"������1�U��tv<��@m�Z�@�h����� #˭�)TM�z�'Ro�	"�i�vR��I2~"֥R2���uF �qe�!R���d��B��k�"�D�Y�H�@�B�t-O����ܑ��!����1'�'�l�_��屛��}#���'#Vs�-�鲣'
ebD7��F�x��J����z��$"�n�tQ�I�+�W~�8.�X�I�ܩD��~��������՞D�~3��5�̄u����uԋ0G*E�K��r7-�O���ߚ"5+,�ފS�z869�}�Ҏ@4��9�4���ְ��;�ܝk,�����]F�n��E���ӹ�X���DÌ'aG��5[�c�SE�d .��x��s�R�"f���D,�'�zNx��{�-q�Xz��re��W.+�J��#�{�HV1��J����f6�D�?�z���D��g	ɧt��b�ݶv�D.h������	j�FoV�kJ��v�	�(�)��-��A����]�RyHo��d�8.4,y����>���X�6v<�]o�8�:� ��b�a`�Jb��ʽn�e�?f-�X�-� �U "����m���� �:�����J��Vikb���t2[��H3
�"0_�D^q�ԦL�����	�OO��\J�1���iB��Pu�.)����Y'u$2���	�#�խ��_!�W���y!��� R����j��~�u�v.ܚ2�f��[G�qu^*�����N'Pcۢ�pQ�S�'�Q��pd�5@��s�M���&8��&��
77�Dz���K%K��L��I�]�t}�g�i��l'D�}�-톶2�\�`2�\�`A�2\�0�(�߄H��UI����ޥ8��I��LwK>    �,�a���I4�F������Cb@�'h�%Wv,@_�������>5�R�O�s$7^���;�E?�2�d��3G��ĕ
��K�%�O �[DRu�K����Z�i5�;��&V��*�y�y6�N��K����.@$*i�oSmz�����ց�$��䛜�����e��s� ��|"Y��S�uH�ָm����5�H-ȹ3��O�_ Q>��K�~+����$����k�#H�K�d�7D���I��'H�ttY�Nj�9b	�|w݃�������z�ۊ5�h�HI��Z��D����Z���U#�Qke^; �l/��U����\���EvN$��ѐ��ܳv���ד$���AN6� 9�0��$�|���v �'�ԌHԞ`���S��S����a]nrs��q�)w�2@��f����ABܚ+{7R�Fsz�ǐ# �n�c�T*��{���L@x�e�d�:G	$U]�T �����Vo��i]� ��"⨔�.ĕ�:�4G��Q��f/��?]���yN":���ԋ؈hH��k�M�G�iđoѱ ��*��P�@�7�H�����d��
��}��]\�t��XN��X��dT�-���"�InAҠ�s4�+�$1ނH��Y-��ۮٌ� �@�F66	l�8��ȆW�U�D�=ɜ�|�"��'D<W"�Y.�|��~��p�0�e�'D���'H��l2ʁ
m�;b��@۲.��d���D.y�H��D�Qk�2����v��r��9�.}'r�EH� 6�* ��З�7�s>7H��ffT��/�	��<�VU.��f�x'��[vI�L���j�ag<�Jf%'�������e�|Q�E��9�~��p�V��"Uj�s�ڋ��	q9Z@��X�1_��:d� ��m :�ma�w gG% �8{�kֶ�H�ĉ�b���|�[a��T��b,RR�#��C�4�I�@VIGy�
��s����e N���UA���HӇ�MUڱR9&�FE� ͞h�S�֧���J@�F`<B���C$3km���B�&��p �375�r���x�'��ʱ���m�S�T�N�EF �;j0'*�ւD� �ߓ� )V�lߔƗ������:dNoi�/٬���=>n��rʷ`Q�*���ʜ��k�+ ��=�X�.ڗoɣ7[ h�^��.'�P�;<>�v�L�ƒu��ꨓ����m':����O�T�T@�P����Y�cs^� �*ˁ������˙�")S�#�� J�xPv$R[V�j3�DJW�I4hU�9SL@K
 �4�h����?�WyݔrKe�H�\Q��+�lE �"���w�|�oܫU �5ox��Iώ,�+~n���n�e�j$���"'q����s	��=rT�Dj
��Q���wO�Àĝ�4>��l��1�H����>�1���b��Ӳ�� ��yʥj�ٗ�����H�dA$�l+�y�R���In�n. 'Oo��������5"�.���ȒP'rU�'Ҡ��6�8��Ì�f��V��K-��ȵ� ^ɬv9Wr��y�r	#�H�Du�v%�S"N $um$r�b�h��__,7�뭀`��=	���]'r!]	��JUa�B����4@E̱�����?W= Br�'RkG���	��9 R�`s�r-�:�+��z�\we���z"݃������؉ם[ ��?J�h�{0r���9���q�k���\G��R���7�^�"�5*cY6a[�D�t@:�.@VΫ��Q�~^� g6�H,�l[l3o7�-X@h�Y�H��F[,�y�xz��-(���v֐E\��;��C��i��#�=wx�s4B�)kn�I4��Q�����������V��I.7�:�/�dz�Q7�%vQ�/:�n��*�(� $q����I�h�T�,�N�[���U�(:dI��9�JkMp��ܐUhH�"w���*@c@��r��3 W��.y*єz���@6C��q\��M����)4�0�-5 ���^�f��3E�z�'WI��-wpi*�5����Zpk4�%E��P�;�J&^�}�'��\��t���j�YS5���8,J�r�Cgd'��D����1"���S���(w�EO�lj�M��~��\;���YG�B�EkH�	}�b������Pe�)~��t��Dk��^�/��ּ���\�=�4��9G��d�\i��y"��l��λW���6v�^��CN��<�ݺ:7��!J��G��#�v�p4,��M�ݎO�z�kϥq�2���ˡ���&��_mP'1�)��=!֥:�so
�*�C9���ANm�^�=�]Qm��Q�'[ 
b\��d��)��"g3��,���>���� ��U���u��	�ֶ��B���&N�NhG�U���@�Ɲ�q"w�����M�� i�Tu����qe��0׃����n��`�6'+�1�Q���M㚸*����w���6B#�##+k�s���j�z��|�=;uz��ʇD�O�;�����Ѹxk��t<	����(jl\�}��䤎" ��&�v��G�z'��^�mg�+%�P.}��`L���1ŶAx\���~P `�ǟD���O�U�o����(�~���w\�5uH��q\��lE97Y�ư��}8r�1���ܱ��[�9�,k�e��_���B��[wN� ;�Y��i[������Fo�S�G��2]�� m��H4�Sz��Z�
 �Qwb�Hz��'��[i�\D?�;C�W�؜Q\@��	��jR,�����|>�@��]����91��kp$ޮ@v_E�m;#^�gh?�ǲ6��+�\�����[��r2=+�wVY�}������Y2q·�#�� ?K��D��^����ce ���z��ܮ�$��HM���6d��\�	���C[N���~�O< �IcA��{#7�?�)��#s��R��r�b��|����3�'�	*b�#�����t�������H9��^>��Yw�#SW798��[+�L�#�~Yc~��~ �;�K��/��@N�A�.��H2��2'󡌲�D�c< �*&��N����s�{"��pn$���l�mCY��(�JU�0A"�e"��X��Q����˧\�1�[S� ����-2�
���W I�r�@����,�U�Q{j�7Hk��K�N��	�2��t����
�p��hD���7ʽ��ڝ}���*��g����B�Q����ps���	2٬��uu�0S�Y�Jw��7�z����>j w������b�Խ��ϒ��y}��@^�*w����/���BW|$��<8�H��;�YUF j>X�ʨ~g�$�-���vr!#�p����1A�]սXm�1��^q���]�C�BWbv6k4���)gm���M��vdz�$�hE)��M����U7�&��+���4�.�޵�����M��-�� ��G̝@n:Zpj�na�'r���@c�O���v\��Γ�� ���s$��4=��D�d@zJ�ur�[��y��uޕ�:��k�T]!a�S.���e֩���[=�ܝ�d���rW��ل'!#ۇZ:g����X�u �p�F烸��� Z�/�B% ğ�7�S�'�Z���+�=/g.S=:[��Q�\tg�R��y��2j������Jq�o��|�� �߸�<�HF�B�j�scP %�iA����	�odX#����ꃴ�2(Hb��5L��cgh�N�PVa1W�Peo ���i����0�|��Wpv������ѽ�YQԃ��o@�� �`���1�yr�X� ���.�W40���m�>	}�-%�",�唳KX �F��X�ԔG��
����p�3`�J�՞ Y4�ح`'� ��lSN��"* �_%�>�P��S̳@O������9�.�&;������)�ksB�������B0vڹ"�Q�F�/qy'"Uh3�$�>�3��������`��**77���I�@	��edz�q�(��IA�g
V �iU�����#TQ���|D;^�/�_'!���C�!��3.�{2^o� �  ��ԛ�me͆�UW������y�_�&��`N_�9�α:9Ezd�Ӗ>'��z�H��cG��L����}�\� �-0����(Rz���B��՜M�,��ALf��������cIOf)���,����7-B_�oP���@�s���֭��f��D=6�W�{2�t�;��U뫁8�f�_t�w�{�^vy �M��\��P�|�	�@�7�-I
����%mo��[d���ߋOq�UX'�7��6R�}"j�����@���~��\& �R"<O�*1�	�^� ����������D��W�|L)R�	�Ks���Ȓ��\t��);wξ�����)@�����Ѕ&�v�8�����x�&����}��(��&��C����.NĞ���L^q�p�$���K�������R�EO^�#�m�
��c��e�M�fJ�]| �)w�k�mq�o�(��W^u�n� ��f��6.=����P�L%�e�p�,C'Ђ-㝈�>/� ���O`Z�H^q2������h���PAR��� ���z}m����n���t2N�����kύB�dHy�#��Sk$ޚx��n :[��v��I�r�:[����� g[�yL���Q�K1��r#�W ��s�kj1A.���W J4?AV%�k"����� wd��4�Qq���4.Z�7S��N���
�&���"DDV�"���]��R,��C�>�p|E��'a�Pp�CۿO����R.g�B�g�K�.��+�8����=N�H��r��Q�i��Uq�5v�WX1Uf�X&��M�JSֲ��1��$�G����j�9�<�Cή��r�)�����w��Ɖ,�jܚm���혢x��.S��vALy�A�(��廌���|����9�C��W��C��i>�su�D]����LS��κ�\�qDu���om����\R//�������:���     