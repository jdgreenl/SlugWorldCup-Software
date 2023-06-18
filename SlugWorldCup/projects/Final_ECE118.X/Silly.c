/*
 * File:   SensorMain.c
 * Author: cubsl
 *
 * Created on April 29, 2023, 3:16 PM
 */


#include "xc.h"
#include "pwm.h"
#include "IO_Ports.h"
#include "Silly.h"
#include <stdio.h>

#include <BOARD.h>
#include <LED.h>
#include <AD.h>
#include <proc/p32mx320f128h.h>

#define LED_ALL_ON 0xF
#define LED_ALL_OFF 0
#define MAX_DUTY 1000
#define MIN_DUTY 0

#define FORWARD_DRIVE TRUE
#define REVERSE_DRIVE FALSE

// Pins
#define IN1_FORWARDL PIN8 // portY
#define IN2_REVERSEL PIN7 // portY
#define IN1_FORWARDR PIN11 // portY
#define IN2_REVERSER PIN9 // portY


// Portw
#define FR_BUMP PIN3
#define FL_BUMP PIN4
#define BR_BUMP PIN5
#define BL_BUMP PIN6
#define SIDE_SWITCH PIN8

//PortV
#define TAPE1 PIN5
#define TAPE2 PIN6
#define TAPE3 PIN7
#define TAPE4 PIN8

#define SIDE_FUN PIN11
#define SIDE_LR PIN12

#define POT_PIN    AD_PORTV3
#define SWITCH_PIN 1
#define PWM_PINL PWM_PORTY10
#define PWM_PINR PWM_PORTY12
#define PWM_FIRE PWM_PORTY04


#define HIGH_THRESHOLD_2K 650
#define LOW_THRESHOLD_2K 200

#define HIGH_THRESHOLD_1K5 650
#define LOW_THRESHOLD_1K5 200

#define LOW_THRESHOLD_TAPE 100
#define HIGH_THESHOLD_TAPE 850

#define FIRING_SPEED 1000
#define NUM_TAPE 4

#define MOTOR_100 1000
#define MOTOR_98 993
#define MOTOR_75 750
#define MOTOR_50 500
#define MOTOR_25 250
#define STOPPED 0

#define FOWARD 1
#define BACKWARD 0

unsigned int pot_val;
unsigned short int duty;
uint16_t direction, prev_direction;

unsigned short int motor_signal;
unsigned int Beacon_2k;

int Set_MotorSignal();
int Set_LEDs();
int Beacon_Detection_2k();
int Set_DutyCycle(unsigned int speed);

//#define SENSOR_MAIN
#ifdef SENSOR_MAIN

/*
int main(void) {
    BOARD_Init();

    uint16_t readW;
    uint16_t readV;
    uint16_t pattern;
    uint16_t blue;
    uint16_t yellow;
    
    AD_Init();
    AD_AddPins(AD_PORTV3| AD_PORTV4 | AD_PORTV5 | AD_PORTV6 | AD_PORTV7 | AD_PORTV8);
    /*
    // IO_PortsWritePort(PORTV, pattern);
    IO_PortsSetPortInputs(PORTW, FL_BUMP | FR_BUMP | BL_BUMP | BR_BUMP); // 
    //IO_PortsSetPortInputs(PORTV, TAPE1|TAPE2|TAPE3|TAPE4);
    AD_Init();
    AD_AddPins(AD_PORTV5 | AD_PORTV6 | AD_PORTV7 | AD_PORTV8);
    
    PWM_Init();
    PWM_AddPins(PWM_PINL);
    PWM_SetFrequency(1000);
    PWM_SetDutyCycle(PWM_PINL, MIN_PWM);
    IO_PortsSetPortOutputs(PORTY, IN1_FORWARDL | IN2_REVERSEL|IN1_FORWARDR | IN2_REVERSER);
    
    
    IO_PortsSetPortBits(PORTY, IN1_FORWARDL);
    IO_PortsClearPortBits(PORTY, IN2_REVERSEL);
 */

Silly_Init();

pot_val = 1023;
printf("\r\nHello world!");

//Silly_LeftMtrSpeed(1000, 1);
//dSilly_RightMtrSpeed(1000, 1);
while (1) {
    /*
    if (AD_IsNewDataReady()) {
        Set_MotorSignal();
    }
     * */
    blue = readW;
    yellow = readV;
    readW = IO_PortsReadPort(PORTW);
    //readV = IO_PortsReadPort(PORTV);
    if (readW != blue) {
        //printf("\r\n%X", readW);
        if ((readW & FR_BUMP)) {
            printf("\r\nFront Right Bump Press");
        }
        if ((readW & FL_BUMP)) {
            printf("\r\nFront Left Bump Press");
        }
        if ((readW & BR_BUMP)) {
            printf("\r\nBack Right Bump Press");
        }
        if ((readW & BL_BUMP)) {
            printf("\r\nBack Left Bump Press");
        }

    }

    /*
    if(readV != yellow){
        printf("\r\n%X", readV);
        if(readV & TAPE2){
            printf("\r\nNice man");
        }
    }*/

    yellow = readV;
    readV = AD_ReadADPin(AD_PORTV8);
    if (yellow != readV) {
        //printf("\r\nTape sensor: %d", readV);
    }
}

return 0;
}
#endif

/*
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
 */

int Set_DutyCycle(unsigned int speed) {
    duty = speed;

    if (duty > MAX_PWM) {
        duty = MAX_PWM;
    } else if (duty < MIN_PWM) {
        duty = MIN_PWM;
    }

    PWM_SetDutyCycle(PWM_PINL, duty);

    //Set_LEDs();

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
    Beacon_2k = AD_ReadADPin(AD_PORTW7);
    //printf("\r\n2k Beacon: %d", Beacon_2k);
    return TRUE;
}

void Silly_Init(void) {
    printf("\r\nTime to get silly");
    // Bumpers
    IO_PortsSetPortInputs(PORTW, FL_BUMP | FR_BUMP | BL_BUMP | BR_BUMP | SIDE_SWITCH);
    IO_PortsSetPortInputs(PORTV, SIDE_FUN | SIDE_LR);
    // Motors
    PWM_Init();
    PWM_AddPins(PWM_PINL);
    PWM_SetFrequency(1000);
    PWM_SetDutyCycle(PWM_PINL, MIN_PWM);
    PWM_AddPins(PWM_PINR);
    PWM_SetFrequency(1000);
    PWM_SetDutyCycle(PWM_PINR, MIN_PWM);
    PWM_AddPins(PWM_FIRE);
    PWM_SetFrequency(1000);
    PWM_SetDutyCycle(PWM_PORTZ06, MIN_PWM);
    IO_PortsSetPortOutputs(PORTY, IN1_FORWARDL | IN2_REVERSEL | IN1_FORWARDR | IN2_REVERSER);
    AD_Init();
    AD_AddPins(AD_PORTV3 | AD_PORTV4 | AD_PORTV5 | AD_PORTV6 | AD_PORTV7 | AD_PORTV8 | AD_PORTW7 | AD_PORTW8);

}

unsigned char Silly_ReadBumpers(void) {
    return IO_PortsReadPort(PORTW);
}

unsigned char Silly_ReadFrontLeftBumper(void) {
    unsigned char read;
    read = IO_PortsReadPort(PORTW);
    return (read & FL_BUMP);
}

unsigned char Silly_ReadFrontRightBumper(void) {
    unsigned char read;
    read = IO_PortsReadPort(PORTW);
    return (read & FR_BUMP);
}

unsigned char Silly_ReadRearLeftBumper(void) {
    unsigned char read;
    read = IO_PortsReadPort(PORTW);
    return (read & BL_BUMP);
}

unsigned char Silly_ReadRearRightBumper(void) {
    unsigned char read;
    read = IO_PortsReadPort(PORTW);
    return (read & BR_BUMP);
}

unsigned char Silly_StartSide(void) {
    unsigned int read;
    read = AD_ReadADPin(AD_PORTW8);
    //return FALSE;
    //printf("\r\nSide FUN:%d", read);
    if(read >= 100){
        return TRUE;
    } else{
        return FALSE;
    }
    return FALSE;
}

char Silly_LeftMtrSpeed(int newSpeed, int dir) {
    duty = newSpeed;
    if (dir == 1) {
        IO_PortsSetPortBits(PORTY, IN1_FORWARDL);
        IO_PortsClearPortBits(PORTY, IN2_REVERSEL);
    } else if (dir == 0) {
        IO_PortsSetPortBits(PORTY, IN2_REVERSEL);
        IO_PortsClearPortBits(PORTY, IN1_FORWARDL);
    }
    if (duty > MAX_PWM) {
        duty = MAX_PWM;
    } else if (duty < MIN_PWM) {
        duty = MIN_PWM;
    }

    PWM_SetDutyCycle(PWM_PINL, duty);
    //Set_LEDs();
    return TRUE;
}

char Silly_RightMtrSpeed(int newSpeed, int dir) {
    duty = newSpeed;
    if (dir == 0) {
        IO_PortsSetPortBits(PORTY, IN1_FORWARDR);
        IO_PortsClearPortBits(PORTY, IN2_REVERSER);
    } else if (dir == 1) {
        IO_PortsSetPortBits(PORTY, IN2_REVERSER);
        IO_PortsClearPortBits(PORTY, IN1_FORWARDR);
    }
    if (duty > MAX_PWM) {
        duty = MAX_PWM;
    } else if (duty < MIN_PWM) {
        duty = MIN_PWM;
    }
    PWM_SetDutyCycle(PWM_PINR, duty);
    //Set_LEDs();
    return TRUE;
}

unsigned char Silly_ReadFrontRightTape(void) {
    unsigned int read;
    read = AD_ReadADPin(AD_PORTV5);
    if (read >= HIGH_THESHOLD_TAPE) {
        return TRUE;
    } else if (read < LOW_THRESHOLD_TAPE) {
        return FALSE;
    }
    return FALSE;
}

unsigned char Silly_ReadFrontCenterTape(void) {
    unsigned int read;
    read = AD_ReadADPin(AD_PORTV6);
    if (read >= HIGH_THESHOLD_TAPE) {
        return TRUE;
    } else if (read < LOW_THRESHOLD_TAPE) {
        return FALSE;
    }
    return FALSE;
}

unsigned char Silly_ReadFrontLeftTape(void) {
    unsigned int read;
    read = AD_ReadADPin(AD_PORTV7);
    if (read >= HIGH_THESHOLD_TAPE) {
        return TRUE;
    } else if (read < LOW_THRESHOLD_TAPE) {
        return FALSE;
    }
    return FALSE;
}

unsigned char Silly_ReadBackTape(void) {
    unsigned int read;
    read = AD_ReadADPin(AD_PORTV8);
    if (read >= HIGH_THESHOLD_TAPE) {
        return TRUE;
    } else if (read < LOW_THRESHOLD_TAPE) {
        return FALSE;
    }
    return FALSE;
}

unsigned char Silly_ReadSideLeftTape(void) {
    unsigned int read;
    read = AD_ReadADPin(AD_PORTV3);
    if (read >= HIGH_THESHOLD_TAPE) {
        return TRUE;
    } else if (read < LOW_THRESHOLD_TAPE) {
        return FALSE;
    }
    return FALSE;
}

unsigned char Silly_ReadSideRightTape(void) {
    unsigned int read;
    read = AD_ReadADPin(AD_PORTV3);
    if (read >= HIGH_THESHOLD_TAPE) {
        return TRUE;
    } else if (read < LOW_THRESHOLD_TAPE) {
        return FALSE;
    }
    return FALSE;
}

unsigned char Silly_ReadTapeSensors(void) {
    uint8_t read;
    read |= Silly_ReadFrontRightTape() << 0;
    read |= Silly_ReadFrontCenterTape() << 1;
    read |= Silly_ReadFrontLeftTape() << 2;
    read |= Silly_ReadBackTape() << 3;
    read |= Silly_ReadSideLeftTape() << 4;
    read |= Silly_ReadSideRightTape() << 5;
    //printf("\r\nRead Tape Sensors: %x", read);
    return read;
}

unsigned int Silly_2kBeaconLevel(void) {
    unsigned int read;

    read = AD_ReadADPin(AD_PORTW7);
    /*
    if (read >= 710) {
        printf("\r\n2k Beacon: %d", read);
    }*/
    return read;    
    /*
    if(prev == FALSE){
        if(read > HIGH_THRESHOLD_2K){
            return TRUE;
        }else{
            return FALSE;
        }
    }
    if(prev == TRUE){
        if(read < LOW_THRESHOLD_2K){
            return FALSE;
        } else {
            return TRUE;
        }
    }
    return prev;
     * */
}

unsigned int Silly_1k5BeaconLevel(void) {
    unsigned int read;
    read = AD_ReadADPin(AD_PORTV3);
    return read;
    /*
    if(prev == FALSE){
        if(read > HIGH_THRESHOLD_1K5){
            return TRUE;
        }else{
            return FALSE;
        }
    }
    if(prev == TRUE){
        if(read < LOW_THRESHOLD_1K5){
            return FALSE;
        } else {
            return TRUE;
        }
    }
    return prev;
     * */
}

unsigned char Silly_Shooting(unsigned int FIRE) {
    printf("\r\nYou look silly");
    if (FIRE == TRUE) {  
        PWM_SetDutyCycle(PWM_FIRE, MAX_DUTY);
    } else if (FIRE == FALSE) {
        PWM_SetDutyCycle(PWM_FIRE, MIN_DUTY);
    }
    return TRUE;
}

unsigned int Silly_BatteryVoltage(void) {
    unsigned int read;

    read = AD_ReadADPin(AD_PORTW7);
    /*
    if (read >= 710) {
        //printf("\r\n2k Beacon: %d", read);
    }*/
    return read;
}

unsigned char Silly_Stop(void) {
    //printf("\r\nKAT PLS");
    PWM_SetDutyCycle(PWM_PINR, MIN_DUTY);
    PWM_SetDutyCycle(PWM_PINL, MIN_DUTY);
    return TRUE;
}

unsigned char Silly_TankTurnRight(void) {
    Silly_LeftMtrSpeed(MOTOR_75, FOWARD);
    Silly_RightMtrSpeed(MOTOR_75, BACKWARD);
    return TRUE;
}

unsigned char Silly_TankTurnLeft(void) {
    Silly_LeftMtrSpeed(MOTOR_75, BACKWARD);
    Silly_RightMtrSpeed(MOTOR_75, FOWARD);
    return TRUE;
}

unsigned char Silly_TankTurnSide(void){
    unsigned int read;
    read = Silly_StartSide();
    Silly_LeftMtrSpeed(MOTOR_75, read);
    Silly_RightMtrSpeed(MOTOR_75, !read);
}


unsigned char Silly_TankTurnSideAlt(void){
    unsigned int read;
    read = Silly_StartSide();
    Silly_LeftMtrSpeed(MOTOR_75, !read);
    Silly_RightMtrSpeed(MOTOR_75, read);
}

unsigned char Silly_FullFoward(void) {
    Silly_LeftMtrSpeed(8*MOTOR_100/9, FOWARD);
    Silly_RightMtrSpeed(8*MOTOR_98/9, FOWARD);
    return TRUE;
}

unsigned char Silly_FullBackward(void) {
    Silly_LeftMtrSpeed(8*MOTOR_98/9, BACKWARD);
    Silly_RightMtrSpeed(8*MOTOR_100/9, BACKWARD);
    return TRUE;
}

