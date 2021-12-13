function [U_0,U_1] = IIR_2_after_unfold_2(P_0,P_1,S_c_0,S_c_1,T_c_0,T_c_1)
	persistent R_out_0_reg_1 R_out_1_reg_1 R_out_1_reg_2;
	if (isempty(R_out_0_reg_1))
		 R_out_0_reg_1 = 0; R_out_1_reg_1 = 0; R_out_1_reg_2 = 0;
	end

	[S_out_0] = basic_mul(S_c_0,R_out_1_reg_2);
	[S_out_1] = basic_mul(S_c_1,R_out_0_reg_1);
	[T_out_0] = basic_mul(T_c_0,R_out_0_reg_1);
	[T_out_1] = basic_mul(T_c_1,R_out_1_reg_1);
	[Q_out_0] = basic_add(S_out_0,T_out_0);
	[Q_out_1] = basic_add(S_out_1,T_out_1);
	[R_out_0] = basic_add(P_0,Q_out_0);
	[R_out_1] = basic_add(P_1,Q_out_1);

	U_0 = R_out_0;
	U_1 = R_out_1;

	R_out_0_reg_1 = R_out_0;
	R_out_1_reg_2 = R_out_1_reg_1;
	R_out_1_reg_1 = R_out_1;
end