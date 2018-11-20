% SUMMARY
% Script for deriving transfer functions of the system.
% The script is divided in many sections. Every section
% contains the derivation of a transfer function of a 
% converter mode:
%     1- Buck Converter Vo/Vg
%     2- Buck Converter Vo/d
%     3- Boost Converter Vo/Vg
%     TBD 4- Boost Converter Vo/d
% 
% TO DO
% -Change variables' names to explicitly show if are small signal variables
%     or constant variables
% -Derivation of Vo/D of boost
% -Derivation of transfer functions of Buck-Boost
% -Derivation of other interesting tf for all converters (Zout, Zin??)
% -Inputs are matrixes A1, A2, B1, B2
% -The code must be capable of outputting many bodes as a result of a parametric
%     sweep, like for Duty cycle or different component values


%% Inverse matrix calculation with symbolic math - Not Used-
syms Ron D2 Rout

A = ([Ron*D2 2*D2-1; 1-2*D2 (2*D2-1)/Rout]);
A_inverse = inv(A);

%% Buck Converter - Line to output transfer function derivation: Vo/Vg
%This snippet has as an input the system's equations: inductor voltage
%and capacitor current and transforms it to the transfer function of line
%to output. The matlab functions used are described in: 
%https://se.mathworks.com/help/symbolic/formula-manipulation-and-simplification.html
    clearvars
    clc
    close all
    %symbolic math variable declaration
    syms C s v D1 D2 il Rout Vg L Ron
    
    %inductor voltage equation (IVE)
    ind_v_eqn = L * s * il == Ron * (D2 - 2) * il + (- 1) * v + D1 * Vg;

    %isolate current in IVE
    i_l = isolate(ind_v_eqn, il);

    %Capacitor current equation (CCE)
    cap_i_eqn = C * s * v == (1 - 2*D2) * il + (2*D2 - 1)/Rout * v; 

    %Substitute current equation in CCE
    cap_i_eqn_i_substituted = subs(cap_i_eqn, lhs(i_l), rhs(i_l));
    
    %D2 = 1 - D1
    duty_relation = D2 == 1 - D1;
    system_tf = subs(cap_i_eqn_i_substituted, lhs(duty_relation), rhs(duty_relation));
    
    %isolate v
    v_tf = isolate(system_tf, v);

    %Divide by Vg
    Line2Out_tf = simplifyFraction(v_tf / Vg)
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
    G_book = tf([0.7], [1, 1e-3, 1])
    bode(G_book)
    hold on
    bode(G)
    margin(G)

    legend('Buck Converter Vo/Vg')
    
%% Buck Converter - Duty cycle to output transfer function derivation: Vo/D
%This snippet has as an input the system's equations: inductor voltage
%and capacitor current and transforms it to the transfer function D
%to output. The matlab functions used are described in: 
%https://se.mathworks.com/help/symbolic/formula-manipulation-and-simplification.html
    clearvars
    close all
    clc
    
    I_k = 10 %Constant current
    Ron_k = 1
    Vg_k = 32
    Rout_k = 0.1
    v_k = 30
    
    
    %symbolic math variable declaration
    syms C s v D1 D2 il Rout Vg L Ron d

    %inductor voltage equation (IVE)
    ind_v_eqn = L * s * il == Ron * (D2 - 2) * il + (- 1) * v + ((-Ron_k) * I_k + Vg_k) * d;

    %isolate current in IVE
    i_l = isolate(ind_v_eqn, il);

    %Capacitor current equation (CCE)
    cap_i_eqn = C * s * v == (1 - 2*D2) * il + (2*D2 - 1)/Rout * v + (2 * I_k + (-2 / Rout_k) * v_k) * d;
    
    %Substitute current equation in CCE
    cap_i_eqn_i_substituted = subs(cap_i_eqn, lhs(i_l), rhs(i_l));

    %D2 = 1 - D1
    duty_relation = D2 == 1 - D1;
    system_tf = subs(cap_i_eqn_i_substituted, lhs(duty_relation), rhs(duty_relation));
    
    %isolate v
    v_tf = isolate(system_tf, v);
    
    %Divide by Duty cycle
    Duty2Out_tf = simplifyFraction(v_tf / d);
    
    %Rearrange with factors of s
    Duty2Out_tf_factors_s = collect(Duty2Out_tf,s);
    pretty(Duty2Out_tf_factors_s)

    %Substitute constant values in function
    Duty2out_real_values = variable_value_assign(Duty2Out_tf_factors_s);
    pretty(Duty2out_real_values)

    %Translation from symbolic transfer function to MATlab transfer
    %function. External library needed.
    G = sym2tf(rhs(Duty2out_real_values))

    bode(G)
    %margin(G)

    legend('Buck Converter duty 2 output')

    
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
    ind_v_eqn = L * s * il == -D2 * v + 1 * Vg;

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
    margin(G)
    legend('Boost Converter')

    
    
    
    function tf = variable_value_assign(sym_tf)
        %MATlabs seems to create variables as local so redefinition is
        %needed
        syms D1 C L Ron Rout Vg
        P_rated = 300;
        Vin_rated = 32;
        Vg_value = Vg == Vin_rated;
        D1_value = D1 == 0.7;
        duty_cycle_1 = 0.7; %non-symbolic D1
        Vout_rated = Vin_rated * duty_cycle_1;
        C_value = C == 100E-6;
        L_value = L == 100E-6;
        Rout_value = Rout == 0.1; %Vout_rated^2 / P_rated
        Ron_value = Ron == 0;
        %Substitution of the values in tf
        tf_Vg = subs(sym_tf, lhs(Vg_value), rhs(Vg_value));
        tf_D = subs(tf_Vg, lhs(D1_value), rhs(D1_value));
        tf_C = subs(tf_D, lhs(C_value), rhs(C_value));
        tf_L = subs(tf_C, lhs(L_value), rhs(L_value));
        tf_Rout = subs(tf_L, lhs(Rout_value), rhs(Rout_value));
        tf_Ron = subs(tf_Rout, lhs(Ron_value), rhs(Ron_value));
        tf = tf_Ron;
    end

