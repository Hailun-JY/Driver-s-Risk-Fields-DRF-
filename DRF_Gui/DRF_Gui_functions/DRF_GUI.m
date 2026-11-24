function varargout = DRF_GUI(varargin)
% DRF_GUI MATLAB code for DRF_GUI.fig
%      DRF_GUI, by itself, creates a new DRF_GUI or raises the existing
%      singleton*.
%
%      H = DRF_GUI returns the handle to a new DRF_GUI or the handle to
%      the existing singleton*.
%
%      DRF_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DRF_GUI.M with the given input arguments.
%
%      DRF_GUI('Property','Value',...) creates a new DRF_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DRF_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DRF_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DRF_GUI

% Last Modified by GUIDE v2.5 22-Jul-2019 22:43:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DRF_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @DRF_GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before DRF_GUI is made visible.
function DRF_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DRF_GUI (see VARARGIN)

% Choose default command line output for DRF_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DRF_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DRF_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


try
    DRF_GUI_function(handles)
catch ME
    disp('Please add the "DRF_Gui"  folder to path')
end
    

% --- Executes on slider movement.
function slider_sa_Callback(hObject, eventdata, handles)
DRF_GUI_function(handles)

function slider_phi_Callback(hObject, eventdata, handles)
DRF_GUI_function(handles)

function slider_v_Callback(hObject, eventdata, handles)
DRF_GUI_function(handles)

function slider_p_Callback(hObject, eventdata, handles)
DRF_GUI_function(handles)

function slider_tla_Callback(hObject, eventdata, handles)
DRF_GUI_function(handles)

function slider_m_Callback(hObject, eventdata, handles)
DRF_GUI_function(handles)

function slider_c_Callback(hObject, eventdata, handles)
DRF_GUI_function(handles)

function slider_k1_Callback(hObject, eventdata, handles)
DRF_GUI_function(handles)

function slider_k2_Callback(hObject, eventdata, handles)
DRF_GUI_function(handles)

function radiobutton_tree_Callback(hObject, eventdata, handles)
DRF_GUI_function(handles)

function radiobutton_car_Callback(hObject, eventdata, handles)
DRF_GUI_function(handles)


% --- Executes during object creation, after setting all properties.
function slider_sa_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider_phi_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider_v_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider_p_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider_tla_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider_m_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider_c_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider_k1_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider_k2_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
