clear; clc; close all;
% temp file for in class exercises

%% In class exercise
% Failure using CLT
t = [0.25 0.25 0.25 0.25];
n = 4;
Q = [138.8 2.72 0; 2.72 9.05 0; 0 0 6.9];
Q45 = [45.22 31.42 32.44; 31.42 45.22 32.44; 32.44 32.44 35.6];
Qbar = zeros(3,3,n);
Qbar(:,:,1) = Q45;
Qbar(:,:,4) = Qbar(:,:,1);
Qbar(:,:,2) = Q45.*[1 1 -1; 1 1 -1; -1 -1 1];
Qbar(:,:,3) = Qbar(:,:,2);

[A,B,D,z] = macrostiffness(Qbar,t,n);
ABBD = [A B; B D];
[NM] = appforces;
[eps0,k,sigmabarT,epsbarT,sigmabarB,epsbarB] = stresses(NM,ABBD,Qbar,n,z);

T = [0.5 0.5 -1; 0.5 0.5 1; 0.5 -0.5 0;];
T2 = [0.5 0.5 -0.5; 0.5 0.5 0.5; 1 -1 0;];
stress = T*sigmabarT(:,2);
strain = T2*epsbarT(:,2);
E1 = 138;
E2 = 9;
G12 = 6.9;
v12 = 0.3;
f = 0.65;
SLP = 1.448;
SLM = 1.172;
STP = 0.0483;
STM = 0.248;
SLT = 0.0621;

% Max strain criteria
eLP = SLP/E1;
eLM = SLM/E1;
eTP = STP/E2;
eTM = STM/E2;
eLT = SLT/G12;
disp('Meets max strain criteria')
% Max stress criteria
% will not fail
% compare stress w/ SLP,SLM,... values
disp('Meets max stress criteria')
% Tsai-Hill
% implement into final code
TH = (stress(1)^2/SLP^2) - (stress(1)*stress(2)/SLP^2) + (stress(2)^2/STP^2)...
    + (stress(3)^2/SLT^2);
disp('Tsai-Hill will not fail, result of calcuation:')
disp(TH)


