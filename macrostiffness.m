function [A,B,D,z] = macrostiffness(Qbar,t,n)
% A,B,D macrostiffness matrix calculations (eqns: 7.41, 7.42, 7.43)
    % Distances z (mm)
    z = zeros(1,n+1);
    z(1) = -sum(t,'all')/2;
    for i = 1:n
        z(i+1) = z(i) + t(i);
    end
    % Initialize A,B,D matrices
    A = zeros(3);
    B = zeros(3);
    D = zeros(3);
    for i = 1:n
        for r = 1:3
            for c = 1:3
                % A (laminate extensional stiffness) (GPa mm)
                A(r,c) = Qbar(r,c,i)*(z(i+1)-z(i)) + A(r,c);
                % B (laminate coupling stiffnesses) (GPa mm^2)
                B(r,c) = ((1/2)*Qbar(r,c,i)*(z(i+1)^2-z(i)^2)) + B(r,c);
                % D (laminate bending stiffnesses) (GPa mm^3)
                D(r,c) = ((1/3)*Qbar(r,c,i)*(z(i+1)^3-z(i)^3)) + D(r,c);
            end
        end
    end
end