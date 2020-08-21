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
    color("orange")
    cube([cwidth + thickness * 2, clength + thickness * 2, cheight + thickness * 2], center = true);
    
    // wallet compartment, lengthened and offset
    translate([thickness / 2, 0, 0]) cube([cwidth + thickness, clength, cheight], center = true);
    
    // thumb hole?
    translate([-cwidth / 2, 0, 0]) cylinder(d = 30, h = cheight + thickness * 2, center = true);

    // Top text
    translate([-20, -20, cheight / 2 + thickness / 2]) {
        linear_extrude(1) {
            text($top, size=12, font="Eurostile Extd:style=Black");
        }
    }

    // Side text
    translate([-cwidth/2, -clength/2 - thickness / 2, -thickness/2])
    rotate([90, 0, 0]) {
        linear_extrude(1) {
            text($text, size=thickness, font="Eurostile Extd:style=Black");
        }
    }
}

// retainer
translate([(cwidth + thickness) / 2 + wiggleroom, 0, 0]) {
    translate([0, clength / 2, 0]) cylinder(r=wiggleroom, h=cheight, center=true);
    translate([0, -clength / 2, 0]) cylinder(r=wiggleroom, h=cheight, center=true);
}

