
!Program main name
PROGRAM assignment

  !implicit none is for safe programs
   IMPLICIT NONE

   !<******Declaration Section******>

   !N stand for Northen ,T stands for Transition ,F stands for Forest, therefore if Frain it means Forest Rainfall,Tsum means Transition rainfall Sumation


   !General variables
   REAL,DIMENSION(360)::year
   INTEGER,DIMENSION(360)::years
   CHARACTER(LEN=7)::time="Years"
   CHARACTER(LEN=30)::rainfall

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



   !<Writing the output into a different file> 

   !creating a new file to write in the values


   OPEN(13,file="northern_zone.csv",status="new")
   !rainfall="Northen Rainfall Average"
   
  ! WRITE(13,'(2A20)')time,rainfall
   DO f=1,30,1
   WRITE(13,'(I4,7X,F9.2)')years(f),Nrain_average(f)
   END DO
   CLOSE(13)





    
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


   !<Writing the output into a different file> 

   !creating a new file to write in the values

   OPEN(14,FILE="transition_zone.csv",STATUS="new")
   !rainfall="Transition Rainfall Average"
    !WRITE(14,'(2A20)')time,rainfall
   DO z=1,30,1
   WRITE(14,'(I5,2X,F9.2)')years(z),Train_average(z)
   
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





   !<Writing the output into a different file> 

   !creating a new file to write in the values
   OPEN(15,file="forest_zone.csv",status="new")
   !rainfall="Forest Rainfall Average"
    !WRITE(15,'(2A30)')time,rainfall
   DO t=1,30,1 
   WRITE(15,'(I6,2X,F9.2)')years(t),Frain_average(t)
   END DO
   CLOSE(15)






END PROGRAM assignment
