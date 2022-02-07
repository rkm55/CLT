function [eps0,k,sigmabarT,epsbarT,sigmabarB,epsbarB] = stresses(NM,ABBD)
% -------------------------------------
    % Midplane strains and curvatures
    ek = ABBD\NM;
    eps0 = [ek(1,1); ek(2,1); ek(3,1)];
    k = [ek(4,1); ek(5,1); ek(6,1)];
    % Lamina stresses and strains eq 7.61