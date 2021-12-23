function [fir_direct_out] = fir_direct(fir_direct_in,fir_direct_coeff_1,fir_direct_coeff_2,fir_direct_coeff_3,fir_direct_coeff_4,fir_direct_coeff_5,fir_direct_coeff_6,fir_direct_coeff_7,fir_direct_coeff_8)
	persistent fir_direct_in_reg_1 fir_direct_in_reg_2 fir_direct_in_reg_3 fir_direct_in_reg_4 fir_direct_in_reg_5 fir_direct_in_reg_6 fir_direct_in_reg_7;
	if (isempty(fir_direct_in_reg_1))
		 fir_direct_in_reg_1 = 0; fir_direct_in_reg_2 = 0; fir_direct_in_reg_3 = 0; fir_direct_in_reg_4 = 0; fir_direct_in_reg_5 = 0; fir_direct_in_reg_6 = 0; fir_direct_in_reg_7 = 0;
	end

	[fir_direct_mul_1] = basic_mul(fir_direct_coeff_1,fir_direct_in);
	[fir_direct_mul_2] = basic_mul(fir_direct_coeff_2,fir_direct_in_reg_1);
	[fir_direct_mul_3] = basic_mul(fir_direct_coeff_3,fir_direct_in_reg_2);
	[fir_direct_mul_4] = basic_mul(fir_direct_coeff_4,fir_direct_in_reg_3);
	[fir_direct_mul_5] = basic_mul(fir_direct_coeff_5,fir_direct_in_reg_4);
	[fir_direct_mul_6] = basic_mul(fir_direct_coeff_6,fir_direct_in_reg_5);
	[fir_direct_mul_7] = basic_mul(fir_direct_coeff_7,fir_direct_in_reg_6);
	[fir_direct_mul_8] = basic_mul(fir_direct_coeff_8,fir_direct_in_reg_7);
	[fir_direct_add_1] = basic_add(fir_direct_mul_1,fir_direct_mul_2);
	[fir_direct_add_2] = basic_add(fir_direct_mul_3,fir_direct_add_1);
	[fir_direct_add_3] = basic_add(fir_direct_mul_4,fir_direct_add_2);
	[fir_direct_add_4] = basic_add(fir_direct_mul_5,fir_direct_add_3);
	[fir_direct_add_5] = basic_add(fir_direct_mul_6,fir_direct_add_4);
	[fir_direct_add_6] = basic_add(fir_direct_mul_7,fir_direct_add_5);
	[fir_direct_add_7] = basic_add(fir_direct_mul_8,fir_direct_add_6);

	fir_direct_out = fir_direct_add_7;

	fir_direct_in_reg_7 = fir_direct_in_reg_6;
	fir_direct_in_reg_6 = fir_direct_in_reg_5;
	fir_direct_in_reg_5 = fir_direct_in_reg_4;
	fir_direct_in_reg_4 = fir_direct_in_reg_3;
	fir_direct_in_reg_3 = fir_direct_in_reg_2;
	fir_direct_in_reg_2 = fir_direct_in_reg_1;
	fir_direct_in_reg_1 = fir_direct_in;
end