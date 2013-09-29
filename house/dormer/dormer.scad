// Massstab 1 entspricht einem cm

module coppedDormer(width, height, depth) {
	polyhedron(
		points = [
			[0, 0, 0], 
			[width/2, depth, height], 
			[width/2, 0, height], 
			[width, 0, 0],], 
		triangles = [
			[0,1,2], 
			[0,2,3],
			[3,2,1],
			[3,1,0],]);
}

module plainDormer(width, height, depth) {
	polyhedron(
		points = [
			[0, 0, 0], 
			[0, depth, height],
			[0, 0, height], 
			[width, 0, 0], 
			[width, depth, height],
			[width, 0, height], ], 
		triangles = [
			[0, 1, 2], 
			[1, 4, 2],
			[4, 5, 2],
			[3, 5, 4],
			[2, 5, 3],
			[2, 3, 0],
			[1, 0, 3],
			[1, 3, 4],]);
}