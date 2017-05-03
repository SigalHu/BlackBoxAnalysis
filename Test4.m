%% 分析噪声
clear;close all;clc;

A = 1;
fs=1e6;
data_len = 1e6;

delta_t = 1/fs;
t = (0:data_len-1).' * delta_t;

data_in = A*zeros(length(t),1);

data_out = BlackBox(data_in);

% hu 画噪声实部的概率密度分布
data_out_I = real(data_out);

data_out_I_mu = mean(data_out_I)
data_out_I_sigma_2 = mean((data_out_I-data_out_I_mu).^2)

end_r = max(abs(data_out_I));
deta_r = end_r/200;
r = -1*end_r:deta_r:end_r;

pdf_stat = hist(data_out_I.',r).';

figure;
plot(r,1/sqrt(2*pi*data_out_I_sigma_2)*gaussmf(r,[sqrt(data_out_I_sigma_2),data_out_I_mu]),'b-');
hold on;
plot(r(1:3:end),pdf_stat(1:3:end)/(length(data_out_I)*deta_r),'b*');
legend('理论值','仿真值');
title('输出信号实部概率密度分布');
xlabel('r');ylabel('f(r)');
zoom xon;grid on;

% hu 画噪声虚部的概率密度分布
data_out_Q = imag(data_out);

data_out_Q_mu = mean(data_out_Q)
data_out_Q_sigma_2 = mean((data_out_Q-data_out_Q_mu).^2)

end_r = max(abs(data_out_Q));
deta_r = end_r/200;
r = -1*end_r:deta_r:end_r;

pdf_stat = hist(data_out_Q.',r).';

figure;
plot(r,1/sqrt(2*pi*data_out_Q_sigma_2)*gaussmf(r,[sqrt(data_out_Q_sigma_2),data_out_Q_mu]),'b-');
hold on;
plot(r(1:3:end),pdf_stat(1:3:end)/(length(data_out_Q)*deta_r),'b*');
legend('理论值','仿真值');
title('输出信号虚部概率密度分布');
xlabel('r');ylabel('f(r)');
zoom xon;grid on;

% hu 画噪声的概率密度分布
data_out_p = mean(abs(data_out).^2)
data_out_abs = abs(data_out);

data_out_abs_sigma_2 = (data_out_I_sigma_2+data_out_Q_sigma_2)/2

end_r = max(data_out_abs);
deta_r = end_r/200;
r = 0:deta_r:end_r;

pdf_stat = hist(data_out_abs.',r).';

figure;
plot(r,raylpdf(r,sqrt(data_out_abs_sigma_2)),'b-');
hold on;
plot(r(1:3:end),pdf_stat(1:3:end)/(length(data_out_abs)*deta_r),'b*');
legend('理论值','仿真值');
title('输出信号幅值概率密度分布');
xlabel('r');ylabel('f(r)');
zoom xon;grid on;
