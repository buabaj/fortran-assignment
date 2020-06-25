PROGRAM SCISA
  IMPLICIT NONE
  REAL,DIMENSION(360)::NORTH,NORTH1,NORTH2
  REAL,DIMENSION(360)::TRANS,TRANS1,TRANS2
  REAL,DIMENSION(360)::FOREST,FOREST1,FOREST2
  REAL::ADD,AVE
  REAL::ADD1,AVE1
  REAL::ADD2,AVE2
  INTEGER::a,b,c,d,e,f
  INTEGER::g,h,i,j,k,l
  INTEGER::g1,h1,i1,j1,k1,l1
  
  INTEGER,DIMENSION(360)::yr,mo,years
  INTEGER,DIMENSION(360)::yr1,mo1,years1
  INTEGER,DIMENSION(360)::yr2,mo2,years2
  OPEN(3,FILE="Data1.txt",STATUS="OLD",ACTION="READ")
  a=1
  DO b=1,360
     READ(3,*,END=9)yr(b),mo(b),NORTH(b)
     a=a+1

  END DO
  9   CONTINUE
  CLOSE(3)

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  OPEN(17,FILE="Data2.txt",STATUS="OLD",ACTION="READ")
  g=1
  DO h=1,360
     READ(17,*,END=10)yr1(h),mo1(h),TRANS(h)
     g=g+1

  END DO
  10   CONTINUE
  CLOSE(17)
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   OPEN(10,FILE="Data3.txt",STATUS="OLD",ACTION="READ")
  g1=1
  DO h1=1,360
     READ(10,*,END=11)yr2(h1),mo2(h1),FOREST(h1)
     g1=g1+1

  END DO
  11   CONTINUE
  CLOSE(10)

   


e=1
DO d=1921,1950
   ADD=0
   AVE=0
   DO c=1,a
      IF(yr(c)==d)THEN
         years(e)=d
         ADD=ADD+NORTH(c)
         AVE=ADD/12
      END IF
   END DO
   NORTH1(e)=ADD
   NORTH2(e)=AVE
   e=e+1
END DO

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
k=1
DO j=1921,1950
   ADD1=0
   AVE1=0
   DO i=1,g
      IF(yr1(i)==j)THEN
         years1(k)=j
         ADD1=ADD1+TRANS(i)
         AVE1=ADD1/12
      END IF
   END DO
   TRANS1=ADD1
   TRANS2(k)=AVE1
   k=k+1
END DO

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

k1=1
DO j1=1921,1950
   ADD2=0
   AVE2=0
   DO i1=1,g1
      IF(yr2(i1)==j1)THEN
         years2(k1)=j1
         ADD2=ADD2+FOREST(i1)
         AVE2=ADD2/12
      END IF
   END DO
   FOREST1=ADD1
   FOREST2(k1)=AVE2
   k1=k1+1
END DO




















OPEN(5,FILE="northern.txt",STATUS="OLD")
DO f=1,30
   WRITE(5,'(I5,2X,F8.2)')years(f),NORTH2(f)
   
END DO
CLOSE(5)

OPEN(9,FILE="transition.txt",STATUS="OLD")
DO l=1,30
   WRITE(9,'(I5,2X,F8.2)')years1(l),TRANS2(l)
   
END DO
CLOSE(9)

OPEN(15,FILE="forest_zone.txt",STATUS="OLD")
DO l1=1,30
   WRITE(15,'(I5,2X,F8.2)')years2(l1),FOREST2(l1)
END DO
CLOSE(15)


END PROGRAM SCISA
