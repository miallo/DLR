reset

set terminal epslatex color

set output 'gbesch.tex'

set xlabel "Länge [m]"
set ylabel "g [$\\si{\\meter\\per\\second^2}$]"

set samples 2000
set key bottom left

set fit errorvariables 

f(x) = a

set xrange [0.5:1.3]

fit f(x) "besch.txt" u 1:((4*pi*pi*$1)/$2**2):(sqrt((0.01*$1*pi*pi*8/($2**3))**2+(0.01*4*pi*pi/($2**2))**2)) via a

p "besch.txt" u 1:((4*pi*pi*$1)/$2**2):(sqrt((0.01*$1*pi*pi*8/($2**3))**2+(0.01*4*pi*pi/($2**2))**2)) w e t 'Messwerte', f(x) lt -1 t sprintf("$\\bar{g}=(%.2f\\pm%.2f) \\,\\si{\\meter\\per\\second^2}$",a,a_err)

set output
!epstopdf gbesch.eps
!rm gbesch.eps
