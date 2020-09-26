      PROGRAM SOR
C     SOLVES LAPLACE'S EQUATION IN A SQUARE BY SOR.
      DIMENSION F(21,21),EXACT(21,21),ERROR(21,21), 
     1         X(21),Y(21)
      OPEN(10,FILE = 'SOR.PRN',STATUS = 'UNKNOWN')
      OPEN(20,FILE = 'ERROR.PRN',STATUS = 'UNKNOWN')
   10 WRITE (*,100) 
  100 FORMAT ( ' GIVE THE NUMBER OF X INTERVALS',/)
      READ (*,*) NX
      WRITE (*,110)
  110 FORMAT ( ' GIVE THE NUMBER OF Y INTERVALS',/)
      READ (*,*) NY
      WRITE (*,120)
  120 FORMAT ( ' GIVE THE RELAXATION FACTOR OMEGA',/)
      READ (*,*) OMEGA
      WRITE (*,130)
  130 FORMAT ( ' RESULTS PRINTED EVERY K STEPS, GIVE K',/)
      READ (*,*) K
      WRITE (10,140) NX,NY,OMEGA
      WRITE (*,140) NX,NY,OMEGA
  140 FORMAT ( ' NX = ',I3,' NY = ',I3,' OMEGA = ',F6.3)
C     COMPUTE PARAMETERS 
      NXP1 = NX + 1
      NYP1 = NY + 1
      MIDX = NX / 2
      MIDY = NY / 2
      DX = 1. / FLOAT(NX)
      DY = 1. / FLOAT(NY)
      EPS = 1.E-4
      ITNUM = 0
      ITCYCLE = 0
C     INITIAL CONDITION AND BOUNDARY CONDITIONS
      DO 1 I=2,NX
        X(I) = (I - 1) * DX
        F(I,1) = 0.
        F(I,NYP1) = 100. * X(I)
        DO 2 J=2,NY
          Y(J) = (J - 1) * DY
          F(I,J) = 1.
          EXACT(I,J) = 100. * X(I) * Y(J)
    2   CONTINUE
    1 CONTINUE
      DO 3 J=2,NY
        F(1,J) = 0.
        F(NXP1,J) = 100. * Y(J)
    3 CONTINUE
C     MAIN LOOP.  DO K SWEEPS AND THEN PRINT RESULTS.
   20 DO 4 L=1,K
        DO 5 I=2,NX
          DO 6 J=2,NY
            F(I,J) = OMEGA * .25 * (F(I-1,J) + F(I+1,J) +
     1                              F(I,J-1) + F(I,J+1)) -
     2               (OMEGA - 1.) * F(I,J)
            ERROR(I,J) = EXACT(I,J) - F(I,J)
    6     CONTINUE
    5   CONTINUE
    4 CONTINUE
C     WRITE THE RESULTS 
      ITNUM = ITNUM + K
      WRITE (10,150) ITNUM, ERROR(MIDX,MIDY)
      WRITE (*,150) ITNUM, ERROR(MIDX,MIDY)
  150 FORMAT ( ' ERROR FOR ITERATION NUMBER ',I4,2X,E12.3)
      ITCYCLE = ITCYCLE + 1
      IF (ITCYCLE.EQ.5) THEN
        WRITE (20,160) ITNUM
  160   FORMAT ( 'ERROR FOR ITERATION NUMBER ',I4)
        WRITE (20,170) (ERROR(I,MIDY) , I=2,NX)
  170   FORMAT ( 21E12.3)
        ITCYCLE = 0
      ENDIF
C     CHECK FOR CONVERGENCE.
      DO 7 I=2,NX
        DO 8 J=2,NY
          IF (ABS(ERROR(I,J)).GT.EPS) GO TO 20
    8   CONTINUE
    7 CONTINUE
C     ASK FOR ANOTHER CASE.
      WRITE (*,180) 
  180 FORMAT ( ' IF YOU WANT ANOTHER CASE, TYPE 1',/)
      READ (*,*) IFF
      IF (IFF.EQ.1) GO TO 10
      STOP 
      END 
