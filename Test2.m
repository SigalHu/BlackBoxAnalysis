%% ·ÖÎöÆµÓò
clear;close all;clc;

repeat_count = 1e2;

A = 1;
fs = 1e6;
data_len = 1e6;

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
title('ÊäÈëÐÅºÅÆµÆ×');
xlabel('f/Hz');ylabel('A');
grid on;zoom xon;

data_out = 0;
for ii = 1:repeat_count
    data_out = data_out + BlackBox(data_in);
end
data_out = data_out/repeat_count;

% ÆµÆ×
n_fft = 2^nextpow2(data_len)*10;
data_out_fft_y = fft(data_out,n_fft);
data_out_fft_y = 2/data_len*abs(data_out_fft_y(1:n_fft/2+1));
data_out_fft_x = fs/2*linspace(0,1,n_fft/2+1);

figure;
plot(data_out_fft_x,data_out_fft_y);
title('Êä³öÐÅºÅÆµÆ×');
xlabel('f/Hz');ylabel('A');
grid on;zoom xon;

data_out_fft_y(1:length(data_out_fft_y)/2) = 0;
loc = find(data_out_fft_y>0.95);
loc_tmp = loc(1);
for ii=2:length(loc)
    if loc_tmp(ii-1)+1 == loc(ii)
        loc_tmp = [loc_tmp;loc(ii)];
    else
        break;
    end
end
peaks = data_out_fft_y(loc_tmp).'
locs = data_out_fft_x(loc_tmp)

