                                                                      
      SUBROUTINE runge4(N,X,Y,K,H,get_dydx)                                            
C-----THIS SUBROUTINE ADVANCES THE SOLUTION TO THE SYSTEM OF N ODE'S  
C-----DY(i)/DX = f(X,Y(1),Y(2),,.....Y(N)), i=1,...,N       
C-----USING THE FOURTH ORDER RUNGE-KUTTA METHOD.                        
C-----N = Number of differential equations in the system. N<=10
C-----X = INITIAL VALUE OF THE INDEPENDENT VARIABLE; IT IS INCREASED          
C-----    BY THE SUBROUTINE.                                                  
C-----Y = INITIAL VALUE OF THE DEPENDENT VARIABLE(S); THE ROUTINE             
C-----    OVERWRITES THIS WITH THE NEW VALUE(S).    
C-----H = time step
C-----K = number of steps to advance the equations
C-----get_dydx:  subroutine  get_dydx(X,Y,DYDX)

      IMPLICIT REAL*8(A-H,O-Z)                     
      EXTERNAL get_dydx      
      DIMENSION Y(10),YS(10),YSS(10),YSSS(10),T1(10),T2(10),                  
     1          T3(10),T4(10)                                                 
C-----THE MAIN LOOP                      
C      print*, X, Y(1), Y(2), Y(3), Y(4), Y(5)

      DO 1 I=1,K                                                              
C-----TEMPORARY ARRAYS ARE NEEDED FOR THE FUNCTIONS TO SAVE THEM              
C-----FOR THE FINAL CORRECTOR STEP.                                           
C-----FIRST (HALF STEP) PREDICTOR                                             
      call get_dydx(X,Y,T1)
      DO 2 J=1,N                                                              
      YS(J) = Y(J) + .5 * H * T1(J)
    2 CONTINUE                                                                
C-----SECOND STEP (HALF STEP CORRECTOR)                                       
      X = X + .5 * H                                                          
      call get_dydx(X,YS,T2)
      DO 3 J=1,N                                                              
      YSS(J) = Y(J) + .5 * H * T2(J)                                          
    3 CONTINUE                                                                
C-----THIRD STEP (FULL STEP MIDPOINT PREDICTOR)                               
      call get_dydx(X,YSS,T3)
      DO 4 J=1,N                                                              
      YSSS(J) = Y(J) + H * T3(J)                                              
    4 CONTINUE                                                                
C-----FINAL STEP (SIMPSON'S RULE CORRECTOR)                                   
      X = X + .5 * H                                                          
      call get_dydx(X,YSSS,T4)
      DO 5 J=1,N                                                              
      Y(J) = Y(J) + (H/6.)*(T1(J) + 2.*(T2(J)+T3(J)) + T4(J))                 
    5 CONTINUE                                                                
    1 CONTINUE                                                                
      RETURN                                                                  
      END                                                                     

