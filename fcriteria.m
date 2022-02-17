function [FC] = fcriteria
% Allows user to select a failure criteria 
    list = {'Max Stress','Max Strain','Tsai-Hill'};
    [indx,tf] = listdlg('ListString',list,'PromptString',...
        'Select which criteria will determine failure:','SelectionMode',...
        'single','Name','Failure Criteria','ListSize',[250 100]);
    if tf == 0
        FC = 3;
    else
        FC = indx;
    end
end