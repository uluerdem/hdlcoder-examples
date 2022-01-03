name = "matrix_ex_2_3";
rel_mtx = [1 0 1;1 -1 1];
reg_mtx = [0 0 1;0 0 0];

add_sub_gen(name,rel_mtx,reg_mtx);

name = "matrix_ex_5_5";
rel_mtx = [1 1 0 0 -1;1 1 -1 1 0;1 0 -1 0 1;-1 0 1 1 0;0 0 1 -1 1];
reg_mtx = [0 0 0 0 1;0 0 0 0 0;1 0 2 0 0;0 0 1 1 0;0 0 1 3 1];

add_sub_gen(name,rel_mtx,reg_mtx);

name = "matrix_ex_4_9";
reg_mtx = [0 0 1 0 0 0 1 1 1;0 0 0 0 0 0 0 0 1;0 0 1 0 0 1 0 0 1;0 0 0 0 0 0 0 0 0];
rel_mtx = [1 0 1 0 0 0 -1 1 -1;-1 1 -1 0 0 0 1 0 1;-1 0 -1 1 0 1 -1 0 -1;1 -1 1 -1 1 -1 1 -1 1];

add_sub_gen(name,rel_mtx,reg_mtx);