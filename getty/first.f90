program question1
    implicit none
    integer :: a=1, b=1, c=1, d=1, e=1, f=1, g=1, h=1, i=1
    integer::  j=1, k=1, l=1, m=1, n=1, o=1, p=1, q=1, r=1
    real, dimension(360) :: year, rain_N, N_add, N_avg
    real, dimension(360) :: rain_T, T_add, T_avg
    real, dimension(360) :: rain_F, F_add, F_avg
    integer, dimension(360) :: y, yfr_N, month_N, N_y
    integer, dimension(360) :: yfr_F, month_F, F_y
    integer, dimension(360) :: yfr_T, month_T, T_y
    real :: additionN, averageN, additionT, averageT, additionF, averageF   

    open(101, file = 'Data1.txt', status='old', action='read')
    do a = 1, 360
        read(101, *)year(a), month_N(a), rain_N(a)
        b = b + 1        
    end do
    
    close(101)

    do c = 1, 12
        additionN = 0
        averageN = 0
        do d = 1, b
            if (month_N(d) == c) then
                N_y(e) = c
                additionN = additionN + rain_N(d)
                averageN = additionN/30
            end if           
        end do
        N_add(e) = additionN
        N_avg(e) = averageN
        e = e + 1
    end do
    open(88, file='Northern_zone.csv', status='new', action='write')
    do f = 1, 12
        write(88, *) N_avg(f)        
    end do
    close(88)


    open(300, file = 'Data2.txt', status='old', action='read')
    do g = 1, 360
        read(300, *)year(g), month_F(g), rain_F(g)
        h = h + 1        
    end do
    
    close(300) 

    do i = 1, 12
        additionF = 0
        averageF = 0
        do j = 1, h
            if (month_F(j) == i) then
                F_y(k) = i
                additionF = additionF + rain_F(j)
                averageF = additionF/30
            end if           
        end do
        F_add(k) = additionF
        F_avg(k) = averageF
        k = k + 1
    end do
    open(99, file='Forest_zone.csv', status='new', action='write')
    do l = 1, 12
        write(99,*) F_avg(l)        
    end do
    close(99)

    open(500, file = 'Data3.txt', status='old', action='read')
    do m = 1, 360
        read(500, *)year(m), month_T(m), rain_T(m)
        n = n + 1        
    end do
    close(500)


    do o = 1, 12
        additionT = 0
        averageT = 0
        do p = 1, n
            if (month_T(p) == o) then
                T_y(q) = o
                additionT = additionT + rain_T(p)
                averageT = additionT/30
            end if           
        end do
        T_add(q) = additionT
        T_avg(q) = averageT
        q = q + 1
    end do    
    open(77, file='Transition_zone.csv', status='new', action='write')
    do r = 1, 12
        write(77,*)T_avg(r)        
    end do
    close(77) 
    
end program question1