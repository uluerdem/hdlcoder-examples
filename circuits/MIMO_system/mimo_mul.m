function [out] = mimo_mul(in1,in2,in3,a,b,c)
	[N1_mul] = basic_mul(a,in1);
	[N2_mul] = basic_mul(b,in2);
	[N3_mul] = basic_mul(c,in3);
	[N4_add] = basic_add(N1_mul,N2_mul);
	[N5_add] = basic_add(N4_add,N3_mul);

	out = N5_add;

end