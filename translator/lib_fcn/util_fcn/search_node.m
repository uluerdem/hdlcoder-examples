function [idx] = search_node(list,node)
    idx = -1;
    for i = 1:length(list)
        if list(i) == node
            if idx == -1
                idx = i;
            else
                idx = -2;
                return;
            end
        end
    end
end