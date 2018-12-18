s = tf('s')

RC_tf = 1/(1+s*3.3e-3)

bode(RC_tf)


b1 = 0.985
a0 = 0.015
