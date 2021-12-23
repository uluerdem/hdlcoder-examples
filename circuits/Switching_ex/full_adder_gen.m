%1. Declarations
%1.1. IO Declarations
in_0 = Node('in_0',0,1,@basic_buffer,{'in_0'},{'bin'});
in_1 = Node('in_1',0,1,@basic_buffer,{'in_1'},{'bin'});
in_carry = Node('in_carry',0,1,@basic_buffer,{'in_carry'},{'bin'});
out_add = Node('out_add',1,0,@basic_buffer,{'out_add'},{'bin'});
out_carry = Node('out_carry',1,0,@basic_buffer,{'out_carry'},{'bin'});

%1.2. Circuit Declarations
add_xor_1 = Node('ADD_XOR_1',2,1,@basic_xor,{'ADD_XOR_1'},{'bin'});
add_xor_2 = Node('ADD_XOR_2',2,1,@basic_xor,{'ADD_XOR_2'},{'bin'});
carry_and_1 = Node('CARRY_AND_1',2,1,@basic_and,{'CARRY_AND_1'},{'bin'});
carry_and_2 = Node('CARRY_AND_2',2,1,@basic_and,{'CARRY_AND_2'},{'bin'});
carry_or = Node('CARRY_OR',2,1,@basic_or,{'CARRY_OR'},{'bin'});

%2. Connections
%2.1. IO Connections
Node.connect(in_0,1,add_xor_1,1,0);
Node.connect(in_0,1,carry_and_2,1,0);
Node.connect(in_1,1,add_xor_1,2,0);
Node.connect(in_1,1,carry_and_2,2,0);
Node.connect(in_carry,1,add_xor_2,2,0);
Node.connect(in_carry,1,carry_and_1,2,0);
Node.connect(add_xor_2,1,out_add,1,0);
Node.connect(carry_or,1,out_carry,1,0);

%2.2. Circuit Connections
Node.connect(add_xor_1,1,add_xor_2,1,0);
Node.connect(add_xor_1,1,carry_and_1,1,0);
Node.connect(carry_and_1,1,carry_or,1,0);
Node.connect(carry_and_2,1,carry_or,2,0);

%3. Circuit Definition
input_nodes = [in_0 in_1 in_carry];
output_nodes = [out_add out_carry];
circuit_nodes = [add_xor_1 add_xor_2 carry_and_1 carry_and_2 carry_or];

%4. Circuit Check
% print_circuit(input_nodes,circuit_nodes,output_nodes);

%5. Code Generation
gen_coder_fcn('full_adder',input_nodes,circuit_nodes,output_nodes);