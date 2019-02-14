! Writting to files: Write a program which reads in numbers from a file one at a time. If the number is positive, it should  store it in a file called 'positive.out' and negative numbers in a file called 'negative.out'.
! Yang Ma @ PITTPACC
! 2/13/2019

program pn
implicit none
integer :: num,i
open (10,file='num')
open (12,file='positive.out')
open (13,file='negative.out')
do i=1,27
    read (10,*)num 
    if (num>0) then
        write (12,*) num
    else
        write (13,*) num
    end if
end do
end program pn