clear;
vv = 1;

% Fiber material properties. E values in Pa
listfib = {'Boron','HMS','AS','T300','KEV','S-G','E-G'};
Ef1a = [3.999e11 3.792e11 2.137e11 2.206e11 1.517e11 8.55e10 7.31e10];
Ef2a = [3.999e11 6.205e9 1.379e10 1.379e10 4.137e9 8.55e10 7.31e10];
vf12a = [0.2 0.2 0.2 0.2 0.35 0.2 0.22];
% Matrix material properties. E values in Pa
listmat = {'LM','IMLS','IMHS','HM','Polyimide','PMR'};
Ema = [2.206e9 3.447e9 3.447e9 5.171e9 3.447e9 3.241e9];
vma = [0.43 0.41 0.35 0.35 0.35 0.36];

    if vv == 0  % no variable vf
    
    
    elseif vv == 1 % yes variable vf
        [fiber,matrix] = choosematerial;
        Ef1 = Ef1a(fiber);
        Ef2 = Ef2a(fiber);
        vf12 = vf12a(fiber);
        Em = Ema(matrix);
        vm = vma(matrix);
        f = str2double(inputdlg('Input fiber volume fraction between 0 and 1'...
        ,'Volume Fraction',1));
        if f < 0 || f > 1
            f = 0.5;
        end
        E1 = Ef1*f + Em*(1-f);
        v12 = vf12*f + vm*(1-f);
        E2 = Em*((1-sqrt(f))+(sqrt(f)/(1-(sqrt(f)*(1-(Em/Ef2))))));
%         G12 = need G for each material eq 3.47

    
    end