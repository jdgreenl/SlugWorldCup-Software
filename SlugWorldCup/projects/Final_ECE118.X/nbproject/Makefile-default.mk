#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Final_ECE118.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Final_ECE118.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/AD.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/BOARD.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/IO_Ports.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/LED.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/pwm.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/serial.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/timers.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/roach.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_CheckEvents.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_Framework.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_PostList.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_Queue.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_TattleTale.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_Timers.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_KeyboardInput.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/Silly.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyServiceBattery.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyServiceBumper.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyEventChecker.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/ES_Run.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyServiceTape.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyHSM.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyService2kBeacon.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyEvadeSubHSM.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1959175648/AD.o ${OBJECTDIR}/_ext/1959175648/BOARD.o ${OBJECTDIR}/_ext/1959175648/IO_Ports.o ${OBJECTDIR}/_ext/1959175648/LED.o ${OBJECTDIR}/_ext/1959175648/pwm.o ${OBJECTDIR}/_ext/1959175648/serial.o ${OBJECTDIR}/_ext/1959175648/timers.o ${OBJECTDIR}/_ext/1959175648/roach.o ${OBJECTDIR}/_ext/1959175648/ES_CheckEvents.o ${OBJECTDIR}/_ext/1959175648/ES_Framework.o ${OBJECTDIR}/_ext/1959175648/ES_PostList.o ${OBJECTDIR}/_ext/1959175648/ES_Queue.o ${OBJECTDIR}/_ext/1959175648/ES_TattleTale.o ${OBJECTDIR}/_ext/1959175648/ES_Timers.o ${OBJECTDIR}/_ext/1959175648/ES_KeyboardInput.o ${OBJECTDIR}/_ext/786934795/Silly.o ${OBJECTDIR}/_ext/786934795/SillyServiceBattery.o ${OBJECTDIR}/_ext/786934795/SillyServiceBumper.o ${OBJECTDIR}/_ext/786934795/SillyEventChecker.o ${OBJECTDIR}/_ext/786934795/ES_Run.o ${OBJECTDIR}/_ext/786934795/SillyServiceTape.o ${OBJECTDIR}/_ext/786934795/SillyHSM.o ${OBJECTDIR}/_ext/786934795/SillyService2kBeacon.o ${OBJECTDIR}/_ext/786934795/SillyEvadeSubHSM.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1959175648/AD.o.d ${OBJECTDIR}/_ext/1959175648/BOARD.o.d ${OBJECTDIR}/_ext/1959175648/IO_Ports.o.d ${OBJECTDIR}/_ext/1959175648/LED.o.d ${OBJECTDIR}/_ext/1959175648/pwm.o.d ${OBJECTDIR}/_ext/1959175648/serial.o.d ${OBJECTDIR}/_ext/1959175648/timers.o.d ${OBJECTDIR}/_ext/1959175648/roach.o.d ${OBJECTDIR}/_ext/1959175648/ES_CheckEvents.o.d ${OBJECTDIR}/_ext/1959175648/ES_Framework.o.d ${OBJECTDIR}/_ext/1959175648/ES_PostList.o.d ${OBJECTDIR}/_ext/1959175648/ES_Queue.o.d ${OBJECTDIR}/_ext/1959175648/ES_TattleTale.o.d ${OBJECTDIR}/_ext/1959175648/ES_Timers.o.d ${OBJECTDIR}/_ext/1959175648/ES_KeyboardInput.o.d ${OBJECTDIR}/_ext/786934795/Silly.o.d ${OBJECTDIR}/_ext/786934795/SillyServiceBattery.o.d ${OBJECTDIR}/_ext/786934795/SillyServiceBumper.o.d ${OBJECTDIR}/_ext/786934795/SillyEventChecker.o.d ${OBJECTDIR}/_ext/786934795/ES_Run.o.d ${OBJECTDIR}/_ext/786934795/SillyServiceTape.o.d ${OBJECTDIR}/_ext/786934795/SillyHSM.o.d ${OBJECTDIR}/_ext/786934795/SillyService2kBeacon.o.d ${OBJECTDIR}/_ext/786934795/SillyEvadeSubHSM.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1959175648/AD.o ${OBJECTDIR}/_ext/1959175648/BOARD.o ${OBJECTDIR}/_ext/1959175648/IO_Ports.o ${OBJECTDIR}/_ext/1959175648/LED.o ${OBJECTDIR}/_ext/1959175648/pwm.o ${OBJECTDIR}/_ext/1959175648/serial.o ${OBJECTDIR}/_ext/1959175648/timers.o ${OBJECTDIR}/_ext/1959175648/roach.o ${OBJECTDIR}/_ext/1959175648/ES_CheckEvents.o ${OBJECTDIR}/_ext/1959175648/ES_Framework.o ${OBJECTDIR}/_ext/1959175648/ES_PostList.o ${OBJECTDIR}/_ext/1959175648/ES_Queue.o ${OBJECTDIR}/_ext/1959175648/ES_TattleTale.o ${OBJECTDIR}/_ext/1959175648/ES_Timers.o ${OBJECTDIR}/_ext/1959175648/ES_KeyboardInput.o ${OBJECTDIR}/_ext/786934795/Silly.o ${OBJECTDIR}/_ext/786934795/SillyServiceBattery.o ${OBJECTDIR}/_ext/786934795/SillyServiceBumper.o ${OBJECTDIR}/_ext/786934795/SillyEventChecker.o ${OBJECTDIR}/_ext/786934795/ES_Run.o ${OBJECTDIR}/_ext/786934795/SillyServiceTape.o ${OBJECTDIR}/_ext/786934795/SillyHSM.o ${OBJECTDIR}/_ext/786934795/SillyService2kBeacon.o ${OBJECTDIR}/_ext/786934795/SillyEvadeSubHSM.o

# Source Files
SOURCEFILES=C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/AD.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/BOARD.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/IO_Ports.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/LED.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/pwm.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/serial.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/timers.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/roach.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_CheckEvents.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_Framework.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_PostList.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_Queue.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_TattleTale.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_Timers.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_KeyboardInput.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/Silly.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyServiceBattery.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyServiceBumper.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyEventChecker.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/ES_Run.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyServiceTape.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyHSM.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyService2kBeacon.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyEvadeSubHSM.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

# The following macros may be used in the pre and post step lines
Device=PIC32MX320F128H
ProjectDir="C:\Users\leafg\Desktop\ECE118Mechatronics\ECE118\projects\Final_ECE118.X"
ProjectName=Final_ECE118
ConfName=default
ImagePath="dist\default\${IMAGE_TYPE}\Final_ECE118.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ImageDir="dist\default\${IMAGE_TYPE}"
ImageName="Final_ECE118.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IsDebug="true"
else
IsDebug="false"
endif

.build-conf:  .pre ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Final_ECE118.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX320F128H
MP_LINKER_FILE_OPTION=,--script="C:\Users\leafg\Desktop\ECE118Mechatronics\ECE118\bootloader320.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1959175648/AD.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/AD.c  .generated_files/2fd96b30aa3e58a5fec7b6ca2a779843c78f7db0.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/AD.o.d" -o ${OBJECTDIR}/_ext/1959175648/AD.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/AD.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/BOARD.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/BOARD.c  .generated_files/cd5d98a098f97f03a34a3dda4b0ef32aad54928e.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/BOARD.o.d" -o ${OBJECTDIR}/_ext/1959175648/BOARD.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/BOARD.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/IO_Ports.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/IO_Ports.c  .generated_files/78b05a45cced1b6c00b3c2ed80a778945728715d.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/IO_Ports.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/IO_Ports.o.d" -o ${OBJECTDIR}/_ext/1959175648/IO_Ports.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/IO_Ports.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/LED.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/LED.c  .generated_files/d1ea9d3238d43792eaff5ba7b61e4e8961960a3f.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/LED.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/LED.o.d" -o ${OBJECTDIR}/_ext/1959175648/LED.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/LED.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/pwm.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/pwm.c  .generated_files/d885c5070d06331ada3b328a24ac35efd6b1ddbc.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/pwm.o.d" -o ${OBJECTDIR}/_ext/1959175648/pwm.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/pwm.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/serial.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/serial.c  .generated_files/add5b9237babd50fa31613d332542c86089008a6.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/serial.o.d" -o ${OBJECTDIR}/_ext/1959175648/serial.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/serial.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/timers.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/timers.c  .generated_files/8cb066ba62d1b5816ee73e6b419aa392faa8ddeb.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/timers.o.d" -o ${OBJECTDIR}/_ext/1959175648/timers.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/timers.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/roach.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/roach.c  .generated_files/e9403a3d3c78021c3925b824741336b59ae1c558.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/roach.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/roach.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/roach.o.d" -o ${OBJECTDIR}/_ext/1959175648/roach.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/roach.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/ES_CheckEvents.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_CheckEvents.c  .generated_files/c712e5a19d07802c281db3d881331e3b4379cac3.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/ES_CheckEvents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/ES_CheckEvents.o.d" -o ${OBJECTDIR}/_ext/1959175648/ES_CheckEvents.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_CheckEvents.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/ES_Framework.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_Framework.c  .generated_files/fa3b5adb15e3cd9c1ce1ce05d3c7704bc39c0b68.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/ES_Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/ES_Framework.o.d" -o ${OBJECTDIR}/_ext/1959175648/ES_Framework.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_Framework.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/ES_PostList.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_PostList.c  .generated_files/dfd72a539f8b7300cf7e94debd0bd90767c3b0a5.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/ES_PostList.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/ES_PostList.o.d" -o ${OBJECTDIR}/_ext/1959175648/ES_PostList.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_PostList.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/ES_Queue.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_Queue.c  .generated_files/1b0391985002e97d24189435197b7d8a94d89117.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/ES_Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/ES_Queue.o.d" -o ${OBJECTDIR}/_ext/1959175648/ES_Queue.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_Queue.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/ES_TattleTale.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_TattleTale.c  .generated_files/785af729971f8562f5179ab096fa7eee6dbb790f.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/ES_TattleTale.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/ES_TattleTale.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/ES_TattleTale.o.d" -o ${OBJECTDIR}/_ext/1959175648/ES_TattleTale.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_TattleTale.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/ES_Timers.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_Timers.c  .generated_files/4f47b447aad0536be33a7fe32e886ca1d525042e.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/ES_Timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/ES_Timers.o.d" -o ${OBJECTDIR}/_ext/1959175648/ES_Timers.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_Timers.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/ES_KeyboardInput.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_KeyboardInput.c  .generated_files/5f4d41113fe10fd30768f1808d9b7bf810658964.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/ES_KeyboardInput.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/ES_KeyboardInput.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/ES_KeyboardInput.o.d" -o ${OBJECTDIR}/_ext/1959175648/ES_KeyboardInput.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_KeyboardInput.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/786934795/Silly.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/Silly.c  .generated_files/b3b353de34f5167f6aa5ad4349a1ab03117b9402.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/786934795" 
	@${RM} ${OBJECTDIR}/_ext/786934795/Silly.o.d 
	@${RM} ${OBJECTDIR}/_ext/786934795/Silly.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/786934795/Silly.o.d" -o ${OBJECTDIR}/_ext/786934795/Silly.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/Silly.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/786934795/SillyServiceBattery.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyServiceBattery.c  .generated_files/7f78411dd2e022bbe217c452f53247c7f111e114.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/786934795" 
	@${RM} ${OBJECTDIR}/_ext/786934795/SillyServiceBattery.o.d 
	@${RM} ${OBJECTDIR}/_ext/786934795/SillyServiceBattery.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/786934795/SillyServiceBattery.o.d" -o ${OBJECTDIR}/_ext/786934795/SillyServiceBattery.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyServiceBattery.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/786934795/SillyServiceBumper.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyServiceBumper.c  .generated_files/ddd04e3e89a0cab633734f6e7bd2a8beeb4272ff.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/786934795" 
	@${RM} ${OBJECTDIR}/_ext/786934795/SillyServiceBumper.o.d 
	@${RM} ${OBJECTDIR}/_ext/786934795/SillyServiceBumper.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/786934795/SillyServiceBumper.o.d" -o ${OBJECTDIR}/_ext/786934795/SillyServiceBumper.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyServiceBumper.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/786934795/SillyEventChecker.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyEventChecker.c  .generated_files/cb849ac3e5bbaf1a6f66db76f28e2e716ddcffff.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/786934795" 
	@${RM} ${OBJECTDIR}/_ext/786934795/SillyEventChecker.o.d 
	@${RM} ${OBJECTDIR}/_ext/786934795/SillyEventChecker.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/786934795/SillyEventChecker.o.d" -o ${OBJECTDIR}/_ext/786934795/SillyEventChecker.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyEventChecker.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/786934795/ES_Run.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/ES_Run.c  .generated_files/c58f50b6a86ab6d643ac8fae3213b5c4dc2de4a4.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/786934795" 
	@${RM} ${OBJECTDIR}/_ext/786934795/ES_Run.o.d 
	@${RM} ${OBJECTDIR}/_ext/786934795/ES_Run.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/786934795/ES_Run.o.d" -o ${OBJECTDIR}/_ext/786934795/ES_Run.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/ES_Run.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/786934795/SillyServiceTape.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyServiceTape.c  .generated_files/66b45b365a0c4c74a374002b4fc9afb51b11967e.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/786934795" 
	@${RM} ${OBJECTDIR}/_ext/786934795/SillyServiceTape.o.d 
	@${RM} ${OBJECTDIR}/_ext/786934795/SillyServiceTape.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/786934795/SillyServiceTape.o.d" -o ${OBJECTDIR}/_ext/786934795/SillyServiceTape.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyServiceTape.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/786934795/SillyHSM.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyHSM.c  .generated_files/d34a9810beea79cff84b8f918cbaa9112033e741.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/786934795" 
	@${RM} ${OBJECTDIR}/_ext/786934795/SillyHSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/786934795/SillyHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/786934795/SillyHSM.o.d" -o ${OBJECTDIR}/_ext/786934795/SillyHSM.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyHSM.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/786934795/SillyService2kBeacon.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyService2kBeacon.c  .generated_files/c91674a24b23c4f1a81f110faa516905907bede1.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/786934795" 
	@${RM} ${OBJECTDIR}/_ext/786934795/SillyService2kBeacon.o.d 
	@${RM} ${OBJECTDIR}/_ext/786934795/SillyService2kBeacon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/786934795/SillyService2kBeacon.o.d" -o ${OBJECTDIR}/_ext/786934795/SillyService2kBeacon.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyService2kBeacon.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/786934795/SillyEvadeSubHSM.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyEvadeSubHSM.c  .generated_files/eef7cc958d457061b4a15cce4f2001ad2ff6c575.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/786934795" 
	@${RM} ${OBJECTDIR}/_ext/786934795/SillyEvadeSubHSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/786934795/SillyEvadeSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/786934795/SillyEvadeSubHSM.o.d" -o ${OBJECTDIR}/_ext/786934795/SillyEvadeSubHSM.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyEvadeSubHSM.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/1959175648/AD.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/AD.c  .generated_files/900226fb74828a690e225b2ffac7bba211b74d37.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/AD.o.d" -o ${OBJECTDIR}/_ext/1959175648/AD.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/AD.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/BOARD.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/BOARD.c  .generated_files/9346efa7095f9d311e3dad1007daf4b44c357c19.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/BOARD.o.d" -o ${OBJECTDIR}/_ext/1959175648/BOARD.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/BOARD.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/IO_Ports.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/IO_Ports.c  .generated_files/514143e077470f31b9229ee48ddcf5e0059dee76.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/IO_Ports.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/IO_Ports.o.d" -o ${OBJECTDIR}/_ext/1959175648/IO_Ports.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/IO_Ports.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/LED.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/LED.c  .generated_files/69337357b53ff882ff3ebb5dbe550a3d87b8da0b.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/LED.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/LED.o.d" -o ${OBJECTDIR}/_ext/1959175648/LED.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/LED.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/pwm.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/pwm.c  .generated_files/61e43855cd2d4a19fe986b6a74b3789d63d61727.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/pwm.o.d" -o ${OBJECTDIR}/_ext/1959175648/pwm.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/pwm.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/serial.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/serial.c  .generated_files/ec3437e01269abb2f63a01b840c5d96b2b7e40a0.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/serial.o.d" -o ${OBJECTDIR}/_ext/1959175648/serial.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/serial.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/timers.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/timers.c  .generated_files/c5bac5bcd253961dc97bdfafe5ba07c674a65023.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/timers.o.d" -o ${OBJECTDIR}/_ext/1959175648/timers.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/timers.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/roach.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/roach.c  .generated_files/b6fabcbe51d8031b29cb30dc5f0b703f3d1bbc74.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/roach.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/roach.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/roach.o.d" -o ${OBJECTDIR}/_ext/1959175648/roach.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/roach.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/ES_CheckEvents.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_CheckEvents.c  .generated_files/ad9e118d863ef7e33f64a6a6761d70363ce71103.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/ES_CheckEvents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/ES_CheckEvents.o.d" -o ${OBJECTDIR}/_ext/1959175648/ES_CheckEvents.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_CheckEvents.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/ES_Framework.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_Framework.c  .generated_files/bb5465098961f03b64c2784197394afa31c94f48.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/ES_Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/ES_Framework.o.d" -o ${OBJECTDIR}/_ext/1959175648/ES_Framework.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_Framework.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/ES_PostList.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_PostList.c  .generated_files/e1d3c6a03b870bccd59fc40e72440c26d7413884.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/ES_PostList.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/ES_PostList.o.d" -o ${OBJECTDIR}/_ext/1959175648/ES_PostList.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_PostList.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/ES_Queue.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_Queue.c  .generated_files/630aa6af4b386e4027f3fba38b7702d02c42d47.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/ES_Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/ES_Queue.o.d" -o ${OBJECTDIR}/_ext/1959175648/ES_Queue.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_Queue.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/ES_TattleTale.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_TattleTale.c  .generated_files/5bb022a58d1955aa1ca4046c84c61ef6350f0f5f.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/ES_TattleTale.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/ES_TattleTale.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/ES_TattleTale.o.d" -o ${OBJECTDIR}/_ext/1959175648/ES_TattleTale.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_TattleTale.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/ES_Timers.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_Timers.c  .generated_files/f36c5a89652078972fc1a5dca5e96bb9d5493686.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/ES_Timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/ES_Timers.o.d" -o ${OBJECTDIR}/_ext/1959175648/ES_Timers.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_Timers.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/ES_KeyboardInput.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_KeyboardInput.c  .generated_files/cf962f86e9accfce3d39957964171bf527d978d.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/ES_KeyboardInput.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/ES_KeyboardInput.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/ES_KeyboardInput.o.d" -o ${OBJECTDIR}/_ext/1959175648/ES_KeyboardInput.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/ES_KeyboardInput.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/786934795/Silly.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/Silly.c  .generated_files/e67ed587008ec871c76c9055d4f974485d1c8366.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/786934795" 
	@${RM} ${OBJECTDIR}/_ext/786934795/Silly.o.d 
	@${RM} ${OBJECTDIR}/_ext/786934795/Silly.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/786934795/Silly.o.d" -o ${OBJECTDIR}/_ext/786934795/Silly.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/Silly.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/786934795/SillyServiceBattery.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyServiceBattery.c  .generated_files/a5240e3627c4edc3aad133bba8cde3dcea43823a.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/786934795" 
	@${RM} ${OBJECTDIR}/_ext/786934795/SillyServiceBattery.o.d 
	@${RM} ${OBJECTDIR}/_ext/786934795/SillyServiceBattery.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/786934795/SillyServiceBattery.o.d" -o ${OBJECTDIR}/_ext/786934795/SillyServiceBattery.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyServiceBattery.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/786934795/SillyServiceBumper.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyServiceBumper.c  .generated_files/a79181390b95062be08096cad702030a31d85c7d.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/786934795" 
	@${RM} ${OBJECTDIR}/_ext/786934795/SillyServiceBumper.o.d 
	@${RM} ${OBJECTDIR}/_ext/786934795/SillyServiceBumper.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/786934795/SillyServiceBumper.o.d" -o ${OBJECTDIR}/_ext/786934795/SillyServiceBumper.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyServiceBumper.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/786934795/SillyEventChecker.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyEventChecker.c  .generated_files/84971039690ed5baa200be516e2f53ebb124bf0b.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/786934795" 
	@${RM} ${OBJECTDIR}/_ext/786934795/SillyEventChecker.o.d 
	@${RM} ${OBJECTDIR}/_ext/786934795/SillyEventChecker.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/786934795/SillyEventChecker.o.d" -o ${OBJECTDIR}/_ext/786934795/SillyEventChecker.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyEventChecker.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/786934795/ES_Run.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/ES_Run.c  .generated_files/ffe4123850d44bc56216b24ba47b8d249009b00b.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/786934795" 
	@${RM} ${OBJECTDIR}/_ext/786934795/ES_Run.o.d 
	@${RM} ${OBJECTDIR}/_ext/786934795/ES_Run.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/786934795/ES_Run.o.d" -o ${OBJECTDIR}/_ext/786934795/ES_Run.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/ES_Run.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/786934795/SillyServiceTape.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyServiceTape.c  .generated_files/7bf15a73ddbeb93b71ba5930cff57762f268c68a.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/786934795" 
	@${RM} ${OBJECTDIR}/_ext/786934795/SillyServiceTape.o.d 
	@${RM} ${OBJECTDIR}/_ext/786934795/SillyServiceTape.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/786934795/SillyServiceTape.o.d" -o ${OBJECTDIR}/_ext/786934795/SillyServiceTape.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyServiceTape.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/786934795/SillyHSM.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyHSM.c  .generated_files/85df44d32064cf8d4b6b6af9299774c57760a8d.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/786934795" 
	@${RM} ${OBJECTDIR}/_ext/786934795/SillyHSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/786934795/SillyHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/786934795/SillyHSM.o.d" -o ${OBJECTDIR}/_ext/786934795/SillyHSM.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyHSM.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/786934795/SillyService2kBeacon.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyService2kBeacon.c  .generated_files/2a1e34edac4457b76f2cda018d32075ffb6c3d2c.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/786934795" 
	@${RM} ${OBJECTDIR}/_ext/786934795/SillyService2kBeacon.o.d 
	@${RM} ${OBJECTDIR}/_ext/786934795/SillyService2kBeacon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/786934795/SillyService2kBeacon.o.d" -o ${OBJECTDIR}/_ext/786934795/SillyService2kBeacon.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyService2kBeacon.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/786934795/SillyEvadeSubHSM.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyEvadeSubHSM.c  .generated_files/aba470c51f2eaa91a377c6ab6edb82bbc80abd16.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/786934795" 
	@${RM} ${OBJECTDIR}/_ext/786934795/SillyEvadeSubHSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/786934795/SillyEvadeSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/786934795/SillyEvadeSubHSM.o.d" -o ${OBJECTDIR}/_ext/786934795/SillyEvadeSubHSM.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X/SillyEvadeSubHSM.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Final_ECE118.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/bootloader320.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Final_ECE118.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=1000,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Final_ECE118.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/bootloader320.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Final_ECE118.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=1000,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/Final_ECE118.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif

.pre:
	@echo "--------------------------------------"
	@echo "User defined pre-build step: [python C:\Users\leafg\Desktop\ECE118Mechatronics\ECE118\scripts\Enum_To_String.py]"
	@python C:\Users\leafg\Desktop\ECE118Mechatronics\ECE118\scripts\Enum_To_String.py
	@echo "--------------------------------------"

# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
