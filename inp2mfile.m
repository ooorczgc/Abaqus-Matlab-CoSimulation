% Now creates the 2nd text file like inputfile
clc; clear all; close all
S = mfilename('fullpath');
f = filesep;
ind=strfind(S,f);
S1=S(1:ind(end)-1);
cd(S1)
% write the constructor m file
OutputFileName = 'inp_initial.m';
fileID = fopen(OutputFileName,'wt');
fprintf(fileID,' function inp_initial(Vx,Vy,Vz)\n'); 
fprintf(fileID,' OutputFileName = ''Job-1-1.inp'';\n');
fprintf(fileID,' fileID = fopen(OutputFileName,''wt'');\n');
% Load the input file
fid = fopen('Job-1-1.inp');
C = textscan(fid,'%s','delimiter','\n');
lines=C{1,1}(:,:,:); % number of lines in the input file.
[lines useless]=size(lines);
n= '\n';
for i=1: lines
    C_line = C{1}{i}; % Reads the current line
%     line188_changed  =strrep(line188,'0.0453, 0.0453, 0.0453, 0.0453',num2str(sathh))
    fprintf(fileID,'fprintf(fileID, ''%s%s''); \n',C_line,n);
end
    
   fprintf(fileID,' fclose(fileID);\n');
   fclose(fileID);