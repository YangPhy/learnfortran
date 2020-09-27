! Mixing variable types: a more complicated example
! Yang Ma @ PITTPACC
! 2/12/2019

program check
implicit none
real :: x,y 
integer :: i
x=2.0
i=2
y=x*((2**i)/3)
print *, y 
y=x*((2.0**i)/3)
print *,y 
end program check