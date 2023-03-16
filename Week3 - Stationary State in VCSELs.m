clc; clear; close all; history -c;

p=3; q=2; N=30; M=7; phi=pi/3; const=123;
K_btm = fix(q*N/p); K_top = fix(p*N/q); Q = K_top - K_btm + 1;

L = 1; n = 100;
x = linspace(0, L, n);
y = linspace(0, L, n);
[X, Y] = meshgrid(x, y);

front = 1/(sqrt(2*Q)+1) * (2/L) * exp(i*const*N);
rear = zeros(n);
for K = K_btm:K_top
  rear = rear + exp(i*K*phi) * sin((q*N+p*K)*(pi*X/L)) .* sin((p*N-q*K)*(pi*Y/L));
end
big_phi = front * rear;

colormap(gray);
contourf(x, y, real(big_phi), 'o');
