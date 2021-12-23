function [fir_transpose_out] = fir_transpose(fir_transpose_in,fir_transpose_coeff_1,fir_transpose_coeff_2,fir_transpose_coeff_3,fir_transpose_coeff_4,fir_transpose_coeff_5,fir_transpose_coeff_6,fir_transpose_coeff_7,fir_transpose_coeff_8)
	persistent fir_transpose_mul_1_reg_1 fir_transpose_mul_3_reg_1 fir_transpose_mul_4_reg_1 fir_transpose_mul_5_reg_1 fir_transpose_mul_6_reg_1 fir_transpose_mul_7_reg_1 fir_transpose_mul_8_reg_1;
	if (isempty(fir_transpose_mul_1_reg_1))
		 fir_transpose_mul_1_reg_1 = 0; fir_transpose_mul_3_reg_1 = 0; fir_transpose_mul_4_reg_1 = 0; fir_transpose_mul_5_reg_1 = 0; fir_transpose_mul_6_reg_1 = 0; fir_transpose_mul_7_reg_1 = 0; fir_transpose_mul_8_reg_1 = 0;
	end

	[fir_transpose_mul_1] = basic_mul(fir_transpose_coeff_1,fir_transpose_in);
	[fir_transpose_mul_2] = basic_mul(fir_transpose_coeff_2,fir_transpose_in);
	[fir_transpose_mul_3] = basic_mul(fir_transpose_coeff_3,fir_transpose_in);
	[fir_transpose_mul_4] = basic_mul(fir_transpose_coeff_4,fir_transpose_in);
	[fir_transpose_mul_5] = basic_mul(fir_transpose_coeff_5,fir_transpose_in);
	[fir_transpose_mul_6] = basic_mul(fir_transpose_coeff_6,fir_transpose_in);
	[fir_transpose_mul_7] = basic_mul(fir_transpose_coeff_7,fir_transpose_in);
	[fir_transpose_mul_8] = basic_mul(fir_transpose_coeff_8,fir_transpose_in);
	[fir_transpose_add_1] = basic_add(fir_transpose_mul_1_reg_1,fir_transpose_mul_2);
	[fir_transpose_add_2] = basic_add(fir_transpose_mul_3_reg_1,fir_transpose_add_1);
	[fir_transpose_add_3] = basic_add(fir_transpose_mul_4_reg_1,fir_transpose_add_2);
	[fir_transpose_add_4] = basic_add(fir_transpose_mul_5_reg_1,fir_transpose_add_3);
	[fir_transpose_add_5] = basic_add(fir_transpose_mul_6_reg_1,fir_transpose_add_4);
	[fir_transpose_add_6] = basic_add(fir_transpose_mul_7_reg_1,fir_transpose_add_5);
	[fir_transpose_add_7] = basic_add(fir_transpose_mul_8_reg_1,fir_transpose_add_6);

	fir_transpose_out = fir_transpose_add_7;

	fir_transpose_mul_1_reg_1 = fir_transpose_mul_1;
	fir_transpose_mul_3_reg_1 = fir_transpose_mul_3;
	fir_transpose_mul_4_reg_1 = fir_transpose_mul_4;
	fir_transpose_mul_5_reg_1 = fir_transpose_mul_5;
	fir_transpose_mul_6_reg_1 = fir_transpose_mul_6;
	fir_transpose_mul_7_reg_1 = fir_transpose_mul_7;
	fir_transpose_mul_8_reg_1 = fir_transpose_mul_8;
end