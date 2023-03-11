clc; clear; close all; history -c;

N = 1000;
Lx = 1; Ly = 1;
nx = 8; ny = 7;

x = linspace(0, Lx, N);
y = linspace(0, Ly, N);
[X, Y] = meshgrid(x, y);

psi = (sqrt(2/Lx)*sqrt(2/Ly)) * sin((nx*pi/Lx)*X) .* sin((ny*pi/Ly)*Y);
psi_intensity = abs(psi).^2;

subplot(1,2,1); imshow(psi, []); axis on;
subplot(1,2,2); imshow(psi_intensity, []); axis on;
