classdef Clock
	properties
		year
		month
		day
		hour
		minute
		second
		DAYS_PER_MONTH = [31 28 31 30 31 30 31 31 30 31 30 31];
	end
	methods
		function obj = Clock()
			obj.year = 1971;
			obj.month = 1;
			obj.day = 1;
			obj.hour = 0;
			obj.minute = 0;
			obj.second = 1;
		end

		function obj = addDays(obj,days)
			daysInThisMonth = obj.DAYS_PER_MONTH(obj.month);
			if(obj.month == 2 && obj.isLeapYear())
				daysInThisMonth = 29;
			end
			totalDays = days + obj.day;
			if(totalDays > daysInThisMonth)
				obj.addMonths(1)
				obj = obj.addDays(totalDays - daysInThisMonth);
			end
		end

		function obj = addHours(obj,hours)
			numHours = mod(hours,24);
			numDays = floor(hours / 24);
			totalHours = obj.hour + numHours;
			if(totalHours > 24)
				numDays = numDays + 1;
				totalHours = totalHours - 24;
			end
			obj.hour = totalHours;
			obj = obj.addDays(numDays);
		end

		function obj = addMinutes(obj,minutes)
			numMinutes = mod(minutes,60);
			numHours  = floor(minutes / 60);
			totalMinutes = obj.minute + numMinutes;
			if(totalMinutes > 60);
				numHours = numHours + 1;
				totalMinutes = totalMinutes - 60;
			end
			obj.minute = totalMinutes;
			obj = obj.addHours(numHours);
		end

		function obj = addMonths(obj,months)
			totalMonths = obj.month + mod(months,12);
			totalYears = floor(months / 12);
			if(totalMonths > 12)
				totalYears = totalYears + 1;
				totalMonths = totalMonths - 12;
			end

			obj.month = totalMonths;
			obj = obj.addYears(totalYears);
		end

		function obj = addSeconds(obj,seconds)
			numSeconds = mod(seconds,60);
			numMinutes = floor(seconds / 60);
			totalSeconds = numSeconds + obj.second;
			if(totalSeconds > 60)
				totalSeconds = totalSeconds - 60;
				numMinutes = numMinutes + 1;
			end
			obj.second = totalSeconds;
			obj = obj.addMinutes(numMinutes);
		end

		function obj = addTime(obj,clock)
			daysInThisMonth = obj.DAYS_PER_MONTH(obj.month);
			daysInThisYear = 365;
			if(obj.isLeapYear())
				daysInThisMonth = 29;
				daysInThisYear = 366;
			end
			numSeconds = clock.getSecond();
			numSeconds = numSeconds + (clock.getMinute() * 60);
			numSeconds = numSeconds + (clock.getHour() * 60 * 60);
			numSeconds = numSeconds + (clock.getDay() * 60 * 60 * 24);
			numSeconds = numSeconds + (clock.getMonth() * 60 * 60 * 24 * daysInThisMonth);
			numSeconds = numSeconds + ((clock.getYear() - 1971) * 60 * 60 * 24 * daysInThisYear);
			obj = obj.addSeconds(numSeconds);
		end

		function obj = addYears(obj,years)
			obj.years = obj.year + years;
		end

		function ret = compare(obj, what)
			if (obj.year > what.year)
				ret = 1;
				return;
			else
				if(obj.year < what.year)
					ret = -1;
					return;
				else
				end
			end
		end

		function obj = countdown(clock)
		end

		function obj = draw(clock)
		end

		function day = getDay(clock)
			day = clock.day;
		end

		function day = getDayOfWeek(clock)
		end

		function hour = getHour(clock)
			hour = clock.hour;
		end

		function minute = getMinute(clock)
			minute = clock.minute;
		end

		function month = getMonth(clock)
			month = clock.month;
		end

		function notation = getNotation(clock)
			notation = 24;
		end

		function second = getSecond(clock)
			second = clock.second;
		end

		function time = getTime(clock)
		end

		function zone = getTimeZone(clock)
			zone = 6;
		end

		function year = getYear(clock)
			year = clock.year;
		end

		function isIt = isDST(clock)
		end

		function isIt = isLeapYear(clock)
			isIt = (mod(clock.year,4) == 0) && (mod(clock.year,100) == 0 && mod(clock.year,400) == 0);
		end

		function time = now(clock)
			h = clock.getHour();
			m = clock.getMinute();
			s = clock.getSecond();
			d = clock.getDay();
			mo=clock.getMonth();
			y = clock.getYear();
			time = sprintf('%2.2d:%2.2d:%2.2d %2.2d/%2.2d/%4.2d',h,m,s,d,mo,y);
		end

		function clock = tick(clock)
			clock = clock.addSeconds(1);
		end
	end
end