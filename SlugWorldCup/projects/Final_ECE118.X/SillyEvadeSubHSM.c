/*******************************************************************************
 * MODULE #INCLUDE                                                             *
 ******************************************************************************/

// put includes!

#include "ES_Configure.h"
#include "ES_Framework.h"
#include "BOARD.h"
#include "SillyHSM.h"
#include "SillyEvadeSubHSM.h"
#include "stdio.h"
#include "ES_Events.h"
#include "Silly.h"

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/

typedef enum {
    InitPSubState,
    DriveForward,
    FirstTurnLeft90,
    FirstTurnRight90,
    FindOppositeWall,
    SecondTurnLeft90,
    SecondTurnRight90,
    BackUp,
    WallBackUp,
    BufferSubState,
} EvadeSHSMState_t;

static const char *StateNames[] = {
	"InitPSubState",
	"DriveForward",
	"FirstTurnLeft90",
	"FirstTurnRight90",
	"FindOppositeWall",
	"SecondTurnLeft90",
	"SecondTurnRight90",
	"BackUp",
	"WallBackUp",
	"BufferSubState",
};

/*******************************************************************************
 * PRIVATE MODULE VARIABLES                                                            *
 ******************************************************************************/
/* You will need MyPriority and the state variable; you may need others as well.
 * The type of state variable should match that of enum in header file. */

static EvadeSHSMState_t CurrentState = InitPSubState;
static uint8_t MyPriority;



#define LEFT    TRUE
#define RIGHT   FALSE


#define TURN_TIMER_TICKS    515
#define SLIGHT_DELAY        300
#define BACK_TIMER_TICKS 600
/*******************************************************************************
 * PUBLIC FUNCTIONS                                                            *
 ******************************************************************************/

/**
 * @Function InitEvadeSSM(uint8_t Priority)
 * @param Priority - internal variable to track which event queue to use
 * @return TRUE or FALSE
 * @brief This will get called by the framework at the beginning of the code
 *        execution. It will post an ES_INIT event to the appropriate event
 *        queue, which will be handled inside RunTemplateFSM function. Remember
 *        to rename this to something appropriate.
 *        Returns TRUE if successful, FALSE otherwise
 */
uint8_t InitEvadeSHSM(void) {
    ES_Event returnEvent;
    CurrentState = InitPSubState;
    returnEvent = RunEvadeSHSM(INIT_EVENT);
    if (returnEvent.EventType == ES_NO_EVENT) {
        return TRUE;
    }
    return FALSE;
}

/**
 * @Function RunTemplateSubHSM(ES_Event ThisEvent)
 * @param ThisEvent - the event (type and param) to be responded.
 * @return Event - return event (type and param), in general should be ES_NO_EVENT
 * @brief This function is where you implement the whole of the heirarchical state
 *        machine, as this is called any time a new event is passed to the event
 *        queue. This function will be called recursively to implement the correct
 *        order for a state transition to be: exit current state -> enter next state
 *        using the ES_EXIT and ES_ENTRY events.
 */

/* TIMERS IN USE: TURN_TIMER 0; EVADE_TIMER 1; DANCE_TIMER 2; STOP_DANCE_TIMER 3
 * 
 * TIMERS IN USE HERE: TURN_TIMER 0; DANCE_TIMER 2; STOP_DANCE_TIMER 3
 */
ES_Event RunEvadeSHSM(ES_Event ThisEvent) {
    uint8_t makeTransition = FALSE; // use to flag transition
    EvadeSHSMState_t nextState; // <- change type to correct enum

    ES_Tattle(); // trace call stack

    switch (CurrentState) {
        case InitPSubState: // If current state is initial Psedudo State
            if (ThisEvent.EventType == ES_INIT)// only respond to ES_Init
            {
                // this is where you would put any actions associated with the
                // transition from the initial pseudo-state into the actual
                // initial state
                //ES_Timer_InitTimer(TURN_90_TIMER, BACK_TIMER_TICKS); 
                //printf("\r\nBACK IT UP: 7");
                nextState = InitPSubState;
                Silly_FullBackward();
                makeTransition = FALSE;
                ThisEvent.EventType = ES_NO_EVENT;
            }
          //  printf("\r\nBACK IT UP: 13");
            if (ThisEvent.EventType == ES_ENTRY)// only respond to ES_Init
            {
                // this is where you would put any actions associated with the
                // transition from the initial pseudo-state into the actual
                // initial state
                
             //   printf("\r\nBACK IT UP: 4");
                Silly_FullBackward();
                nextState = BackUp;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }
            ThisEvent.EventType = ES_NO_EVENT;
            break;


        case BackUp:
          //  printf("\r\nBACK IT UP: 1");
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    ES_Timer_InitTimer(TURN_90_TIMER, BACK_TIMER_TICKS);
                    Silly_FullBackward();
                    ThisEvent.EventType = ES_NO_EVENT;
                 //   printf("\r\nBACK IT UP: 10");
                    nextState = BackUp;
                    break;

                case ES_TIMEOUT:
               //     printf("\r\nBACK IT UP: 3");
                    if (ThisEvent.EventParam == TURN_90_TIMER) {
                        ES_Timer_InitTimer(TURN_90_TIMER, TURN_TIMER_TICKS);
                        if (Silly_StartSide() == LEFT) {
                            nextState = FirstTurnRight90;
                            Silly_TankTurnLeft();
                        } else {
                            nextState = FirstTurnLeft90;

                        }
                 //       printf("\r\nBACK IT UP: 6");
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;

                case ES_EXIT:
                case ES_NO_EVENT:
                default: // all unhandled events pass the event back up to the next level
                    break;
            }
            break;


        case FirstTurnLeft90:
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    ES_Timer_InitTimer(TURN_90_TIMER, TURN_TIMER_TICKS);

                    Silly_TankTurnLeft();
                    ThisEvent.EventType = ES_NO_EVENT;
                    break;

                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == TURN_90_TIMER) {
                        Silly_Stop();

                        nextState = FindOppositeWall;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;

                case ES_EXIT:
                case ES_NO_EVENT:
                default: // all unhandled events pass the event back up to the next level
                    break;
            }
            break;

        case FirstTurnRight90:
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    ES_Timer_InitTimer(TURN_90_TIMER, TURN_TIMER_TICKS);

                    Silly_TankTurnRight();
                    ThisEvent.EventType = ES_NO_EVENT;
                    break;

                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == TURN_90_TIMER) {
                        Silly_Stop();

                        nextState = FindOppositeWall;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;

                case ES_EXIT:
                case ES_NO_EVENT:
                default: // all unhandled events pass the event back up to the next level
                    break;
            }
            break;

        case FindOppositeWall:
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    Silly_FullFoward();
                    ThisEvent.EventType = ES_NO_EVENT;
                    break;

                case FL_BUMPER_ON:
                case FR_BUMPER_ON:
                    Silly_Stop();
                    nextState = WallBackUp;
                    makeTransition = TRUE;
                    ThisEvent.EventType = ES_NO_EVENT;
                    break;

                case ES_EXIT:
                case ES_NO_EVENT:
                default:
                    break;
            }
            break;

        case WallBackUp:
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    Silly_FullBackward();
                    ES_Timer_InitTimer(SHORT_TIMER, SLIGHT_DELAY);
                    ThisEvent.EventType = ES_NO_EVENT;
                    break;
                case ES_TIMEOUT:
                    if (Silly_StartSide() == RIGHT) {
                        nextState = SecondTurnRight90;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    } else {
                        nextState = SecondTurnLeft90;
                        makeTransition = TRUE;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;

            }
            break;

        case SecondTurnLeft90:
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    //ES_Timer_InitTimer(TURN_90_TIMER, TURN_TIMER_TICKS);
                    Silly_TankTurnRight();
                    ThisEvent.EventType = ES_NO_EVENT;
                    break;

                case LIGHT_TURNED_ON:
                    //printf("\r\nLight on");
                    Silly_Stop();
                    nextState = InitPSubState;
                    makeTransition = TRUE;
                    ThisEvent.EventType = AVOID_TRANSITION;
                    //ThisEvent.EventType = ES_NO_EVENT;
                    break;

                case ES_EXIT:
                case ES_NO_EVENT:
                default: // all unhandled events pass the event back up to the next level
                    break;
            }
            break;

        case SecondTurnRight90:
            switch (ThisEvent.EventType) {
                case ES_ENTRY:
                    //ES_Timer_InitTimer(TURN_90_TIMER, TURN_TIMER_TICKS);
                    Silly_TankTurnLeft();
                    ThisEvent.EventType = ES_NO_EVENT;
                    break;

                case LIGHT_TURNED_ON:
                    Silly_Stop();
                    nextState = InitPSubState;
                    makeTransition = TRUE;
                    ThisEvent.EventType = AVOID_TRANSITION;
                    //ThisEvent.EventType = ES_NO_EVENT;
                    break;

                case ES_EXIT:
                case ES_NO_EVENT:
                default: // all unhandled events pass the event back up to the next level
                    break;
            }
            break;
/*
        case BufferSubState:
            printf("\r\nIn Buffer");
            Silly_Stop();
            nextState = BufferSubState;
            makeTransition = TRUE;
            ThisEvent.EventType = AVOID_TRANSITION;
            break;
            */
            /*
                    case DriveForward: 
                        switch (ThisEvent.EventType) {

                            case ES_ENTRY:
                                Silly_FullFoward();
                                ThisEvent.EventType = ES_NO_EVENT;
                                break;

                            case TAPE2_ON:
                            case TAPE4_ON:
                                ES_Timer_InitTimer(BUFFER_TIMER,SLIGHT_DELAY);
                                ThisEvent.EventType = ES_NO_EVENT;
                                break;

                            case ES_TIMEOUT:
                                if (ThisEvent.EventParam == BUFFER_TIMER) {
                                    Silly_Stop();
                                    nextState = ShootingState;
                                    makeTransition = TRUE;
                                    ThisEvent.EventType = ES_NO_EVENT;
                                }
                                break;

                            case ES_EXIT:
                            case ES_NO_EVENT:
                            default:
                                break;
                        }
                        break;
             */
        default:
            break;
    }

    if (makeTransition == TRUE) {
        // making a state transition, send EXIT and ENTRY
        // recursively call the current state with an exit event
        RunEvadeSHSM(EXIT_EVENT);
        CurrentState = nextState;
        RunEvadeSHSM(ENTRY_EVENT);

    }

    ES_Tail(); // trace call stack end
    return ThisEvent;
}

/*******************************************************************************
 * PRIVATE FUNCTIONS                                                           *
 ******************************************************************************/


