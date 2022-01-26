clear; clc; close all;

%% function --- 
 z = zeros(1,n+1);
    z(1) = -sum(t,'all')/2;
    for i = 2:n+1
        z(i) = z(i-1)+t(i-1);
    end