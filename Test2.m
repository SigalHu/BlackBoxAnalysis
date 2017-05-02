clear;close all;clc;

A = 1;
fs = 1e6;
data_len = 1000000;

fc = fs/4;
delta_t = 1/fs;
t = (1:data_len).' * delta_t;

data_in = A*cos(2*pi*fc*t);

% ÆµÆ×
n_fft = 2^nextpow2(data_len);
data_in_fft_y = fft(data_in,n_fft);
data_in_fft_y = 2/data_len*abs(data_in_fft_y(1:n_fft/2+1));
data_in_fft_x = fs/2*linspace(0,1,n_fft/2+1);

figure;
plot(data_in_fft_x,data_in_fft_y);
xlabel('f/Hz');ylabel('A');
grid on;zoom xon;

data_out = BlackBox(data_in);

% ÆµÆ×
n_fft = 2^nextpow2(data_len)*10;
data_out_fft_y = fft(data_out,n_fft);
data_out_fft_y = 2/data_len*abs(data_out_fft_y(1:n_fft/2+1));
data_out_fft_x = fs/2*linspace(0,1,n_fft/2+1);

figure;
plot(data_out_fft_x,data_out_fft_y);
xlabel('f/Hz');ylabel('A');
grid on;zoom xon;

