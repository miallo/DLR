reset
set terminal epslatex color
set output 'AluSolar.tex'

set xlabel "Zeit [s]"
set ylabel "T [$\\si\\celsius$]"

set samples 2000
set key top left

set fit logfile 'AluSolar.fit'
set fit errorvariables 

f1(x) = a1*x+b1
f2(x) = a2*x+b2

fit f1(x) "AluSolar.dat" u 1:2:(0.5) via a1,b1
fit f2(x) "AluSolar.dat" u 1:3:(0.5) via a2,b2

p "AluSolar.dat" u 1:2:(0.5) w ye t'schwarz (Werte)',\
  "AluSolar.dat" u 1:3:(0.5) w ye t'blank (Werte)',\
  f1(x) lt -1 t'schwarz (Fit)',\
  f2(x) lt 0 t'blank (Fit)'

set output
!epstopdf AluSolar.eps
!rm AluSolar.eps
