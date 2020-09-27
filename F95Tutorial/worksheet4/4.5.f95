! Extending the precision
! Yang Ma @ PITTPACC
! 2/13/2019

program extended
implicit none
integer, parameter :: ikind=selected_real_kind(p=15)
real (kind=ikind) :: sum,x 
! real :: sum,x
integer :: i
sum=0.0
do i=1,100
    x=i 
    sum =sum+1.0/(x**6)
end do
print *,sum
end program extended
