// Massstab 1 entspricht einem cm
use<util.scad>

module cutwall(baseLength, cutLength, height, depth, phased) {
	aPhased = 
		(phased == undef) ? true : phased;
	aBaseLength = 
		(aPhased) ? 
			baseLength - depth : baseLength;
	aCutLength = 
		(aPhased) ? 
			cutLength - depth : cutLength;

	union() {
		if(aPhased) {
			rotate([0, 90, 0])
				antiprism(height, depth);
			translate ([depth, 0, -depth])	
				cube(size = [aCutLength, height,
					depth]);	
		} else {
			translate ([0, 0, -depth])	
				cube(size = [aCutLength, height, 
					depth]);	
		}

		translate([cutLength, 0, 0])
			cutpart(aBaseLength - aCutLength, height, depth);
	}
}


cutwall (200, 150, 150, 36);

translate([0, 0, 100])
	cutwall (200, 150, 150, 36, false);

translate([0, 0, 200])
		cutwall (200, 150, 150, 36, true);
