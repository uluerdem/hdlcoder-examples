function [c_fir_4_direct_out] = c_fir_4_direct(c_fir_4_direct_in)
	persistent c_fir_4_direct_in_reg_1 c_fir_4_direct_in_reg_2 c_fir_4_direct_in_reg_3;
	if (isempty(c_fir_4_direct_in_reg_1))
		 c_fir_4_direct_in_reg_1 = 0; c_fir_4_direct_in_reg_2 = 0; c_fir_4_direct_in_reg_3 = 0;
	end

	[c_fir_4_direct_mul_1] = basic_mul(3.000000e-01,c_fir_4_direct_in);
	[c_fir_4_direct_mul_2] = basic_mul(1.000000e-01,c_fir_4_direct_in_reg_1);
	[c_fir_4_direct_mul_3] = basic_mul(5.000000e-01,c_fir_4_direct_in_reg_2);
	[c_fir_4_direct_mul_4] = basic_mul(7.000000e-01,c_fir_4_direct_in_reg_3);
	[c_fir_4_direct_add_1] = basic_add(c_fir_4_direct_mul_1,c_fir_4_direct_mul_2);
	[c_fir_4_direct_add_2] = basic_add(c_fir_4_direct_mul_3,c_fir_4_direct_add_1);
	[c_fir_4_direct_add_3] = basic_add(c_fir_4_direct_mul_4,c_fir_4_direct_add_2);

	c_fir_4_direct_out = c_fir_4_direct_add_3;

	c_fir_4_direct_in_reg_3 = c_fir_4_direct_in_reg_2;
	c_fir_4_direct_in_reg_2 = c_fir_4_direct_in_reg_1;
	c_fir_4_direct_in_reg_1 = c_fir_4_direct_in;
end