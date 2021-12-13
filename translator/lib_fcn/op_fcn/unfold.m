function [unfold_input_nodes,unfold_circuit_nodes,unfold_output_nodes] = unfold(input_nodes,circuit_nodes,output_nodes,unfold_num)
    J = unfold_num;
    N_i = length(input_nodes);
    N_c = length(circuit_nodes);
    N_o = length(output_nodes);

    %1.Cloning Nodes
    original_nodes = [input_nodes circuit_nodes output_nodes];
    for j = 1:J
        copied_nodes(j,:) = original_nodes;
        for i = 1:length(original_nodes)
            curr_node = original_nodes(i);
            curr_names = curr_node.output_names;
            for k = 1:length(curr_names)
                curr_names{k} = sprintf("%s_%d",curr_names{k},j-1);
            end
            copied_nodes(j,i) = Node(sprintf("%s_%d",curr_node.name,j-1),curr_node.input_pin_cnt,curr_node.output_pin_cnt,curr_node.node_op,curr_names,curr_node.output_types);
        end
    end

    %2.Connecting Unfolded Nodes
    for i = 1:length(original_nodes) %Iteration over nodes
        curr_node = original_nodes(i);
        curr_pins = curr_node.output_connections;
        for j = 1:length(curr_pins.connected_nodes) %Iteration over pins
            curr_connected_nodes = curr_pins.connected_nodes{j};
            curr_connected_pins = curr_pins.connected_pins{j};
            curr_delays = curr_pins.delays{j};
            for k = 1:length(curr_connected_nodes)
                out_node_idx = search_node(original_nodes,curr_connected_nodes(k));
                out_node_pin = curr_connected_pins(k);
                out_conn_delay = curr_delays(k);
                for unfold_idx = 1:J
                    new_delay = floor((unfold_idx-1+out_conn_delay)/J);
                    new_node_idx = rem(unfold_idx-1+out_conn_delay,J);
                    new_node = copied_nodes(new_node_idx+1,out_node_idx);
                    Node.connect(copied_nodes(unfold_idx,i),j,new_node,out_node_pin,new_delay);
                end
            end
        end
    end

    unfold_input_nodes = copied_nodes(:,1:N_i);
    unfold_circuit_nodes = copied_nodes(:,N_i+1:N_i+N_c);
    unfold_output_nodes = copied_nodes(:,N_i+N_c+1:end);

    unfold_input_nodes = unfold_input_nodes(:).';
    unfold_circuit_nodes = unfold_circuit_nodes(:).';
    unfold_output_nodes = unfold_output_nodes(:).';
end