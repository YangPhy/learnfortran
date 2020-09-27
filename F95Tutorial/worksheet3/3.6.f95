! Using loops to do summation
! Yang Ma @ PITTPACC
! 2/13/2019

program increment
implicit none
integer :: i 
real :: x 
x=1.0
do i=1,10
    x=x+1.0
    print *,i,x
end do 
end program increment