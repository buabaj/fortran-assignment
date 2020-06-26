program a
  implicit none

    integer,dimension(360)::North_year,Trans_year,Forest_year,forest_month,yrs
    integer,dimension(360)::Fyrs,Trans_month,North_month,Tyrs,Nyrs   
    real,dimension(360)::North_sum,Trans_sum,Forest_sum,avg,Trans_rainfall,North_avg
    real,dimension(360)::Forest_avg,Forest_rainfall,North_rainfall, Trans_avg
    real::meanN,sumN,meanF,meanT,sumF,sumT
    integer:: b=1,c=1,d=1,e=1,f=1,g=1,h=1,i=1
    integer::j,k,l,m,n,o,p,q,r,s  
    integer::t,u,v,w,x,y,z
  
 
  open(24,file="Data1.txt",status="OLD",action="READ")
  
  Do x=1,360
  Read(24,*)Nyrs(x),North_month(x),North_rainfall(x)
  u=u+1

  End do
 
  close(24)

do w=1,12
 sumN=0
 meanN=0
 do e=1,u
  if(North_month(e)==w)then
   North_year(f)=w
   sumN=sumN+North_rainfall(e)
   meanN=sumN/30
   End if
   End Do
   North_sum(f)=sumN
   North_avg(f)=meanN
   f=f+1
End do

  OPEN(23,file="Data2.txt",Status="OLD",action="Read")
  
  Do g=1,360
   Read(23,*)Tyrs(g),Trans_month(g),Trans_rainfall(g)
   s=s+1

  end do

  close(23)

do c=1,12
   sumT=0
   meanT=0
   do m=1,s
   IF(Trans_month(m).eq.c)then
   Trans_year(n)=c
   sumT=sumT+Trans_rainfall(m)
   meanT=sumT/30
  End if
  End do
  Trans_sum(n)=sumT
  Trans_avg(n)=meanT
  n=n+1
End do


  open(22,File="Data3.txt",status="old",action="READ")
  o=1
  do q=1,360
  Read(22,*)Fyrs(q),forest_month(q),Forest_rainfall(q)
  o=o+1

  End do
  close(22)

do z=1,12
 sumF=0
 meanF=0
 do d=1,o
 IF(forest_month(d)==z)Then
  Forest_year(t)=z
   sumF=sumF+Forest_rainfall(d)
   meanF=sumF/30
   End if
   End DO
   Forest_sum(t)=sumF
   Forest_avg(t)=meanF
   t=t+1
End do


open(12,file="Northern_Rainfall.csv", status='new')
do k=1,12
 write(12,*)North_avg(k)
 
End do
close(12)


open(20,file="Transition_rainfall.csv",status="new")
do j=1,12
write(20,*)Trans_avg(j)
  
End do
close(20)

open(29,file="Forsest_rainfall.csv",status="new")
do y=1,12
write(29,*)Forest_avg(y)
End do
Close(29)

  
end program a
