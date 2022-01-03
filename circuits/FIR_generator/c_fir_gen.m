function [] = c_fir_gen(name,coeffs,type)
    coef_no = length(coeffs);

    %Input Nodes
    input_nodes(1) = Node(sprintf('%s_in',name),0,1,@basic_buffer,{sprintf('%s_in',name)},{'num'});

    %Circuit Nodes
        %Multiplication Nodes
    for i = 1:coef_no
        circuit_nodes(i) = Node(sprintf('%s_mul_%d',name,i),2,1,@basic_mul,{sprintf('%s_mul_%d',name,i)},{'num'});
    end

        %Addition Nodes
    for i = 1:coef_no-1
        circuit_nodes(i+coef_no) = Node(sprintf('%s_add_%d',name,i),2,1,@basic_add,{sprintf('%s_add_%d',name,i)},{'num'});
    end

    %Output Node
    output_nodes = Node(sprintf('%s_out',name),1,0,@basic_buffer,{sprintf('%s_out',name)},{'num'});

    %Connections
    switch(type)
        case 'direct'
            %Input Connections
            for i = 1:coef_no
                Node.connect(input_nodes(1),1,circuit_nodes(i),2,i-1);
                c_node = Node(sprintf('%d',coeffs(i)),1,1,@basic_buffer,{sprintf('%d',coeffs(i))},{'num'});
                Node.connect(c_node,1,circuit_nodes(i),1,0);
            end
            
            %Circuit Connections
            Node.connect(circuit_nodes(1),1,circuit_nodes(coef_no+1),1,0);
            Node.connect(circuit_nodes(2),1,circuit_nodes(coef_no+1),2,0);
            for i = 1:coef_no-2
                Node.connect(circuit_nodes(i+2),1,circuit_nodes(i+coef_no+1),1,0);
                Node.connect(circuit_nodes(i+coef_no),1,circuit_nodes(i+coef_no+1),2,0);
            end
            
            %Output Connections
            Node.connect(circuit_nodes(end),1,output_nodes(1),1,0);
        case 'transpose'
            %Input Connections
            for i = 1:coef_no
                Node.connect(input_nodes(1),1,circuit_nodes(i),2,0);
                c_node = Node(sprintf('%d',coeffs(end-i+1)),1,1,@basic_buffer,{sprintf('%d',coeffs(i))},{'num'});
                Node.connect(c_node,1,circuit_nodes(i),1,0);
            end
            
            %Circuit Connections
            Node.connect(circuit_nodes(1),1,circuit_nodes(coef_no+1),1,1);
            for i = 2:coef_no
                Node.connect(circuit_nodes(i),1,circuit_nodes(coef_no+i-1),2,0);
            end

            for i = 1:coef_no-2
                Node.connect(circuit_nodes(coef_no+i),1,circuit_nodes(coef_no+i+1),1,1);
            end
            
            %Output Connections
            Node.connect(circuit_nodes(end),1,output_nodes(1),1,0);
        otherwise
            error('Undefined FIR type')
    end

    %Generating function
    gen_coder_fcn(name,input_nodes,circuit_nodes,output_nodes);
end