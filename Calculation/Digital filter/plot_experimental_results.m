close all;
clc

not_filtered = csvread('2018_12_18_Currentwithout.csv',1);

filtered = csvread('2018_12_18_Currentwithfilter.csv',1);

% plot(not_filtered(1,:),not_filtered(1,:)
figure(1)
plot(not_filtered)
hold on
plot(filtered, '.', 'MarkerSize', 2)
hold off
ylim([10.5 14.5])
xlim([0 8000])
legend('Inductor current without filtering', 'Inductor current filtered')


% 
% %Measurement values from excel reading
% MPPT1000 = csvread('100Hz_all.csv')
% %Messwerte in Variablen speichern
% t1000 = MPPT1000(:,1);
% vin1000 = MPPT1000(:, 2);
% iin1000 = MPPT1000(:, 3);
% vout1000 = MPPT1000(:, 4);
% iout1000 = MPPT1000(:, 5);
% 
% %Filter
% vin1000f = smoothdata(vin1000,'gaussian',20);
% vout1000f = smoothdata(vout1000,'gaussian',20);
% iin1000f = smoothdata(iin1000,'gaussian',20);
% iout1000f = smoothdata(iout1000,'gaussian',20);
% 
% pin1000 = vin1000f.* iin1000f;
% pout1000 = vout1000f.* iout1000f;
% 
%  
% % %Verschiebung der X-Achse
% % time1k = time1-1.423;
% % time2k= time2-0.204;
% %Fenster mit 2 Koordinatensystemen (KS)
% h_fig=figure;
% h_fig.Units = 'centimeter';
% h_fig.Position= [1 2 24 12.5];
% set(gcf,'color','w');% change the background of the figure to white
% h_axo=axes;
% hold 'on' ;
% h_axu=axes;
% hold 'on' ;
% grid (h_axo,'on');
% grid (h_axu,'on');
% h_axo.GridAlpha = 0.25;
% h_axu.GridAlpha = 0.25;
% h_fig1=figure;
% h_fig1.Units = 'centimeter';
% h_fig1.Position= [1 2 24 12.5];
% set(gcf,'color','w');% change the background of the figure to white
% h_axo1=axes;
% hold 'on' ;
% h_axu1=axes;
% hold 'on' ;
% grid (h_axo1,'on');
% grid (h_axu1,'on');
% h_axo1.GridAlpha = 0.25;
% h_axu1.GridAlpha = 0.25;
% %h_axo.YLim =[-200,300];
% %Positionen der KS verändern
% h_axo.Units= 'centimeter';
% h_axu.Units= 'centimeter';
% h_axo.Position= [1.5,1.5,10,10];
% h_axu.Position= [13.5,1.5,10,10];
% h_axo1.Units= 'centimeter';
% h_axu1.Units= 'centimeter';
% h_axo1.Position= [1.5,1.5,10,10];
% h_axu1.Position= [13.5,1.5,10,10];
% % h_ax1.Units= 'centimeter';
% % h_ax1.Position= [2,2,10,10];
% %Y-axes limit
% %h_axo.YLim = [-5,50];% for the buck mode
% h_axo.YLim = [-5,50];
% h_axu.YLim = [-5,350];
% h_axo1.YLim = [-5,50];
% h_axu1.YLim = [-5,350];
% %Kräfte in beiden KS darstellen
% h_vin1000=plot(h_axo,t1000,vin1000f);
% h_iin1000=plot(h_axo,t1000,iin1000f);
% h_pin1000=plot(h_axu,t1000,pin1000);
% 
% h_pin10001=plot(h_axu1,t1000,pin1000);
% h_vin10001=plot(h_axo1,t1000,vin1000f);
% h_vout10001=plot(h_axo1,t1000,vout1000f);
% h_pout10001=plot(h_axu1,t1000,pout1000);
% 
% h_vin1000.LineWidth = 1.5;
% h_iin1000.LineWidth = 1.5;
% h_pin1000.LineWidth = 1.5;
% h_vin10001.LineWidth = 1.5;
% h_vout10001.LineWidth = 1.5;
% h_pin10001.LineWidth = 1.5;
% h_pout10001.LineWidth = 1.5;
% 
% % Axe description
% h_xachseo = xlabel (h_axo,'Time (s)');
% h_yachseo = ylabel (h_axo,'Voltage (V),Current (A)');
% h_xachseo1 = xlabel (h_axo1,'Time (s)');
% h_yachseo1 = ylabel (h_axo1,'Voltage (V)');
% xticks(h_axo,[-20 -15 -10 -5 0 5 10 15 20]);
% xticklabels(h_axo,{'0','5','10','15','20','25','30','35','40'})
% xticks(h_axu,[-20 -15 -10 -5 0 5 10 15 20]);
% xticklabels(h_axu,{'0','5','10','15','20','25','30','35','40'})
% xticks(h_axo1,[-20 -15 -10 -5 0 5 10 15 20]);
% xticklabels(h_axo1,{'0','5','10','15','20','25','30','35','40'})
% xticks(h_axu1,[-20 -15 -10 -5 0 5 10 15 20]);
% xticklabels(h_axu1,{'0','5','10','15','20','25','30','35','40'})
% % Achsenbeschreibung für das rechte KS
% h_xachseu = xlabel (h_axu,'Time (s)');
% h_yachseu = ylabel (h_axu,'Power (W)');
% h_xachseu1 = xlabel (h_axu1,'Time (s)');
% h_yachseu1 = ylabel (h_axu1,'Power (W)');
% % Farbe und Dicke der Linien im KS verändern [Rot Grün Blau]
% % h_xforce1.Color = [0, 0, 1];
% % h_yforce1.Color = [ 1 0 0];
% % h_xforce1.LineWidth = 2;
% % h_yforce1.LineWidth = 2;
% 
%  %Legend
% h_legend = legend([h_vin1000,h_iin1000],'V_i_n','I_i_n');
% h_legend.Units= 'centimeter';
% h_legend.Position = [9.9,10.2,1,1];%[x,y,length,width]
% h_legend1 = legend([h_vin10001,h_vout10001],'V_i_n','V_o_u_t');
% h_legend1.Units= 'centimeter';
% h_legend1.Position = [9.9,10.2,1,1];%[x,y,length,width]
% h_legend2 = legend([h_pin1000],'P_i_n');
% h_legend2.Units= 'centimeter';
% h_legend2.Position = [21.9,10.3,1,1];%[x,y,length,width]
% h_legend3 = legend([h_pin10001,h_pout10001],'P_i_n','P_o_u_t');
% h_legend3.Units= 'centimeter';
% h_legend3.Position = [21.9,10.2,1,1];%[x,y,length,width]
% 


