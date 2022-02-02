clc; clear; close all;
%%% ME 456 CLT Project Code %%%
%   Author:     Ryan Melander
%   Started:    1/6/2022
%   Completed:  --/--/----

%% Number of Plies
% n = # plies
% vv = variable volume fraction 'yes' or 'no'
[n,vv] = numplies;

%% Engineering Parameters
% E1 = modulus 1 for each layer (Pa)
% E2 = modulus 2 for each layer
% G12 = shear modulus for each layer
% v12 = major poissons ratio for each layer
% t = thickness of each layer (m)
% f = volume fraction of each layer
% theta = orientation in degrees of each layer (deg)
[E1,E2,G12,v12,t,f,theta] = eparam(n,vv);

%% Stiffness Tensors
% Q = stiffness tensor for each layer
% Qbar = stiffness tensor in global frame for each layer
[Q,Qbar,S] = Qcalc(n,E1,E2,G12,v12,theta);

disp('IMLS matrix, HMS fiber')
% disp('S ply 1')
% disp(S(:,:,1))
% disp('Boron with LM matrix')
disp('Q (GPa)')
disp(Q(:,:,1))
disp(['Qbar (GPa), rotation ',num2str(theta),' degrees'])
disp(Qbar(:,:,1))

%% Macro Stiffness Constants
% A = laminate extensional stiffnesses (Pa m)
% B = laminate coupling stiffnesses (Pa m^2)
% A = laminate bending stiffnesses (Pa m^3)
% z = 
[A,B,D,z] = macrostiffness(Qbar,t,n);
ABBD = [A B; B D];

% clc;
% disp('A (GPa mm)')
% disp(A)
% disp('B (GPa mm^2)')
% disp(B)
% disp('D (GPa mm^3)')
% disp(D)
% disp('ABBD')
% disp(ABBD)

%% Applied Forces
% [M,N] = appforces;




