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
    ek = (ABBD\NM);
    eps0 = ek(1:3);
    k = ek(4:6);
    % Lamina stresses and strains eq 7.61
    strain = zeros(3,n+1);
    % Strain array between all layers
    for i = 1:n+1
        strain(:,i) = [eps0(1)+z(i)*k(1); eps0(2)+z(i)*k(2); eps0(3)+z(i)*k(3)];
    end
    % Strains top and bottom of each layer
    epsbarT = strain(:,1:n);
    epsbarB = strain(:,2:n+1);
    % Stresses top and bottom of each layer
    sigmabarT = zeros(3,n);
    sigmabarB = zeros(3,n);
    for i = 1:n
       sigmabarT(:,i) = Qbar(:,:,i)*epsbarT(:,i);
       sigmabarB(:,i) = Qbar(:,:,i)*epsbarB(:,i);
    end










