module window(width, height, depth, reveal) {
	blackberry = [ 102/255, 0/255, 102/255 ];
	
	translate([0, 0, -depth])
	difference() {
		color(blackberry)
		cube([width, height, depth]);
		
		translate([reveal, reveal, -1])
		cube([width - reveal * 2, height - reveal * 2, depth + 2, ]);
	}
}

window(201, 120, 30, 5);