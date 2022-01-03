function [matrix_ex_4_9_out_1,matrix_ex_4_9_out_2,matrix_ex_4_9_out_3,matrix_ex_4_9_out_4] = matrix_ex_4_9(matrix_ex_4_9_in_1,matrix_ex_4_9_in_2,matrix_ex_4_9_in_3,matrix_ex_4_9_in_4,matrix_ex_4_9_in_5,matrix_ex_4_9_in_6,matrix_ex_4_9_in_7,matrix_ex_4_9_in_8,matrix_ex_4_9_in_9)
	persistent matrix_ex_4_9_in_3_reg_1 matrix_ex_4_9_in_6_reg_1 matrix_ex_4_9_in_7_reg_1 matrix_ex_4_9_in_8_reg_1 matrix_ex_4_9_in_9_reg_1;
	if (isempty(matrix_ex_4_9_in_3_reg_1))
		 matrix_ex_4_9_in_3_reg_1 = 0; matrix_ex_4_9_in_6_reg_1 = 0; matrix_ex_4_9_in_7_reg_1 = 0; matrix_ex_4_9_in_8_reg_1 = 0; matrix_ex_4_9_in_9_reg_1 = 0;
	end

	[matrix_ex_4_9_out_1_arg_1] = basic_buffer(matrix_ex_4_9_in_1);
	[matrix_ex_4_9_out_1_arg_2] = basic_buffer(matrix_ex_4_9_in_3_reg_1);
	[matrix_ex_4_9_out_1_arg_3] = neg(matrix_ex_4_9_in_7_reg_1);
	[matrix_ex_4_9_out_1_arg_4] = basic_buffer(matrix_ex_4_9_in_8_reg_1);
	[matrix_ex_4_9_out_1_arg_5] = neg(matrix_ex_4_9_in_9_reg_1);
	[matrix_ex_4_9_out_2_arg_1] = neg(matrix_ex_4_9_in_1);
	[matrix_ex_4_9_out_2_arg_2] = basic_buffer(matrix_ex_4_9_in_2);
	[matrix_ex_4_9_out_2_arg_3] = neg(matrix_ex_4_9_in_3);
	[matrix_ex_4_9_out_2_arg_4] = basic_buffer(matrix_ex_4_9_in_7);
	[matrix_ex_4_9_out_2_arg_5] = basic_buffer(matrix_ex_4_9_in_9_reg_1);
	[matrix_ex_4_9_out_3_arg_1] = neg(matrix_ex_4_9_in_1);
	[matrix_ex_4_9_out_3_arg_2] = neg(matrix_ex_4_9_in_3_reg_1);
	[matrix_ex_4_9_out_3_arg_3] = basic_buffer(matrix_ex_4_9_in_4);
	[matrix_ex_4_9_out_3_arg_4] = basic_buffer(matrix_ex_4_9_in_6_reg_1);
	[matrix_ex_4_9_out_3_arg_5] = neg(matrix_ex_4_9_in_7);
	[matrix_ex_4_9_out_3_arg_6] = neg(matrix_ex_4_9_in_9_reg_1);
	[matrix_ex_4_9_out_4_arg_1] = basic_buffer(matrix_ex_4_9_in_1);
	[matrix_ex_4_9_out_4_arg_2] = neg(matrix_ex_4_9_in_2);
	[matrix_ex_4_9_out_4_arg_3] = basic_buffer(matrix_ex_4_9_in_3);
	[matrix_ex_4_9_out_4_arg_4] = neg(matrix_ex_4_9_in_4);
	[matrix_ex_4_9_out_4_arg_5] = basic_buffer(matrix_ex_4_9_in_5);
	[matrix_ex_4_9_out_4_arg_6] = neg(matrix_ex_4_9_in_6);
	[matrix_ex_4_9_out_4_arg_7] = basic_buffer(matrix_ex_4_9_in_7);
	[matrix_ex_4_9_out_4_arg_8] = neg(matrix_ex_4_9_in_8);
	[matrix_ex_4_9_out_4_arg_9] = basic_buffer(matrix_ex_4_9_in_9);
	[matrix_ex_4_9_out_1_sum_1] = basic_add(matrix_ex_4_9_out_1_arg_1,matrix_ex_4_9_out_1_arg_2);
	[matrix_ex_4_9_out_2_sum_1] = basic_add(matrix_ex_4_9_out_2_arg_1,matrix_ex_4_9_out_2_arg_2);
	[matrix_ex_4_9_out_3_sum_1] = basic_add(matrix_ex_4_9_out_3_arg_1,matrix_ex_4_9_out_3_arg_2);
	[matrix_ex_4_9_out_4_sum_1] = basic_add(matrix_ex_4_9_out_4_arg_1,matrix_ex_4_9_out_4_arg_2);
	[matrix_ex_4_9_out_1_sum_2] = basic_add(matrix_ex_4_9_out_1_sum_1,matrix_ex_4_9_out_1_arg_3);
	[matrix_ex_4_9_out_2_sum_2] = basic_add(matrix_ex_4_9_out_2_sum_1,matrix_ex_4_9_out_2_arg_3);
	[matrix_ex_4_9_out_3_sum_2] = basic_add(matrix_ex_4_9_out_3_sum_1,matrix_ex_4_9_out_3_arg_3);
	[matrix_ex_4_9_out_4_sum_2] = basic_add(matrix_ex_4_9_out_4_sum_1,matrix_ex_4_9_out_4_arg_3);
	[matrix_ex_4_9_out_1_sum_3] = basic_add(matrix_ex_4_9_out_1_sum_2,matrix_ex_4_9_out_1_arg_4);
	[matrix_ex_4_9_out_2_sum_3] = basic_add(matrix_ex_4_9_out_2_sum_2,matrix_ex_4_9_out_2_arg_4);
	[matrix_ex_4_9_out_3_sum_3] = basic_add(matrix_ex_4_9_out_3_sum_2,matrix_ex_4_9_out_3_arg_4);
	[matrix_ex_4_9_out_4_sum_3] = basic_add(matrix_ex_4_9_out_4_sum_2,matrix_ex_4_9_out_4_arg_4);
	[matrix_ex_4_9_out_1_sum_4] = basic_add(matrix_ex_4_9_out_1_sum_3,matrix_ex_4_9_out_1_arg_5);
	[matrix_ex_4_9_out_2_sum_4] = basic_add(matrix_ex_4_9_out_2_sum_3,matrix_ex_4_9_out_2_arg_5);
	[matrix_ex_4_9_out_3_sum_4] = basic_add(matrix_ex_4_9_out_3_sum_3,matrix_ex_4_9_out_3_arg_5);
	[matrix_ex_4_9_out_4_sum_4] = basic_add(matrix_ex_4_9_out_4_sum_3,matrix_ex_4_9_out_4_arg_5);
	[matrix_ex_4_9_out_3_sum_5] = basic_add(matrix_ex_4_9_out_3_sum_4,matrix_ex_4_9_out_3_arg_6);
	[matrix_ex_4_9_out_4_sum_5] = basic_add(matrix_ex_4_9_out_4_sum_4,matrix_ex_4_9_out_4_arg_6);
	[matrix_ex_4_9_out_4_sum_6] = basic_add(matrix_ex_4_9_out_4_sum_5,matrix_ex_4_9_out_4_arg_7);
	[matrix_ex_4_9_out_4_sum_7] = basic_add(matrix_ex_4_9_out_4_sum_6,matrix_ex_4_9_out_4_arg_8);
	[matrix_ex_4_9_out_4_sum_8] = basic_add(matrix_ex_4_9_out_4_sum_7,matrix_ex_4_9_out_4_arg_9);

	matrix_ex_4_9_out_1 = matrix_ex_4_9_out_1_sum_4;
	matrix_ex_4_9_out_2 = matrix_ex_4_9_out_2_sum_4;
	matrix_ex_4_9_out_3 = matrix_ex_4_9_out_3_sum_5;
	matrix_ex_4_9_out_4 = matrix_ex_4_9_out_4_sum_8;

	matrix_ex_4_9_in_3_reg_1 = matrix_ex_4_9_in_3;
	matrix_ex_4_9_in_6_reg_1 = matrix_ex_4_9_in_6;
	matrix_ex_4_9_in_7_reg_1 = matrix_ex_4_9_in_7;
	matrix_ex_4_9_in_8_reg_1 = matrix_ex_4_9_in_8;
	matrix_ex_4_9_in_9_reg_1 = matrix_ex_4_9_in_9;
end