      subroutine lagran(xd,yd,x,y,n)
c-----------------------------------------------------------------------
c  Routine uses nth order Lagrange interpolation to find y(x).
c  Input : xd,yd  - x and y(x) known data points
c          x      - value of x at which interpolation is performed
c          n      - number of xd,yd points, (order of interp is n-1)
c  Output: y      - interpolated value of y at x
c-----------------------------------------------------------------------
      integer n,i,j
      real  xd(n),yd(n),x,y,ytemp
      y = 0.0
      do 20 j=1,n
        ytemp = 1.0
        do 10 i=1,n
10      if( i.ne.j ) ytemp = ytemp * (x-xd(i)) / (xd(j)-xd(i))
20    y = y  +  ytemp * yd(j)
      return
      end
