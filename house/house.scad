// Massstab 1 entspricht einem cm
use <dormer/dormer.scad>
use <wall/wall.scad>
use <window/window.scad>
use <door/frontDoor.scad>
use <stairs/stairs.scad>
use <porch/porch.scad>
use <groundFloor.scad>
use <basement.scad>

module obergeschoss() {
	dachanfang = 430 + 250;
	geschosshoehe=290;
	haustiefe = 850;
	union() { 
		cube(size = [1299,dachanfang,geschosshoehe]);
		polyhedron ( points = [
				[0, dachanfang, 0], 
				[0, haustiefe, 0], 
				[0, dachanfang, geschosshoehe], 
				[1299, dachanfang, 0], 
				[1299, haustiefe, 0], 
				[1299, dachanfang, geschosshoehe]], 
				triangles = [
					[0,1,2], 
					[5,4,3],
					[4,1,0],
					[0,3,4],
					[5,3,0],
					[0,2,5],
					[4,2,1],
					[2,4,5],]);
		translate([1200,haustiefe,0])
		rotate([0,0,180])
		houseDormer(170, geschosshoehe, haustiefe - dachanfang);
	}
}

module dachgeschoss () {
	dachanfang = 430 + 250;
	giebeltiefe = 535;
	giebelhoehe = 280;
	gaubenbreite = 430;
	color([ 100/255, 000/255, 0/255 ])
	union() {
	polyhedron ( points = [
				[0, dachanfang, 0], 
				[0, giebeltiefe, giebelhoehe], 
				[0, 0, 0], 
				[1299, dachanfang, 0], 
				[1299, giebeltiefe, giebelhoehe], 
				[1299, 0, 0]], 
				triangles = [
					[0,1,2], 
					[5,4,3],
					[4,1,0],
					[0,3,4],
					[5,3,0],
					[0,2,5],
					[4,2,1],
					[2,4,5],]);
	translate ([1299-gaubenbreite,0,0])
		coppedDormer(gaubenbreite, giebelhoehe, giebeltiefe);
	translate ([399, 100, 50])
		plainDormer(gaubenbreite, giebelhoehe - 100, 
			giebeltiefe -100);

	}
}

module house() {
	bodenniveau = 103;
	houseWidth = 1299;
	houseDepth = 850;

	white = [ 255/255, 250/255, 250/255 ];
	lightGrey = [ 224/255, 224/255, 224/255 ];
	darkGrey = [ 160/255, 160/255, 160/255 ];
	blackberry = [ 102/255, 0/255, 102/255 ];

   union () {
		translate([0,0,bodenniveau+300+290]) {
			dachgeschoss();
		}
		color(lightGrey)
       translate([0,0,bodenniveau+300]) {
			obergeschoss();
		}
		translate([0,0,bodenniveau] ) {
			groundFloor(houseWidth, houseDepth, lightGrey, blackberry);
		}
		translate([0,0,bodenniveau-250]) {
			basement(houseWidth, houseDepth, darkGrey);
		}
		
		translate([299 + 90, 0, 0]) {
			stairs(120, 5);
		}

		translate([299 + 60, 0, 0]) {
			rotate([90, 0, 0])
			porch(170, 103 + 220 + 10, 200, 300, 230, white, darkGrey);
		}
	}
}


house();