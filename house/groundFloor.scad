// Massstab 1 entspricht einem cm
use <wall/wall.scad>
use <window/window.scad>
use <door/frontDoor.scad>

module groundFloor(width, depth, wallColor, revealColor) {
	color(wallColor)
	union(){
		rotate([0, 0, 180])
			translate([-width, 0, 0])
				wall(width, 300, 30);

		rotate([0, 0, 90])
			translate([0, 0, 0])
				wall(depth, 300, 30);

		rotate([0, 0, 0])
			translate([0, depth, 0])
				wall(width, 300, 30);

		rotate([0, 0, 270])
			translate([-depth, width, 0])
				wall(depth, 300, 30);
	}

	translate([64, 0, 100])
		window(201, 120, 30, 5);

	translate([299 + 100, 0, 0])
		frontDoor(100, 220, 30, 5);

	translate([299 + 290, 0, 100])
		window(100, 120, 30, 10);

	translate([299 + 460, 0, 100])
		window(100, 120, 30, 10);

	translate([299 + 810, 0, 100])
		window(100, 120, 30, 10);	
}

groundFloor(1299, 850, [ 224/255, 224/255, 224/255 ]);