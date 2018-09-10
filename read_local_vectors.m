function [fclib_local] = read_local_vectors(problem_filename, vectors_datasetname, fclib_local)
	assert( exist(problem_filename,'file') ~= 0, ['Missing file: "', problem_filename]);
	assert( rem(fclib_local.W.m, fclib_local.spacedim) == 0, "number of W columns is not divisble by the spatial dimension");


	fclib_local.q = h5read(problem_filename,[vectors_datasetname,'/q']);
	fclib_local.mu = h5read(problem_filename,[vectors_datasetname,'/mu']);

	if isfield(fclib_local, 'G')
		fclib_local.s = h5read(problem_filename,[vectors_datasetname,'/s']);
	end

end