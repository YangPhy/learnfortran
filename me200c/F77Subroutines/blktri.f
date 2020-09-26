      SUBROUTINE BLKTRI(NDIM,MDIM,M,N,A,B,C,X,R)
C     .......THIS PROGRAM SOLVES A TRI-BLOCK-DIAGONAL MATRIX.
C      .......NDIM = DIMENSION OF THE A,B AND C IN THE MAIN PROGRAM
C      .......MDIM = DIMENSION OF BLOCKS IN MAIN PROGRAM
C      .......M = SIZE OF BLOCKS
C      .......N = NUMBER OF BLOCKS
C      .......A,B,C = M*M MATRICES; A GOES FROM 2 TO N, B GOES
C      .......        FROM 1 TO N AND C GOES FROM 1 TO N-1.
C      .......X = RESULT VECTOR
C      .......R = RIGHT HAND SIDE VECTOR
C     C
      DIMENSION A(NDIM,MDIM,MDIM),B(NDIM,MDIM,MDIM),C(NDIM,MDIM,MDIM),
     1X(NDIM,MDIM),R(NDIM,MDIM)
C     .....FORWARD ELIMINATION-BLOCKS
      DO 1 I=1,N
C     .....GAUSS JORDAN FOR B(I)
      MM1 = M-1
      DO 2 J=1,MM1
C     .....NORMALIZE PIVOT ROW
      JP1=J+1
      DO 3 K=JP1,M
      T=1./B(I,J,J)
      B(I,J,K) = T*B(I,J,K)
    3 CONTINUE
      DO 4 K=1,M
      IF (I.EQ.N) GO TO 4
      C(I,J,K) = T*C(I,J,K)
    4 CONTINUE
      R(I,J) = T*R(I,J)
C     .....LOWER ELIMINATION IN B
      DO 5 K=JP1,M
      DO 6 KK=JP1,M
      B(I,K,KK) = B(I,K,KK)-B(I,K,J)*B(I,J,KK)
    6 CONTINUE
      DO 7 KK=1,M
      IF (I.EQ.N) GO TO 7
      C(I,K,KK) = C(I,K,KK)-B(I,K,J)*C(I,J,KK)
    7 CONTINUE
      R(I,K) = R(I,K)-B(I,K,J)*R(I,J)
    5 CONTINUE
    2 CONTINUE
C     .....UPPER (GAUSS JORDAN) EL	MINATION IN B
      T= 1./B(I,M,M)
      DO 20 KK = 1,M
      C(I,M,KK) = T*C(I,M,KK)
   20 CONTINUE
      R(I,M) = T*R(I,M)
      MM1=M-1
      DO 9  J=1,MM1
      MP = M-J+1
      MPM1=MP-1
      DO 10 K=1,MPM1
      MR = MP-K
      DO 11 KK=1,M
      IF ( I.EQ.N)GO TO 11
      C(I,MR,KK) = C(I,MR,KK)-B(I,MR,MP)*C(I,MP,KK)
   11 CONTINUE
      R(I,MR) = R(I,MR)-B(I,MR,MP)*R(I,MP)
   10 CONTINUE
    9 CONTINUE
C     .....B(I) IS NOW THE UNIT MATRIX
C     .....ELIMINATE A(I+1)
      IF (I.EQ.N) GO TO 1
      DO 12 J=1,M
      DO 13 K=1,M
      DO 14 KK=1,M
      B(I+1,K,KK) = B(I+1,K,KK)-A(I+1,K,J)*C(I,J,KK)
   14 CONTINUE
      R(I+1,K) = R(I+1,K)-A(I+1,K,J)*R(I,J)
   13 CONTINUE
   12 CONTINUE
    1 CONTINUE
C     .....BACK SUBSTITUTION
      DO 15 K=1,M
      X(N,K) = R(N,K)
   15 CONTINUE
      NM1 = N-1
      DO 16 J=1,NM1
      JB=N-J
      DO 17 K=1,M
      KR = M-K+1
      S=0.
      DO 18 KK=1,M
      S = C(JB,KR,KK)*X(JB+1,KK)+S
   18 CONTINUE
      X(JB,KR) = R(JB,KR)-S
   17 CONTINUE
   16 CONTINUE
        RETURN
C       STOP
      END
