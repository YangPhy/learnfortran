      PROGRAM ADI 
C-----THIS PROGRAM SOLVES THE HEAT EQUATION IN TWO DIMENSIONS BY THE  
C-----ALTERNATING DIRECTION IMPLICIT (ADI) METHOD. 
      DIMENSION F(21,21),FF(21,21),A(21),B(21),C(21),AA(21),BB(21), 
     1 CC(21),R(21),T(21) 
C-----CALL FOR THE PROBLEM DATA. 
   40 WRITE (6,100) 
  100 FORMAT ( ' TYPE THE NUMBER OF X INTERVALS') 
      READ (5,110) NX 
  110 FORMAT (I2) 
      WRITE (6,120) 
  120 FORMAT ( ' TYPE THE NUMBER OF Y INTERVALS') 
      READ (5,110) NY 
      WRITE (6,130) 
  130 FORMAT ( ' GIVE THE TIME STEP') 
      READ (5,140) DT 
  140 FORMAT (F6.3) 
      WRITE (6,150) 
  150 FORMAT ( ' GIVE THE FINAL TIME') 
      READ (5,140) TF 
      WRITE (6,160) 
  160 FORMAT ( ' RESULTS PRINTED EVERY K STEPS, GIVE K') 
      READ (5,110) K 
C-----NOW SET SOME OF THE BASIC PARAMETERS. 
      WX = .25 
      WY = .25 
      DX = WX / NX 
      DY = WY / NY 
      D = .1 
      BETX = D * DT / (DX*DX) 
      BETY = D * DT / (DY*DY) 
      NXM1 = NX - 1 
      NXP1 = NX + 1 
      NYM1 = NY - 1 
      NYP1 = NY + 1 
      TIME = 0. 
C-----SET UP THE MATRIX ELEMENTS FOR LATER USE. 
      DO 1 I=1,NXP1 
      A(I) = - .5 * BETX 
      B(I) = 1. + BETX 
    1 C(I) = - .5 * BETX 
      DO 2 I=1,NYP1 
      AA(I) = - .5 * BETY 
      BB(I) = 1. + BETY 
    2 CC(I) = - .5 * BETY 
C-----SET THE INITIAL AND BOUNDARY CONDITIONS. 
      DO 3 I=2,NX 
      F(I,1) = 0. 
      F(I,NYP1) = 100. 
      FF(I,1) = 0. 
      FF(I,NYP1) = 100. 05200	
      DO 3 J=2,NY 
    3 F(I,J) = 0. 
      DO 4 J=2,NY 
      FF(1,J) = 0. 
      FF(NXP1,J) = 100. 
      F(1,J) = 0. 
    4 F(NXP1,J) = 100. 
C-----MAIN LOOP 
   50 DO 5 L=1,K 
C-----X SWEEP.  SET UP RIGHT HAND SIDE AND SOLVE. 
      DO 6 J=2,NY 
      DO 7 I=1,NXM1 
    7 R(I) = -AA(J)*F(I+1,J-1) + (2.-BB(J))*F(I+1,J) - CC(J)*F(I+1,J+1) 
      R(1) = R(1) - A(1)*F(1,J) 
      R(NXM1) = R(NXM1) - C(NX)*F(NXP1,J) 
      CALL TRDIAG (NXM1,A,B,C,T,R) 
      DO 6 I=1,NXM1 
    6 FF(I+1,J) = T(I) 
C-----Y SWEEP. MIRROR IMAGE OF THE X SWEEP 
      DO 5 I=2,NX 
      DO 8 J=1,NYM1 
    8 R(J) = -A(I)*FF(I-1,J+1) + (2.-B(I))*FF(I,J+1) - C(I)*FF(I+1,J+1) 
      R(1) = R(1) - AA(1)*FF(I,1) 
      R(NYM1) = R(NYM1) - CC(NY)*FF(I,NYP1) 
      CALL TRDIAG (NYM1,AA,BB,CC,T,R) 
      DO 5 J=1,NYM1 
    5 F(I,J+1) = T(J) 
C-----NOW PRINT THE OUTPUT. 
      TIME = TIME + K * DT 
      WRITE (6,170) TIME,BETX,BETY 
      WRITE (20,170) TIME,BETX,BETY 
  170 FORMAT( ' TIME = ',F8.4,2X,'BETA X = ',F8.4,2X,'BETA Y = ',F8.4) 
      DO 9 J=1,NYP1 
      WRITE (6,180) (F(I,J) , I=1,NXP1) 
    9 WRITE (20,180) (F(I,J) , I=1,NXP1) 
  180 FORMAT ( 2X,10( F9.4,2X)) 
      IF (TIME.LT.TF) GO TO 50 
C-----ASK FOR ANOTHER CASE. 
      WRITE (6,190) 
  190 FORMAT ( ' IF YOU WANT TO RUN ANOTHER CASE, TYPE+1') 
      READ (5,110) IFF 
      IF (IFF.EQ.1) GO TO 40 
      STOP  
      END 
	  
      SUBROUTINE TRDIAG (N,A,B,C,X,G)
      DIMENSION A(1000),B(1000),C(1000),X(1000),G(1000),BB(1000)  
C.....THIS SUBROUTINE SOLVES TRIDIAGONAL SYSTEMS OF EQUATIONS     
C.....BY GAUSS ELIMINATION                                        
C.....THE PROBLEM SOLVED IS MX=G WHERE M=TRI(A,B,C)               
C.....THIS ROUTINE DOES NOT DESTROY THE ORIGINAL MATRIX           
C.....AND MAY BE CALLED A NUMBER OF TIMES WITHOUT REDEFINING      
C.....THE MATRIX                                                  
C.....N = NUMBER OF EQUATIONS SOLVED (UP TO 1000)                 
C.....FORWARD ELIMINATION                                         
C.....BB IS A SCRATCH ARRAY NEEDED TO AVOID DESTROYING B ARRAY    
      DO 1 I=1,N                                                  
      BB(I) = B(I)                                                
    1 CONTINUE                                                    
      DO 2 I=2,N                                                  
      T = A(I)/BB(I-1)                                            
      BB(I) = BB(I) - C(I-1)*T                                    
      G(I) = G(I) - G(I-1)*T                                      
    2 CONTINUE                                                    
C.....BACK SUBSTITUTION                                           
      X(N) = G(N)/BB(N)                           
      DO 3 I=1,N-1                                                
      J = N-I                                                     
      X(J) = (G(J)-C(J)*X(J+1))/BB(J)                             
    3 CONTINUE                                                    
      RETURN                                                      
      END                                                        
	






