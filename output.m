function output(ABBD)
% -----------------------------
filename = 'output_CLT.txt'; 
fid = fopen(filename,'w');
%Title
fprintf(fid,'CLT output: %s',filename);
fprintf(fid,'\tGenerated %s \r\n',date);