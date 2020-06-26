PROGRAM ANNOR
  IMPLICIT NONE
  REAL,DIMENSION(360)::NORTHX,NORTHH,NORTHM
  REAL,DIMENSION(360)::TRANSX,TRANSH,TRANSM
  REAL,DIMENSION(360)::FORESTX,FORESTH,FORESTM
  REAL::NT,SUM,TR,SUM1,FT,SUM2,NORTH,TRANS,FOREST,ADD1,AVERAGE1,GOT
  INTEGER::a,b,c,z,e,h,v,j
  INTEGER::a1,b1,c1,e1,z1
  INTEGER::a2,b2,c2,z2,e2
  INTEGER,DIMENSION(360)::yr,mo,years
  INTEGER,DIMENSION(360)::yr1,mo1,years1
  INTEGER,DIMENSION(360)::yr2,mo2,years2
  !BEFORE SOLVING FOR THE SEASONALITY INDICES,I CALCULATED THE ABSOLUTE VALUES
  !BEFORE SUMMING THEM UP IN THE seasonality.f90 file
  
  !!!!!!!!!!!!ABSOLUTE VALUES FOR NORTHERH!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  OPEN(44,FILE="Data1.txt",STATUS="old",ACTION="READ")
  a=1
  DO b=1,360
     READ(44,*,END=10)yr(b),mo(b),NORTHX(b)
     a=a+1

  END DO
  10   CONTINUE
  CLOSE(44)
  
  e=1
DO z=1921,1950
   NT=0
   SUM=0
   DO c=1,a
      IF(yr(c)==z)THEN
         years(e)=z
        
         NT=NT+NORTHX(c)
         
         
  
         SUM=NT
    
         
      END IF
      
   END DO
   DO j=1,12
      NORTH=(1/SUM)*ABS(NORTHX(j)-SUM/12)
      OPEN(33,FILE="Data1a.txt",STATUS="old")
      WRITE(33,'(I5,2X,F5.2)')years(e),NORTH
      
      
      
   END DO
    
    
   NORTHH(e)=NT
   NORTHM(e)=SUM
   e=e+1
   
   
END DO


!!!!!!!!!!!!!!!!!ABSOLUTE VALUES FOR TRANSITION!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
OPEN(90,FILE="Data2.txt",STATUS="old",ACTION="READ")
  a1=1
  DO b1=1,360
     READ(90,*,END=11)yr1(b1),mo1(b1),TRANSX(b1)
     a1=a1+1

  END DO
  11   CONTINUE
  CLOSE(90)


 e1=1
DO z1=1921,1950
   TR=0
   SUM1=0
   DO c1=1,a1
      IF(yr1(c1)==z1)THEN
         years1(e1)=z1
        
         TR=TR+TRANSX(c1)
         
         
  
         SUM1=TR
    
         
      END IF
      
   END DO
   DO j=1,12
      TRANS=(1/SUM1)*ABS(TRANSX(j)-SUM1/12)
      OPEN(56,FILE="Data2a.txt",STATUS="OLD")
      WRITE(56,'(I5,2X,F5.2)')years1(e1),TRANS
      
      
      
   END DO
    
    
   TRANSH(e1)=TR
   TRANSM(e1)=SUM1
   e1=e1+1
   
   
END DO
!!!!!!!!!!!!!ABSOLUTE VALUES FOR FOREST_ZONE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

 OPEN(95,FILE="Data3.txt",STATUS="old",ACTION="READ")
  a2=1
  DO b2=1,360
     READ(95,*,END=12)yr2(b2),mo2(b2),FORESTX(b2)
     a2=a2+1

  END DO
  12   CONTINUE
  CLOSE(95)


 e2=1
DO z2=1921,1950
   FT=0
   SUM2=0
   DO c2=1,a2
      IF(yr2(c2)==z2)THEN
         years2(e2)=z2
        
         FT=FT+FORESTX(c2)
         
         
  
         SUM2=FT
    
         
      END IF
      
   END DO
   DO j=1,12
      FOREST=(1/SUM2)*ABS(FORESTX(j)-SUM2/12)
      OPEN(66,FILE="Data3a.txt",STATUS="OLD")
      WRITE(66,'(I5,2X,F5.2)')years2(e2),FOREST
      
      
      
   END DO
    
    
   FORESTH(e2)=FT
   FORESTM(e2)=SUM2
   e2=e2+1
   
   
END DO






    

END PROGRAM ANNOR


































