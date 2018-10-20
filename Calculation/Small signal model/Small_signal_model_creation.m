%Script for deriving transfer functions of the system
%19_10_18

%% Inverse matrix calculation with symbolic math - Not Used-
syms Ron D2 Rout

A = ([Ron*D2 2*D2-1; 1-2*D2 (2*D2-1)/Rout]);
A_inverse = inv(A);

%% Buck Converter - Line to output transfer function derivation
%This snippet has as an input the system's equations: inductor voltage
%and capacitor current and transforms it to the transfer function of line
%to output. The matlab functions used are described in: 
%https://se.mathworks.com/help/symbolic/formula-manipulation-and-simplification.html
    clearvars
    clc
    %symbolic math variable declaration
    syms C s v D1 D2 il Rout Vg L Ron
    
    %inductor voltage equation (IVE)
    ind_v_eqn = L * s * il == Ron * (3*D2 - 2) * il + (2*D2 - 1) * v + D1 * Vg;

    %isolate current in IVE
    i_l = isolate(ind_v_eqn, il);

    %Capacitor current equation (CCE)
    cap_i_eqn = C * s * v == (1 - 2*D2) * il + (2*D2 - 1)/Rout * v; %+ D1 * Vg; comentado tras cambio 1

    %Substitute current equation in CCE
    cap_i_eqn_i_substituted = subs(cap_i_eqn, lhs(i_l), rhs(i_l));
    
    %D2 = 1 - D1
    duty_relation = D2 == 1 - D1;
    system_tf = subs(cap_i_eqn_i_substituted, lhs(duty_relation), rhs(duty_relation));
    
    %isolate v
    v_tf = isolate(system_tf, v);

    %Divide by Vg
    Line2Out_tf = simplifyFraction(v_tf / Vg);

    %Rearrange with factors of s
    Line2Out_tf_factors_s = collect(Line2Out_tf,s);
    pretty(Line2Out_tf_factors_s)
    
    %%Removing Ron from the expression
%     Line2out_tf_without_Ron = subs(Line2Out_tf_factors_s, Ron, 0)
%     pretty(collect(Line2out_tf_without_Ron,s))

    
    %Substitute constant values in function
    Line2out_real_values = variable_value_assign(Line2Out_tf_factors_s);
    
    pretty(Line2out_real_values)

    %Translation from symbolic transfer function to MATlab transfer
    %function. External library needed.
    G = sym2tf(rhs(Line2out_real_values))
%     G_book = tf([0.6], [1, 1e-3, 1])
%     bode(G_book)
    bode(G)

    
%% Boost Converter - Line to output transfer function derivation
%This snippet has as an input the system's equations: inductor voltage
%and capacitor current and transforms it to the transfer function of line
%to output. The matlab functions used are described in: 
%https://se.mathworks.com/help/symbolic/formula-manipulation-and-simplification.html
    clearvars
    clc
    %symbolic math variable declaration
    syms C s v D1 D2 il Rout Vg L Ron
    
    %inductor voltage equation (IVE)
    ind_v_eqn = L * s * il == D2 * v + (1 - 2*D2) * Vg;

    %isolate current in IVE
    i_l = isolate(ind_v_eqn, il);

    %Capacitor current equation (CCE)
    cap_i_eqn = C * s * v == D2 * il + (D1 - D2/Rout) * v;

    %Substitute current equation in CCE
    cap_i_eqn_i_substituted = subs(cap_i_eqn, lhs(i_l), rhs(i_l));
    
    %D2 = 1 - D1
    duty_relation = D2 == 1 - D1;
    system_tf = subs(cap_i_eqn_i_substituted, lhs(duty_relation), rhs(duty_relation));
    
    %isolate v
    v_tf = isolate(system_tf, v);
    pretty(v_tf)

    %Divide by Vg
    Line2Out_tf = simplifyFraction(v_tf / Vg);
    pretty(Line2Out_tf)
    
    %Rearrange with factors of s
    Line2Out_tf_factors_s = collect(Line2Out_tf,s);
    pretty(Line2Out_tf_factors_s)
  
    %Substitute constant values in function
    Line2out_real_values = variable_value_assign(Line2Out_tf_factors_s);
    
    pretty(Line2out_real_values)

    %Translation from symbolic transfer function to MATlab transfer
    %function. External library needed.
    G = sym2tf(rhs(Line2out_real_values))

    bode(G)
    
    
    
    function tf = variable_value_assign(sym_tf)
        %MATlabs seems to create variables as local so redefinition is
        %needed
        syms D1 C L Ron Rout
        P_rated = 300;
        Vin_rated = 32;
        D1_value = D1 == 0.7;
        duty_cycle_1 = 0.7; %non-symbolic D1
        Vout_rated = Vin_rated * duty_cycle_1;
        C_value = C == 100E-6;
        L_value = L == 100E-6;
        Rout_value = Rout == 0.1; %Vout_rated^2 / P_rated
        Ron_value = Ron == 0;
        %Substitution of the values in tf
        tf_D = subs(sym_tf, lhs(D1_value), rhs(D1_value));
        tf_C = subs(tf_D, lhs(C_value), rhs(C_value));
        tf_L = subs(tf_C, lhs(L_value), rhs(L_value));
        tf_Rout = subs(tf_L, lhs(Rout_value), rhs(Rout_value));
        tf_Ron = subs(tf_Rout, lhs(Ron_value), rhs(Ron_value));
        tf = tf_Ron;
    end

