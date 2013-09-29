// Massstab 1 entspricht einem cm

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
			rotate([0, 0, 270])
				antiprism(height, depth);
			translate ([depth, -depth, 0])	
				cube(size = [aLength, depth, 
					height]);	
		} else {
			translate ([0, -depth, 0])	
				cube(size = [aLength, depth, 
						height]);	
		}
		if(aPhased[1]) {
			translate ([length - depth, -depth, 0])
				antiprism(height, depth);
		}
	}
}

module antiprism(heihgt, depth) {
	polyhedron ( points = [
			[0, 0, heihgt], 
			[0, depth, heihgt], 
			[depth, depth, heihgt], 
			[0, 0, 0], 
			[0, depth, 0], 
			[depth, depth, 0], ], 
		triangles = [
			[0, 1, 2], 
			[0, 5, 3],
			[4, 1, 0],
			[0, 3, 4],
			[5, 3, 0],
			[0, 2, 5],
			[4, 2, 1],
			[2, 4, 5],
			[5, 4, 3], ]);
}

wall (200, 150, 36);

translate([0, 100, 0])
	wall (200, 150, 36, [true, true]);

translate([0, 200, 0])
	wall (200, 150, 36, [false, true]);

translate([0, 300, 0])
	wall (200, 150, 36, [false, false]);
