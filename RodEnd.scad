/* Open SCAD Name.: caps_v1.scad
*  Copyright (c)..: 2020 www.DIY3DTech.com
*
*  Creation Date..: 07/05/2020
*  Description....: cap for pipe (press fit)
*
*  Rev 1: Develop Model
*  Rev 2: 
*
*  This program is free software; you can redistribute it and/or modify
*  it under the terms of the GNU General Public License as published by
*  the Free Software Foundation; either version 2 of the License, or
*  (at your option) any later version.
*
*  This program is distributed in the hope that it will be useful,
*  but WITHOUT ANY WARRANTY; without even the implied warranty of
*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*  GNU General Public License for more details.
*/ 

/*------------------Customizer View-------------------*/

// preview[view:north, tilt:top]

/*---------------------Parameters---------------------*/

// outer dia of rod to create cap ID
rod_od              =   5;
// thickness of cap in mm (each side)
cap_thick           =   2;
// height of cap in mm
cap_high            =   15.0;
// tapper of opening in mm
cap_tapper          =    0.6;



/*-----------------------Execute----------------------*/

main_module();

/*-----------------------Modules----------------------*/

module main_module(){ //create module
    union() {
    difference() {
            union() {//start union
                
                //create main body for cap
                 translate ([0,0,0]) rotate ([0,0,0]) cylinder(cap_high,(rod_od+(cap_thick*2))/2,(rod_od+(cap_thick*2))/2,$fn=60,true);
                        
                    } //end union
                            
    //start subtraction of difference
                    
                //create tappered opening    
                 translate ([0,0,cap_thick ]) rotate ([0,0,0]) cylinder(cap_high,(rod_od-(cap_tapper*2))/2,(rod_od+(cap_tapper*2))/2,$fn=60,true);
                                               
    } //end difference
    translate([0, 0, -cap_high/2]) 
    difference() {
        sphere((rod_od+(cap_thick*2))/2,$fn=60);
        translate([0, 0, (rod_od+(cap_thick*2))/2])
             cube(size=(rod_od+(cap_thick*2)), center = true);
        }
    }
}//end module

                 
/*----------------------End Code----------------------*/