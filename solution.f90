
PROGRAM assignment
   IMPLICIT NONE

   REAL,DIMENSION(360)::year, Nrain,Nrain_sum,Nrain_average,Train,Train_sum,Train_average,Frain,Frain_sum,Frain_average
   INTEGER,DIMENSION(360)::years, Nyears,Nmonth,Nyear, Tyear,Tmonth,Tyears1,Fyear,Fmonth,Fyears
   REAL::Nsum,Naverage, Tsum,Taverage,Fsum,Faverage

   INTEGER::a=1,b=1,c=1,d=1,e=1,f=1,u=1,v=1,w=1,x=1,y=1,z=1,q=1,r=1,t=1,m=1,o=1,i=1   
   OPEN(10,file="Data1.txt",status="old",action="read")
    Do b=1,360
    READ(10,*,end=100)year(b),Nmonth(b),Nrain(b)
    a=a+1
    END Do 
    100   CONTINUE
    CLOSE(10)
   DO d=1921,1950,1
    Naverage=0
    Nsum=0
   DO c=1,a
      IF(year(c)==d)THEN
         years(e)=d
         Nsum=Nsum+Nrain(c)
         Naverage=Nsum/12
      END IF
   END DO
   Nrain_sum(e)=Nsum
   Nrain_average(e)=Naverage
   e=e+1
   END DO
   OPEN(13,file="Nzone_data.csv",status="new")    
   DO f=1,30,1
   WRITE(13),years(f),Nrain_average(f)
   END DO
   CLOSE(13)
   OPEN(11,file="Data2.txt",status="old",action="read")
    DO v=1,360,1
    READ(11,*)year(v),Tmonth(v),Train(v)  
    u=u+1
    END Do   
    200  CONTINUE
    CLOSE(11)
   DO x=1921,1950,1
   Tsum=0
   Taverage=0
   DO w=1,u,1
      IF(year(w)==x)THEN
         years(y)=x
         Tsum=Tsum+Train(w)
         Taverage=Tsum/12
      END IF
   END DO
   Train_sum=Tsum
   Train_average(y)=Taverage
   y=y+1
   END DO
   OPEN(14,FILE="Tzone_data.csv",STATUS="new")
   DO z=1,30,1
   WRITE(14,*)years(z),Train_average(z)
   END DO
   CLOSE(14)    
    OPEN(12,file="Data3.txt",status="old",action="read")    
    DO t=1,360,1
    READ(12,*,end=300)year(t),Fmonth(t),Frain(t)
     m=m+1
    END DO
    300   CONTINUE
    CLOSE(12)
    DO i=1921,1950,1
     Faverage=0
     Fsum=0
    DO q=1,m
      IF(year(q)==i)THEN
         years(o)=i
         Fsum=Fsum+Frain(q)
         Faverage=Fsum/12
      END IF
   END DO
   Frain_sum(o)=Fsum
   Frain_average(o)=Faverage
   o=o+1
   END DO
   OPEN(15,file="Fzone_data.csv",status="new")
   DO t=1,30,1 
   WRITE(15,*)years(t),Frain_average(t)
   END DO
   CLOSE(15)
END PROGRAM assignment
