%1. Declarations
%1.1. IO Declarations
x_3k_p2 = Node('x_3k_p2',0,1,@basic_buffer,{'x_3k_p2'},{'num'});
x_3k_p1 = Node('x_3k_p1',0,1,@basic_buffer,{'x_3k_p1'},{'num'});
x_3k = Node('x_3k',0,1,@basic_buffer,{'x_3k'},{'num'});
a = Node('a',0,1,@basic_buffer,{'a'},{'num'});
b = Node('b',0,1,@basic_buffer,{'b'},{'num'});
c = Node('c',0,1,@basic_buffer,{'c'},{'num'});
y_3k_p2 = Node('y_3k_p2',1,0,@basic_buffer,{'y_3k_p2'},{'num'});
y_3k_p1 = Node('y_3k_p1',1,0,@basic_buffer,{'y_3k_p1'},{'num'});
y_3k = Node('y_3k',1,0,@basic_buffer,{'y_3k'},{'num'});

%1.2. Circuit Declarations
N1 = Node('mimo_mul1',6,1,@mimo_mul,{'mimo_mul1'},{'num'});
N2 = Node('mimo_mul2',6,1,@mimo_mul,{'mimo_mul2'},{'num'});
N3 = Node('mimo_mul3',6,1,@mimo_mul,{'mimo_mul3'},{'num'});

%2. Connections
%2.1. IO Connections
Node.connect(x_3k_p2,1,N1,1,0);
Node.connect(x_3k_p1,1,N1,2,0);
Node.connect(x_3k,1,N1,3,0);
Node.connect(a,1,N1,4,0);
Node.connect(b,1,N1,5,0);
Node.connect(c,1,N1,6,0);
Node.connect(x_3k_p2,1,N2,1,1);
Node.connect(x_3k_p1,1,N2,2,0);
Node.connect(x_3k,1,N2,3,0);
Node.connect(c,1,N2,4,0);
Node.connect(a,1,N2,5,0);
Node.connect(b,1,N2,6,0);
Node.connect(x_3k_p2,1,N3,1,1);
Node.connect(x_3k_p1,1,N3,2,1);
Node.connect(x_3k,1,N3,3,0);
Node.connect(b,1,N3,4,0);
Node.connect(c,1,N3,5,0);
Node.connect(a,1,N3,6,0);

Node.connect(N1,1,y_3k_p2,1,0);
Node.connect(N2,1,y_3k_p1,1,0);
Node.connect(N3,1,y_3k,1,0);
%2.2. Circuit Connections
%NA for this module.

%3. Circuit Definition
input_nodes = [x_3k_p2,x_3k_p1,x_3k,a,b,c];
output_nodes = [y_3k_p2,y_3k_p1,y_3k];
circuit_nodes = [N1,N2,N3];

%4. Circuit Check
% print_circuit(input_nodes,circuit_nodes,output_nodes)

%5. Code Generation
gen_coder_fcn('mimo_sys',input_nodes,circuit_nodes,output_nodes);