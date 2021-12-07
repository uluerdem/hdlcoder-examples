%1. Declarations
%1.1. IO Declarations
in1 = Node('in1',0,1,@basic_buffer,{'in1'},{'num'});
in2 = Node('in2',0,1,@basic_buffer,{'in2'},{'num'});
in3 = Node('in3',0,1,@basic_buffer,{'in3'},{'num'});
a = Node('a',0,1,@basic_buffer,{'a'},{'num'});
b = Node('b',0,1,@basic_buffer,{'b'},{'num'});
c = Node('c',0,1,@basic_buffer,{'c'},{'num'});
out = Node('out',1,0,@basic_buffer,{'out'},{'num'});

%1.2. Circuit Declarations
N1 = Node('N1',2,1,@basic_mul,{'N1_mul'},{'num'});
N2 = Node('N2',2,1,@basic_mul,{'N2_mul'},{'num'});
N3 = Node('N3',2,1,@basic_mul,{'N3_mul'},{'num'});
N4 = Node('N4',2,1,@basic_add,{'N4_add'},{'num'});
N5 = Node('N5',2,1,@basic_add,{'N5_add'},{'num'});

%2. Connections
%2.1. IO Connections
Node.connect(a,1,N1,1,0);
Node.connect(in1,1,N1,2,0);
Node.connect(b,1,N2,1,0);
Node.connect(in2,1,N2,2,0);
Node.connect(c,1,N3,1,0);
Node.connect(in3,1,N3,2,0);
Node.connect(N5,1,out,1,0)

%2.2. Circuit Connections
Node.connect(N1,1,N4,1,0);
Node.connect(N2,1,N4,2,0);
Node.connect(N4,1,N5,1,0);
Node.connect(N3,1,N5,2,0);

%3. Circuit Definition
input_nodes = [in1,in2,in3,a,b,c];
output_nodes = out;
circuit_nodes = [N1,N2,N3,N4,N5];

%4. Circuit Check
% for i = 1:length(input_nodes)
%     Node.printNode(input_nodes(i));
% end
% 
% for i = 1:length(circuit_nodes)
%     Node.printNode(circuit_nodes(i));
% end
% 
% for i = 1:length(output_nodes)
%     Node.printNode(output_nodes(i));
% end

%5. Code Generation
gen_coder_fcn('mimo_mul',input_nodes,circuit_nodes,output_nodes);