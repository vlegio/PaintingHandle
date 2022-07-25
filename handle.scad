include <./config.scad>;

module handleConnector(topDia) {
    intersection(){
        cube([topDia/2, topDia/2, topDia], center = true);
        cylinder(h=topDia,r1=topDia/3, r2=topDia/3);
    }
}

module handle(height, baseDia, topDia) {
    assert(height>baseDia/2, "Height is lower then baseDia/2");
    assert(topDia >= 10, "topDia must be more or equal 10");
    assert(topDia > baseDia/4, "topDia must be more then baseDia/4")
    cylinder(h=baseDia, r1=baseDia/2, r2=topDia/2);
    minkowski(){
        cylinder(height-baseDia/2,baseDia/4, topDia-baseDia/4);
        translate([0,0,baseDia/4])
        sphere(baseDia/4);
    }
   translate([0,0,height])
   handleConnector(topDia);
}



module base(thinckness, width, deepth) {
    difference() {
        translate([0,0,thinckness/2])
        cube([width, deepth*1.5, thinckness], center=true);
        handleConnector(thinckness*2+0.1);
        for (i=[-1,1]) {
            translate([i*width/2,0, thinckness/2])
            rotate([0,i*-45,0]){
                cube([width, deepth*1.5+0.1, thinckness], center = true);
            }
        }
    }
}

module retainer(thinckness, width, deepth) {
    difference(){
        translate([0,0,thinckness])
        union(){
            minkowski(){
                cube([width*1.3-1, deepth/3-1,2*thinckness-3],center = true);
                sphere(1.5);
            }
            for (i=[-1,1]){
                translate([i*-width*1.3/2,0,-thinckness/2]){
                    difference(){
                        rotate([0,0,45]){
                            difference() {
                                minkowski(){
                                    cube(thinckness/2,center=true);
                                    translate([0,0,thinckness/2])
                                    sphere(thinckness/2);
                                }
                            }
                
                        }
                        translate([i*-2,-thinckness/4,thinckness/2])
                        rotate([0,0,i*-10]){
                            cube([2,thinckness+2,thinckness*2],center=true);
                        }
                    }
                }
            }
        }
        translate([0,deepth/3-3,-0.1]){
            base(thinckness+0.1, width+0.1, deepth+0.1);
        }
        for (i=[0:len(baseSizes)-1])
        translate([0,baseSizes[i]/2+baseSizes[0]/2-i*4,thinckness+1+2*i]){
            cylinder(h=thinckness*3,r = baseSizes[i]/2);
            //%cylinder(h=thinckness*3,r = baseSizes[i]/2);
        }
    }
}

//%retainer(handleTopDia/2,    handleTopDia*2, handleHeight);
