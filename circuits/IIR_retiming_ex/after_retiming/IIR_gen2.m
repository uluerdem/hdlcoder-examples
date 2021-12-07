%1. Declarations
%1.1. IO Declarations
x = Node('x',0,1,@basic_buffer,{'x'},{'num'});
a = Node('a',0,1,@basic_buffer,{'a'},{'num'});
b = Node('b',0,1,@basic_buffer,{'b'},{'num'});
y = Node('y',1,0,@basic_buffer,{'y'},{'num'});

%1.2. Circuit Declarations
N1 = Node('N1',2,1,@basic_add,{'n1_sum'},{'num'});
N2 = Node('N2',2,1,@basic_add,{'n2_sum'},{'num'});
N3 = Node('N3',2,1,@basic_mul,{'n3_mul'},{'num'});
N4 = Node('N4',2,1,@basic_mul,{'n4_mul'},{'num'});

%2. Connections
%2.1. IO Connections
Node.connect(x,1,N1,1,0);
Node.connect(a,1,N3,1,0);
Node.connect(b,1,N4,1,0);
Node.connect(N1,1,y,1,0);

%2.2. Circuit Connections
Node.connect(N1,1,N3,2,1);
Node.connect(N1,1,N4,2,2);
Node.connect(N2,1,N1,2,0);
Node.connect(N3,1,N2,1,1);
Node.connect(N4,1,N2,2,1);

%3. Circuit Definition
input_nodes = [x,a,b];
output_nodes = y;
circuit_nodes = [N1,N2,N3,N4];

% %4. Circuit Check
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
gen_coder_fcn('IIR2',input_nodes,circuit_nodes,output_nodes);