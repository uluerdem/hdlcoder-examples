function [y] = IIR2(x,a,b)
	persistent n1_sum_reg_1 n1_sum_reg_2 n3_mul_reg_1 n4_mul_reg_1;
	if (isempty(n1_sum_reg_1))
		 n1_sum_reg_1 = 0; n1_sum_reg_2 = 0; n3_mul_reg_1 = 0; n4_mul_reg_1 = 0;
	end

	[n2_sum] = basic_add(n3_mul_reg_1,n4_mul_reg_1);
	[n3_mul] = basic_mul(a,n1_sum_reg_1);
	[n4_mul] = basic_mul(b,n1_sum_reg_2);
	[n1_sum] = basic_add(x,n2_sum);

	y = n1_sum;

	n1_sum_reg_2 = n1_sum_reg_1;
	n1_sum_reg_1 = n1_sum;
	n3_mul_reg_1 = n3_mul;
	n4_mul_reg_1 = n4_mul;
end