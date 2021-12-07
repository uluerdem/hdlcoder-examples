clear IIR1;
a = 0.2;
b = 0.3;

x = 2*rand(1,2^16)-1;
y = zeros(size(x));
for i = 1:length(x)
    y(i) = IIR1(x(i),a,b);
end