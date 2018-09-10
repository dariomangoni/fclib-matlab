function [tree_list] = get_tree(path)

    t_char = char(path);
    buffer = [];
    cell_sel = 0;
    for char_sel = 1:length(t_char)
        if (t_char(char_sel) == '/' || char_sel == length(t_char))
            if (char_sel == length(t_char))
                buffer = [buffer, t_char(char_sel)];
            end
            if ~isempty(buffer)
                cell_sel = cell_sel + 1;
                tree_list{cell_sel} = buffer;
                buffer = [];
            end
        else
            buffer = [buffer, t_char(char_sel)];
        end
    end
end