function [fclib_local]  = fclib_read_local(problem_filename)
    if ~exist(problem_filename,'file')
        error(['Missing file: "',problem_filename])
    end
    
    fclib_local.spacedim = h5read(problem_filename,'/fclib_local/spacedim');
    fclib_local.W = read_matrix(problem_filename, '/fclib_local/W');
    fclib_local = read_local_vectors(problem_filename, '/fclib_local/vectors', fclib_local);


    temp_struct = h5info(problem_filename,'/fclib_local');
    if any(arrayfun(@(x) strcmp(x,'/fclib_local/V'), {temp_struct.Groups.Name}))
        fclib_local.V = read_matrix(problem_filename, '/fclib_local/V');
        fclib_local.R = read_matrix(problem_filename, '/fclib_local/R');
    end

    if any(arrayfun(@(x) strcmp(x,'/fclib_local/info'), {temp_struct.Groups.Name}))
        fclib_local.info = read_problem_info(problem_filename, '/fclib_local/info');
    end

end