clear; clc; close all;

% temp file for testing
NM=[0.020000000000000;0.010000000000000;-1.000000000000000e-03;1.000000000000000e-03;-1.000000000000000e-04;-1.000000000000000e-03];
% A=[74.433750633186200,2.715826036616253,0;2.715826036616253,74.433750633186200,0;0,0,6.900000000000000];
% B=[0,0,0;0,0,0;0,0,0];
% D=[10.289124876377933,0.226318836384688,0;0.226318836384688,2.116500229153098,0;0,0,0.575000000000000];
ABBD=[74.4337506331862 2.71582603661625	0 0 0 0;...
    2.71582603661625 74.4337506331862 0 0 0	0;...
    0 0 6.90000000000000 0 0 0;...
    0 0 0 10.2891248763779 0.226318836384688 0;...
    0 0 0 0.226318836384688 2.11650022915310 0;...
    0 0 0 0 0 0.575000000000000];
%% function [eps0,k,sigmabarT,epsbarT,sigmabarB,epsbarB] = stresses(NM,ABBD)
% -------------------------------------
    % Midplane strains and curvatures
    ek = ABBD\NM;
    eps0 = [ek(1,1); ek(2,1); ek(3,1)];
    k = [ek(4,1); ek(5,1); ek(6,1)];












