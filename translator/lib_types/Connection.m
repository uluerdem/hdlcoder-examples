classdef Connection < handle
    properties
        connected_nodes = cell.empty;
        connected_pins = cell.empty;
        delays = cell.empty;
    end
    
    methods
        function this = Connection(len)
            this.connected_nodes = cell(len,1);
            this.connected_pins = cell(len,1);
            this.delays = cell(len,1);
        end

        function this = addConnection(this,pin_idx,node,connected_pin,delay)
            curr_len = length(this.connected_nodes{pin_idx});
            this.connected_nodes{pin_idx}(curr_len+1) = node;
            this.connected_pins{pin_idx}(curr_len+1) = connected_pin;
            this.delays{pin_idx}(curr_len+1) = delay;
        end
    end
end