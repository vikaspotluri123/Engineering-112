clear;
robot = legoev3('usb');
COLOR_PORT = 1;
COLOR_MOTOR_PORT = 'A';

NO_COLOR = 0;
LB = 1; %Large` Blue
SB = 2; %Small Blue
LR = 3; %Large Red
SR = 4; %Small Red
LW = 5; %Large White
SW = 6; %Small White
TW = 7; %Trans White
ST = 8; %Steel

color_sensor = colorSensor(robot,COLOR_PORT);
color_motor = motor(robot,COLOR_MOTOR_PORT);
color_motor.resetRotation();

while(true)
	clearLCD(robot);
	colors = color_sensor.readColorRGB();
	red = colors(1);
	green = colors(2);
	blue = colors(3);
	switcher = num2str(red);
	switcher = switcher(1);
	switch(str2num(switcher))
		case 1
			if(red < 10)
				writeLCD(robot,'No color',2,3);
				colorRespond(robot,NO_COLOR,red,green,blue,color_motor)
			else
				if(red < 100)
					writeLCD(robot,'Large Blue 22',2,3);
					colorRespond(robot,LB,red,green,blue,color_motor)
				else
					if(blue < 10)
						writeLCD(robot,'Large Red 26',2,3);
						colorRespond(robot,LR,red,green,blue,color_motor)
					else
						if(blue < 100)
							writeLCD(robot,'No color 30',2,3);
							colorRespond(robot,NO_COLOR,red,green,blue,color_motor)
						else
							writeLCD(robot,'Large White 33',2,3);
							colorRespond(robot,LW,red,green,blue,color_motor)
						end
					end
				end
			end
		case 2
			if(red < 10)
				writeLCD(robot,'No Color 41',2,3);
				colorRespond(robot,NO_COLOR,red,green,blue,color_motor)
			else
				if(red < 100)
					writeLCD(robot,'Small Blue 45',2,3);
					colorRespond(robot,SB,red,green,blue,color_motor)
				else
					writeLCD(robot,'Large White 48',2,3);
					colorRespond(robot,LW,red,green,blue,color_motor)
				end
			end
			case 3
			if(green > 25)
				if(green > 35)
					writeLCD(robot,'No Color 55',2,3);
					colorRespond(robot,NO_COLOR,red,green,blue,color_motor)
				else
					writeLCD(robot,'Steel 58',2,3);
					colorRespond(robot,ST,red,green,blue,color_motor)
				end
			else
				writeLCD(robot,'Small Red 62',2,3);
				colorRespond(robot,SR,red,green,blue,color_motor)
			end
		case 4
			if(blue < 30)
				if(blue < 20)
					writeLCD(robot,'No Color 68',2,3);
					colorRespond(robot,NO_COLOR,red,green,blue,color_motor)
				else
					writeLCD(robot,'Small Red 71',2,3);
					colorRespond(robot,SR,red,green,blue,color_motor)
				end
			else
				if(blue < 37)
					writeLCD(robot,'Trans White 76',2,3);
					colorRespond(robot,TW,red,green,blue,color_motor)
				else
					writeLCD(robot,'No Color 79',2,3);
					%colorRespond(robot,NO_COLOR,red,green,blue,color_motor)
					disp('waiting');
				end
			end
		case 5
			if(red > 20)
				writeLCD(robot,'No Color 85',2,3);
				disp('waiting');
			else
				writeLCD(robot,'Large Red 88',2,3);
				colorRespond(robot,LR,red,green,blue,color_motor)
			end
		case 6
			if(green < 55)
				writeLCD(robot,'No Color 93',2,3);
				colorRespond(robot,NO_COLOR,red,green,blue,color_motor)
			else
				writeLCD(robot,'Small White 96',2,3);
				colorRespond(robot,SW,red,green,blue,color_motor)
			end
		case 8
			writeLCD(robot,'Large red 100',2,3);
			colorRespond(robot,LR,red,green,blue,color_motor)
		case 9
			writeLCD(robot,'Large Red 100',2,3);
			colorRespond(robot,LR,red,green,blue,color_motor)
		otherwise
			writeLCD(robot,'No Color 103',2,3);
			colorRespond(robot,NO_COLOR,red,green,blue,color_motor)
	end
	pause(0.3);
end