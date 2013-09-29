module frontDoor(width, height, depth, reveal) {
	blackberry = [ 102/255, 0/255, 102/255 ];
	blackberryLight = [ 160/255, 160/255, 160/255 ];

	union() {
		color(blackberry)
		cube([width, depth, height]);
		
		color(blackberryLight)
		translate([reveal, -1, reveal])
		cube([width - reveal * 2, depth + 2, height - reveal * 2]);
	}
}

frontDoor(100, 210, 30, 5);