! functions
! Yang Ma @ PITTPACC
! 2/19/2019

program func
implicit none
integer,parameter :: ikind=selected_real_kind(p=15)
real (kind=ikind) :: deg,rads
print *, 'enter an angle in degrees'
read *,deg
write (*,10) 'sin=', sin(rads(deg))
write (*,10) 'tan=', tan(rads(deg))
write (*,10) 'cos=', cos(rads(deg))
10 format (a,f10.8)
end program func

function rads(degrees)
    implicit none
    integer,parameter :: ikind = selected_real_kind(p=15)
    real (kind=ikind) :: pi,degrees,rads
    pi=4.0_ikind*atan(1.0_ikind)
    rads=(degrees*pi)/180.0_ikind
end function rads