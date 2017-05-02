clear;close all;clc;

repeat_count = 1e5;

A = 1;
fc = 6e2;
data_len = 1000;

fs = 4*fc;
delta_t = 1/fs;
t = (0:data_len-1).' * delta_t;

data_in = A*[ones(1,1);zeros(length(t)-1,1)];

% Ê±Óò
figure;
plot(t,data_in);
xlabel('t/s');ylabel('A');
grid on;zoom xon;

data_out = 0;
for ii = 1:repeat_count
    data_out = data_out + BlackBox(data_in);
end
data_out = abs(data_out)/repeat_count;

% ÆµÆ×
figure;
plot(t,data_out(1:length(t)));
xlabel('t/s');ylabel('A');
grid on;zoom xon;

