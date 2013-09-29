// Massstab 1 entspricht einem cm

function beamLength(height, depth) = sqrt( 
		pow(depth, 2) + 
		pow(height, 2));

function beamAngle(depth, length) = acos(depth / length);


module porch(width, height, depth, leftPillarHeight, 
	rightPillarHeight, pillarColor, roofColor) {

	leftLength = beamLength(depth, 
		height - leftPillarHeight);
	leftAngle = beamAngle(depth, 
		leftLength);

	rightLength = beamLength(depth, 
		height - rightPillarHeight);
	rightAngle = beamAngle(depth, 
		rightLength);

	// wooden construction
	color(pillarColor) {
		// base	
		translate([0, height, 0])
			cube([width, 10, 10]);

	// left side
	translate([10, height + 10, 0])
		rotate([0, 270, 0])
			rotate([0, 0, -leftAngle])
				cube([leftLength, 25, 10]);

	translate([0, 0, depth])
		rotate([270, 0, 0])
		cube([10, 10, leftPillarHeight]);

	// right side
	translate([10 + width, height + 10, 0])
		rotate([0, 270, 0])
			rotate([0, 0, -rightAngle])
				cube([rightLength, 25, 10]);

	translate([width, 0, depth])
		rotate([270, 0, 0])
		cube([10, 10, rightPillarHeight]);
	}

	
	// the roof
	color(roofColor)
	polyhedron ( points = [
				[0, height + 10 + 25, 0], 
				[0, leftPillarHeight + 10 + 25, depth], 
				[width, rightPillarHeight + 10 + 25, depth], 
				[width, height + 10 + 25, 0],], 
				triangles = [
					[2, 1, 0], 
					[3, 2, 0],]);
}


sandColor = [ 247/255, 231/255, 194/255 ];
porch(150, 103 + 220 + 10, 200, 300, 220);