function [independent_idx,dependent_idx] = check_dependence(nodes)
    dependence_list = cell(length(nodes),1);
    for i = 1:length(nodes)
        curr_in = nodes(i).input_connections;
        curr_in_num = length(curr_in.delays);
        dependence_cnt = 1;

        for j = 1:curr_in_num
            for k = 1:length(nodes)
                if curr_in.connected_nodes{j} == nodes(k) && curr_in.delays{j} == 0
                    dependence_list{i}(dependence_cnt) = k;
                    dependence_cnt = dependence_cnt + 1;
                end
            end
        end
    end

    independent_idx = [];
    dependent_idx = [];
    independent_node_cnt = 1;
    dependent_node_cnt = 1;
    for i = 1:length(nodes)
        if isempty(dependence_list{i})
            independent_idx(independent_node_cnt) = i;
            independent_node_cnt = independent_node_cnt + 1;
        else
            dependent_idx(dependent_node_cnt) = i;
            dependent_node_cnt = dependent_node_cnt + 1;
        end
    end
end