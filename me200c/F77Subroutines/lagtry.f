

               
      parameter (n=6)
      real x,y,xd(n),yd(n),zd(n)
 
      do i=1,n
          xd(i)=(i-1.)/real(n-1)
          yd(i)=2*xd(i)**5
          zd(i)=2*xd(i)**9
      enddo

      x=0.75     

      call lagran(xd,yd,x,y,n)
      print *,'interpolating a polynomial of order 5 with 6 pts'
      print *,'answer should be exact'
      print *,'x=',x
      print *,'y_lagrange=',y
      print *,'y_exact=',2*x**5
      print *

      call lagran(xd,zd,x,y,n)
      print *,'interpolating a polynomial of order 9 with 6 pts'
      print *,'answer should not be exact'
      print *,'x=',x
      print *,'y_lagrange=',y
      print *,'y_exact=',2*x**9

      end

