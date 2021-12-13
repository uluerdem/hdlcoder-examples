%1. Declarations
%1.1. IO Declarations
P = Node('P',0,1,@basic_buffer,{'P'},{'num'});
S_c = Node('S_c',0,1,@basic_buffer,{'S_c'},{'num'});
T_c = Node('T_c',0,1,@basic_buffer,{'T_c'},{'num'});
U = Node('U',1,0,@basic_buffer,{'U'},{'num'});

%1.2. Circuit Declarations
Q = Node('Q',2,1,@basic_add,{'Q_out'},{'num'});
R = Node('R',2,1,@basic_add,{'R_out'},{'num'});
S = Node('S',2,1,@basic_mul,{'S_out'},{'num'});
T = Node('T',2,1,@basic_mul,{'T_out'},{'num'});

%2. Connections
%2.1. IO Connections
Node.connect(P,1,R,1,0);
Node.connect(S_c,1,S,1,0);
Node.connect(T_c,1,T,1,0);
Node.connect(R,1,U,1,0);

%2.2. Circuit Connections
Node.connect(S,1,Q,1,0);
Node.connect(T,1,Q,2,0);
Node.connect(Q,1,R,2,0);
Node.connect(R,1,S,2,3);
Node.connect(R,1,T,2,2);

%3. Circuit Definition
input_nodes = [P S_c T_c];
output_nodes = U;
circuit_nodes = [Q R S T];

%4. Circuit Check
% print_circuit(input_nodes,circuit_nodes,output_nodes);

%5. Code Generation
gen_coder_fcn('IIR_2_before_unfold',input_nodes,circuit_nodes,output_nodes);

[i_nodes_unfolded_2,c_nodes_unfolded_2,o_nodes_unfolded_2] = unfold(input_nodes,circuit_nodes,output_nodes,2);
gen_coder_fcn('IIR_2_after_unfold_2',i_nodes_unfolded_2,c_nodes_unfolded_2,o_nodes_unfolded_2);