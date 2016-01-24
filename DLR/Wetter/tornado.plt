reset
!rm fit.log
set xrange [-2:20]
set yrange [-2:10]
set samples 10000

f1(x) = (x<R1-c1) ? a1*(x+c1) : (a1*R1**2)/(x+c1)
f2(x) = (x<R2-c2) ? a2*(x+c2) : (a2*R2**2)/(x+c2)
g1(x) = b1*d1**2*(1-exp(-((x+e1)/d1)**2))/(x+e1)
g2(x) = b2*d2**2*(1-exp(-((x+e2)/d2)**2))/(x+e2)
#b2 = 79.8632
#d2 = 0.0276828
#e2 = 1.37071

#b1 = 79.8632
#d1 = 0.0276828
#e1 = 1.37071

fit f1(x) 'tornado.dat' u 1:2:(0.1) via a1,R1,c1
fit f2(x) 'tornado.dat' u 1:3:(0.1) via a2,R2,c2
fit g1(x) 'tornado.dat' u 1:2:(0.1) via b1,d1,e1
fit g2(x) 'tornado.dat' u 1:3:(0.1) via b2,d2,e2

#==================================================

set terminal epslatex color
set output 'tornado1.tex'
set xlabel '$r_\Delta$ [cm]'
set ylabel '$v$ [$\frac{\text{m}}{\text{s}}$]'

p 'tornado.dat' u 1:2:(0.1) w e t 'Messwerte',\
  f1(x) lt -1 t'Rankine-Modell', g1(x) t'Burgers-Rott-Modell'

set output
!epstopdf tornado1.eps
!rm tornado1.eps


#===================================================

set terminal epslatex color
set output 'tornado2.tex'
set xlabel '$r_\Delta$ [cm]'
set ylabel '$v$ [$\frac{\text{m}}{\text{s}}$]'
set key bottom right

p 'tornado.dat' u 1:3:(0.1) w e t 'Messwerte',\
   f2(x) t'Rankine-Modell', g2(x) lt -1 t'Burgers-Rott-Modell'

set output
!epstopdf tornado2.eps
!rm tornado2.eps
