function [fclib_global] = read_global_vectors(problem_filename, vectors_datasetname, fclib_global)
    assert( exist(problem_filename,'file') ~= 0, ['Missing file: "', problem_filename]);
    assert( rem(fclib_global.H.n, fclib_global.spacedim) == 0, "number of H columns is not divisble by the spatial dimension");


    fclib_global.f = h5read(problem_filename,[vectors_datasetname,'/f']);


    fclib_global.w = h5read(problem_filename,[vectors_datasetname,'/w']);
    fclib_global.mu = h5read(problem_filename,[vectors_datasetname,'/mu']);

    if isfield(fclib_global, 'G')
        fclib_global.b = h5read(problem_filename,[vectors_datasetname,'/b']);
    end

end