! Making Decisions
! Yang Ma @ PITTPACC
! 2/12/2019

program test
implicit none
real :: x,y,answer
integer :: choice
print *, 'Choose an option'
print *, '1: Multiply'
print *, '2: Divide'
print *, '3: Add'
read *, choice
x=3.4
y=2.9

if (choice==1) then
    answer=x*y
end if
if (choice==2) then
    answer=x/y
end if
if (choice==3) then
    answer=x+y
end if

! if (choice==1) then
!     answer=x*y
! elseif(choice==2) then
!     answer=x/y
! elseif(choice==3) then
!     answer=x+y
! end if

print*,'result=',answer
end program test