function [eps0,k,sigmabarT,epsbarT,sigmabarB,epsbarB] = stresses(NM,ABBD,Qbar,n,z)
% Calculates midplane strains and curvatures, and stresses and strains on
% the top and bottom of each layer. For example:
% sigmabarT(:,1) = stress on top of layer 1
% sigmabarB(:,1) = stress on bottom of layer 1
    % Midplane strains and curvatures
    ek = ABBD\NM;
    eps0 = ek(1:3);
    k = ek(4:6);
    % Lamina stresses and strains
    strain = zeros(3,n+1);
    % Strain array between all layers
    for i = 1:n+1
        strain(:,i) = [eps0(1)+z(i)*k(1); eps0(2)+z(i)*k(2); eps0(3)+z(i)*k(3)];
    end
    % Strains top and bottom of each layer
    epsbarT = strain(:,1:n);
    epsbarB = strain(:,2:n+1);
    % Stresses top and bottom of each layer eq. 7.34, 7.61 (GPa)
    sigmabarT = zeros(3,n);
    sigmabarB = zeros(3,n);
    for i = 1:n
       sigmabarT(:,i) = Qbar(:,:,i)*epsbarT(:,i);
       sigmabarB(:,i) = Qbar(:,:,i)*epsbarB(:,i);
    end
end