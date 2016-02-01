reset
set terminal epslatex color
set output 'WasserSandSolar.tex'

set xlabel "Zeit [s]"
set ylabel "T [$\\si\\celsius$]"

set samples 2000
set key top left

set fit logfile 'WasserSandSolar.fit'
set fit errorvariables 

f1(x) = a1*x+b1
f2(x) = a2*x+b2

fit f1(x) "WasserSandSolar.dat" u 1:2:(0.5) via a1,b1
fit f2(x) "WasserSandSolar.dat" u 1:3:(0.5) via a2,b2

p "WasserSandSolar.dat" u 1:2:(0.5) w ye t'Wasser (Werte)',\
  "WasserSandSolar.dat" u 1:3:(0.5) w ye t'Sand (Werte)',\
  f1(x) lt -1 t'Wasser (Fit)',\
  f2(x) lt 0 t'Sand (Fit)'

set output
!epstopdf WasserSandSolar.eps
!rm WasserSandSolar.eps
