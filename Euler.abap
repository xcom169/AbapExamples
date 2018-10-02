*&---------------------------------------------------------------------*
*& Report YCTPROBA2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT YCTPROBA2.



DATA: NUM  TYPE I VALUE 100,
      NUM2 TYPE I VALUE 100.
DATA: SUM TYPE I VALUE 0.
DATA: LV_STR TYPE STRING.
DATA: LEN TYPE I VALUE 0.

TYPES: BEGIN OF ITAB,

         NUM TYPE I,

       END OF ITAB.

DATA INT_WA TYPE TABLE OF ITAB WITH HEADER LINE.

WHILE ( NUM <= 999 ).
  WHILE ( NUM2 <= 999 ).

    SUM = NUM * NUM2.
    LV_STR = SUM.
    CONDENSE LV_STR.
    LEN = STRLEN( LV_STR ).
    IF ( SUM >= 100000 ).
      IF ( ( LV_STR+0(1) = LV_STR+5(1)  AND ( LV_STR+1(1) = LV_STR+4(1) ) AND ( LV_STR+2(1) = LV_STR+3(1) ) ) ).

        INT_WA-NUM = SUM.
        APPEND INT_WA.

      ENDIF.

    ENDIF.



    ADD 1 TO NUM2.

  ENDWHILE.
  NUM2 = 100.
  ADD 1 TO NUM.
ENDWHILE.
DELETE ADJACENT DUPLICATES FROM INT_WA COMPARING NUM.
SORT INT_WA DESCENDING BY NUM.
READ TABLE INT_WA INDEX 1.


WRITE:/ INT_WA-NUM.

Split mychar AT '/' into LV_STR1 LV_STR2.

write:/ lv_str1, lv_str2.

data: CTR(10) type c,
      Plate(10) type c.


IF lv_str1 CA ':'.

  SPLIT LV_STR1 at ':' into ctr Plate.

Write:/ CTR, Plate.
ENDIF.
