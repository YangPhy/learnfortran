! functions
! Write a program that includes a function called
! real function average(n,list)
! where n is integer and is the number of items in the list, and list is a real array.
! Write suitable code for reading the numbers from a file (or keyboard), and output the average of the numbers.
! Yang Ma @ PITTPACC
! 2/19/2019

program func1
implicit none
integer :: n,imax
real :: average
real, allocatable, dimension(:) :: list
allocate (list(n))
n=imax()
print *, 'you want to calculate the number of ',n,'numbers'
call inputlist(n,list)
print *, 'the average is',average(n,list)
end program func1

function imax()
    implicit none
    integer :: imax
    print *, 'how many numbers ?'
    read *, imax
end function

function average(n,list)
    implicit none
    integer :: i,n
    real :: sum,average
    real :: list(n)
    sum=0
    do i=1,n
        sum=list(i)+sum
    end do
    average=sum/n
end function average

subroutine inputlist(n,list)
    implicit none
    integer :: n,i
    real :: list(n)
    print *, 'please input the numbers'
    do i=1,n
       read *, list(i)
    end do
    ! write(*,*) (list(i),i=1,n)
end subroutine inputlist
