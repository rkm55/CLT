clc; clear; close all;
%%% ME 456 CLT Project Code %%%
%   Author:     Ryan Melander
%   Started:    1/6/2022
%   Completed:  --/--/----

%% Number of Plies
[n,vv] = numplies;

%% Engineering Parameters
[E1,E2,G12,v12,t,f,theta] = eparam(n,vv);
