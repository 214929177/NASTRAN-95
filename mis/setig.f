      SUBROUTINE SETIG (KG1,KG2,IG,NORIG)
C
C     THIS ROUTINE IS USED ONLY IN BANDIT MODULE
C
C     THIS ROUTINE SETS IG(KG1,-)=KG2 AND IG(KG2,-)=KG1 IF THIS
C     CONNECTION HAS NOT ALREADY BEEN SET.
C     NEDGE = NUMBER OF UNIQUE EDGES.
C
      INTEGER          BUNPK
      DIMENSION        IG(1),    NORIG(1), SUB(2)
      COMMON /BANDS /  NN,       MM,       DUM2(2),  MAXGRD,   MAXDEG,
     1                 DUM3(3),  NEDGE
      COMMON /SYSTEM/  IBUF,     NOUT
      DATA             SUB /     4HSETI,   4HG       /
C
      IF (KG1.EQ.0 .OR. KG2.EQ.0 .OR. KG1.EQ.KG2) GO TO 80
      L=KG1
      K=KG2
      DO 50 LOOP=1,2
      IF (LOOP.EQ.1) GO TO 20
      L=KG2
      K=KG1
   20 M=0
   30 M=M+1
      IF (M.GT.MAXDEG) GO TO 60
      IS=BUNPK(IG,L,M)
      IF (IS.EQ.0) GO TO 40
      IF (IS.NE.K) GO TO 30
      GO TO 80
   40 CALL BPACK (IG,L,M,K)
      MM=MAX0(MM,M)
      IF (LOOP.EQ.1) NEDGE = NEDGE + 1
   50 CONTINUE
      GO TO 80
C
   60 WRITE (NOUT,70) NORIG(L),MAXDEG
   70 FORMAT (34H0***  FATAL ERROR - - - GRID POINT,I10,
     1        48H  HAS DEGREE EXCEEDING THE NODAL DEGREE LIMIT OF,I8)
      CALL MESAGE (-8,0,SUB)
   80 RETURN
      END