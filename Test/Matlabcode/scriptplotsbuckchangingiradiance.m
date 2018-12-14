close all;

%Measurement values from excel reading
MPPT1000 = csvread('changing1to08.csv')
MPPT300 = csvread('15.csv')

%Messwerte in Variablen speichern
t1000 = MPPT1000(:,1);
vin1000 = MPPT1000(:, 2);
iin1000 = MPPT1000(:, 3);

t300 = MPPT300(:,1);
vin300 = MPPT300(:, 2);
iin300 = MPPT300(:, 3);

pin300 = vin300.* iin300;

mean(pin300)

% %Filter
% vin1000f = smoothdata(vin1000,'gaussian',20);
% vout1000f = smoothdata(vout1000,'gaussian',20);
% iin1000f = smoothdata(iin1000,'gaussian',20);
% iout1000f = smoothdata(iout1000,'gaussian',20);

pin1000 = vin1000.* iin1000;
%pout1000 = vout1000.* iout1000;

%DIM = [0:0.1:1.4];

%mean (pin1000,DIM);

 
% %Verschiebung der X-Achse
% time1k = time1-1.423;
% time2k= time2-0.204;
%Fenster mit 2 Koordinatensystemen (KS)
h_fig=figure;
h_fig.Units = 'centimeter';
h_fig.Position= [1 2 25 12.5];
set(gcf,'color','w');% change the background of the figure to white
h_axo=axes;
hold 'on' ;
h_axu=axes;
hold 'on' ;
grid (h_axo,'on');
grid (h_axu,'on');
h_axo.GridAlpha = 0.25;
h_axu.GridAlpha = 0.25;
h_fig1=figure;
h_fig1.Units = 'centimeter';
h_fig1.Position= [1 2 25 12.5];
set(gcf,'color','w');% change the background of the figure to white
h_axo1=axes;
hold 'on' ;
h_axu1=axes;
hold 'on' ;
grid (h_axo1,'on');
grid (h_axu1,'on');
h_axo1.GridAlpha = 0.25;
h_axu1.GridAlpha = 0.25;
%h_axo.YLim =[-200,300];
%Positionen der KS verändern
h_axo.Units= 'centimeter';
h_axu.Units= 'centimeter';
h_axo.Position= [2,1.5,10,10];
h_axu.Position= [14.2,1.5,10,10];
h_axo1.Units= 'centimeter';
h_axu1.Units= 'centimeter';
h_axo1.Position= [2,1.5,10,10];
h_axu1.Position= [14.2,1.5,10,10];
% h_ax1.Units= 'centimeter';
% h_ax1.Position= [2,2,10,10];
%Y-axes limit
%h_axo.YLim = [-5,50];% for the buck mode
h_axo.YLim = [-5,50];
h_axu.YLim = [-5,400];
h_axo1.YLim = [-5,50];
h_axu1.YLim = [-5,400];
%Kräfte in beiden KS darstellen
h_vin1000=plot(h_axo,t1000,vin1000);
h_iin1000=plot(h_axo,t1000,iin1000);
h_pin1000=plot(h_axu,t1000,pin1000);

h_pin10001=plot(h_axu1,t1000,pin1000);
h_vin10001=plot(h_axo1,t1000,vin1000);
h_vout10001=plot(h_axo1,t1000,vout1000);
h_pout10001=plot(h_axu1,t1000,pout1000);

h_vin1000.LineWidth = 1.5;
h_iin1000.LineWidth = 1.5;
h_pin1000.LineWidth = 1.5;
h_vin10001.LineWidth = 1.5;
h_vout10001.LineWidth = 1.5;
h_pin10001.LineWidth = 1.5;
h_pout10001.LineWidth = 1.5;

% Axe description
h_axo.FontSize = 13;
h_axo1.FontSize = 13;
h_axu.FontSize = 13;
h_axu1.FontSize = 13;
h_xachseo = xlabel (h_axo,'Time (s)');
h_yachseo = ylabel (h_axo,'V_p_v (V),I_p_v (A)');
h_xachseo1 = xlabel (h_axo1,'Time (s)');
h_yachseo1 = ylabel (h_axo1,'V_p_v (V)');
xticks(h_axo,[ -5 0 5 ]);
xticklabels(h_axo,{'0','5','10'})
xticks(h_axu,[-5 0 5]);
xticklabels(h_axu,{'0','5','10'})
xticks(h_axo1,[-20 -15 -10 -5 0 5 10 15 20]);
xticklabels(h_axo1,{'0','5','10','15','20','25','30','35','40'})
xticks(h_axu1,[-20 -15 -10 -5 0 5 10 15 20]);
xticklabels(h_axu1,{'0','5','10','15','20','25','30','35','40'})
% Achsenbeschreibung für das rechte KS
h_xachseu = xlabel (h_axu,'Time (s)');
h_yachseu = ylabel (h_axu,'P_p_v (W)');
h_xachseu1 = xlabel (h_axu1,'Time (s)');
h_yachseu1 = ylabel (h_axu1,'Power (W)');
% Farbe und Dicke der Linien im KS verändern [Rot Grün Blau]
% h_xforce1.Color = [0, 0, 1];
% h_yforce1.Color = [ 1 0 0];
% h_xforce1.LineWidth = 2;
% h_yforce1.LineWidth = 2;

 %Legend
h_legend = legend([h_vin1000,h_iin1000],'V_p_v','I_p_v');
h_legend.Units= 'centimeter';
h_legend.Position = [10.3,10,1,1];%[x,y,length,width]
h_legend.FontSize = 13;

h_legend1 = legend([h_vin10001,h_vout10001],'V_p_v','V_o_u_t');
h_legend1.Units= 'centimeter';
h_legend1.FontSize = 13;
h_legend1.Position = [10.25,10,1,1];%[x,y,length,width]

h_legend2 = legend([h_pin1000],'P_p_v');
h_legend2.Units= 'centimeter';
h_legend2.FontSize = 13;
h_legend2.Position = [22.5,10.4,1,1];%[x,y,length,width]

h_legend3 = legend([h_pin10001,h_pout10001],'P_p_v','P_o_u_t');
h_legend3.Units= 'centimeter';
h_legend3.FontSize = 13;
h_legend3.Position = [22.4,10,1,1];%[x,y,length,width]



