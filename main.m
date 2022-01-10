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
[Q,Qbar] = Qcalc(n,E1,E2,G12,v12,theta);