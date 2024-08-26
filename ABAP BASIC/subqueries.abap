*&---------------------------------------------------------------------*
*& Report zdpm_Database_operation
* by --> Devi Prasad Mishra
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zdpm_Database_operation.

* DATA BASE operations can be perfromed using various query types and
* sub-queries

*A subquery is a special SELECT statement containing a subquery within particular conditions of the WHERE or HAVING clauses.
*You cannot use them in the ONcondition of the FROM clause.

* Types of subqueries
* 1. saclar subqueries
* 2. non scalar subqueries

*------------------------------------------------------------------------------------------------*
*------------------------------------------------------------------------------------------------*


* 1. Scalar SubQueries --> reads the latitude and longitude of the departure city of flight LH 402 from database table SGEOCITY.
DATA: carr_id TYPE spfli-carrid VALUE 'LH',
    conn_id TYPE spfli-connid VALUE '0400'.

DATA: city  TYPE sgeocity-city,
    lati  TYPE p DECIMALS 2,
    longi TYPE p DECIMALS 2.

SELECT  SINGLE city latitude longitude
    INTO  (city, lati, longi)
    FROM  sgeocity
    WHERE city IN ( SELECT  cityfrom
                    FROM  spfli
                    WHERE carrid = carr_id AND
                        connid = conn_id      ).


WRITE: city, lati, longi.
ULINE.

* 2. non scalar subqueries --> This example selects all lines from database table mara.
SELECT * FROM mara INTO TABLE @DATA(lt_mara) UP TO 10 ROWS WHERE
        EXISTS ( SELECT * FROM marc WHERE matnr = mara~matnr ).

LOOP AT lt_mara INTO DATA(ls_mara).
    WRITE:/ ls_mara-matnr.
ENDLOOP.




*interactive subquery
DATA: wa    TYPE sflight,
    plane LIKE wa-planetype,
    seats LIKE wa-seatsmax.

SELECT     carrid connid planetype seatsmax MAX( seatsocc )
    INTO     (wa-carrid, wa-connid, wa-planetype,
            wa-seatsmax, wa-seatsocc)
    FROM     sflight
    GROUP BY carrid connid planetype seatsmax
    ORDER BY carrid connid.

    WRITE: /  wa-carrid,
            wa-connid,
            wa-planetype,
            wa-seatsmax,
            wa-seatsocc.

    HIDE: wa-carrid, wa-connid, wa-seatsmax.

ENDSELECT.

AT LINE-SELECTION.

    WINDOW STARTING AT 45 3 ENDING AT 85 13.

    WRITE: 'Alternative Plane Types',
        'for', wa-carrid, wa-connid.

ULINE.

SELECT  planetype seatsmax
    INTO  (plane, seats)
    FROM  saplane AS plane
    WHERE seatsmax < wa-seatsmax AND
        seatsmax >= ALL ( SELECT  seatsocc
                            FROM  sflight
                            WHERE carrid = wa-carrid AND
                                    connid = wa-connid     )
    ORDER BY seatsmax.

    WRITE: / plane, seats.

    if wa is not initial.
    elseif wa is initial.
    else.
    endif.

ENDSELECT.








