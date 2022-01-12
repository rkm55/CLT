function [matrix] = choosematrix
% Allows user to select matrix material for all layers from 6 materials
    list = {'LM','IMLS','IMHS','HM','Polyimide','PMR'};
    [indx,tf] = listdlg('ListString',list,'PromptString',...
        'Select a matrix material for all layers','SelectionMode',...
        'single','Name','Matrix Material','ListSize',[250 100]);
    if tf == 0
        matrix = 1;
    else
        matrix = indx;
    end
end