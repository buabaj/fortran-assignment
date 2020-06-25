program fortran_assignment
    implicit none
    real, dimension(360) :: year, Nzone_rainfall, Nzone_sum, Nzone_avg
    real, dimension(360) :: Tzone_rainfall, Tzone_sum, Tzone_avg
    real, dimension(360) :: Fzone_rainfall, Fzone_sum, Fzone_avg
    integer, dimension(360) :: y,m, Nzone_year, Nzone_month, Nzone_y
    integer, dimension(360) :: Fzone_year, Fzone_month, Fzone_y
    integer, dimension(360) :: Tzone_year, Tzone_month, Tzone_y
    real :: sumN, avgN, sumT, avgT, sumF, avgF
    integer :: var1=1, var2=1, var3=1, var4=1, var5=1, var6=1, var7=1, var8=1, var9=1
    integer::  var10=1, var11=1, var12=1, var13=1, var14=1, var15=1, var16=1, var17=1, var18=1
    integer :: start=1919, stop=1950

    open(20, file = 'Data1.txt', status='old', action='read')
    do var1 = 1, 360
        read(20, *)year(var1), Nzone_month(var1), Nzone_rainfall(var1)
        var2 = var2 + 1        
    end do
    
    close(20)
    do var3 = 1, 12
        sumN = 0
        avgN = 0
        do var4 = 1, var2
            if (Nzone_month(var4) == var3) then
                Nzone_y(var5) = var3
                sumN = sumN + Nzone_rainfall(var4)
                avgN = sumN/30
            end if           
        end do
        Nzone_sum(var5) = sumN
        Nzone_avg(var5) = avgN
        var5 = var5 + 1
    end do
    open(10, file='Nzone_data.csv', status='new', action='write')
    do var6 = 1, 12
        write(10, *) Nzone_month(var6), Nzone_avg(var6)        
    end do
    close(10)
    open(30, file = 'Data2.txt', status='old', action='read')
    do var7 = 1, 360
        read(30, *)year(var7), Fzone_month(var7), Fzone_rainfall(var7)
        var8 = var8 + 1        
    end do
    
    close(30)
    do var9 = 1, 12
        sumF = 0
        avgF = 0
        do var10 = 1, var8
            if (Fzone_month(var10) == var9) then
                Fzone_y(var11) = var9
                sumF = sumF + Fzone_rainfall(var10)
                avgF = sumF/30
            end if           
        end do
        Fzone_sum(var11) = sumF
        Fzone_avg(var11) = avgF
        var11 = var11 + 1
    end do
    open(40, file='Fzone_data.csv', status='new', action='write')
    do var12 = 1, 12
        write(40, *) Fzone_month(var12), Fzone_avg(var12)        
    end do
    close(40)


   
    
end program fortran_assignment