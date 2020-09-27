! Test for zero
! Yang Ma @ PITTPACC
! 2/12/2019

program testzero
implicit none
real :: x
print *, 'please input a number x'
read *, x
if (abs (x)<.000001) then
    print *, 'x is zero!'
endif
end program testzero