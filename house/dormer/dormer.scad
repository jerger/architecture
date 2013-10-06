// Massstab 1 entspricht einem cm

module coppedDormer(width, height, depth) {
	polyhedron(
		points = [
			[0, 0, 0], 
			[width/2, height, -depth], 
			[width/2, height, 0], 
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
			[0, height, -depth],
			[0, height, 0], 
			[width, 0, 0], 
			[width, height, -depth],
			[width, height, 0], ], 
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

module houseDormer(width, height, depth) {
   ratioPlain = 2/3;
   ratioCopped = 1 - ratioPlain;

	union()
	translate([0, height * ratioPlain, 0]) {
		polyhedron(
			points = [
				[0, 0, 0], 
				[0, 0, -depth * ratioPlain], 
				[width/2, height * ratioCopped, -depth], 
				[width/2, height * ratioCopped, 0], 
				[width, 0, 0], 
				[width, 0, -depth * ratioPlain],], 
			triangles = [
				[0, 1, 3], 
				[1, 2, 3],
				[0, 3, 4],
				[5, 4, 3],
				[5, 3, 2],
				[5, 2, 1],]);
	}
	plainDormer(width, height * ratioPlain, depth * ratioPlain);
}

translate ([-500,0,0])
		houseDormer(400, 250, 400);
translate ([0,0,0])
		coppedDormer(400, 250, 400);
translate ([399, 100, 50])
		plainDormer(400, 250, 
			400);