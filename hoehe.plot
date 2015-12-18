set term epslatex
R=8.314
g=9.80665
M=0.02896
T=290 #17°C vllt etwas zu hoch...
hs=R*T/M/g
p0=101325 #Standart - muss ersetzt werden


plot 'hoehe.dat' u (-hs*log($1/p0)):$0 w t 'Berechnete Höhe $\left[m\right]', 'hoehe.dat' u 2:0 w t 'Tatsächliche Höhe $\left[m\right]'

