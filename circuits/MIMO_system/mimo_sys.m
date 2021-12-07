function [y_3k_p2,y_3k_p1,y_3k] = mimo_sys(x_3k_p2,x_3k_p1,x_3k,a,b,c)
	persistent x_3k_p2_reg_1 x_3k_p1_reg_1;
	if (isempty(x_3k_p2_reg_1))
		 x_3k_p2_reg_1 = 0; x_3k_p1_reg_1 = 0;
	end

	[mimo_mul1] = mimo_mul(x_3k_p2,x_3k_p1,x_3k,a,b,c);
	[mimo_mul2] = mimo_mul(x_3k_p2_reg_1,x_3k_p1,x_3k,c,a,b);
	[mimo_mul3] = mimo_mul(x_3k_p2_reg_1,x_3k_p1_reg_1,x_3k,b,c,a);

	y_3k_p2 = mimo_mul1;
	y_3k_p1 = mimo_mul2;
	y_3k = mimo_mul3;

	x_3k_p2_reg_1 = x_3k_p2;
	x_3k_p1_reg_1 = x_3k_p1;
end