PROGRAM ANNOR
  IMPLICIT NONE
  REAL,DIMENSION(360)::NOR,NORHX,NORHM
  REAL,DIMENSION(360)::TRA,TRAHX,TRAHM
  REAL,DIMENSION(360)::FOR,FORHX,FORHM
  REAL::ADD,AVERAGE,ADD1,AVERAGE1,AVERAGE2,ADD2
  INTEGER::al,i,c,z,k,h
  INTEGER::bl,g,cz,y,cl
  INTEGER::dl,f,dz,u,x
  INTEGER,DIMENSION(360)::yr,years
  INTEGER,DIMENSION(360)::yr1,years1
  INTEGER,DIMENSION(360)::yr2,years2
  !!!!!!!!!!!!!!!!!!!!!!SEASONALITY INDEX FOR NORTHERN!!!!!!!!!!!!!!!!!!!!!!!!
  OPEN(44,FILE="Data1a.txt",STATUS="old",ACTION="READ")
  
  al=1
  DO i=1,360
     READ(44,*,END=10)yr(i),NOR(i)
    
     al=al+1

  END DO
  10   CONTINUE
  CLOSE(44)
 

  



  
k=1
DO z=1921,1950
   ADD=0
   AVERAGE=0
   DO c=1,al
      IF(yr(c)==z)THEN
         years(k)=z
         ADD=ADD+NOR(c)
         
        
         
         
         AVERAGE=ADD
         
      END IF
   END DO
   NORHX(k)=ADD
   NORHM(k)=AVERAGE
   k=k+1
   
END DO
      



OPEN(58,FILE="north.txt",STATUS="old")
DO h=1,30
   WRITE(58,'(I5,2X,F8.2)')years(h),NORHM(h)
END DO
CLOSE(58)

!!!!!!!!!!!!!!!!!SEASONALITY INDEX FOR TRANSITION!!!!!!!!!!!!!!!!!!!!!!!!!!!




OPEN(56,FILE="Data2a.txt",STATUS="old",ACTION="READ")
  
  bl=1
  DO g=1,360
     READ(56,*,END=15)yr1(g),TRA(g)
    
     bl=bl+1

  END DO
  15   CONTINUE
  CLOSE(56)
 

  



  
cl=1
DO y=1921,1950
   ADD1=0
   AVERAGE1=0
   DO cz=1,bl
      IF(yr1(cz)==y)THEN
         years1(cl)=y
         ADD1=ADD1+TRA(cz)
        
         
         
         AVERAGE1=ADD1
         
      END IF
   END DO
   TRAHX(cl)=ADD1
   TRAHM(cl)=AVERAGE1
   cl=cl+1
   
END DO
      



OPEN(31,FILE="trans.txt",STATUS="old")
DO h=1,30
   WRITE(31,'(I5,2X,F8.2)')years1(h),TRAHM(h)
END DO
CLOSE(31)

!!!!!!!!!!!!!SEASONALITY INDEX FOR FOREST_ZONE!!!!!!!!!!!!!!!!!!!!!!!!!!
   
OPEN(66,FILE="Data3a.txt",STATUS="old",ACTION="READ")
  
  dl=1
  DO f=1,360
     READ(66,*,END=16)yr2(f),FOR(f)
    
     dl=dl+1

  END DO
  16   CONTINUE
  CLOSE(66)
 

  



  
x=1
DO u=1921,1950
   ADD2=0
   AVERAGE2=0
   DO dz=1,dl
      IF(yr2(dz)==u)THEN
         years2(x)=u
         ADD2=ADD2+FOR(dz)
        
         
         
         AVERAGE2=ADD2
         
      END IF
   END DO
   FORHX(x)=ADD2
   FORHM(x)=AVERAGE2
   x=x+1
   
END DO
      



OPEN(31,FILE="forest.txt",STATUS="old")
DO h=1,30
   WRITE(31,'(I5,2X,F8.2)')years2(h),FORHM(h)
END DO
CLOSE(31)


END PROGRAM ANNOR
