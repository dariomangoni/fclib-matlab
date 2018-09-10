function [ok] = fclib_write_global(problem_filename, fclib_global)
    assert(fclib_global.spacedim == 2 || fclib_global.spacedim == 2)
    assert(exist(fclib_global.M,'var'))
    assert(exist(fclib_global.H,'var'))

    h5create(problem_filename,'/fclib_global',Inf);
    h5write(problem_filename,'/fclib_global/M',fclib_global.M);
    h5write(problem_filename,'/fclib_global/H',fclib_global.H);

    if isfield(fclib_global, 'G')
        h5write(problem_filename,'/fclib_global/G',fclib_global.G);
    end
        
    
end