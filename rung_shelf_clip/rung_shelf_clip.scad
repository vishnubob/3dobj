
module tube(or, ir, h, fn=undef)
{
    difference()
    {
        cylinder(r=or, h=h, $fn=fn);
        cylinder(r=ir, h=h, $fn=fn);
    }
}

module clip(or, ir, h, fn=undef)
{
    rotate([0,0,-66])
        linear_extrude(height=h+1)
            polygon(points=[[0,0], [0,or * 2], [or * 2,0]]);
}


module make_shelf_clip(length=10, width=17.5, height=1.5, inner_dia=2.5, outer_dia=3.5)
{
    inner_rad = inner_dia / 2;
    outer_rad = outer_rad / 2;
    cyl2cyl = inner_dia + width;

    difference()
    {
        union()
        {
            cube([length - .1,width,height], center=true);
            translate([-length / 2, cyl2cyl / 2, 0])
                rotate([0, 90, 0])
                    tube(or=outer_dia / 2, r=inner_dia / 2, h=length, fn=100);
            translate([length / 2, -cyl2cyl / 2, 0])
                rotate([180, 90, 0])
                    tube(or=outer_dia / 2, r=inner_dia / 2, h=length, fn=100);
        }
        translate([-length / 2, cyl2cyl / 2, 0])
            rotate([0, 90, 0])
                clip(or=outer_dia / 2, r=inner_dia / 2, h=length, fn=100);
        translate([length / 2, -cyl2cyl / 2, 0])
            rotate([180, 90, 0])
                clip(or=outer_dia / 2, r=inner_dia / 2, h=length, fn=100);
    }
}

make_shelf_clip();
