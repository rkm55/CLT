function [fiber,matrix] = choosematerial(i)
% Allows user to select laminate materials from 7 different fibers and
% 6 different matrix materials
    list = {'Boron','HMS','AS','T300','KEV','S-Glass','E-Glass'};
    [indx,tf] = listdlg('ListString',list,'PromptString',...
        ['Select a fiber material for layer ',num2str(i)],'SelectionMode',...
        'single','Name','Fiber Material','ListSize',[250 100]);
    if tf == 0
        fiber = 1;
    else
        fiber = indx;
    end
    list = {'LM','IMLS','IMHS','HM','Polyimide','PMR'};
    [indx,tf] = listdlg('ListString',list,'PromptString',...
        ['Select a matrix material for layer ',num2str(i)],'SelectionMode',...
        'single','Name','Matrix Material','ListSize',[250 100]);
    if tf == 0
        matrix = 1;
    else
        matrix = indx;
    end
end