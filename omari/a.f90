
program assignment
    implicit none
    integer :: i=1, ii=1, iii=1, iv=1, v=1, vi=1, vii=1, viii=1, ix=1
    integer::  x=1, xi=1, xii=1, xiii=1, xiv=1, xv=1, xvi=1, xvii=1, xviii=1
    real, dimension(360) :: year, North_rainfall, North_sum, North_avg
    real, dimension(360) :: Trans_rainfall, Trans_sum, Trans_avg
    real, dimension(360) :: Forest_rainfall, Forest_sum, Forest_avg
    integer, dimension(360) :: y,m, North_year, North_month, North_y
    integer, dimension(360) :: Forest_year, Forest_month, Forest_y
    integer, dimension(360) :: Trans_year, Trans_month, Trans_y
    real :: addN, meanN, addT, meanT, addF, meanF   

    open(20, file = 'Data1.txt', status='old', action='read')
    do i = 1, 360
        read(20, *)year(i), North_month(i), North_rainfall(i)
        ii = ii + 1        
    end do
    
    close(20)

    do iii = 1, 12
        addN = 0
        meanN = 0
        do iv = 1, ii
            if (North_month(iv) == iii) then
                North_y(v) = iii
                addN = addN + North_rainfall(iv)
                meanN = addN/30
            end if           
        end do
        North_sum(v) = addN
        North_avg(v) = meanN
        v = v + 1
    end do

    open(30, file = 'Data2.txt', status='old', action='read')
    do vii = 1, 360
        read(30, *)year(vii), Forest_month(vii), Forest_rainfall(vii)
        viii = viii + 1        
    end do
    
    close(30) 

    do ix = 1, 12
        addF = 0
        meanF = 0
        do x = 1, viii
            if (Forest_month(x) == ix) then
                Forest_y(xi) = ix
                addF = addF + Forest_rainfall(x)
                meanF = addF/30
            end if           
        end do
        Forest_sum(xi) = addF
        Forest_avg(xi) = meanF
        xi = xi + 1
    end do

    open(50, file = 'Data3.txt', status='old', action='read')
    do xiii = 1, 360
        read(50, *)year(xiii), Trans_month(xiii), Trans_rainfall(xiii)
        xiv = xiv + 1        
    end do
    close(50)


    do xv = 1, 12
        addT = 0
        meanT = 0
        do xvi = 1, xiv
            if (Trans_month(xvi) == xv) then
                Trans_y(xvii) = xv
                addT = addT + Trans_rainfall(xvi)
                meanT = addT/30
            end if           
        end do
        Trans_sum(xvii) = addT
        Trans_avg(xvii) = meanT
        xvii = xvii + 1
    end do

    
    open(40, file='Forest.csv', status='new', action='write')
    do xii = 1, 12
        write(40,*) Forest_avg(xii)        
    end do
    close(40)

    open(10, file='North.csv', status='new', action='write')
    do vi = 1, 12
        write(10, *) North_avg(vi)        
    end do
    close(10)

    open(60, file='Trans.csv', status='new', action='write')
    do xviii = 1, 12
        write(60,*)Trans_avg(xviii)        
    end do
    close(60) 
    
end program assignment