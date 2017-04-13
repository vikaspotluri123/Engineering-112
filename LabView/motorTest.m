clear;
robot = legoev3('usb');
color_motor = motor(robot,'A');

while(true)
	color_motor.Speed = 48;
	color_motor.start();
	pause(0.25);
	color_motor.Speed = -50;	
	color_motor.start();
	pause(0.25);
	color_motor.stop();
end