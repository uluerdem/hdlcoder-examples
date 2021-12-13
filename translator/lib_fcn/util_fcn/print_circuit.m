function [] = print_circuit(input_nodes,circuit_nodes,output_nodes)
    for i = 1:length(input_nodes)
        Node.printNode(input_nodes(i));
    end
    
    for i = 1:length(circuit_nodes)
        Node.printNode(circuit_nodes(i));
    end
    
    for i = 1:length(output_nodes)
        Node.printNode(output_nodes(i));
    end
end