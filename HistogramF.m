function HistogramF(app)
% Authors: Lissette Hernandez and Nicole Lopez
% Date: 4/13/2022
% EG 10118 Section 07

%% Load Data

data = load('data.mat');

% Columns: 
% ID Name Sex Age Height Weight Team NOC Games Year Season City Sport Event
% Medal 

% Size
[nRow, nCol]= size(data);

%% Histogram 
% Pick out year from olympic file 
% year = data(:,)

% Pick year data from olympic file (x-axis)
year = data.data(:,3);

% Pick medal data from olympic file (y-axis)
medal = data.data(:,8);

% Histogram 

% Filter data for medals 

% gold medals
compareRowg = strcmp(data.data(:,8), 'Gold');
sumg = sum(compareRowg);


% bronze medals
compareRowb = strcmp(data.data(:,8), 'Bronze');
sumb = sum(compareRowb);


% silver medals
compareRows = strcmp(data.data(:,8), 'Silver');
sums = sum(compareRows);

% Create x-axis with names of types of medals
medal_all = {'Gold','Silver',  'Bronze'};

% create one variable with all sums 
sumall = [(sumg), (sums), (sumb)];

% Create bins
bins = 3;

%% Plot
% Find the medal selected from the app
medalSelected = app.MedalDropDown.Value;

% Plot the bar(s) on the histogram based on the option chosen in the app
switch medalSelected 
    case 'Gold'        
        g = categorical({'Gold'});
        bar(app.HistogramAxes, g, sumall(1))
        
    case 'Silver'
        s = categorical({'Silver'});
        bar(app.HistogramAxes,s, sumall(2))
       
    case 'Bronze'
        b = categorical({'Bronze'});
        bar(app.HistogramAxes,b, sumall(3))

    case 'All'
        x = categorical({'Gold', 'Silver', 'Bronze'});
        bar(app.HistogramAxes,x,sumall)

end
