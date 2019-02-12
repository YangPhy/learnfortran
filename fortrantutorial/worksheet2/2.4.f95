! Making Decisions using if
! Yang Ma @ PITTPACC
! 2/12/2019

program iftest
implicit none
integer :: x
print *, 'Please input an integer'
read *, x
if (x>0 .and. x <1)then
    print *, 'the integer is greater than 0 but less than 1'
elseif (x>1 .and. x<10) then 
    print *, 'the integer is greater than 1 but less than 10'
else
    print *, 'the integer is outside both range'
endif
end program iftest