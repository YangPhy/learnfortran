! Reading from files
! Yang Ma @ PITTPACC
! 2/13/2019

program readdate
implicit none
real :: x,y,z
open (10,file='mydata')
read (10,*) x,y,z
print *, x,y,z
end program readdate
