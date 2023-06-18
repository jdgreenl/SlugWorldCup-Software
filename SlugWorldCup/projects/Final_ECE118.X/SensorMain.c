/*
 * File:   SensorMain.c
 * Author: cubsl
 *
 * Created on April 29, 2023, 3:16 PM
 */


#include "xc.h"
#include "pwm.h"
#include "IO_Ports.h"
#include <stdio.h>

#include <BOARD.h>
#include <LED.h>
#include <AD.h>
#include <proc/p32mx320f128h.h>

#define LED_ALL_ON 0xF
#define LED_ALL_OFF 0
#define MAX_DUTY 1000
#define MIN_DUTY 0


unsigned int pot_val;
unsigned short int motor_signal;
unsigned int Beacon_2k;

int Set_MotorSignal();
int Set_LEDs();
int Beacon_Detection_2k();

#ifndef SENSOR_MAIN
//#define SENSOR_MAIN
/*
int main(void) {
    BOARD_Init();

    AD_Init();

    uint16_t read;
    uint16_t pattern;
    
    AD_AddPins(AD_PORTV3);
    IO_PortsSetPortInputs(PORTX, PIN5);
    PWM_Init();
    PWM_AddPins(PWM_PORTZ06);
    PWM_SetFrequency(500);
    LED_Init();
    LED_AddBanks(LED_BANK1 | LED_BANK2 | LED_BANK3);
    
    pattern = 0x0000;
    // IO_PortsSetPortDirection(PORTV, pattern);
    pattern = 0x1ff8;
    IO_PortsSetPortInputs(PORTW, pattern); //0x1f8
    IO_PortsSetPortInputs(PORTV, pattern); //0x1f0
    IO_PortsSetPortInputs(PORTX, pattern); // 
    IO_PortsSetPortInputs(PORTY, pattern);
    IO_PortsSetPortInputs(PORTZ, pattern);
    // IO_PortsWritePort(PORTV, pattern);
    
    
    pot_val = 1023;
    printf("\r\nHello world!");

    while (1) {
        /*
        if (AD_IsNewDataReady()) {
            Set_MotorSignal();
        }
         
        unsigned int blue = read;
        read = IO_PortsReadPort(PORTZ);
        if (read != blue) {
            printf("\r\n%X", read);
        }
    }

    return 0;
}

*/

#endif
int Set_MotorSignal() {
    pot_val = AD_ReadADPin(AD_PORTV3);
    motor_signal = pot_val; // + 1000;

    if (motor_signal > MAX_DUTY) {
        motor_signal = MAX_DUTY;
    } else if (motor_signal < MIN_DUTY) {
        motor_signal = MIN_DUTY;
    }
    PWM_SetDutyCycle(PWM_PORTZ06, motor_signal);
    printf("\r\n%d", PWM_GetDutyCycle(PWM_PORTZ06));
    Set_LEDs();
    return TRUE;
}

int Set_LEDs() {
    unsigned int scale = 12 - (pot_val / 80);
    unsigned int pattern = 0xFFF >> scale;
    printf("\r\n%X", pattern);
    LED_SetBank(LED_BANK1, pattern);
    LED_SetBank(LED_BANK2, pattern >> 4);
    LED_SetBank(LED_BANK3, pattern >> 8);

    return TRUE;
}

int Beacon_Detector_2k() {
    Beacon_2k = AD_ReadADPin(AD_PORTV3);
    printf("\r\n2k Beacon: %d", Beacon_2k);
    return TRUE;
}

