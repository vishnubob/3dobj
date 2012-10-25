fins = 4;
fin_span = 80;
fin_thickness = 1.5;
fin_endchord = 30;

base_height = 76.2;     // 3 inches
collar_height = 7.62;   // .3 inches

wall_thickness = 2;
collar_overlap = 4;
//collar_outer_dia = 17.78;
collar_outer_dia = 18.5;
collar_inner_dia = collar_outer_dia - wall_thickness;

base_inner_dia = collar_outer_dia;
base_outer_dia = base_inner_dia + wall_thickness;

guide_inner_dia = 4.6;
guide_outer_dia = guide_inner_dia + 1;

difference()
{
    union()
    {
        // intial body
		cylinder(h=base_height, r=base_outer_dia / 2, $fn=60);
        // collar
        translate([0, 0, base_height - collar_overlap]) 
            difference()
            {
                cylinder(h=collar_height + collar_overlap, r=collar_outer_dia / 2 + .001, $fn=60);
                cylinder(h=collar_height + collar_overlap, r2=collar_inner_dia / 2, r1=collar_outer_dia / 2 + .6 , $fn=60);
            }
    }
    // inner (subtractive) cynlinder
    cylinder(h=base_height, r=base_inner_dia / 2, $fn=60);
}
