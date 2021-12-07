classdef Node < handle
    properties
        name;
        input_pin_cnt;
        output_pin_cnt;
        output_names;
        output_types;
        node_op;
        input_connections = Connection.empty;
        output_connections = Connection.empty;
    end
    
    methods
        function this = Node(name,input_pin_cnt,output_pin_cnt,node_op,output_names,output_types)
            this.name = name;
            this.input_pin_cnt = input_pin_cnt;
            this.output_pin_cnt = output_pin_cnt;
            this.output_names = output_names;
            this.output_types = output_types;
            this.node_op = node_op;
            this.input_connections = Connection(input_pin_cnt);
            this.output_connections = Connection(output_pin_cnt);
        end
    end

    methods(Static)
        function [] = connect(node1,out_pin_no,node2,in_pin_no,delay)
            node1.output_connections.addConnection(out_pin_no,node2,in_pin_no,delay);
            node2.input_connections.addConnection(in_pin_no,node1,out_pin_no,delay);
        end

        function name = getInputName(node,in_pin_num)
            in_node = node.input_connections.connected_nodes{in_pin_num};
            in_node_pin_no = node.input_connections.connected_pins{in_pin_num};
            in_delay = node.input_connections.delays{in_pin_num};

            in_name = in_node.output_names{in_node_pin_no};
            if in_delay > 0
                in_reg = sprintf('_reg_%d',in_delay);
            else
                in_reg = "";
            end
            name = sprintf('%s%s',in_name,in_reg);
        end

        function [] = printNode(node)
            fprintf(sprintf("Node '%s' mapping: \n",node.name))
            fprintf("\t Input Pins: \n")
            for i = 1:length(node.input_connections.connected_nodes)
                fprintf(sprintf("\t\tPin %d:\n",i));
                for j = 1:length(node.input_connections.connected_nodes{i})
                    fprintf(sprintf("\t\t\tNode '%s' | Pin %d | Delay: %d\n",...
                            node.input_connections.connected_nodes{i}(j).name, ...
                            node.input_connections.connected_pins{i}(j), ...
                            node.input_connections.delays{i}(j)));
                end
            end
            fprintf("\t Output Pins: \n")
            for i = 1:length(node.output_connections.connected_nodes)
                fprintf(sprintf("\t\tPin %d:\n",i));
                for j = 1:length(node.output_connections.connected_nodes{i})
                    fprintf(sprintf("\t\t\tNode '%s' | Pin %d | Delay: %d\n",...
                            node.output_connections.connected_nodes{i}(j).name, ...
                            node.output_connections.connected_pins{i}(j), ...
                            node.output_connections.delays{i}(j)));
                end
            end
        end
    end
end