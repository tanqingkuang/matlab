clear all
clc

octane = [90 : 0.1: 100]';
N = size(octane, 1)
idx = [1:401];
p = poly([0 2 4]);
line = polyval(p, idx/100) + 4;

NIR = ones(N, 1) * line + octane * rand(1, 401) / 1000;
save('spectra_data', 'NIR', 'octane');