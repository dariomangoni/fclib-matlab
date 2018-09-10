function [fclib_solution] = read_solution(solution_filename)

    temp_struct = h5info(solution_filename,'/solution');
	if any(arrayfun(@(x) strcmp(x,'v'), {temp_struct.Datasets.Name}))
		fclib_solution.v = h5read(solution_filename,'/solution/v');
    else
        fclib_solution.v = [];
    end
        
    if any(arrayfun(@(x) strcmp(x,'l'), {temp_struct.Datasets.Name}))
		fclib_solution.l = h5read(solution_filename,'/solution/l');
    else
        fclib_solution.l = [];
    end
        
    fclib_solution.u = h5read(solution_filename,'/solution/u');
    fclib_solution.r = h5read(solution_filename,'/solution/r');


end