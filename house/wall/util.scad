// Massstab 1 entspricht einem cm

module cutpart(length, height, depth) {
	polyhedron ( points = [
			[0, height, -depth], 
			[0, 0, -depth], 
			[length, 0, -depth], 
			[0, height, 0], 
			[0, 0, 0], 
			[length, 0, 0], ], 
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

module antiprism(height, depth) {
	polyhedron ( points = [
			[0, height, 0], 
			[0, height, depth], 
			[depth, height, depth], 
			[0, 0, 0], 
			[0, 0, depth], 
			[depth, 0, depth], ], 
		triangles = [
			[2, 1, 0], 
			[3, 5, 0],
			[0, 1, 4],
			[4, 3, 0],
			[0, 3, 5],
			[5, 2, 0],
			[1, 2, 4],
			[5, 4, 2],
			[3, 4, 5], ]);
}

antiprism (150, 36);

translate([0, 0, 100])
	cutpart (200, 150, 36);