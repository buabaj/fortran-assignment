!begin assignment program
program fortran_assignment
    !declare implicit status as none
    implicit none
    !set neccessary variables for assignment
    real, dimension(360) :: year, Nzone_rainfall, Nzone_sum, Nzone_avg,Nzone_SI, Nzone_Ri, Nzone_Xin, NXR
    real, dimension(360) :: Tzone_rainfall, Tzone_sum, Tzone_avg, Tzone_SI, Tzone_Ri, Tzone_Xin,TXR
    real, dimension(360) :: Fzone_rainfall, Fzone_sum, Fzone_avg, Fzone_SI, Fzone_Ri, Fzone_Xin, FXR
    integer, dimension(360) :: y,Nm, Nzone_year, Nzone_month, Nzone_y
    integer, dimension(360) :: Fm,Fzone_year, Fzone_month, Fzone_y
    integer, dimension(360) :: Tm,Tzone_year, Tzone_month, Tzone_y
    real :: sumN, sumNN, absN, sumT, sumTT, absT, sumF, sumFF, absF
    !instanstiate iterators and counters 
    integer :: var1, var2, var3, var4, var5, var6, var7, var8, var9, var21, var22, var23, var24, var25
    integer::  var10, var11, var12, var13, var14, var15, var16, var17, var18, var19, var20
    integer:: var26, var27, var28, var29, var30, var31, var32, var33, var35


    !open first data set and read through values by am iterator
    open(20, file = 'Data1.txt', status='old', action='read')
    do var1 = 1, 360
        read(20, *)year(var1), Nzone_month(var1), Nzone_rainfall(var1)
        var2 = var2 + 1        
    end do
    100 continue
    close(20)

    !calculate logic for finding seasonal index
    var3 = 1
    do var4 = 1921, 1950
        sumN = 0
        do var5 = 1, var2
            if(year(var5) == var4)then
                Nzone_y(var3) = var4
                sumN = sumN + Nzone_rainfall(var5)
            end if            
        end do
        Nzone_rainfall(var3) = sumN
        var3 = var3 + 1        
    end do

    var7 = 1
    do var8 = 1921, 1950
        do var9 = 1, 12
            sumN = 0
                do var11 = 1, var2
                    if(Nzone_month(var11) == var9) then
                        Nm(var7) = var9
                        sumN = sumN + Nzone_rainfall(var11)
                    end if
                end do
                Nzone_Xin(var7) = sumN
                absN = Nzone_Xin(var7) - (Nzone_Ri(var7)/12)
                sumNN = sumNN + abs(absN)
                NXR(var7) = sumNN
                Nzone_SI(var7) = (1/Nzone_rainfall(var7)) * (NXR(var7))
                var7 = var7 + 1             
        end do
        
    end do
    
    !write output values to new file
    open(10, file='N_seasonality.csv', status='new', action='write')
    do var12 = 1, 30
        write(10, '(I6.2, 5X, F12.4)') Nzone_y(var12), Nzone_SI(var12)        
    end do
    close(10)

    open(60, file = 'Data2.txt', status='old', action='read')
    do var13 = 1, 360
        read(60, *)year(var13), Fzone_month(var13), Fzone_rainfall(var13)
        var14 = var14 + 1        
    end do
    200 continue
    close(60)

    !calculate logic for finding seasonal index
    var15 = 1
    do var16 = 1921, 1950
        sumF = 0
        do var17 = 1, var14
            if(year(var17) == var16)then
                Fzone_y(var15) = var16
                sumF = sumF + Fzone_rainfall(var17)
            end if            
        end do
        Fzone_rainfall(var15) = sumF
        var15 = var15 + 1        
    end do

    var18 = 1
    do var19 = 1921, 1950
        do var20 = 1, 12
                sumN = 0
                do var21 = 1, var14
                    if(Fzone_month(var21) == var20) then
                        Fm(var18) = var20
                        sumF = sumF + Fzone_rainfall(var21)
                    end if
                end do
                Fzone_Xin(var18) = sumF
                absF = Fzone_Xin(var18) - (Fzone_Ri(var18)/12)
                sumFF = sumFF + abs(absF)
                FXR(var18) = sumFF
                Fzone_SI(var18) = (1/Fzone_rainfall(var18)) * (FXR(var18))
                var18 = var18 + 1   
        end do                   
    end do
    
    !write output values to new file
    open(70, file='F_seasonality.csv', status='new', action='write')
    do var22 = 1, 30
        write(70, '(I6.2, 5X, F12.4)') Fzone_y(var22), Fzone_SI(var22)        
    end do
    close(70)

    

    open(90, file = 'Data3.txt', status='old', action='read')
    do var23 = 1, 360
        read(90, *)year(var23), Tzone_month(var23), Tzone_rainfall(var23)
        var24 = var24 + 1        
    end do
    300 continue
    close(90)

    !calculate logic for finding seasonal index
    var25 = 1
    do var26 = 1921, 1950
        sumF = 0
        do var27 = 1, var24
            if(year(var27) == var26)then
                Tzone_y(var15) = var16
                sumT = sumT + Tzone_rainfall(var27)
            end if            
        end do
        Tzone_rainfall(var25) = sumT
        var25 = var25 + 1        
    end do

    var28 = 1
    do var29 = 1921, 1950
        do var30 = 1, 12
                sumN = 0
                do var31 = 1, var24
                    if(Tzone_month(var31) == var30) then
                        Tm(var28) = var30
                        sumT = sumT + Tzone_rainfall(var31)
                    end if
                end do
                Tzone_Xin(var28) = sumT
                absT = Tzone_Xin(var28) - (Tzone_Ri(var28)/12)
                sumTT = sumTT + abs(absT)
                TXR(var28) = sumTT
                Tzone_SI(var28) = (1/Tzone_rainfall(var28)) * (FXR(var18))
                var28 = var28 + 1   
        end do                   
    end do
    
    !write output values to new file
    open(95, file='T_seasonality.csv', status='new', action='write')
    do var32 = 1, 30
        write(95, '(I6.2, 5X, F12.4)') Tzone_y(var32), Tzone_SI(var32)        
    end do
    close(95)
!!ending fortran program    
end program fortran_assignment