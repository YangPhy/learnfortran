      parameter (n=6)
      real x,xd(n),yd(n),FDP(n)  

      data  xd/1., 2., 3., 4., 5., 6./
      data  yd/1., 1.2, 1.2, .3, 0., .5/

      x=3.5

 
      call SPLINE (n,xd,yd,FDP)
      call SPEVAL (n,xd,yd,FDP,x,yspl)
      print *,'x=',x
      print *,'y_spline=',yspl

      end

