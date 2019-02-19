! Array, exercise
! Yang Ma @ PITTPACC
! 2/18/2019

program sumalloc
implicit none
integer :: imax,i,sum
integer, allocatable, dimension(:) :: a,b



print *, 'please enter the number of elememts'
read *, imax
allocate (a(imax))
allocate (b(imax))

print *, 'you decide to enter ', imax, 'elements'
print *, 'please enter the elements'
do i=1,imax
    read *, a(i)
    b(i)=a(i)
end do

do i=1,imax
    print *, a(i)
end do 

do i=1,imax
    print *, b(i)
end do 

do i=1,imax
    sum=sum+a(i)
end do
print *, 'sum of a is ', sum

sum =0
do i=1,imax
    sum=sum+b(i)
end do
print *, 'sum of b is ', sum

end program sumalloc



! program sumalloc
! implicit none
! real, allocatable      ::a(:),b(:)
! integer                 ::imax,i



! print *, 'How many numbers?'
! read  *, imax
! allocate(a(imax),b(imax))

! print *, 'now enter ',imax,' numbers for the first array'

! do i=1,imax                     
!     read *,a(i)          
! end do

! print *, 'now enter ',imax,' numbers for the second array'

! do i=1,imax                     
!     read *,b(i)          
! end do

! print *,'first    second     (first+second)'
! do i=1,imax
!     print *, a(i),b(i),a(i)+b(i)
! end do    



! deallocate(a,b)  
! end program sumalloc