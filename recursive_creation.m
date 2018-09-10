clear variables
close all
clc

t_char = '/level1/level2/obj';
t_string = string(t_char);


buffer = [];
cell_sel = 0;
for char_sel = 1:length(t_char)
    if (t_char(char_sel) == '/' || char_sel == length(t_char))
        if (char_sel == length(t_char))
            buffer = [buffer, t_char(char_sel)];
        end
        if ~isempty(buffer)
            cell_sel = cell_sel + 1;
            cell_buf{cell_sel} = buffer;
            buffer = [];
        end
    else
        buffer = [buffer, t_char(char_sel)];
    end
end