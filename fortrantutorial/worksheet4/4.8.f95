! Convergence - exiting loops on a condition 
! Yang Ma @ PITTPACC
! 2/15/2019

program whileloop
implicit none
integer,parameter :: ikind=selected_real_kind (p=15)
real (kind=ikind) :: sum,previoussum,x,smallnumber,error
integer :: i
sum = 0.0
previoussum=0.0
smallnumber = 10**(-15.0)
do i=1,1000
    x=i
    sum = sum + 10/(x**6)
    error=abs(sum-previoussum)
    if (error<smallnumber) then
        print *,'sum ',sum, ' number of loops ',i 
        exit
    end if 
    previoussum = sum
end do 
end program whileloop