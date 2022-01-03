function [] = matrix_sum_gen(name,rel_mtx,reg_mtx)
    in_cnt = size(rel_mtx,2);
    out_cnt = size(rel_mtx,1);

    %Creating IO Nodes
    for i = 1:in_cnt
        input_nodes(i) = Node(sprintf('%s_in_%d',name,i),0,1,@basic_buffer,{sprintf('%s_in_%d',name,i)},{'num'});
    end
   
    for i = 1:out_cnt
        output_nodes(i) = Node(sprintf('%s_out_%d',name,i),1,0,@basic_buffer,{sprintf('%s_out_%d',name,i)},{'num'});
    end
    
    %Generating Sum Lists
    sum_arg_nodes = cell(1,out_cnt);
    for i = 1:out_cnt
        valid_idx = find(rel_mtx(i,:));
        for j = 1:length(valid_idx)
            out_name = sprintf('%s_arg_%d',output_nodes(i).name,j);
            mul_val = rel_mtx(i,valid_idx(j));
            switch mul_val
                case -1
                    sum_arg_nodes{i}(j) = Node(out_name,1,1,@neg,{out_name},{'num'});
                case 1
                    sum_arg_nodes{i}(j) = Node(out_name,1,1,@basic_buffer,{out_name},{'num'});
                otherwise
                    constant_node = Node(sprintf('%d',mul_val),0,1,@basic_buffer,{sprintf('%d',mul_val)},{'num'});
                    sum_arg_nodes{i}(j) = Node(out_name,2,1,@basic_mul,{out_name},{'num'});
                    Node.connect(constant_node,1,sum_arg_nodes{i}(j),2,0);
            end
            Node.connect(input_nodes(valid_idx(j)),1,sum_arg_nodes{i}(j),1,reg_mtx(i,valid_idx(j)));
        end
    end

    %Creating & Connecting Sum Nodes
    sum_nodes = cell(1,out_cnt);
    for i = 1:out_cnt
        if length(sum_arg_nodes{i}) == 1
            Node.connect(sum_arg_nodes{i},1,output_nodes(i),1,0);
        else
            sum_name = sprintf('%s_sum_%d',output_nodes(i).name,1);
            sum_nodes{i}(1) = Node(sum_name,2,1,@basic_add,{sum_name},{'num'});
            Node.connect(sum_arg_nodes{i}(1),1,sum_nodes{i}(1),1,0);
            Node.connect(sum_arg_nodes{i}(2),1,sum_nodes{i}(1),2,0);
            for j = 3:length(sum_arg_nodes{i})
                sum_name = sprintf('%s_sum_%d',output_nodes(i).name,j-1);
                sum_nodes{i}(j-1) = Node(sum_name,2,1,@basic_add,{sum_name},{'num'});
                Node.connect(sum_nodes{i}(j-2),1,sum_nodes{i}(j-1),1,0);
                Node.connect(sum_arg_nodes{i}(j),1,sum_nodes{i}(j-1),2,0);
            end
            Node.connect(sum_nodes{i}(length(sum_arg_nodes{i})-1),1,output_nodes(i),1,0);
        end
    end
   
    %Listing All the Nodes and creating function
    k = 1;
    for i = 1:length(sum_arg_nodes)
        for j = 1:length(sum_arg_nodes{i})
            circuit_nodes(k) = sum_arg_nodes{i}(j);
            k = k + 1;
        end
    end
   
    for i = 1:length(sum_nodes)
        for j = 1:length(sum_nodes{i})
            circuit_nodes(k) = sum_nodes{i}(j);
            k = k + 1;
        end
    end
   
    gen_coder_fcn(name,input_nodes,circuit_nodes,output_nodes);
    
end