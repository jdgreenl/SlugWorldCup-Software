/*
 * File: SillyHSM.c
 * Author: James Greenleaf
 * Partners: Katherine & Victor
 *
 * Primary HSM for ECE 118 Introduction to Mechatronics UCSC Spring 2023
 *
 * SillyEvadeSubHSM Authors: Victor & James
 * 					
 *
 * This is provided as an example and a good place to start.
 *
 * History
 * When           Who     What/Why
 * -------------- ---     --------
 * 09/13/13 15:17 ghe      added tattletail functionality and recursive calls
 * 01/15/12 11:12 jec      revisions for Gen2 framework
 * 11/07/11 11:26 jec      made the queue static
 * 10/30/11 17:59 jec      fixed references to CurrentEvent in RunTemplateSM()
 * 10/23/11 18:20 jec      began conversion from SMTemplate.c (02/20/07 rev)
 */


/*******************************************************************************
 * MODULE #INCLUDE                                                             *
 ******************************************************************************/

#include "ES_Configure.h"
#include "ES_Framework.h"
#include "BOARD.h"
#include "SillyHSM.h"
//#include "HidingSubHSM.h" //#include all sub state machines called
//#include "DancingSubHSM.h"

#include "Silly.h"
#include "roach.h"
#include "stdio.h"
#include "ES_Events.h"
#include "SillyEvadeSubHSM.h"

/*******************************************************************************
 * PRIVATE #DEFINES                                                            *
 ******************************************************************************/
//Include any defines you need to do
#define BACK_UP_TIMER_TICKS 500
#define DANCING_TIMER_TICKS 7000
#define SHOOTING_TIMER_TICKS 500
#define RELOADING_TIMER_TICKS 3500
#define AIM_OVERFLOW_TIMER_TICKS 2000
#define TURN_90_TIMER_TICKS 563
#define BUFFER_TIMER_TICKS 30
#define SHORT_TIMER_TICKS 600
#define AVOID_TIMER_TICKS 700
#define SHORT_SHOOTING_TIMER_TICKS 400
#define SHOOTING_TWO_TIMER_TICKS 200
#define AIMING_TIMER_TICKS 200
#define BAIL_OUT_TIMER_TICKS 5000

#define FULL_FORWARD 100
#define SLOWER 85
#define FULL_BACK -100
#define SLOW_BACK -40

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/


typedef enum {
    InitPState,
    OrientateState,
    DriveForwardState,
    BackUpState,
    AvoidenceState,
    ShootingState,
    ReloadState,
    BufferState,
    TwoPointState,
    ObjectReloadState,
    AimingState,
    AimingBufState,
    AimingOverflowState,
    BailOutState,
    BailOutOrientateState,
    BailOutBackUpState,
} SillyHSMState_t;

static const char *StateNames[] = {
	"InitPState",
	"OrientateState",
	"DriveForwardState",
	"BackUpState",
	"AvoidenceState",
	"ShootingState",
	"ReloadState",
	"BufferState",
	"TwoPointState",
	"ObjectReloadState",
	"AimingState",
	"AimingBufState",
	"AimingOverflowState",
	"BailOutState",
	"BailOutOrientateState",
	"BailOutBackUpState",
};


/*******************************************************************************
 * PRIVATE FUNCTION PROTOTYPES                                                 *
 ******************************************************************************/
/* Prototypes for private functions for this machine. They should be functions
   relevant to the behavior of this state machine
   Example: char RunAway(uint_8 seconds);*/

/*******************************************************************************
 * PRIVATE MODULE VARIABLES                                                            *
 ******************************************************************************/
/* You will need MyPriority and the state variable; you may need others as well.
 * The type of state variable should match that of enum in header file. */

static SillyHSMState_t CurrentState = InitPState; // <- change enum name to match ENUM
static uint8_t MyPriority;
static uint16_t TapeCrossed;
static uint16_t TapeCrossedBack;
static uint16_t BeaconDetected;
static uint16_t MinSpecObject = FALSE;
static int tapestuff;
/*******************************************************************************
 * PUBLIC FUNCTIONS                                                            *
 ******************************************************************************/

/**
 * @Function InitTemplateHSM(uint8_t Priority)
 * @param Priority - internal variable to track which event queue to use
 * @return TRUE or FALSE
 * @brief This will get called by the framework at the beginning of the code
 *        execution. It will post an ES_INIT event to the appropriate event
 *        queue, which will be handled inside RunTemplateFSM function. Remember
 *        to rename this to something appropriate.
 *        Returns TRUE if successful, FALSE otherwise
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t InitSillyHSM(uint8_t Priority) {
    MyPriority = Priority;
    // put us into the Initial PseudoState
    CurrentState = InitPState;
    // post the initial transition event
    if (ES_PostToService(MyPriority, INIT_EVENT) == TRUE) {
        return TRUE;
    } else {
        return FALSE;
    }
}

/**
 * @Function PostTemplateHSM(ES_Event ThisEvent)
 * @param ThisEvent - the event (type and param) to be posted to queue
 * @return TRUE or FALSE
 * @brief This function is a wrapper to the queue posting function, and its name
 *        will be used inside ES_Configure to point to which queue events should
 *        be posted to. Remember to rename to something appropriate.
 *        Returns TRUE if successful, FALSE otherwise
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t PostSillyHSM(ES_Event ThisEvent) {
    return ES_PostToService(MyPriority, ThisEvent);
}

/**
 * @Function RunTemplateHSM(ES_Event ThisEvent)
 * @param ThisEvent - the event (type and param) to be responded.
 * @return Event - return event (type and param), in general should be ES_NO_EVENT
 * @brief This function is where you implement the whole of the heirarchical state
 *        machine, as this is called any time a new event is passed to the event
 *        queue. This function will be called recursively to implement the correct
 *        order for a state transition to be: exit current state -> enter next state
 *        using the ES_EXIT and ES_ENTRY events.
 * @note Remember to rename to something appropriate.
 *       The lower level state machines are run first, to see if the event is dealt
 *       with there rather than at the current level. ES_EXIT and ES_ENTRY events are
 *       not consumed as these need to pass pack to the higher level state machine.
 * @author J. Edward Carryer, 2011.10.23 19:25
 * @author Gabriel H Elkaim, 2011.10.23 19:25 */
ES_Event RunSillyHSM(ES_Event ThisEvent) {
    uint8_t makeTransition = FALSE; // use to flag transition
    SillyHSMState_t nextState; // <- change type to correct enum
    
    uint8_t BailOutFlag = FALSE;
    ES_Tattle(); // trace call stack



    //CurrentState = BailOutState;
    switch (CurrentState) {
        case InitPState: // If current state is initial Pseudo State
            if (ThisEvent.EventType == ES_INIT)// only respond to ES_Init
            {
                // this is where you would put any actions associated with the
                // transition from the initial pseudo-state into the actual
                // initial state
                // Initialize all sub-state machines
                //InitHidingSubHSM();
                //InitDancingSubHSM();
                // now put the machine into the actual initial state
                //StopMotors();
                Silly_StartSide();
                Silly_Shooting(FALSE);
                InitEvadeSHSM();
                Silly_Stop();
                nextState = BufferState;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }
            break;

        case BufferState:
            Silly_Stop();
            TapeCrossed = 0;
            TapeCrossedBack = 0;
            tapestuff = 3;
            MinSpecObject = FALSE;
            Silly_Shooting(FALSE);
            //ES_Timer_InitTimer(BUFFER_TIMER, BUFFER_TIMER_TICKS);
            if (ThisEvent.EventType == BATTERY_CONNECTED) {

                ES_Timer_InitTimer(BUFFER_TIMER, BUFFER_TIMER_TICKS);
                nextState = BufferState;
            }
            if (ThisEvent.EventType == ES_TIMEOUT && ThisEvent.EventParam == BUFFER_TIMER) {
                nextState = OrientateState;
                printf("\r\nSide: %d", Silly_StartSide());
                //ES_Timer_InitTimer(TURN_90_TIMER, TURN_90_TIMER_TICKS);
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }
            if (ThisEvent.EventType == BATTERY_DISCONNECTED) {
                nextState = BufferState;
                makeTransition = FALSE;
                ThisEvent.EventType = ES_NO_EVENT;
            }
            if (ThisEvent.EventType == ES_EXIT) {
                ES_Timer_InitTimer(BAILOUT_TIMER, BAIL_OUT_TIMER_TICKS);
            }
            ThisEvent.EventType = ES_NO_EVENT;
            break;


        case OrientateState:
            //ThisEvent = RunHidingSubHSM(ThisEvent); // for bump in dark
            Silly_TankTurnSideAlt();
            /* turn timer
            if(ThisEvent.EventType == ES_TIMEOUT){
                ES_Timer_InitTimer(BUFFER_TIMER, BUFFER_TIMER_TICKS);
                nextState = BufferState;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }
             */
            if (ThisEvent.EventType == LIGHT_TURNED_ON) {
                //printf("\r\n***SILLYSILLYSILLYSILLY***: %d", BeaconDetected);
                nextState = DriveForwardState;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }
            if (ThisEvent.EventType == BATTERY_DISCONNECTED) {
                nextState = BufferState;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }
            ThisEvent.EventType = ES_NO_EVENT;
            break;



        case DriveForwardState:
            Silly_FullFoward();
            
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    ES_Timer_InitTimer(BAILOUT_TIMER, SHORT_TIMER_TICKS);
                    break;
                    
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == BAILOUT_TIMER){
                        tapestuff = 2;
                    }
                    
                    break;
                    
                case TAPE1_ON:
                    TapeCrossed++;
                    printf("\r\nCenter tape crossed: %d", TapeCrossed);
                    nextState = DriveForwardState;

                    if (TapeCrossed >= tapestuff) {
                        //Silly_Shooting(TRUE);
                        Silly_Stop();
                        TapeCrossed = 0;
                        //ES_Timer_InitTimer(SHOOTING_TIMER, SHOOTING_TIMER_TICKS);
                        nextState = AimingBufState;
                        makeTransition = TRUE;
                    } else {
                        nextState = DriveForwardState;
                        makeTransition = FALSE;
                    }

                    break;
                case TAPE4_ON:
                    TapeCrossedBack++;
                    printf("\r\nBack tape crossed: %d", TapeCrossedBack);
                    if (TapeCrossedBack >= 2) {//TapeCrossed >= 2 && 
                        TapeCrossed = 0;
                        TapeCrossedBack = 0;

                        nextState = AimingBufState;
                        makeTransition = TRUE;
                    } else {
                        nextState = DriveForwardState;
                        makeTransition = FALSE;
                    }
                    break;
                case FR_BUMPER_ON:
                    Silly_FullBackward();
                    TapeCrossed = 0;
                    TapeCrossedBack = 0;
                    nextState = BackUpState;
                    makeTransition = TRUE;;
                    break;
                case FL_BUMPER_ON:
                    Silly_FullBackward();
                    TapeCrossed = 0;
                    TapeCrossedBack = 0;
                    nextState = BackUpState;
                    makeTransition = TRUE;
                    break;
                case BATTERY_DISCONNECTED:
                    nextState = BufferState;
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT;
                    break;
                    /*
                    ES_Timer_InitTimer(BACK_UP_TIMER, BACK_UP_TIMER_TICKS);
                    nextState = BackUpLState;
                    makeTransition = TRUE;
                    break;
                case FR_BUMPER_ON:
                    ES_Timer_InitTimer(BACK_UP_TIMER, BACK_UP_TIMER_TICKS);
                    nextState = BackUpRState;
                    makeTransition = TRUE;
                    break;
                case ES_TIMEOUT:
                    ES_Timer_InitTimer(DANCE_BREAK_TIMER, DANCING_STATE_TIMER_TICKS);
                    nextState = DancingState;
                    makeTransition = TRUE;
                    break;*/
            }
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case AimingBufState:
            if (ThisEvent.EventType == ES_ENTRY) {
                ES_Timer_InitTimer(SHORT_TIMER, AIMING_TIMER_TICKS);
                ES_Timer_InitTimer(AIM_TIMER, AIM_OVERFLOW_TIMER_TICKS);
                Silly_TankTurnSideAlt();
            }
            if (ThisEvent.EventType == ES_TIMEOUT && ThisEvent.EventParam == SHORT_TIMER) {
                nextState = AimingState;
                makeTransition = TRUE;
            }


            if (ThisEvent.EventType == BATTERY_DISCONNECTED) {
                nextState = BufferState;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }

            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case AimingState:
            if(ThisEvent.EventType == ES_ENTRY){
                ES_Timer_InitTimer(AIM_TIMER, AIM_OVERFLOW_TIMER_TICKS);
            }
            if (ThisEvent.EventType == AIM_TURNED_ON) {
                Silly_Stop();
                Silly_Shooting(TRUE);
                Silly_Stop();
                ES_Timer_InitTimer(SHOOTING_TIMER, SHOOTING_TIMER_TICKS);
                nextState = ShootingState;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }
            if (ThisEvent.EventType == ES_TIMEOUT && ThisEvent.EventParam == AIM_TIMER) {
                nextState = AimingOverflowState;
                makeTransition = TRUE;
            }

            if (ThisEvent.EventType == BATTERY_DISCONNECTED) {
                nextState = BufferState;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }
            ThisEvent.EventType = ES_NO_EVENT;
            break;


        case AimingOverflowState:
            if (ThisEvent.EventType == LIGHT_TURNED_ON) {
                Silly_Stop();
                Silly_Shooting(TRUE);
                Silly_Stop();
                ES_Timer_InitTimer(SHOOTING_TIMER, SHOOTING_TIMER_TICKS);
                nextState = ShootingState;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }

            if (ThisEvent.EventType == BATTERY_DISCONNECTED) {
                nextState = BufferState;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }
            ThisEvent.EventType = ES_NO_EVENT;
            break;



        case ShootingState:
            //ThisEvent = RunHidingSubHSM(ThisEvent); // for bump in dark
            Silly_Stop();
            Silly_Shooting(TRUE);

            if (ThisEvent.EventType == ES_TIMEOUT && ThisEvent.EventParam == SHOOTING_TIMER) {
                ES_Timer_InitTimer(SHORT_TIMER, SHOOTING_TWO_TIMER_TICKS);
                Silly_Shooting(FALSE);
                Silly_FullBackward();
                nextState = BackUpState;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }

            if (ThisEvent.EventType == BATTERY_DISCONNECTED) {
                nextState = BufferState;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case BackUpState:
            Silly_Shooting(FALSE);
            if (ThisEvent.EventType != ES_EXIT) {
                Silly_FullBackward();
            }

            if (ThisEvent.EventType == TAPE1_ON) {
                TapeCrossed++;
                printf("\r\nCenter tape crossed: %d", TapeCrossed);
                nextState = BackUpState;
                if (TapeCrossed >= 3) {
                    TapeCrossed = 0;
                    TapeCrossedBack = 0;
                    if (MinSpecObject == FALSE) {
                        ES_Timer_InitTimer(RELOADING_TIMER, RELOADING_TIMER_TICKS);
                        nextState = ReloadState;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;

                    } else if (MinSpecObject == TRUE) {
                        if (Silly_StartSide() == TRUE) {
                            Silly_TankTurnLeft();
                        } else {
                            Silly_TankTurnRight();
                        }
                        printf("\r\nTURN 90");
                        ES_Timer_InitTimer(TURN_90_TIMER, TURN_90_TIMER_TICKS);
                        nextState = ObjectReloadState;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                } else {
                    nextState = BackUpState;
                    makeTransition = FALSE;
                }

                break;
            }
            if (ThisEvent.EventType == RR_BUMPER_ON) {
                if (MinSpecObject == FALSE) {
                    Silly_Stop();
                    ES_Timer_InitTimer(RELOADING_TIMER, RELOADING_TIMER_TICKS);
                    nextState = ReloadState;
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT;
                } else if (MinSpecObject == TRUE) {
                    if (Silly_StartSide() == TRUE) {
                        Silly_TankTurnLeft();
                    } else {
                        Silly_TankTurnRight();
                    }
                    ES_Timer_InitTimer(TURN_90_TIMER, TURN_90_TIMER_TICKS);
                    nextState = ObjectReloadState;
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT;
                }
            }
            if (ThisEvent.EventType == RL_BUMPER_ON) {
                //Silly_Stop();
                if (MinSpecObject == FALSE) {
                    Silly_Stop();
                    ES_Timer_InitTimer(RELOADING_TIMER, RELOADING_TIMER_TICKS);
                    nextState = ReloadState;
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT;
                } else if (MinSpecObject == TRUE) {
                    if (Silly_StartSide() == TRUE) {
                        printf("\r\nTURN LEFT");
                        Silly_TankTurnLeft();
                    } else {
                        printf("\r\nTURN RIGhT");
                        Silly_TankTurnRight();
                    }

                    ES_Timer_InitTimer(TURN_90_TIMER, TURN_90_TIMER_TICKS);
                    nextState = ObjectReloadState;
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT;
                }
            }
            if (ThisEvent.EventType == BATTERY_DISCONNECTED) {
                nextState = BufferState;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }
            if (ThisEvent.EventType == ES_TIMEOUT) {
                Silly_Shooting(TRUE);
                ES_Timer_InitTimer(SHOOTING_TIMER, SHORT_SHOOTING_TIMER_TICKS);
                nextState = TwoPointState;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case TwoPointState:
            Silly_Stop();
            Silly_Shooting(TRUE);
            if (ThisEvent.EventType == ES_TIMEOUT && ThisEvent.EventParam == SHOOTING_TIMER) {
                Silly_Shooting(FALSE);
                Silly_FullBackward();
                nextState = BackUpState;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }
            if (ThisEvent.EventType == BATTERY_DISCONNECTED) {
                nextState = BufferState;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case ReloadState:
            Silly_Stop();
            tapestuff = 3;
            if (ThisEvent.EventType == ES_TIMEOUT) {
                //Silly_TankTurnRight();
                //ES_Timer_InitTimer(BUFFER_TIMER, BUFFER_TIMER_TICKS);
                TapeCrossed = 0;
                TapeCrossedBack = 0;
                nextState = DriveForwardState;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }
            if (ThisEvent.EventType == BATTERY_DISCONNECTED) {
                nextState = BufferState;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case ObjectReloadState:
            if (ThisEvent.EventType == ES_TIMEOUT && ThisEvent.EventParam == TURN_90_TIMER) {
                ES_Timer_InitTimer(SHORT_TIMER, AVOID_TIMER_TICKS);
                ThisEvent.EventType = ES_NO_EVENT;
                Silly_FullFoward();
            }
            if (ThisEvent.EventType == ES_TIMEOUT && ThisEvent.EventParam == SHORT_TIMER) {
                ThisEvent.EventType = ES_NO_EVENT;
                ES_Timer_InitTimer(RELOADING_TIMER, RELOADING_TIMER_TICKS);
                Silly_Stop();
                //nextState = BufferState;
                //makeTransition = TRUE;
            }
            if (ThisEvent.EventType == ES_TIMEOUT && ThisEvent.EventParam == RELOADING_TIMER) {
                ThisEvent.EventType = ES_NO_EVENT;
                Silly_Stop();
                ES_Timer_InitTimer(BUFFER_TIMER, BUFFER_TIMER_TICKS);
                nextState = BufferState;
                makeTransition = TRUE;
            }
            if (ThisEvent.EventType == BATTERY_DISCONNECTED) {
                nextState = BufferState;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }

            ThisEvent.EventType = ES_NO_EVENT;
            break;


        case AvoidenceState:
            ThisEvent = RunEvadeSHSM(ThisEvent);
            //ThisEvent.EventType = ES_NO_EVENT;
            if (ThisEvent.EventType == AVOID_TRANSITION) {
                nextState = DriveForwardState;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }

            if (ThisEvent.EventType == BATTERY_DISCONNECTED) {
                nextState = BufferState;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }
            ThisEvent.EventType = ES_NO_EVENT;
            break;


        case BailOutState:
            //Silly_FullBackward();
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    printf("Bail out Post");
                    Silly_FullBackward();
                    ES_Timer_InitTimer(BACK_UP_TIMER, SHORT_TIMER_TICKS);
                    break;
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == BACK_UP_TIMER) {
                        Silly_TankTurnSide();
                        nextState = BailOutOrientateState;
                        makeTransition = TRUE;
                    }
                    break;
            }
            if (ThisEvent.EventType == BATTERY_DISCONNECTED) {
                nextState = BufferState;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }
            ThisEvent.EventType = ES_NO_EVENT;
            break;


        case BailOutOrientateState:
            //Silly_TankTurnSide();
            if (ThisEvent.EventType == LIGHT_TURNED_ON) {
                Silly_FullBackward();
                nextState = BailOutBackUpState;
                makeTransition = TRUE;
            }
            if (ThisEvent.EventType == BATTERY_DISCONNECTED) {
                nextState = BufferState;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }
            ThisEvent.EventType = ES_NO_EVENT;
            break;

        case BailOutBackUpState:
            switch (ThisEvent.EventType) {
                case RR_BUMPER_ON:
                case RL_BUMPER_ON:
                    Silly_Stop();
                    ES_Timer_InitTimer(BUFFER_TIMER, BUFFER_TIMER_TICKS);
                    nextState = BufferState;
                    makeTransition = TRUE;
                    break;

            }
            if (ThisEvent.EventType == BATTERY_DISCONNECTED) {
                nextState = BufferState;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }
            ThisEvent.EventType = ES_NO_EVENT;
            break;




        default: // all unhandled states fall into here
            break;
    } // end switch on Current State




    if (makeTransition == TRUE) { // making a state transition, send EXIT and ENTRY
        //ES_Timer_InitTimer(BAILOUT_TIMER, BAIL_OUT_TIMER_TICKS);
        // recursively call the current state with an exit event
        RunSillyHSM(EXIT_EVENT); // <- rename to your own Run function
        CurrentState = nextState;
        RunSillyHSM(ENTRY_EVENT); // <- rename to your own Run function
    }

    ES_Tail(); // trace call stack end
    return ThisEvent;
}

