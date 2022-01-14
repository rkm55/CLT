function [Q,Qbar] = Qcalc(n,E1,E2,G12,v12,theta)
% Preallocate matrices
    Q = zeros(3,3,n);
    Qbar = zeros(3,3,n);
    for i = 1:n
        % Compliance value calculations
        S11 = 1/E1(i);
        S22 = 1/E2(i);
        S12 = -v12(i)/E1(i);
        S66 = 1/G12(i);
        % Stiffness value calculations, fill Q matrix
        Q(1,1,i) = S22/(S11*S22 - S12^2);
        Q(1,2,i) = -S12/(S11*S22 - S12^2);
        Q(2,1,i) = Q(1,2,i);
        Q(2,2,i) = S11/(S11*S22 - S12^2);
        Q(3,3,i) = 1/S66;
        % Transformation matrix calculations
        s = sind(theta(i));
        c = cosd(theta(i));
        T = [c^2 s^2 2*c*s; s^2 c^2 -2*c*s; -c*s c*s c^2-s^2];
        T2 = [T(1,1) T(1,2) T(1,3)/2;...
            T(2,1) T(2,2) T(2,3)/2; 2*T(3,1) 2*T(3,2) T(3,3)];
        % Qbar calculations: inv(T)*Q*T2
        Qbar(:,:,i) = T\Q(:,:,i)*T2;
    end
end