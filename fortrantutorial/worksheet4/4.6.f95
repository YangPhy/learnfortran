! Extending the precision of constants
! Yang Ma @ PITTPACC
! 2/14/2019

program extendedconstants
implicit none
integer, parameter :: ikind=selected_real_kind (p=18)
real (kind=ikind) :: val,x,y
! val=10/3                                                      ! wrong: 10/3 is integer
x=10.0
y=3.0
val=x/y
print *, val
val = 10.0_ikind/3                                              ! rignt: extend prcision constant
print *,val
val =10.0/3.0                                                   ! wrong: real constants
print *,val
val =.1234567890                                                ! wrong: real constants
print *,val
val =.12345678901234567890_ikind                                ! right: extend precision consts
print *,val
end program extendedconstants
