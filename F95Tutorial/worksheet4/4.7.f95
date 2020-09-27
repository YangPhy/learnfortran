! magnitude
! Yang Ma @ PITTPACC
! 2/14/2019

program magnitude
implicit none
integer, parameter :: ikind=selected_real_kind(p=15)
integer i,maxpower,response


print *,'Effect of magnitude on integer, real or extended precision'
print *,'Type 1 for integer, 2 for real or 3 for extended precision'
read  *, response
print *,'Enter the maximum power'
read *,maxpower

do i=1,maxpower
    if (response==1) then
        print *,i,2**i
    else if (response==2) then
        print *,i,2.0**i   
    else if (response==3) then
        print *,i,2.0_ikind**i
    else
        print *,'invalid response'
        stop
    end if
end do
end program magnitude   
                       