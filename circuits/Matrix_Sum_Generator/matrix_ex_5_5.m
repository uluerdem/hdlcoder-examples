function [matrix_ex_5_5_out_1,matrix_ex_5_5_out_2,matrix_ex_5_5_out_3,matrix_ex_5_5_out_4,matrix_ex_5_5_out_5] = matrix_ex_5_5(matrix_ex_5_5_in_1,matrix_ex_5_5_in_2,matrix_ex_5_5_in_3,matrix_ex_5_5_in_4,matrix_ex_5_5_in_5)
	persistent matrix_ex_5_5_in_1_reg_1 matrix_ex_5_5_in_3_reg_1 matrix_ex_5_5_in_3_reg_2 matrix_ex_5_5_in_4_reg_1 matrix_ex_5_5_in_4_reg_2 matrix_ex_5_5_in_4_reg_3 matrix_ex_5_5_in_5_reg_1;
	if (isempty(matrix_ex_5_5_in_1_reg_1))
		 matrix_ex_5_5_in_1_reg_1 = 0; matrix_ex_5_5_in_3_reg_1 = 0; matrix_ex_5_5_in_3_reg_2 = 0; matrix_ex_5_5_in_4_reg_1 = 0; matrix_ex_5_5_in_4_reg_2 = 0; matrix_ex_5_5_in_4_reg_3 = 0; matrix_ex_5_5_in_5_reg_1 = 0;
	end

	[matrix_ex_5_5_out_1_arg_1] = basic_buffer(matrix_ex_5_5_in_1);
	[matrix_ex_5_5_out_1_arg_2] = basic_buffer(matrix_ex_5_5_in_2);
	[matrix_ex_5_5_out_1_arg_3] = neg(matrix_ex_5_5_in_5_reg_1);
	[matrix_ex_5_5_out_2_arg_1] = basic_buffer(matrix_ex_5_5_in_1);
	[matrix_ex_5_5_out_2_arg_2] = basic_buffer(matrix_ex_5_5_in_2);
	[matrix_ex_5_5_out_2_arg_3] = neg(matrix_ex_5_5_in_3);
	[matrix_ex_5_5_out_2_arg_4] = basic_buffer(matrix_ex_5_5_in_4);
	[matrix_ex_5_5_out_3_arg_1] = basic_buffer(matrix_ex_5_5_in_1_reg_1);
	[matrix_ex_5_5_out_3_arg_2] = neg(matrix_ex_5_5_in_3_reg_2);
	[matrix_ex_5_5_out_3_arg_3] = basic_buffer(matrix_ex_5_5_in_5);
	[matrix_ex_5_5_out_4_arg_1] = neg(matrix_ex_5_5_in_1);
	[matrix_ex_5_5_out_4_arg_2] = basic_buffer(matrix_ex_5_5_in_3_reg_1);
	[matrix_ex_5_5_out_4_arg_3] = basic_buffer(matrix_ex_5_5_in_4_reg_1);
	[matrix_ex_5_5_out_5_arg_1] = basic_buffer(matrix_ex_5_5_in_3_reg_1);
	[matrix_ex_5_5_out_5_arg_2] = neg(matrix_ex_5_5_in_4_reg_3);
	[matrix_ex_5_5_out_5_arg_3] = basic_buffer(matrix_ex_5_5_in_5_reg_1);
	[matrix_ex_5_5_out_1_sum_1] = basic_add(matrix_ex_5_5_out_1_arg_1,matrix_ex_5_5_out_1_arg_2);
	[matrix_ex_5_5_out_2_sum_1] = basic_add(matrix_ex_5_5_out_2_arg_1,matrix_ex_5_5_out_2_arg_2);
	[matrix_ex_5_5_out_3_sum_1] = basic_add(matrix_ex_5_5_out_3_arg_1,matrix_ex_5_5_out_3_arg_2);
	[matrix_ex_5_5_out_4_sum_1] = basic_add(matrix_ex_5_5_out_4_arg_1,matrix_ex_5_5_out_4_arg_2);
	[matrix_ex_5_5_out_5_sum_1] = basic_add(matrix_ex_5_5_out_5_arg_1,matrix_ex_5_5_out_5_arg_2);
	[matrix_ex_5_5_out_1_sum_2] = basic_add(matrix_ex_5_5_out_1_sum_1,matrix_ex_5_5_out_1_arg_3);
	[matrix_ex_5_5_out_2_sum_2] = basic_add(matrix_ex_5_5_out_2_sum_1,matrix_ex_5_5_out_2_arg_3);
	[matrix_ex_5_5_out_3_sum_2] = basic_add(matrix_ex_5_5_out_3_sum_1,matrix_ex_5_5_out_3_arg_3);
	[matrix_ex_5_5_out_4_sum_2] = basic_add(matrix_ex_5_5_out_4_sum_1,matrix_ex_5_5_out_4_arg_3);
	[matrix_ex_5_5_out_5_sum_2] = basic_add(matrix_ex_5_5_out_5_sum_1,matrix_ex_5_5_out_5_arg_3);
	[matrix_ex_5_5_out_2_sum_3] = basic_add(matrix_ex_5_5_out_2_sum_2,matrix_ex_5_5_out_2_arg_4);

	matrix_ex_5_5_out_1 = matrix_ex_5_5_out_1_sum_2;
	matrix_ex_5_5_out_2 = matrix_ex_5_5_out_2_sum_3;
	matrix_ex_5_5_out_3 = matrix_ex_5_5_out_3_sum_2;
	matrix_ex_5_5_out_4 = matrix_ex_5_5_out_4_sum_2;
	matrix_ex_5_5_out_5 = matrix_ex_5_5_out_5_sum_2;

	matrix_ex_5_5_in_1_reg_1 = matrix_ex_5_5_in_1;
	matrix_ex_5_5_in_3_reg_2 = matrix_ex_5_5_in_3_reg_1;
	matrix_ex_5_5_in_3_reg_1 = matrix_ex_5_5_in_3;
	matrix_ex_5_5_in_4_reg_3 = matrix_ex_5_5_in_4_reg_2;
	matrix_ex_5_5_in_4_reg_2 = matrix_ex_5_5_in_4_reg_1;
	matrix_ex_5_5_in_4_reg_1 = matrix_ex_5_5_in_4;
	matrix_ex_5_5_in_5_reg_1 = matrix_ex_5_5_in_5;
end