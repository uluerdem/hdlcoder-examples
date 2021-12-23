N = 2^16;

x_in = 2*rand(1,N)-1;
coeffs = 2*rand(8,N)-1;
for i = 1:N
%     fir_out = fir_transpose(x_in(i),coeffs(1,i),coeffs(2,i),coeffs(3,i),coeffs(4,i),coeffs(5,i),coeffs(6,i),coeffs(7,i),coeffs(8,i));
    fir_out = fir_direct(x_in(i),coeffs(1,i),coeffs(2,i),coeffs(3,i),coeffs(4,i),coeffs(5,i),coeffs(6,i),coeffs(7,i),coeffs(8,i));
end