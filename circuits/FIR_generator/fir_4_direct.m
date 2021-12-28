function [fir_4_direct_out] = fir_4_direct(fir_4_direct_in,fir_4_direct_coeff_1,fir_4_direct_coeff_2,fir_4_direct_coeff_3,fir_4_direct_coeff_4)
	persistent fir_4_direct_in_reg_1 fir_4_direct_in_reg_2 fir_4_direct_in_reg_3;
	if (isempty(fir_4_direct_in_reg_1))
		 fir_4_direct_in_reg_1 = 0; fir_4_direct_in_reg_2 = 0; fir_4_direct_in_reg_3 = 0;
	end

	[fir_4_direct_mul_1] = basic_mul(fir_4_direct_coeff_1,fir_4_direct_in);
	[fir_4_direct_mul_2] = basic_mul(fir_4_direct_coeff_2,fir_4_direct_in_reg_1);
	[fir_4_direct_mul_3] = basic_mul(fir_4_direct_coeff_3,fir_4_direct_in_reg_2);
	[fir_4_direct_mul_4] = basic_mul(fir_4_direct_coeff_4,fir_4_direct_in_reg_3);
	[fir_4_direct_add_1] = basic_add(fir_4_direct_mul_1,fir_4_direct_mul_2);
	[fir_4_direct_add_2] = basic_add(fir_4_direct_mul_3,fir_4_direct_add_1);
	[fir_4_direct_add_3] = basic_add(fir_4_direct_mul_4,fir_4_direct_add_2);

	fir_4_direct_out = fir_4_direct_add_3;

	fir_4_direct_in_reg_3 = fir_4_direct_in_reg_2;
	fir_4_direct_in_reg_2 = fir_4_direct_in_reg_1;
	fir_4_direct_in_reg_1 = fir_4_direct_in;
end