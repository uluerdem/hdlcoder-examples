function [matrix_ex_2_3_out_1,matrix_ex_2_3_out_2] = matrix_ex_2_3(matrix_ex_2_3_in_1,matrix_ex_2_3_in_2,matrix_ex_2_3_in_3)
	persistent matrix_ex_2_3_in_3_reg_1;
	if (isempty(matrix_ex_2_3_in_3_reg_1))
		 matrix_ex_2_3_in_3_reg_1 = 0;
	end

	[matrix_ex_2_3_out_1_sum_1] = basic_add(matrix_ex_2_3_in_1,matrix_ex_2_3_in_3_reg_1);
	[matrix_ex_2_3_in_2_neg] = neg(matrix_ex_2_3_in_2);
	[matrix_ex_2_3_out_2_sum_1] = basic_add(matrix_ex_2_3_in_1,matrix_ex_2_3_in_2_neg);
	[matrix_ex_2_3_out_2_sum_2] = basic_add(matrix_ex_2_3_out_2_sum_1,matrix_ex_2_3_in_3);

	matrix_ex_2_3_out_1 = matrix_ex_2_3_out_1_sum_1;
	matrix_ex_2_3_out_2 = matrix_ex_2_3_out_2_sum_2;

	matrix_ex_2_3_in_3_reg_1 = matrix_ex_2_3_in_3;
end