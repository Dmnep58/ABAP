*&---------------------------------------------------------------------*
*& Report zdpm_Database_operation
* by --> Devi Prasad Mishra
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zdpm_Database_operation.

* DATA BASE operations can be perfromed using various query types and
*various operators

*1. SELECT and endselect
SELECT matnr , ernam,ersda FROM mara INTO @DATA(ls_mara).
ENDSELECT.
WRITE : / 'select and endselect output: ', ls_mara-matnr.


* 2. single record --> single keyword.
CLEAR:ls_mara.
SELECT SINGLE matnr ernam  FROM mara INTO ls_mara.
WRITE: / 'single keyword output :', ls_mara-matnr.


* 3. And operator
SELECT * FROM mara INTO TABLE @DATA(lt_mara) WHERE matnr = 'TG10' AND matnr = 'TG11'.
PERFORM display.


* 4. or operator.
SELECT * FROM mara INTO TABLE lt_mara WHERE matnr = 'TG10' OR matnr = 'TG11'.
PERFORM display.


* 5. single field as target.
SELECT SINGLE ersda FROM mara INTO @DATA(ersd) WHERE matnr = 'TG10'.
WRITE:/ ersd.


*  6. ALIASES in query
SELECT SINGLE matnr AS mat ernam AS ern FROM mara INTO ls_mara.
WRITE: / ls_mara-matnr , ls_mara-ernam.


*7. distinct statement --> unique data only
SELECT DISTINCT ( matnr ) FROM mara INTO TABLE lt_mara.
PERFORM display.


* 8. restrict number of lines
SELECT * FROM mara INTO TABLE lt_mara UP TO 3 ROWS.
PERFORM display.


* 9. by passing buffer --> need not to store data into buffer
WRITE: / 'By Passing Buffer'.
SELECT * FROM mara INTO TABLE lt_mara BYPASSING BUFFER UP TO 2 ROWS.
PERFORM display.


* 10. check values in interval and not in interval.
WRITE: / 'Between'.
SELECT * FROM mara INTO TABLE lt_mara WHERE matnr BETWEEN 'EWMS4-01' AND 'EWMS4-11'.
PERFORM display.

SELECT * FROM mara INTO TABLE lt_mara UP TO 4 ROWS WHERE matnr NOT BETWEEN 'EWMS4-01' AND 'EWMS4-11'.
PERFORM display.


* 11. sy-DBCNT --> number of records processed to internal table from DB.


* 12. like operator to fetch the data
WRITE: / 'like operator'.
SELECT * FROM mara INTO TABLE lt_mara  UP TO 3 ROWS WHERE matnr LIKE 'E%'.
PERFORM display.

SELECT * FROM mara INTO TABLE lt_mara  UP TO 3 ROWS WHERE matnr LIKE '%E'.
PERFORM display.

SELECT * FROM mara INTO TABLE lt_mara  UP TO 3 ROWS WHERE matnr LIKE '%E%'.
PERFORM display.



* 13. in operator.
WRITE: / 'IN operator'.
SELECT * FROM mara INTO TABLE lt_mara UP TO 2 ROWS WHERE matnr IN ('EWMS4-01','EWMS4-11').
PERFORM display.

SELECT * FROM mara INTO TABLE lt_mara UP TO 2 ROWS WHERE matnr NOT IN ('EWMS4-01','EWMS4-11').
PERFORM display.



*  14. null or not null values
WRITE : / 'NULL and NOT NULL'.
SELECT * FROM mara INTO TABLE lt_mara UP TO 2 ROWS WHERE ernam IS NULL.
PERFORM display.

SELECT * FROM mara INTO TABLE lt_mara UP TO 2 ROWS WHERE ernam IS NOT NULL.
PERFORM display.



* 15. negative condition --> not pick the matnr value equal to given condition.
WRITE: / 'Negative condition in query'.
SELECT * FROM mara INTO TABLE lt_mara UP TO 2 ROWS WHERE NOT matnr = 'TG11'.
PERFORM display.



* 16. group by
WRITE: /'Group By Clause'.
SELECT matnr ernam FROM mara INTO TABLE lt_mara UP TO 12 ROWS GROUP BY matnr ernam.
PERFORM display.


* 17. having clause with group by --> having is used with agregate functions
WRITE: / 'Having clause with froup by.'.
SELECT carrid , connid FROM sflight INTO TABLE @DATA(lt_scarr) UP TO 2 ROWS WHERE carrid = 'AA' OR carrid = 'LH'
    GROUP BY carrid,connid  HAVING SUM( seatsocc ) > 300.
ULINE.
LOOP AT lt_Scarr INTO DATA(ls_Scarr).
  WRITE: ls_Scarr-carrid.
ENDLOOP.
ULINE.


*  18. sorting -- order by
write : / 'Order By'.

" key
select matnr ernam from mara into table lt_mara up to 2 rows ORDER BY matnr.
perform display.

"ascending order
select matnr ernam from mara into table lt_mara up to 2 rows ORDER BY matnr ASCENDING.
perform display.

"descending order
select matnr ernam from mara into table lt_mara up to 2 rows ORDER BY matnr DESCENDING.
perform display.



" display the table data.
FORM display.
    ULINE.
    LOOP AT lt_mara INTO DATA(ls_tab).
        WRITE: / ls_tab-matnr.
    ENDLOOP.
    WRITE: / 'finished'.
    ULINE.
    CLEAR lt_mara.
ENDFORM.