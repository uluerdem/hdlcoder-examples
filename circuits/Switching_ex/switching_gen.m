%1. Declarations
%1.1. IO Declarations
in_sel = Node('in_sel',0,1,@basic_buffer,{'in_sel'},{'num'});
in_data_1 = Node('in_data_1',0,1,@basic_buffer,{'in_data_1'},{'num'});
in_data_2 = Node('in_data_2',0,1,@basic_buffer,{'in_data_2'},{'num'});
in_data_3 = Node('in_data_3',0,1,@basic_buffer,{'in_data_3'},{'num'});
in_data_4 = Node('in_data_4',0,1,@basic_buffer,{'in_data_4'},{'num'});

out = Node('out',1,0,@basic_buffer,{'out'},{'num'});

%1.2. Circuit Declarations
sel_node = Node('sel',5,1,@sel4,{'sel_out'},{'num'});

%2. Connections
%2.1. IO Connections
Node.connect(in_sel,1,sel_node,1,0);
Node.connect(in_data_1,1,sel_node,2,0);
Node.connect(in_data_2,1,sel_node,3,0);
Node.connect(in_data_3,1,sel_node,4,0);
Node.connect(in_data_4,1,sel_node,5,0);

Node.connect(sel_node,1,out,1,0);

%2.2. Circuit Connections
%NA for this module

%3. Circuit Definition
input_nodes = [in_sel in_data_1 in_data_2 in_data_3 in_data_4];
output_nodes = out;
circuit_nodes = sel_node;

%4. Circuit Check
% print_circuit(input_nodes,circuit_nodes,output_nodes);

%5. Code Generation
gen_coder_fcn('switching_ex',input_nodes,circuit_nodes,output_nodes);