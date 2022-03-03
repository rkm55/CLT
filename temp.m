
clear; clc; close all;
% temp file for testing

%% failure check testing

    sigmaT = zeros(3,n);
    sigmaB = zeros(3,n);
    epsT(:,i) = zeros(3,n);
    epsB(:,i) = zeros(3,n);
    for i = 1:n
        s = sind(theta(i));
        c = cosd(theta(i));
        T = [c^2 s^2 2*c*s; s^2 c^2 -2*c*s; -c*s c*s c^2-s^2];
        sigmaT(:,i) = T*sigmabarT(:,i);
        sigmaB(:,i) = T*sigmabarB(:,i);
        epsT(:,i) = S(3,3,i)*sigmaT(:,i);
        epsB(:,i) = S(3,3,i)*sigmaT(:,i);
    end

































