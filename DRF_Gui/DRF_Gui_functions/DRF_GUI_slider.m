function [ y ] = DRF_GUI_slider( range,handles1,handles2 )
%DRF_GUI_SLIDER 
slider=get(handles1,'Value');
% y= mx +c
m=range(2)-range(1);
c=range(1);
y=m.*slider+c;

% display the value on gui
textLabel = sprintf('%.2f',y);
set(handles2, 'String', textLabel);

end

