function [] = err_check_node_connection(nodes)
    for i = 1:length(nodes)
        curr_node = nodes(i);
        curr_outs = curr_node.output_connections;
        for j = 1:length(curr_outs.connected_nodes)
            if isempty(curr_outs.connected_nodes{j})
                fprintf("WARNING (Node Connection Check): %s has unconnected output pin: %d\n",curr_node.name,j);
            end
        end
    end

    for i = 1:length(nodes)
        curr_node = nodes(i);
        curr_ins = curr_node.input_connections;

        for j = 1:length(curr_ins.connected_nodes)
            if isempty(curr_ins.connected_nodes{j})
                error("ERROR (Node Connection Check): %s has unconnected input %d",curr_node.name,j);
            end
        end
    end
end