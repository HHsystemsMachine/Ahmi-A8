//m4_nut();
//m4_16mm();
module m4_nut(){
linear_extrude(height=3.25)circle(d=8,$fn=6);//m4 nut
}

module m4_6mm(){
translate([0,0,6])linear_extrude(height=4)circle(d=7,$fn=360);//screw head
translate([0,0,0])linear_extrude(height=6)circle(d=4,$fn=360);//screw shaft
}

module m4_8mm(){
translate([0,0,8])linear_extrude(height=4)circle(d=7,$fn=360);//screw head
translate([0,0,0])linear_extrude(height=8)circle(d=4,$fn=360);//screw shaft
}

module m4_10mm(){
translate([0,0,10])linear_extrude(height=4)circle(d=7,$fn=360);//screw head
translate([0,0,0])linear_extrude(height=10)circle(d=4,$fn=360);//screw shaft
}

module m4_12mm(){
translate([0,0,12])linear_extrude(height=4)circle(d=7,$fn=360);//screw head
translate([0,0,0])linear_extrude(height=12)circle(d=4,$fn=360);//screw shaft
}
module m4_16mm(){
translate([0,0,16])linear_extrude(height=4)circle(d=7,$fn=360);//screw head
translate([0,0,0])linear_extrude(height=16)circle(d=4,$fn=360);//screw shaft
}
module m3_20mm(){
translate([0,0,20])linear_extrude(height=3)circle(d=5,$fn=360);//screw head
translate([0,0,0])linear_extrude(height=20)circle(d=3,$fn=360);//screw shaft
}
