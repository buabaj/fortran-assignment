program OHENEBA

implicit none

real,dimension(360):: SI,rainvalues,R,Xn,X_R
integer,dimension(360):: yyyy,mm,yn,mn
integer::i,j,k,l,ic,y,m,u,p,yy
real:: sum1,sum2

!READING DATA1


open(13, file="Data1.txt",status="Old")
ic=1
do i=1,360
read(13,*)yyyy(i),mm(i),rainvalues(i)
ic=ic+1
end do
50 continue

close(13)


!finding the seasonal index

j=1
do y=1921,1950

sum1=0
do k=1,ic
   if (yyyy(k)==y) then
        yn(j)=y
      sum1=sum1+rainvalues(k)
  end if
end do
R(j)=sum1

j=j+1
end do


u=1
do yy=1921,1950
do m=1,12
sum1=0

do p=1,ic
   if (mm(p)==m) then
        
        mn(u)=m
      sum1=sum1+rainvalues(p)
  end if
end do
Xn(u)=sum1
sum2=sum2+abs(Xn(u)-(R(u)/12))
X_R(u)=sum2
SI(u)= (1/R(u))*(X_R(u))
u=u+1
end do
end do

!writing into a new file


open (13, file="OHENEBA_1b_DATA1.csv" , status="new")
do l=1,30
write(13,*)yn(l),SI(l)
end do
close(13)

end program OHENEBA
