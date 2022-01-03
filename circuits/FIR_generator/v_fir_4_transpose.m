function [v_fir_4_transpose_out] = v_fir_4_transpose(v_fir_4_transpose_in,v_fir_4_transpose_coeff_1,v_fir_4_transpose_coeff_2,v_fir_4_transpose_coeff_3,v_fir_4_transpose_coeff_4)
	persistent v_fir_4_transpose_mul_1_reg_1 v_fir_4_transpose_add_1_reg_1 v_fir_4_transpose_add_2_reg_1;
	if (isempty(v_fir_4_transpose_mul_1_reg_1))
		 v_fir_4_transpose_mul_1_reg_1 = 0; v_fir_4_transpose_add_1_reg_1 = 0; v_fir_4_transpose_add_2_reg_1 = 0;
	end

	[v_fir_4_transpose_mul_1] = basic_mul(v_fir_4_transpose_coeff_4,v_fir_4_transpose_in);
	[v_fir_4_transpose_mul_2] = basic_mul(v_fir_4_transpose_coeff_3,v_fir_4_transpose_in);
	[v_fir_4_transpose_mul_3] = basic_mul(v_fir_4_transpose_coeff_2,v_fir_4_transpose_in);
	[v_fir_4_transpose_mul_4] = basic_mul(v_fir_4_transpose_coeff_1,v_fir_4_transpose_in);
	[v_fir_4_transpose_add_1] = basic_add(v_fir_4_transpose_mul_1_reg_1,v_fir_4_transpose_mul_2);
	[v_fir_4_transpose_add_2] = basic_add(v_fir_4_transpose_add_1_reg_1,v_fir_4_transpose_mul_3);
	[v_fir_4_transpose_add_3] = basic_add(v_fir_4_transpose_add_2_reg_1,v_fir_4_transpose_mul_4);

	v_fir_4_transpose_out = v_fir_4_transpose_add_3;

	v_fir_4_transpose_mul_1_reg_1 = v_fir_4_transpose_mul_1;
	v_fir_4_transpose_add_1_reg_1 = v_fir_4_transpose_add_1;
	v_fir_4_transpose_add_2_reg_1 = v_fir_4_transpose_add_2;
end