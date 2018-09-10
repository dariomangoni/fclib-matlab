%% test_write

clear variables
close all
clc

mat = rand(2,3);
filename = 'C:\workspace\fclib-library\Global\cubes_H8\LMGC_Cubes_H8-i00001-3-00024.hdf5';
% temp_struct = h5info(filename,'/fclib_global/M');

stru = HD5_to_structure(filename);
% 
% disp('')
% if any(arrayfun(@(x) strcmp(x,'datasetname'), {temp_struct.Datasets.Name}))
%     value = h5read(filename,[matrix_datasetname,'/conditioning']); 
% end
% 
% h5info
% 
% fid = H5F.create('myfile.h5','H5F_ACC_TRUNC', H5P.create('H5P_FILE_CREATE'), H5P.create('H5P_FILE_ACCESS') );
% type_id = H5T.copy('H5T_NATIVE_DOUBLE');
% space_id = H5S.create_simple(ndims(mat),fliplr(size(mat)),fliplr(size(mat)));
% dset_id = H5D.create(fid,'mymatname',type_id,space_id,'H5P_DEFAULT');
% H5D.write(dset_id,'H5ML_DEFAULT','H5S_ALL','H5S_ALL','H5P_DEFAULT',mat)
% H5S.close(space_id);
% H5T.close(type_id);
% H5D.close(dset_id);
% H5F.close(fid);
% h5disp('myfile.h5');


% stringa = 'ciao';
% stringa2 = string(stringa);
% 
% fid = H5F.create('myfilestrings.h5','H5F_ACC_TRUNC', H5P.create('H5P_FILE_CREATE'), H5P.create('H5P_FILE_ACCESS'));
% type_id = H5T.copy('H5T_C_S1');
% H5T.set_size(type_id,'H5T_VARIABLE');
% space_id = H5S.create_simple(2,fliplr([1 1]),fliplr([1 1]));
% dset_id = H5D.create(fid,'mystringname',type_id,space_id,'H5P_DEFAULT');
% H5D.write(dset_id,'H5ML_DEFAULT','H5S_ALL','H5S_ALL','H5P_DEFAULT',stringa)
% H5S.close(space_id);
% H5T.close(type_id);
% H5D.close(dset_id);
% H5F.close(fid);
% h5disp('myfilestrings.h5');

% h5createwritestr('myfilestrings.h5', '/prova', {'ciao'});
% h5disp('myfilestrings.h5');