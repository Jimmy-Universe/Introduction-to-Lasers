clc; clear; close all; history -c;

p=3; q=9; m0=100; n0=25; Q=1; phi_const=pi/2; a=1;
N=200;
rho = linspace(-a, a, N);
phi = linspace(0, 2*pi, N);
[RHO, PHI] = meshgrid(rho, phi);

temp = zeros(N);
for K=-Q:Q
  m = m0+q*K;
  n = n0-p*K;
  k = ((m*(p/q)+n+(3/4))*pi) / (a*sin(p*pi/q));
  psi = (1/(sqrt(pi)*a*abs(besselj(m-1, k*a)))) * besselj(m, k*RHO) .* exp(i*m*PHI);

  temp = temp + exp(i*q*K*phi_const) * psi;
end

big_phi = (1/(2*Q+1)) * temp;

x = @(rho, phi) rho.*cos(phi);
y = @(rho, phi) rho.*sin(phi);

figure(1);
colormap(gray(255));
contourf(x(RHO, PHI), y(RHO, PHI), abs(big_phi), 'o');
%subplot(1,2,2); contourf(x(RHO, PHI), y(RHO, PHI), real(big_phi), 'o');
