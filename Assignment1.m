clear; close all; clc;

%Q1 

s = 30.5; %m 
v = 30.5/60; % m/s
F = 133.5; %N

%a)
W = F*s; % Nm = J

%b)
F*v; 
%%
clear; close all; clc;

%Q2 

s = 15.25; %m
t = 10; %s
v = s/t; % m/s
F = 13345; %N
eta = 0.8; %efficiency
kw2hp = 1.34102209; 

%a)
P_w = F*v/eta; %W
P_hp = P_w/1000*kw2hp;

%% 
clear; close all; clc;
d = 400e-3; %m
r = d/2;%m
A = pi*r^2; %m^2
bar2pa = 10^5;
m3s2lmin = 60000;
% CYCLE 1   
stroke1 = 225e-3; %m 
p1 = 20*bar2pa; %Pa
t1 = 5; %s
v1 = stroke1/t1; %m/s
Q1_SI = v1*A; %m^3/s
Q1 = m3s2lmin*Q1_SI;
P1 = Q1_SI*p1 % W

%Cycle 2
stroke2 = 25e-3; %m 
p2 = 350*bar2pa; %Pa
t2 = 5; %s
v2 = stroke2/t2; %m/s
Q2_SI = v2*A; %m^3/s
Q2 = m3s2lmin*Q2_SI
P2 = Q2_SI*p2 % W
P1_singlePump = Q1_SI*p2

%cycle 3; 
p3 = 350*bar2pa; %Pa
t3 = 25; %s
v3 = 0; %m/s
Q3_SI = 0; %m^3/s
Q3 = m3s2lmin*Q3_SI;
P3 = Q3_SI*p3; % W


% Work for one pump:

W_1pump = Q1_SI*p1*t1 + Q1_SI*p2*t2 + Q1_SI*p3*t3 % J

W_2pump = Q1_SI*p1*t1 + Q2_SI*p2*t2+Q2_SI*p2*t3 + Q1_SI*p1*(t2+t3) % J

W_done = Q2_SI*p2*t2 +  Q1_SI*p1*t1 ; %J

eficiency1 = W_done/W_1pump;
eficiency2 = W_done/W_2pump;


%% Task Q4
clear; close all; clc;

% Find cylinder for all operations:
bar2pa = 10^5;
m3s2lmin = 60000;
Fout = 200000; %N
Finn = 10000; %N
p1_init = (160-3-2)*bar2pa; %Max pump - filter - valve 
p2_init = (2+10)*bar2pa; % ASSUME FLOW OUT control is the "hardest" situation and needs biggest cyl
Amin = Fout/(p1_init-p2_init/2) %[N/(N/m^2)] = m^2
rmin = sqrt(Amin/pi); %m
dmin_mm = 2*rmin*1000

% CHOOSE CYLINDER OF d = 140 mmm

d = 140e-3;% m
r = d/2; % m
A1 = pi*r^2 % m^2
A2 = A1/2; %m^2 rod side area

% Retracting, equal for all cases because flowrate valve will be open
v_retract = 5/60; %m/s
Q_max_SI = v_retract*A2;
Q_max = Q_max_SI*m3s2lmin;

p1_retract = 2*bar2pa; %Pa
p2_retract = (p1_retract*A1 + Finn)/A2; % Pa
p2_retract_BAR = p2_retract/bar2pa; % Bar

%Case 1 extracting

p2_1 = 2*bar2pa;
p1_1 = (p2_1*A2 + Fout)/A1;
p1_1_bar = p1_1/bar2pa;
v1_1 = Q_max_SI/A1;
v1_1_mmin = v1_1*60;
%Efficiency
ppump1 = (p1_1_bar + 2 +3)*bar2pa; %Pa pump pressure, under 160 bar OK
Pout = Fout*v1_1;
Pinn = ppump1*Q_max_SI;
efficiency1 = Pout/Pinn

%Case 2 extracting
v2_2 = 0.5/60; %m/s 
Q2_2_SI = A1*v2_2;
Q2 = Q2_2_SI*m3s2lmin;%l/min

%Efficiency
ppump2 = (p1_1_bar + 2 +3+10)*bar2pa; % %Pa pump pressure, under 160 bar OK
Pout = Fout*v2_2;
Pinn2 = ppump2*Q_max_SI;
efficiency2 = Pout/Pinn2



%Case 3 extracting
v3_3 = 0.05/60; %m/s
Q3_3_SI = 2*v3_3*A2; 
Q3_3 = Q3_3_SI*m3s2lmin; %l/min

p2_3 = (2+10)*bar2pa; %Pa
p1_3 = (p2_3*A2 + Fout)/A1; %Pa
p1_3_bar = p1_3/bar2pa;

%Efficiency
ppump3 = (p1_1_bar + 2 +3 + 10)*bar2pa; % %Pa pump pressure, under 160 bar OK
Pout = Fout*v3_3;
Pinn3 = ppump3*Q_max_SI;
efficiency3 = Pout/Pinn3

