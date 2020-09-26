      SUBROUTINE ROMBERG(FUN,A,B,C,ERR,RES,Z,M)

C-----THIS SUBROUTINE COMPUTES INTEGRALS OF USER SUPPLIED 
C-----FUNCTIONS BY THE ROMBERG METHOD.  THE INPUTS ARE:
C-----FUN = THE FUNCTION TO BE INTEGRATED
C-----A = LOWER LIMIT
C-----B = UPPER LIMIT
C-----C = PARAMETER NEEDED TO DEFINE FUNCTION (COULD
C-----    BE CHANGED TO AN ARRAY IF NECESSARY.)
C-----ERR = DESIRED ACCURACY, SHOULD NOT BE LESS THAN
C-----      MACHINE PRECISION
C-----THE OUTPUT IS RES, THE RESULT, Z , the array of all the 
C     approximations used, and M, the number of levels reached 
C     in the approximations. Z and M are included in the output
C     for later use if needed and they can be ignored or removed
C     otherwise. Z should be of dimension Z(20,20).
C     The approximations are located in the lower triangular 
C     part of Z according to the following:
C     Z( I=1 to M, 1) gives the approxiamtions of O(h^2)
C     Z( I=2 to M, 2) gives the approxiamtions of O(h^4)
C     Z( I=3 to M, 3) gives the approxiamtions of O(h^6)
C      .
C      .
C     At each level I, the number of panels is 2**(I-1).
C     The user can oblige the routine to use more and more
C     panels by making ERR smaller and smaller. Remember to 
C     compile with double precision if ERR is small, 1.E-10 for exp.
C     If your driver code that calls ROMBERG is called rombtry.f
C     use : f77    rombtry.f romberg.f

      EXTERNAL FUN 
      DIMENSION Z(20,20) 

C-----INITIALIZE THE INDEX AND COMPUTE 1st APPROXIMATION.  
      I = 1
      DEL = B - A 
      Z(1,1) = .5 * DEL * (FUN(A,C) + FUN(B,C))
C-----THE MAIN LOOP.  THE FIRST PART COMPUTES THE INTEGRAL 
C-----USING A 2J+1 POINT TRAPEZOID RULE.  THE METHOD MAKES 
C-----MAXIMAL USE OF THE VALUES ALREADY COMPUTED.
C-----THE NUMBER OF PANELS IS 2**(I-1)   
   10 J = 2**(I-1)   
      DEL = DEL/2.
      I = I + 1 
      Z(I,1) = .5 * Z(I-1,1) 
      DO 1 K=1,J  
      X = A + (2.*K - 1) * DEL
      Z(I,1) = Z(I,1) + DEL * FUN(X,C) 
    1 CONTINUE 
C-----NOW WE NEED TO DO THE RICHARDSON EXTRAPOLATION.
      DO 2 K=2,I 
      Z(I,K) = (4.**(K-1)*Z(I,K-1) - Z(I-1,K-1)) / (4.**(K-1) -1.)  
    2 CONTINUE  
C-----ERROR CONTROL TIME  
      DIFF = ABS (Z(I,I) - Z(I,I-1))   
      M=I           
      IF (DIFF. LT. ERR) GO TO 20       
C-----THE MAXIMUM NUMBER OF ITERATIONS ALLOWED IS 100.    
      IF (I. LT. 20) GO TO 10  
      PRINT *, ' MORE THAN 20 ITERATIONS REQUIRED, CHECK PARAMETERS'
      STOP 
   20 RES = Z(I,I)

      END

