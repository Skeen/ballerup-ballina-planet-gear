use <gear.scad>;

// Number of teeth
num_teeth    = 14;
// Circular pitch
mm_per_tooth = 2;
// Height
thickness    = 4.5;
// Square peg size
peg          = 3;
// Top cut
top_radius   = 3;
top_depth    = 1;
// OpenSCAD render clutter
ct           = 0.1;

// Outer radius circle
%circle(r=5);
// Inner radius circle
%circle(r=4);

$fn=64;
difference()
{
    // Generate the gear, no hole in the middle (0)
    gear(mm_per_tooth, num_teeth, thickness, 0);
    // Cut out the top cut
    translate([0,0,thickness/2-top_depth/2])
        cylinder(r=top_radius, h=top_depth+ct, center=true);
    // Cut out the square peg
    cube([peg,peg,thickness+ct], center=true);
}
