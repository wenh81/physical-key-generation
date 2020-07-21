clc;
clear;

addpath('E:\Github\physical-key-generation\MIToolbox-master\matlab');

% modulation methods: BPSK, QPSK,16QAM, 32QAM,64QAM
mod_method = 'QPSK';
% calculate modulation order from modulation method
mod_methods = {'BPSK', 'QPSK','8PSK','16QAM', '32QAM','64QAM'};
mod_order = find(ismember(mod_methods, mod_method));

%%
% nfft = 64, K =1
n_fft = 64;
n_cp = n_fft/4;    % size of cyclic prefix extension
n_ofdm = n_fft + n_cp;
K=1;
c_flag = 1;
% generate the data 
rand_ints_gen = randi(2,n_fft*mod_order*K,1)-1;
save data_input.txt -ascii rand_ints_gen
rand_ints = load("data_input.txt");
data_ofdm = ofdm_module(rand_ints, mod_method, n_fft, n_cp, c_flag);

snr = 10:3:40;
for i = 1:length(snr)
	for j = 1:10000
        [v1(j,i),v2(j,i)] = mi_snr(data_ofdm, n_ofdm,n_cp, K, snr(i));
    end
end

mean_v1 = repmat(mean(v1), 10000,1);
mean_v2 = repmat(mean(v2), 10000,1);

v1_bit = double(v1>= mean_v1);
v2_bit = double(v2>= mean_v2);

for i = 1:length(snr)
    mi_bit(i) = mi(v1_bit(:,i),v2_bit(:,i));
end

v1_164 = v1;
v2_164 = v2;

v1_bit_164 = v1_bit;
v2_bit_164 = v2_bit;
mi_bit_164 = mi_bit;

%%
% nfft = 64, K =3
n_fft = 64;
n_cp = n_fft/4;    % size of cyclic prefix extension
n_ofdm = n_fft + n_cp;
K = 3;
c_flag = 1;
% generate the data 
rand_ints_gen = randi(2,n_fft*mod_order*K,1)-1;
save data_input.txt -ascii rand_ints_gen
rand_ints = load("data_input.txt");
data_ofdm = ofdm_module(rand_ints, mod_method, n_fft, n_cp, c_flag);

snr = 20:3:50;
for i = 1:length(snr)
	for j = 1:10000
        [v1(j,i),v2(j,i)] = mi_snr(data_ofdm, n_ofdm,n_cp, K, snr(i));
    end
end

mean_v1 = repmat(mean(v1), 10000,1);
mean_v2 = repmat(mean(v2), 10000,1);

v1_bit = double(v1>= mean_v1);
v2_bit = double(v2>= mean_v2);

for i = 1:length(snr)
    mi_bit(i) = mi(v1_bit(:,i),v2_bit(:,i));
end

v1_364 = v1;
v2_364 = v2;

v1_bit_364 = v1_bit;
v2_bit_364 = v2_bit;
mi_bit_364 = mi_bit;

%%
% nfft = 256, K =1
n_fft = 256;
n_cp = n_fft/4;    % size of cyclic prefix extension
n_ofdm = n_fft + n_cp;
K=1;
c_flag = 1;
% generate the data 
rand_ints_gen = randi(2,n_fft*mod_order*K,1)-1;
save data_input.txt -ascii rand_ints_gen
rand_ints = load("data_input.txt");
data_ofdm = ofdm_module(rand_ints, mod_method, n_fft, n_cp, c_flag);

snr = 20:3:50;
for i = 1:length(snr)
	for j = 1:10000
        [v1(j,i),v2(j,i)] = mi_snr(data_ofdm, n_ofdm,n_cp, K, snr(i));
    end
end

mean_v1 = repmat(mean(v1), 10000,1);
mean_v2 = repmat(mean(v2), 10000,1);

v1_bit = double(v1>= mean_v1);
v2_bit = double(v2>= mean_v2);

for i = 1:length(snr)
    mi_bit(i) = mi(v1_bit(:,i),v2_bit(:,i));
end

v1_1256 = v1;
v2_1256 = v2;

v1_bit_1256 = v1_bit;
v2_bit_164 = v2_bit;
mi_bit_1256 = mi_bit;

%%
% nfft = 256, K =3
n_fft = 256;
n_cp = n_fft/4;    % size of cyclic prefix extension
n_ofdm = n_fft + n_cp;
K=3;
c_flag = 1;
% generate the data 
rand_ints_gen = randi(2,n_fft*mod_order*K,1)-1;
save data_input.txt -ascii rand_ints_gen
rand_ints = load("data_input.txt");
data_ofdm = ofdm_module(rand_ints, mod_method, n_fft, n_cp, c_flag);

snr = 20:3:50;
for i = 1:length(snr)
	for j = 1:10000
        [v1(j,i),v2(j,i)] = mi_snr(data_ofdm, n_ofdm,n_cp, K, snr(i));
    end
end

mean_v1 = repmat(mean(v1), 10000,1);
mean_v2 = repmat(mean(v2), 10000,1);

v1_bit = double(v1>= mean_v1);
v2_bit = double(v2>= mean_v2);

for i = 1:length(snr)
    mi_bit(i) = mi(v1_bit(:,i),v2_bit(:,i));
end

v1_3256 = v1;
v2_3256 = v2;

v1_bit_3256 = v1_bit;
v2_bit_3256 = v2_bit;
mi_bit_3256 = mi_bit;


%%
% nfft = 64, K = 1， c_flag = 0
n_fft = 64;
n_cp = n_fft/4;    % size of cyclic prefix extension
n_ofdm = n_fft + n_cp;
K = 1;
c_flag = 0;
% generate the data 
rand_ints_gen = randi(2,n_fft*mod_order*K,1)-1;
save data_input.txt -ascii rand_ints_gen
rand_ints = load("data_input.txt");
data_ofdm = ofdm_module(rand_ints, mod_method, n_fft, n_cp, c_flag);

% for k = 1:10000
%     [v11(k),v22(k)] = mi_snr(data_ofdm, n_ofdm,n_cp, K, 50);
% end 

snr = 20:3:50;
for i = 1:length(snr)
	for j = 1:10000
        [v1(j,i),v2(j,i)] = mi_snr(data_ofdm, n_ofdm,n_cp, K, snr(i));
    end
end

mean_v1 = repmat(mean(v1), 10000,1);
mean_v2 = repmat(mean(v2), 10000,1);

v1_bit = double(v1>= mean_v1);
v2_bit = double(v2>= mean_v2);

for i = 1:length(snr)
    mi_bit(i) = mi(v1_bit(:,i),v2_bit(:,i));
end

v1_164_guard = v1;
v2_164_guard = v2;

v1_bit_164_guard = v1_bit;
v2_bit_164_guard = v2_bit;
mi_bit_164_guard = mi_bit;


%%
% nfft = 256, K = 1， c_flag = 0
n_fft = 256;
n_cp = n_fft/4;    % size of cyclic prefix extension
n_ofdm = n_fft + n_cp;
K = 1;
c_flag = 0;
% generate the data 
rand_ints_gen = randi(2,n_fft*mod_order*K,1)-1;
save data_input.txt -ascii rand_ints_gen
rand_ints = load("data_input.txt");
data_ofdm = ofdm_module(rand_ints, mod_method, n_fft, n_cp, c_flag);

% for k = 1:10000
%     [v11(k),v22(k)] = mi_snr(data_ofdm, n_ofdm,n_cp, K, 50);
% end 

snr = 20:3:50;
for i = 1:length(snr)
	for j = 1:10000
        [v1(j,i),v2(j,i)] = mi_snr(data_ofdm, n_ofdm,n_cp, K, snr(i));
    end
end

mean_v1 = repmat(mean(v1), 10000,1);
mean_v2 = repmat(mean(v2), 10000,1);

v1_bit = double(v1>= mean_v1);
v2_bit = double(v2>= mean_v2);

for i = 1:length(snr)
    mi_bit(i) = mi(v1_bit(:,i),v2_bit(:,i));
end

v1_1256_guard = v1;
v2_1256_guard = v2;

v1_bit_1256_guard = v1_bit;
v2_bit_1256_guard = v2_bit;
mi_bit_1256_guard = mi_bit;


%%
% nfft = 64, K = 1， c_flag = 0， noiseless
n_fft = 64;
n_cp = n_fft/4;    % size of cyclic prefix extension
n_ofdm = n_fft + n_cp;
K=1;
c_flag = 0;
% generate the data 
rand_ints_gen = randi(2,n_fft*mod_order*K,1)-1;
save data_input.txt -ascii rand_ints_gen
rand_ints = load("data_input.txt");
data_ofdm = ofdm_module(rand_ints, mod_method, n_fft, n_cp, c_flag);

snr = 2000:300:5000;
for i = 1:length(snr)
	for j = 1:10000
        [v1(j,i),v2(j,i)] = mi_snr(data_ofdm, n_ofdm,n_cp, K, snr(i));
    end
end

mean_v1 = repmat(mean(v1), 10000,1);
mean_v2 = repmat(mean(v2), 10000,1);

v1_bit = double(v1>= mean_v1);
v2_bit = double(v2>= mean_v2);

for i = 1:length(snr)
    mi_bit(i) = mi(v1_bit(:,i),v2_bit(:,i));
end

v1_164_guard_n = v1;
v2_164_guard_n = v2;

v1_bit_164_guard_n = v1_bit;
v2_bit_164_guard_n = v2_bit;
mi_bit_164_guard_n = mi_bit;


snr = 20:3:50;
plot(snr, mi_bit_164,'k-o','LineWidth',1);
hold on;
plot(snr, mi_bit_364,'k--x','LineWidth',1);
hold on;
plot(snr, mi_bit_1256,'r-d','LineWidth',1);
hold on;
plot(snr, mi_bit_3256,'r--s','LineWidth',1);
hold on;
plot(snr, mi_bit_164_guard,'b-^','LineWidth',1);
hold on;
plot(snr, mi_bit_164_guard_n,'b--.','LineWidth',1);
grid on;
axis([20 50 0.6 1])
