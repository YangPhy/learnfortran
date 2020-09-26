      PROGRAM MAIN 

C  THIS PROGRAM USES SUBROUTINE SIMP TO
C  Calculate the integral 
C  in Example 3.2 of Fundamental of Engineering Numerical Analysis, Moin.

      EXTERNAL FUN 
      REAL Z(20,20)

      ERR=1e-8
      A=1.
      B=3.1415926536
      DO I=1,20
      DO J=1,20
      Z(I,J)=0.
      ENDDO  
      ENDDO  
      CALL ROMBERG (FUN,A,B,C,ERR,XINT,Z,M)       
      WRITE (*,"(    'RESULT IS ', E14.6      )") XINT
      WRITE (*,*)  
      DO I=2,M
      DO K=1,I-1
       write(6,fmt="($,F10.6)")(Z(I,K))
       ENDDO  
        write(6,*)
      ENDDO  
      END                                                                        
      FUNCTION FUN (X,C)
         FUN = SIN(X)/X**3/2.
      END
                                                                                
