program seasonality_index

implicit none

real,dimension(360):: SI_1,rn_val1,R_i1,X_in1,XR1,SI_2,rn_val2,R_i2,x_in2,XR2,SI_3,rn_val3,R_i3,x_in3,XR3
integer,dimension(360):: y1,m1,y_n1,m_n1,y2,m2,y_n2,m_n2,y3,m3,y_n3,m_n3
integer::i,a,c,r,ik,y,m,b,t,yr,ii,aa,cc,rr,ikk,yy,mm,bb,tt,yrr,iii,aaa,ccc,rrr,ikkk,yyy,mmm,bbb,ttt,yrrr
real:: sum_1,sum_2,ab1,sum_11,sum_22,ab2,sum_111,sum_222,ab3

!READING DATA1

open(1, file="Data1.txt",status="Old")
open(2, file="Data2.txt",status="Old")
open(3, file="Data3.txt",status="Old")

open (4, file="seasonality_index_DATA1.csv" , status="new")
open (5, file="seasonality_index_DATA2.csv" , status="new")
open (6, file="seasonality_index_DATA3.csv" , status="new")


ik=1
do i=1,360
read(1,*)y1(i),m1(i),rn_val1(i)
ik=ik+1
end do
100 continue

close(1)


!finding the seasonal index

a=1
do y=1921,1950

sum_1=0
do c=1,ik
   if (y1(c)==y) then
        y_n1(a)=y
      sum_1=sum_1+rn_val1(c)
  end if
end do
R_i1(a)=sum_1

a=a+1
end do


b=1
do yr=1921,1950
    do m=1,12
        sum_1=0

        do t=1,ik
            if (m1(t)==m) then
        
                m_n1(b)=m
                sum_1=sum_1+rn_val1(t)
            end if
        end do
        X_in1(b)=sum_1
        ab1=X_in1(b)-(R_i1(b)/12)
        sum_2=sum_2+abs(ab1)
        XR1(b)=sum_2
        SI_1(b)= (1/R_i1(b))*(XR1(b))
        b=b+1
    end do
end do

!writing into a new file

do r=1,30
write(4,5)y_n1(r),SI_1(r)
5 format(I6.2, 5X, F12.4)
end do
close(4)

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1

ikk=1
do ii=1,360
read(2,*)y2(ii),m2(ii),rn_val2(ii)
ikk=ikk+1
end do
200 continue

close(2)


!finding the seasonal index

aa=1
do yy=1921,1950

sum_11=0
do cc=1,ikk
   if (y2(cc)==yy) then
        y_n2(aa)=yy
      sum_11=sum_11+rn_val2(cc)
  end if
end do
R_i2(aa)=sum_11

aa=aa+1
end do


bb=1
do yrr=1921,1950
    do mm=1,12
        sum_11=0

        do tt=1,ikk
            if (m2(tt)==mm) then
        
                m_n2(bb)=mm
                sum_11=sum_11+rn_val2(tt)
            end if
        end do
        x_in2(bb)=sum_11
        ab2=x_in2(bb)-(R_i2(bb)/12)
        sum_22=sum_22+abs(ab2)
        XR2(bb)=sum_22
        SI_2(bb)= (1/R_i2(bb))*(XR2(bb))
        bb=bb+1
    end do
end do

!writing into a new file

do rr=1,30
write(5,6)y_n2(rr),SI_2(rr)
6 format(I6.2, 5X, F12.4)
end do
close(5)

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1

ikkk=1
do iii=1,360
read(3,*)y3(iii),m3(iii),rn_val3(iii)
ikkk=ikkk+1
end do
300 continue

close(3)


!finding the seasonal index

aaa=1
do yyy=1921,1950

sum_111=0
do ccc=1,ikkk
   if (y3(ccc)==yyy) then
        y_n3(aaa)=yyy
      sum_111=sum_111+rn_val3(ccc)
  end if
end do
R_i3(aaa)=sum_111

aaa=aaa+1
end do


bbb=1
do yrrr=1921,1950
    do mmm=1,12
        sum_111=0

        do ttt=1,ikkk
            if (m3(ttt)==mmm) then
        
                m_n3(bbb)=mmm
                sum_111=sum_111+rn_val3(ttt)
            end if
        end do
        x_in3(bbb)=sum_111
        ab3=x_in3(bbb)-(R_i3(bbb)/12)
        sum_222=sum_222+abs(ab3)
        XR3(bbb)=sum_222
        SI_3(bbb)= (1/R_i3(bbb))*(XR3(bbb))
        bbb=bbb+1
    end do
end do

!writing into a new file

do rrr=1,30
write(6,7)y_n3(rrr),SI_3(rrr)
7 format(I6.2, 5X, F12.4)
end do
close(6)


end program seasonality_index
