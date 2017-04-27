% By submitting this assignment, I agree to the following:
% “Aggies do not lie, cheat, or steal, or tolerate those who do”
% “I have not given or received any unauthorized aid on this assignment”
%
% Name: Vikas Potluri
% Class: ENGR 112
% Section: 531
% Team: 8
% Assignment: Semester Matlab Project 
% Date: 4/22/2017


%Note: I'm not going to explain HOW to do statistics, we learned that in
%class. I'm going to explain the logic of everything else.

%Calcuhelper function, used in the app
function [] = calcuhelper(app)
	disp('calcuhelper called');
	app.Label3.Text = 'Working...';
	app.Label.Text = 'Errors:';

	%The inputFile is the inputFolder + filename. Get rid of filename to
	%derive inputFolder
	inputFolder = app.DataFile.Value;
	inputFolder = strsplit(inputFolder,'\\');
	inputFolder(numel(inputFolder)) = [];
	inputFolder = strjoin(inputFolder,'\\');

	%The outputLocation is the outputFolder + outputFile. Adding a \ to
	%ensure there's at least one. \\ = \.\ = same dir
	outputLocation = strcat(app.OutputFolder.Value,'\',app.OutputFile.Value);

	%The input folder has to exist in order for the program to work
	if(~(exist(inputFolder,'dir') == 7))
		app.Label.Text = 'Error: Input Folder does not exist';
		app.Label3.Text = 'Ready';
		return;
	end

	%The input file has to exist for the program to work
	if(~(exist(app.DataFile.Value,'file') == 2))
		app.Label.Text = 'Error: Data File does not exist';
		app.Label3.Text = 'Ready';
		return;
	end

	%The output folder has to exist for the program to work
	if(~(exist(app.OutputFolder.Value,'dir') == 7))
		app.Label.Text = 'Error: Output Folder does not exist';
		app.Label3.Text = 'Ready';
		return;
	end

	%If the output file exists, ask if we should overwrite.
	if(~(exist(outputLocation,'file') == 0))
		ret = questdlg('Output file exists...overwrite?','File problem',...
			'Yes','No','No');
		%Exit the program if they don't want to overwrite
		if(~strcmpi(string(ret),'yes'))
			app.Label.Text = 'Error: No analytics ran. User exited';
			app.Label3.Text = 'Ready';
			return;
		end
		
		%Make sure we can write to the file, or exit gracefully with an
		%error
		fileTester = fopen(outputLocation,'w');
		if(fileTester < 0)
			fclose(fileTester);
			app.Label.Text = 'Error: Cannot write to file';
			app.Label3.Text = 'Ready';
		end
		fclose(fileTester);
	end

	%I don't know every single thing that could cause reading the file to
	%break, so surround it with a try/catch statement. If it fails, exit
	%gracefully.
	try
		data = load(app.DataFile.Value);
	catch m
		app.label.Text = strcat('Error: Failed to load Data',m.identifier);
		app.Label3.Text = 'Ready';
		return;
	end

	%I will not accept empty data
	if(isempty(data))
		app.Label.Text = 'Error: Data is empty';
		app.Label3.Text = 'Ready';
		return;
	end

	%This is the first line of the file, as per the instructions
	outHeader = sprintf('%s ran stats on %s for %s\n',app.Username.Value,...
		datetime(),app.DataFile.Value);

	%We no longer have to support data that comes from 2 columns (because
	%we didn't learn regression analysis). Check that the size of the data
	%is one column, or reject.
	dataSize = size(data);
	if(dataSize(2) > 1)
		app.Label.Text = strcat('Errors: Data has more than 1 column.',...
			'Only one column of data is supported.');
		app.Label3.Text = 'Ready';
		return;
	end

	%Plot everything
	graphs = figure('Name','Graphs');
	set(graphs,'Position',[750,250,600,600]);
	subplot(2,2,[1,2]);
	histfit(data);
	title('HistFit');
	subplot(2,2,[3,4]);
	normplot(data);

	%Ask the user if the data is normally distributed (let them use the
	%plot)
	ret = questdlg('Is the data normally distributed?','Data Question','Yes',...
		'No','No');
	if(~strcmpi(string(ret),'yes'))
		app.Label.Text = 'Errors:';
		app.Label3.Text = 'Ready';
		writeFile = fopen(outputLocation,'w');
		fprintf(writeFile,'%s%s',outHeader,'Data was unusual');
		fclose(writeFile);
		return;
	end

	close(graphs);

	%Run the calculations (c = calculated)
	cMean = mean(data);
	cMedian = median(data);
	cMode = mode(data);
	cVar = var(data);
	cStdev = std(data,1);
	cMin = min(data);
	cMax = max(data);
	cCount = numel(data);

	%According to you, we have to use the sample or population standard
	%deviation. This is the testing for it.
	if(numel(data) <= 30)
		cStdev = std(data,0);
		outHeader = sprintf('%s%s',outHeader,'*Used Sample Standard Deviation');
	else
		outHeader = sprintf('%s%s',outHeader,...
			'*Used Population Standard Deviation');
	end

	%Create the string for the stats. Formatted like this to make sure the
	%requested requirements are followed.
	niceStats = sprintf('%sMean   = %06.2f\n','',cMean);
	niceStats = sprintf('%sMedian = %06.2f\n',niceStats,cMedian);
	niceStats = sprintf('%sMode   = %06.2f\n',niceStats,cMode);
	niceStats = sprintf('%sVar    = %06.2f\n',niceStats,cVar);
	niceStats = sprintf('%sStdev  = %06.2f\n',niceStats,cStdev);
	niceStats = sprintf('%sMin    = %06.2f\n',niceStats,cMin);
	niceStats = sprintf('%sMax    = %06.2f\n',niceStats,cMax);
	niceStats = sprintf('%sCount  = %06.0f\n',niceStats,cCount);

	%Save the file of what we've done so far
	writeFile = fopen(outputLocation,'w');
	fprintf(writeFile,'%s\n%s',outHeader,niceStats);
	fclose(writeFile);

	%Ask the user if they want to do Z-Table calculations
	ret = questdlg('Do you want to run Z-Table calculations?',...
		'Other Calcs?','Yes','No','No');
	%Save that the user chose not to do calculations
	if(~strcmpi(string(ret),'yes'))
		app.Label.Text = 'Errors:';
		app.Label3.Text = 'Ready';
		writeFile = fopen(outputLocation,'a');
		fprintf(writeFile,'No Z-Table Calculations done\n');
		fclose(writeFile);
	else
		%Determine the number of time to do Z or X calculation
		numTimes = inputdlg('How many calculations?','Question');
		while(isnan(str2double(numTimes)))
			numTimes = inputdlg('Not a number. How many Calculations?',...
				'Question');
		end
		%Run the calculations n number of times
		numTimes = round(str2double(numTimes));
		zCalcs = '';
		while(numTimes > 0)
			xOrZ = questdlg('X or Z calculations?','X or Z?','X','Z','Z');
			aboveBelow = questdlg('What type of calculation do you want?',...
				'A or B or both?','Above','Below','In Between','Below');
			%X Calculations for X
			if(strcmpi(string(xOrZ),'x'))
				%In between X
				if(strcmpi(string(aboveBelow),'in between'))
					xValue = inputdlg({'Lower Bounds','Upper Bounds'},...
						'Inputs',1);
					if(~isempty(xValue))
						while(isnan(str2double(xValue(1))) || isnan(...
								str2double(xValue(1))))
							xValue = inputdlg({'Lower Bounds',...
								'Upper Bounds'},'Inputs',1);
							if(isempty(xValue))
								break;
							end
						end
						xMin = normcdf(str2double(xValue(1)),cMean,cStdev);
						xMax = normcdf(str2double(xValue(2)),cMean,cStdev);
						xDif = xMax - xMin;
						zCalcs = sprintf('%s%s %.2f and %.2f is %.2f\n',...
							zCalcs,'The probability for values between',...
							str2double(xValue(1)),str2double(xValue(2)),xDif);
					end
				%Above or below X
				else
					xValue = inputdlg('What is the X Value?','X');
					if(~isempty(xValue))
						while(isnan(str2double(xValue)))
							xValue = ...
								inputdlg('Nota number. What is the X Value?',...
								'Question');
							if(isempty(xValue))
								break;
							end
						end
						xCalc = normcdf(str2double(xValue),cMean,cStdev);
						if(strcmpi(aboveBelow,'Above'))
							xCalc = 1 - xCalc;
						end
						zCalcs = sprintf('%s%s %s %.2f is %.2f\n',zCalcs,...
							'The probability for values',lower(aboveBelow),...
							str2double(xValue),xCalc);
					end
				end
			%In Between Z
			else
				if(strcmpi(string(aboveBelow),'in between'))
					zValue = inputdlg({'Lower Bounds','Upper Bounds'},...
						'Inputs',1);
					if(~isempty(zValue))
						while(isnan(str2double(zValue(1))) || isnan(...
								str2double(zValue(1))))
							zValue = inputdlg({'Lower Bounds','Upper Bounds'}...
								,'Inputs',1);
							if(isempty(zValue))
								break;
							end
						end
						zMin = (str2double(zValue(1)) * cStdev + cMean);
						zMax = (str2double(zValue(2)) * cStdev + cMean);
						xMin = normcdf(zMin,cMean,cStdev);
						xMax = normcdf(zMax,cMean,cStdev);
						disp(xMax);
						disp(xMin);
						zDif = xMax - xMin;
						zCalcs = sprintf('%s%s %.2f and %.2f is %.2f\n',...
							zCalcs,'The probability for values between',zMin,...
							zMax,zDif);
					end
				%Above or Below Z
				else
					zValue = inputdlg('What is the z Value?','z');
					if(~strcmpi(zValue,'z'))
						while(isnan(str2double(zValue)))
							zValue = ...
								inputdlg('Nota number. What is the Z Value?',...
								'Question');
							if(strcmpi(xValue,'z'))
								break;
							end
						end
						x = (str2double(zValue) * cStdev + cMean);
						zCalc = normcdf(x,cMean,cStdev);
						if(strcmpi(aboveBelow,'Above'))
							zCalc = 1 - zCalc;
						end
						zCalcs = sprintf('%s%s %s %.2f is %.2f\n',zCalcs,...
							'The probability for values',lower(aboveBelow),x,...
							zCalc);
					end
				end
			end
			numTimes = numTimes - 1;
		end
		
		%Save What we've done so far
		writeFile = fopen(outputLocation,'a');
		fprintf(writeFile,zCalcs);
		fclose(writeFile);
	end

	%Ask the user if they want to run a probability value search
	ret = questdlg('Do you want to run a probability value search?',...
		'Value Search?','Yes','No','No');
	%Fail gracefully
	if(~strcmpi(string(ret),'yes'))
		app.Label.Text = 'Errors:';
		app.Label3.Text = 'Ready';
		writeFile = fopen(outputLocation,'a');
		fprintf(writeFile,'No probability searches done');
		fclose(writeFile);
		return;
	end

	%Get how many times to loop
	numTimes = inputdlg('How many value searches?','Question');
	while(isnan(str2double(numTimes)))
		numTimes = inputdlg('Not a number. How many value searches?',...
			'Question');
	end
	numTimes = round(str2double(numTimes));
	pCalcs = '';
	%loop that many times
	while(numTimes > 0)
		%The act of probibility value search
		prob = inputdlg('Enter the probability to search','probability',1);
		while(isempty(prob) || str2double(prob) > 1 || str2double(prob) < 0)
			prob = inputdlg('Probability must be between 0 and 1.',...
				'probability',1);
		end
		distribution = makedist('Normal',cMean,cStdev);
		x = icdf(distribution,str2double(prob));
		z = (x-cMean)/cStdev;
		pCalcs = ...
			sprintf('%s%s %.2f are %.2f and %.2f\n',...
			'The z and x value that correspond to the probability',...
			pCalcs,str2double(p),x,z);
	end
	
	%Save probibility value search to file
	writeFile = fopen(outputLocation,'a');
	fprintf(writeFile,pCalcs);
	fclose(writeFile);

	%We're done!
	app.Label.Text = 'Errors: None (Stats were successfully run)';
	app.Label3.Text = 'Ready';
end