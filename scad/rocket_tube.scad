function in2mm(in) = in / 0.0393701;

/////////////////
// Engine Dimensions
// http://www2.estesrockets.com/pdf/Estes_Model_Rocket_Engines.pdf
// mini engine
mini_engine_length = in2mm(1.75);
mini_engine_dia = in2mm(.5);
// standard engine
standard_engine_length = in2mm(2.75);
standard_engine_dia = in2mm(.69);
// D engine
d_engine_length = in2mm(2.75);
d_engine_dia = in2mm(.95);
// E engine
e_engine_length = in2mm(3.75);
e_engine_dia = in2mm(.95);
// engine selectin
engine_length = standard_engine_length;
engine_dia = standard_engine_dia;

/////////////////
// Fins
fins = 4;
fin_span = 80;
fin_thickness = 1.5;
fin_endchord = 30;

/////////////////
// Body
body_height = in2mm(3);
wall_thickness = 2;

/////////////////
// Collar
collar_height = in2mm(.3);
collar_overlap = 4;
//collar_outer_dia = 17.78;
collar_outer_dia = 18.5;
collar_inner_dia = collar_outer_dia - wall_thickness;
body_inner_dia = collar_outer_dia;
body_outer_dia = body_inner_dia + wall_thickness;

/////////////////
// Guide
guide_inner_dia = 4.6;
guide_outer_dia = guide_inner_dia + 1;

difference()
{
    union()
    {
        // intial body
		cylinder(h=body_height, r=body_outer_dia / 2, $fn=60);
        // collar
        translate([0, 0, body_height - collar_overlap]) 
            difference()
            {
                cylinder(h=collar_height + collar_overlap, r=collar_outer_dia / 2 + .001, $fn=60);
                cylinder(h=collar_height + collar_overlap, r2=collar_inner_dia / 2, r1=collar_outer_dia / 2 + .6 , $fn=60);
            }
    }
    // inner (subtractive) cynlinder
    cylinder(h=body_height, r=body_inner_dia / 2, $fn=60);
}
