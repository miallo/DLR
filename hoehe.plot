reset
set term epslatex
#set xrange [0:9]
R=8.314
g=9.80665
M=0.02896
T=283.0 #17°C vllt etwas zu hoch...
hs=R*T/M/g
p0=1014.035 #Standart - muss ersetzt werden
f(x)=x
set output 'hoehe.tex'

plot 'hoehe.dat' u 2:(hs*(p0-$1)/p0) t 'Berechnete/tatsächliche Höhe $\left[m\right]$', f(x)
set output
!epstopdf hoehe.eps
!rm hoehe.eps
