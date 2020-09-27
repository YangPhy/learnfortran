! An example of arithmetic 
! Yang Ma @ PITTPACC
! 2/12/2019

program calculate
implicit none
real::x,y,z,result
x=1.5
y=2.5
z=3.5
result=x**y**z
print *,'result is',result
end program calculate