EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Switch:SW_Push_Dual SW1
U 1 1 5FF1C9E8
P 3950 3400
F 0 "SW1" H 3950 3685 50  0000 C CNN
F 1 "SW_Push_Dual" H 3950 3594 50  0000 C CNN
F 2 "SW:SW_PUSH_6mm_Dual" H 3950 3600 50  0001 C CNN
F 3 "~" H 3950 3600 50  0001 C CNN
	1    3950 3400
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-Boards:SPARKFUN_PRO_MICRO MICROPROCESSOR1
U 1 1 5FF23269
P 5000 2700
F 0 "MICROPROCESSOR1" H 5000 3652 45  0000 C CNN
F 1 "SPARKFUN_PRO_MICRO" H 5000 3568 45  0000 C CNN
F 2 "SparkFun_Boards:SPARKFUN_PRO_MICRO" H 5000 3505 20  0000 C CNN
F 3 "" H 5000 2700 50  0001 C CNN
F 4 "XXX-00000" H 5000 3430 60  0001 C CNN "Field4"
	1    5000 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5FF25145
P 3750 3700
F 0 "#PWR0101" H 3750 3450 50  0001 C CNN
F 1 "GND" H 3755 3527 50  0000 C CNN
F 2 "" H 3750 3700 50  0001 C CNN
F 3 "" H 3750 3700 50  0001 C CNN
	1    3750 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 3600 3750 3700
Wire Wire Line
	3750 3400 3750 3600
Connection ~ 3750 3400
Connection ~ 3750 3600
Wire Wire Line
	5450 3250 5450 3400
Wire Wire Line
	5450 3400 4150 3400
Wire Wire Line
	4550 2350 4550 2450
Wire Wire Line
	4550 2350 4500 2350
Connection ~ 4550 2350
Wire Wire Line
	4500 2350 4500 1650
Wire Wire Line
	4500 1650 5500 1650
Wire Wire Line
	5500 1650 5500 2250
Wire Wire Line
	5500 2250 5450 2250
Connection ~ 4500 2350
Wire Wire Line
	4500 2350 3750 2350
Wire Wire Line
	4150 3400 4150 3600
Connection ~ 4150 3400
$Comp
L MPU9250_BMP280:MPU-9250 SENSOR1
U 1 1 5FF3B42B
P 2700 3250
F 0 "SENSOR1" H 2742 1885 50  0000 C CNN
F 1 "MPU-9250" H 2742 1976 50  0000 C CNN
F 2 "MPU9250_BMP280:MPU-9250" H 2800 3400 50  0001 C CNN
F 3 "" H 2800 3250 50  0001 C CNN
	1    2700 3250
	-1   0    0    1   
$EndComp
Wire Wire Line
	3750 2350 3750 2450
Wire Wire Line
	3000 2450 3750 2450
Connection ~ 3750 2450
Wire Wire Line
	3750 2450 3750 2950
Wire Wire Line
	3000 2950 3750 2950
Connection ~ 3750 2950
Wire Wire Line
	3750 2950 3750 3400
Wire Wire Line
	3000 2350 3650 2350
Wire Wire Line
	3650 2350 3650 3050
Wire Wire Line
	3650 3050 4550 3050
Wire Wire Line
	3000 2750 3800 2750
Wire Wire Line
	3000 3050 3100 3050
Wire Wire Line
	3100 3050 3100 1600
Wire Wire Line
	5550 1600 5550 2450
Wire Wire Line
	5550 2450 5450 2450
NoConn ~ 3000 2250
NoConn ~ 3000 2550
NoConn ~ 3000 2650
NoConn ~ 4550 3250
NoConn ~ 4550 3150
NoConn ~ 4550 2950
NoConn ~ 4550 2850
NoConn ~ 4550 2750
NoConn ~ 4550 2250
NoConn ~ 4550 2150
NoConn ~ 5450 2150
NoConn ~ 5450 2350
NoConn ~ 5450 2550
NoConn ~ 5450 2650
NoConn ~ 5450 2750
NoConn ~ 5450 2850
NoConn ~ 5450 2950
NoConn ~ 5450 3050
NoConn ~ 5450 3150
Wire Wire Line
	4550 2650 4000 2650
Wire Wire Line
	3800 2750 3800 2550
Wire Wire Line
	4000 2650 4000 2850
Wire Wire Line
	3800 2550 4550 2550
Wire Wire Line
	3000 2850 4000 2850
NoConn ~ 3000 2150
Wire Wire Line
	3650 1600 5550 1600
Wire Wire Line
	3100 1600 3650 1600
Connection ~ 3650 1600
$Comp
L power:+5V #PWR0102
U 1 1 600BA7A0
P 3650 1600
F 0 "#PWR0102" H 3650 1450 50  0001 C CNN
F 1 "+5V" H 3665 1773 50  0000 C CNN
F 2 "" H 3650 1600 50  0001 C CNN
F 3 "" H 3650 1600 50  0001 C CNN
	1    3650 1600
	1    0    0    -1  
$EndComp
$EndSCHEMATC
