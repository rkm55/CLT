function [n,vv] = numplies
% Prompts user to input number of plies and then select yes or no for 
% variable volume fraction
    prompt='Input number of plies:';
    name='Number of Plies';
    numlines=1;
    definput= {'1'};
    options.Resize= 'on';
    n = str2double(inputdlg(prompt,name,numlines,definput,options));
    vvf = questdlg({'Variable volume fraction?',...
        '(Yes allows user to input volume fraction)'},...
        'Input','Yes','No','Yes');
    switch vvf
        case 'No'
            vv = 0;
        case 'Yes'
            vv = 1;
    end
end