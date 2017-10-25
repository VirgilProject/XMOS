/*
 * Hello World.xc
 *
 *  Created on: Sep 25, 2017
 *      Author: Mike
 */


#include <stdio.h>

void hw ( unsigned n) {
printf (" Hello world from task number %u\n " , n);
}


int main(){
    printf("Hello World\n");
    //parralel hello world
    par {
    hw (0) ;
    hw (1) ;
    hw (3) ;
    }
    return 0;
}
