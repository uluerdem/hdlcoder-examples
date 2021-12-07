function [equations] = collect_equations(nodes)
    equations = cell(length(nodes),1);
    for i = 1:length(nodes)
        curr_node = nodes(i);

        equations{i}.outputs = cell(curr_node.output_pin_cnt,1);
        for j = 1:curr_node.output_pin_cnt
            equations{i}.outputs{j} = curr_node.output_names{j};
        end

        equations{i}.inputs = cell(curr_node.input_pin_cnt,1);
        for j = 1:curr_node.input_pin_cnt
            equations{i}.inputs{j} = Node.getInputName(curr_node,j);
        end

        ff = functions(curr_node.node_op);
        equations{i}.op_name = ff.function;
    end
end