function [fclib_solution] = fclib_read_solution(problem_filename)
    if ~exist(problem_filename,'file')
        error(['Missing file: "',problem_filename])
    end77

    [nv, nr, nl] = read_nvnunrnl(problem_filename);

    

end