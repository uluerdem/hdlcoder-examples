function [order] = dependence_order(nodes)
    order = zeros(length(nodes),1);
    last_idx = 1;
    dependent_idx = 1:length(nodes);
    idx_ref = dependent_idx;
    
    while(~isempty(dependent_idx))
        idx_ref = idx_ref(dependent_idx);
        nodes = nodes(dependent_idx);
        [independent_idx,dependent_idx] = check_dependence(nodes);
        order(last_idx:last_idx+length(independent_idx)-1) = idx_ref(independent_idx);
        last_idx = last_idx + length(independent_idx);
    end
end