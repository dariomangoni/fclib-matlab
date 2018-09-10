function [fclib_matrix] = read_matrix(problem_filename, matrix_datasetname)
    if ~exist(problem_filename,'file')
        error(['Missing file: "',problem_filename])
    end

    fclib_matrix.nzmax = h5read(problem_filename,[matrix_datasetname,'/nzmax']);
    fclib_matrix.m = h5read(problem_filename,[matrix_datasetname,'/m']);
    fclib_matrix.n = h5read(problem_filename,[matrix_datasetname,'/n']);
    fclib_matrix.nz = h5read(problem_filename,[matrix_datasetname,'/nz']);

    fclib_matrix.p = h5read(problem_filename,[matrix_datasetname,'/p']);
    fclib_matrix.i = h5read(problem_filename,[matrix_datasetname,'/i']);
    fclib_matrix.x = h5read(problem_filename,[matrix_datasetname,'/x']);

    if fclib_matrix.nz<-2
        error(['Unkown sparse matrix type => fclib_matrix->nz = ',num2str(fclib_matrix.nz)])    
    end

    temp_struct = h5info(problem_filename,matrix_datasetname);
    if any(arrayfun(@(x) strcmp(x,'conditioning'), {temp_struct.Datasets.Name}))
        fclib_matrix.fclib_info.conditioning = h5read(problem_filename,[matrix_datasetname,'/conditioning']);
        fclib_matrix.fclib_info.determinant = h5read(problem_filename,[matrix_datasetname,'/determinant']);
        fclib_matrix.fclib_info.rank = h5read(problem_filename,[matrix_datasetname,'/rank']);
        if any(arrayfun(@(x) strcmp(x,'comment'), {temp_struct.Datasets.Name}))
            fclib_matrix.fclib_info.comment = h5read(problem_filename,[matrix_datasetname,'/comment']);
        end
    end

end