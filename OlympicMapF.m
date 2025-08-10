function OlympicMapF(app)
%   Authors: Lissette Hernandez and Nicole Lopez
%   Date: 4/13/22
%   EG 10118 Section 07

clf
close all
%% Load data
% Load data from olympic_data spreadsheet up to 9,000 rows
data = load('data.mat');

% Columns:
% ID	Name	Sex	Age	Height	Weight	Team	NOC	Games	Year	Season	City	Sport	Event	Medal

% Size
[nRow, nCol] = size(data.data);

%% Map
% Read in data with border information
borderData = load('borderdata.mat');

% Pick out country data from olympic file
% country = data(:,7);

% Figure
figure

% Create border map
bordersm

% Turn hold on to plot all the countries
hold on

% Pick a random person
randRow = randi(nRow);

% Pull the person name from the data
randPerson = data.data{randRow, 2};

% Pull the country name from the data
randPCountry = lower(data.data{randRow, 9});

% Find the number of places 
%[nRowBorder] = length(borderData.places);

match = 0;

% Find an olympian to plot
while ~match
    ifMatchFound = strcmp(randPCountry, lower(borderData.places));
    bordersm(randPCountry, 'facecolor', 'r')
    if sum(strcmp(randPCountry, lower(borderData.places)))
        match = 1;
    elseif ~sum(strcmp(randPCountry, lower(borderData.places)))
        match = 0;
        % Pick a random person
        randRow = randi(nRow);
        % Pull the person name from the data
        randPerson = data.data{randRow, 2};
        
        % Pull the country name from the data
        randPCountry = lower(data.data{randRow, 9});
    end
end

% Populate the labels in the app with information
PName = data.data{randRow, 1};
app.OlympianName.Text = PName;
app.CountryName.Text = data.data{randRow, 9};
app.SportName.Text = data.data{randRow, 7};
app.MedalName.Text = data.data{randRow, 8};
        