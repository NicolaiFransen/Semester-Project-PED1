%Script for deriving transfer functions of the system
%%Variable Init
Ron = 1;


%%Inverse matrix calculation with symbolic math - Not Used-
syms Ron D2 Rout

A = ([Ron*D2 2*D2-1; 1-2*D2 (2*D2-1)/Rout]);
A_inverse = inv(A);


%%Line to output transfer function derivation
%This snippet has as an input the system's equations: inductor voltage
%and capacitor current and transforms it to the transfer function of line
%to output. The matlab functions used are described in: 
%https://se.mathworks.com/help/symbolic/formula-manipulation-and-simplification.html
    
    %symbolic math variable declaration
    syms C s v D1 D2 i Rout Vg L Ron
    
    %inductor voltage equation (IVE)
    ind_v_eqn = L * s * i == Ron * D2 * i + (2*D2 - 1) * v + D1 * Vg;

    %isolate current in IVE
    i_l = isolate(ind_v_eqn, i);

    %Capacitor current equation (CCE)
    cap_i_eqn = C * s * v == (1 - 2*D2) * i + (2*D2 - 1)/Rout * v + D1 * Vg;

    %Substitute current equation in CCE
    cap_i_eqn_i_substituted = subs(cap_i_eqn, lhs(i_l), rhs(i_l));

    %D2 = 1 - D1
    duty_relation = D2 == 1 - D1
    system_tf = subs(cap_i_eqn_i_substituted, lhs(duty_relation), rhs(duty_relation));
    
    %isolate v
    v_tf = isolate(system_tf, v);

    %Divide by Vg.
    Line2Out_tf = simplifyFraction(v_tf / Vg);

    %Rearrange with factors of s
    Line2Out_tf_factors_s = collect(Line2Out_tf,s);
    pretty(Line2Out_tf_factors_s)

    
