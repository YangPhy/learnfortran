! Array 
! Yang Ma @ PITTPACC
! 2/18/2019

program av
implicit none
integer, parameter :: imax = 10
real,dimension(imax) ::x 
real :: average,sum
integer :: i 
print *, 'enter ',imax, ' numbers'
sum =0.0
do i=1,imax
    read *, x(i)
    sum =sum +x(i)
end do 
average = sum/10
print *, 'the average is ', average 
print *, 'the numbers are '
print *, x
end program av