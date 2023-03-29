clc; clear; close all; history -c;

a=1; k=20; m=9; N=100;
rho = linspace(0, a, N);
phi = linspace(0, 2*pi, N);
[RHO, PHI] = meshgrid(rho, phi);

psi = @(m) 1/(sqrt(pi)*a*besselj(m+1, k*a)) * besselj(m, k*RHO).*exp(i*m*PHI);
psi_intensity = @(m) abs(psi(m)).^2;

x = @(rho, phi) rho.*cos(phi);
y = @(rho, phi) rho.*sin(phi);

figure(1);
colormap(gray(255));
contourf(x(RHO, PHI), y(RHO, PHI), real(psi_intensity(m)), 'o');

phi = 0;
rho = linspace(-a, a, N);
psi_fixed = @(m) 1/(sqrt(pi)*a*besselj(m+1, k*a)) * besselj(m, k*rho).*exp(i*m*phi);
psi_fixed_intensity = @(m) abs(psi_fixed(m)).^2;

figure(2);
plot(rho, real(psi_fixed(m)));
figure(3);
plot(rho, real(psi_fixed_intensity(m)));

