function [] = add_sub_gen(name,relation_matrix,delay_matrix)
    in_cnt = size(relation_matrix,2);
    out_cnt = size(relation_matrix,1);
   
    for i = 1:in_cnt
        input_nodes(i) = Node(sprintf('%s_in_%d',name,i),0,1,@basic_buffer,{sprintf('%s_in_%d',name,i)},{'num'});
    end
   
    for i = 1:out_cnt
        output_nodes(i) = Node(sprintf('%s_out_%d',name,i),1,0,@basic_buffer,{sprintf('%s_out_%d',name,i)},{'num'});
    end
   
    circuit_nodes = cell(1,out_cnt);
    for i = 1:out_cnt
        sum_idx = find(relation_matrix(i,:));
        sum_val = relation_matrix(i,sum_idx);
        delays = delay_matrix(i,:);
        if length(sum_val) == 1
            if sum_val < 0
                circuit_nodes{i}(1) = Node(sprintf('%s_in_%d_neg',name,sum_idx),1,1,@neg,{sprintf('%s_in_%d_neg',name,sum_idx)},{'num'});
                Node.connect(input_nodes(sum_idx),1,circuit_nodes{i}(1),1,0);
                Node.connect(circuit_nodes{i}(1),1,output_nodes(i),1,delays(sum_idx));
            else
                Node.connect(input_nodes(sum_idx),1,output_nodes(i),1,delays(sum_idx));
            end
        else            
            for j = 1:length(sum_idx)-1
                circuit_nodes{i}(j) = Node(sprintf('%s_out_%d_sum_%d',name,i,j),2,1,@basic_add,{sprintf('%s_out_%d_sum_%d',name,i,j)},{'num'});
                if j > 1
                    Node.connect(circuit_nodes{i}(j-1),1,circuit_nodes{i}(j),1,0);
                end
            end
            Node.connect(circuit_nodes{i}(length(sum_idx)-1),1,output_nodes(i),1,0);
           
            neg_offset = length(sum_idx);
           
            if sum_val(1) < 0
                circuit_nodes{i}(length(sum_idx)) = Node(sprintf('%s_in_%d_neg',name,sum_idx(1)),1,1,@neg,{sprintf('%s_in_%d_neg',name,sum_idx(1))},{'num'});
                Node.connect(input_nodes(sum_idx(1)),1,circuit_nodes{i}(length(sum_idx)),1,0);
                Node.connect(circuit_nodes{i}(length(sum_idx)),1,circuit_nodes{i}(1),1,delays(sum_idx(1)));
                neg_offset = neg_offset + 1;
            else
                Node.connect(input_nodes(sum_idx(1)),1,circuit_nodes{i}(1),1,delays(sum_idx(1)));
            end
           
            for j = 2:length(sum_idx)
                if sum_val(j) < 0                    
                    circuit_nodes{i}(neg_offset) = Node(sprintf('%s_in_%d_neg',name,sum_idx(j)),1,1,@neg,{sprintf('%s_in_%d_neg',name,sum_idx(j))},{'num'});
                    Node.connect(input_nodes(sum_idx(j)),1,circuit_nodes{i}(neg_offset),1,0);
                    Node.connect(circuit_nodes{i}(neg_offset),1,circuit_nodes{i}(j-1),2,delays(sum_idx(j)));
                    neg_offset = neg_offset + 1;
                else
                    Node.connect(input_nodes(sum_idx(j)),1,circuit_nodes{i}(j-1),2,delays(sum_idx(j)));
                end
            end
        end
    end
   
    k = 1;
    for i = 1:length(circuit_nodes)
        for j = 1:length(circuit_nodes{i})
            circuit_nodes_arr(k) = circuit_nodes{i}(j);
            k = k + 1;
        end
    end
   
    gen_coder_fcn(name,input_nodes,circuit_nodes_arr,output_nodes);
end