FasdUAS 1.101.10   ��   ��    k             l      ��  ��   ~x"Play Random Album" for iTunesoriginally written by Paul Withey
updated by Doug Adamsdougscripts@mac.com

v3.1 nov 30 '12
-- fixes problem with iTunes 11.0 whereby only first track of playlist would play

v3.0 jan 20 '12
-- maintenance update
-- addresses previous version's bias towards larger albums
-- prevents re-copying of un-track numbered tracks to playlist
-- speed improvement
v2.0 apr 14 '10-- maintenance release
-- universal binary
-- will include un-track numbered tracks (sort of)
-- selects only a single disc from multi-disc albumsv1.0-1.5 aug 11 '02-- initial releaseGet more free AppleScripts and info on writing your ownat Doug's AppleScripts for iTunesdougscripts.comThis program is free software released "as-is"; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

Get a copy of the GNU General Public License by writing to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

or visit http://www.gnu.org/copyleft/gpl.html

     � 	 	
�  " P l a y   R a n d o m   A l b u m "   f o r   i T u n e s  o r i g i n a l l y   w r i t t e n   b y   P a u l   W i t h e y 
 u p d a t e d   b y   D o u g   A d a m s  d o u g s c r i p t s @ m a c . c o m  
 
 v 3 . 1   n o v   3 0   ' 1 2 
 - -   f i x e s   p r o b l e m   w i t h   i T u n e s   1 1 . 0   w h e r e b y   o n l y   f i r s t   t r a c k   o f   p l a y l i s t   w o u l d   p l a y 
 
 v 3 . 0   j a n   2 0   ' 1 2 
 - -   m a i n t e n a n c e   u p d a t e 
 - -   a d d r e s s e s   p r e v i o u s   v e r s i o n ' s   b i a s   t o w a r d s   l a r g e r   a l b u m s 
 - -   p r e v e n t s   r e - c o p y i n g   o f   u n - t r a c k   n u m b e r e d   t r a c k s   t o   p l a y l i s t 
 - -   s p e e d   i m p r o v e m e n t 
  v 2 . 0   a p r   1 4   ' 1 0  - -   m a i n t e n a n c e   r e l e a s e 
 - -   u n i v e r s a l   b i n a r y 
 - -   w i l l   i n c l u d e   u n - t r a c k   n u m b e r e d   t r a c k s   ( s o r t   o f ) 
 - -   s e l e c t s   o n l y   a   s i n g l e   d i s c   f r o m   m u l t i - d i s c   a l b u m s   v 1 . 0 - 1 . 5   a u g   1 1   ' 0 2  - -   i n i t i a l   r e l e a s e   G e t   m o r e   f r e e   A p p l e S c r i p t s   a n d   i n f o   o n   w r i t i n g   y o u r   o w n  a t   D o u g ' s   A p p l e S c r i p t s   f o r   i T u n e s  d o u g s c r i p t s . c o m   T h i s   p r o g r a m   i s   f r e e   s o f t w a r e   r e l e a s e d   " a s - i s " ;   y o u   c a n   r e d i s t r i b u t e   i t   a n d / o r   m o d i f y   i t   u n d e r   t h e   t e r m s   o f   t h e   G N U   G e n e r a l   P u b l i c   L i c e n s e   a s   p u b l i s h e d   b y   t h e   F r e e   S o f t w a r e   F o u n d a t i o n ;   e i t h e r   v e r s i o n   2   o f   t h e   L i c e n s e ,   o r   ( a t   y o u r   o p t i o n )   a n y   l a t e r   v e r s i o n . 
 
 T h i s   p r o g r a m   i s   d i s t r i b u t e d   i n   t h e   h o p e   t h a t   i t   w i l l   b e   u s e f u l ,   b u t   W I T H O U T   A N Y   W A R R A N T Y ;   w i t h o u t   e v e n   t h e   i m p l i e d   w a r r a n t y   o f   M E R C H A N T A B I L I T Y   o r   F I T N E S S   F O R   A   P A R T I C U L A R   P U R P O S E .     S e e   t h e   G N U   G e n e r a l   P u b l i c   L i c e n s e   f o r   m o r e   d e t a i l s . 
 
 G e t   a   c o p y   o f   t h e   G N U   G e n e r a l   P u b l i c   L i c e n s e   b y   w r i t i n g   t o   t h e   F r e e   S o f t w a r e   F o u n d a t i o n ,   I n c . ,   5 1   F r a n k l i n   S t r e e t ,   F i f t h   F l o o r ,   B o s t o n ,   M A     0 2 1 1 0 - 1 3 0 1 ,   U S A . 
 
 o r   v i s i t   h t t p : / / w w w . g n u . o r g / c o p y l e f t / g p l . h t m l 
 
   
  
 l     ��������  ��  ��        l     ��  ��    ) # if you like, you can change these:     �   F   i f   y o u   l i k e ,   y o u   c a n   c h a n g e   t h e s e :      j     �� �� "0 randomalbumname randomAlbumName  m        �   &e   R a n d o m   A l b u m      j    �� �� .0 minimumtracksrequired minimumTracksRequired  m    ����       l     ��������  ��  ��        l     ����  r         J     ����    o      ���� 0 sparetracks spareTracks��  ��       !   l     ��������  ��  ��   !  " # " l  j $���� $ O   j % & % k   	i ' '  ( ) ( T   	 o * * Q    j + ,�� + k    a - -  . / . r    0 0 1 0 6   . 2 3 2 n     4 5 4 3    ��
�� 
cTrk 5 l    6���� 6 6    7 8 7 3    ��
�� 
cPly 8 =    9 : 9 1    ��
�� 
pSpK : m    ��
�� eSpKkSpZ��  ��   3 =    - ; < ; 1   ! #��
�� 
pAlb < n   $ , = > = 3   * ,��
�� 
cobj > n  $ * ? @ ? I   & *�������� 0 	getalbums 	getAlbums��  ��   @  f   $ & 1 o      ���� 0 	sometrack 	someTrack /  A B A r   1 O C D C 6  1 M E F E 2  1 4��
�� 
cTrk F F   5 L G H G =  6 @ I J I 1   7 9��
�� 
pAlb J l  : ? K���� K e   : ? L L n   ; ? M N M 1   < >��
�� 
pAlb N o   ; <���� 0 	sometrack 	someTrack��  ��   H =  A K O P O 1   B D��
�� 
pDsN P l  E J Q���� Q e   E J R R n   F J S T S 1   G I��
�� 
pDsN T o   F G���� 0 	sometrack 	someTrack��  ��   D o      ����  0 thealbumtracks theAlbumTracks B  U�� U Z  P a V W���� V @   P Y X Y X n   P S Z [ Z 1   Q S��
�� 
leng [ o   P Q����  0 thealbumtracks theAlbumTracks Y o   S X���� .0 minimumtracksrequired minimumTracksRequired W  S   \ ]��  ��  ��   , R      ������
�� .ascrerr ****      � ****��  ��  ��   )  \ ] \ l  p p��������  ��  ��   ]  ^ _ ^ Q   p � ` a b ` k   s � c c  d e d r   s � f g f 4   s }�� h
�� 
cUsP h o   w |���� "0 randomalbumname randomAlbumName g o      ���� $0 myrandomplaylist myRandomPlaylist e  i�� i I  � ��� j��
�� .coredelonull���     obj  j n   � � k l k 2   � ���
�� 
cTrk l o   � ����� $0 myrandomplaylist myRandomPlaylist��  ��   a R      ������
�� .ascrerr ****      � ****��  ��   b l  � � m n o m r   � � p q p I  � ����� r
�� .corecrel****      � null��   r �� s t
�� 
kocl s m   � ���
�� 
cPly t �� u��
�� 
prdt u K   � � v v �� w��
�� 
pnam w o   � ����� "0 randomalbumname randomAlbumName��  ��   q o      ���� $0 myrandomplaylist myRandomPlaylist n   , shuffle:true}    o � x x     ,   s h u f f l e : t r u e } _  y z y l  � ���������  ��  ��   z  { | { Y   � }�� ~ �� } k   � � �  � � � r   � � � � � m   � ���
�� boovfals � o      ���� 0 chk   �  � � � X   � ��� � � Q   �  � ��� � Z   � � � ����� � =   � � � � � n   � � � � � 1   � ���
�� 
pTrN � o   � ����� 0 	thistrack 	thisTrack � o   � ����� 0 n   � k   � � � �  � � � r   � � � � � m   � ���
�� boovtrue � o      ���� 0 chk   �  � � � l  � � ����� � n  � � � � � I   � ��� ����� .0 copytrack_toplaylist_ copyTrack_toPlaylist_ �  � � � o   � ����� 0 	thistrack 	thisTrack �  ��� � o   � ����� $0 myrandomplaylist myRandomPlaylist��  ��   �  f   � ���  ��   �  ��� �  S   � ���  ��  ��   � R      ������
�� .ascrerr ****      � ****��  ��  ��  �� 0 	thistrack 	thisTrack � o   � �����  0 thealbumtracks theAlbumTracks �  ��� � Z  � ����� � l  ����� � =  � � � o  	���� 0 chk   � m  	
��
�� boovfals��  ��   � r   � � � o  ���� 0 	thistrack 	thisTrack � n       � � �  ;   � o  ���� 0 sparetracks spareTracks��  ��  ��  �� 0 n   ~ m   � �����   n   � � � � � 1   � ���
�� 
leng � o   � �����  0 thealbumtracks theAlbumTracks��   |  � � � l ��������  ��  ��   �  � � � Z  G � ����� � >   � � � o  ���� 0 sparetracks spareTracks � J  ����   � X  #C ��� � � l 5> ���� � n 5> � � � I  6>�~ ��}�~ .0 copytrack_toplaylist_ copyTrack_toPlaylist_ �  � � � o  67�|�| 0 	thistrack 	thisTrack �  ��{ � o  7:�z�z $0 myrandomplaylist myRandomPlaylist�{  �}   �  f  56��  �  �� 0 	thistrack 	thisTrack � o  &'�y�y 0 sparetracks spareTracks��  ��   �  � � � I HO�x ��w
�x .hookPlaynull��� ��� obj  � o  HK�v�v $0 myrandomplaylist myRandomPlaylist�w   �  � � � Q  Pc � ��u � I SZ�t ��s
�t .hookRevlnull���     cobj � o  SV�r�r $0 myrandomplaylist myRandomPlaylist�s   � R      �q�p�o
�q .ascrerr ****      � ****�p  �o  �u   �  ��n � I di�m�l�k
�m .miscactvnull��� ��� null�l  �k  �n   & m     � ��                                                                                  hook  alis    "  Macintosh HD                   BD ����
iTunes.app                                                     ����            ����  
 cu             Applications  /:Applications:iTunes.app/   
 i T u n e s . a p p    M a c i n t o s h   H D  Applications/iTunes.app   / ��  ��  ��   #  � � � l     �j�i�h�j  �i  �h   �  � � � i   	 � � � I      �g ��f�g .0 copytrack_toplaylist_ copyTrack_toPlaylist_ �  � � � o      �e�e 0 atrack aTrack �  ��d � o      �c�c 0 theplaylist thePlaylist�d  �f   � O     7 � � � Q    6 � � � � Z    ) � ��b�a � H     � � l    ��`�_ � I   �^ ��]
�^ .coredoexnull���     obj  � l    ��\�[ � 6    � � � n    
 � � � 3    
�Z
�Z 
cTrk � o    �Y�Y 0 theplaylist thePlaylist � =    � � � 1    �X
�X 
pDID � l    ��W�V � e     � � n    � � � 1    �U
�U 
pDID � o    �T�T 0 atrack aTrack�W  �V  �\  �[  �]  �`  �_   � I   %�S � �
�S .coreclon****      � **** � o    �R�R 0 atrack aTrack � �Q ��P
�Q 
insh � o     !�O�O 0 theplaylist thePlaylist�P  �b  �a   � R      �N ��M
�N .ascrerr ****      � **** � o      �L�L 0 m  �M   � I  1 6�K ��J
�K .ascrcmnt****      � **** � o   1 2�I�I 0 m  �J   � m      � ��                                                                                  hook  alis    "  Macintosh HD                   BD ����
iTunes.app                                                     ����            ����  
 cu             Applications  /:Applications:iTunes.app/   
 i T u n e s . a p p    M a c i n t o s h   H D  Applications/iTunes.app   / ��   �  � � � l     �H�G�F�H  �G  �F   �  � � � i  
  � � � I      �E�D�C�E 0 	getalbums 	getAlbums�D  �C   � k     A � �  � � � r      � � � b      � � � b     	 � � � b      � � � m      � � � � �8 p e r l   - e   ' l o c a l   $ / = u n d e f ; m y   $ s = < > ; m y   @ a l = ( ) ; m y   % s e e n = ( ) ; w h i l e   ( $ s = ~ m : < k e y > A l b u m < / k e y > < s t r i n g > ( . * ? ) < / s t r i n g > : s g ) { $ g   =   $ 1 ; $ g = ~   s : \ & \ # ( \ d * ) ; : c h r ( $ 1 ) : g e ; $ g = ( $ g . " � l    ��B�A � I   �@ �?
�@ .sysontocTEXT       shor  m    �>�> ��?  �B  �A   � m     � ` " ) ; p u s h ( @ a l , $ g ) u n l e s s   $ s e e n { $ g } + + ; } p r i n t   @ a l ; 
 '   � I   	 �=�<�;�= 0 thedatabase theDatabase�<  �;   � o      �:�: 0 
thecommand 
theCommand �  r    # I    !�9�8�9 0 
texttolist 
textToList 	 l   
�7�6
 I   �5�4
�5 .sysoexecTEXT���     TEXT o    �3�3 0 
thecommand 
theCommand�4  �7  �6  	 �2 l   �1�0 I   �/�.
�/ .sysontocTEXT       shor m    �-�- ��.  �1  �0  �2  �8   o      �,�, 0 g    Z  $ >�+�* =  $ * n   $ ( 4  % (�)
�) 
cobj m   & '�(�(�� o   $ %�'�' 0 g   m   ( ) �   r   - : n   - 8 7  . 8�&
�& 
cobj m   2 4�%�%  m   5 7�$�$�� o   - .�#�# 0 g   o      �"�" 0 g  �+  �*    �!  L   ? A!! o   ? @� �  0 g  �!   � "#" l     ����  �  �  # $%$ i    &'& I      ���� 0 thedatabase theDatabase�  �  ' Q     /()*( k    "++ ,-, r    
./. l   0��0 I   �1�
� .sysoexecTEXT���     TEXT1 m    22 �33, p e r l   - e ' o p e n ( T , " d e f a u l t s   r e a d   c o m . a p p l e . i A p p s   i T u n e s R e c e n t D a t a b a s e P a t h s | " ) ; w h i l e ( < T > ) { $ t . =   $ _ ; } c l o s e ( T ) ; $ t = ~ m | " ( . * ? ) " | s ; $ t = $ 1 ; $ t = ~ s |   | \ \   | g ; p r i n t   $ t ; '�  �  �  / o      �� 0 x  - 4�4 L    "55 n    !676 1     �
� 
strq7 l   8��8 I   �9�
� .sysoexecTEXT���     TEXT9 b    :;: m    << �==  l s  ; I    �>�� 0 replacechars replaceChars> ?@? I    �A�� 0 escapeforunix escapeForUnixA B�
B o    �	�	 0 x  �
  �  @ CDC m    EE �FF  'D G�G m    HH �II  \ '�  �  �  �  �  �  ) R      �J�
� .ascrerr ****      � ****J o      �� 0 m  �  * I  * /�K�
� .ascrcmnt****      � ****K o   * +�� 0 m  �  % LML l     �� ���  �   ��  M NON i    PQP I      ��R���� 0 replacechars replaceCharsR STS o      ���� 0 txt  T UVU o      ���� 0 srch  V W��W o      ���� 0 repl  ��  ��  Q k      XX YZY r     [\[ l    ]����] o     ���� 0 srch  ��  ��  \ 1    ��
�� 
txdlZ ^_^ r    `a` n    	bcb 2    	��
�� 
citmc o    ���� 0 txt  a l     d����d o      ���� 0 	item_list  ��  ��  _ efe r    ghg l   i����i o    ���� 0 repl  ��  ��  h 1    ��
�� 
txdlf jkj r    lml c    non l   p����p o    ���� 0 	item_list  ��  ��  o m    ��
�� 
TEXTm o      ���� 0 txt  k qrq r    sts m    uu �vv  t 1    ��
�� 
txdlr w��w L     xx o    ���� 0 txt  ��  O yzy l     ��������  ��  ��  z {|{ i    }~} I      ������ 0 
texttolist 
textToList ��� o      ���� 0 txt  � ���� o      ���� 	0 delim  ��  ��  ~ k     3�� ��� r     ��� 1     ��
�� 
txdl� o      ���� 0 saved saveD� ��� Q    *���� k   	 �� ��� r   	 ��� J   	 �� ���� o   	 
���� 	0 delim  ��  � 1    ��
�� 
txdl� ���� r    ��� n    ��� 2    ��
�� 
citm� o    ���� 0 txt  � o      ���� 0 thelist theList��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 errstr errStr� �����
�� 
errn� o      ���� 0 errnum errNum��  � k    *�� ��� r    #��� o    ���� 0 saved saveD� 1    "��
�� 
txdl� ���� R   $ *����
�� .ascrerr ****      � ****� o   ( )���� 0 errstr errStr� �����
�� 
errn� o   & '���� 0 errnum errNum��  ��  � ��� r   + 0��� o   + ,���� 0 saved saveD� 1   , /��
�� 
txdl� ���� L   1 3�� l  1 2������ o   1 2���� 0 thelist theList��  ��  ��  | ��� l     ��������  ��  ��  � ���� i   ��� I      ������� 0 escapeforunix escapeForUnix� ���� o      ���� 0 n  ��  ��  � k     9�� ��� r     ��� m     �� ��� , ! @ # $ % ^ & * ( ) + = - { } [ ] : ; ? < >� o      ���� 0 badlist  � ��� r    ��� m    �� ���  � o      ���� 
0 filled  � ��� Y    6�������� k    1�� ��� r    ��� l   ������ n    ��� 4    ���
�� 
ctxt� o    ���� 0 i  � o    ���� 0 n  ��  ��  � o      ���� 0 t  � ���� Z    1������ E   ��� o    ���� 0 badlist  � o    ���� 0 t  � r   " )��� l  " '������ b   " '��� b   " %��� o   " #���� 
0 filled  � m   # $�� ���  \� o   % &���� 0 t  ��  ��  � o      ���� 
0 filled  ��  � r   , 1��� l  , /������ b   , /��� o   , -���� 
0 filled  � o   - .���� 0 t  ��  ��  � o      ���� 
0 filled  ��  �� 0 i  � m    ���� � l   ������ n    ��� 1    ��
�� 
leng� o    ���� 0 n  ��  ��  ��  � ���� L   7 9�� o   7 8���� 
0 filled  ��  ��       ��� �����������  � 	�������������������� "0 randomalbumname randomAlbumName�� .0 minimumtracksrequired minimumTracksRequired�� .0 copytrack_toplaylist_ copyTrack_toPlaylist_�� 0 	getalbums 	getAlbums�� 0 thedatabase theDatabase�� 0 replacechars replaceChars�� 0 
texttolist 
textToList�� 0 escapeforunix escapeForUnix
�� .aevtoappnull  �   � ****�� � �� ����������� .0 copytrack_toplaylist_ copyTrack_toPlaylist_�� ����� �  ������ 0 atrack aTrack�� 0 theplaylist thePlaylist��  � �������� 0 atrack aTrack�� 0 theplaylist thePlaylist�� 0 m  � 
 ������������~�}�|
�� 
cTrk�  
�� 
pDID
�� .coredoexnull���     obj 
�� 
insh
� .coreclon****      � ****�~ 0 m  �}  
�| .ascrcmnt****      � ****�� 8� 4 '��.�[�,\Z��,E81j  ��l Y hW X  �j 	U� �{ ��z�y���x�{ 0 	getalbums 	getAlbums�z  �y  � �w�v�w 0 
thecommand 
theCommand�v 0 g  � 
 ��u�t�s�r�q�p�o�u �
�t .sysontocTEXT       shor�s 0 thedatabase theDatabase
�r .sysoexecTEXT���     TEXT�q 0 
texttolist 
textToList
�p 
cobj�o���x B��j %�%*j+ %E�O*�j �j l+ E�O��i/�  �[�\[Zk\Z�2E�Y hO�� �n'�m�l���k�n 0 thedatabase theDatabase�m  �l  � �j�i�j 0 x  �i 0 m  � 2�h<�gEH�f�e�d�c�b
�h .sysoexecTEXT���     TEXT�g 0 escapeforunix escapeForUnix�f 0 replacechars replaceChars
�e 
strq�d 0 m  �c  
�b .ascrcmnt****      � ****�k 0 $�j E�O�**�k+ ��m+ %j �,EW X  	�j 
� �aQ�`�_���^�a 0 replacechars replaceChars�` �]��] �  �\�[�Z�\ 0 txt  �[ 0 srch  �Z 0 repl  �_  � �Y�X�W�V�Y 0 txt  �X 0 srch  �W 0 repl  �V 0 	item_list  � �U�T�Su
�U 
txdl
�T 
citm
�S 
TEXT�^ !�*�,FO��-E�O�*�,FO��&E�O�*�,FO�� �R~�Q�P���O�R 0 
texttolist 
textToList�Q �N��N �  �M�L�M 0 txt  �L 	0 delim  �P  � �K�J�I�H�G�F�K 0 txt  �J 	0 delim  �I 0 saved saveD�H 0 thelist theList�G 0 errstr errStr�F 0 errnum errNum� �E�D�C��B
�E 
txdl
�D 
citm�C 0 errstr errStr� �A�@�?
�A 
errn�@ 0 errnum errNum�?  
�B 
errn�O 4*�,E�O �kv*�,FO��-E�W X  �*�,FO)�l�O�*�,FO�� �>��=�<���;�> 0 escapeforunix escapeForUnix�= �: �:    �9�9 0 n  �<  � �8�7�6�5�4�8 0 n  �7 0 badlist  �6 
0 filled  �5 0 i  �4 0 t  � ���3�2�
�3 
leng
�2 
ctxt�; :�E�O�E�O -k��,Ekh ��/E�O�� ��%�%E�Y ��%E�[OY��O�� �1�0�/�.
�1 .aevtoappnull  �   � **** k    j    "�-�-  �0  �/   �,�+�, 0 n  �+ 0 	thistrack 	thisTrack �* ��)��(�'�&�%�$�#�"�!� �������������������* 0 sparetracks spareTracks
�) 
cPly
�( 
pSpK
�' eSpKkSpZ
�& 
cTrk
�% 
pAlb�$ 0 	getalbums 	getAlbums
�# 
cobj�" 0 	sometrack 	someTrack
�! 
pDsN�   0 thealbumtracks theAlbumTracks
� 
leng�  �  
� 
cUsP� $0 myrandomplaylist myRandomPlaylist
� .coredelonull���     obj 
� 
kocl
� 
prdt
� 
pnam� 
� .corecrel****      � null� 0 chk  
� .corecnte****       ****
� 
pTrN� .0 copytrack_toplaylist_ copyTrack_toPlaylist_
� .hookPlaynull��� ��� obj 
� .hookRevlnull���     cobj
� .miscactvnull��� ��� null�.kjvE�O�b ehZ U*�.�[�,\Z�81�.�[�,\Z)j+ �.81E�O*�-�[[�,\Z��,E8\[�,\Z��,E8A1E�O��,b   Y hW X  h[OY��O *a b   /E` O_ �-j W #X  *a �a a b   la  E` O jk��,Ekh  fE` O A�[a �l kh  $�a ,�  eE` O)�_ l+ OY hW X  h[OY��O_ f  	��6FY h[OY��O�jv % �[a �l kh )�_ l+ [OY��Y hO_ j O _ j W X  hO*j U ascr  ��ޭ