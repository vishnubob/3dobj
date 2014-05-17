
union()
{
    translate([0,0,14])
        sphere(r=5.5, $fn=100, center=True);
    translate([0,0,-9])
        cylinder(r2=2, r1=25, h=20, $fn=100);
}

