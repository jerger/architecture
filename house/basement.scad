// Massstab 1 entspricht einem cm
use <wall/wall.scad>

module basement(width, depth, wallColor) {
   neukellerbreite = 30 + 250 + 19;
	color(wallColor)
	union() {
		cube(size = [neukellerbreite,850,250]);
		translate([neukellerbreite, 0, 0]) {
			cube(size = [1000,380,250]);
		}
		translate([neukellerbreite, depth, 100])
			wall(width - neukellerbreite, 150, 30, 
				[false, true]);
		rotate([0, 0, 270])
			translate([-depth, width, 100])
				wall(depth - 380, 150, 30, 
					[true, false]);
	}
}

basement(1299, 850, [ 160/255, 160/255, 160/255 ]);