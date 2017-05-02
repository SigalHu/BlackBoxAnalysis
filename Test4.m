clear;close all;clc;

A = 1;
fs=1e6;
data_len = 1e7;

delta_t = 1/fs;
t = (0:data_len-1).' * delta_t;

data_in = A*zeros(length(t),1);

data_out = BlackBox(data_in);

data_out_p = mean(abs(data_out).^2)

% 时域
figure;
plot(t,abs(data_out(1:length(t))));
xlabel('t/s');ylabel('A');
grid on;zoom xon;

% 频谱
n_fft = 2^nextpow2(data_len)*10;
data_out_fft_y = fft(data_out,n_fft);
data_out_fft_y = 2/data_len*abs(data_out_fft_y(1:n_fft/2+1));
data_out_fft_x = fs/2*linspace(0,1,n_fft/2+1);

figure;
plot(data_out_fft_x,data_out_fft_y);
xlabel('f/Hz');ylabel('A');
grid on;zoom xon;

% hu 画图
data_out_abs = abs(data_out);
end_r = max(data_out_abs);
deta_r = end_r/200;
r = 0:deta_r:end_r;

pdf_stat = hist(data_out_abs.',r).';

figure;
plot(r,pdf_stat/(length(data_out_abs)*deta_r),'b*');
xlabel('r');ylabel('f(r)');
zoom xon;grid on;

% 实部
data_out_I = real(data_out);
end_r = max(abs(data_out_I));
deta_r = end_r/200;
r = -1*end_r:deta_r:end_r;

pdf_stat = hist(data_out_I.',r).';

figure;
plot(r,pdf_stat/(length(data_out_I)*deta_r),'b*');
xlabel('r');ylabel('f(r)');
zoom xon;grid on;

% 虚部
data_out_Q = imag(data_out);
end_r = max(abs(data_out_Q));
deta_r = end_r/200;
r = -1*end_r:deta_r:end_r;

pdf_stat = hist(data_out_Q.',r).';

figure;
plot(r,pdf_stat/(length(data_out_Q)*deta_r),'b*');
xlabel('r');ylabel('f(r)');
zoom xon;grid on;

