! Array magic 2
! Yang Ma @ PITTPACC
! 2/18/2019

program magic2
implicit none
integer :: i
real,dimension(10) :: x
do i=0,9
    x(i)=0.1*i
end do
print *, 'sin(x)', sin(x)
print *, 'cos(x)', cos(x)
print *, 'sin(x)^2+cos(x)^2',sin(x)**2+cos(x)**2

end program magic2