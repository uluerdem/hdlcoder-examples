function [] = gen_coder_fcn(module_name,input_nodes,circuit_nodes,output_nodes)
    %Checking Node Validity
    err_check_node_validity([input_nodes circuit_nodes output_nodes])

    %Checking Node Connection Errors
    err_check_node_connection([input_nodes circuit_nodes output_nodes]);
    
    %Collecting Arguments
    input_args = cell(length(input_nodes),1);
    for i = 1:length(input_args)
        input_args{i} = input_nodes(i).name;
    end

    output_args = cell(length(output_nodes),1);
    for i = 1:length(output_args)
        output_args{i} = output_nodes(i).name;
    end

    %Collecting registers
    reg_check_nodes = [input_nodes(:);circuit_nodes(:)];
    regs = collect_regs(reg_check_nodes);

    %Collecting Node Equations
    node_equations = collect_equations(circuit_nodes);

    %Dependence Check
    node_order = dependence_order(circuit_nodes);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Printing function
    f_fcn = fopen(sprintf('%s.m',module_name),'w');
    
    %Header
    header = sprintf('function [');
    for i = 1:length(output_args)
        header = sprintf('%s%s,',header,output_args{i});
    end
    header = header(1:end-1);
    header = sprintf('%s] = %s(',header,module_name);
    for i = 1:length(input_args)
        header = sprintf('%s%s,',header,input_args{i});
    end
    header = header(1:end-1);
    header = sprintf('%s)\n',header);
    fprintf(f_fcn,header);
    
    %Register Declaration
    if ~isempty(regs)
        fprintf(f_fcn,sprintf('\tpersistent'));
        for i = 1:length(regs)
            for j = 1:regs{i}.reg_cnt
                fprintf(f_fcn,sprintf(' %s_reg_%d',regs{i}.name,j));
            end
        end
        fprintf(f_fcn,';\n');
        fprintf(f_fcn,sprintf('\tif (isempty(%s_reg_1))\n',regs{1}.name));
        fprintf(f_fcn,'\t\t');
        for i = 1:length(regs)
            for j = 1:regs{i}.reg_cnt
                if strcmp(regs{i}.type,'num')
                    fprintf(f_fcn,sprintf(' %s_reg_%d = 0;',regs{i}.name,j));
                elseif strcmp(regs{i}.type,'bin')
                    fprintf(f_fcn,sprintf(' %s_reg_%d = false;',regs{i}.name,j));
                else
                    error("ERROR (Output Type Check): %s's output type is not recognized",regs{i}.name);
                end
            end
        end
        fprintf(f_fcn,'\n\tend\n\n');
    end

    %Node Assignment
    for i = 1:length(circuit_nodes)
        i_node = node_order(i);
        curr_eq = sprintf('\t[');
        for j = 1:length(node_equations{i_node}.outputs)
            curr_eq = sprintf('%s%s,',curr_eq,node_equations{i_node}.outputs{j});
        end
        curr_eq = curr_eq(1:end-1);

        curr_eq = sprintf('%s] = %s(',curr_eq,node_equations{i_node}.op_name);
        for j = 1:length(node_equations{i_node}.inputs)
            curr_eq = sprintf('%s%s,',curr_eq,node_equations{i_node}.inputs{j});
        end
        curr_eq = curr_eq(1:end-1);

        curr_eq = sprintf('%s);\n',curr_eq);
        fprintf(f_fcn,curr_eq);
    end
    fprintf(f_fcn,'\n');

    %Output Assignment
    for i = 1:length(output_nodes)
        curr_out = output_nodes(i).name;
        curr_in = Node.getInputName(output_nodes(i),1);
        fprintf(f_fcn,'\t%s = %s;\n',curr_out,curr_in);
    end
    fprintf(f_fcn,'\n');

    %Register Update
    if ~isempty(regs)
        for i = 1:length(regs)
            for j = regs{i}.reg_cnt:-1:1
                if j == 1
                    fprintf(f_fcn,sprintf('\t%s_reg_1 = %s;\n',regs{i}.name,regs{i}.name));
                else
                    fprintf(f_fcn,sprintf('\t%s_reg_%d = %s_reg_%d;\n',regs{i}.name,j,regs{i}.name,j-1));
                end
            end
        end
    end
    fprintf(f_fcn,'end');
    fclose(f_fcn);
end