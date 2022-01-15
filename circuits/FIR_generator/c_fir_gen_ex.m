type = "direct";
coeffs = [0.3 0.1 0.5 0.7];
name = sprintf("c_fir_%d_%s",4,type);

c_fir_gen(name,coeffs,type,true);

type = "transpose";
coeffs = [0.3 0.1 0.5 0.7];
name = sprintf("c_fir_%d_%s",4,type);

c_fir_gen(name,coeffs,type,true);