// Model rocket tail fins by Lutz Paelke (lpaelke)
// CC BY-NC-SA 3.0

height=50;
radius_out=11;
radius_in=10;
guide_radius_in=2.5;
guide_radius_out=3.5;
fins=4;
span=80;
fin_thick=1;
endchord=30;

module fin(angle, deflection)
{
    rotate([0,0,angle]) polyhedron(points=[
                                            // inner-top
                                            [radius_in, fin_thick / 2 + deflection, 0], [radius_in, -fin_thick / 2 + deflection, 0],
                                            // outer-top
                                            [span / 2, fin_thick / 2 + deflection, 0], [span / 2, -fin_thick / 2 + deflection, 0],
                                            // outer-bottom
                                            [span / 2, fin_thick / 2 - deflection, endchord], [span / 2, -fin_thick / 2 - deflection, endchord],
                                            // inner-bottom
                                            [radius_in, fin_thick / 2 - deflection, height], [radius_in, -fin_thick / 2 - deflection, height]], 
                                    triangles=[[0, 1, 2],  [1, 3, 2], 
                                                [2, 3, 4],  [3, 5, 4], 
                                                [4, 5, 6],  [5, 7, 6], 
                                                [6, 7, 0],  [7, 1, 0], 
                                                [0, 2, 6],  [2, 4, 6], 
                                                [1, 7, 3],  [3, 7, 5]]);
}


difference()
{
    union()
    {
		cylinder(h=height, r=radius_out, $fn=60);
		for (i = [0:fins - 1])
        {
                fin(i * (360 / fins), 5);
		}
		rotate([0, 0, 180 / fins]) 
            translate([radius_out + guide_radius_in, 0, 0]) 
                difference()
                {
                    cylinder(h=height, r=guide_radius_out, $fn=60);
                    cylinder(h=height, r=guide_radius_in, $fn=60);
                }	
    }
    cylinder(h=height, r=radius_in, $fn=60);
}
