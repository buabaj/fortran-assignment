program assignment_1
  implicit none

    integer,dimension(360)::N_year,T_year,F_year,F_month,yrs
    integer,dimension(360)::Fyrs,T_month,N_month,Tyrs,Nyrs  
    integer:: t,u,v,w,x,y,z,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s 
    real,dimension(360)::N_sum,T_sum,F_sum,avg,T_rainfall,N_avg
    real,dimension(360)::F_avg,F_rainfall,N_rainfall, T_avg
    real::avg_N,add_N,avg_F,avg_T,add_F,add_T
    
    
  
 
  open(24,file="Data1.txt",status="OLD",action="read")
  
  Do x=1,360
  Read(24,*)Nyrs(x),N_month(x),N_rainfall(x)
  u=u+1

  End do
 
  close(24)

do w=1,12
 add_N=0
 avg_N=0
 do e=1,u
  if(N_month(e)==w)then
   N_year(f)=w
   add_N=add_N+N_rainfall(e)
   avg_N=add_N/30
   End if
   End Do
   N_sum(f)=add_N
   N_avg(f)=avg_N
   f=f+1
End do
open(12,file="North.csv", status='new')
do k=1,12
 write(12,*)N_avg(k)
 
End do
close(12)

  OPEN(23,file="Data2.txt",Status="OLD",action="Read")
  
  Do g=1,360
   Read(23,*)Tyrs(g),T_month(g),T_rainfall(g)
   s=s+1

  end do

  close(23)

do c=1,12
   add_T=0
   avg_T=0
   do m=1,s
   IF(T_month(m).eq.c)then
   T_year(n)=c
   add_T=add_T+T_rainfall(m)
   avg_T=add_T/30
  End if
  End do
  T_sum(n)=add_T
  T_avg(n)=avg_T
  n=n+1
End do
open(20,file="Trans.csv",status="new")
do j=1,12
write(20,*)T_avg(j)
  
End do
close(20)


  open(22,File="Data3.txt",status="old",action="READ")
  o=1
  do q=1,360
  Read(22,*)Fyrs(q),F_month(q),F_rainfall(q)
  o=o+1

  End do
  close(22)

do z=1,12
 add_F=0
 avg_F=0
 do d=1,o
 IF(F_month(d)==z)Then
  F_year(t)=z
   add_F=add_F+F_rainfall(d)
   avg_F=add_F/30
   End if
   End DO
   F_sum(t)=add_F
   F_avg(t)=avg_F
   t=t+1
End do

open(29,file="Forest.csv",status="new")
do y=1,12
write(29,*)F_avg(y)
End do
Close(29)

  
end program assignment_1
