! Writting to files
! Yang Ma @ PITTPACC
! 2/13/2019

program io2
implicit none
real :: num
integer :: i
open (12,file='myoutput.out')
do i=1,100
    num=i/3.0
    write (12,*) num
end do
print *, 'done.'
end program io2