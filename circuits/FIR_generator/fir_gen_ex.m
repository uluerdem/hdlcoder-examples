type = "direct";
coeff_no = 4;
name = sprintf("fir_%d_%s",coeff_no,type);

fir_gen(name,coeff_no,type);

type = "transpose";
coeff_no = 4;
name = sprintf("fir_%d_%s",coeff_no,type);

fir_gen(name,coeff_no,type);