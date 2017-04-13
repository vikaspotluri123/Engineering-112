function [] = rejectMarble(motor)
	disp('rejected');
	motor.Speed = -50;
	motor.start();
	pause(0.2);
	motor.stop();
	motor.Speed = 50;
	motor.start();
	pause(0.2);
	motor.stop();
end