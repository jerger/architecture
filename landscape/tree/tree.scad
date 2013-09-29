module broadleafTree(height, crownRadius) {
	brown = [ 84/255, 58/255, 5/255 ];
	green = [ 176/255, 225/255, 104/255 ];

	color(brown)
		rotate([270, 0, 0])
			cylinder(height / 2, crownRadius / 20, crownRadius / 70);
	color(green)
		translate([0, height - crownRadius / 2, 0])
			sphere(crownRadius / 2);
}

broadleafTree (1000, 800);