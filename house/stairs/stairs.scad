// Massstab 1 entspricht einem cm

module stairs(width, count) {
   sandColor = [ 247/255, 231/255, 194/255 ];

	color(sandColor)	
	translate([0, 0, 30 * count - 5])
	for ( c = [0 : count - 1] ) {
		translate([0, 21 * c, -30 * c])
			cube([width, 21, 35]);
	}

}

stairs(120, 5);