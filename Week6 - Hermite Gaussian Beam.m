clc; clear; close all;

m = 4; n = 6;
L = 100; z_R = 1; wave_len =  532;
x = linspace(-L, L);
y = linspace(-L, L);
z = linspace(0, z_R);
[XX, YY] = meshgrid(x, y);

A_0 = 1;
w_0 = sqrt(wave_len*z_R/pi);
w = @(z) w_0 * sqrt(1 + (z/z_R).^2);
z_tilde = @(x,y,z) z .* (1 + (x.^2+y.^2)./(2*(z.^2+z_R^2)));
theta_z = 0;
k = 2*pi/wave_len;

X_m = @(x,z) (1/sqrt(2^m * factorial(m) * sqrt(pi))) * hermiteH(m, sqrt(2)*x./w(z)) .* exp(-x.^2./w(z).^2);
Y_m = @(y,z) (1/sqrt(2^n * factorial(n) * sqrt(pi))) * hermiteH(n, sqrt(2)*y./w(z)) .* exp(-y.^2./w(z).^2);
psi = @(x,y,z) A_0 * w_0./w(z) .* X_m(x,z) .* Y_m(y,z) .* exp(-1j*k*z_tilde(x,y,z)) * exp(1j*(m+n+1)*theta_z);
psi_intensity = @(x,y,z) abs(psi(x,y,z)) .^ 2;

figure(1);
colormap('gray');
contourf(XX, YY, psi_intensity(XX,YY,0), 'LineStyle','none');

[XX, ZZ] = meshgrid(x, z);
figure(2);
colormap('gray');
contourf(ZZ, XX, psi_intensity(XX,0,ZZ), 'LineStyle','none');

[YY, ZZ] = meshgrid(y, z);
figure(3);
colormap('gray');
contourf(ZZ, YY, psi_intensity(0,YY,ZZ), 'LineStyle','none');