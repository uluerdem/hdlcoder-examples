function [c_fir_4_transpose_out] = c_fir_4_transpose(c_fir_4_transpose_in)
	persistent c_fir_4_transpose_mul_1_reg_1 c_fir_4_transpose_add_1_reg_1 c_fir_4_transpose_add_2_reg_1;
	if (isempty(c_fir_4_transpose_mul_1_reg_1))
		 c_fir_4_transpose_mul_1_reg_1 = 0; c_fir_4_transpose_add_1_reg_1 = 0; c_fir_4_transpose_add_2_reg_1 = 0;
	end

	[c_fir_4_transpose_mul_1] = basic_mul(3.000000e-01,c_fir_4_transpose_in);
	[c_fir_4_transpose_mul_2] = basic_mul(1.000000e-01,c_fir_4_transpose_in);
	[c_fir_4_transpose_mul_3] = basic_mul(5.000000e-01,c_fir_4_transpose_in);
	[c_fir_4_transpose_mul_4] = basic_mul(7.000000e-01,c_fir_4_transpose_in);
	[c_fir_4_transpose_add_1] = basic_add(c_fir_4_transpose_mul_1_reg_1,c_fir_4_transpose_mul_2);
	[c_fir_4_transpose_add_2] = basic_add(c_fir_4_transpose_add_1_reg_1,c_fir_4_transpose_mul_3);
	[c_fir_4_transpose_add_3] = basic_add(c_fir_4_transpose_add_2_reg_1,c_fir_4_transpose_mul_4);

	c_fir_4_transpose_out = c_fir_4_transpose_add_3;

	c_fir_4_transpose_mul_1_reg_1 = c_fir_4_transpose_mul_1;
	c_fir_4_transpose_add_1_reg_1 = c_fir_4_transpose_add_1;
	c_fir_4_transpose_add_2_reg_1 = c_fir_4_transpose_add_2;
end