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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Silly_Sensors.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Silly_Sensors.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/AD.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/BOARD.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/pwm.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/roach.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/serial.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Silly_Sensors.X/Silly.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/LED.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/IO_Ports.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1959175648/AD.o ${OBJECTDIR}/_ext/1959175648/BOARD.o ${OBJECTDIR}/_ext/1959175648/pwm.o ${OBJECTDIR}/_ext/1959175648/roach.o ${OBJECTDIR}/_ext/1959175648/serial.o ${OBJECTDIR}/_ext/1107682058/Silly.o ${OBJECTDIR}/_ext/1959175648/LED.o ${OBJECTDIR}/_ext/1959175648/IO_Ports.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1959175648/AD.o.d ${OBJECTDIR}/_ext/1959175648/BOARD.o.d ${OBJECTDIR}/_ext/1959175648/pwm.o.d ${OBJECTDIR}/_ext/1959175648/roach.o.d ${OBJECTDIR}/_ext/1959175648/serial.o.d ${OBJECTDIR}/_ext/1107682058/Silly.o.d ${OBJECTDIR}/_ext/1959175648/LED.o.d ${OBJECTDIR}/_ext/1959175648/IO_Ports.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1959175648/AD.o ${OBJECTDIR}/_ext/1959175648/BOARD.o ${OBJECTDIR}/_ext/1959175648/pwm.o ${OBJECTDIR}/_ext/1959175648/roach.o ${OBJECTDIR}/_ext/1959175648/serial.o ${OBJECTDIR}/_ext/1107682058/Silly.o ${OBJECTDIR}/_ext/1959175648/LED.o ${OBJECTDIR}/_ext/1959175648/IO_Ports.o

# Source Files
SOURCEFILES=C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/AD.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/BOARD.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/pwm.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/roach.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/serial.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Silly_Sensors.X/Silly.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/LED.c C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/IO_Ports.c



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

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Silly_Sensors.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

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
${OBJECTDIR}/_ext/1959175648/AD.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/AD.c  .generated_files/62751e961418f6507b06dd214d10a4fe68d992d5.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/AD.o.d" -o ${OBJECTDIR}/_ext/1959175648/AD.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/AD.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/BOARD.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/BOARD.c  .generated_files/9df648d62410b6c7119228935711df68da7fad28.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/BOARD.o.d" -o ${OBJECTDIR}/_ext/1959175648/BOARD.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/BOARD.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/pwm.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/pwm.c  .generated_files/964601b7ad83ba38d4c5a5a19fb2e45e718d6562.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/pwm.o.d" -o ${OBJECTDIR}/_ext/1959175648/pwm.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/pwm.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/roach.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/roach.c  .generated_files/5f76d7f433d95be0e35f09d93a7d5acd7f64a44d.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/roach.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/roach.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/roach.o.d" -o ${OBJECTDIR}/_ext/1959175648/roach.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/roach.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/serial.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/serial.c  .generated_files/2541954ea86e2833ce1ac76e80589a8ae83e3295.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/serial.o.d" -o ${OBJECTDIR}/_ext/1959175648/serial.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/serial.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1107682058/Silly.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Silly_Sensors.X/Silly.c  .generated_files/d9262067d0864928560ce5ce19847ff42f899663.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1107682058" 
	@${RM} ${OBJECTDIR}/_ext/1107682058/Silly.o.d 
	@${RM} ${OBJECTDIR}/_ext/1107682058/Silly.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1107682058/Silly.o.d" -o ${OBJECTDIR}/_ext/1107682058/Silly.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Silly_Sensors.X/Silly.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/LED.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/LED.c  .generated_files/21b7298cbdf470833b328e98d1179403ac05326d.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/LED.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/LED.o.d" -o ${OBJECTDIR}/_ext/1959175648/LED.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/LED.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/IO_Ports.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/IO_Ports.c  .generated_files/2dda62629225ed763844ec226ef2680dbc8a311.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/IO_Ports.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/IO_Ports.o.d" -o ${OBJECTDIR}/_ext/1959175648/IO_Ports.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/IO_Ports.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/1959175648/AD.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/AD.c  .generated_files/255280520513e40581a7313beaccbbe4a67cad65.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/AD.o.d" -o ${OBJECTDIR}/_ext/1959175648/AD.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/AD.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/BOARD.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/BOARD.c  .generated_files/2c1ba65778e81ed58e0b8ea668cd546971b050ef.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/BOARD.o.d" -o ${OBJECTDIR}/_ext/1959175648/BOARD.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/BOARD.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/pwm.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/pwm.c  .generated_files/ba57f7f7b8eb365699f09a2b982466c8794aceb8.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/pwm.o.d" -o ${OBJECTDIR}/_ext/1959175648/pwm.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/pwm.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/roach.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/roach.c  .generated_files/a5be91858aa60c22fdecb66dd82fc1a47feeef64.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/roach.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/roach.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/roach.o.d" -o ${OBJECTDIR}/_ext/1959175648/roach.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/roach.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/serial.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/serial.c  .generated_files/47f8c39cbb279edba5984baa6cbc0674ed4de713.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/serial.o.d" -o ${OBJECTDIR}/_ext/1959175648/serial.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/serial.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1107682058/Silly.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Silly_Sensors.X/Silly.c  .generated_files/c516af8e3a9fd270c0fda327ec784e9db69ecabc.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1107682058" 
	@${RM} ${OBJECTDIR}/_ext/1107682058/Silly.o.d 
	@${RM} ${OBJECTDIR}/_ext/1107682058/Silly.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1107682058/Silly.o.d" -o ${OBJECTDIR}/_ext/1107682058/Silly.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Silly_Sensors.X/Silly.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/LED.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/LED.c  .generated_files/c417d01dc2cd4102e283f617b664acc62c321130.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/LED.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/LED.o.d" -o ${OBJECTDIR}/_ext/1959175648/LED.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/LED.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1959175648/IO_Ports.o: C\:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/IO_Ports.c  .generated_files/75aa98a89258878ec993b0ecbe066ccb63c3d9a3.flag .generated_files/759353b0e93ad5a8d9e10c6ac5e72ac60d137d3d.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1959175648" 
	@${RM} ${OBJECTDIR}/_ext/1959175648/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/1959175648/IO_Ports.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/include" -I"C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/projects/Final_ECE118.X" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1959175648/IO_Ports.o.d" -o ${OBJECTDIR}/_ext/1959175648/IO_Ports.o C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/src/IO_Ports.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Silly_Sensors.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/bootloader320.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Silly_Sensors.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=1000,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Silly_Sensors.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   C:/Users/leafg/Desktop/ECE118Mechatronics/ECE118/bootloader320.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Silly_Sensors.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=1000,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/Silly_Sensors.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


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
