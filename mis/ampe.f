      SUBROUTINE AMPE (PHIDH,GTKA,GKH,SCR1,SCR2,USETA)
C
C     THE PURPOSE OF THIS ROUTINE IS TO COMPUTE GKH
C
      INTEGER         PHIDH,GTKA,GKH,SCR1,SCR2,USETA,PHIAH
      COMMON /BLANK / NOUE
      COMMON /PATX  / LC,NS0,NS1,NS2,IUSET
      COMMON /BITPOS/ UM,UO,UR,USG,USB,UL,UA,UF,US,UN,UG,UE,UP,UNE,UFE,
     1                UD,UPS,USA,UK,UPA
      COMMON /ZZZZZZ/ Z(1)
      COMMON /SYSTEM/ SYSBUF,NOUT,SKIP(52),IPREC
      COMMON /PATX  / XXX,NROW1,NROW2
C
      PHIAH = PHIDH
C
C     DETERMINE IF PHIDH MUST BE MODIFIED
C
      IF (NOUE .EQ. -1) GO TO 20
C
C     BUILD PARTITIONING VECTORS
C
      IUSET = USETA
      LC = KORSZ(Z)
      CALL CALCV (SCR1,UD,UA,UE,Z)
C
C     PERFORM PARTITION
C
      NROW1 = NS0
      NROW2 = NS1
      PHIAH = SCR2
      CALL SSG2A (PHIDH,PHIAH,0,SCR1)
C
C     COMPUTE GKH
C
   20 CONTINUE
      CALL SSG2B (GTKA,PHIAH,0,GKH,1,IPREC,1,SCR1)
      RETURN
      END