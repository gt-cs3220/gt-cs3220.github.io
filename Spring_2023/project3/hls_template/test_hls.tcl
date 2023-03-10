open_project -reset project3

add_files hls_stencil_shift.cpp 
add_files -tb hls_stencil_shift_tb.cpp

set_top stencil5

open_solution -reset solution1
set_part {xc7z020-clg400-1}
create_clock -period 10 -name default

csim_design

csynth_design

cosim_design

exit
