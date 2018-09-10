function [nv, nr, nl] = read_nvnunrnl (problem_filename)
    nv = -1;
    nr = -1;
    nl = -1;
    temp_struct = h5info(problem_filename,'/');
    if any(arrayfun(@(x) strfind(x,'/fclib_global'), {temp_struct.Groups}))
        nv = read_problem_info(problem_filename, '/fclib_global/M/n');
        nr = read_problem_info(problem_filename, '/fclib_global/H/n');
        temp_struct2 = h5info(problem_filename,'/fclib_global');
        if any(arrayfun(@(x) strcmp(x,'G'), {temp_struct2.Groups}))
            nl = h5read(problem_filename,'/fclib_global/G/n');
        else
            nl =0;
        end
    elseif any(arrayfun(@(x) strfind(x,'/fclib_local'), {temp_struct.Groups}))
        nv = 0;
        nr = read_problem_info(problem_filename, '/fclib_local/W/n');
        temp_struct2 = h5info(problem_filename,'/fclib_local');
        if any(arrayfun(@(x) strcmp(x,'R'), {temp_struct2.Groups}))
            nl = h5read(problem_filename,'/fclib_global/R/n');
        else
            nl =0;
        end
    else
        assert(0,"This is not Global nor Local solution file1")
    end

    allgood = 1;
end