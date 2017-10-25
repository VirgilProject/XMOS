/*
 * flashing LEDs.xc
 *
 *  Created on: Sep 25, 2017
 *      Author: Mike
 */
# include <platform.h>
# include <xs1.h>
# include <timer.h>
#include <stdio.h>


#include <xs1.h>
#include <stdio.h>

#define mask3 0b100 //Button 3 on xCORE-200 Multichannel Audio Platform
#define mask2 0b010 //Button 2 on xCORE-200 Multichannel Audio Platform
#define mask1 0b001 //Button 1 on xCORE-200 Multichannel Audio Platform

on tile[1]: in port button = XS1_PORT_4B;
on tile[1]: out port p_leds_row =  XS1_PORT_4C;     //4x4 LED matrix
on tile[1]: out port p_leds_col =  XS1_PORT_4D;

char Cbutton;   //8 Bit-Datatype

void LED_OFF(){
    delay_milliseconds (150) ;

    p_leds_row <: 0b1110;
    delay_milliseconds (150) ;

    p_leds_row <: 0b1101;
    delay_milliseconds (150) ;

    p_leds_row <: 0b1011;
    delay_milliseconds (150) ;

    p_leds_row <: 0b0111;
    delay_milliseconds (150) ;

    p_leds_row <: 0b0000;
    delay_milliseconds (150) ;

    p_leds_row <: 0b1111;
    delay_milliseconds (150) ;

    p_leds_row <: 0b0000;
    delay_milliseconds (150) ;

    p_leds_row <: 0b1111;
    delay_milliseconds (150) ;
}

void LED_ON(){
    // 15 (0b1111) = nothing
    // 14 (0b1110 = bottom row
    // 13 (0b1101) = second row
    // 12 (0b1100) = first and second rows
    // 11 (0b1011) = third row
    // 10 (0b1010) = first and third rows
    // 9  (0b1001) = second and third rows
    // 8  (0b1000) = first, second, third rows
    // 7  (0b0111) = fourth row

    p_leds_col <: 0b1111;
    delay_milliseconds (150) ;

    p_leds_col <: 0b1110;
    delay_milliseconds (150) ;

    p_leds_col <: 0b1101;
    delay_milliseconds (150) ;

    p_leds_col <: 0b1011;
    delay_milliseconds (150) ;

    p_leds_col <: 0b0111;
    delay_milliseconds (150) ;

    p_leds_col <: 0b0000;
    delay_milliseconds (150) ;

    p_leds_col <: 0b1111;
    delay_milliseconds (150) ;

    p_leds_col <: 0b0000;
    delay_milliseconds (150) ;

    p_leds_col <: 0b1111;
    delay_milliseconds (150) ;

}

int main (void) {

    par{
        on tile[1]:{
          while (1) {
                  button :> Cbutton;
                  if(!(Cbutton & mask1)) {
                      LED_OFF();
                  }   //Button is active low
                  else if(!(Cbutton & mask2)) {
                      LED_OFF();
                  }
                  else if(!(Cbutton & mask3)) {
                      LED_OFF();
                  }
                  else {
                      LED_ON();
            }
          }
        }
    }
    return 0;
}



