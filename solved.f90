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
        read(20, *, end=100)year(var1), Nzone_month(var1), Nzone_rainfall(var1)
        var2 = var2 + 1        
    end do
    100 continue
    close(20)
    do var3 = start, stop
        sumN = 0
        avgN = 0
        do var4 = 1, var2
            if (Nzone_month(var4) == var3) then
                m(var5) = var3
                sumN = sumN + Nzone_rainfall(var4)
                avgN = sumN/30
            end if           
        end do
        Nzone_sum(var5) = sumN
        Nzone_avg(var5) = avgN
        var5 = var5 + 1
    end do
    open(10, file='test_data.csv', status='new', action='write')
    do var6 = 1, 12
        write(10, *) m(var6), Nzone_avg(var6)        
    end do
    close(10)
   
    
end program fortran_assignment