! Mixing variable types: divide
! Yang Ma @ PITTPACC
! 2/12/2019

program divide
implicit none
integer :: x1,x2
real :: y1,y2,y12,y22
x1=1
x2=10
y1=x1/3
y2=x2/3
y12=x1/3.0
y22=x2/3.0
print *, y1,y2,y12,y22
end program divide