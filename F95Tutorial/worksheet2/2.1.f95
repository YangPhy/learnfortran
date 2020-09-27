! Write a program which reads in two numbers a and b. Get the program to swap the values around so that the value that was in a is now in b, and print out the result. Hint you need to declare a third variable for intermediate storage of the data. 
! Yang Ma @ PITTPACC
! 2/12/2019

program swap
implicit none
integer :: a,b,c
print *, 'Please enter 2 numbers'
read *, a,b
c=a
a=b
b=c
print*, 'the numbers you input are ', a,b 
end program swap    