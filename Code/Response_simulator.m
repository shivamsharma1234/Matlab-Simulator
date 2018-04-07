function varargout = Response_simulator(varargin)
% RESPONSE_SIMULATOR MATLAB code for Response_simulator.fig
%      RESPONSE_SIMULATOR, by itself, creates a new RESPONSE_SIMULATOR or raises the existing
%      singleton*.
%
%      H = RESPONSE_SIMULATOR returns the handle to a new RESPONSE_SIMULATOR or the handle to
%      the existing singleton*.
%
%      RESPONSE_SIMULATOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RESPONSE_SIMULATOR.M with the given input arguments.
%
%      RESPONSE_SIMULATOR('Property','Value',...) creates a new RESPONSE_SIMULATOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Response_simulator_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Response_simulator_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Response_simulator

% Last Modified by GUIDE v2.5 29-Mar-2017 15:23:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Response_simulator_OpeningFcn, ...
    'gui_OutputFcn',  @Response_simulator_OutputFcn, ...
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




% --- Executes just before Response_simulator is made visible.
function Response_simulator_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Response_simulator (see VARARGIN)

% Choose default command line output for Response_simulator
global fixed
handles.output = hObject;
set(hObject, 'units','normalized','outerposition',[0 0 1 1]);
movegui(hObject,'center');

% Update handles structure
guidata(hObject, handles);
axes(handles.axes3);
% UIWAIT makes Response_simulator wait for user response (see UIRESUME)
% uiwait(handles.figure1);

A=zeros(500,300);
if(ishandle(handles.axes3))
    imshow(A);
else
    close all
    return
end
% add a continuous value change listener
if ~isfield(handles,'hListener')
    handles.hListener = ...
        addlistener(handles.slider1,'ContinuousValueChange',@slider1_Callback);
end
set(handles.text2,'visible','off') %hide the current axes
set(handles.slider1,'visible','off') %hide the current axes
% set the slider range and step size
numSteps = 7;
set(handles.slider1, 'Min', 1);
set(handles.slider1, 'Max', numSteps);
set(handles.slider1, 'Value', 4);
set(handles.slider1, 'SliderStep', [1/(numSteps-1) , 1/(numSteps-1) ]);
% save the current/last slider value
handles.lastSliderVal = get(handles.slider1,'Value');
set(handles.text2,'String',num2str(handles.lastSliderVal));
% Update handles structure
guidata(hObject, handles);

Test_xlwrite();
%%
%%%
%kindly specify the path of the directory where the images data are
%%%

Training_Set_Folder = uigetdir('');%'C:\Users\Shivam Sharma\Desktop\Fever PRoject\Fever Code\Stimulus_samples\Stimulus samples';%uigetdir('');



%%
% End initialization code - DO NOT EDIT
User_Data = inputdlg({'Name','ID','Comments'},...
    'Enter User Details', [1 50; 1 50; 1 50]);
%size(User_Data)

%emptyCells = cellfun(@isempty,User_Data);
%if(sum(emptyCells)>0|| isempty(emptyCells))
if(isempty(User_Data)||isempty(User_Data(1))||isempty(User_Data(2)))
    ui = questdlg(['Press ''Kindly enter User Name and ID Detials or press ''Exit'' '],...
        'Enter Details','Enter Details','Exit','Enter Details');
    if strcmp(ui,'Enter Details')
        close all;
        Response_simulator();
    elseif strcmp(ui,'Exit')
        %delete(hObject);
        close all;
        return
    end
    
end

if(ishandle(handles.output))
    ui = questdlg('Press ''Yes'' to start the Response Simulation or Press ''New'' for a new User ',...
        'Yes','Yes','New','Exit','Yes');
end
set(hObject, 'Visible', 'on');

if strcmp(ui,'New')
    close all;
    Response_simulator();
elseif strcmp(ui,'Exit')
    close all;
    return
end
filename =  [Training_Set_Folder '\' strcat(User_Data{1},User_Data{2}) '.xls'];
headers1 = {'Name','ID','Comments','',''};
User_Data{4}='';
User_Data{5}='';
%%save_data(filename,[headers1;User_Data'],1)

% Msg={'Message for Img 1',...
%     'Message for img 2',...
%     'Message for Img 3',...
%     'Message for Img 4',...
%     'Message for Img 5',...
%     'Message for Img 6',...
%     'Message for Img 7',...
%     'Message for Img 8',...
%     'Message for Img 9',...
%     'Message for Img 10',...
%     'Message for Img 11',...
%     'Message for Img 12',...
%     'Message for Img 13',...
%     'Message for Img 14',...
%     'Message for Img 15',...
%     'Message for Img 16',...
%     'Message for Img 17',...
%     'Message for Img 18',...
%     'Message for Img 19',...
%     'Message for Img 20'};

Msg={'Msg for Block 1',...
     'Msg for Block 2'};
position=[80 230];
TS_Vector = [1;2;3];%4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19;20]; %Training set sequence for responsess


Circle = [Training_Set_Folder '\' 'circle.jpg'];
Plus   = [Training_Set_Folder '\' 'plus.jpg'];

No_Folders_In_Training_Set_Folder = length(TS_Vector);



block=1;

for k = 1:No_Folders_In_Training_Set_Folder
    
    
    Tmp_Image_Path = [Training_Set_Folder '\' num2str(TS_Vector(k)) '.bmp'];
    Tmp_Image_Name(k,:)={strcat(num2str(TS_Vector(k)) ,'.bmp')};
    %Tmp_Image_Path_Name = [Tmp_Image_Path,Tmp_Image_Name];
    
    if strcmp(Tmp_Image_Name,'Thumbs.db')
        break
    end
    %test = imread(Tmp_Image_Path);
    if((mod(k,10)==1))
        
        if (ishandle(handles.axes3))
            set(handles.text2,'String','Start Block');
            set(handles.text2,'visible','on') ;%hide the current axes
            
            imshow(A);
            %%pause(20+(block-1)*10);
            pause(1)
            set(handles.text2,'visible','off') ;%hide the current axes
            imshow(Circle);
            pause(1);
            
        end
        
    end
    
    
    
    
    if(ishandle(handles.axes3))
        start_block_onset(k)=tic;
        imshow(Plus);
        pause(1);
    end
    
    if(ishandle(handles.axes3)&&(mod(k,10)==1))
        RGB = insertText(A,position,Msg(block),'FontSize',18,'BoxColor',...
            'black','BoxOpacity',0.4,'TextColor','white');
        imshow(RGB);
        %%pause(4)
        pause(1);
        block=block+1;
    end
    
    
    if(ishandle(handles.axes3))
        start_trial_onset(k)=tic;
        imshow(Tmp_Image_Path);
        %%pause(3)
        pause(2)
        
    end
    
    try
        set(handles.slider1, 'Value', 4);
        
        
        set(handles.slider1, 'Enable', 'on');
        fixed=0;
        if(fixed==0)
            start_response_time(k)=tic;
        end
        set(handles.text2 , 'ForegroundColor','black');
        set(handles.slider1,'visible','on') ;%hide the current axes
        set(handles.text2,'String',num2str(get(handles.slider1,'Value')));
        set(handles.text2,'visible','on'); %hide the current axes
        
        if(fixed~=1)
        response_time(k)=toc(start_response_time(k));
    else
        response_time(k)=Inf;
    end
        
        %%pause(4);
        pause(1)
    catch
        warndlg('The GUI has been Closed Abruptly Responses may not be saved ');
        return
        
    end
    
    
    
    
    
    slider_val(k,:)=get(handles.slider1,'Value');
    
    
    trial_onset(k)=toc(start_trial_onset(k));
    block_onset(k)=toc(start_block_onset(k));
    
    pause(1)
    
    set(handles.text2,'visible','off') ;%hide the current axes
    set(handles.slider1,'visible','off'); %hide the current axes
    
    
    
    
    
end
set(handles.text2,'visible','on') ;%hide the current axes
set(handles.text2,'String','Finished');
headers = {'Image Name','Response value','Response Time','Trial Onset','Block Onset'};

save_data(filename,[headers1;User_Data';headers;[Tmp_Image_Name,num2cell(slider_val),num2cell(response_time)',num2cell(trial_onset)',num2cell(block_onset)']]);



function save_data(filename,A)

%filename = 'testdata.xlsx';
%A = {'Time','Temperature'; 12,98; 13,99; 14,97};
%sheet = 1;
%xlRange = 'E1';
%xlswrite(filename,A,sheet,xlRange);
xlwrite(filename,A);


% --- Outputs from this function are returned to the command line.
function varargout = Response_simulator_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;





% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global val
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles = guidata(hObject);

% get the slider value and convert it to the nearest integer that is less
% than this value
newVal = floor(get(hObject,'Value'));

% set the slider value to this integer which will be in the set {1,2,3,...,12,13}
set(hObject,'Value',newVal);

% now only do something in response to the slider movement if the
% new value is different from the last slider value
if newVal ~= handles.lastSliderVal
    
    % it is different, so we have moved up or down from the previous integer
    
    % save the new value
    handles.lastSliderVal = newVal;
    guidata(hObject,handles);
    
    % display the current value of the slider
    %disp(['at slider value ' num2str(get(hObject,'Value'))]);
    val=get(hObject,'Value');
    set(handles.text2,'String',num2str(get(hObject,'Value')));
    
end


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.




if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on key press with focus on figure1 and none of its controls.
function figure1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
global kbrin fixed

kbrin=eventdata.Key;
switch kbrin 
    case 'leftarrow'
        
        if((get(handles.slider1,'Value')>1) && (fixed==0))
            %disp('left');
            set(handles.slider1, 'Value', get(handles.slider1,'Value')-1);
            set(handles.text2,'String',num2str(get(handles.slider1,'Value')));
        end
    case 'rightarrow'
        
        if(get(handles.slider1,'Value')<7 && (fixed==0))
            %disp('right')
            set(handles.slider1, 'Value', get(handles.slider1,'Value')+1);
            set(handles.text2,'String',num2str(get(handles.slider1,'Value')));
        end
    case 'uparrow'
        %disp('up')
        fixed=1;
        set(handles.text2 , 'ForegroundColor','red');
        set(handles.slider1, 'Enable', 'off')
end
