// Arcus-3D-C1 - Cable printer OpenSCAD source

// Licensed under the Creative Commons Attribution-ShareAlike 3.0 Unported License
// http://creativecommons.org/licenses/by-sa/3.0/

// Project home
// https://hackaday.io/project/26938
//

// The parts for rendering
// Uncomment each part here, save, render, then export to STL.

//top_corner();
//top_corner_new();
//bottom_corner();
//stepper_mount();
//spool_bearing();
//shaft_coupler();
//extruder_mount();
//extruder_top();
//extruder_bottom();
//extruder_spacer();
//extruder_knob();
//extruder_spring_washer();
//dampener();
// The virtual pulleys bring the interface to a crawl.
//end_effector_body(render_pulley=1);
//end_effector_joint();
//end_effector_blower_nozzle();
//push_rod_joint();
//push_rod_top();
//push_rod_stop();
//push_rod_clamp();
//push_rod_knob();
//pnp_assembly();
pnp_main_light_ring();
//pnp_main_light_ring_base();
//pnp_head();
//pnp_groove_outer_mount();
//pi_mini_camera();
//translate([-5.5,0,-29.25/2-3.65]) servo();
//9g_servo();
// Drilling template for the AL spool rod
//spool_rod_template();

// Assembled top corner for visualization
//top_corner_assembly();

// Assembled end effector for visualization
//end_effector_assembly();

// Assembled clamp for visualization
//push_rod_clamp_assembly();

// Extrusion compensation
// All the holes are this much larger than the actual setting.
// I tend to over-extrude a bit for strength on structural parts and this compensates.
// Print the shaft coupler first and if it fits the stepper shaft loosely, decrease this number. 
clearance=.20;

// First layer of end effector is flat and solid for better FFF printing.  
// If you want the holes all the way through, set to -.02 
first_layer_height=.26;
// Nozzle size for parts only a few layers thick.  Prints better.
nozzle_dia=.4;

// Unless you need to change something about the design, nothing below here needs editing.

// Rendering
$fn=90; // circle complexity.  Turn down while editing, up while rendering.
//$fn=20;
// General
roswell_constant=19.47; // Angle from vertical which makes an octahedron. 
// There is a geometric reason this angle works, but I'm too lazy to find it.
wall_thickness=2.0; // Everything is a multiple of this general wall thickness.

// End effector
effector_offset=wall_thickness; // Offset from colinear of neighboring axis cable holes.
effector_spacing=63.5; // Distance between parallel lines on the end effector.
effector_hinge_thickness=wall_thickness*1.80; // Hinge thickness at contact point.
effector_bearing_dia=1.78; // Pin for U joint, aka, some printer filament.
effector_hinge_dia=effector_bearing_dia+wall_thickness*3;
effector_ring_dia=effector_spacing/1.45; // Support ring dia.
effector_ring_height=effector_spacing/5.0; //Support ring height.
effector_hotend_flange_dia=16; // Fits the flange on the hotend.
effector_hotend_flange_height=2.95; // Fits the flange on the hotend.
effector_wire_hole_dia=8; // Holes for wires.
effector_level_bolt_dia=2.65; // Bolt dia for leveling bolts. 3mm bolt threaded in.
effector_blower_bolt_dia=4.2; // Bolt dia for blower bolt. 
effector_blower_height=19.7; // Blower output height.
effector_blower_width=15.25; // Blower output width.
effector_blower_nozzle_height=45; // Nozzle from back of fan to tip.
effector_blower_mount_dia=7; // Screw mount dia on blower.
effector_blower_arc_dia=effector_blower_height*7.5; // Adjust curve of the nozzle.

cable_hole_dia=1.0; // Holes for lines.

// Corners supports
support_rod_dia=8.25; // Driveway marker diameter.
support_rod_depth=20; // Depth of the pockets for support rods.
pulley_thickness=4.5; // 4mm really, but cleanup here is a pita.
pulley_outer_dia=14.5; // 13mm really, but bridge can droop.
pulley_inner_dia=11; // Center dia for spooling.
pulley_bolt_dia=4; // Pulley bolt dia.
pulley_offset=0; // Move pulley location in or out a bit from center of machine.  Wasn't needed.
pulley_skew=1.2; // This tries to compensate for horizontal offset from the pulley by skewing the size of the virtual pulley on the effector.

// Push rod
push_rod_dia=7.75; // Garden stake was this dia.
push_rod_stop_bolt_dia=3.1;
push_rod_depth=20; // Depth of pocket for push-rod.
push_rod_slide=25; // How tall to make the sliding portion.

// Rollerblade bearing, 8mm id
spool_bearing_thickness=7; // Depth of pocket for bearing.
spool_bearing_dia=22; // Pocket dia for bearing.

// Steppers
stepper_size=43; // Square size of stepper.
stepper_oversize=7; // Flange is embiggend this much for clearance.
stepper_flange_dia=22.5; // Raised flange on stepper dia.
stepper_bolt_spacing=31; // Bolt spacing on stepper.
stepper_bolt_dia=3; // Inner hole size for dampeners
stepper_damper_dia=7; // Outer size for dampeners.  For no dampeners, set to 3.1.

// Extruder
extruder_bolt_dia=4.75; // Extruder tension bolt size
extruder_drive_offset=4.5; //Offset from center line of extruder drive gear to center of filament
extruder_drive_depth=5.6; // Offset from stepper flange to center of filament.
bowden_tube_dia=4; //Outer dia of bowden tube.
extruder_knob_height=7; // Height of ribbed portion of knob.

// Shaft coupler from stepper to AL spooling rod.
coupler_length=18; // Overall length for coupler.  Each shaft gets half.
coupler_d_shaft_dia=5; // Stepper shaft dia.
coupler_shaft_dia=7.79; // 5/16in AL rod in mm.
//Pick and place head
pnp_nozzle_offset=34;
pnp_servo_offset=23+wall_thickness;
pnp_servo_height=20;
pnp_drive_offset=12.25;
pnp_mirror_v_offset_1=15;
pnp_mirror_v_offset_2=10;
pnp_mirror_angle=65.65;
pnp_camera_fov=30;
pnp_hinge_x=-.5;
pnp_hinge_y=0;
pnp_hinge_z=14;
pnp_camera_dia=8.15;
pnp_servo_width=26.15;
pnp_mirror_width=26.15;
pnp_hinge_width=27.8;
pnp_bearing_b=2.5;
pnp_mount_bolt_dia=5;
pnp_groove_offset=-pnp_nozzle_offset/2-3;

// Limit switches
limit_switch_thickness=6.5;

module emboss_logo(url=0) {
	logo();
	if ( url == 1) translate([-34, -15,0]) linear_extrude(height = .4) scale([.685,.60,1]) text("Arcus3D.com", halign = "left", font="Arial Black");
	translate([0,0,-.2]) intersection() {
		#translate([16,9.5,.105]) rotate([0,0,180]) scale([1,.39,1]) cylinder(r = 49.3, h = .205, center = true, $fn=3);
		scale([1,1,2]) logo();
	}
}

module logo() {
	translate([-25.3,5,.2])rotate([0,0,-30]) cylinder(r = 18, h = .4, center = true, $fn=3);
	translate([15.2,9.1,0]) linear_extrude(height = .4) scale([2.65,2.65,1]) text("3D", halign = "center",valign="center",font="Arial Black");
}


extra=.02; // for differencing

module top_corner_assembly() {
	%top_corner();
	translate([0,0,support_rod_dia/2+.4]) rotate([90,0,0]) cylinder(r=13/2+clearance,h=4,center=true);
	translate([-22,0,13.5]) rotate([0,90+roswell_constant,0]) limit_switch();
}

module end_effector_assembly() {
	end_effector_body(render_pulley=0);
	translate([0,0,effector_ring_height+effector_bearing_dia/2]) rotate([28,0,0]) {
		translate([0,0,-effector_bearing_dia*2]) end_effector_joint();
		rotate([0,28,0]) translate([-effector_ring_height/4,0,push_rod_depth*3]) rotate([180,0,0]) push_rod_joint();
	}
	//rotate([180,0,0]) translate([-effector_spacing/sqrt(3)-wall_thickness/4,0,-wall_thickness*1.5]) rotate([0,20,0]) end_effector_blower_nozzle();
	%translate([0,0,16.5/2]) cylinder(r=16/2,h=16.5,center=true); // groove mount visualization
}
module bearing(outer=6,inner=2,width=2.5) {
	%union() {
		difference() {
			cylinder(r=outer/2,h=width,center=true);
			cylinder(r=outer/2.3,h=width+extra,center=true);
		}
		difference() {
			cylinder(r=inner/1.4,h=width,center=true);
			cylinder(r=inner/2,h=width+extra,center=true);
		}
		cylinder(r=outer/2-extra,h=width*.9,center=true);
	}
}
module nozzle() {
	Rin=0.75;
	Rout=1.25;

	difference(){
		//outside
		union(){
			translate([0,0,-3]) cylinder(r1=5.4/2,r2=Rout,h=2);
			translate([0,0,-10]) cylinder(r1=5.6/2,r2=5.4/2,h=7+extra);
			translate([0,0,-11]) cylinder(r=7.5/2,h=1);
		}
		//inside
		translate([0,0,-11.1]) cylinder(r1=4.3/2,r2=4.0/2,h=6.1);
		translate([0,0,-5.1]) cylinder(r1=4.0/2,r2=Rin,h=5.2);
		//notches
		translate([5.6/2,-7.5/2,-11.1]) cube([1,7.5,1.2]);
		translate([-5.6/2-1,-7.5/2,-11.1]) cube([1,7.5,1.2]);
	}
}
module castle_gear() {
	// not for use...
	difference() {
		union() {
			cylinder(r=15.5/2,h=2.5,center=true);
			translate([0,0,-2]) cylinder(r=6/2,h=4,center=true);
			translate([0,0,.9]) for (i=[0:360/28:260]) rotate([0,0,i+180/28]) scale([.5,1,1]) rotate([90,0,0]) cylinder(r=.8,h=15.5,$fn=6,center=true);
		}
		translate([0,0,.5]) cylinder(r=13.5/2,h=3+extra,$fn=10,center=true);
		translate([0,0,1.2]) for (i=[0:360/28:260]) rotate([0,0,i]) scale([.55,1,1]) rotate([90,0,0]) cylinder(r=.8,h=15.6,$fn=6,center=true);
		translate([0,0,-3.8]) cylinder(r=4/2,h=3.5,center=true);
		translate([0,0,-1.8]) cylinder(r=2/2,h=3.5,center=true);
	}
}
	
module pi_mini_camera() {
	pcb_thickness=2;
	camera_hinge=8;
	difference() {
		union() {
			translate([24/2-14.5,0,pcb_thickness/2]) cube([24,25,pcb_thickness],center=true);
			translate([-14.5+4,0,pcb_thickness+1/2]) cube([6,8.7,2],center=true);
			translate([-camera_hinge,0,pcb_thickness]) rotate([0,-90,0]) translate([camera_hinge,0,1]) {
				translate([0,0,3.4/2]) cube([8.45+clearance,8.45+clearance,3.4],center=true);
				translate([-6,0,1.5/2]) cube([3.6,7,3.5],center=true);
				translate([0,0,6.5/2]) cylinder(r=8.5/2,h=6.5,center=true);
			}
			translate([24/2-14.5,0,pcb_thickness/2]) for (i=[-24/2+14.5]) for (j=[21/2,-21/2]) translate([i,j,0]) cylinder(r=1.8/2,h=15+extra,center=true);
		}
	}
}
	
module pnp_assembly() {
	arm_angle=0;//pnp_mirror_angle;
	head = 1;
	visuals=1;
	//rotate([180,0,180]) end_effector_body(render_pulley=0);
	// part visualization
	if (visuals) %hull() {
		translate([-pnp_nozzle_offset,0,pnp_servo_offset*1.5+22/2+1.6]) cylinder(r1=25/2,r2=6/2,h=13,center=true);
		translate([-pnp_nozzle_offset,0,pnp_servo_offset*1.5+22/2]) cylinder(r=25/2,h=4.5,center=true);
	}
	if (head) {
	//translate([0,0,pnp_servo_offset*1.616]) cylinder(r=12/2,h=10,center=true);
	//intersection() {
		pnp_head(display=1);
	//	translate([0,0,10]) cube([1000,1000,1],center=true);
	//}
	if (visuals) translate([-pnp_nozzle_offset,0,pnp_servo_offset/2]) {
		translate([0,0,-pnp_servo_offset/2+2.5/2]) bearing(outer=6,inner=2,width=2.5);
		translate([0,0,pnp_servo_offset/2-2.5/2]) bearing(outer=6,inner=2,width=2.5);
	}
	if (visuals) translate([pnp_hinge_x,-pnp_hinge_y,pnp_servo_offset/2+pnp_hinge_z]) rotate([90,0,0]) {
		%difference() {
			cylinder(r=2/2,h=pnp_hinge_width+1,center=true);
			cylinder(r=2/2.5,h=pnp_hinge_width+1+extra,center=true);
		}
		translate([0,0,pnp_hinge_width/2-2.5/2]) bearing(outer=6,inner=2,width=2.5);
		translate([0,0,-pnp_hinge_width/2+2.5/2]) bearing(outer=6,inner=2,width=2.5);
	}
	if (visuals) translate([-pnp_nozzle_offset,0,pnp_servo_offset/2+22/2-6]) %union() {
		%translate([0,0,9]) linear_extrude(height = 6, center = true, convexity = 10, twist = -360*7) translate([1.4, 0, 0]) circle(r = .3);
		intersection() {
			translate([0,0,16]) cylinder(r1=4.1/2,r2=4.0/2,h=8,center=true);
			translate([0,0,16]) cylinder(r1=11.2/2,r2=3.2/2,h=8,center=true);
		}
		%difference() {
			cylinder(r=2/2,h=52,center=true);
			cylinder(r=2/2.5,h=52+extra,center=true);
		}
		translate([0,0,23]) nozzle();
	}
	if (visuals) translate([-pnp_nozzle_offset,6.85,pnp_servo_height/2+wall_thickness/2]) rotate([90,180,0]) {
		color("blue") 9g_servo(display=1);
		castle_gear();
	}
	if (visuals) translate([-pnp_nozzle_offset+6.5*2,-1.8,pnp_servo_height/2+wall_thickness/2]) rotate([-90,0,0]) {
		color("blue") 9g_servo(display=1);
		rotate([0,0,arm_angle-60]) union() {
			translate([0,0,-.9]) cylinder(r=6/2,h=2.75,center=true);
			difference() {
				hull() {
					translate([0,0,.5]) cylinder(r=6/2,h=1,center=true);
					translate([14,0,.5]) cylinder(r=3/2,h=1,center=true);
				}
				translate([14,0,.5]) cylinder(r=1/2,h=1,center=true);
			}
		}
	}
	if (visuals) hull () {
		translate([-pnp_nozzle_offset+6.5*2,-1.8,pnp_servo_height/2+wall_thickness/2]) rotate([-90,0,0]) 
		rotate([0,0,arm_angle-60]) translate([14,0,1.5]) cylinder(r=1/2,h=1,center=true);
	}
	}
	translate([pnp_hinge_x,-pnp_hinge_y,pnp_servo_offset/2+pnp_hinge_z]) rotate([0,pnp_mirror_angle-arm_angle,0]) {
		translate([-22,0,-5]) pnp_mirror(display=1);
		translate([-52.90,0,-12.89]) rotate([0,-pnp_mirror_angle-180,0]) pnp_part_light_ring();
		//translate([-50.80,0,-13.85]) rotate([0,-pnp_mirror_angle-180,0]) pnp_part_light_ring();
		
	}
	translate([0,0,20]) rotate([0,0,0]) pnp_main_light_ring_base();
	translate([pnp_groove_offset,0,-10]) rotate([0,0,0]) pnp_groove_outer_mount();
}
module pnp_mirror(display=0) {
	arm_width= pnp_hinge_width-5-wall_thickness-clearance;
	camera_dia=10+clearance*3;
	translate([22,0,5]) union() {
		difference() {
			union() {
				// hinge
				rotate([90,0,0]) cylinder(h=arm_width,r=5,center=true);
				for (i=[3,1.5,-1.5,-3]) translate([i,0,-5+5/2]) cube([nozzle_dia,arm_width,5],center=true);
				// hinge brace	
				hull() {
					rotate([90,0,0]) cylinder(h=(arm_width+camera_dia+nozzle_dia*8)/2,r=5,center=true);
					translate([-6,0,-2.5]) rotate([90,0,0]) cylinder(h=camera_dia+nozzle_dia*8,r=5/2,center=true);
				}
				// stop
				hull() {
					intersection() {
						rotate([90,0,0]) cylinder(h=arm_width-wall_thickness,r=5,center=true);
						translate([-5,0,5]) cube([10,arm_width,10],center=true);
					}
					rotate([0,90-pnp_mirror_angle,0]) translate([.30,0,5]) rotate([0,0,0]) cube([1.25,arm_width-clearance*4,5.6],center=true);
				}
				// first mirror
				hull() {
					translate([0,0,1]) cube([extra,camera_dia+nozzle_dia*8,12],center=true);
					translate([2.5,0,5]) cube([extra,camera_dia+nozzle_dia*8,4],center=true);
					translate([-15,0,4.5]) rotate([90,0,0]) cylinder(h=camera_dia+nozzle_dia*8,r=5/2,center=true);
					translate([-13.5,0,-2.5]) cube([extra,camera_dia+nozzle_dia*8,5+extra],center=true);
					//translate([-10,0,-2.5]) rotate([90,0,0]) cylinder(h=camera_dia+nozzle_dia*8,r=5/2,center=true);
				}
				// mirror arm
				hull() {
					translate([-12.5,0,-2.5]) cube([extra,camera_dia+nozzle_dia*8,5],center=true);
					translate([-32,0,-2.5]) cylinder(r=(pnp_mirror_width+5)/2,h=5,center=true);
					translate([-53,0,-2.5]) cube([4.7,pnp_mirror_width+8.8,5],center=true);
				}
				// mirror shade
				//intersection() {
				//	translate([-54+50/4,0,0]) difference() {
				//		rotate([90,0,0]) cylinder(r=50/4,h=pnp_mirror_width+6.8,center=true);
				//		rotate([90,0,0]) cylinder(r=50/4-nozzle_dia*1,h=pnp_mirror_width+6.8-nozzle_dia*2,center=true);
				//		translate([-54+5/2,0,-2.5]) cube([25,pnp_mirror_width+15,5],center=true);
				//	}
				//	translate([-54+5/2,0,0]) rotate([0,-pnp_mirror_angle,0]) cube([5,pnp_mirror_width+15,12],center=true);
				//}
					
				// light support
				translate([-47,0,-2.5]) intersection() {
					rotate([0,-pnp_mirror_angle,0]) cube([5,pnp_mirror_width+19,nozzle_dia*3.3],center=true);
					translate([-0,0,0]) cube([10+extra,pnp_mirror_width+19+extra,5],center=true);
				}
			}
			union() {
				//hinge shaft cutout
				rotate([90,0,0]) {
					for(i=[-1,1]) translate([0,0,(arm_width/2-2.5/2)*i]) {
						scale([1,1.04,1]) cylinder(h=2.5+clearance*2+extra,r=6/2,center=true);
						cylinder(h=4+clearance,r=5/2,center=true);
					}
					cylinder(h=40+clearance,r=3/2,center=true);
				}
				// linkage cutout
				translate([-10,0,-2.5]) { 
					rotate([90,0,0]) {
						cylinder(h=14,r=1.95/2+extra,center=true);
						if (display) %difference() {
							cylinder(r=1.95/2,h=13,center=true);
							cylinder(r=2/2.5,13+extra,center=true);
						}
					}
					translate([2,0,-extra]) cube([9,2.5,5],center=true);
				}
				// camera cutout
				hull() {
					rotate([0,-pnp_mirror_angle,0]) translate([camera_dia/2+clearance,0,0]) cube([camera_dia+clearance*2,camera_dia+clearance*2,13],center=true);
					rotate([0,-pnp_mirror_angle,0]) cube([camera_dia+clearance*2,camera_dia+clearance*2,13.5+extra],center=true);
					cube([camera_dia+clearance*2,camera_dia+clearance*2,10],center=true);
				}
				// camera view cutout
				rotate([0,-pnp_mirror_angle,0]) {
					cylinder(r=camera_dia/2.7,h=38+extra,center=true);
					translate([5,0,0]) cube([10,camera_dia/2.7*2,28],center=true);
				}
				// mirror arm cutout	
				union() {
					hull() {
						translate([-15.5,0,-2.5]) cube([.1,camera_dia,5+extra],center=true);
						translate([-32,0,-2.5]) cylinder(r=(pnp_mirror_width+5-nozzle_dia*8)/2,h=5+extra,center=true);
						translate([-53+4.7/2,0,-2.5]) cube([extra,pnp_mirror_width+8.8-nozzle_dia*8,5+extra],center=true);
						translate([-53+4.7/2-3,0,-2.5]) cube([extra,pnp_mirror_width+8.8-nozzle_dia*8-3,5+extra],center=true);
					}
					hull () {
						translate([-53+4.7/2+extra,0,-3.5]) cube([extra,pnp_mirror_width+8.7-nozzle_dia*8,5+extra],center=true);
						translate([-53+4.7/2-3,0,-3.5]) cube([extra,pnp_mirror_width+8.8-nozzle_dia*8-3,5+extra],center=true);
					}
				}
			}
			// camera fov cone cutout
			rotate([0,-pnp_mirror_angle,0]) translate([-pnp_hinge_x,pnp_hinge_y,-pnp_servo_offset/2-pnp_hinge_z]) translate([0,0,pnp_servo_offset+pnp_mirror_v_offset_1]) rotate([0,(pnp_mirror_angle-90)*2,0]) translate([0,0,20-pnp_mirror_v_offset_2-1]) scale([1,4/3,1]) rotate([0,0,45]) cylinder(r1=0,$fn=4,r2=tan(pnp_camera_fov/2)*40,h=40,center=true);
			rotate([0,-pnp_mirror_angle,0]) {
				// large mirror slot
				#translate([-pnp_hinge_x,pnp_hinge_y,-pnp_servo_offset/2-pnp_hinge_z]) translate([-pnp_nozzle_offset,0,pnp_servo_offset*2.675]) rotate([0,pnp_mirror_angle-90,0]) translate([.75,0,3.45]) cube([26,24*4/3+clearance,1.35+clearance/2],center=true); // mirror is 32x26 
				// small mirror slot
				#translate([-pnp_hinge_x,pnp_hinge_y,-pnp_servo_offset/2-pnp_hinge_z]) translate([0,0,pnp_servo_offset+pnp_mirror_v_offset_1]) rotate([0,pnp_mirror_angle,0]) translate([-1.4,0,1.35/2+clearance/2]) cube([17,11,1.35],center=true); // mirror is 10x15
					
			}
		}
	}
}
module pnp_main_light_ring_base() {
	$fn=60;
	pnp_light_segment_length=50.25;
	pnp_light_outer_segment_count=4.1;
	pnp_light_inner_segment_count=2.7;
	pnp_light_cutout_angle=62;
	pnp_light_cutout_width=34;
	pnp_light_ring_inner_dia=pnp_light_segment_length*pnp_light_inner_segment_count*(360+pnp_light_cutout_angle)/360/3.14159265-nozzle_dia*2;
	pnp_light_ring_outer_dia=pnp_light_segment_length*pnp_light_outer_segment_count*(360+pnp_light_cutout_angle)/360/3.14159265+nozzle_dia*2;
	reflector_height=(pnp_light_ring_outer_dia-pnp_light_ring_inner_dia)/4;
	lip_height=wall_thickness/2;
	total_height=reflector_height+lip_height;
	difference() {
		// top shape
		translate([0,0,0]) union() {
			//outer cylinder
			translate([0,0,lip_height/2]) cylinder(r=pnp_light_ring_outer_dia/2,h=lip_height,center=true);
			intersection() {
				translate([0,0,total_height/2]) cylinder(r=pnp_light_ring_outer_dia/2,h=total_height,center=true);
				difference() {
					// outer slope	
					translate([0,0,reflector_height+lip_height]) cylinder(r1=pnp_light_ring_outer_dia/2-nozzle_dia,r2=pnp_light_ring_inner_dia/2-nozzle_dia,h=reflector_height*2,center=true);
					// innner slope
					translate([0,0,reflector_height+lip_height]) cylinder(r1=pnp_light_ring_inner_dia/2+nozzle_dia,r2=pnp_light_ring_outer_dia/2-nozzle_dia,h=reflector_height*2+extra,center=true);
					// angled ends
					hull() {
						rotate([0,0,pnp_light_cutout_angle/2]) translate([-pnp_light_ring_outer_dia/2+reflector_height,extra-reflector_height/1.41+nozzle_dia*2,reflector_height/2+lip_height]) rotate([45,0,0]) cube([reflector_height*4,extra,reflector_height*1.41],center=true);
						rotate([0,0,-pnp_light_cutout_angle/2]) translate([-pnp_light_ring_outer_dia/2+reflector_height,-extra+reflector_height/1.41-nozzle_dia*2,reflector_height/2+lip_height]) rotate([-45,0,0]) cube([reflector_height*4,extra,reflector_height*1.41],center=true);
					}
				}
			}
		}
		// top shape, moved down, subtracted.
		translate([0,0,-nozzle_dia*1.44-extra]) union() {
			intersection() {
				translate([0,0,total_height/2+lip_height]) cylinder(r=pnp_light_ring_outer_dia/2,h=total_height,center=true);
				difference() {
					translate([0,0,reflector_height+lip_height]) cylinder(r1=pnp_light_ring_outer_dia/2-nozzle_dia,r2=pnp_light_ring_inner_dia/2-nozzle_dia,h=reflector_height*2,center=true);
					translate([0,0,reflector_height+lip_height]) cylinder(r1=pnp_light_ring_inner_dia/2+nozzle_dia,r2=pnp_light_ring_outer_dia/2-nozzle_dia,h=reflector_height*2+extra,center=true);
					hull() {
						rotate([0,0,pnp_light_cutout_angle/2]) translate([-pnp_light_ring_outer_dia/2+reflector_height,extra-reflector_height/1.41+nozzle_dia*2,reflector_height/2+lip_height]) rotate([45,0,0]) cube([reflector_height*4,extra,reflector_height*1.41],center=true);
						rotate([0,0,-pnp_light_cutout_angle/2]) translate([-pnp_light_ring_outer_dia/2+reflector_height,-extra+reflector_height/1.41-nozzle_dia*2,reflector_height/2+lip_height]) rotate([-45,0,0]) cube([reflector_height*4,extra,reflector_height*1.41],center=true);
					}
					difference() {
						translate([0,0,wall_thickness/2+lip_height/2]) cube([effector_hotend_flange_dia+clearance+wall_thickness*2,pnp_light_ring_outer_dia,wall_thickness+extra],center=true);
						// tab mount	
						for (i=[0,180]) rotate([0,0,i]) translate([0,55/2+10/2+wall_thickness*2.5,wall_thickness/2+lip_height]) {
							cube([effector_hotend_flange_dia,10,wall_thickness+extra*2],center=true);
						}
					}
				}
			}
		}
		// center cutout
		translate([0,0,lip_height/2]) cylinder(r=pnp_light_ring_inner_dia/2,h=lip_height+extra,center=true);
		// angle cutout
		hull() {
			rotate([0,0,pnp_light_cutout_angle/2]) translate([-pnp_light_ring_outer_dia/2,extra,20/2]) cube([pnp_light_ring_outer_dia+extra*2,extra*2,20+extra],center=true);
			rotate([0,0,-pnp_light_cutout_angle/2]) translate([-pnp_light_ring_outer_dia/2,-extra,20/2]) cube([pnp_light_ring_outer_dia+extra*2,extra*2,20+extra],center=true);
		}
		// mounting tab slots
		for (i=[0,180]) rotate([0,0,i]) translate([0,55/2,-wall_thickness/2]) hull() {
			rotate([0,90,0]) cylinder(r=wall_thickness/2+clearance/2,h=effector_hotend_flange_dia+clearance,center=true);
			rotate([-35,0,0]) translate([0,0,wall_thickness*1.5]) rotate([0,90,0]) cylinder(r=wall_thickness/2+clearance/2,h=effector_hotend_flange_dia+clearance,center=true);
		}
	}
}

module pnp_main_light_ring() {
	$fn=90;
	pnp_light_segment_length=50.1;
	pnp_light_outer_segment_count=4.1;
	pnp_light_inner_segment_count=2.7;
	pnp_light_cutout_angle=62;
	pnp_light_cutout_width=34;
	pnp_light_ring_inner_dia=pnp_light_segment_length*pnp_light_inner_segment_count*(360+pnp_light_cutout_angle)/360/3.14159265-nozzle_dia*2;
	pnp_light_ring_outer_dia=pnp_light_segment_length*pnp_light_outer_segment_count*(360+pnp_light_cutout_angle)/360/3.14159265+nozzle_dia*2;
	ring_height=10+clearance*2;
	diffuser_height=0.30;
	total_height=ring_height+diffuser_height;
	difference() {
		translate([0,0,0]) difference() {
			union() {
				translate([0,0,total_height/2]) cylinder(r=pnp_light_ring_outer_dia/2,h=total_height,center=true);
				translate([0,0,diffuser_height*3]) cylinder(r1=pnp_light_ring_outer_dia/2+nozzle_dia,r2=pnp_light_ring_outer_dia/2,h=diffuser_height*6,center=true);
				translate([0,0,ring_height-diffuser_height*2]) cylinder(r2=pnp_light_ring_outer_dia/2+nozzle_dia,r1=pnp_light_ring_outer_dia/2,h=diffuser_height*6,center=true);
			}
			union() {
				translate([0,0,total_height/2]) cylinder(r=pnp_light_ring_inner_dia/2,h=total_height-diffuser_height*12+extra,center=true);
				translate([0,0,diffuser_height*3]) cylinder(r1=pnp_light_ring_inner_dia/2-nozzle_dia,r2=pnp_light_ring_inner_dia/2,h=diffuser_height*6+extra,center=true);
				translate([0,0,ring_height-diffuser_height*2]) cylinder(r2=pnp_light_ring_inner_dia/2-nozzle_dia,r1=pnp_light_ring_inner_dia/2,h=diffuser_height*6+extra,center=true);
			}
			hull() {
				rotate([0,0,pnp_light_cutout_angle/2]) translate([-pnp_light_ring_outer_dia/2,extra,20/2]) cube([pnp_light_ring_outer_dia+extra*2,extra*2,20+extra],center=true);
				rotate([0,0,-pnp_light_cutout_angle/2]) translate([-pnp_light_ring_outer_dia/2,-extra,20/2]) cube([pnp_light_ring_outer_dia+extra*2,extra*2,20+extra],center=true);
			}
		}
		translate([0,0,diffuser_height]) difference() {
			translate([0,0,total_height/2]) cylinder(r=pnp_light_ring_outer_dia/2-nozzle_dia,h=total_height,center=true);
			translate([0,0,total_height/2]) cylinder(r=pnp_light_ring_inner_dia/2+nozzle_dia,h=total_height+extra,center=true);
			hull() {
				rotate([0,0,pnp_light_cutout_angle/2]) translate([-pnp_light_ring_outer_dia/2,extra-nozzle_dia*1.44,20/2]) cube([pnp_light_ring_outer_dia+extra*2,extra*2,20+extra],center=true);
				rotate([0,0,-pnp_light_cutout_angle/2]) translate([-pnp_light_ring_outer_dia/2,-extra+nozzle_dia*1.44,20/2]) cube([pnp_light_ring_outer_dia+extra*2,extra*2,20+extra],center=true);
			}
		}
	}
}

module pnp_part_light_ring() {
	$fn=60;
	pnp_light_segment_length=50;
	pnp_light_segment_end_inset=-4;
	pnp_light_segment_count=3;
	pnp_light_cutout_angle=85;
	pnp_light_cutout_width=34;
	pnp_light_ring_dia=((pnp_light_segment_length*pnp_light_segment_count-pnp_light_segment_end_inset*2)*(360+pnp_light_cutout_angle)/360)/3.14159265+nozzle_dia*3;
	center_height=6.5;
	outer_height=10+nozzle_dia;
	mask_top=pnp_light_ring_dia/2.85;
	mask_bottom=pnp_light_ring_dia/2.35;
	difference() {
		union() {
			difference() {
				translate([0,0,outer_height/2]) cylinder(r=pnp_light_ring_dia/2,h=outer_height,center=true);
				translate([0,0,center_height/2]) cylinder(r1=mask_bottom-nozzle_dia,r2=mask_top-nozzle_dia,h=center_height+nozzle_dia+extra,center=true);
				translate([-20,0,outer_height/2+nozzle_dia/2]) cube([25,pnp_light_cutout_width,outer_height+nozzle_dia+extra],center=true);
				translate([-27,0,outer_height/2]) rotate([0,pnp_mirror_angle-90,0]) cube([10,80,outer_height*2],center=true);
			}
			difference() {
				union() {
					translate([-14.1,0,nozzle_dia*5]) cube([11,pnp_mirror_width+23.85,nozzle_dia*10],center=true);
					translate([-12.1,0,nozzle_dia*5]) cube([11,pnp_mirror_width+24.85,nozzle_dia*10],center=true);
				}
				translate([-10,0,nozzle_dia*5]) cube([13+extra,pnp_light_cutout_width+nozzle_dia*4,nozzle_dia*11],center=true);
			}
			//translate([6,0,nozzle_dia]) cube([3,pnp_mirror_width+25,nozzle_dia*2],center=true);
		}
		difference() {
			translate([0,0,outer_height/2+nozzle_dia]) cylinder(r=pnp_light_ring_dia/2-nozzle_dia,h=outer_height,center=true);
			translate([-20,0,center_height/2+nozzle_dia/2-extra]) cube([20,pnp_light_cutout_width+nozzle_dia*2,center_height+extra*2],center=true);
			translate([-27,0,outer_height/2]) rotate([0,pnp_mirror_angle-90,0]) cube([10+nozzle_dia*2,80,outer_height*2+extra*2],center=true);
			translate([0,0,center_height/2]) cylinder(r1=mask_bottom,r2=mask_top,h=center_height+nozzle_dia,center=true);
		}
		translate([-17,0,center_height/2+nozzle_dia/2]) cube([20,pnp_light_cutout_width,center_height+nozzle_dia+extra],center=true);
		if ( 0 ) %hull() {
			rotate([0,0,pnp_light_cutout_angle/2]) translate([-pnp_light_ring_dia/2,extra,20/2]) cube([pnp_light_ring_dia+extra*2,extra*2,20+extra],center=true);
			rotate([0,0,-pnp_light_cutout_angle/2]) translate([-pnp_light_ring_dia/2,-extra,20/2]) cube([pnp_light_ring_dia+extra*2,extra*2,20+extra],center=true);
		}
		translate([-11.90,0,nozzle_dia*8/2+clearance]) cube([5+clearance*2,pnp_mirror_width+21,nozzle_dia*3+clearance*2+extra],center=true);
	}
}
module pnp_groove_outer_mount() {
	difference() {
		union() {
			intersection() {
				translate([0,0,4+2.5/2]) cube([effector_hotend_flange_dia,pnp_mount_bolt_dia,2+extra*2],center=true);
				translate([0,0,4+2.5/2]) cylinder(r=effector_hotend_flange_dia/2,h=2,center=true);
			}
			translate([0,0,4+.5/2]) cylinder(r=effector_hotend_flange_dia/2,h=1.5,center=true);
			translate([0,0,4/2]) cylinder(r2=effector_hotend_flange_dia/2+wall_thickness,r1=effector_hotend_flange_dia/2,h=4,center=true);
		}
		#translate([0,0,4+nozzle_dia]) cylinder(r=pnp_mount_bolt_dia/2+clearance/2,h=2+extra,center=true);
		translate([0,0,3/2]) cylinder(r=pnp_mount_bolt_dia+clearance,h=3+extra,center=true);
		translate([0,0,4+2]) cube([pnp_mount_bolt_dia+clearance,pnp_mount_bolt_dia+clearance,2+extra],center=true);
	}
}
module pnp_groove_normal_mount() {
	difference() {
		union() {
			translate([0,0,5+4/2]) cylinder(r=6,h=4,center=true);
			translate([0,0,5/2]) cylinder(r=effector_hotend_flange_dia/2,h=5,center=true);
		}
		translate([0,0,6/2+3+nozzle_dia]) cylinder(r=pnp_mount_bolt_dia/2,h=6+extra,center=true);
		translate([0,0,3/2]) cylinder(r=pnp_mount_bolt_dia+clearance,h=3+extra,center=true);
	}
}
module pnp_head(display=0) {
	difference() {
		union() {
			// groove mount
			translate([pnp_groove_offset,0,4/2]) cylinder(r1=pnp_mount_bolt_dia+wall_thickness*4,r2=pnp_mount_bolt_dia+wall_thickness,h=4+extra,$fn=6,center=true);
			difference() {
				translate([pnp_groove_offset,0,-1/2]) cylinder(r=effector_hotend_flange_dia/2,h=1+extra,center=true);
				translate([pnp_groove_offset,0,-1/2]) cube([effector_hotend_flange_dia,pnp_mount_bolt_dia+clearance*2,1+extra*2],center=true);
			}
			//translate([pnp_groove_offset,0,0]) for (i=[0,120,240]) rotate([0,0,i+60]) translate([pnp_mount_offset_dia,0,wall_thickness/2]) cylinder(r1=effector_level_bolt_dia+wall_thickness,r2=effector_level_bolt_dia/2+wall_thickness,h=wall_thickness,center=true);
			//translate([effector_hotend_flange_dia/2-wall_thickness/2+pnp_groove_offset/2,0,-7]) cube([wall_thickness-pnp_groove_offset,nozzle_dia+extra,16],center=true);
			// hinge mount
			hull() {
				//translate([0,0,pnp_servo_offset/2]) rotate([0,0,30]) cylinder(r=effector_hotend_flange_dia/2,h=pnp_servo_offset,center=true);
				translate([pnp_hinge_x,-pnp_hinge_y,pnp_servo_offset/2+pnp_hinge_z]) rotate([90,0,0]) cylinder(r=6/2+wall_thickness*1.3,h=pnp_hinge_width,center=true);
				translate([effector_hotend_flange_dia/4,0,pnp_servo_offset/2+pnp_hinge_z]) cube([effector_hotend_flange_dia/2,pnp_hinge_width,6+wall_thickness*2.6],center=true);
				translate([wall_thickness/2,0,pnp_servo_height]) cube([effector_hotend_flange_dia-wall_thickness,pnp_hinge_width,extra],center=true);
			}
			// body hull
			difference() {
				hull() {
					translate([-pnp_nozzle_offset+7.5,0,pnp_servo_height/2]) rotate([0,0,0]) cube([pnp_servo_width-wall_thickness*2+14.5,pnp_servo_width*1.475,pnp_servo_height],center=true);
					translate([-pnp_nozzle_offset/4+effector_hotend_flange_dia/2,0,pnp_servo_height/2+pnp_servo_height/4]) cube([pnp_nozzle_offset/2,pnp_hinge_width,pnp_servo_height/2],center=true);
				}
				hull() {
					translate([-pnp_nozzle_offset+7.5,0,pnp_servo_height/2]) rotate([0,0,0]) cube([pnp_servo_width-wall_thickness*2-nozzle_dia*6+14.5,pnp_servo_width*1.475-nozzle_dia*6,pnp_servo_height-nozzle_dia*6],center=true);
					translate([-pnp_nozzle_offset/4+effector_hotend_flange_dia/2,0,pnp_servo_height/2+pnp_servo_height/4]) cube([pnp_nozzle_offset/2-nozzle_dia*4,pnp_hinge_width-nozzle_dia*8,pnp_servo_height/2-nozzle_dia*6],center=true);
				}
				hull() {
					translate([-pnp_nozzle_offset/2-effector_hotend_flange_dia/4,0,pnp_servo_height-3]) cylinder(r=3,h=8+extra,$fn=6,center=true);
					translate([-pnp_nozzle_offset/5,0,pnp_servo_height-3]) cylinder(r=3,h=8+extra,$fn=6,center=true);
				}
			}
			// servo flange reinforcement
			translate([-pnp_nozzle_offset+wall_thickness*3.75,-pnp_servo_width*1.475/2+wall_thickness*4/2,pnp_servo_height/2+wall_thickness*.8]) rotate([0,0,0]) cube([pnp_servo_width-wall_thickness*2.5+14.5,wall_thickness*4,pnp_servo_height-wall_thickness*2.2],center=true);
			translate([-pnp_nozzle_offset+6,pnp_servo_width*1.475/2-wall_thickness*1.5/2,pnp_servo_height/2+wall_thickness*.8]) rotate([0,0,0]) cube([pnp_servo_width-wall_thickness*2+11.5,wall_thickness*1.5,pnp_servo_height-wall_thickness*2.2],center=true);
			translate([-effector_hotend_flange_dia/2-wall_thickness-nozzle_dia*2,pnp_servo_width*1.475/2-wall_thickness*.80,pnp_servo_height/2]) rotate([0,0,0]) cube([nozzle_dia*3,nozzle_dia,pnp_servo_height],center=true);
			for (i=[0,1.2,2.4,3.6,4.8,5.9]) translate([-effector_hotend_flange_dia/2-nozzle_dia,-pnp_servo_width*1.475/2+wall_thickness+i,pnp_servo_height/2]) rotate([0,0,0]) cube([nozzle_dia*4,nozzle_dia,pnp_servo_height-nozzle_dia*2],center=true);
			translate([-pnp_nozzle_offset-6.4,pnp_servo_width*1.475/2-wall_thickness*.75,pnp_servo_height/2]) rotate([0,0,0]) cube([nozzle_dia,nozzle_dia*4,pnp_servo_height],center=true);
			translate([-pnp_nozzle_offset-4.45,-pnp_servo_width*1.475/2+wall_thickness*2.9,pnp_servo_height/2]) rotate([0,0,0]) cube([wall_thickness/4,wall_thickness,pnp_servo_height],center=true);
			// ring light support
			difference() {
				translate([0,0,pnp_servo_height-wall_thickness/2]) { 
					for (i=[0,180]) rotate([0,0,i]) translate([0,55/2,0]) hull() {
						rotate([0,90,0]) cylinder(r=wall_thickness/2,h=effector_hotend_flange_dia,center=true);
						rotate([-35,0,0]) translate([0,0,wall_thickness*1.5]) rotate([0,90,0]) cylinder(r=wall_thickness/2,h=effector_hotend_flange_dia,center=true);
					}
					cube([effector_hotend_flange_dia,55,wall_thickness],center=true);
				}
				translate([-pnp_nozzle_offset/2+effector_hotend_flange_dia/2,0,pnp_servo_height/2]) cube([pnp_nozzle_offset-nozzle_dia*4,pnp_hinge_width-nozzle_dia*8,pnp_servo_height-nozzle_dia*6],center=true);
			}
			// nozzle mount
			union() { 
				translate([-pnp_nozzle_offset,0,pnp_servo_height/2+pnp_servo_offset/2]) intersection() { 
					rotate([0,0,30]) cylinder(r2=6/2+wall_thickness*1.5,r1=6+wall_thickness*2.3,h=pnp_servo_offset-pnp_servo_height,center=true);
					//translate([-3.5,0,0]) cube([12+wall_thickness*3,12+wall_thickness*3,40],center=true);
				}
				// limit switch mount
				hull() {
					translate([-pnp_nozzle_offset+6/2+wall_thickness*2,1,pnp_servo_height/4+wall_thickness]) cylinder(r=nozzle_dia*2,h=pnp_servo_height/2,center=true);
					translate([-pnp_nozzle_offset-4,0.65,pnp_servo_height/4+wall_thickness/2])  cube([13,3.3,pnp_servo_height/2+wall_thickness],center=true);
				}
				hull() {
					translate([-pnp_nozzle_offset+6/2+wall_thickness*2,1,2.5/2+wall_thickness/2]) cylinder(r=nozzle_dia*2,h=wall_thickness+2.5,center=true);
					translate([-pnp_nozzle_offset,1,2.5/2+wall_thickness/2])  cylinder(r=6/2+wall_thickness,h=wall_thickness+2.5,center=true);
				}
				translate([-pnp_nozzle_offset-5,-2,2.5/2+wall_thickness/2]) cube([10,wall_thickness*2,wall_thickness+2.5],center=true);
			}
			// center support rib
			union() {
				hull() {
					translate([effector_hotend_flange_dia/2-wall_thickness/2,5,pnp_servo_height/2+pnp_servo_height/4]) cylinder(r=nozzle_dia,h=pnp_servo_height/2,center=true);
					translate([-effector_hotend_flange_dia/2-wall_thickness/2,5,pnp_servo_height/2]) cylinder(r=nozzle_dia,h=pnp_servo_height,center=true);
				}
				hull() {
					translate([-effector_hotend_flange_dia/2-wall_thickness/2,5,pnp_servo_height/2]) cylinder(r=nozzle_dia,h=pnp_servo_height,center=true);
					translate([-pnp_nozzle_offset/2.3-effector_hotend_flange_dia/2,5,pnp_servo_height/2]) cylinder(r=nozzle_dia,h=pnp_servo_height,center=true);
				}
				hull() {
					translate([-pnp_nozzle_offset/2.3-effector_hotend_flange_dia/2,5,pnp_servo_height/2]) cylinder(r=nozzle_dia,h=pnp_servo_height,center=true);
					translate([-pnp_nozzle_offset+6/2+wall_thickness*2,1,pnp_servo_height/2]) cylinder(r=nozzle_dia*2,h=pnp_servo_height,center=true);
				}
			}
			// top ribs for bridging
			translate([-pnp_nozzle_offset-pnp_servo_width/2-wall_thickness*2+7.4,0,pnp_servo_height/2]) for (i=[-15,10,-7-nozzle_dia,-.8,5,10,15]) {
				translate([0,i,0]) cube([wall_thickness,nozzle_dia,pnp_servo_height-extra],center=true);
			}
		}
		// groove mount
		translate([pnp_groove_offset,0,6/2]) cylinder(r=pnp_mount_bolt_dia/2,h=6+extra*2,center=true);
		translate([pnp_groove_offset,0,4/2+nozzle_dia*4]) cylinder(r=pnp_mount_bolt_dia/1.06,h=4+extra,$fn=6,center=true);
		// wire holes cutout
		translate([pnp_groove_offset,0,0]) for (i=[0]) rotate([0,0,i]) hull() for (j=[22.5,-22.5]) {
			rotate([0,0,j]) translate([effector_ring_dia/2.3-effector_wire_hole_dia/2,0,nozzle_dia*1.5]) cylinder(r=effector_wire_hole_dia/2.2,h=nozzle_dia*23+extra*2,center=true);
		}
		translate([pnp_hinge_x,-pnp_hinge_y,pnp_servo_offset/2+pnp_hinge_z]) for (i=[-1,1]) translate([4,i*pnp_mirror_width/1.5,-pnp_hinge_z/2]) {
			cylinder(r=effector_level_bolt_dia/1.75,h=15,center=true);
		}
		//translate([0,0,3.5*3+nozzle_dia*2]) rotate([0,0,0]) cube([9,55,4],center=true);
		//translate([0,5,3.5/2+nozzle_dia*3]) rotate([0,0,0]) cube([effector_hotend_flange_dia/2+wall_thickness*4,1,3.5],center=true);
		// rotation servo cutout
		translate([-pnp_nozzle_offset,6.85,pnp_servo_height/2+wall_thickness/2]) rotate([90,180,0]) {
			9g_servo();
			// castle gear cutout
			translate([0,0,2.5]) cylinder(r=15.5/2+clearance,h=4+clearance*2,center=true);
		}
		// servo cutout bridge helper
		for (i=[1,2,3,4,5]) translate([-pnp_nozzle_offset-8-nozzle_dia,-pnp_servo_width*1.475/2+i-.2,pnp_servo_height/2+.97]) rotate([0,0,0]) cube([nozzle_dia*4,nozzle_dia,12.85],center=true);
		// mirror servo cutout
		translate([-pnp_nozzle_offset+6.5*2,-1.9,pnp_servo_height/2+wall_thickness/2]) {
			rotate([-90,0,0]) 9g_servo();
			// swing arm visualization
			//%for (i=-[-22,0,48]) rotate([0,i,0]) translate([8,2,0]) cube([16,1,4],center=true);
		}
		// mirror bearing cutout
		translate([pnp_hinge_x,-pnp_hinge_y,pnp_servo_offset/2+pnp_hinge_z]) {
			rotate([90,0,0]) {
				for (i=[pnp_hinge_width/2,-pnp_hinge_width/2]) translate([0,0,i]) cylinder(r=1.95/2,h=pnp_hinge_width,center=true);
			}
			difference() {
				translate([0,0,2]) cube([effector_hotend_flange_dia+2,pnp_hinge_width-5-wall_thickness,6+wall_thickness*4.5-extra],center=true);
				translate([2,0,-4]) cube([effector_hotend_flange_dia-3,10,wall_thickness*5.5-extra],center=true);
				translate([effector_hotend_flange_dia/2-wall_thickness/2,0,-5.5]) cube([wall_thickness*1.5,pnp_hinge_width-5-wall_thickness,wall_thickness*4.5-extra],center=true);
				rotate([90,0,0]) {
					for (i=[-1,1]) translate([0,0,(pnp_hinge_width/2-5/2-wall_thickness/2)*i]) cylinder(r=4/2,h=.75,center=true);
				}
			}
			//translate([2,0,-5]) cube([effector_hotend_flange_dia-3,pnp_hinge_width-5-wall_thickness,wall_thickness*4.5-extra],center=true);
		}
		// camera cutout
		#translate([0,0,pnp_servo_height+2]) cube([pnp_camera_dia-nozzle_dia*4,pnp_camera_dia-nozzle_dia*4,10],center=true);
		//translate([15/2,0,pnp_servo_height-wall_thickness*.25]) rotate([0,90,0]) cylinder(r=effector_level_bolt_dia/2,h=15,center=true);
		translate([effector_hotend_flange_dia/2+2+extra,0,pnp_servo_offset/2+6]) rotate([0,90,180]) #pi_mini_camera();
		// probe switch cutout
		translate([-pnp_nozzle_offset-2.6,-6/2-2/2-clearance,5+wall_thickness+2.5]) {
			cube([13,6,10],center=true);
			translate([-3,0,-0.25]) rotate([90,0,0]) cylinder(r=1.8/2,h=15,center=true);
		}
		// nozzle bottom and shaft cutout
		translate([-pnp_nozzle_offset,0,pnp_servo_offset/2]) union() {
			translate([0,-1.75,-4]) cylinder(r=6/2,$fn=6,h=8,center=true);
			cylinder(r=3/2+clearance,h=50,center=true);
			translate([0,0,pnp_servo_height/2-wall_thickness/1.5-2.5/2-extra]) rotate([0,0,30]) cylinder(r2=9/2,r1=12/2,h=pnp_servo_offset-pnp_servo_height-2.3,center=true);
			translate([0,0,-pnp_servo_offset/2+2.5/2]) scale([1.04,1,1]) cylinder(r=6/2,h=2.5+clearance,center=true);
			translate([0,0,pnp_servo_offset/2-2.5/2]) scale([1.04,1,1]) cylinder(r=6/2,h=2.5+clearance/2,center=true);
		}
		// logo
		translate([-44.6,0,12]) rotate([-90,0,90]) scale([.35,.35,1]) emboss_logo(url=0);
	}
}
module servo(){
	difference(){			
		union(){
			color("blue") cube([23,12.5,22], center=true);
			color("blue") translate([0,0,5]) cube([32,12,2], center=true);
			color("blue") translate([5.5,0,2.75]) cylinder(r=6, h=25.75, $fn=20, center=true);
			color("blue") translate([-.5,0,2.75]) cylinder(r=1, h=25.75, $fn=20, center=true);
			color("blue") translate([-1,0,2.75]) cube([5,5.6,24.5], center=true);		
			color("white") translate([5.5,0,3.65]) cylinder(r=2.35, h=29.25, $fn=20, center=true);				
		}
		translate([10,0,-11]) rotate([0,-30,0]) cube([8,13,4], center=true);
		for ( hole = [14,-14] ){
			translate([hole,0,5]) cylinder(r=2.2, h=4, $fn=20, center=true);
		}	
	}
}
	
module 9g_servo(display=0){
	translate([-5.5,0,-29.25/2-3.65]) difference() {
		union() {
			if (display) {
				translate([0,0,2.5*2+2.5/2-3/2]) cube([32,12.5,2.5], center=true);
			} else {
				translate([0,0,2.5+2.5/2-3/2]) cube([32+clearance*4,12.5+clearance*2,7.5+clearance], center=true);
			}
			union() {	
				cube([23+clearance*2,12.5+clearance*2,23+clearance*2], center=true);
				translate([-1,0,2.75+clearance]) cube([5+clearance,5.6+clearance,25.75], center=true);
				translate([5.5,0,2.75+clearance]) cylinder(r=6+clearance, h=25.75, $fn=20, center=true);
			}		
			translate([-.5,0,1.75]) cylinder(r=1, h=25.75, $fn=20, center=true);
			translate([5.5,0,3.65]) cylinder(r=2.35, h=29.25, $fn=20, center=true);				
			if (! display) for ( hole = [14,-14] ){
				translate([hole,0,4]) cylinder(r=1.75/2, h=12, $fn=20, center=true);
			}
		}	
		if (display) for ( hole = [14,-14] ){
			translate([hole,0,4]) cylinder(r=2.1/2, h=12, $fn=20, center=true);
		}
	}
}
module 9g_servo_mount() {
	difference() {
		translate([-5.5,0,-29.25/2-3.65-15.5/2-wall_thickness/2]) translate([0,0,2.5+2.5/2]) intersection() {
			cube([32.5-extra,12.5+clearance-extra,15.5+wall_thickness], center=true);
			rotate([38,0,0]) translate([0,5,0]) cube([32.5-extra,12.5+clearance-extra,19.5+wall_thickness], center=true);
		}
		#9g_servo();
	}
}

module push_rod_clamp_assembly() {
	push_rod_clamp();
	translate([0,-15,0]) push_rod_knob();
}

module limit_switch_cutout() {
	union() {
		hull() {
			translate([0,0,16.5/2+clearance]) cube([25+clearance*2,6.5+clearance*2,12.5+clearance*2],center=true);
			translate([2,0,2.5/2+clearance]) cube([27+clearance*2,5.5+clearance*2,3.5+clearance*2],center=true);
			translate([10,0,18]) rotate([90,0,0]) cylinder(r=5/2,h=5.5+clearance*2,center=true);
		}
		translate([9.5/2,0,13.5/2]) rotate([90,0,0]) cylinder(r=1+clearance,h=20,center=true);
		translate([-9.5/2,0,13.5/2]) rotate([90,0,0]) cylinder(r=1+clearance,h=20,center=true);
	}
}
module limit_switch() {
	difference() {
		union() {
			translate([0,0,15.5/2+clearance]) cube([20+clearance*2,6.5+clearance*2,9.5+clearance*2],center=true);
			translate([8.2,0,1.5]) cube([1,3,3],center=true);
			translate([1,0,1.5]) cube([1,3,3],center=true);
			translate([-8,0,1.5]) cube([1,3,3],center=true);
			translate([2,0,28/2+clearance]) rotate([0,-10,0]) {
				cube([17.5,4,.5],center=true);
				translate([17.5/2-1,0,5/2]) rotate([90,0,0]) cylinder(r=5/2,h=3.1,center=true);
			}
			
		}
	}
}

module spool_rod_template() {
	difference() {
		translate([0,spool_bearing_thickness+wall_thickness,coupler_shaft_dia/6+wall_thickness/2]) cube([coupler_shaft_dia+wall_thickness,effector_spacing*2+spool_bearing_thickness+wall_thickness*2+coupler_length/2+wall_thickness*2,coupler_shaft_dia/3+wall_thickness],center=true);
		translate([0,spool_bearing_thickness,coupler_shaft_dia/2+wall_thickness]) rotate([90,0,0]) cylinder(r=coupler_shaft_dia/2+clearance,h=effector_spacing*2+spool_bearing_thickness+wall_thickness*2+coupler_length/2+extra,center=true);		
		translate([0,-effector_spacing/2,0]) cylinder(r=cable_hole_dia/2,h=coupler_shaft_dia,center=true);		
		translate([0,effector_spacing/2,0]) cylinder(r=cable_hole_dia/2,h=coupler_shaft_dia,center=true);		
		translate([0,0,0]) cylinder(r=cable_hole_dia/2,h=coupler_shaft_dia,center=true);		
		translate([0,-effector_spacing,coupler_shaft_dia/3+wall_thickness]) rotate([45,0,0]) cube([coupler_shaft_dia+wall_thickness+extra,wall_thickness,wall_thickness],center=true);		
		translate([0,effector_spacing,coupler_shaft_dia/3+wall_thickness]) rotate([45,0,0]) cube([coupler_shaft_dia+wall_thickness+extra,wall_thickness,wall_thickness],center=true);		
	}
}

module end_effector_body(render_pulley=0) {
	union() {
		difference() {
			union() {
				// blower_mount
				translate([-effector_ring_dia/2-wall_thickness*.75-effector_hinge_thickness/2-effector_blower_mount_dia/2,0,effector_blower_mount_dia/2+wall_thickness*1.25]) hull() {
					rotate([90,0,0]) cylinder(h=effector_blower_width+wall_thickness*3+clearance,r=effector_blower_bolt_dia/2+wall_thickness*1.5+clearance,center=true);
					translate([-wall_thickness/4,0,-effector_blower_mount_dia/4-wall_thickness*1.25/2]) cube([effector_blower_mount_dia+wall_thickness/2,effector_blower_width+wall_thickness*3+clearance,effector_blower_mount_dia/2+wall_thickness*1.25],center=true);
					translate([effector_blower_mount_dia/2,0,wall_thickness/4]) cube([effector_blower_mount_dia,effector_blower_width+wall_thickness*3+clearance,effector_blower_mount_dia+wall_thickness/2],center=true);
				}
				// corners/virtual pulleys
				difference() {
					union() {
						// base
						translate([0,0,wall_thickness/2*1.25]) hull() for (i=[-120,0,120]) for (j=[-60,60]) {
							rotate([0,0,i]) translate([effector_spacing/sqrt(3),0,0]) rotate([0,0,j]) translate([effector_offset,0,0]) cylinder(r=pulley_inner_dia/2,h=wall_thickness*1.25,center=true);
						}
						// corners
						for (i=[-120,0,120]) hull() for (j=[-60,60]) {
							rotate([0,0,i]) translate([effector_spacing/sqrt(3),0,pulley_inner_dia/4+wall_thickness/4-extra]) rotate([0,0,j]) translate([effector_offset,0,0]) scale([1,pulley_skew,1]) cylinder(r=pulley_inner_dia/2+wall_thickness/2,h=pulley_inner_dia/2+wall_thickness/2-extra*2,center=true);
						}
					}
					// virtual pulleys
					for (i=[-120,0,120]) for (j=[-60,60]) {
						if (render_pulley == 1) rotate([0,0,i]) translate([effector_spacing/sqrt(3),0,wall_thickness/2]) rotate([0,0,j]) translate([effector_offset,0,0]) inverted_pulley();
					}
				}
				// ribs
				for (i=[-120,0,120]) for(j=[-pulley_inner_dia/2.5-effector_offset,pulley_inner_dia/2.5+effector_offset]) hull() {
					rotate([0,0,i]) translate([effector_ring_dia/2,j,effector_ring_height/2-wall_thickness/4]) cylinder(r=wall_thickness/1.4,h=effector_ring_height-wall_thickness/2,center=true);
					rotate([0,0,i]) translate([effector_spacing/sqrt(3)-wall_thickness,j,pulley_inner_dia/4]) cylinder(r=wall_thickness/1.4,h=pulley_inner_dia/2,center=true);
				}
				// ring
				translate([0,0,effector_ring_height/2]) cylinder(r=effector_ring_dia/2+wall_thickness*1.5,h=effector_ring_height,center=true);
			}
			// blower mount
			translate([-effector_ring_dia/2-wall_thickness*.75-effector_hinge_thickness/2-effector_blower_mount_dia/2,0,effector_blower_mount_dia/2+wall_thickness*1.25]) {
				rotate([90,0,0]) cylinder(h=effector_blower_width+wall_thickness*3+clearance*2+extra,r=effector_blower_bolt_dia/2,center=true);
				hull() {
					rotate([90,0,0]) cylinder(h=effector_blower_width+clearance,r=effector_blower_mount_dia/2+extra,center=true);
					translate([-effector_blower_mount_dia/2-extra,0,]) cube([effector_blower_mount_dia+extra,effector_blower_width+clearance,effector_blower_mount_dia],center=true);
					translate([-wall_thickness,0,effector_blower_mount_dia/2]) cube([effector_blower_mount_dia+wall_thickness*2,effector_blower_width+clearance,effector_blower_mount_dia],center=true);
				}
				translate([-wall_thickness*1.5,0,0]) cube([effector_blower_mount_dia+wall_thickness*2,effector_blower_width/2+clearance,effector_blower_mount_dia*2],center=true);
			}
			// leveling bolts
			for (i=[-120,0,120]) rotate([0,0,i+180]) translate([effector_ring_dia/2-effector_level_bolt_dia/2-clearance,0,wall_thickness*3+first_layer_height]) cylinder(r=effector_level_bolt_dia/2,h=wall_thickness*7,center=true);
			// base center hole
			translate([0,0,effector_ring_height/2+effector_hotend_flange_height]) cylinder(r=effector_ring_dia/2,h=effector_ring_height+extra,center=true);
			// wire holes
			for (i=[0,180]) rotate([0,-10,i]) hull() for (j=[22.5,-22.5]) {
				rotate([0,0,j]) translate([effector_ring_dia/2.2-effector_wire_hole_dia/2,0,0]) cylinder(r=effector_wire_hole_dia/2.5,h=effector_ring_height,center=true);
			}
			// flange_hole
			cylinder(r=effector_hotend_flange_dia/2+clearance*2,h=effector_ring_height,center=true);
			// clearance check
			// for (i=[-30,30]) translate([0,0,effector_ring_height+effector_bearing_dia/2-effector_bearing_dia*2]) rotate([i,0,0]) end_effector_joint();
			// effector_joint cutouts
			translate([0,0,effector_ring_height+effector_bearing_dia/2]) for (i=[-28,28]) rotate([i,0,0]) cylinder(r=effector_ring_dia/2-effector_hinge_thickness/4+clearance*2,h=effector_hinge_dia,center=true);
		}
		// hinges
		difference() {
			for (i=[0,180]) hull() {
				rotate([0,0,i]) translate([effector_ring_dia/2+effector_hinge_thickness/2-wall_thickness/2,0,effector_ring_height+effector_bearing_dia/2]) scale([1,1,.70]) rotate([0,90,0]) cylinder(r=effector_hinge_dia/2/.60,h=effector_hinge_thickness+clearance,center=true);
				rotate([0,0,i]) translate([effector_ring_dia/2+effector_hinge_thickness/2-wall_thickness/2,0,wall_thickness/2]) cube([effector_hinge_thickness+clearance,effector_ring_height,wall_thickness],center=true);
			}
			translate([-effector_ring_dia/2+effector_level_bolt_dia/2-clearance,0,wall_thickness*2+first_layer_height]) cylinder(r=effector_level_bolt_dia/2,h=wall_thickness*4+extra,center=true);
			translate([0,0,effector_ring_height+effector_bearing_dia/2]) rotate([0,90,0]) cylinder(r=effector_bearing_dia/2,h=effector_ring_dia*2,center=true);
		}
	}
	
}

module end_effector_blower_nozzle() {
	difference() {
		union() {
			intersection() {
				difference() {
					union() {
						minkowski() { // expand blower arc nozzle_dia*3 in XY
							end_effector_blower_nozzle_arc(effector_blower_arc_dia);
							cube([nozzle_dia*6,nozzle_dia*6,.000001],center=true);
						}
						translate([effector_blower_arc_dia/2+effector_blower_height-nozzle_dia*1.4,0,-effector_blower_height/4.5]) rotate([0,25,0]) translate([-effector_blower_arc_dia/2-effector_blower_height/2+wall_thickness,0,0]) difference() {
							translate([0,0,-effector_blower_height/4]) cube([nozzle_dia*8,effector_blower_width+nozzle_dia*4,effector_blower_height*2],center=true);
							cube([nozzle_dia*2.5,effector_blower_width-nozzle_dia*2,effector_blower_height*2+nozzle_dia*4],center=true);
						}
					}
					end_effector_blower_nozzle_arc(effector_blower_arc_dia); // subtract arc
					translate([effector_blower_height/6,0,effector_blower_height/1.75]) rotate([90,0,0]) cylinder(r=effector_bearing_dia/2,h=effector_blower_width*2,center=true); // TPU hole
				}
				translate([0,0,effector_blower_height]) cube([effector_blower_arc_dia*2,effector_blower_width*2,effector_blower_height*2],center=true); // constrain height
				translate([-effector_blower_height/2-nozzle_dia*4,0,0]) rotate([0,45,0]) translate([0,0,effector_blower_nozzle_height/2]) cube([effector_blower_arc_dia*2,effector_blower_width*2,effector_blower_nozzle_height],center=true); // constrain height
			}
		}
		translate([0,0,wall_thickness/2]) cube([effector_blower_height+clearance,effector_blower_width+clearance,wall_thickness+extra*8],center=true); // blower output cutout
	}
}

module end_effector_blower_nozzle_arc() {
	difference() {
		translate([effector_blower_arc_dia/2-effector_blower_height-nozzle_dia/2,0,-effector_blower_height/1.5]) rotate([90,0,0]) cylinder(r=effector_blower_arc_dia/2+nozzle_dia*3.5-effector_blower_height/2,h=effector_blower_width-nozzle_dia*2,center=true);
		translate([effector_blower_arc_dia/2+effector_blower_height-nozzle_dia/2,0,-effector_blower_height/8]) rotate([90,0,0]) cylinder(r=effector_blower_arc_dia/2+effector_blower_height/2-nozzle_dia/2,h=effector_blower_width-nozzle_dia*2+extra,center=true);
	}
}
	
module inverted_pulley() {
	scale([1,pulley_skew,1]) union() {
		difference() {
			translate([0,0,pulley_inner_dia/2]) cylinder(r=pulley_inner_dia/2+cable_hole_dia,h=pulley_inner_dia,center=true);
			intersection() {
				rotate_extrude(convexity = 10) translate([pulley_inner_dia/2+cable_hole_dia/2,0,0]) circle(r=pulley_inner_dia/2);
				translate([0,0,pulley_inner_dia/2]) cylinder(r=pulley_inner_dia/2+cable_hole_dia,h=pulley_inner_dia+extra,center=true);
			}
		}
		cylinder(r=cable_hole_dia/2,h=wall_thickness-first_layer_height*2,center=true);
	}
}

module end_effector_joint() {
	difference() {
		union() {
			difference() {
				translate([0,0,effector_hinge_dia/2]) intersection() {
					sphere(r=effector_ring_dia/2-effector_hinge_thickness/3-clearance,center=true);
					cylinder(r=effector_ring_dia/2-effector_hinge_thickness/3-clearance,h=effector_hinge_dia,center=true);
				}
				translate([0,0,effector_ring_height/2]) cylinder(r=effector_ring_dia/2-effector_hinge_thickness*1.3,h=effector_ring_height+extra,center=true);
			}
			translate([0,0,effector_hinge_dia/2]) intersection() {
				cylinder(r=effector_ring_dia/2,h=effector_hinge_dia,center=true);
				union() {
					for (i=[0,180]) rotate([0,0,i]) translate([effector_ring_dia/2-effector_hinge_thickness/4-wall_thickness/2-clearance,0,0]) rotate([0,90,0]) cylinder(r1=effector_hinge_dia/1.5,r2=effector_hinge_dia/2,h=effector_hinge_thickness/2-clearance,center=true);
					for (i=[90,270]) rotate([0,0,i]) translate([effector_ring_dia/2-effector_hinge_thickness*1.3-wall_thickness/2+clearance,0,0]) rotate([0,90,0]) cylinder(r2=effector_hinge_dia/1.5,r1=effector_hinge_dia/2,h=effector_hinge_thickness/2-clearance,center=true);
				}
			}
		}
		for (i=[0,90]) rotate([0,0,i]) translate([0,0,effector_hinge_dia/2]) rotate([0,90,0]) cylinder(r=effector_bearing_dia/2,h=effector_ring_dia*2,center=true);
	}
}

module push_rod_joint() {
	jwidth=effector_ring_dia-effector_hinge_thickness*3.1-wall_thickness/2-clearance*3;
	difference() {
		union() {
			hull() {
				translate([effector_ring_height/4,0,push_rod_depth*3]) rotate([90,0,0]) cylinder(r=effector_hinge_dia/1.75,h=jwidth,center=true);
				translate([effector_ring_height/4,0,push_rod_depth*2]) rotate([90,0,0]) cylinder(r=effector_hinge_dia/1.5,h=jwidth,center=true);
			}
			hull() {
				translate([effector_ring_height/4,0,push_rod_depth*2]) rotate([90,0,0]) cylinder(r=effector_hinge_dia/1.5,h=jwidth,center=true);
				translate([0,0,push_rod_depth/1.5-extra]) cylinder(r=push_rod_dia/2+wall_thickness*1.2,h=extra,center=true);
			}
			translate([0,0,push_rod_depth/3]) cylinder(r=push_rod_dia/2+wall_thickness*1.2,h=push_rod_depth/1.5,center=true);
			hull() {
				translate([-effector_ring_height/1.5-wall_thickness*1.5,0,wall_thickness]) cylinder(r=effector_ring_height/2.5,h=wall_thickness*2,center=true);
				translate([effector_ring_height/2+wall_thickness*1.5,0,wall_thickness]) cylinder(r=effector_hinge_dia/1.8,h=wall_thickness*2,center=true);
			}
		}
		hull() {
			translate([0,0,push_rod_depth*3]) cube([push_rod_dia*5,jwidth-effector_hinge_thickness*1.85,push_rod_dia*5],center=true);
			translate([0,0,push_rod_depth+wall_thickness]) rotate([0,90,0]) scale([1.25,.75,1]) cylinder(r=push_rod_dia/2,h=push_rod_dia*2,center=true);
			//translate([0,0,push_rod_depth*1+wall_thickness*1.5]) rotate([90,0,0]) cube([push_rod_dia+wall_thickness*3,push_rod_dia-wall_thickness,clearance],center=true);
		}
		translate([0,0,push_rod_depth/2]) cylinder(r=push_rod_dia/2+clearance,h=push_rod_depth+extra,center=true);
		translate([effector_ring_height/4,0,push_rod_depth*3]) rotate([90,0,0]) {
			cylinder(r=effector_bearing_dia/2,h=effector_ring_dia-wall_thickness/1.5-wall_thickness*2-wall_thickness/1.2-clearance*2+extra,center=true);
			translate([0,0,effector_ring_dia/2-wall_thickness/3-wall_thickness*4-wall_thickness/2.4-clearance*4]) cylinder(r2=effector_bearing_dia/2,r1=effector_bearing_dia,h=effector_bearing_dia,center=true);
			translate([0,0,-effector_ring_dia/2+wall_thickness/3+wall_thickness*4+wall_thickness/2.4+clearance*4]) cylinder(r1=effector_bearing_dia/2,r2=effector_bearing_dia,h=effector_bearing_dia,center=true);
		}
			
		translate([push_rod_dia/2+wall_thickness/1.25,0,push_rod_depth*1.25]) rotate([0,-12.5,0]) cylinder(r=push_rod_dia/2-wall_thickness/2,h=push_rod_depth*2,center=true);	
		translate([-push_rod_dia/2-wall_thickness/1.25,0,push_rod_depth*1.25]) rotate([0,12.5,0]) cylinder(r=push_rod_dia/2-wall_thickness/2,h=push_rod_depth*2,center=true);	
		translate([-effector_ring_height/1.5-wall_thickness*1.5,0,wall_thickness]) cylinder(r=effector_ring_height/2.5-wall_thickness/2,h=wall_thickness*2+extra,center=true);
		translate([effector_ring_height/2+wall_thickness*1.5,0,wall_thickness]) cylinder(r=effector_hinge_dia/2-wall_thickness/2,h=wall_thickness*2+extra,center=true);
	}
}

module push_rod_top() {
	//cylinder(r=push_rod_dia/2,h=50,center=true);
	difference() {
		union() {
			translate([0,0,push_rod_slide/2]) cylinder(r=push_rod_dia/2+wall_thickness*1.5,h=push_rod_slide,center=true);
			translate([0,0,wall_thickness-wall_thickness/5]) hull() {
				rotate_extrude() {
					translate([push_rod_dia/2+wall_thickness*2.5,0]) circle(r=wall_thickness*1.5,center=true);
				}
			}
		}
		translate([0,0,push_rod_slide/2]) rotate([0,0,30]) cylinder(r=(push_rod_dia/2+2*clearance)*1.11,$fn=6,h=push_rod_slide+extra,center=true);
		for (i=[-120,0,120]) rotate([0,0,i]) translate([push_rod_dia/2+wall_thickness*2,0,wall_thickness*1.5]) cylinder(r=cable_hole_dia/2,h=wall_thickness*3+extra,center=true);
		translate([0,0,-25]) cylinder(r=50,h=50,center=true);
	}
}

module push_rod_clamp() {
	difference() {
		hull() {
			translate([0,0,push_rod_slide/4]) cylinder(r=push_rod_dia/2+wall_thickness*1.25,h=push_rod_slide/2,center=true);
			//translate([push_rod_dia/2+push_rod_stop_bolt_dia/2+wall_thickness*1.25,0,push_rod_slide/4]) cylinder([wall_thickness*4,push_rod_dia+wall_thickness*2.5,push_rod_slide/2],center=true);
			translate([push_rod_dia/2+push_rod_stop_bolt_dia/2+wall_thickness/2,0,push_rod_slide/4]) rotate([90,0,0]) rotate([0,0,30]) cylinder(r=push_rod_slide/4,h=push_rod_dia+wall_thickness*2.5,center=true);
		}
		translate([push_rod_dia/2+push_rod_stop_bolt_dia/2+wall_thickness*1.25,0,push_rod_slide/4]) cube([wall_thickness*5+extra,wall_thickness/2,push_rod_slide/2+extra],center=true);
		translate([0,0,push_rod_slide/4]) cylinder(r=push_rod_dia/2+clearance/2,h=push_rod_slide/2+extra,center=true);
		translate([push_rod_dia/2+push_rod_stop_bolt_dia/2+wall_thickness/2,0,push_rod_slide/4]) {
			rotate([0,90,90]) cylinder(r=push_rod_stop_bolt_dia/2,h=push_rod_dia+wall_thickness*4,center=true);
			rotate([90,90,0]) translate([0,0,wall_thickness*3]) cylinder(r=push_rod_stop_bolt_dia+clearance,$fn=6,h=wall_thickness*1.5,center=true);
		}
	}
}

module push_rod_knob() {
	difference() {
		union() {
			hull() {
				translate([-push_rod_dia,0,push_rod_slide/8]) cylinder(r=wall_thickness*1.25,h=push_rod_slide/4,center=true);
				translate([push_rod_dia,0,push_rod_slide/8]) cylinder(r=wall_thickness*1.25,h=push_rod_slide/4,center=true);
			}
			translate([0,0,push_rod_slide/8]) cylinder(r=push_rod_stop_bolt_dia+clearance+wall_thickness,h=push_rod_slide/4,center=true);
		
		}
		translate([0,0,push_rod_slide/4]) cylinder(r=push_rod_stop_bolt_dia/2+clearance/2,h=push_rod_slide/2+extra,center=true);
		translate([0,0,push_rod_slide/4]) cylinder(r=push_rod_stop_bolt_dia+clearance,$fn=6,h=push_rod_slide/5,center=true);
	}
}

module dampener() {
	difference() {
		union() {
			translate([0,0,wall_thickness]) hull() {
				rotate_extrude() {
					translate([stepper_damper_dia/2,0,0]) circle(r=wall_thickness,center=true);
				}
			}
			translate([0,0,wall_thickness*6-wall_thickness]) hull() {
				rotate_extrude() {
					translate([stepper_damper_dia/2,0,0]) circle(r=wall_thickness,center=true);
				}
			}
			translate([0,0,wall_thickness*3]) cylinder(r=stepper_damper_dia/2,h=wall_thickness*6,center=true);
		}
		translate([0,0,wall_thickness*3]) cylinder(r=stepper_bolt_dia/2+clearance/2,h=wall_thickness*6+extra,center=true);
	}
}

module extruder_mount() {
	difference() {
		union() {
			hull() {
				for (i=[-1,1]) {
					translate([i*(stepper_size+stepper_oversize/2+wall_thickness)/2,wall_thickness/2,(stepper_size+stepper_oversize/2)/2]) cylinder(r=wall_thickness/2,h=stepper_size+stepper_oversize/2,center=true);
				}
				translate([0,-stepper_size/2+wall_thickness*2,(stepper_size+stepper_oversize/2)/2]) rotate([0,90,0]) cylinder(r=wall_thickness*2+effector_bearing_dia,h=stepper_size+stepper_oversize/2+wall_thickness*2,center=true);
			}
			translate([0,-stepper_size/2+wall_thickness*2,(stepper_size+stepper_oversize/2)/2]) rotate([0,90,0]) cylinder(r=wall_thickness*2+effector_bearing_dia,h=stepper_size+stepper_oversize/2+wall_thickness*3,center=true);
			//translate([-extruder_drive_offset,0,-(stepper_size/2+stepper_oversize/2)/sqrt(3)-wall_thickness]) hull() {
			translate([-extruder_drive_offset,0,(stepper_size+stepper_oversize/2)-wall_thickness*5/2]) hull() {
				translate([0,wall_thickness+extruder_drive_depth,wall_thickness*5/2]) cylinder(r=extruder_drive_depth+wall_thickness/2,h=wall_thickness*4,center=true);
				translate([extruder_drive_offset,wall_thickness/2,0]) cube([stepper_flange_dia,wall_thickness,wall_thickness*5],center=true);
			}
			for (i=[-1,1]) {
				translate([i*(stepper_size+stepper_oversize/2+wall_thickness)/2,wall_thickness/3,stepper_size/2]) hull() {
					cylinder(r=wall_thickness/2,h=stepper_size,center=true);
					translate([0,wall_thickness*4-wall_thickness/2,-stepper_size/2+wall_thickness]) cylinder(r=wall_thickness/1.8,h=wall_thickness*2,center=true);
				}
			}
			hull() { 
				for (i=[-1,1]) {
					translate([i*(stepper_size+stepper_oversize/2+wall_thickness)/2,wall_thickness/2,wall_thickness]) cylinder(r=wall_thickness/2,h=wall_thickness*2,center=true);
					translate([i*(stepper_size/2-wall_thickness*2),wall_thickness*2+wall_thickness,wall_thickness]) cylinder(r=wall_thickness*4,h=wall_thickness*2,center=true);
				}
			}
			translate([-extruder_drive_offset,wall_thickness+extruder_drive_depth,wall_thickness*3]) cylinder(r1=wall_thickness*3,r2=wall_thickness*1.5,h=wall_thickness*6,center=true);
			
		}
		translate([0,wall_thickness+wall_thickness*1.5/2,stepper_size/4+wall_thickness*2+extra]) cube([stepper_size,wall_thickness*1.5,stepper_size/2],center=true);
		translate([stepper_bolt_spacing/2-1.5,wall_thickness+extruder_drive_depth,wall_thickness]) hull() {
			cylinder(r=extruder_bolt_dia/2+clearance*2,h=wall_thickness*2.5+extra,center=true);
			translate([3,0,0]) cylinder(r=extruder_bolt_dia/2+clearance*2,h=wall_thickness*2.5+extra,center=true);
		}
			
		translate([-extruder_drive_offset,wall_thickness+extruder_drive_depth,stepper_size+stepper_oversize/2+wall_thickness]) {
			cylinder(r=extruder_drive_depth/2,h=wall_thickness*2.5+extra,center=true);
			translate([0,0,wall_thickness]) cylinder(r1=extruder_drive_depth/2,r2=(extruder_drive_depth+wall_thickness)/2,h=wall_thickness+extra,center=true);
		}
		translate([-extruder_drive_offset,wall_thickness+extruder_drive_depth,(stepper_size+stepper_oversize/2)/2]) cylinder(r=bowden_tube_dia/2+clearance/2,h=stepper_size+stepper_oversize/2+wall_thickness*2,center=true);
		translate([0,-stepper_size/2+wall_thickness*2,(stepper_size+stepper_oversize/2)/2]) rotate([0,90,0]) cylinder(r=effector_bearing_dia/2+clearance,h=stepper_size+stepper_oversize/2+wall_thickness*3+extra,center=true);
		translate([0,-stepper_size/2-wall_thickness*2,(stepper_size+stepper_oversize/2)/2]) cube([stepper_size+stepper_oversize/2,stepper_size+stepper_oversize/2+wall_thickness*2,stepper_size+stepper_oversize/2+extra],center=true);
		translate([-extruder_drive_offset,-(stepper_size/2+stepper_oversize/2)/sqrt(3)-wall_thickness,wall_thickness+extruder_drive_depth]) rotate([90,0,0]) cylinder(r=bowden_tube_dia/2+clearance/2,h=wall_thickness*5+extra*2,center=true);
		translate([0,0,(stepper_size+stepper_oversize/2)/2+wall_thickness]) rotate([90,0,0]) cylinder(r=stepper_flange_dia/2+clearance,h=wall_thickness*2.5+extra,center=true);
		translate([0,0,(stepper_size+stepper_oversize/2)/2+wall_thickness]) for (i=[-1,1]) for (j=[-1,1]) translate([i*stepper_bolt_spacing/2,0,j*stepper_bolt_spacing/2]) rotate([90,0,0]) cylinder(r=stepper_bolt_dia/2+clearance/2,h=support_rod_depth,center=true);
		translate([0,wall_thickness/1.25,(stepper_size+stepper_oversize/2)/2+wall_thickness]) translate([stepper_bolt_spacing/2,0,-stepper_bolt_spacing/2]) rotate([90,0,0]) cylinder(r1=stepper_bolt_dia+clearance/2,r2=stepper_bolt_dia/2+clearance/2,h=wall_thickness/1.4,center=true);
	}
}

module extruder_knob() {
	intersection() {
		difference() {
			union() {
				for (i=[0,60,120,180,240,300]) rotate([0,0,i]) hull() {
					translate([-(extruder_bolt_dia+wall_thickness),0,extruder_knob_height/2]) cylinder(r=wall_thickness,h=extruder_knob_height,center=true);
					translate([0,0,extruder_knob_height/2]) cylinder(r=wall_thickness*2.75,h=extruder_knob_height,center=true);
				}
				translate([0,0,extruder_knob_height/2+wall_thickness/2]) cylinder(r=extruder_bolt_dia/1.25,h=extruder_knob_height,center=true);
				translate([0,0,extruder_knob_height/2]) cylinder(r=extruder_bolt_dia+clearance+wall_thickness/1.25,h=extruder_knob_height,center=true);
			
			}
			translate([0,0,extruder_knob_height/2+extruder_bolt_dia*.85+.11]) cylinder(r=extruder_bolt_dia/2+clearance,h=extruder_knob_height,center=true); // the .11 closes off the hole for 1 layer to make a bridge
			translate([0,0,extruder_bolt_dia*.85/2]) cylinder(r=extruder_bolt_dia+clearance,$fn=6,h=extruder_bolt_dia*.85+extra,center=true);
		}
		translate([0,0,extruder_knob_height/2]) scale([1,1,.70]) sphere(r=extruder_bolt_dia+wall_thickness*2,center=true);
	}
}

module extruder_spring_washer() {
	difference() {
		union() {
			translate([0,0,wall_thickness/2]) cylinder(r=extruder_bolt_dia/1.25,h=wall_thickness,center=true);
			translate([0,0,wall_thickness/4]) cylinder(r=extruder_bolt_dia+wall_thickness,h=wall_thickness/2,center=true);
		}
		translate([0,0,wall_thickness/2]) cylinder(r=extruder_bolt_dia/2+clearance*2.5,h=wall_thickness+extra,center=true);
	}
}

module shaft_coupler() {
	translate([0,0,coupler_length/2]) difference() {
		cylinder(r=coupler_shaft_dia/2+wall_thickness*1.5+clearance/2,h=coupler_length,center=true);
		intersection() {
			cylinder(r=coupler_d_shaft_dia/2+clearance,h=coupler_length+extra,center=true);
			translate([0,coupler_d_shaft_dia/10,-coupler_length/4+extra*3]) rotate([-0,0,0]) cube([coupler_d_shaft_dia+clearance*2,coupler_d_shaft_dia+clearance*2,coupler_length/2+extra*4],center=true);
			translate([0,0,-coupler_length/4+extra*3]) cube([coupler_d_shaft_dia+clearance*1.5,coupler_d_shaft_dia+clearance*1.5,coupler_length/2+extra*4],center=true);
		}
		translate([0,0,-coupler_length/2+wall_thickness/2-extra]) cylinder(r1=coupler_d_shaft_dia/2+wall_thickness/3,r2=coupler_d_shaft_dia/2-wall_thickness/2,h=wall_thickness,center=true);
		translate([0,0,coupler_length/2-wall_thickness/2+extra]) cylinder(r2=coupler_shaft_dia/2+wall_thickness/3,r1=coupler_shaft_dia/2-wall_thickness/2,h=wall_thickness,center=true);
		intersection() {
			translate([0,0,coupler_length/4]) cylinder(r=coupler_shaft_dia/2+clearance,h=coupler_length/2+extra,center=true);
			translate([0,0,coupler_length/4+extra]) cube([coupler_shaft_dia+clearance,coupler_shaft_dia+clearance,coupler_length/2+extra*2],center=true);
		}
	}
}
				
module stepper_mount() {
	translate([-support_rod_dia/4-(stepper_size+stepper_oversize)/2,0,0]) difference() {
		translate([0,0,-.4]) difference() { //flat bottoms print better.
			union() {
				translate([support_rod_dia/2+(stepper_size+stepper_oversize)/2+wall_thickness,0,wall_thickness/2]) {
					translate([0,support_rod_depth/2-wall_thickness,(stepper_size+stepper_oversize)/2]) cube([(stepper_size+stepper_oversize)+support_rod_dia,wall_thickness*2,(stepper_size+stepper_oversize)],center=true);
					translate([0,0,wall_thickness/2]) cube([(stepper_size+stepper_oversize)+support_rod_dia,support_rod_depth,wall_thickness*2],center=true);
					for (i=[-1,1]) translate([i*(spool_bearing_dia+wall_thickness+clearance),(stepper_size+stepper_oversize)/6+wall_thickness,(stepper_size+stepper_oversize)/2.4]) rotate([-19,0,0]) cube([wall_thickness*3,(stepper_size+stepper_oversize)/2,(stepper_size+stepper_oversize)],center=true);
				}
				translate([0,0,support_rod_dia/2+wall_thickness]) rotate([90,90,0]) cylinder(r=support_rod_dia/2+wall_thickness,h=support_rod_depth,center=true);
			}
			translate([support_rod_dia/2+(stepper_size+stepper_oversize)/2+wall_thickness,support_rod_depth/2-(spool_bearing_thickness-wall_thickness)/2,wall_thickness/2]) {
				translate([0,wall_thickness-wall_thickness/2,(stepper_size+stepper_oversize)/2+wall_thickness]) rotate([90,0,0]) {
					cylinder(r=stepper_flange_dia/2+clearance/2,h=support_rod_depth,center=true);
					for (i=[-stepper_bolt_spacing/2,stepper_bolt_spacing/2]) for (j=[-stepper_bolt_spacing/2,stepper_bolt_spacing/2]) {
						translate([i,j,0]) cylinder(r=stepper_damper_dia/2+clearance/2,h=support_rod_depth,center=true);
					}
				}
				translate([(stepper_size+stepper_oversize)/3,-3*wall_thickness,0]) cylinder(r=pulley_bolt_dia/2,h=20,center=true);
				translate([0,-wall_thickness*3-spool_bearing_thickness,0]) cylinder(r=pulley_bolt_dia/2,h=20,center=true);
				translate([-(stepper_size+stepper_oversize)/3,-3*wall_thickness,0]) cylinder(r=pulley_bolt_dia/2,h=20,center=true);
			}
			translate([0,0,support_rod_dia/2+wall_thickness]) rotate([90,90,0]) cylinder(r=support_rod_dia/2,h=effector_spacing+wall_thickness+spool_bearing_thickness+support_rod_depth*2+extra,center=true);
			translate([support_rod_dia/2+(stepper_size+stepper_oversize)/2+wall_thickness,support_rod_depth/2+wall_thickness-wall_thickness+(stepper_size+stepper_oversize)-extra,wall_thickness/2+(stepper_size+stepper_oversize)/2]) cube([(stepper_size+stepper_oversize)*2,(stepper_size+stepper_oversize)*2,(stepper_size+stepper_oversize)*2],center=true);
		}
		translate([0,0,-50]) cube([200,200,100],center=true);
	}
}

module spool_bearing() {
	translate([-support_rod_dia/4-(stepper_size+stepper_oversize)/2,0,0]) difference() {
		translate([0,0,-.4]) difference() {
			union() {
				translate([support_rod_dia/2+(stepper_size+stepper_oversize)/2+wall_thickness,0,wall_thickness/2]) {
					translate([0,-support_rod_depth/2+(spool_bearing_thickness+wall_thickness)/2,0]) hull() {
						translate([0,0,(stepper_size+stepper_oversize)/2+wall_thickness]) rotate([90,0,0]) cylinder(r=spool_bearing_dia/2+wall_thickness+clearance,h=spool_bearing_thickness+wall_thickness,center=true);
						translate([0,0,0]) rotate([90,0,0]) cylinder(r=spool_bearing_dia/2+wall_thickness+clearance,h=spool_bearing_thickness+wall_thickness,center=true);
					}
					translate([0,0,0]) cube([(stepper_size+stepper_oversize)+support_rod_dia,support_rod_depth,wall_thickness],center=true);
					translate([spool_bearing_dia/2+wall_thickness/2+clearance,(stepper_size+stepper_oversize)/20-wall_thickness,wall_thickness]) rotate([30,0,0]) cube([wall_thickness,(stepper_size+stepper_oversize)/5,(stepper_size+stepper_oversize)/2],center=true);
					translate([-spool_bearing_dia/2-wall_thickness/2-clearance,(stepper_size+stepper_oversize)/20-wall_thickness,wall_thickness]) rotate([30,0,0]) cube([wall_thickness,(stepper_size+stepper_oversize)/5,(stepper_size+stepper_oversize)/2],center=true);
					translate([0,-support_rod_depth/2+wall_thickness/2,(support_rod_dia+wall_thickness)/2]) cube([(stepper_size+stepper_oversize)+support_rod_dia,wall_thickness,support_rod_dia+wall_thickness],center=true);
				}
				translate([0,0,support_rod_dia/2+wall_thickness]) rotate([90,90,0]) cylinder(r=support_rod_dia/2+wall_thickness,h=support_rod_depth,center=true);
			}
			translate([support_rod_dia/2+(stepper_size+stepper_oversize)/2+wall_thickness,-support_rod_depth/2+(spool_bearing_thickness+wall_thickness)/2,wall_thickness/2]) {
				translate([0,0,(stepper_size+stepper_oversize)/2+wall_thickness]) rotate([90,0,0]) cylinder(r=spool_bearing_dia/2-clearance/2-wall_thickness,h=spool_bearing_thickness+wall_thickness+extra,center=true);
				translate([0,wall_thickness-wall_thickness/2,(stepper_size+stepper_oversize)/2+wall_thickness]) rotate([90,0,0]) cylinder(r=spool_bearing_dia/2+clearance/2,h=spool_bearing_thickness+extra,center=true);
				translate([(stepper_size+stepper_oversize)/3,wall_thickness,0]) cylinder(r=pulley_bolt_dia/2,h=20,center=true);
				translate([0,wall_thickness*2+spool_bearing_thickness,0]) cylinder(r=pulley_bolt_dia/2,h=20,center=true);
				translate([-(stepper_size+stepper_oversize)/3,wall_thickness,0]) cylinder(r=pulley_bolt_dia/2,h=20,center=true);
			}
			translate([0,0,support_rod_dia/2+wall_thickness]) rotate([90,90,0]) cylinder(r=support_rod_dia/2,h=effector_spacing+wall_thickness+spool_bearing_thickness+support_rod_depth*2+extra,center=true);
		}
		translate([(stepper_size+stepper_oversize)+15,0,15]) rotate([0,-45,0]) cube([26,30,30],center=true);
		translate([0,0,-50]) cube([200,200,100],center=true);
	}
}

module bottom_corner() {
	top_corner(1);
}
module joint_test() {
	wall_thickness=2;
	support_rod_dia=8.25; // Driveway marker diameter.
	support_rod_depth=20; // Depth of the pockets for support rods.
	roswell_constant=19.47;
	q=32;
	x=q/2;
	y=q/4;
	z=q/8; 
	translate([x,y,z]) rotate([0,45+roswell_constant/2,0]) {
		cylinder(r=1,h=30,center=true);
		for (i=[15,30,45,60,75,90]) rotate([0,-45-roswell_constant/2,-i]) translate([-x,-y,-z]) rotate([-30,roswell_constant,0]) translate([0,0,support_rod_depth*1.5]) #cylinder(r=support_rod_dia/2+wall_thickness,h=support_rod_depth,center=true);
	}
	translate([x,-y,z]) rotate([0,45+roswell_constant/2,0]) {
		cylinder(r=1,h=30,center=true);
		for (i=[15,30,45,60,75,90]) rotate([0,-45-roswell_constant/2,i]) translate([-x,y,-z]) rotate([30,roswell_constant,0]) translate([0,0,support_rod_depth*1.5]) #cylinder(r=support_rod_dia/2+wall_thickness,h=support_rod_depth,center=true);
	}
	rotate([-30,roswell_constant,0]) translate([0,0,support_rod_depth*1.5]) cylinder(r=support_rod_dia/2+wall_thickness,h=support_rod_depth,center=true);
	rotate([-30,90,0]) translate([0,0,support_rod_depth*1.5]) cylinder(r=support_rod_dia/2+wall_thickness,h=support_rod_depth,center=true);
	rotate([30,roswell_constant,0]) translate([0,0,support_rod_depth*1.5]) cylinder(r=support_rod_dia/2+wall_thickness,h=support_rod_depth,center=true);
	rotate([30,90,0]) translate([0,0,support_rod_depth*1.5]) cylinder(r=support_rod_dia/2+wall_thickness,h=support_rod_depth,center=true);
}
module top_corner(bottom) {
	difference() {
		translate([0,0,-.4]) difference() { // flat bottoms print better
			translate([0,0,support_rod_dia/2+wall_thickness]) union() {
				difference() {
					translate([0,0,-support_rod_dia/2-wall_thickness/2+.4]) rotate([0,0,30]) cylinder(r=support_rod_depth*1.47,$fn=6, h=wall_thickness*2+extra,center=true);
					translate([-50-pulley_inner_dia/6,0,0]) cube([100,100,100],center=true);
				}
				rotate([0,-90+roswell_constant,0]) difference() {
					rotate([0,0,30]) cylinder(r=support_rod_depth*1.47,h=wall_thickness,$fn=6,center=true);
					translate([-50,0,0]) cube([90,100,100],center=true);
				}
				rotate([60,-roswell_constant,60]) translate([0,0,support_rod_depth]) rotate([0,90,0]) cylinder(r=support_rod_depth/1.47,$fn=3,h=wall_thickness,center=true);
				rotate([60,roswell_constant,120]) translate([0,0,support_rod_depth]) rotate([0,90,0]) cylinder(r=support_rod_depth/1.47,$fn=3,h=wall_thickness,center=true);
				#for (i=[-30,30]) {
					rotate([i,roswell_constant,0]) translate([0,0,support_rod_depth]) cylinder(r=support_rod_dia/2+wall_thickness,h=support_rod_depth,center=true);
					rotate([i,90,0]) translate([0,0,support_rod_depth]) cylinder(r=support_rod_dia/2+wall_thickness,h=support_rod_depth,center=true);
				}
				sphere(r=support_rod_depth/2+wall_thickness,center=true);
				if (bottom != 1) {
					translate([pulley_offset,0,-support_rod_dia/2-wall_thickness+pulley_inner_dia/2.5]) rotate([90,0,0]) {
						cylinder(r=pulley_inner_dia/2.2,h=effector_spacing-pulley_thickness,center=true);
						hull() {
							translate([0,0,0]) cylinder(r=pulley_inner_dia/2.2,h=limit_switch_thickness+clearance+wall_thickness*2,center=true);
							translate([0,-7,0]) rotate([0,0,-roswell_constant]) {
								translate([-21.75-wall_thickness,14,0]) cylinder(r=pulley_inner_dia/2.2+wall_thickness/2,h=limit_switch_thickness+clearance+wall_thickness*2,center=true);
								translate([-21.75-wall_thickness,-1,0]) cylinder(r=pulley_inner_dia/2.2+wall_thickness/2,h=limit_switch_thickness+clearance+wall_thickness*2,center=true);
							}
							translate([0,9.0,0]) cylinder(r=pulley_inner_dia/2.2,h=limit_switch_thickness+clearance+wall_thickness*2,center=true);
						}
					}
				} else {
					translate([0,0,-support_rod_dia/2]) rotate([90,0,0]) cylinder(r=wall_thickness*1.3,h=effector_spacing-pulley_thickness,center=true);
				}
			}
			if (bottom != 1) translate([-21.75,0,13.5]) rotate([0,90+roswell_constant,0]) {
				limit_switch_cutout();
			}
			translate([0,0,support_rod_dia/2+wall_thickness]) union() {
				for (i=[-30,30] ) {
					rotate([i,roswell_constant,0]) translate([0,0,support_rod_depth]) cylinder(r=support_rod_dia/2+clearance/2,h=support_rod_depth+extra,center=true);
					rotate([i,90,0]) translate([0,0,support_rod_depth]) cylinder(r=support_rod_dia/2+clearance/2,h=support_rod_depth+extra,center=true);
				}
			}
			//translate([(-support_rod_dia-wall_thickness)/2-support_rod_dia/2-wall_thickness,0,0]) cube([support_rod_dia+wall_thickness,100,100],center=true);
			if (bottom != 1) {
				translate([pulley_offset,0,pulley_inner_dia/2.5]) rotate([90,0,0]) cylinder(r=pulley_bolt_dia/2+clearance/2,h=effector_spacing+pulley_thickness+extra*2,center=true);
				hull() {
					translate([pulley_offset,0,0]) rotate([90,0,0]) cylinder(r=(pulley_outer_dia+clearance)/2,h=pulley_thickness+clearance,center=true);
					translate([pulley_offset,0,pulley_inner_dia/2.5]) rotate([90,0,0]) cylinder(r=(pulley_outer_dia+clearance)/2,h=pulley_thickness+clearance,center=true);
				}
				translate([pulley_offset-pulley_inner_dia/2,0,pulley_inner_dia/4]) rotate([0,135,0]) translate([0,0,support_rod_depth/2]) cylinder(r1=pulley_thickness/2,r2=pulley_thickness*3,h=support_rod_depth*.95,center=true);
				rotate([0,14.5,0]) translate([pulley_offset-(pulley_inner_dia+pulley_outer_dia)/4+clearance,0,pulley_inner_dia/2.5+support_rod_depth]) scale([.80,1.0,1]) cylinder(r1=pulley_thickness/2,r2=pulley_thickness*1.8,h=support_rod_depth*2,center=true);
			}
		}
		for (i=[-60,0,60]) rotate([0,0,i]) translate([support_rod_depth,0,0]) cylinder(r=pulley_bolt_dia/2,h=20,center=true);
		translate([0,0,(-support_rod_dia-wall_thickness)/2]) cube([100,100,support_rod_dia+wall_thickness],center=true);
	}
}
		

