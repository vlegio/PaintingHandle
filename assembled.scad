include <./config.scad>;
include <./handle.scad>;



if (mode == "full"){
    handle(handleHeight, handleBaseDia, handleTopDia);
    translate([0,0,handleHeight]){
    base(handleTopDia/2, handleTopDia*2, handleHeight);
        for(i=[-1,1]){
            translate([0,i*-handleHeight/5,0])
            rotate([0,0,(i-1)*-90])
            retainer(handleTopDia/2,    handleTopDia*2, handleHeight);
        }
    }
}
if (mode == "handle") {
     handle(handleHeight, handleBaseDia, handleTopDia);
}
if (mode == "base") {
    base(handleTopDia/2, handleTopDia*2, handleHeight);
}
if (mode == "retainer") {
    rotate([0,0,180])
    retainer(handleTopDia/2,    handleTopDia*2, handleHeight);
}
