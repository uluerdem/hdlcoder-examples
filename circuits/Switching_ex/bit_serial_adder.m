function [out] = bit_serial_adder(in_0,in_1)
	persistent full_adder_carry_reg_1;
	if (isempty(full_adder_carry_reg_1))
		 full_adder_carry_reg_1 = false;
	end

	[full_adder_sum,full_adder_carry] = full_adder(in_0,in_1,full_adder_carry_reg_1);

	out = full_adder_sum;

	full_adder_carry_reg_1 = full_adder_carry;
end