! use of integer  and character variables
! Yang Ma @ PITTPACC
! 2/12/2019

program convert
implicit none
integer :: bucks,cent,total
character :: name*10
print *,'What is your name?'
read *,name 
print *, 'Hi,', name,'! Enter number of bucks and cents'
read *, bucks,cent
total=100*bucks+cent
print *, 'the total money in cent is ',total 
end program convert