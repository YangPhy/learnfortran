! Implied do loop to write arrays
! Yang Ma @ PITTPACC
! 2/18/2019

program identity
implicit none
integer,parameter :: rank=4
integer :: row,col
real :: a(rank, rank)

do row=1,rank
    do col=1,rank
        a(row,col)=0
    end do
end do

do row=1,rank
    a(row,row)=1
end do

do row=1,rank
    write(*,1) (a(row,col),col=1,rank)
end do

1 format (4 f5.1)


end program identity