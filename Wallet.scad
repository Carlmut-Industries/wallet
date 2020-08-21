$fn = 128;

// Initials
$top = "J K A";

// Text
//$text = "+49 1520 9016176";
$text = "CARLMUT INDUSTRIES";

// wall thickness in mm
$thick = 2;

// compartment width and height
$wiggleroom = 0.5;

$cwidth = 85.60 + $wiggleroom;
$clength = 53.98 + $wiggleroom;
$cheight = 7;


difference() {
    // wallet walls
    color("orange")
    cube([$cwidth + $thick * 2, $clength + $thick * 2, $cheight + $thick * 2], center = true);
    
    // wallet compartment, lengthened and offset
    translate([$thick / 2, 0, 0]) cube([$cwidth + $thick, $clength, $cheight], center = true);
    
    // thumb hole?
    translate([-$cwidth / 2, 0, 0]) cylinder(d = 30, h = $cheight + $thick * 2, center = true);

    // Top text
    translate([-20, -20, $cheight / 2 + $thick / 2]) {
        linear_extrude(1) {
            text($top, size=12, font="Eurostile Extd:style=Black");
        }
    }

    // Side text
    translate([-$cwidth/2, -$clength/2 - $thick / 2, -$thick/2])
    rotate([90, 0, 0]) {
        linear_extrude(1) {
            text($text, size=$thick, font="Eurostile Extd:style=Black");
        }
    }
}

// retainer
translate([($cwidth + $thick) / 2 + $wiggleroom, 0, 0]) {
    translate([0, $clength / 2, 0]) cylinder(r=$wiggleroom, h=$cheight, center=true);
    translate([0, -$clength / 2, 0]) cylinder(r=$wiggleroom, h=$cheight, center=true);
}

