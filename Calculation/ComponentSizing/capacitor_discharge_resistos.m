V = [45 90]
Vc = 15
t = 60
C = [1.8e-3 800e-6]

R = (log(Vc./V).^-1)*(-t)./C
R = -t./(log(Vc./V).*C)

Power_rating = 0.25
safety_margin = 0.8 % 20 percent safety margin
power_rating_safety_margin = Power_rating * safety_margin

Rmin = V.^2/power_rating_safety_margin

R_to_use = [max(R(1), Rmin(1)) max(R(2), Rmin(2))]


Vc = 90*exp(-30/(R_to_use(2)*800e-6))