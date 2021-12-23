function [] = err_check_node_validity(nodes)
    for i = 1:length(nodes)
        curr_node = nodes(i);

        out_pin_cnt = curr_node.output_pin_cnt;
        if length(curr_node.output_names) < out_pin_cnt
            error("ERROR (Node Validity Check): %s has undefined output names",curr_node.name);
        end

        if length(curr_node.output_types) < out_pin_cnt
            error("ERROR (Node Validity Check): %s has undefined output types",curr_node.name);
        end
    end
end