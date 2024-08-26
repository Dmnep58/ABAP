*&---------------------------------------------------------------------*
*& Report zdpm_String_operation
* by --> Devi Prasad Mishra
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zdpm_Database_operation.

* Data Declarations
data: str type string value 'Devi'.

*string operations

*1. CONCATENATE
CONCATENATE str ' ' 'Prasad' into str.
WRITE: / 'Concatenation operator: ',str.

*2. Pipe operator
str = |{ str }| && | | && |Mishra|.
write:/'Pipe operator: ', str.


*3. split operator
split str at ' ' into data(str1) data(str2) data(str3).
write: / 'After splitiing: ',str1, str2, str3.


*4. search string
SEARCH str for 'Devi'.
if sy-subrc = 0.
"index position of the first letter if found.
    write:/ 'Search: ', sy-fdpos.
endif.


*5. translate --> upper , lower , any case.
TRANSLATE str1 to UPPER CASE.
TRANSLATE str2 to LOWER CASE.
write:/ 'Ater translating: ', str1 , str2.


*6. string length
write: / 'String Length: ', strlen( str ).



*7. CONDENSE string
CONDENSE str.
write: /'Condensed: ' , str.



*8. shift operator in abap.

shift str left by 3 PLACES.
write: /'Left Shift: ',str.

shift str right by 3 PLACES.
write: /'Right Shift: ',str.

shift str UP TO 'De'.
write : /'Shift Up to: ',str.

shift str CIRCULAR by 3 PLACES.
write: /'Circular shift: ',str.

shift str right CIRCULAR by 3 PLACES.
write: /'Right Circular Shift: ',str.

shift str RIGHT DELETING TRAILING str1.
write:/'shift deleting trailing: ',str.



*9. comparision operator.

if str co 'Devi'.
    write:/ 'Contains string'.
endif.

if str cn 'Devi'.
    write: / 'contains not only'.
endif.

if str ca 'M'.
    write: / 'contains any'.
endif.


if str na 'P'.
    write: / 'contains not any'.
endif.

if str cs 'Prasad'.
    write: / 'contains string'.
endif.

if str ns 'Mis'.
    write: / 'contains no string'.
endif.


if str cp '*Mi*'.
    write: / 'contains pattern'.
endif.


if str np '*De*'.
    write: / 'contains no pattern'.
endif.



*10. reverse string

data(s) = Reverse( str1 ).
write: /'Reverse String: ',s.


*11. repeat string
data(s1) = repeat( val = str1 occ = 6 ).
write: /'Repeated String: ',S1.


*12. boolean
data(s2) = xsdbool( sy-batch is INITIAL ).
write:/'Boolean: ',s2.


*13. susbtring
data(s3) = substring( val = str off = 2 len = 3 ).
write: /'Substring: ',s3.


*14. substring from
data(s4) = substring_from( val = str sub = 'PR').
write:/'Substring From: ',s4.


*15. substring after
data(s5) = substring_after( val = str sub = 'Mi' ).
write: /'Substring After: ',s5.


*16. substring before
data(s6) = substring_before( val = str  sub = 'Mi' ).
write: /'Substring Before: ',s6.


*17. substring to
data(s7) = substring_to( val = str  sub = 'sad' ).
write: /'Substring to: ',s7.