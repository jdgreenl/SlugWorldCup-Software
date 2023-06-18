/****************************************************************************
 Module
     ES_Configure.h
 Description
     This file contains macro definitions that are edited by the user to
     adapt the Events and Services framework to a particular application.
 Notes
     
 History
 When           Who     What/Why
 -------------- ---     --------
 01/15/12 10:03 jec      started coding
 *****************************************************************************/

#ifndef CONFIGURE_H
#define CONFIGURE_H

#include "SillyEventChecker.h"




//defines for keyboard input
//#define USE_KEYBOARD_INPUT
//What State machine are we testing
//#define POSTFUNCTION_FOR_KEYBOARD_INPUT PostTemplateHSM
//#include "SillyEventChecker.h"
//define for TattleTale
#define USE_TATTLETALE

//uncomment to supress the entry and exit events
//#define SUPPRESS_EXIT_ENTRY_IN_TATTLE

/****************************************************************************/
// Name/define the events of interest
// Universal events occupy the lowest entries, followed by user-defined events

/****************************************************************************/
typedef enum {
    ES_NO_EVENT, ES_ERROR, /* used to indicate an error from the service */
    ES_INIT, /* used to transition from initial pseudo-state */
    ES_ENTRY, /* used to enter a state*/
    ES_EXIT, /* used to exit a state*/
    ES_KEYINPUT, /* used to signify a key has been pressed*/
    ES_LISTEVENTS, /* used to list events in keyboard input, does not get posted to fsm*/
    ES_TIMEOUT, /* signals that the timer has expired */
    ES_TIMERACTIVE, /* signals that a timer has become active */
    ES_TIMERSTOPPED, /* signals that a timer has stopped*/
    /* User-defined events start here */
    // lights
    LIGHT_TURNED_ON,
    LIGHT_TURNED_OFF,
    AIM_TURNED_ON,
    AIM_TURNED_OFF,
    // bumpers
    FL_BUMPER_ON,
    FL_BUMPER_OFF,
    FR_BUMPER_ON,
    FR_BUMPER_OFF,
    RL_BUMPER_ON,
    RL_BUMPER_OFF,
    RR_BUMPER_ON,
    RR_BUMPER_OFF,

    // Tape Sensors
    TAPE1_ON,
    TAPE1_OFF,
    TAPE2_ON,
    TAPE2_OFF,
    TAPE3_ON,
    TAPE3_OFF,
    TAPE4_ON,
    TAPE4_OFF,
    TAPE5_ON,
    TAPE5_OFF,
    TAPE6_ON,
    TAPE6_OFF,

    AVOID_TRANSITION,

    BATTERY_CONNECTED,
    BATTERY_DISCONNECTED,
    NUMBEROFEVENTS,
} ES_EventTyp_t;

static const char *EventNames[] = {
	"ES_NO_EVENT",
	"ES_ERROR",
	"ES_INIT",
	"ES_ENTRY",
	"ES_EXIT",
	"ES_KEYINPUT",
	"ES_LISTEVENTS",
	"ES_TIMEOUT",
	"ES_TIMERACTIVE",
	"ES_TIMERSTOPPED",
	"LIGHT_TURNED_ON",
	"LIGHT_TURNED_OFF",
	"AIM_TURNED_ON",
	"AIM_TURNED_OFF",
	"FL_BUMPER_ON",
	"FL_BUMPER_OFF",
	"FR_BUMPER_ON",
	"FR_BUMPER_OFF",
	"RL_BUMPER_ON",
	"RL_BUMPER_OFF",
	"RR_BUMPER_ON",
	"RR_BUMPER_OFF",
	"TAPE1_ON",
	"TAPE1_OFF",
	"TAPE2_ON",
	"TAPE2_OFF",
	"TAPE3_ON",
	"TAPE3_OFF",
	"TAPE4_ON",
	"TAPE4_OFF",
	"TAPE5_ON",
	"TAPE5_OFF",
	"TAPE6_ON",
	"TAPE6_OFF",
	"AVOID_TRANSITION",
	"BATTERY_CONNECTED",
	"BATTERY_DISCONNECTED",
	"NUMBEROFEVENTS",
};




/****************************************************************************/
// This are the name of the Event checking function header file.
#define EVENT_CHECK_HEADER "SillyEventChecker.h"

/****************************************************************************/
// This is the list of event checking functions
#define EVENT_CHECK_LIST  SillyCheckLight, SillyCheckAim

/****************************************************************************/
// These are the definitions for the post functions to be executed when the
// corresponding timer expires. All 16 must be defined. If you are not using
// a timers, then you can use TIMER_UNUSED
#define TIMER_UNUSED ((pPostFunc)0)
#define TIMER0_RESP_FUNC PostBatteryService
#define TIMER1_RESP_FUNC PostBumperService
#define TIMER2_RESP_FUNC PostTapeService //
#define TIMER3_RESP_FUNC PostSillyHSM
#define TIMER4_RESP_FUNC PostSillyHSM
#define TIMER5_RESP_FUNC PostSillyHSM//Post2kBeaconService //PostSillyHSM
#define TIMER6_RESP_FUNC PostSillyHSM
#define TIMER7_RESP_FUNC PostSillyHSM
#define TIMER8_RESP_FUNC PostSillyHSM
#define TIMER9_RESP_FUNC PostSillyHSM
#define TIMER10_RESP_FUNC PostSillyHSM
#define TIMER11_RESP_FUNC TIMER_UNUSED
#define TIMER12_RESP_FUNC TIMER_UNUSED
#define TIMER13_RESP_FUNC TIMER_UNUSED
#define TIMER14_RESP_FUNC TIMER_UNUSED
#define TIMER15_RESP_FUNC TIMER_UNUSED


/****************************************************************************/
// Give the timer numbers symbolc names to make it easier to move them
// to different timers if the need arises. Keep these definitons close to the
// definitions for the response functions to make it easire to check that
// the timer number matches where the timer event will be routed

#define GENERIC_NAMED_TIMER 0 /*make sure this is enabled above and posting to the correct state machine*/
#define SIMPLE_SERVICE_TIMER 0
#define BUMPER_DEBOUNCE_TIMER 1
#define TAPE_DEBOUNCE_TIMER 2
#define BUMP_RESPONSE_TIMER 3
#define SHOOTING_TIMER 4
#define RELOADING_TIMER 5
#define TURN_90_TIMER 6
#define BUFFER_TIMER 7
#define SHORT_TIMER 8
#define BACK_UP_TIMER 9
#define BAILOUT_TIMER 10
#define AIM_TIMER 11
/****************************************************************************/
// The maximum number of services sets an upper bound on the number of 
// services that the framework will handle. Reasonable values are 8 and 16
// HOWEVER: at this time only a value of 8 is supported.
#define MAX_NUM_SERVICES 8

/****************************************************************************/
// This macro determines that nuber of services that are *actually* used in
// a particular application. It will vary in value from 1 to MAX_NUM_SERVICES
#define NUM_SERVICES 5

/****************************************************************************/
// These are the definitions for Service 0, the lowest priority service
// every Events and Services application must have a Service 0. Further 
// services are added in numeric sequence (1,2,3,...) with increasing 
// priorities
// the header file with the public fuction prototypes
#define SERV_0_HEADER "ES_KeyboardInput.h"
// the name of the Init function
#define SERV_0_INIT InitKeyboardInput
// the name of the run function
#define SERV_0_RUN RunKeyboardInput
// How big should this service's Queue be?
#define SERV_0_QUEUE_SIZE 9

/****************************************************************************/
// These are the definitions for Service 1
#if NUM_SERVICES > 1
// the header file with the public fuction prototypes
#define SERV_1_HEADER "SillyServiceBattery.h"
// the name of the Init function
#define SERV_1_INIT InitBatteryService
// the name of the run function
#define SERV_1_RUN RunBatteryService
// How big should this services Queue be?
#define SERV_1_QUEUE_SIZE 3
#endif

// These are the definitions for Service 2
#if NUM_SERVICES > 2
// the header file with the public fuction prototypes
#define SERV_2_HEADER "SillyServiceBumper.h"
// the name of the Init function
#define SERV_2_INIT InitBumperService
// the name of the run function
#define SERV_2_RUN RunBumperService
// How big should this services Queue be?
#define SERV_2_QUEUE_SIZE 4
#endif



/****************************************************************************/
// These are the definitions for Service 3
#if NUM_SERVICES > 3
// the header file with the public fuction prototypes
#define SERV_3_HEADER "SillyServiceTape.h"
// the name of the Init function
#define SERV_3_INIT InitTapeService
// the name of the run function
#define SERV_3_RUN RunTapeService
// How big should this services Queue be?
#define SERV_3_QUEUE_SIZE 5
#endif

/****************************************************************************/
// These are the definitions for Service 4
#if NUM_SERVICES > 4
// the header file with the public fuction prototypes
#define SERV_4_HEADER "SillyHSM.h" 
// the name of the Init function
#define SERV_4_INIT InitSillyHSM
// the name of the run function
#define SERV_4_RUN RunSillyHSM
// How big should this services Queue be?
#define SERV_4_QUEUE_SIZE 3
#endif

/****************************************************************************/
// These are the definitions for Service 5
#if NUM_SERVICES > 5
// the header file with the public fuction prototypes
#define SERV_5_HEADER "SillyEvadeSub.h"
// the name of the Init function
#define SERV_5_INIT InitEvadeSHSM
// the name of the run function
#define SERV_5_RUN Post2kBeaconService
// How big should this services Queue be?
#define SERV_5_QUEUE_SIZE 5
#endif
 
/****************************************************************************/
// These are the definitions for Service 6
#if NUM_SERVICES > 6
// the header file with the public fuction prototypes
#define SERV_6_HEADER "TestService.h"
// the name of the Init function
#define SERV_6_INIT TestServiceInit
// the name of the run function
#define SERV_6_RUN TestServiceRun
// How big should this services Queue be?
#define SERV_6_QUEUE_SIZE 3
#endif

/****************************************************************************/
// These are the definitions for Service 7
#if NUM_SERVICES > 7
// the header file with the public fuction prototypes
#define SERV_7_HEADER "TestService.h"
// the name of the Init function
#define SERV_7_INIT TestServiceInit
// the name of the run function
#define SERV_7_RUN TestServiceRun
// How big should this services Queue be?
#define SERV_7_QUEUE_SIZE 3
#endif

/****************************************************************************/
// the name of the posting function that you want executed when a new 
// keystroke is detected.
// The default initialization distributes keystrokes to all state machines
#define POST_KEY_FUNC ES_PostAll



/****************************************************************************/
// These are the definitions for the Distribution lists. Each definition
// should be a comma seperated list of post functions to indicate which
// services are on that distribution list.
#define NUM_DIST_LISTS 0
#if NUM_DIST_LISTS > 0 
#define DIST_LIST0 PostTemplateFSM
#endif
#if NUM_DIST_LISTS > 1 
#define DIST_LIST1 PostTemplateFSM
#endif
#if NUM_DIST_LISTS > 2 
#define DIST_LIST2 PostTemplateFSM
#endif
#if NUM_DIST_LISTS > 3 
#define DIST_LIST3 PostTemplateFSM
#endif
#if NUM_DIST_LISTS > 4 
#define DIST_LIST4 PostTemplateFSM
#endif
#if NUM_DIST_LISTS > 5 
#define DIST_LIST5 PostTemplateFSM
#endif
#if NUM_DIST_LISTS > 6 
#define DIST_LIST6 PostTemplateFSM
#endif
#if NUM_DIST_LISTS > 7 
#define DIST_LIST7 PostTemplateFSM
#endif



#endif /* CONFIGURE_H */

