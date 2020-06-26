!begin assignment program
program fortran_assignment
    !declare implicit status as none
    implicit none
    !set neccessary variables for assignment
    real, dimension(360) :: year, Nzone_rainfall, Nzone_sum, Nzone_avg
    real, dimension(360) :: Tzone_rainfall, Tzone_sum, Tzone_avg
    real, dimension(360) :: Fzone_rainfall, Fzone_sum, Fzone_avg
    integer, dimension(360) :: y,m, Nzone_year, Nzone_month, Nzone_y
    integer, dimension(360) :: Fzone_year, Fzone_month, Fzone_y
    integer, dimension(360) :: Tzone_year, Tzone_month, Tzone_y
    real :: sumN, avgN, sumT, avgT, sumF, avgF
    !instanstiate iterators and counters setting initial value to 1
    integer :: var1=1, var2=1, var3=1, var4=1, var5=1, var6=1, var7=1, var8=1, var9=1
    integer::  var10=1, var11=1, var12=1, var13=1, var14=1, var15=1, var16=1, var17=1, var18=1
    


    !open first data set and read through values by am iterator
    open(20, file = 'Data1.txt', status='old', action='read')
    do var1 = 1, 360
        read(20, *)year(var1), Nzone_month(var1), Nzone_rainfall(var1)
        var2 = var2 + 1        
    end do
    
    close(20)

    !calculate logic for finding seasonal monthly climatology
    
    !write output values to new file
    open(10, file='Nzone_data.csv', status='new', action='write')
    do var6 = 1, 12
        write(10, *) Nzone_avg(var6)        
    end do
    close(10)

    
!!ending fortran program    
end program fortran_assignment