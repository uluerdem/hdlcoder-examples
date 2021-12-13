function [y_0,y_1,y_2] = IIR_after_unfold_3(x_0,x_1,x_2,a_0,a_1,a_2)
	persistent add_0_reg_1 add_0_reg_2 add_0_reg_3 add_1_reg_1 add_1_reg_2 add_1_reg_3 add_2_reg_1 add_2_reg_2 add_2_reg_3;
	if (isempty(add_0_reg_1))
		 add_0_reg_1 = 0; add_0_reg_2 = 0; add_0_reg_3 = 0; add_1_reg_1 = 0; add_1_reg_2 = 0; add_1_reg_3 = 0; add_2_reg_1 = 0; add_2_reg_2 = 0; add_2_reg_3 = 0;
	end

	[mul_0] = basic_mul(a_0,add_0_reg_3);
	[mul_1] = basic_mul(a_1,add_1_reg_3);
	[mul_2] = basic_mul(a_2,add_2_reg_3);
	[add_0] = basic_add(x_0,mul_0);
	[add_1] = basic_add(x_1,mul_1);
	[add_2] = basic_add(x_2,mul_2);

	y_0 = add_0;
	y_1 = add_1;
	y_2 = add_2;

	add_0_reg_3 = add_0_reg_2;
	add_0_reg_2 = add_0_reg_1;
	add_0_reg_1 = add_0;
	add_1_reg_3 = add_1_reg_2;
	add_1_reg_2 = add_1_reg_1;
	add_1_reg_1 = add_1;
	add_2_reg_3 = add_2_reg_2;
	add_2_reg_2 = add_2_reg_1;
	add_2_reg_1 = add_2;
end