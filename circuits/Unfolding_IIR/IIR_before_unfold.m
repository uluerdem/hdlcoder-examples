function [y] = IIR_before_unfold(x,a)
	persistent add_reg_1 add_reg_2 add_reg_3 add_reg_4 add_reg_5 add_reg_6 add_reg_7 add_reg_8 add_reg_9;
	if (isempty(add_reg_1))
		 add_reg_1 = 0; add_reg_2 = 0; add_reg_3 = 0; add_reg_4 = 0; add_reg_5 = 0; add_reg_6 = 0; add_reg_7 = 0; add_reg_8 = 0; add_reg_9 = 0;
	end

	[mul] = basic_mul(a,add_reg_9);
	[add] = basic_add(x,mul);

	y = add;

	add_reg_9 = add_reg_8;
	add_reg_8 = add_reg_7;
	add_reg_7 = add_reg_6;
	add_reg_6 = add_reg_5;
	add_reg_5 = add_reg_4;
	add_reg_4 = add_reg_3;
	add_reg_3 = add_reg_2;
	add_reg_2 = add_reg_1;
	add_reg_1 = add;
end