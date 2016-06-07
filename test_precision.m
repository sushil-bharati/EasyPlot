%This m file is created by Mr. Sushil Pratap Bharati on May 6, 2016 to 
%plot precision curve for tracking algorithm. 
% Input are two text files and the text format is x1,y1,x2,y2(starting from 
% top left corner of the bounding box)
clear;
A=[]; B =[];
fileID1 = fopen('output_skater_KCFonly.txt','r'); %output file
fileID2 = fopen('skater_160_truth.txt','r'); %ground truth file
tline1 = fgetl(fileID1);
tline2 = fgetl(fileID2);
while (ischar(tline1))
    C1 = textscan (tline1,'%d,%d,%d,%d');
    C2 = textscan (tline2,'%d,%d,%d,%d');
    M1 = double (C1{1}) + ((double(C1{3}) - double(C1{1}))/2.0);
    N1 = double (C1{2}) + ((double(C1{4}) - double(C1{2}))/2.0);
    M2 = double (C2{1}) + ((double(C2{3}) - double(C2{1}))/2.0);
    N2 = double (C2{2}) + ((double(C2{4}) - double(C2{2}))/2.0);
    Z1 = [M1 N1];
    Z2 = [M2 N2];
    A = vertcat (A,Z1);  
    B = vertcat (B,Z2);
    tline1 = fgetl(fileID1);
    tline2 = fgetl(fileID2);
end
clearvars -except A B;
precision_plots(A,B,1);
