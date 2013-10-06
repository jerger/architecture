// Massstab 1 entspricht einem cm
use<util.scad>

module wall(length, height, depth, phased) {
	aPhased = 
		(phased == undef) ? [true, true] : phased;
	aLength = 
		(aPhased[0] && aPhased[1]) ? 
			length - 2 * depth : 
			(aPhased[0] || aPhased[1]) ? 
				length - depth : length;

	union() {
		if(aPhased[0]) {
			rotate([0, 90, 0])
				antiprism(height, depth);
			translate ([depth, 0, -depth])	
				cube(size = [aLength, height,
					depth]);	
		} else {
			translate ([0, 0, -depth])	
				cube(size = [aLength, height, 
					depth]);	
		}
		if(aPhased[1]) {
			translate ([length - depth, 0, -depth])
				antiprism(height, depth);
		}
	}
}

wall (200, 150, 36);

translate([0, 0, 100])
	wall (200, 150, 36, [true, true]);

translate([0, 0, 200])
	wall (200, 150, 36, [false, true]);

translate([0, 0, 300])
	wall (200, 150, 36, [false, false]);
