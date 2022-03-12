%% et_plot_all_xline_events
% plotting all the xline's regarded to the time of the events in the raw data across time course.
% ans option to only make the xline's without plotting before 
% IMPORTANT - pick num
% if by click any raw figure - use gcf
%element can be (as a string) pdif P P2 H H2 V V2 asym 
function et_plot_all_xline_events(num_of_fig) 
% et_plot_all_xline_events(element,observer) % for new plot 

%% crpping for the right time course
%et_crop_ETR %because the %!!!!!!!!!!!!!
%et_crop_ETR_contin

%%
%et_globals; % using global var's
%observer=1; %if there are many 
element='P2 P';
% element='P2';
%et_plot_raw1(element,[],observer);
if nargin==0 % i.e. et_plot_all_xline_events()
   num_of_fig = get(gcf,'Number'); % the num_of_fig that was clicked / last on screen in focus
end
%fig = gcf - returns the current figure handle. If a figure does not exist, then gcf creates a figure and returns its handle. You can use the figure handle to query and modify figure properties.
%num_of_fig = 2
figure(num_of_fig) % by using the previous if nargin==0, you actually don't need this line

%% other options
% if that is a new plot
%et_plot_raw1(str(element),[],ind);
% et_plot_raw1('pdif',[],ind);
% title("_plot_raw1('pdif',[],ind) of the file "+ the_l ) % + observers(1))

%et_plot_pupil_anisocoria
%et_plot_pupil_anisocoria1

%%et_plot_pupil_asym([]);
%et_plot_pupil_asym([],1,2); % 2s windows
%title("asym of the file "+ the_l ) % + observers(1))
% title("_plot_pupil_asym of the file "+ observers() ) % + observers(1))

%hold on
%% saving ORG legend
%Legend_ORG_length= findobj(gcf, 'Type', 'Legend'); %findobj(1,'type','line') % Finds only lines in figure 1.
Legend_ORG_length= findobj(num_of_fig, 'Type', 'Legend');
ORG_lgnd_size=size(Legend_ORG_length.String);

%% drawing the xlines by events time
% in order to use num_of_figure, I need to make thses cell specific to the fig
% - solved by figure(num_of_fig)
global trials
hold all
for i=1:length(trials)
    %xl=xline(trials(i).time,'--m')
    xline(trials(i).time,'--m')
end
hold off
%% the below for loop is if you want to label the xline by its condition / cmnt trials(i).cmnt
% see aversive analysis.m
% for i=1:length(ETRepochs)
%  switch (ETRepochs(i).cond)
%  
%  case 'L'
%   %x_ear(i) = blocks(i).x_ear;
%   xl=xline(trials(i).time,'--m', [ETRepochs(i).cond,' ',num2str(trials(i).time)])%,'LabelVerticalAlignment','middle')
%   %xl=xline(trials(i).time,'--m', blocks(i).s_ear)%,'LabelVerticalAlignment','middle')
%   xl.LabelVerticalAlignment = 'bottom';
%   xl.LabelHorizontalAlignment = 'center';
%   xl.LabelOrientation='aligned'; %'horizontal';
%   %xl.DisplayName=num2str(trials(i).time);
%  case 'R'
%   %x_ear(i) = blocks(i).x_ear;
%   xl=xline(trials(i).time,'--k', [ETRepochs(i).cond,' ',num2str(trials(i).time)]);%,'LabelVerticalAlignment','middle')
%   %xl=xline(trials(i).time,'--k', blocks(i).s_ear)%,'LabelVerticalAlignment','middle')
%   xl.LabelVerticalAlignment = 'bottom';
%   xl.LabelHorizontalAlignment = 'center';
%   % xl.LabelOrientation='horizontal';
%   xl.LabelOrientation='aligned';
%   %xl.DisplayName=num2str(trials(i).time);
%  case 'B'
%   %x_ear(i) = blocks(i).x_ear;
%   xl=xline(trials(i).time,'--g', [ETRepochs(i).cond,' ',num2str(trials(i).time)]);%,'LabelVerticalAlignment','middle')
%   %xl=xline(trials(i).time,'--k', blocks(i).s_ear)%,'LabelVerticalAlignment','middle')
%   xl.LabelVerticalAlignment = 'bottom';
%   xl.LabelHorizontalAlignment = 'center';
%   % xl.LabelOrientation='horizontal';
%   xl.LabelOrientation='aligned';
%   %xl.DisplayName=num2str(trials(i).time);
%  end
% end

%% copy legend elements 

% https://www.mathworks.com/matlabcentral/answers/163444-matlab-2014b-copying-just-the-legend-from-existing-figure-into-subplot
%hLegend = findobj(gcf, 'Type', 'Legend');
hLegend = findobj(num_of_fig, 'Type', 'Legend');

%https://www.mathworks.com/matlabcentral/answers/62393-adding-legend-in-a-plot-genereted-by-a-loop
Legends=hLegend.String,1;
 ORG_Legends=[]; %preventing from old legends to be written
for i=1:ORG_lgnd_size(2)
    ORG_Legends{i}=string(Legends(i)) ;
end
legend(ORG_Legends);
%legend(hLegend.String{2},hLegend.String{1}) %positioning string legends in specific places

%shg % -last Handle to be shown 
%set(gcf, 'Position', get(0, 'Screensize')); % making a full screen
set(num_of_fig, 'Position', get(0, 'Screensize')); % making a full screen
figure(num_of_fig) %the figure to focus

end
