! Multi dimensional arrys, exercise
! Yang Ma @ PITTPACC
! 2/18/2019

program fourd
implicit none
integer :: row, col, i
integer,dimension(4,4) :: mat

do row =1,4
    do col = 1,4
        mat(row,col)=0
    end do
end do

do i=1,4
    mat(i,i)=1
end do

do row =1,4
    do col = 1,4
        print *, mat(row,col)
    end do
end do

end program fourd