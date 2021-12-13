function [U] = IIR_2_before_unfold(P,S_c,T_c)
	persistent R_out_reg_1 R_out_reg_2 R_out_reg_3;
	if (isempty(R_out_reg_1))
		 R_out_reg_1 = 0; R_out_reg_2 = 0; R_out_reg_3 = 0;
	end

	[S_out] = basic_mul(S_c,R_out_reg_3);
	[T_out] = basic_mul(T_c,R_out_reg_2);
	[Q_out] = basic_add(S_out,T_out);
	[R_out] = basic_add(P,Q_out);

	U = R_out;

	R_out_reg_3 = R_out_reg_2;
	R_out_reg_2 = R_out_reg_1;
	R_out_reg_1 = R_out;
end