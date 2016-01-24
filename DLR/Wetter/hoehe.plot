reset
set term epslatex
set output 'hoehe.tex'

set xlabel 'Höhe $h$ [m]'
set ylabel 'Relativdruck $\Delta p$ [hPa]'


#set xrange [0:9]
R=8.314
g=9.80665
M=0.02896
T=283.0 #17°C vllt etwas zu hoch...
hs=R*T/M/g
p0=1014.035 #Standart - muss ersetzt werden
f(x)=a*x+b

fit f(x) 'hoehe.dat' u 2:($1-p0):(p_error) via a,b
h_error = 0.05
p_error = 0.05

#plot 'hoehe.dat' u 2:(hs*(p0-$1)/p0) t 'Berechnete/tatsächliche Höhe $\left[m\right]$', f(x)

p 'hoehe.dat' u 2:($1-p0):(h_error):(p_error) w xye t 'Messwerte',\
  f(x) lt -1 t 'Lin. Reg.'

set output
!epstopdf hoehe.eps
!rm hoehe.eps
