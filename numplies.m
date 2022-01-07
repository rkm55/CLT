function [n,vv] = numplies
% Prompts user to input number of plies and then select yes or no for 
% variable volume fraction
    prompt='Input number of plies:';
    name='Number of Plies';
    numlines=1;
    n = str2double(inputdlg(prompt,name,numlines));
    vvf = questdlg('Variable volume fraction?','Input','Yes','No','No');
    switch vvf
        case 'No'
            vv = 0;
        case 'Yes'
            vv = 1;
    end