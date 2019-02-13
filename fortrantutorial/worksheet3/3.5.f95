! Nested do loops
! Yang Ma @ PITTPACC
! 2/13/2019

program xytab
implicit none
real :: x,y,z
print *, '    x    y    z'
do x=1,2
    do y = 1,4,0.5
        z=x/y 
        print *, x,y,z
    end do
end do 
end program xytab