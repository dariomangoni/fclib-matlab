function [fclib_global]  = fclib_read_global(problem_filename)
    if ~exist(problem_filename,'file')
        error(['Missing file: "',problem_filename])
    end
    
    fclib_global.spacedim = h5read(problem_filename,'/fclib_global/spacedim');
    fclib_global.M = read_matrix(problem_filename, '/fclib_global/M');
    fclib_global.H = read_matrix(problem_filename, '/fclib_global/H');
    fclib_global = read_global_vectors(problem_filename, '/fclib_global/vectors', fclib_global);

    temp_struct = h5info(problem_filename,'/fclib_global');
    if any(arrayfun(@(x) strcmp(x,'/fclib_global/G'), {temp_struct.Groups.Name}))
        fclib_global.G = read_matrix(problem_filename, '/fclib_global/G');
    end

    if any(arrayfun(@(x) strcmp(x,'/fclib_global/info'), {temp_struct.Groups.Name}))
        fclib_global.info = read_problem_info(problem_filename, '/fclib_global/info');
    end

end