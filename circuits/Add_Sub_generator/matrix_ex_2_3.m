function [matrix_ex_2_3_out_1,matrix_ex_2_3_out_2] = matrix_ex_2_3(matrix_ex_2_3_in_1,matrix_ex_2_3_in_2,matrix_ex_2_3_in_3)
	persistent matrix_ex_2_3_in_3_reg_1;
	if (isempty(matrix_ex_2_3_in_3_reg_1))
		 matrix_ex_2_3_in_3_reg_1 = 0;
	end

	[matrix_ex_2_3_out_1_arg_1] = basic_buffer(matrix_ex_2_3_in_1);
	[matrix_ex_2_3_out_1_arg_2] = basic_buffer(matrix_ex_2_3_in_3_reg_1);
	[matrix_ex_2_3_out_2_arg_1] = basic_buffer(matrix_ex_2_3_in_1);
	[matrix_ex_2_3_out_2_arg_2] = neg(matrix_ex_2_3_in_2);
	[matrix_ex_2_3_out_2_arg_3] = basic_buffer(matrix_ex_2_3_in_3);
	[matrix_ex_2_3_out_1_sum_1] = basic_add(matrix_ex_2_3_out_1_arg_1,matrix_ex_2_3_out_1_arg_2);
	[matrix_ex_2_3_out_2_sum_1] = basic_add(matrix_ex_2_3_out_2_arg_1,matrix_ex_2_3_out_2_arg_2);
	[matrix_ex_2_3_out_2_sum_2] = basic_add(matrix_ex_2_3_out_2_sum_1,matrix_ex_2_3_out_2_arg_3);

	matrix_ex_2_3_out_1 = matrix_ex_2_3_out_1_sum_1;
	matrix_ex_2_3_out_2 = matrix_ex_2_3_out_2_sum_2;

	matrix_ex_2_3_in_3_reg_1 = matrix_ex_2_3_in_3;
end