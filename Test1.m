clear;close all;clc;

data_in_power_usrconfig = 0.02;
data_in_len = 10000000;

data_in = rand(data_in_len,1) + 1i*rand(data_in_len,1);

data_in_power = mean(abs(data_in).^2);
data_in = data_in/(sqrt(data_in_power/data_in_power_usrconfig));
data_in_power = mean(abs(data_in).^2)

data_out = BlackBox(data_in);
data_out_power = mean(abs(data_out).^2)

power_calc = 5.37*data_in_power+0.1