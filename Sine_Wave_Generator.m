clc;
clear all;
close all;
% The design can be modified for efficient use of memory. 
% In that way, only the first (pi/2) values need to be stored in the ROM. 
% That means the memory usage is reduced by a factor of 4. 

mem_len = 2048;
ivalue= [];

for i=1:mem_len
        radians = pi * 2.0 * i / mem_len; % get how far through the file we are, convert to radians
        fvalue = (sin(radians) + 1.0000) / 2.0000; % get sin value, in range 0.0-1.0
	    ivalue =[ivalue  int32(mem_len * fvalue)]; % convert from float to int, range from 0-0xFF
       
end
 s = dec2hex(ivalue)% convert int calue to hexadecimal string and strip the leading ""

figure;
plot(ivalue)

fileID = fopen('sine2048.hex','w');
fprintf(fileID,'%x \n',ivalue); % Line by line
%fprintf(fileID,'%x ',ivalue);%space between values
fclose(fileID);

Sine0=[];
Sine1=[];
index=1;
% m=3;% represend the frequency divisor
% for i=1:mem_len
%         Sine0 = [Sine0 ivalue(i)]; % get sin value, in range 0.0-1.0
%         if mod(i, m) == 0
%             Sine1 = [Sine1 ivalue(index)]; 
%             index = index +1;
%         else
%             Sine1 = [Sine1 ivalue(index)];
%         end
%        
% end

N=100;% represend the frequency multiplier
for i=1:mem_len
    Sine0 = [Sine0 ivalue(i)]; % get sin value, in range 0.0-1.0     
    if (index >= mem_len) %|| (index > mem_len)
        index =1;
    else   
        Sine1 = [Sine1 ivalue(index)]; 
        index = index +N;
    end
end
figure;
plot(Sine0)
figure;
plot(Sine1)

% t_20=0 : pi/10 : 2*pi ;  % for 20 sample values. -- 20 Samples
% t_100=0 : pi/50 : 2*pi ;  % for 100 sample values. 100 Samples
% 
% 
% sine_20_128 = int32(sin(t_20)*10000/128)  %128 for 8 bit output.
% sine_100_128 = int32(sin(t_100)*10000/128)  %128 for 8 bit output.
% 
% sine_20_256 = int32(sin(t_20)*10000/512)  %512 for 6 bit output etc...
% sine_100_256 = int32(sin(t_100)*10000/512)  %512 for 6 bit output etc...
% 
% figure;
% stem(sine_20_128)
% hold on
% stem(sine_100_128)
% stem(sine_20_256)
% stem(sine_100_256)

