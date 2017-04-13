function [] = calcuhelper(app)
	disp('calcuhelper called');
	app.Label3.Text = 'Working...';
	app.Label.Text = 'Errors:';
	inputFolder = app.DataFile.Value;
	inputFolder = strsplit(inputFolder,'\\');
	inputFolder(numel(inputFolder)) = [];
	inputFolder = strjoin(inputFolder,'\\');
	if(~(exist(inputFolder,'dir') == 7))
		app.Label.Text = 'Error: Input Folder does not exist';
		app.Label3.Text = 'Ready';
		return;
	end
	if(~(exist(app.DataFile.Value,'file') == 2))
		app.Label.Text = 'Error: Data File does not exist';
		app.Label3.Text = 'Ready';
		%return;
	end
	if(~(exist(app.OutputFolder.Value,'dir') == 7))
		app.Label.Text = 'Error: Output Folder does not exist';
		app.Label3.Text = 'Ready';
		return;
	end
	if((exist(strcat(app.OutputFolder.Value,'\\',app.OutputFile.Value),'file') == 0))
		ret = questdlg('Output file exists...overwrite?','File problem','Yes','No','No');
		if(~(ret == 'Yes'))
			app.Label.Text = 'Error: No analytics ran. User exited';
			app.Label3.Text = 'Ready';
			return;
		end
	end
	app.Label.Text = 'Errors:';
	app.Label3.Text = 'Ready';
end