function [maxstress,maxstrain,tsai_hill]=failurecheck(theta,n,S,SLP,SLM,STP,STM,SLT,sigmabarT,sigmabarB,E1,E2,G12)
% -------------------------
    % Rotate stresses into principal frame
    sigmaT = zeros(3,n);
    sigmaB = zeros(3,n);
    epsT = zeros(3,n);
    epsB = zeros(3,n);
    for i = 1:n
        s = sind(theta(i));
        c = cosd(theta(i));
        T = [c^2 s^2 2*c*s; s^2 c^2 -2*c*s; -c*s c*s c^2-s^2];
        sigmaT(:,i) = T*sigmabarT(:,i);
        sigmaB(:,i) = T*sigmabarB(:,i);
        epsT(:,i) = S(3,3,i)*sigmaT(:,i);
        epsB(:,i) = S(3,3,i)*sigmaT(:,i);
    end
    % Max Stress
    maxstress = zeros(3,n);
    for i = 1:n
        if -SLM(i) > sigmaT(1,i) || sigmaT(1,i) > SLP(i) || -SLM(i) > sigmaB(1,i) || sigmaB(1,i) > SLP(i)
            maxstress(1,i) = 1;
        elseif -STM(i) > sigmaT(2,i) || sigmaT(2,i) > STP(i) || -STM(i) > sigmaB(2,i) || sigmaB(2,i) > STP(i)
            maxstress(2,i) = 1;
        elseif abs(sigmaT(3,i)) > SLT(i) || abs(sigmaB(3,i)) > SLT(i) 
            maxstress(3,i) = 1;
        end
    end
    % Max Strain
    maxstrain = zeros(3,n);
    for i = 1:n
        eLP = SLP(i)/E1(i);
        eTP = STP(i)/E2(i);
        eLM = SLM(i)/E1(i);
        eTM = STM(i)/E2(i);
        eLT = SLT(i)/G12(i);
        if -eLM > epsT(1,i) || eLP < epsT(1,i) || -eLM > epsB(1,i) || eLP < epsB(1,i)
            maxstrain(1,i) = 1;
        elseif -eTM > epsT(2,i) || eTP < epsT(2,i) || -eTM > epsB(2,i) || eTP < epsB(2,i)
            maxstrain(2,i) = 1;
        elseif abs(epsT(3,i)) > eLT || abs(epsB(3,i)) > eLT
            maxstrain(3,i) = 1;
        end
    end
    % Tsai-Hill
    tsai_hill = zeros(1,n);
    SL = 1; ST = 1; % For cases of zeros stress
    for i = 1:n
        % set SL and ST for tension of compression
        if sign(sigmaT(1,i)) > 1
            SL = SLP(i);
        elseif sign(sigmaT(1,i)) < 1
            SL = SLM(i);
        elseif sign(sigmaT(2,i)) > 1
            ST = STP(i);
        elseif sign(sigmaT(2,i)) < 1
            ST = STM(i);
        end
        top = (sigmaT(1,i)^2)/(SL^2) - (sigmaT(1,i)*sigmaT(2,i))/(SL^2) + (sigmaT(2,i)^2)/(ST^2) + (sigmaT(3,i)^2)/(SLT(i)^2);
        % set SL and ST for tension of compression
        if sign(sigmaB(1,i)) > 1
            SL = SLP(i);
        elseif sign(sigmaB(1,i)) < 1
            SL = SLM(i);
        elseif sign(sigmaB(2,i)) > 1
            ST = STP(i);
        elseif sign(sigmaB(2,i)) < 1
            ST = STM(i);
        end
        bottom = (sigmaB(1,i)^2)/(SL^2) - (sigmaB(1,i)*sigmaB(2,i))/(SL^2) + (sigmaB(2,i)^2)/(ST^2) + (sigmaB(3,i)^2)/(SLT(i)^2);
        % check for failure
        if top >= 1 || bottom >= 1
            tsai_hill(i) = 1;
        end
    end
end