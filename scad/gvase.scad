layers = 20;
start_facets = 4;
end_facets = 100;
facet_slope = (end_facets - start_facets) / layers;

start_dia = 10;
end_dia = .1;
dia_slope = (end_dia - start_dia) / layers;

start_angle = 0;
end_angle = 120;
angle_slope = (end_angle - start_angle) / layers;

layer_height = 1;

union()
{
    for (i = [0:layers - 2])
    {
        translate([0, 0, i * layer_height])
            rotate([0, 0, angle_slope * i + start_angle])
                cylinder(h=layer_height, 
                    r=(dia_slope * i + start_dia) / 2, $fn=facet_slope * i);
    }
}
