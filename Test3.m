%% 分析时域
clear;close all;clc;

repeat_count = 1e5;

A = 1;
fs = 1e6;
data_len = 1000;

fc = fs/4;
delta_t = 1/fs;
t = (0:data_len-1).' * delta_t;

data_in = A*[ones(1,1);zeros(length(t)-1,1)];

% 时域
figure;
stem(t(1),data_in(1));
axis([0,0.0002,0,2]);
xlabel('t/s');ylabel('A');
grid on;zoom xon;

data_out = 0;
for ii = 1:repeat_count
    data_out = data_out + BlackBox(data_in);
end
data_out = abs(data_out)/repeat_count;

% 时域
loc = find(data_out>0.009);
figure;
stem(t(loc),data_out(loc));
axis([0,0.0002,0,2]);
xlabel('t/s');ylabel('A');
grid on;zoom xon;

