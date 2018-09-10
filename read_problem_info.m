function [fclib_info] = read_problem_info(problem_filename, info_datasetname)

	temp_struct = h5info(problem_filename,info_datasetname);
	if any(arrayfun(@(x) strcmp(x,'title'), {temp_struct.Datasets.Name}))
        fclib_info.title = h5read(problem_filename,[info_datasetname,'/title']);
    end
	if any(arrayfun(@(x) strcmp(x,'description'), {temp_struct.Datasets.Name}))
        fclib_info.description = h5read(problem_filename,[info_datasetname,'/description']);
    end
	if any(arrayfun(@(x) strcmp(x,'math_info'), {temp_struct.Datasets.Name}))
        fclib_info.math_info = h5read(problem_filename,[info_datasetname,'/math_info']);
    end
	

end