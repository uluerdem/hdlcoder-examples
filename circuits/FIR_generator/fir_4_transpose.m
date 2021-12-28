function [fir_4_transpose_out] = fir_4_transpose(fir_4_transpose_in,fir_4_transpose_coeff_1,fir_4_transpose_coeff_2,fir_4_transpose_coeff_3,fir_4_transpose_coeff_4)
	persistent fir_4_transpose_mul_1_reg_1 fir_4_transpose_add_1_reg_1 fir_4_transpose_add_2_reg_1;
	if (isempty(fir_4_transpose_mul_1_reg_1))
		 fir_4_transpose_mul_1_reg_1 = 0; fir_4_transpose_add_1_reg_1 = 0; fir_4_transpose_add_2_reg_1 = 0;
	end

	[fir_4_transpose_mul_1] = basic_mul(fir_4_transpose_coeff_4,fir_4_transpose_in);
	[fir_4_transpose_mul_2] = basic_mul(fir_4_transpose_coeff_3,fir_4_transpose_in);
	[fir_4_transpose_mul_3] = basic_mul(fir_4_transpose_coeff_2,fir_4_transpose_in);
	[fir_4_transpose_mul_4] = basic_mul(fir_4_transpose_coeff_1,fir_4_transpose_in);
	[fir_4_transpose_add_1] = basic_add(fir_4_transpose_mul_1_reg_1,fir_4_transpose_mul_2);
	[fir_4_transpose_add_2] = basic_add(fir_4_transpose_add_1_reg_1,fir_4_transpose_mul_3);
	[fir_4_transpose_add_3] = basic_add(fir_4_transpose_add_2_reg_1,fir_4_transpose_mul_4);

	fir_4_transpose_out = fir_4_transpose_add_3;

	fir_4_transpose_mul_1_reg_1 = fir_4_transpose_mul_1;
	fir_4_transpose_add_1_reg_1 = fir_4_transpose_add_1;
	fir_4_transpose_add_2_reg_1 = fir_4_transpose_add_2;
end