$fn = 128;

// Initials
$top = "J K A";

// Text
//$text = "+49 1520 9016176";
$text = "CARLMUT INDUSTRIES";

// wall thickness in mm
$thick = 2;

// compartment width and height
$cwidth = 85.60 + 0.5;
$clength = 53.98 + 0.5;
$cheight = 7;

rwidth = round($cwidth);
rlength = round($clength);

difference() {
    // wallet walls
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
    translate([-$cwidth/2, -$clength/2 - $thick / 2, -$thick])
    rotate([90, 0, 0]) {
        linear_extrude(1) {
            text($text, size=$thick*2, font="Eurostile:style=Standard");
        }
    }
}

    // deco
    /*translate([-$cwidth/2, -$clength/2 - 1, $cheight - 1])
    rotate([-90, 0, 0]) {
        for(i=[0:36]) {
            translate([i*2,0,0]) {
                cylinder(r=1,h=sin(i*10 + 270)*10+20);
            }
        }
    }*/

    

// retainer
translate([$cwidth / 2 + $thick / 2, 0, 0]) {
    translate([0, $clength / 2, 0]) cylinder(r=$thick/2, h=$cheight, center=true);
    translate([0, -$clength / 2, 0]) cylinder(r=$thick/2, h=$cheight, center=true);
}



//money clip?
/*translate([0, 0, $cheight]) {
    cube([$thick, 20, 4], center= true);
    translate([10, 0, 1.5]) cube([20, 20, $thick], center= true);
}*/
