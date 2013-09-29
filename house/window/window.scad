module window(width, height, depth, reveal) {
	blackberry = [ 102/255, 0/255, 102/255 ];
	transparent = [ 255/255, 255/255, 255/255 ];

	union() {
		color(blackberry)
		cube([width, depth, height]);
		
		color(transparent)
		translate([reveal, -1, reveal])
		cube([width - reveal * 2, depth + 2, height - reveal * 2]);
	}
}

window(201, 120, 30, 5);