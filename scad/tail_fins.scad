// Model rocket tail fins by Lutz Paelke (lpaelke)
// CC BY-NC-SA 3.0
// Enhanced by Giles Hall (C) 10-2012

function in2mm(v) = v * 25.4;

fins = 8;
fin_span = 80;
fin_thickness = 1.5;
fin_endchord = 30;

base_height = in2mm(3);
collar_height = in2mm(.3);
collar_overlap = 8;

collar_outer_dia = 18.3;
collar_inner_dia = 14.5;
base_inner_dia = 18.2;
base_outer_dia = 20.54;

guide_inner_dia = 4.75;
guide_outer_dia = guide_inner_dia + 1;

module fin(angle, deflection)
{
    rotate([0,0,angle])
        polyhedron(points=[
        // inner-top
        [base_inner_dia / 2, fin_thickness / 2 + deflection, 0], 
        [base_inner_dia / 2, -fin_thickness / 2 + deflection, 0],
        // outer-top
        [fin_span / 2, fin_thickness / 2 + deflection, 0], 
        [fin_span / 2, -fin_thickness / 2 + deflection, 0],
        // outer-bottom
        [fin_span / 2, fin_thickness / 2 - deflection, fin_endchord], 
        [fin_span / 2, -fin_thickness / 2 - deflection, fin_endchord],
        // inner-bottom
        [base_inner_dia / 2, fin_thickness / 2 - deflection, base_height], 
        [base_inner_dia / 2, -fin_thickness / 2 - deflection, base_height]], 
        triangles=[[0, 1, 2],  [1, 3, 2], 
                    [2, 3, 4],  [3, 5, 4], 
                    [4, 5, 6],  [5, 7, 6], 
                    [6, 7, 0],  [7, 1, 0], 
                    [0, 2, 6],  [2, 4, 6], 
                    [1, 7, 3],  [3, 7, 5]]);
}

steps = 6;
step = (base_outer_dia - collar_inner_dia) / steps;

difference()
{
    union()
    {
        // intial body
		cylinder(h=base_height, r=base_outer_dia / 2, $fn=60);
        // fins
		for (i = [0:fins - 1])
        {
                fin(i * (360 / fins), 0);
		}
        // guide
		rotate([0, 0, 180 / fins]) 
            translate([base_outer_dia / 2 + guide_inner_dia / 2, 0, 0]) 
                difference()
                {
                    cylinder(h=base_height, r=guide_outer_dia / 2, $fn=60);
                    cylinder(h=base_height, r=guide_inner_dia / 2, $fn=60);
                }	
        // collar
        translate([0, 0, base_height - collar_overlap + 10]) 
            difference()
            {
                cylinder(h=collar_height + collar_overlap, r=collar_outer_dia / 2, $fn=60);
                cylinder(h=collar_height + collar_overlap, r=collar_inner_dia / 2, $fn=60);
            }
		for (i = [0:steps - 1])
        {
            translate([0, 0, base_height - collar_overlap - (i * .5) + 10]) 
                difference()
                {
                    cylinder(h=.5, r=base_outer_dia / 2, $fn=60);
                    cylinder(h=.5, r=(step * i + collar_inner_dia) / 2, $fn=60);
                }
		}
    }
    // inner (subtractive) cynlinder
    cylinder(h=base_height, r=base_inner_dia / 2, $fn=60);
}
