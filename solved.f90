program fortran_assignment
    implicit none
    real, dimension(360) :: year, Nzone_rainfall, Nzone_sum, Nzone_avg
    real, dimension(360) :: Tzone_rainfall, Tzone_sum, Tzone_avg
    real, dimension(360) :: Fzone_rainfall, Fzone_sum, Fzone_avg
    integer, dimension(360) :: y, Nzone_year, Nzone_month, Nzone_y
    integer, dimension(360) :: Fzone_year, Fzone_month, Fzone_y
    integer, dimension(360) :: Tzone_year, Tzone_month, Tzone_y
    real :: sumN, avgN, sumT, avgT, sumF, avgF
    integer :: var1, var2, var3, var4, var5, var6, var7, var8, var9, var10, var11, var12, var13, var14, var15, var16, var17, var18
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
            if (year(var4) == var3) then
                y(var5) = var3
                sumN = sumN + Nzone_rainfall(var4)
                avgN = sumN/12
            end if           
        end do
        Nzone_sum(var5) = sumN
        Nzone_avg(var5) = avgN
        var5 = var5 + 1
    end do
    open(10, file='Nzone_data.csv', status='new', action='write')
    do var6 = 1, 30
        write(10, *) y(var6), Nzone_avg(var6)        
    end do
    close(10)
    open(20, file='Data2.txt', status='old', action='read')
    do var7 = 1, 360
        read(20, *, end=150)year(var7), Tzone_month(var7), Tzone_rainfall(var7)
        var8 =var8 + 1        
    end do
    150 continue
    close(20)
    do var9 = 1921, 1950
        sumT = 0
        avgT = 0
        do var10 = 1, var8
            if ( year(var10) == var9 ) then
                y(var11) = var9
                sumT = sumT + Tzone_rainfall(var10)
                avgT = sumT/12
            end if            
        end do
        Tzone_sum(var11) = sumT
        Tzone_avg(var11) = avgT
        var11 = var11 + 1
    end do
    open(30, file='Tzone_data.csv', status='new')
    do var12=1, 30
        write(30,*)y(var12), Tzone_avg(var12)
    end do
    close(30)
    open(80, file='Data3.txt', status='old', action='read')
    do var13 = 1, 360
        read(80, *, end=500)year(var13), Fzone_month(var13), Fzone_rainfall(var13)
        var14 = var14 + 1
    end do
    500 continue
    close(80)

    do var15=1921,1950
        avgF = 0
        sumF = 0
        do var16 = 1, var14
            if (year(var16) == var15) then
                y(var17) = var15
                sumF = sumF + Fzone_rainfall(var16)
                Fzone_avg = sumF/12
            end if
        end do
        Fzone_sum(var17) = sumF
        Fzone_avg(var17) = avgF
        var17 = var17 + 1
    end do
    open(88, file='Fzone_data.csv', status='new')
    do var18 = 1, 30
        write(88, *)y(var18), Fzone_avg(var18)
    end do
    close(88)
end program fortran_assignment