! Arguments to subroutines, practice: calculate the area of triangles
! Yang Ma @ PITTPACC
! 2/19/2019

program trangarea
implicit none
real :: a,b,c,s
do 
    print *, 'please enter the three sides a, b and c of the triangle'
    read *, a,b,c
    call area(a,b,c,s)
    write (*,1) 'the area of this triangle is ', s
    1 format(a,f5.3)
    call prompt ()
end do 
end program trangarea

subroutine prompt
    implicit none
    character :: order*1
    print *, 'type y to continue or any other key to finish'
    read *, order
    if (order /= 'Y' .and. order /= 'y') stop
end subroutine

subroutine area (a,b,c,s)
    implicit none
    real :: a,b,c,s,p
    p=(a+b+c)/2
    s=sqrt(p*(p-a)*(p-b)*(p-c))
end subroutine

