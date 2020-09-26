C  THIS PROGRAM USES SUBROUTINE RUNGE4 TO solve
C  Example 4.6 of Fundamental of Engineering Numerical Analysis, Moin.
C  you can compare to the exact solution: cos(4t)

      implicit  real*8(a-h,o-z)
      parameter (n_eqn=2)
      dimension  y(n_eqn)
      external  get_dydt
      data y /1.,0./
      data dt, t, t_final /0.15, 0., 6./


          open(11,file="data_rk4", form="formatted")
          write(11,*) 'time, y_rk4' 

          write(11,"(2(e20.12))")t,y(1)   
          n_step=t_final/dt

          do i=1,n_step 
              call runge4 (n_eqn,t,y,1,dt,get_dydt)
              write(11,"(2(e20.12))")t,y(1)  
          end do
      end


      subroutine get_dydt (t,y,dydt)
      real*8 y(2),dydt(2),t
      
          dydt(1)=y(2)
          dydt(2)=-16.0*y(1)
      end
      
