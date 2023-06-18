/*
 * File:   TemplateEventChecker.c
 * Author: Gabriel Hugh Elkaim
 *
 * Template file to set up typical EventCheckers for the  Events and Services
 * Framework (ES_Framework) on the Uno32 for the CMPE-118/L class. Note that
 * this file will need to be modified to fit your exact needs, and most of the
 * names will have to be changed to match your code.
 *
 * This EventCheckers file will work with both FSM's and HSM's.
 *
 * Remember that EventCheckers should only return TRUE when an event has occured,
 * and that the event is a TRANSITION between two detectable differences. They
 * should also be atomic and run as fast as possible for good results.
 *
 * This file includes a test harness that will run the event detectors listed in the
 * ES_Configure file in the project, and will conditionally compile main if the macro
 * EVENTCHECKER_TEST is defined (either in the project or in the file). This will allow
 * you to check you event detectors in their own project, and then leave them untouched
 * for your project unless you need to alter their post functions.
 *
 * Created on September 27, 2013, 8:37 AM
 */

/*******************************************************************************
 * MODULE #INCLUDE                                                             *
 ******************************************************************************/

#include "ES_Configure.h"
#include "SillyEventChecker.h"
#include "ES_Events.h"
#include "serial.h"
#include "AD.h"
#include "IO_Ports.h"

#include <stdio.h>

#include "SillyServiceBattery.h"
#include "SillyServiceBumper.h"
#include "SillyHSM.h"
#include "Silly.h"

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/
#define BATTERY_DISCONNECT_THRESHOLD 25

#define MIDDLE_LIGHT_THRESHOLD 600
#define LIGHT_ON_THRESHOLD (MIDDLE_LIGHT_THRESHOLD - 30)
#define LIGHT_OFF_THRESHOLD (MIDDLE_LIGHT_THRESHOLD + 30)
#define LIGHT_LEVEL_BITMASK 0x03FF

#define BEACON_ON_2K 800
#define BEACON_OFF_2K 670

#define AIM_ON 893
#define AIM_OFF 880

#define NUM_BUMPERS 4
#define NUM_TAPE 6
#define FL_BUMPER_MASK 1
#define FR_BUMPER_MASK (1<<1)
#define RL_BUMPER_MASK (1<<2)
#define RR_BUMPER_MASK (1<<3)

#define TAPE1_MASK 1
#define TAPE2_MASK (1<<1)
#define TAPE3_MASK (1<<2)
#define TAPE4_MASK (1<<3)
#define TAPE5_MASK (1<<4)
#define TAPE6_MASK (1<<5)

#define DEBOUNCE_MASK 0x0FF // chenge this to have the same amount of 1's as debouncing iterations
#define DEBOUNCE_MASK_TAPE 0x03F
// at 200Hz. Or a 1 = 5ms. Max = 0xFFFFFFFF

#define NUM_TIMERS 4

/*******************************************************************************
 * EVENTCHECKER_TEST SPECIFIC CODE                                                             *
 ******************************************************************************/

//#define EVENTCHECKER_TEST
#ifdef EVENTCHECKER_TEST
#include <stdio.h>
#define SaveEvent(x) do {eventName=__func__; storedEvent=x;} while (0)

static const char *eventName;
static ES_Event storedEvent;
#endif

/*******************************************************************************
 * PRIVATE FUNCTION PROTOTYPES                                                 *
 ******************************************************************************/
/* Prototypes for private functions for this EventChecker. They should be functions
   relevant to the behavior of this particular event checker */

/*******************************************************************************
 * PRIVATE MODULE VARIABLES                                                    *
 ******************************************************************************/

/* Any private module level variable that you might need for keeping track of
   events would be placed here. Private variables should be STATIC so that they
   are limited in scope to this module. */

/*******************************************************************************
 * PUBLIC FUNCTIONS                                                            *
 ******************************************************************************/

/**
 * @Function TemplateCheckBattery(void)
 * @param none
 * @return TRUE or FALSE
 * @brief This function is a prototype event checker that checks the battery voltage
 *        against a fixed threshold (#defined in the .c file). Note that you need to
 *        keep track of previous history, and that the actual battery voltage is checked
 *        only once at the beginning of the function. The function will post an event
 *        of either BATTERY_CONNECTED or BATTERY_DISCONNECTED if the power switch is turned
 *        on or off with the USB cord plugged into the Uno32. Returns TRUE if there was an 
 *        event, FALSE otherwise.
 * @note Use this code as a template for your other event checkers, and modify as necessary.
 * @author Gabriel H Elkaim, 2013.09.27 09:18
 * @modified Gabriel H Elkaim/Max Dunne, 2016.09.12 20:08 */
uint8_t SillyCheckBattery(void) {
    static ES_EventTyp_t lastEvent = BATTERY_DISCONNECTED;
    ES_EventTyp_t curEvent;
    ES_Event thisEvent;
    uint8_t returnVal = FALSE;
    uint16_t batVoltage = Silly_BatteryVoltage(); // read the battery voltage

    if (batVoltage > BATTERY_DISCONNECT_THRESHOLD) { // is battery connected?
        curEvent = BATTERY_CONNECTED;
    } else {
        curEvent = BATTERY_DISCONNECTED;
    }
    if (curEvent != lastEvent) { // check for change from last time
        thisEvent.EventType = curEvent;
        thisEvent.EventParam = batVoltage;
        returnVal = TRUE;
        lastEvent = curEvent; // update history
        PostSillyHSM(thisEvent);
#ifndef EVENTCHECKER_TEST           // keep this as is for test harness
        PostBatteryService(thisEvent);
#else
        SaveEvent(thisEvent);
#endif   
    }
    return (returnVal);
}


/**
 * @Function TemplateCheckBattery(void)
 * @param none
 * @return TRUE or FALSE
 * @brief This function checks the light level and determines if 
 *        if LIGHT_TURNED_ON or LIGHT_TURNED_OFF event are triggered
 */
uint8_t SillyCheckLight(void) {
    static ES_EventTyp_t lastEvent = LIGHT_TURNED_OFF;
    ES_EventTyp_t curEvent;
    ES_Event thisEvent;
    uint8_t returnVal = FALSE;
    uint16_t lightVal = Silly_2kBeaconLevel();
    //printf("\r\nchecking Beacon: %d", lightVal);
    if (lightVal > BEACON_ON_2K) {
        //printf("\r\nBeacon On");
        curEvent = LIGHT_TURNED_ON;
    } else if (lightVal < BEACON_OFF_2K){
        curEvent = LIGHT_TURNED_OFF;
       // printf("\r\nBeacon Off");
    } else {
        curEvent = lastEvent;
    }
    if (curEvent != lastEvent) { // check for change from last time
        thisEvent.EventType = curEvent;
        thisEvent.EventParam = lightVal;
        returnVal = TRUE;
        lastEvent = curEvent; // update history
        PostSillyHSM(thisEvent);
#ifndef EVENTCHECKER_TEST           // keep this as is for test harness
        // Post function. In this case just print
        PostSillyHSM(thisEvent);
        //printf("\r\nEvent: %s\tParam: 0x%X",
        //            EventNames[thisEvent.EventType], thisEvent.EventParam);
        //PostGenericService(thisEvent);
#else
        SaveEvent(thisEvent);
#endif   
    }
    return (returnVal);
}



/**
 * @Function TemplateCheckBattery(void)
 * @param none
 * @return TRUE or FALSE
 * @brief This function checks the light level and determines if 
 *        if LIGHT_TURNED_ON or LIGHT_TURNED_OFF event are triggered
 */
uint8_t SillyCheckAim(void) {
    static ES_EventTyp_t lastEvent = AIM_TURNED_OFF;
    ES_EventTyp_t curEvent;
    ES_Event thisEvent;
    uint8_t returnVal = FALSE;
    uint16_t lightVal = Silly_2kBeaconLevel();
    //printf("\r\nchecking Beacon: %d", lightVal);
    if (lightVal > AIM_ON) {
        //printf("\r\nBeacon On");
        curEvent = AIM_TURNED_ON;
    } else if (lightVal < AIM_OFF){
        curEvent = AIM_TURNED_OFF;
       // printf("\r\nBeacon Off");
    } else {
        curEvent = lastEvent;
    }
    if (curEvent != lastEvent) { // check for change from last time
        thisEvent.EventType = curEvent;
        thisEvent.EventParam = lightVal;
        returnVal = TRUE;
        lastEvent = curEvent; // update history
        PostSillyHSM(thisEvent);
#ifndef EVENTCHECKER_TEST           // keep this as is for test harness
        // Post function. In this case just print
        PostSillyHSM(thisEvent);
        //printf("\r\nEvent: %s\tParam: 0x%X",
        //            EventNames[thisEvent.EventType], thisEvent.EventParam);
        //PostGenericService(thisEvent);
#else
        SaveEvent(thisEvent);
#endif   
    }
    return (returnVal);
}




/**
 * @Function TemplateCheckBattery(void)
 * @param none
 * @return TRUE or FALSE
 * @brief This function checks each bumper and determines if an event occured
 */
uint8_t SillyCheckBumpers(void) {
    int i;
    static ES_EventTyp_t lastEvent[NUM_BUMPERS] = {FL_BUMPER_OFF, FR_BUMPER_OFF, RL_BUMPER_OFF, RR_BUMPER_OFF};

    ES_EventTyp_t curEvent[NUM_BUMPERS];
    ES_Event thisEvent;

    uint8_t returnVal = FALSE;
    uint8_t bumperVal = Silly_ReadBumpers(); // read the bumpers

    uint8_t individualVal[NUM_BUMPERS];
    individualVal[0] = (bumperVal & PIN4) ? 1 : 0;
    individualVal[1] = (bumperVal & PIN3) ? 1 : 0;
    individualVal[2] = (bumperVal & PIN6) ? 1 : 0;
    individualVal[3] = (bumperVal & PIN5) ? 1 : 0;
    //printf("\r\nInd: %d", individualVal[0]);

    static uint32_t debounceVal[NUM_BUMPERS] = {0, 0, 0, 0};
    for (i = 0; i < NUM_BUMPERS; i++) {
        debounceVal[i] = debounceVal[i] << 1;
        debounceVal[i] += individualVal[i];
        debounceVal[i] &= DEBOUNCE_MASK;
        // For some reason, this results in DEBOUNCE_MASK - 1
        //  so I put this in the following compare statements
    }
    //printf("\r\n%d %d %d %d", debounceVal[0], debounceVal[1], debounceVal[2], debounceVal[3]);

    // Set events individually
    if (debounceVal[0] >= DEBOUNCE_MASK) { 
        curEvent[0] = FL_BUMPER_ON;
    } else if (debounceVal[0] == 0) {
        curEvent[0] = FL_BUMPER_OFF;
    } else {
        curEvent[0] = lastEvent[0];
    }

    if (debounceVal[1] >= DEBOUNCE_MASK) {
        curEvent[1] = FR_BUMPER_ON;
    } else if (debounceVal[1] == 0) {
        curEvent[1] = FR_BUMPER_OFF;
    } else {
        curEvent[1] = lastEvent[1];
    }

    if (debounceVal[2] >= DEBOUNCE_MASK) {
        curEvent[2] = RL_BUMPER_ON;
    } else if (debounceVal[2] == 0) {
        curEvent[2] = RL_BUMPER_OFF;
    } else {
        curEvent[2] = lastEvent[2];
    }

    if (debounceVal[3] >= DEBOUNCE_MASK) {
        curEvent[3] = RR_BUMPER_ON;
    } else if (debounceVal[3] == 0) {
        curEvent[3] = RR_BUMPER_OFF;
    } else {
        curEvent[3] = lastEvent[3];
    }

    // loop through events
    for (i = 0; i < NUM_BUMPERS; i++) {
        if (curEvent[i] != lastEvent[i]) { // check for change from last time
            thisEvent.EventType = curEvent[i];
            thisEvent.EventParam = bumperVal;
            returnVal = TRUE;
            lastEvent[i] = curEvent[i]; // update history
#ifndef EVENTCHECKER_TEST           // keep this as is for test harness
            PostBumperService(thisEvent);
#else
            SaveEvent(thisEvent);
#endif   
        }
    }



    return (returnVal);
}




/**
 * @Function TemplateCheckBattery(void)
 * @param none
 * @return TRUE or FALSE
 * @brief This function checks each bumper and determines if an event occured
 */
uint8_t SillyCheckTape(void) {
    int i;
    static ES_EventTyp_t lastEvent[NUM_BUMPERS] = {TAPE1_OFF, TAPE2_OFF, TAPE3_OFF, TAPE4_OFF};

    ES_EventTyp_t curEvent[NUM_BUMPERS];
    ES_Event thisEvent;

    uint8_t returnVal = FALSE;
    uint8_t tapeVal = Silly_ReadTapeSensors(); // read the bumpers

    uint8_t individualVal[NUM_TAPE];
    individualVal[0] = (tapeVal & TAPE1_MASK) ? 1 : 0;
    individualVal[1] = (tapeVal & TAPE2_MASK) ? 1 : 0;
    individualVal[2] = (tapeVal & TAPE3_MASK) ? 1 : 0;
    individualVal[3] = (tapeVal & TAPE4_MASK) ? 1 : 0;
    individualVal[4] = (tapeVal & TAPE5_MASK) ? 1 : 0;
    individualVal[5] = (tapeVal & TAPE6_MASK) ? 1 : 0;
    //printf("\r\nInd: %d", individualVal[0]);

    static uint32_t debounceVal[NUM_TAPE] = {0, 0, 0, 0, 0, 0};
    for (i = 0; i < NUM_TAPE; i++) {
        debounceVal[i] = debounceVal[i] << 1;
        debounceVal[i] += individualVal[i];
        debounceVal[i] &= DEBOUNCE_MASK_TAPE;
        // For some reason, this results in DEBOUNCE_MASK - 1
        //  so I put this in the following compare statements
    }
    //printf("\r\n%d %d %d %d", debounceVal[0], debounceVal[1], debounceVal[2], debounceVal[3]);

    // Set events individually
    if (debounceVal[0] >= DEBOUNCE_MASK_TAPE) { 
        curEvent[0] = TAPE1_ON;
    } else if (debounceVal[0] == 0) {
        curEvent[0] = TAPE1_OFF;
    } else {
        curEvent[0] = lastEvent[0];
    }
   // printf("\r\nTape2 Debounce: %x", debounceVal[1]);
    if (debounceVal[1] >= DEBOUNCE_MASK_TAPE) {
        curEvent[1] = TAPE2_ON;
    } else if (debounceVal[1] == 0) {
        curEvent[1] = TAPE2_OFF;
    } else {
        curEvent[1] = lastEvent[1];
    }

    if (debounceVal[2] >= DEBOUNCE_MASK_TAPE) {
        curEvent[2] = TAPE3_ON;
    } else if (debounceVal[2] == 0) {
        curEvent[2] = TAPE3_OFF;
    } else {
        curEvent[2] = lastEvent[2];
    }

    if (debounceVal[3] >= DEBOUNCE_MASK_TAPE) {
        curEvent[3] = TAPE4_ON;
    } else if (debounceVal[3] == 0) {
        curEvent[3] = TAPE4_OFF;
    } else {
        curEvent[3] = lastEvent[3];
    }
    
    if (debounceVal[4] >= DEBOUNCE_MASK_TAPE) {
        curEvent[4] = TAPE5_ON;
    } else if (debounceVal[4] == 0) {
        curEvent[4] = TAPE5_OFF;
    } else {
        curEvent[4] = lastEvent[4];
    }
    
    if (debounceVal[5] >= DEBOUNCE_MASK_TAPE) {
        curEvent[5] = TAPE6_ON;
    } else if (debounceVal[5] == 0) {
        curEvent[5] = TAPE6_OFF;
    } else {
        curEvent[5] = lastEvent[5];
    }

    // loop through events
    for (i = 0; i < NUM_TAPE; i++) {
        if (curEvent[i] != lastEvent[i]) { // check for change from last time
            thisEvent.EventType = curEvent[i];
            thisEvent.EventParam = tapeVal;
            returnVal = TRUE;
            lastEvent[i] = curEvent[i]; // update history
            //PostSillyHSM(thisEvent);
            //PostTapeService(thisEvent);
#ifndef EVENTCHECKER_TEST           // keep this as is for test harness
            PostTapeService(thisEvent);
#else
            SaveEvent(thisEvent);
#endif   
        }
    }



    return (returnVal);
}



/* 
 * The Test Harness for the event checkers is conditionally compiled using
 * the EVENTCHECKER_TEST macro (defined either in the file or at the project level).
 * No other main() can exist within the project.
 * 
 * It requires a valid ES_Configure.h file in the project with the correct events in 
 * the enum, and the correct list of event checkers in the EVENT_CHECK_LIST.
 * 
 * The test harness will run each of your event detectors identically to the way the
 * ES_Framework will call them, and if an event is detected it will print out the function
 * name, event, and event parameter. Use this to test your event checking code and
 * ensure that it is fully functional.
 * 
 * If you are locking up the output, most likely you are generating too many events.
 * Remember that events are detectable changes, not a state in itself.
 * 
 * Once you have fully tested your event checking code, you can leave it in its own
 * project and point to it from your other projects. If the EVENTCHECKER_TEST marco is
 * defined in the project, no changes are necessary for your event checkers to work
 * with your other projects.
 */
#ifdef EVENTCHECKER_TEST
#include <stdio.h>
static uint8_t(*EventList[])(void) = {EVENT_CHECK_LIST};

void PrintEvent(void);

void main(void) {
    BOARD_Init();
    /* user initialization code goes here */
    Silly_Init();

    // Do not alter anything below this line
    int i;

    printf("\r\nEvent checking test harness for %s", __FILE__);

    while (1) {
        if (IsTransmitEmpty()) {
            for (i = 0; i< sizeof (EventList) >> 2; i++) {
                if (EventList[i]() == TRUE) {
                    PrintEvent();
                    break;
                }

            }
        }
    }
}

void PrintEvent(void) {
    printf("\r\nFunc: %s\tEvent: %s\tParam: 0x%X", eventName,
            EventNames[storedEvent.EventType], storedEvent.EventParam);
}
#endif

