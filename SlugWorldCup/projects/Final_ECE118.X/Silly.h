/* 
 * File:   Silly.h
 * Author: leafg
 *
 * Created on May 31, 2023, 6:09 PM
 */

#ifndef SILLY_H
#define	SILLY_H

#include <BOARD.h>

#define BUMPER_TRIPPED 1
#define BUMPER_NOT_TRIPPED 0

#define ROACH_MAX_SPEED 100 

void Silly_Init(void);

char Silly_LeftMtrSpeed(int newSpeed, int dir);

char Silly_RightMtrSpeed(int newSpeed, int dir);

unsigned int Silly_2kBeaconLevel(void);

unsigned int Silly_1k5BeaconLevel(void);

unsigned int Silly_BatteryVoltage(void);

unsigned char Silly_ReadFrontLeftBumper(void);

unsigned char Silly_ReadFrontRightBumper(void);

unsigned char Silly_ReadRearLeftBumper(void);

unsigned char Silly_ReadRearRightBumper(void);

unsigned char Silly_ReadBumpers(void);

unsigned char Silly_ReadFrontRightTape(void);

unsigned char Silly_ReadFrontCenterTape(void);

unsigned char Silly_ReadFrontLeftTape(void);

unsigned char Silly_ReadBackTape(void);

unsigned char Silly_ReadSideLeftTape(void);

unsigned char Silly_ReadSideRightTape(void);

unsigned char Silly_ReadTapeSensors(void);

unsigned char Silly_Shooting(unsigned int FIRE);

unsigned char Silly_Stop(void);

unsigned char Silly_TankTurnRight(void);

unsigned char Silly_TankTurnLeft(void);

unsigned char Silly_TankTurnSide(void);

unsigned char Silly_TankTurnSideAlt(void);

unsigned char Silly_FullFoward(void);

unsigned char Silly_FullBackward(void);

unsigned char Silly_StartSide(void);

#endif	/* SILLY_H */


