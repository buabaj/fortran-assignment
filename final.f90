program test
  implicit none

  integer,dimension(360)::Nyears,Tyears,Fyears,forest_month,yrs,Nmonth,Tmonth
  integer,dimension(360)::Fyrs,Fmonth,transition_month,northen_month,Tyrs,Nyrs
   integer::t,u,v,w,x,y,z
  real::avgN,plusN,avgF,avgT,plusF,plusT
  real,dimension(360)::Nsum,Tsum,Fsum,rainfall_average,rainfall_sum,average,rainfall_transition,Tr_average,No_average

  real,dimension(360)::Fo_average,rainfall_forest,rainfall_northen
  integer::a=1,b=1,c=1,d=1,e=1,f=1,g=1,h=1,i=1
  integer::j,k,l,m,n,o,p,q,r,s,ax,ay,az,av,yy,xy
  
 
  
  ax=1
  ay=1
  az=1
  av=1
  yy=1
  xy=1
  j=1
  k=1
  l=1
  m=1
  n=1
  o=1
  p=1
  q=1
  r=1
  s=1
  t=1
  u=1
  v=1
  w=1
  x=1
  y=1
  z=1



  !accessing the files Data1.txt,Data2.txt and Data3.txt

  !calling northen data
  open(24,file="Data1.txt",status="OLD",action="READ")
  
  Do x=1,360
  Read(24,*)Nyrs(x),northen_month(x),rainfall_northen(x)
  u=u+1

  End do
 
  close(24)



  
  !CALCULATING FOR THE AVERAGES OF THE RAINFALL
  
!AVERAGES FOR NORTHERN
do w=1,12
 plusN=0
 avgN=0
 do e=1,u
  if(northen_month(e)==w)then
   Nyears(f)=w
   plusN=plusN+rainfall_northen(e)
   avgN=plusN/30
   End if
   End Do
   Nsum(f)=plusN
   No_average(f)=avgN
   f=f+1
End do

  OPEN(23,file="Data2.txt",Status="OLD",action="Read")
  
  Do g=1,360
   Read(23,*)Tyrs(g),transition_month(g),rainfall_transition(g)
   s=s+1

  end do

  close(23)





  
  
!AVERAGES FOR TrANSITIOn

do c=1,12
   plusT=0
   AvgT=0
   do m=1,s
   IF(transition_month(m).eq.c)then
   Tyears(n)=c
   plusT=plusT+rainfall_transition(m)
   avgT=plusT/30
  End if
  End do
  Tsum=plusT
  Tr_average(n)=avgT
  n=n+1
End do


!ACCeSSING THE FILE Data3.txt
  open(22,File="Data3.txt",status="old",action="READ")
  o=1
  do q=1,360
  Read(22,*)Fyrs(q),forest_month(q),rainfall_forest(q)
  o=o+1

  End do
  close(22)


  
   

!SOLVING FOR THE AVERAGE
do z=1,12
 plusF=0
 avgF=0
 do d=1,o
 IF(forest_month(d)==z)Then
  Fyears(t)=z
   plusF=plusF+rainfall_forest(d)
   avgF=plusF/30
   End if
   End DO
   Fsum=plusF
   Fo_average(t)=avgF
   t=t+1
End do


 
































!writing output into the various files

open(12,file="Northern_Rainfall.txt")
do k=1,12
 write(12,'(F9.2)')No_average(k)
 
End do
close(12)


open(20,file="Transition_rainfall.txt",status="new")
do j=1,12
write(20,'(F9.2)')Tr_average(j)
  
End do
close(20)

open(29,file="Forsest_rainfall.txt",status="new")
do y=1,12
write(29,'(F9.2)')Fo_average(y)
End do
Close(29)

  
end program test
