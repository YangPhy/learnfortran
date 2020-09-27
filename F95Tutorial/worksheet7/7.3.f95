! Write a program that will read a 3 X 3 matrix from a data file. In the program, include a subroutine that will generate any cofactor cof of the matrix mat. Call the subroutine cofactor and use these arguments:

!   	subroutine cofactor(i,j,mat,cof)
!   	implicit none
!   	real :: mat(3,3),minor(2,2),cof
!   	integer :: elrow,elcol
!   	! cof – the cofactor of matrix mat for element i,j
!   	.
!   	.
! Use this cofactor to calculat the determinant of the matrix
! Yang Ma @ PITTPACC
! 2/19/2019

program det
implicit none
integer,parameter :: size=3
integer :: i,j
real,dimension(size,size) :: a
real :: adet,acof
print *, 'read the matrix from the file and then calculate the cofactor'
call matread(size,a)
print *, 'the matrix is'
print *, '_______________________________________________________________'
call matoutput(size,a)
print *, '_______________________________________________________________'

! call cofactor(1,1,a,acof) and calculate the determinant
i=1
adet=0
do j=1,size
    call cofactor(1,j,a,acof)
    adet=adet+acof*a(1,j)
end do

print *, 'the determinant is',adet
end program det


subroutine matread(size,ra)
    implicit none
    integer :: size,row
    real, dimension(size,size) :: ra
    real :: num1,num2,num3
    open (10,file='matrix')
    do row=1,size
        read (10,*) num1,num2,num3
        ra(row,1)=num1
        ra(row,2)=num2
        ra(row,3)=num3
    end do
end subroutine matread

subroutine matoutput(size,ra)
    implicit none
    integer :: size,row,col
    real,dimension(size,size)::ra
    do row =1,size
        write (*,10) (ra(row,col),col=1,size)
    end do
    10 format (100f10.2)
end subroutine matoutput

subroutine cofactor(i,j,mat,cof)
    implicit none
    real ::mat(3,3),minor(2,2),cof
    integer :: i,j,row,col,rowm,colm
    ! cof- the cofactor fo matrix mat for element i,j
    rowm=0
    do row=1,3
        colm=0
        if (row/=i) then
            rowm=rowm+1
            do col =1,3
                if (col/=j) then
                    colm=colm+1
                    minor(rowm,colm)=mat(row,col)
                end if
            end do
        end if
    end do
    cof = ((-1)**(i+j))*(minor(1,1)*minor(2,2)-minor(1,2)*minor(2,1))
end subroutine cofactor

                    
