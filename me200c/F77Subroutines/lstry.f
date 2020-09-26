C
C     SAMPLE PROGRAM TO USE THE [ LSODE ]  SUBROUTINE ,
C            WHICH IS DESIGNED TO SOLVE A STIFF ODE .
C
C     ODE  WHICH IS SOLVED HERE IS 
C
C          F''' +  F * F'' / 2  = 0   ----------------------(1)
C               F  (0) = 0.0
C               F' (0) = 0.0
C               F''(0) = 0.33206
C
C     SET
C         Y(1) = F
C         Y(2) = F'
C         Y(3) = F''
C
C     THEN (1) IS REDUCED INTO THE FOLLOWING
C
C         dY(1)/dx = Y(2)
C         dY(2)/dx = Y(3)
C         dY(3)/dx = -0.5*Y(1)*Y(3)
C         
      IMPLICIT REAL*8(A-H,O-Z)
      EXTERNAL  FEX,JEX
      DIMENSION Y(3),RTOL(3),ATOL(3),RWORK(58),IWORK(23)
      DATA NEQ,ITOL,ITASK,LRW,LIW,MF/3,1,1,58,23,21/
      DATA ATOL,RTOL /3*1.0D-06,3*1.0D-04/
      DATA IOPT,TFIN /0,1.0D+01/
C      
      OPEN(1,FILE='LSTRY.DAT',STATUS='UNKNOWN')
      Y(1) = 0.0D-00
      Y(2) = 0.0D-00
      Y(3) = 3.3206D-01
      T  = 0.0
      DT = 1.0D-01
      TOUT = DT
      WRITE(1,20)
20    FORMAT(/////)
      WRITE(1,21) T,Y(1),Y(2),Y(3)
      ISTATE = 1
1     CALL LSODE(FEX,NEQ,Y,T,TOUT,ITOL,RTOL,ATOL,ITASK,ISTATE,
     1           IOPT,RWORK,LRW,IWORK,LIW,JEX,MF)
      IF(ISTATE.LT.0) GOTO 80
      WRITE(1,21) T,Y(1),Y(2),Y(3)
21    FORMAT(5X,4(1PD15.4))
      IF(TOUT.EQ.TFIN) GOTO 81
      TOUT = DMIN1(TFIN,TOUT+DT)
      GOTO 1
80    WRITE(1,22) ISTATE
22    FORMAT(///5X,'******  ISTATE = ',I5)
81    STOP
      END
C
      SUBROUTINE FEX(NEQ,T,Y,YDOT)
      IMPLICIT REAL*8(A-H,O-Z)
      DIMENSION Y(3),YDOT(3)
      YDOT(1) =  Y(2)
      YDOT(2) =  Y(3)
      YDOT(3) = -0.5*Y(1)*Y(3)
      RETURN
      END
C
      SUBROUTINE JEX(NEQ,T,Y,ML,MU,PD,NRPD)
      IMPLICIT REAL*8(A-H,O-Z)
      DIMENSION Y(3),PD(NRPD,3)
      PD(1,2) =  1.0D-00
      PD(2,3) =  1.0D-00
      PD(3,1) = -0.5*Y(3)
      PD(3,3) = -0.5*Y(1)
      RETURN
      END
