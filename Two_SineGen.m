clc;
clear all;
close all;

%%Time specifications:
Fs = 2048;                   % samples per second
dt = 1/Fs;                   % seconds per sample
StopTime = 1;%0.25;             % seconds
t = (0:dt:StopTime-dt)';     % seconds
%%Sine wave:
Fc0 = 100;                     % hertz
% get sin value, in range 0.0-1.0 and convert from float to int, range from 0-0xFF 
x = int64(Fs * ((cos(2*pi*Fc0*t)+ 1.0000)/ 2.0000)) ; 

% Plot the signal versus time:
figure;
plot(t,x);
xlabel('time (in seconds)');
title('Signal versus Time');
%zoom xon;

%%Sine wave:
Fc1 = 5;                     % hertz
x2 = int64(Fs * ((cos(2*pi*Fc1*t)+ 1.0000)/ 2.0000)) ; 

% Plot the signal versus time:
figure;
plot(t,x2);
xlabel('time (in seconds)');
title('Signal versus Time');

fileID = fopen('sine0_2048.mem','w');
fprintf(fileID,'%x \n',x); % Line by line
%fprintf(fileID,'%x ',ivalue);%space between values
fclose(fileID);

fileID = fopen('sine1_2048.mem','w');
fprintf(fileID,'%x \n',x2); % Line by line
%fprintf(fileID,'%x ',ivalue);%space between values
fclose(fileID);
