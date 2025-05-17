$fn=360;
tap=4;
screw=5;
head=8.5;



faceplate_tap();
//faceplate_hole();
//faceplate_head();
//mast_hole();
//mast_head();
//top_hole();
//top_head();




module faceplate_tap(){
difference(){
translate([-5,-5,0])cube([30,50,25]);
rotate([0,180,90])translate([-43,-3,-1])linear_extrude(1)text(size=5,"faceplate_tap");
    translate([0,0,5])cube([25,40,20]);
    translate([10,10,0])cylinder(h=5, d=tap);
    translate([10,30,0])cylinder(h=5, d=tap);

}
}



module faceplate_hole(){
difference(){
translate([-5,-5,0])cube([30,50,25]);
rotate([0,180,90])translate([-43,-3,-1])linear_extrude(1)text(size=5,"faceplate_hole");
    translate([0,0,5])cube([25,40,20]);
    translate([10,10,0])cylinder(h=5, d=screw);
    translate([10,30,0])cylinder(h=5, d=screw);

}
}


module faceplate_head(){
difference(){
translate([-5,-5,0])cube([30,50,25]);
rotate([0,180,90])translate([-43,-3,-1])linear_extrude(1)text(size=5,"faceplate_head");
    translate([0,0,5])cube([25,40,20]);
    translate([10,10,0])cylinder(h=5, d=head);
    translate([10,30,0])cylinder(h=5, d=head);

}
}



module mast_hole(){
difference(){
translate([-5,-5,0])cube([30,50,25]);
rotate([0,180,90])translate([-43,-3,-1])linear_extrude(1)text(size=5,"mast_hole");
    translate([0,-5,5])cube([20,50,20]);
    translate([10,10,0])cylinder(h=5, d=screw);
    translate([10,30,0])cylinder(h=5, d=screw);

}
}


module mast_head(){
difference(){
translate([-5,-5,0])cube([30,50,25]);
rotate([0,180,90])translate([-43,-3,-1])linear_extrude(1)text(size=5,"mast_head");
    translate([0,-5,5])cube([20,50,20]);
    translate([10,10,0])cylinder(h=5, d=head);
    translate([10,30,0])cylinder(h=5, d=head);

}
}

module top_hole(){
difference(){
translate([-5,-5,0])cube([30,50,25]);
rotate([0,180,90])translate([-43,-3,-1])linear_extrude(1)text(size=5,"top_hole");
    translate([0,0,5])cube([20,45,20]);
    translate([10,10,0])cylinder(h=5, d=screw);
    translate([10,30,0])cylinder(h=5, d=screw);

}
}

module top_head(){
difference(){
translate([-5,-5,0])cube([30,50,25]);
rotate([0,180,90])translate([-43,-3,-1])linear_extrude(1)text(size=5,"top_head");

    translate([0,0,5])cube([20,45,20]);
    translate([10,10,0])cylinder(h=5, d=head);
    translate([10,30,0])cylinder(h=5, d=head);

}
}