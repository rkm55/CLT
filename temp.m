clear; clc; close all;

% temp file for testing
rng(1)
n = 4;
Qbar = 60*rand(3,3,n);
z = [-0.50, -0.250, 0, 0.250, 0.50];
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
%% function [eps0,k,sigmabarT,epsbarT,sigmabarB,epsbarB] = stresses(NM,ABBD,n,Qbar,z)
% -------------------------------------
    % Midplane strains and curvatures
    ek = (ABBD\NM).';
    % Lamina stresses and strains eq 7.61
    lamstrain = zeros(3,n);
    lamstress = zeros(3,n);
    for i = 1:n+1
        lamstrain(:,i) = [ek(1)+z(i)*ek(4); ek(2)+z(i)*ek(5); ek(3)+z(i)*ek(6)];
    end
    for i = 1:n+1       % Qbar only goes to n and z=n+1
       lamstress(:,i) = Qbar(:,:,i)*lamstrain(:,i);
    end



%     strainmat = [eps0(1,1)+z(kth)*k(1,1);...
%     eps0(2,1)+z(kth)*k(2,1);...
%     eps0(3,1)+z(kth)*k(3,1);];
%     % Stress calculation
%     stressmat = Qbar*strainmat;
%     stressmat = stressmat*1000;











