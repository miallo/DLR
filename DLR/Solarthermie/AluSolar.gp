reset
set terminal epslatex color
set output 'AluSolar.tex'

set xlabel "Zeit [s]"
set ylabel "T [$\si\celsius$]"

set samples 2000
set key bottom left

set fit logfile 'AluSolar.fit'
set fit errorvariables 

f1(x) = a1*x+b1
f2(x) = a2*x+b2

fit f1(x) "AluSolar.dat" u 1:2:(0.5) via a1,b1
fit f2(x) "AluSolar.dat" u 1:3:(0.5) via a2,b2

p "AluSolar.dat" u 1:2:(0.5) w ye t'dunkel (Messwerte)',\
  "AluSolar.dat" u 1:3:(0.5) w ye t'hell (Messwerte)',\
  f1(x) lt -1 t'dunkel (Fit)',\
  f2(x) lt 0 t'hell (Fit)'

set output
!epstopdf AluSolar.eps
!rm AluSolar.eps
