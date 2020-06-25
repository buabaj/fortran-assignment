
!Program main name
PROGRAM FELIX
  !implicit none is for safe programs
   IMPLICIT NONE

   !<******Declaration Section******>

   !N stand for Northen ,T stands for Transition ,F stands for Forest,
   !therefore if Frain it means Forest Rainfall,Tsum means Transition rainfall Sumation


   !General variables
   REAL,DIMENSION(360)::year,month
   INTEGER,DIMENSION(360)::years
  

   ! declaring variables that will be used for Northern Zone
   
   REAL,DIMENSION(360)::Nrain,Nrain_sum,Nrain_average
   REAL::Nsum,Naverage
   INTEGER::a=1,b=1,c=1,d=1,e=1,f=1            !for the loops and count variables
   INTEGER,DIMENSION(360)::Nyears,Nmonth,Nyear


   
   !declaring variables that will be used for transion zone
   
   REAL,DIMENSION(360)::Train,Train_sum,Train_average
   REAL::Tsum,Taverage
   INTEGER::u=1,v=1,w=1,x=1,y=1,z=1                                     !for the loops and count variables
   INTEGER,DIMENSION(360)::Tyear,Tmonth,Tyears1
   


   !declaring varia bles that will be used for transion zone
   REAL,DIMENSION(360)::Frain,Frain_sum,Frain_average
   REAL::Fsum,Faverage
   INTEGER::  q=1,r=1,t=1,m=1,o=1,i=1              !for the loop and count
   INTEGER,DIMENSION(360)::Fyear,Fmonth,Fyears

  !<****End of Declaration Section*****>
  
  
 
 
   
   !<***Execution Section******>

   !< For Northen Zone>
  
 ! importing the  first dataset ,"Data1.txt" from an external sources into our code , that is for Northen zone
  
   OPEN(10,file="Data1.txt",status="old",action="read")

   !A Do loop to read the Northen zone dataset
    Do b=1,360
    READ(10,*,end=100)year(b),Nmonth(b),Nrain(b)
       
    !for the count
    a=a+1

    END Do !to close the loop
    100   CONTINUE
    CLOSE(10)

!A do statement for calculating montly values
   DO d=1,12,1
    Naverage=0
    Nsum=0
   DO c=1,a
    IF(Nmonth(c).eq.d)THEN
     years(e)=d
      Nsum=Nsum+Nrain(c)
      Naverage=Nsum/30
      END IF
   END DO
   Nrain_sum(e)=Nsum
   Nrain_average(e)=Naverage
   e=e+1
   END DO



   !<Writing the output into a different file> 

   !creating a new file to write in the values


   OPEN(13,file="northern_zone.csv",status="new")
   OPEN(99,file="month.csv",status="new")
  
   DO f=1,12,1
      WRITE(13,'(F9.2)')Nrain_average(f)
      WRITE(99,'(I3)')Nmonth(f)
   END DO
   CLOSE(13)
   CLOSE(99)





    
   !<For Transition Zone>

   ! importing the  second dataset ,"Data2.txt" from an external sources into our code , that is for  Transition zone
    OPEN(11,file="Data2.txt",status="old",action="read")

    !A Do loop to read the Transition zone dataset
    DO v=1,360,1
    READ(11,*)year(v),Tmonth(v),Train(v)
       
    !for the count  
    u=u+1

    END Do  !to close the loop
   
    200  CONTINUE
    CLOSE(11)  !close opened file

   DO x=1,12,1
   Tsum=0
   Taverage=0
   DO w=1,u,1
     IF(Tmonth(w).eq.x)THEN
      years(y)=x
       Tsum=Tsum+Train(w)
       Taverage=Tsum/30
      END IF
   END DO
   Train_sum=Tsum
   Train_average(y)=Taverage
   y=y+1
   END DO


   !<Writing the output into a different file> 

   !creating a new file to write in the values

   OPEN(14,FILE="transition_zone.csv",STATUS="new")

   
   DO z=1,12,1
   WRITE(14,'(F9.2)')Train_average(z)
   
   END DO
   CLOSE(14)

    


 !<For Forest Zone>

    ! importing the  third dataset ,"Data3.txt" from an external sources into our code , that is for  Forest zone
    OPEN(12,file="Data3.txt",status="old",action="read")
    
    
    DO t=1,360,1
    READ(12,*,end=300)year(t),Fmonth(t),Frain(t)
     !for the count
     m=m+1

    END DO    !End loop
    300   CONTINUE
    CLOSE(12)  !close opened file

    DO i=1,12,1
     Faverage=0
     Fsum=0
    DO q=1,m
      IF(Fmonth(q).eq.i)THEN
         years(o)=i
         Fsum=Fsum+Frain(q)
         Faverage=Fsum/30
      END IF
   END DO
   Frain_sum(o)=Fsum
   Frain_average(o)=Faverage
   o=o+1
   END DO





   !<Writing the output into a different file> 

   !creating a new file to write in the values
   OPEN(15,file="forest_zone.csv",status="new")
   
   
   DO t=1,12,1 
   WRITE(15,'(F9.2)')Frain_average(t)
   END DO
   CLOSE(15)






END PROGRAM FELIX
