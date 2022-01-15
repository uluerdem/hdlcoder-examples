function [s_body] = collect_inline_fcn(node_eq,tab_lvl)
    %Collecting function info
    fcn = functions(str2func(node_eq.op_name));
    fcn_name = node_eq.op_name;
    in_names = node_eq.inputs;
    out_names = node_eq.outputs;

    f_fcn = fopen(fcn.file,'r');
    s_fcn = fscanf(f_fcn,'%s');

    tab_str = "";
    for i = 1:tab_lvl
        tab_str = sprintf('\t%s',tab_str);
    end

    %Collecting output names
    outputs_fcn = cell(1,length(out_names));
    outputs_beg = strfind(s_fcn,'function')+8;
    outputs_end = strfind(s_fcn,fcn_name)-2;
    outputs_str = s_fcn(outputs_beg:outputs_end);
    outputs_str = strrep(outputs_str,'[','');
    outputs_str = strrep(outputs_str,']','');
    output_seperator_idx = strfind(outputs_str,',');
    if isempty(output_seperator_idx)
        outputs_fcn{1} = outputs_str;
    else
        outputs_fcn{1} = outputs_str(1:output_seperator_idx(1)-1);
        for i = 2:length(output_seperator_idx)
            outputs_fcn{i} = outputs_str(output_seperator_idx(i-1)+1:output_seperator_idx(i)-1);
        end
    end

    %Collecting input names
    inputs_fcn = cell(1,length(in_names));
    inputs_beg = strfind(s_fcn,fcn_name)+length(fcn_name)+1;
    inputs_end = strfind(s_fcn(inputs_beg:end),')');
    inputs_end = inputs_beg+inputs_end(1)-2;
    inputs_str = s_fcn(inputs_beg:inputs_end);
    input_seperator_idx = strfind(inputs_str,',');
    input_seperator_idx = [input_seperator_idx length(inputs_str)+1];
    if isempty(input_seperator_idx)
        inputs_fcn{1} = inputs_str;
    else
        inputs_fcn{1} = inputs_str(1:input_seperator_idx(1)-1);
        for i = 2:length(input_seperator_idx)
            inputs_fcn{i} = inputs_str(input_seperator_idx(i-1)+1:input_seperator_idx(i)-1);
        end
    end

    %Forming the function body
    body_end = strfind(s_fcn,'end')-2;
    s_body = s_fcn(inputs_end+2:body_end);

    for i = 1:length(inputs_fcn)
        s_body = strrep(s_body,inputs_fcn{i},sprintf('$IN_%d$',i));
    end
    for i = 1:length(outputs_fcn)
        s_body = strrep(s_body,outputs_fcn{i},sprintf('$OUT_%d$',i));
    end

    for i = 1:length(inputs_fcn)
        s_body = strrep(s_body,sprintf('$IN_%d$',i),in_names{i});
    end
    for i = 1:length(outputs_fcn)
        s_body = strrep(s_body,sprintf('$OUT_%d$',i),out_names{i});
    end
    
    s_body = sprintf('%s%s',tab_str,s_body);
    s_body = strrep(s_body,';',sprintf(';\n%s',tab_str));
    s_body = sprintf('%s;',s_body);
end