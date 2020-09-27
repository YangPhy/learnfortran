! Use Notepad to create a  file called evenodd.txt. In the file type 10 numbers, one per line. Write a program that reads data from evenodd.txt one line at a time. Check if each number is even or odd and print out a suitable message. 
! Yang Ma @ PITTPACC
! 2/13/2019

program evenodd
implicit none
integer :: i,x
open(10,file='evenodd')
do i=1,10
    read (10,*) x
    if (mod(x,2)>0) then
        print *, x, 'is odd'
    else
        print *, x, 'is even'
    end if
end do
end program evenodd