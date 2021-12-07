function [regs] = collect_regs(reg_check_nodes)
    regs = cell.empty;
    reg_cnt = 1;
    for i = 1:length(reg_check_nodes)
        curr_node = reg_check_nodes(i);
        curr_pins = curr_node.output_connections.delays;
        for j = 1:length(curr_pins)
            curr_pin = curr_pins{j};
            max_reg_val = 0;
            for k = 1:length(curr_pin)
                if curr_pin(k) > max_reg_val
                    max_reg_val = curr_pin(k);
                end
            end
            if max_reg_val > 0
%                 regs{reg_cnt} = {curr_node,j,curr_node.output_names{j},max_reg_val};
                regs{reg_cnt}.node = curr_node;
                regs{reg_cnt}.pin_no = j;
                regs{reg_cnt}.name = curr_node.output_names{j};
                regs{reg_cnt}.reg_cnt = max_reg_val;
                regs{reg_cnt}.type = curr_node.output_types{j};
                reg_cnt = reg_cnt + 1;
            end
        end
    end
end