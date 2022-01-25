function [A,B,D] = macrostiffness(Qbar,t,n)
% A,B,D macrostiffness matrix calculations following the criteria for 
% generally orthotropic laminates (eq. 7.47)
    % A (laminate extensional stiffness) (Pa m)
    A = zeros(3);
    for i=1:n
        A(1,1) = Qbar(1,1,i)*t(i) + A(1,1);
        A(1,2) = Qbar(1,2,i)*t(i) + A(1,2);
        A(2,2) = Qbar(2,2,i)*t(i) + A(2,2);
        A(3,3) = Qbar(3,3,i)*t(i) + A(3,3);
        A(1,3) = Qbar(1,3,i)*t(i) + A(1,3);
        A(2,3) = Qbar(2,3,i)*t(i) + A(2,3);
    end
    A(2,1) = A(1,2);
    % B (laminate coupling stiffnesses) (Pa m^2)
    B = zeros(3);   % All B(i,j) = 0
    % A (laminate bending stiffnesses) (Pa m^3)
    D = zeros(3);
    for i=1:n
        D(1,1) = (1/12)*Qbar(1,1,i)*t(i)^3 + D(1,1);
        D(1,2) = (1/12)*Qbar(1,2,i)*t(i)^3 + D(1,2);
        D(2,2) = (1/12)*Qbar(2,2,i)*t(i)^3 + D(2,2);
        D(3,3) = (1/12)*Qbar(3,3,i)*t(i)^3 + D(3,3);
        D(1,3) = (1/12)*Qbar(1,3,i)*t(i)^3 + D(1,3);
        D(2,3) = (1/12)*Qbar(2,3,i)*t(i)^3 + D(2,3);
    end
    D(2,1) = D(1,2);
end