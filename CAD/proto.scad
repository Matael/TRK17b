spacing = 250;
gridsize = 5;
thickness = 5;
nodewidth = 70;
roddiameter = 10;
holdingzone = 3;

module node() {
    color("Red", 1.0) {
        cube([nodewidth, thickness, nodewidth], center=true);
        cube([thickness, nodewidth, nodewidth], center=true);
    }
}
 
module rod() {
    color("black") {
    cylinder(d=roddiameter, spacing-nodewidth/2*2+holdingzone*2, center=true);
    }
}

module rodforest(x=0, y=0, z=0) {
    for(i=[0:gridsize-1-x]) {
        for(j=[0:gridsize-1-y]) {
                for(k=[0:gridsize-1-z]) {
                    translate([(i+.5*x)*spacing, (j+.5*y)*spacing, (k+.5*z)*spacing]) {
                        rotate([90*y, 90*x, 0])
                            rod();
                    }
                }
        }
    }
}

rotate(a=35, v=[0, -1, 0])
rotate(a=45, v=[1, 0, 0]) {
for(i=[0:gridsize-1]) {
for(j=[0:gridsize-1]) {
        for(k=[0:gridsize-1]) {
            translate([i*spacing, j*spacing, k*spacing]) node();
        }
    }
}

rodforest(x=1);
rodforest(y=1);
rodforest(z=1);
}