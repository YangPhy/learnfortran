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
 
 
      SUBROUTINE DTRIDG (N,A,B,C,X,G)    
      IMPLICIT REAL*8 (A-H,O-Z)          
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
