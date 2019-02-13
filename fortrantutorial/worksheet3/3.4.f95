! do loop: practice:
! Using a do loop to generate integer values of x between –10 and 10 in steps of 1, write a program that constructs a table of values of y = 1.0/x 
! What happened when x had the value zero? Use an if, end if to test for the condition that gives the incorrect value, and print out an appropriate message. 
! Yang Ma @ PITTPACC
! 2/13/2019

program looppractics
implicit none
integer:: x
real :: y 
do x=-10,10
    if (x/=0) then
        y=1.0/x
        print *, y
    else
        print *, 'when x=0, the result should be infitity'
    end if
end do
end program looppractics