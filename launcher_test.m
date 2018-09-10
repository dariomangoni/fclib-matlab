clear varibles
close all
clc

%% test


%% fclib_global
filename_global = 'C:\workspace\fclib-library\Global\cubes_H8\LMGC_Cubes_H8-i00001-3-00024.hdf5';
h5disp(filename_global);

fclib_global = fclib_read_global(filename_global);

%% fclib_local
filename_local = 'C:\workspace\fclib-library\Cubes_H8\LMGC_Cubes_H8_2-i00001-5-00031.hdf5';
h5disp(filename_local);

fclib_local = fclib_read_local(filename_local);

%% fclib_solution
filename_solution = 'C:\workspace\fclib-library\Cubes_H8\LMGC_Cubes_H8_2-i00001-5-00031.hdf5';
h5disp(filename_solution);

fclib_solution = fclib_read_solution(filename_solution);