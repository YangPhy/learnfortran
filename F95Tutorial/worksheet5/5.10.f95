! Implied do loop to write arrays
! Yang Ma @ PITTPACC
! 2/18/2019

program idla
implicit none
integer :: col,row
real :: a(2,3),b(2,3)

! using do loop
do row =1,2
    do col =1,3
        read *, a(row,col)
        write (*,*) a(row,col)
    end do
end do 

! using implied do loop
do row=1,2
    do col=1,3
        read *, b(row,col)
    end do
end do

do row=1,2
    write (*,10) (b(row,col),col=1,3)
end do
10 format (3f5.1)

end program idla