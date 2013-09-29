// Massstab 1 entspricht einem cm
use <house/door/frontDoor.scad>
use <house/house.scad>
use <landscape/tree/tree.scad>

module estate() {
	earthBrown = [ 102/255, 51/255, 0/255 ];
	color(earthBrown)
	polyhedron ( points = [
			[0, 0, 0], 
			[595, 0, -15], 
			[595, 299 + 300 + 100 + 120, -10], 
			[0, 299 + 300 + 100 + 120, 0], 
			[595, 1460, 0], 
			[0, 1960, 0], 
			[-1677, 1703, 0], 
			[-1163, 0, 0], ], 
		triangles = [
			[2, 1, 0], 
			[0, 3, 2], 
			[4, 2, 3],
			[5, 4, 3],
			[6, 5, 3],
			[7, 6, 3],
			[0, 7, 3],]);
}

module parking() {
		color([ 130/255, 130/255, 130/255 ])
		polyhedron ( points = [
			[0, 0, 0], 
			[595, 0, -15], 
			[595, 299 + 300 + 100 + 120, -10], 
			[0, 299 + 300 + 100 + 120, 0],], 
		triangles = [
			[2, 1, 0], 
			[0, 3, 2], ]);
	
}

module yard() {
	translate([400, 1000, 0])
		rotate([90, 0, 0])		
			broadleafTree (800, 550);
}


estate();
parking();
yard();
rotate([0, 0, 90])
	translate([300, 0, 0])
		house();