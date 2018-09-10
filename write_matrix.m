function [] = write_matrix(problem_filename, matrix_datasetname, fclib_matrix)
    h5write(problem_filename,[matrix_datasetname,'/nzmax'], fclib_matrix.nzmax);
    h5write(problem_filename,[matrix_datasetname,'/m'], fclib_matrix.m);
    h5write(problem_filename,[matrix_datasetname,'/n'], fclib_matrix.n);
    h5write(problem_filename,[matrix_datasetname,'/z'], fclib_matrix.z);
    h5write(problem_filename,[matrix_datasetname,'/p'], fclib_matrix.p);
    h5write(problem_filename,[matrix_datasetname,'/i'], fclib_matrix.i);
    h5write(problem_filename,[matrix_datasetname,'/x'], fclib_matrix.x);

    if isfield(fclib_matrix, 'info')
        % write strings; low-level API required
        
        file_id = H5F.open(problem_filename);
        type_id = H5T.copy('H5T_NATIVE_DOUBLE');
        dims = [10 5];  
        h5_dims = fliplr(size(fclib_matrix.info.comment));
        h5_maxdims = h5_dims;
        space_id = H5S.create_simple(2,h5_dims,h5_maxdims);
        dcpl = 'H5P_DEFAULT';
        dset_id = H5D.create(file_id,'DS',type_id,space_id,dcpl);
        H5S.close(space_id);
        H5T.close(type_id);
        H5D.close(dset_id);
        H5F.close(file_id);

        h5disp('myfile.h5');
        
        
        plist = 'H5P_DEFAULT';
        hdf5_root_id = H5F.open('myfile.h5','H5F_ACC_RDWR',plist);
        % create parent group 'info'
        hdf5_group_id = H5G.create(fid,[matrix_datasetname,'/info'],plist,plist,plist);
        H5G.close(hdf5_group_id);

        % create 'info' datasets
        hdf5_dataset_id = H5D.open(hdf5_root_id,[matrix_datasetname,'/info/comment']);
        H5D.write(hdf5_dataset_id,'H5ML_DEFAULT','H5S_ALL','H5S_ALL',plist,fclib_matrix.info.comment);
        H5D.close(hdf5_dataset_id);

        type_id = H5T.copy('H5T_NATIVE_DOUBLE');
        type_size = H5T.get_size(type_id);
        hdf5_dataset_id = H5D.open(hdf5_root_id,[matrix_datasetname,'/info/conditioning']);
        H5D.write(hdf5_dataset_id,'H5ML_DEFAULT','H5S_ALL','H5S_ALL',plist,fclib_matrix.info.conditioning);
        H5D.close(hdf5_dataset_id);

        hdf5_dataset_id = H5D.open(hdf5_root_id,[matrix_datasetname,'/info/determinant']);
        H5D.write(hdf5_dataset_id,'H5ML_DEFAULT','H5S_ALL','H5S_ALL',plist,fclib_matrix.info.determinant);
        H5D.close(hdf5_dataset_id);

        hdf5_dataset_id = H5D.create(hdf5_group_id,determinant,);
        H5D.write(hdf5_dataset_id,'H5ML_DEFAULT','H5S_ALL','H5S_ALL',plist,fclib_matrix.info.determinant);
        H5D.close(hdf5_dataset_id);


            
        H5F.close(hdf5_root_id);
        data_out = h5read('myfile.h5','/g3/VLstring');
    end

end