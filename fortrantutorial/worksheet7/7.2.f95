! Write a program to read in 2 square matrices (of any size). Confirm that the matrices obey the rule
!    (AB)T     =   BTAT
!    where     AT         is the transpose of matrix A.
! Yang Ma @ PITTPACC
! 2/19/2019

program transcheck
implicit none
integer :: size
real,allocatable,dimension(:,:):: a,b,ab,aT,bT,abT
print *, 'Enter the size of the matrixes'
read *, size
allocate(a(size,size),b(size,size),ab(size,size),aT(size,size),bT(size,size),abT(size,size))
print *, 'enter matrix A'
call matinput(size,a)
print *, 'enter matrix B'
call matinput(size,b)
print *, 'A is'
call matoutput(size,a)
print *, 'B is'
call matoutput(size,b)

ab=matmul(a,b)
print *, 'AB is'
call matoutput(size,ab)

print *, 'Compare (AB)T with BTAT'
aT=transpose(a)
bT=transpose(b)
abT=transpose(ab)
print *,'(AB)T is'
call matoutput(size,abT)
print *,'BTAT is'
call matoutput(size,matmul(bT,aT))
print *, 'the difference is ', matmul(bT,aT)-abT

end program transcheck


subroutine matinput(size,ra)
    implicit none
    integer :: size,row,col
    real, dimension(size,size) :: ra
    real :: num
    do row=1,size
        do col=1,size
            print *, '_______________________________________'
            print *, row, col
            read *, num
            ra(row,col)=num
        end do
    end do
end subroutine matinput


subroutine matoutput(size,ra)
    implicit none
    integer :: size,row,col
    real,dimension(size,size)::ra
    do row =1,size
        write (*,10) (ra(row,col),col=1,size)
    end do
    10 format (100f10.2)
end subroutine matoutput
