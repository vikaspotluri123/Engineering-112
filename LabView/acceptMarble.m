function [] = acceptMarble(motor)
	disp('acception');
	motor.Speed = 50;
	motor.start();
	pause(0.2);
	motor.stop();
	motor.Speed = -50;
	motor.start();
	pause(0.2);
	motor.stop();
end