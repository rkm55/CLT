function [A,B,D,z] = macrostiffness(Qbar,t,n)
% A,B,D macrostiffness matrix calculations (eqns: 7.41, 7.42, 7.43)
    % Distances z (mm)
    z = zeros(1,n+1);
    z(1) = -sum(t,'all')/2;
    for i = 2:n+1
        z(i) = z(i-1) + t(i-1);
    end
    % Initialize A,B,D matrices
    A = zeros(3);
    B = zeros(3);
    D = zeros(3);
    for i = 1:n
        % A (laminate extensional stiffness) (GPa mm)
        A(1,1) = Qbar(1,1,i)*(z(i+1)-z(i)) + A(1,1);
        A(1,2) = Qbar(1,2,i)*(z(i+1)-z(i)) + A(1,2);
        A(1,3) = Qbar(1,3,i)*(z(i+1)-z(i)) + A(1,3);
        A(2,1) = Qbar(2,1,i)*(z(i+1)-z(i)) + A(2,1);
        A(2,2) = Qbar(2,2,i)*(z(i+1)-z(i)) + A(2,2);
        A(2,3) = Qbar(2,3,i)*(z(i+1)-z(i)) + A(2,3);
        A(3,1) = Qbar(3,1,i)*(z(i+1)-z(i)) + A(3,1);
        A(3,2) = Qbar(3,2,i)*(z(i+1)-z(i)) + A(3,2);
        A(3,3) = Qbar(3,3,i)*(z(i+1)-z(i)) + A(3,3);
        % B (laminate coupling stiffnesses) (GPa mm^2)
        B(1,1) = Qbar(1,1,i)*(z(i+1)^2-z(i)^2) + B(1,1);
        B(1,2) = Qbar(1,2,i)*(z(i+1)^2-z(i)^2) + B(1,2);
        B(1,3) = Qbar(1,3,i)*(z(i+1)^2-z(i)^2) + B(1,3);
        B(2,1) = Qbar(2,1,i)*(z(i+1)^2-z(i)^2) + B(2,1);
        B(2,2) = Qbar(2,2,i)*(z(i+1)^2-z(i)^2) + B(2,2);
        B(2,3) = Qbar(2,3,i)*(z(i+1)^2-z(i)^2) + B(2,3);
        B(3,1) = Qbar(3,1,i)*(z(i+1)^2-z(i)^2) + B(3,1);
        B(3,2) = Qbar(3,2,i)*(z(i+1)^2-z(i)^2) + B(3,2);
        B(3,3) = Qbar(3,3,i)*(z(i+1)^2-z(i)^2) + B(3,3);
        % D (laminate bending stiffnesses) (GPa mm^3)
        D(1,1) = Qbar(1,1,i)*(z(i+1)^3-z(i)^3) + D(1,1);
        D(1,2) = Qbar(1,2,i)*(z(i+1)^3-z(i)^3) + D(1,2);
        D(1,3) = Qbar(1,3,i)*(z(i+1)^3-z(i)^3) + D(1,3);
        D(2,1) = Qbar(2,1,i)*(z(i+1)^3-z(i)^3) + D(2,1);
        D(2,2) = Qbar(2,2,i)*(z(i+1)^3-z(i)^3) + D(2,2);
        D(2,3) = Qbar(2,3,i)*(z(i+1)^3-z(i)^3) + D(2,3);
        D(3,1) = Qbar(3,1,i)*(z(i+1)^3-z(i)^3) + D(3,1);
        D(3,2) = Qbar(3,2,i)*(z(i+1)^3-z(i)^3) + D(3,2);
        D(3,3) = Qbar(3,3,i)*(z(i+1)^3-z(i)^3) + D(3,3); 
    end
    % Constants after summation (eqns: 7.42, 7.43)
    B = B/2;
    D = D/3;
end