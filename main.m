clc; clear; close all;
%%% ME 456 CLT Project Code
%   Author:     Ryan Melander
%   Started:    1/6/2022
%   Last Edit:  2/6/2022

%% Number of Plies
% n = # plies
% vv = variable volume fraction 'yes' or 'no'
[n,vv] = numplies;

%% Engineering Parameters
% E1 = modulus 1 for each layer (GPa)
% E2 = modulus 2 for each layer
% G12 = shear modulus for each layer
% v12 = major poissons ratio for each layer
% t = thickness of each layer (mm)
% f = volume fraction of each layer
% theta = orientation in degrees of each layer (deg)
[E1,E2,G12,v12,t,f,theta] = eparam(n,vv);

%% Stiffness Tensors
% Q = stiffness tensor for each layer (GPa)
% Qbar = stiffness tensor in global frame for each layer
[Q,Qbar,S] = Qcalc(n,E1,E2,G12,v12,theta);

%% Macro Stiffness Constants
% A = laminate extensional stiffnesses (GPa mm)
% B = laminate coupling stiffnesses (GPa mm^2)
% A = laminate bending stiffnesses (GPa mm^3)
% z = Distances array (mm)
[A,B,D,z] = macrostiffness(Qbar,t,n);
ABBD = [A B; B D];

%% Applied Forces
% NM = MPa-mm and MPa-mm^2
[NM] = appforces;

%% Stresses
% eps0 = midplane strains
% k = midplane curvatures
% sigmabarT = stress on top of layer n (GPa)
% epsbarT = strain on top of layer n
% sigmabarB = stress on bottom of layer n (GPa)
% epsbarB = strain on bottom of layer n
[eps0,k,sigmabarT,epsbarT,sigmabarB,epsbarB] = stresses(NM,ABBD,Qbar,n,z);

%% Display Values
% disp('IMLS matrix, HMS fiber, 0.75 vf')
% disp('Q (GPa)')
% disp(Q(:,:,1))
% disp(['Qbar (GPa), rotation ',num2str(theta),' degrees'])
% disp(Qbar(:,:,1))

%% Function numplies
%
% <include>numplies.m</include>
%
% The file content above is properly syntax highlighted
%% Function eparam
%
% <include>eparam.m</include>
%
% The file content above is properly syntax highlighted
%% Function choosecomposite
%
% <include>choosecomposite.m</include>
%
% The file content above is properly syntax highlighted
%% Function choosematrix
%
% <include>choosematrix.m</include>
%
% The file content above is properly syntax highlighted
%% Function choosefiber
%
% <include>choosefiber.m</include>
%
% The file content above is properly syntax highlighted
%% Function Qcalc
%
% <include>Qcalc.m</include>
%
% The file content above is properly syntax highlighted
%% Function macrostiffness
%
% <include>macrostiffness.m</include>
%
% The file content above is properly syntax highlighted