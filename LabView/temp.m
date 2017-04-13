resetRotation(motor);
while(readRotations(motor) ~= 90)
	start(motor);
end
stop(motor);