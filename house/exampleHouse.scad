// Massstab 1 entspricht einem cm
include <dormer/dormer.scad>

module keller() {
   neukellerbreite = 30 + 250 + 19;
   color([ 100/255, 100/255, 0/255 ])
	union() {
		cube(size = [neukellerbreite,850,250]);
		translate([neukellerbreite, 0, 0]) {
			cube(size = [1000,380,250]);
		}
	}
}

module erdgeschoss() {
   color([ 200/255, 200/255, 0/255 ])
	cube(size = [1299,850,300]);
}

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
		coppedDormer(150, geschosshoehe, haustiefe - dachanfang);
	}
}

module dach () {
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

module haus () {
   bodenniveau = 103;
   union () {
		translate([0,0,bodenniveau+300+290]) {
			dach();
		}
       translate([0,0,bodenniveau+300]) {
			obergeschoss();
		}
		translate([0,0,bodenniveau]) {
			erdgeschoss();
		}
		translate([0,0,bodenniveau-250]) {
			keller();
		}
	}
}

scale(0.1, 0.1, 0.1 ) {
	haus();
}