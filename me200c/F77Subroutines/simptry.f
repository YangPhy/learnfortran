      PROGRAM MAIN 

C  THIS PROGRAM USES SUBROUTINE SIMP TO
C  Calculate the integral 
C  in Example 3.1 of Fundamental of Engineering Numerical Analysis, Moin.

      EXTERNAL FUN 

      PRINT *, ' GIVE THE NUMBER OF POINTS (MUST BE ODD)'
      READ  *, N     

      A=1.
      B=3.1415926536

      N=N-1
      CALL SIMP(FUN,A,B,C,N,XINT)
      WRITE (*,"(    'RESULT IS ', E16.6      )") XINT

      END
                                                                    
      FUNCTION FUN (X,C)
         FUN = SIN(X)/X**3/2.
      END
