include <BOSL/constants.scad>
use <BOSL/shapes.scad>

$fn = 128;

// Initials
$top = "J K A";

// Text
$text = "CARLMUT INDUSTRIES";

// wall thickness in mm
thickness = 2;

// give some spielraum
wiggleroom = 0.5;

// compartment dimensions
cwidth = 85.60 + wiggleroom;
clength = 53.98 + wiggleroom;
cheight = 7;

difference() {
    // wallet walls
    cuboid([cwidth + thickness * 2, clength + thickness * 2, cheight + thickness * 2], chamfer=thickness);
    
    // wallet compartment, lengthened and offset
    translate([thickness / 2, 0, 0]) cube([cwidth + thickness, clength, cheight], center = true);
    
    // top window
    translate([0, 0, cheight - 2.5]) {
        cube([cwidth / 1.2, clength / 1.2, 2], center = true);
    }

    // Side text
    translate([-cwidth/2 + thickness, -clength/2 - thickness / 2, -thickness/2])
    rotate([90, 0, 0]) {
        linear_extrude(1) {
            text($text, size=thickness, font=":style=Bold Italic");
        }
    }
    
    
}

// retainer
translate([cwidth / 2, 0, 0]) {
    translate([0, clength / 2, 0]) cylinder(r=wiggleroom, h=cheight, center=true);
    translate([0, -clength / 2, 0]) cylinder(r=wiggleroom, h=cheight, center=true);
}

