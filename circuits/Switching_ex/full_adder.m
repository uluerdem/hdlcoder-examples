function [out_add,out_carry] = full_adder(in_0,in_1,in_carry)
	[ADD_XOR_1] = basic_xor(in_0,in_1);
	[CARRY_AND_2] = basic_and(in_0,in_1);
	[ADD_XOR_2] = basic_xor(ADD_XOR_1,in_carry);
	[CARRY_AND_1] = basic_and(ADD_XOR_1,in_carry);
	[CARRY_OR] = basic_or(CARRY_AND_1,CARRY_AND_2);

	out_add = ADD_XOR_2;
	out_carry = CARRY_OR;

end