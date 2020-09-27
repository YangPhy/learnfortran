! Formatting your output, exercise
! Yang Ma @ PITTPACC
! 2/18/2019

program formate
implicit none
integer, parameter :: imax = 50
integer :: i
real, dimension(imax) :: a,b

do i=1,imax
    a(i)=0.1*i
end do
b=exp(a)
open (12,file='myoutput.out')
write(12,*) "             x                  exp(x)                exp(x)"
write(12,*) "                              f format               e format"
write(12,*) "     -------------------------------------------------------"
do i=1,imax 
    write (12,1) a(i),b(i),b(i)
end do
1 format(2f20.5,E20.5) 
end program formate