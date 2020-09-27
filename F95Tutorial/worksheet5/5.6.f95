! Multi dimensional arrys
! Yang Ma @ PITTPACC
! 2/18/2019

program twodra
implicit none
integer,dimension(2,3) :: a
integer :: row,col,count
count =0

! create an array with 3 cols and 2 rows
! set col 1 to 1, col 2 to 2 and col 3 to 3
do row=1,2
    count =0
    do col =1,3
        count =count +1
        a(row,col)=count
    end do
end do

do row=1,2
    do col =1,3
        print *, a(row,col)
    end do
end do
end program twodra