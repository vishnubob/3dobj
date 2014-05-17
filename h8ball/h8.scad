sf = 5.2;
linear_extrude(height=0.5, convexity=10) scale([1 / sf, 1 / sf, 0]) translate([-250, -523, 0]) import(file="h8.dxf");
