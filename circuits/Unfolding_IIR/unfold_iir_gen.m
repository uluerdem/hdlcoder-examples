%1. Declarations
%1.1. IO Declarations
x = Node('x',0,1,@basic_buffer,{'x'},{'num'});
a = Node('a',0,1,@basic_buffer,{'a'},{'num'});
y = Node('y',1,0,@basic_buffer,{'y'},{'num'});

%1.2. Circuit Declarations
N1 = Node('add',2,1,@basic_add,{'add'},{'num'});
N2 = Node('mul',2,1,@basic_mul,{'mul'},{'num'});

%2. Connections
%2.1. IO Connections
Node.connect(x,1,N1,1,0);
Node.connect(a,1,N2,1,0);
Node.connect(N1,1,y,1,0);

%2.2. Circuit Connections
Node.connect(N1,1,N2,2,9);
Node.connect(N2,1,N1,2,0);

%3. Circuit Definition
input_nodes = [x,a];
output_nodes = y;
circuit_nodes = [N1,N2];

%4. Circuit Check
% print_circuit(input_nodes,circuit_nodes,output_nodes);

%5. Code Generation
gen_coder_fcn('IIR_before_unfold',input_nodes,circuit_nodes,output_nodes);

[i_nodes_unfolded_2,c_nodes_unfolded_2,o_nodes_unfolded_2] = unfold(input_nodes,circuit_nodes,output_nodes,2);
gen_coder_fcn('IIR_after_unfold_2',i_nodes_unfolded_2,c_nodes_unfolded_2,o_nodes_unfolded_2);

[i_nodes_unfolded_3,c_nodes_unfolded_3,o_nodes_unfolded_3] = unfold(input_nodes,circuit_nodes,output_nodes,3);
gen_coder_fcn('IIR_after_unfold_3',i_nodes_unfolded_3,c_nodes_unfolded_3,o_nodes_unfolded_3);