%1. Declarations
%1.1. IO Declarations
in_0 = Node('in_0',0,1,@basic_buffer,{'in_0'},{'bin'});
in_1 = Node('in_1',0,1,@basic_buffer,{'in_1'},{'bin'});
out = Node('out',1,0,@basic_buffer,{'out'},{'bin'});

%1.2. Circuit Declarations
full_adder = Node('full_adder',3,2,@full_adder,{'full_adder_sum','full_adder_carry'},{'bin','bin'});

%2. Connections
%2.1. IO Connections
Node.connect(in_0,1,full_adder,1,0);
Node.connect(in_1,1,full_adder,2,0);
Node.connect(full_adder,1,out,1,0);

%2.2. Circuit Connections
Node.connect(full_adder,2,full_adder,3,1);

%3. Circuit Definition
input_nodes = [in_0 in_1];
output_nodes = out;
circuit_nodes = full_adder;

%4. Circuit Check
% print_circuit(input_nodes,circuit_nodes,output_nodes);

%5. Code Generation
gen_coder_fcn('bit_serial_adder',input_nodes,circuit_nodes,output_nodes);