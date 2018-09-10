function [structure] = HD5_to_structure(filename)
    hdf5_struct = h5info(filename,'/');

    for groups_sel = 1:length(hdf5_struct.Groups)
        
    end

end


function parse_dataset(group)
    
end