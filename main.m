clc; clear; close all;
%%% ME 456 CLT Project Code
%   Author:     Ryan Melander
%   Started:    1/6/2022
%   Last Edit:  3/24/2022

%% Number of Plies

[n,vv] = numplies;

%% Engineering Parameters

[E1,E2,G12,v12,t,f,theta,NameC,com,NameF,fib,NameM,mat] = eparam(n,vv);

%% Layer Stifnesses

[Q,Qbar,S] = Qcalc(n,E1,E2,G12,v12,theta);

%% Macro Stiffness Constants

[A,B,D,z,ABBD] = macrostiffness(Qbar,t,n);

%% Applied Forces

[NM] = appforces;

%% Stresses

[eps0,k,sigmabarT,epsbarT,sigmabarB,epsbarB] = stresses(NM,ABBD,Qbar,n,z);

%% Strength Parameters

[SLP,SLM,STP,STM,SLT] = sparam(vv,com,fib,mat,n,f,E1,E2,v12,G12);

%% Failure Check

[maxstress,maxstrain,tsai_hill] = failurecheck(theta,n,S,SLP,SLM,STP,STM,SLT,sigmabarT,sigmabarB,E1,E2,G12);

%% Ouput Results

output(n,NameM,mat,NameF,fib,E1,E2,G12,f,t,theta,maxstrain,maxstress,...
    tsai_hill,ABBD,sigmabarT,sigmabarB,NM,epsbarT,epsbarB,vv,NameC,com);

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
%% Function appforces
%
% <include>appforces.m</include>
%
% The file content above is properly syntax highlighted
%% Function stresses
%
% <include>stresses.m</include>
%
% The file content above is properly syntax highlighted
%% Function sparameters
%
% <include>sparam.m</include>
%
% The file content above is properly syntax highlighted
%% Function failurecheck
%
% <include>failurecheck.m</include>
%
% The file content above is properly syntax highlighted
%% Function output
%
% <include>output.m</include>
%
% The file content above is properly syntax highlighted