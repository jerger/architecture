module frontDoor(width, height, depth, reveal) {
	blackberry = [ 102/255, 0/255, 102/255 ];
	blackberryLight = [ 160/255, 160/255, 160/255 ];

	translate([0, 0, -depth])
	union() {
		color(blackberry)
		cube([width, height, depth]);
		
		color(blackberryLight)
		translate([reveal, reveal, -1])
		cube([width - reveal * 2, height - reveal * 2, depth + 2]);
	}
}

frontDoor(100, 210, 30, 5);