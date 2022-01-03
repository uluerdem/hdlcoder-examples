function [v_fir_4_direct_out] = v_fir_4_direct(v_fir_4_direct_in,v_fir_4_direct_coeff_1,v_fir_4_direct_coeff_2,v_fir_4_direct_coeff_3,v_fir_4_direct_coeff_4)
	persistent v_fir_4_direct_in_reg_1 v_fir_4_direct_in_reg_2 v_fir_4_direct_in_reg_3;
	if (isempty(v_fir_4_direct_in_reg_1))
		 v_fir_4_direct_in_reg_1 = 0; v_fir_4_direct_in_reg_2 = 0; v_fir_4_direct_in_reg_3 = 0;
	end

	[v_fir_4_direct_mul_1] = basic_mul(v_fir_4_direct_coeff_1,v_fir_4_direct_in);
	[v_fir_4_direct_mul_2] = basic_mul(v_fir_4_direct_coeff_2,v_fir_4_direct_in_reg_1);
	[v_fir_4_direct_mul_3] = basic_mul(v_fir_4_direct_coeff_3,v_fir_4_direct_in_reg_2);
	[v_fir_4_direct_mul_4] = basic_mul(v_fir_4_direct_coeff_4,v_fir_4_direct_in_reg_3);
	[v_fir_4_direct_add_1] = basic_add(v_fir_4_direct_mul_1,v_fir_4_direct_mul_2);
	[v_fir_4_direct_add_2] = basic_add(v_fir_4_direct_mul_3,v_fir_4_direct_add_1);
	[v_fir_4_direct_add_3] = basic_add(v_fir_4_direct_mul_4,v_fir_4_direct_add_2);

	v_fir_4_direct_out = v_fir_4_direct_add_3;

	v_fir_4_direct_in_reg_3 = v_fir_4_direct_in_reg_2;
	v_fir_4_direct_in_reg_2 = v_fir_4_direct_in_reg_1;
	v_fir_4_direct_in_reg_1 = v_fir_4_direct_in;
end