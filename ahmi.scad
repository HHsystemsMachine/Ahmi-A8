include <hardware.scad>

ten10 =6.25;
ten20=5;
ridge=ten20;



//*****************finished components******************//
//y_rail_clamp();
//y_rail_clamp_w_endstop();
//y_stepper_mount_1020();
//y_stepper_mount_1010();//set ridge=ten10
//y_tensioner_base();
y_tensioner();
//bottom_corners();
//double_corners();
//bottom_t_plate();
//top_corner_10_20_left();
//top_corner_10_20_right();
//anet_mainboard_stand();
//anet_display();
//z_stepper_mount_left(ridge=ten20);
//z_stepper_mount_right(ridge=ten20);
//z_rail_mount_left(ridge=ten20);//set ridge=ten20
//z_rail_mount_right();//set ridge=ten20
//z_endstop_mount();
//display_mount();




//*****************parts for components******************//
//stepper_mount();
//corner_arm_center();
//corner_arm();
//y_stepper_mount_base();
//z_back();
//z_rail_back();
//display_screw();
//display_mount_base
//display_mount_mount();


//*****************Main Components******************//


module display_mount(){
    difference(){
    union(){
display_mount_base();
rotate([0,90,0])translate([-13,4.75,-28])display_mount_mount();}

        rotate([0,0,52])translate([20.3,0,0])linear_extrude(18)square([36,100],center=true);
}
}
module anet_display(){
    anet_display_base();
            translate([73.75,22.5,-1])display_screw();//screw 1
            translate([73.75,-29,-1])display_screw();//screw 2
            translate([-81.75,22.5,-1])display_screw();//screw 3
            translate([-81.75,-29,-1])display_screw();//screw 4
}

module z_endstop_mount(){
    difference(){
union(){
translate([0,0,0])linear_extrude(height=5.5)square([10,40],center=true);//base
translate([-9,-10,0])linear_extrude(height=10)square([9,20],center=true);//endstop top
translate([0,10,-1])linear_extrude(1)square([10,ridge],center=true);// ridge
translate([0,-10,-1])linear_extrude(1)square([10,ridge],center=true);// ridge
}

#translate([-10,-14,0])linear_extrude(height=10)circle(d=1,$fn=360);//endstop hole 1
#translate([-10,-5,0])linear_extrude(height=10)circle(d=1,$fn=360);//endstop hole 2
    translate([0,10,-4.5])m4_6mm();//screw 1
    translate([0,-10,-4.5])m4_6mm();//screw 2
}
}
module top_corner_10_20_left(){
        translate([20,0,0])corner_arm(ridge=ten10,rh=2);
    rotate([0,0,90])translate([20,0,0])corner_arm(ridge=ten20,rh=1);
    rotate([0,0,90])translate([20,20,0])corner_arm(ridge=ten20,rh=1);
    rotate([0,0,-45])translate([0,39.94,0])linear_extrude(height=5.5)square([56.57,5],center=true);//arm 
}
module top_corner_10_20_right(){
    mirror()top_corner_10_20_left();
}
module z_rail_mount_left(){
    difference(){
        union(){
    difference(){
    translate([23,8,0])linear_extrude(5.5)square([9,42],center=true);//base
    //translate([0,-5,0])linear_extrude(5.5)square([42,42],center=true);//hole for stepper mount
            #rotate([90,0,0])translate([22,2.75,8])linear_extrude(5)circle(d=2.75,$fn=360);//rail mount screw hole

    }
        translate([-23,8,0])linear_extrude(5.5)square([9,42],center=true);//base
    rotate([90,0,0])translate([0,10,-29])z_rail_back(ridge);
    translate([0,-5,0])z_screw_bearing_mount();
}
    translate([22,-5,0])linear_extrude(7.5)circle(d=8,$fn=360);//hole for rail
}
}
module z_rail_mount_right(){
    mirror()z_rail_mount_left();
}

module z_stepper_mount_left(ridge){
    difference(){
        union(){
    difference(){
    linear_extrude(5.5)square([58,58],center=true);//base
    translate([0,-5,0])linear_extrude(5.5)square([42,42],center=true);//hole for stepper mount
    }
    rotate([90,0,0])translate([0,28.25,-29])z_back(ridge);
    translate([0,-5,0])stepper_mount();
}
    translate([22,-5,0])linear_extrude(5.5)circle(d=8,$fn=360);//hole for rail
}
}
module z_stepper_mount_right(ridge){
  mirror()z_stepper_mount_left(ridge);  
}
module anet_mainboard_stand(){
    difference(){
    union(){
    linear_extrude(5.5)square([100,120]);//main base
    translate([10,6,5.5])linear_extrude(1)square([20,ridge],center=true);//ridge
    translate([90,6,5.5])linear_extrude(1)square([20,ridge],center=true);//ridge
    translate([4,111.6,5.5])linear_extrude(4.5)circle(d=8,$fn=360);//board peg
    translate([96,111.6,5.5])linear_extrude(4.5)circle(d=8,$fn=360);//board peg
    translate([4,25,5.5])linear_extrude(4.5)circle(d=8,$fn=360);//board peg by mount
    translate([96,25,5.5])linear_extrude(4.5)circle(d=8,$fn=360);//board peg by mount 
    }
    translate([20,0,0])linear_extrude(5.5)square([60,10]);
    rotate([0,180,0])translate([-6,6,-10])m4_6mm();//screw hole
    rotate([0,180,0])translate([-94,6,-10])m4_6mm();//screw hole
    translate([4,111.6,0])linear_extrude(10)circle(d=3.8,$fn=360);//board hole
    translate([96,111.6,0])linear_extrude(10)circle(d=3.8,$fn=360);//board hole
    translate([4,25,0])linear_extrude(10)circle(d=3.8,$fn=360);//board hole by mount
    translate([96,25,0])linear_extrude(10)circle(d=3.8,$fn=360);//board hole by mount
    translate([10,30,0])linear_extrude(5.5)square([80,80]);//base hole   
}
}
module y_tensioner(){
    difference(){
    union(){
        translate([0,0,0])linear_extrude(5.5)square([25,10],center=true);//tensioner base
        translate([7,0,5.5])linear_extrude(40)square([5,5],center=true);//tensioner leg
        translate([-7,0,5.5])linear_extrude(40)square([5,5],center=true);//tensioner leg
    }
    linear_extrude(5.5)circle(d=4,$fn=360);//screw hole
    translate([0,0,2.25])m4_nut();//nut
    #rotate([0,90,0])translate([-40,0,-12.5])linear_extrude(25)circle(d=3,$fn=360);
}
}
module y_tensioner_base(){
    difference(){
        union(){
    linear_extrude(5.5)square([50,20],center=true);//base
    translate([0,0,5.5])linear_extrude(10)square([25,20],center=true);//top
    translate([0,0,-1])linear_extrude(1)square([50,ridge],center=true);//ridge

        }
        #translate([7,0,6.5])linear_extrude(5.75)square([5.75,20],center=true);//tensioner hole
        #translate([-7,0,6.5])linear_extrude(5.75)square([5.75,20],center=true);//tensioner hole
        #translate([19,0,-4.5])m4_6mm();
        #translate([-19,0,-4.5])m4_6mm();

    }
}
module y_stepper_mount_1010(ridge=ten10){
    difference(){
        union(){
    y_stepper_mount_base(ridge);
                            //z,y,x
    rotate([0,90,0])translate([-26.5,-29,0])stepper_mount();
    translate([2.75,-4,5.5])linear_extrude(42)square([5.5,8],center=true);
    translate([2.75,-35,0])linear_extrude(5.5)square([5.5,30],center=true);


    difference(){
    rotate([0,0,-47])translate([15,-31,0])linear_extrude(5.5)square([55,7],center=true);
    translate([-1,-60,0]) linear_extrude(5.5)square([10,10]);
    translate([5.5,-50,0]) linear_extrude(5.5)square([10,10]);
    translate([-37.5,-25,0]) linear_extrude(5.5)square([10,20]);
    }
    difference(){
    translate([2.75,10,5.5])linear_extrude(42)square([5.5,20],center=true);
    rotate([25,0,0])translate([2.75,30,-10])linear_extrude(80)square([5.5,20],center=true);
    #rotate([25,0,0])translate([2.75,5,-10])linear_extrude(80)square([5.5,20],center=true);
    } 
}
    #translate([-27.5,0,-2])linear_extrude(55)square([55,20]);


}
}
module y_stepper_mount_1020(ridge=ten20){
    y_stepper_mount_base(ridge);
                            //z,y,x
    rotate([0,90,0])translate([-26.5,-29,0])stepper_mount();
    translate([2.75,-4,5.5])linear_extrude(42)square([5.5,8],center=true);
    translate([2.75,-35,0])linear_extrude(5.5)square([5.5,30],center=true);


    difference(){
    rotate([0,0,-47])translate([15,-31,0])linear_extrude(5.5)square([55,7],center=true);
    translate([-1,-60,0]) linear_extrude(5.5)square([10,10]);
    translate([5.5,-50,0]) linear_extrude(5.5)square([10,10]);
    translate([-37.5,-25,0]) linear_extrude(5.5)square([10,20]);
    }
    difference(){
    translate([2.75,10,5.5])linear_extrude(42)square([5.5,20],center=true);
    rotate([25,0,0])translate([2.75,30,-10])linear_extrude(80)square([5.5,20],center=true);
    #rotate([25,0,0])translate([2.75,5,-10])linear_extrude(80)square([5.5,20],center=true);
    } 
}
module bottom_t_plate(){
    translate([20,0,0])corner_arm();
    rotate([0,0,90])translate([20,0,0])corner_arm_center();
    rotate([0,0,180])translate([20,0,0])corner_arm();
    rotate([0,0,-45])translate([0,39.94,0])linear_extrude(height=5.5)square([56.57,5],center=true);//arm brace
    mirror()rotate([0,0,-45])translate([0,39.94,0])linear_extrude(height=5.5)square([56.57,5],center=true);//arm brace
 }
module bottom_corners(){
    translate([20,0,0])corner_arm();
    rotate([0,0,90])translate([20,0,0])corner_arm();
    rotate([0,0,-45])translate([0,39.94,0])linear_extrude(height=5.5)square([56.57,5],center=true);//arm 
 }
 
module double_corners(){
    translate([20,0,0])corner_arm();
    translate([20,-20,0])corner_arm();
    rotate([0,0,90])translate([20,0,0])corner_arm();
    rotate([0,0,90])translate([20,20,0])corner_arm();
    rotate([0,0,-45])translate([0,39.94,0])linear_extrude(height=5.5)square([56.57,5],center=true);//arm 
 }

module y_rail_clamp(){
difference(){
union(){
linear_extrude(height=5.5)square([45,20],center=true);//base
translate([0,0,5.5])linear_extrude(height=10)square([25,20],center=true);//top
translate([-9,0,-1])linear_extrude(height=1)square([27,ridge],center=true);//arm ridge
translate([18,0,-1])linear_extrude(height=1)square([9,ridge],center=true);//arm ridge

}
translate([9,0,7])linear_extrude(height=1)square([10,20],center=true);//y shaft slit
rotate([90,0,0])translate([0,8,-10])linear_extrude(height=20)circle(d=8.25,$fn=360);//y shaft
translate([17,0,-4.5])m4_6mm();//screw 1
translate([-17,0,-4.5])m4_6mm();//screw 2
translate([9,0,-.5])m4_12mm();//screw 3
translate([9,0,0])m4_nut();//m4 bolt
}
}

module y_rail_clamp_w_endstop(){
difference(){
union(){
translate([-11,0,0])linear_extrude(height=5.5)square([67,20],center=true);//base
translate([0,0,5.5])linear_extrude(height=10)square([25,20],center=true);//top
translate([-22.5,-14,0])linear_extrude(height=5.5)square([20,9],center=true);//top
translate([-24.5,0,-1])linear_extrude(height=1)square([40,ridge],center=true);//arm ridge
translate([18,0,-1])linear_extrude(height=1)square([9,ridge],center=true);//arm ridge
}
rotate([90,0,0])translate([0,8,-10])linear_extrude(height=20)circle(d=8.25,$fn=360);//y shaft
translate([9,0,7])linear_extrude(height=1)square([10,20],center=true);//y shaft slit
translate([-18,-14,0])linear_extrude(height=5.5)circle(d=1,$fn=360);//endstop hole 1
translate([-27,-14,0])linear_extrude(height=5.5)circle(d=1,$fn=360);//endstop hole 1
translate([17,0,-4.5])m4_6mm();//screw 1
translate([-38,0,-4.5])m4_6mm();//screw 2
translate([9,0,-.5])m4_12mm();//screw 3
translate([9,0,0])m4_nut();//m4 bolt
}
}













//*****************Parts for main components******************//
module display_mount_mount(){
        difference(){
union(){
translate([0,0,0])linear_extrude(height=5.5)square([10,40],center=true);//base
translate([0,10,-1])linear_extrude(1)square([10,ridge],center=true);// ridge
translate([0,-10,-1])linear_extrude(1)square([10,ridge],center=true);// ridge
}
    translate([0,10,-4.5])m4_6mm();//screw 1
    translate([0,-10,-4.5])m4_6mm();//screw 2
}
}
module display_mount_base(){
    difference(){
    linear_extrude(8)square([56,49.5],center=true);
    rotate([0,0,52])translate([20.3,0,0])linear_extrude(8)square([36,100],center=true);
    rotate([0,0,52])translate([10,0,0])linear_extrude(8)square([36,37],center=true);
    rotate([0,0,52])translate([0,22.7,0])linear_extrude(7.6)square([3,5.8],center=true);//bolt hole
    rotate([0,0,52])translate([0,-28.7,0])linear_extrude(7.6)square([3,5.8],center=true);//bolt hole
    #rotate([90,0,-38])translate([28.75,4,-10])linear_extrude(25)circle(d=3.5,$fn=360);//screw hole
    rotate([90,0,-38])translate([-22.75,4,-4])linear_extrude(25)circle(d=3.5,$fn=360);//screw hole
    }
}
module display_screw(){
    difference(){
    linear_extrude(8)circle(d=8,$fn=360);
        #rotate([180,0,0])translate([0,0,-20])m3_20mm();
}
}
module anet_display_base(){
    difference(){
    translate([-4.5,-0.25,-3])linear_extrude(height=12)square([166,72],center=true);//base
    translate([-4.5,-0.25,0])linear_extrude(height=12)square([163,69],center=true);//clearing
        /////SREEN HOLE
#translate([-27.5,1,-3])linear_extrude(4)square([99,42],center=true);
        /////SCREW HOLES
translate([73.75,22.5,-3])linear_extrude(4)circle(d=5,$fn=360);//screw hole 1
translate([73.75,-29,-3])linear_extrude(4)circle(d=5,$fn=360);//screw hole 2
translate([-81.75,22.5,-3])linear_extrude(4)circle(d=5,$fn=360);//screw hole 3
translate([-81.75,-29,-3])linear_extrude(4)circle(d=5,$fn=360);//screw hole 4
        /////BUTTON HOLES
translate([52.25,18.5,-3])linear_extrude(height=4)circle(d=8,$fn=360);//bottom button hole 1
translate([52.25,1.5,-3])linear_extrude(height=4)circle(d=8,$fn=360);//center button hole 1
translate([52.25,-15.5,-3])linear_extrude(height=4)circle(d=8,$fn=360);//top button hole 1
translate([35.25,1.5,-3])linear_extrude(height=4)circle(d=8,$fn=360);//left button hole 1
translate([69.25,1.5,-3])linear_extrude(height=4)circle(d=8,$fn=360);//right button hole 1
        //////WORDS
rotate([0,180,180])translate([-80,24,2])linear_extrude(1)text("AHMI A8");
rotate([0,180,180])translate([-80,-33,2])linear_extrude(1)text("3dprintedinthe.us");
    }
}
module z_back(ridge){
    h=1.25;
    difference(){
        union(){
    translate([0,0,0])linear_extrude(5.5)square([58,45.5],center=true);//base
    translate([-26.5,0,5.5])linear_extrude(52.5)square([5,45.5],center=true);//side wall
    translate([26.5,0,5.5])linear_extrude(52.5)square([5,45.5],center=true);//side wall
    translate([-20,-2.75,-h])linear_extrude(h)square([ridge,51],center=true);//ridge
    translate([0,-2.75,-h])linear_extrude(h)square([ridge,51],center=true);//ridge
        }
    #rotate([-45,0,0])translate([0,0,20])linear_extrude(55)square([58,120],center=true);//base
    translate([-20,15,-4.5])m4_6mm();
    translate([-20,-5,-4.5])m4_6mm();
    translate([0,15,-4.5])m4_6mm();
    translate([0,-5,-4.5])m4_6mm();
    }
}
module z_rail_back(ridge){
    h=1.25;
    difference(){
        union(){
    translate([0,0,0])linear_extrude(5.5)square([58,20],center=true);//base
    translate([-20,0,-h])linear_extrude(h)square([ridge,20],center=true);//ridge
    translate([0,0,-h])linear_extrude(h)square([ridge,20],center=true);//ridge
        }
    //#rotate([-45,0,0])translate([0,0,20])linear_extrude(55)square([58,120],center=true);//base
    translate([-20,0,-4.5])m4_6mm();
    translate([0,0,-4.5])m4_6mm();
    }
}
module y_stepper_mount_base(){
difference(){    
    union(){
    linear_extrude(height=5.5)square([55,40],center=true);//base
    translate([0,10,-1])linear_extrude(1)square([55,ridge],center=true);// ridge
    translate([0,-10,-1])linear_extrude(1)square([55,ridge],center=true);// ridge
    }
    #translate([20,10,-4.5])m4_6mm();//screw 1
    #translate([20,-10,-4.5])m4_6mm();//screw 2
    translate([-20,10,-4.5])m4_6mm();//screw 3
    translate([-20,-10,-4.5])m4_6mm();//screw 4

}
}

module stepper_mount(){
    difference(){
     linear_extrude(5.5)square([42,42],center=true);//base
     linear_extrude(5.5)circle(d=25,$fn=360);//main hole
     translate([15.5,15.5,0])linear_extrude(5.5)circle(d=3.5,$fn=360);//screw hole 1
     translate([15.5,-15.5,0])linear_extrude(5.5)circle(d=3.5,$fn=360);//screw hole 2
     translate([-15.5,-15.5,0])linear_extrude(5.5)circle(d=3.5,$fn=360);//screw hole 3
     translate([-15.5,15.5,0])linear_extrude(5.5)circle(d=3.5,$fn=360);//screw hole 4
    }
}
module z_screw_bearing_mount(){
    difference(){
        union(){
        translate([0,0,5.5])linear_extrude(2)circle(d=42,$fn=360);//base
        linear_extrude(5.5)circle(d=42,$fn=360);//base            
        }
     linear_extrude(5.5)circle(d=22.1,$fn=360);//bearing hole
        translate([0,0,5.5])linear_extrude(5.5)circle(d=20,$fn=360);//bearing hole
    }
}
module corner_arm_center(){
        difference(){
   linear_extrude(height=5.5)square([60,20],center=true);//arm
            #rotate([180,0,0])translate([-20,0,-10])m4_6mm();
            translate([20,0,-4.5])m4_6mm();
            translate([0,0,-4.5])m4_6mm();
        }
}
module corner_arm(){
        difference(){
            union(){
   linear_extrude(height=5.5)square([60,20],center=true);//arm 
   translate([12.5,0,-1])linear_extrude(1)square([35,ridge],center=true);//arm ridge
                //echo(rh);
            }
            #rotate([180,0,0])translate([-20,0,-10])m4_6mm();
            translate([23,0,-4.5])m4_6mm();
            translate([3,0,-4.5])m4_6mm();
        }
}