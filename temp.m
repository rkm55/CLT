clear; clc; close all;
% temp file for testing

%% Hw 7.1c
Ef = 127e9;
Iyy = 1.667e-12;
% Tension side
sigmaxt = [1700 40 1700 40]*1e6;
Ext = [180 10 180 10]*1e9;
zt = 0.5:-0.125:0.125;
zt = zt*1e-3;
% Compression side
sigmaxc = [-1400 -230 -1400 -230]*1e6;
Exc = [180 10 180 10]*1e9;
zc = 0.5:-0.125:0.125;
zc = zc*-1e-3;
% Max moments for tension and compression by layer
Mt = Ef*Iyy*(sigmaxt./(Ext.*zt));
Mc = Ef*Iyy*(sigmaxc./(Exc.*zc));
M = [Mt flip(Mc)];
disp(' ')
disp('Max moment per layer (Nm)')
disp(' ')
disp('Considers top 4 layers in tension,')
disp('bottom 4 in compression ')
disp(' ')
disp(round(M,2));































