function varargout = THE_EQUALIZER(varargin)
% THE_EQUALIZER MATLAB code for THE_EQUALIZER.fig
%      THE_EQUALIZER, by itself, creates a new THE_EQUALIZER or raises the existing
%      singleton*.
%
%      H = THE_EQUALIZER returns the handle to a new THE_EQUALIZER or the handle to
%      the existing singleton*.
%
%      THE_EQUALIZER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in THE_EQUALIZER.M with the given input arguments.
%
%      THE_EQUALIZER('Property','Value',...) creates a new THE_EQUALIZER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the THE_EQUALIZER before THE_EQUALIZER_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to THE_EQUALIZER_OpeningFcn via varargin.
%
%      *See THE_EQUALIZER Options on GUIDE's Tools menu.  Choose "THE_EQUALIZER allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help THE_EQUALIZER

% Last Modified by GUIDE v2.5 30-Apr-2020 02:11:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @THE_EQUALIZER_OpeningFcn, ...
                   'gui_OutputFcn',  @THE_EQUALIZER_OutputFcn, ...
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


% --- Executes just before THE_EQUALIZER is made visible.
function THE_EQUALIZER_OpeningFcn(hObject, eventdata, handles, varargin)


% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to THE_EQUALIZER (see VARARGIN)

% Choose default command line output for THE_EQUALIZER
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global volume;
volume=100;



% UIWAIT makes THE_EQUALIZER wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = THE_EQUALIZER_OutputFcn(~, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

global player;
global x;
global filenames;
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.edit3,'string',char(filenames(x)));
if isplaying(player)
    pause(player);
else
    resume(player);

end


function originalGraph(handles, y, Fs)

C=ones(1,5);
h2=fir1(100,250/Fs,'low');
h3=fir1(100,[250/Fs 500/Fs],'bandpass');
h4=fir1(100,[500/Fs 2000/Fs],'bandpass');
h5=fir1(100,[2000/Fs 4000/Fs],'bandpass');
h6=fir1(100,4000/Fs,'high');
y2=filter(h2,1,y);
y3=filter(h3,1,y);
y4=filter(h4,1,y);
y5=filter(h5,1,y);
y6=filter(h6,1,y);
y=y2*C(1)+y3*C(2)+y4*C(3)+y5*C(4)+y6*C(5);
axes(handles.axes1);
y = y(:,1);
dt = 1/Fs;
t = 0:dt:(length(y)*dt)-dt;
plot(t,y); xlabel('Seconds'); ylabel('Amplitude');







% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1

% --- Executes on button press in togglebutton2.


% hObject    handle to togglebutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton2


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)

set(handles.edit15, 'string', 'Loading'); 
set(handles.edit15,'BackgroundColor',[1 1 0])
global x;
global filenames;
global pathname;
global player;
global a;
global y Fs;
global numberofsongs;
if x==1
    x=numberofsongs;
    a = char(strcat(pathname,filenames(x)));
else
    x=x-1;
    a = char(strcat(pathname,filenames(x)));
end

[y, Fs] = audioread(a);
player = audioplayer(y, Fs);
musicInfo(handles, a, x, filenames);
pushbutton6_Callback(hObject, eventdata, handles)


    

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)

set(handles.edit15, 'string', 'Loading'); 
set(handles.edit15,'BackgroundColor',[1 1 0]);
global x;
global filenames;
global pathname;
global player;
global a;
global y Fs;
global numberofsongs;

if x==numberofsongs
    x=1;
    a = char(strcat(pathname,filenames(x)));
else
    x=x+1;
    a = char(strcat(pathname,filenames(x)));
end


[y, Fs] = audioread(a);
player = audioplayer(y, Fs);
musicInfo(handles, a, x, filenames);
pushbutton6_Callback(hObject, eventdata, handles)




% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)

% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1
global filenames numberofsongs;
global pathname;
global a player;
global y Fs x;


Titles={1,numberofsongs};
Artists={1,numberofsongs};
Comments={1,numberofsongs};
for i=1:numberofsongs
    b = char(strcat(pathname,filenames(i)));
    info = audioinfo(b);
    Titles(i)={info.Title};
    Artists(i)={info.Artist};
    Comments(i)={info.Comment};
end

set(handles.listbox1, 'String', filenames);
set(handles.listbox2, 'String', Titles);
set(handles.listbox3, 'String', Artists);
set(handles.listbox4, 'String', Comments);

index_selected = get(handles.listbox1,'Value');
if strcmp(get(gcf,'selectiontype'),'open')
    set(handles.edit15, 'string', 'Loading'); 
    set(handles.edit15,'BackgroundColor',[1 1 0]);
    pause(player);
    x=index_selected;
    a = char(strcat(pathname,filenames(x)));
    [y, Fs] = audioread(a);
    player = audioplayer(y, Fs);        
end
musicInfo(handles, a, x, filenames);
pushbutton6_Callback(hObject, eventdata, handles);
set(handles.edit15, 'string', 'Ready');; 
set(handles.edit15,'BackgroundColor',[0 1 0])


    

% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
clear a;
global a;
global filenames;
global pathname;
global y x;
global numberofsongs player;
set(handles.edit15, 'string', 'Loading');
set(handles.edit15,'BackgroundColor',[1 1 0])
oldFiles=filenames;
x=1;
[filenames, pathname, filterindex] = uigetfile( ...
    {'*.mp3;*.wav;*.ogg;*.flac;*.au;*.aiff;*.aif;*.aifc;*.mp4;*.m4a','Supported files (*.mp3;*.wav;*.ogg;*.flac;*.au;*.aiff;*.aif;*.aifc;*.mp4;*.m4a)';
    '*.mp3','MP3 files (*.mp3)'; '*.wav','WAVE files (*.wav)'; '*.ogg','OGG files (*.ogg)';
    '*.flac','FLAC files (*.flac)'; '*.au','AU (*.au)'; '*.aiff;*.aif','AIFF files (*.aiff, *.aif)';
    '*.aifc','AIFC (*.aifc)'; '*.m4a;*.mp4','MPEG-4 AAC (.*.m4a, *.mp4)'}, 'Pick a file', 'MultiSelect', 'on');
if ~isequal(filenames, 0)
    set(handles.listbox1,'Value',1);
    if ~iscell(filenames)
        filenames = {filenames};
    end
    numberofsongs = length(filenames);
    a = char(strcat(pathname,filenames(x)));
    [y, Fs] = audioread(a);
    player = audioplayer(y, Fs);
    
    listbox1_Callback(hObject, eventdata, handles)
else
    filenames=oldFiles;
    set(handles.edit15, 'string', 'Ready');
    set(handles.edit15,'BackgroundColor',[0 1 0])
end
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
set(handles.edit15, 'string', 'Loading');
set(handles.edit15,'BackgroundColor',[1 1 0])

global x;
global filenames;
global pathname;
global y Fs;
global player;
global volume;


% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
volume = get(handles.slider1, 'Value');
a = char(strcat(pathname,filenames(x)))
[y, Fs] = audioread(a);
set(handles.edit9,'string',volume);
y=y*0.01*volume;
player = audioplayer(y, Fs);
pushbutton6_Callback(hObject, eventdata, handles);



% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
set(hObject, 'Min', 0, 'Max', 100, 'Value', 100);


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
sliderVal = round(get(hObject, 'Value'),1);
set(handles.edit4,'string',sliderVal);
% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
sliderVal = round(get(hObject, 'Value'),1);
set(handles.edit5,'string',sliderVal);

% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
sliderVal = round(get(hObject, 'Value'),1);
set(handles.edit6,'string',sliderVal);

% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
sliderVal = round(get(hObject, 'Value'),1);
set(handles.edit7,'string',sliderVal);

% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
sliderVal = round(get(hObject, 'Value'),1);
set(handles.edit8,'string',sliderVal);

% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
set(handles.edit15, 'string', 'Loading'); 
set(handles.edit15,'BackgroundColor',[1 1 0])
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a player volume;
pause(player);
[y, Fs] = audioread(a);
originalGraph(handles, y, Fs);
C=ones(1,5);
h2=fir1(100,250/Fs,'low');
h3=fir1(100,[250/Fs 500/Fs],'bandpass');
h4=fir1(100,[500/Fs 2000/Fs],'bandpass');
h5=fir1(100,[2000/Fs 4000/Fs],'bandpass');
h6=fir1(100,4000/Fs,'high');
C(1)=get(handles.slider2, 'Value');
C(2)=get(handles.slider3, 'Value');
C(3)=get(handles.slider4, 'Value');
C(4)=get(handles.slider5, 'Value');
C(5)=get(handles.slider6, 'Value');
if C(1) < 0
    C(1)=1/(C(1)*-1);
end
if C(2) < 0
    C(2)=1/(C(2)*-1);
end
if C(3) < 0
    C(3)=1/(C(3)*-1);
end
if C(4) < 0
    C(4)=1/(C(4)*-1);
end
if C(5) < 0
    C(5)=1/(C(5)*-1);
end
y2=filter(h2,1,y);
y3=filter(h3,1,y);
y4=filter(h4,1,y);
y5=filter(h5,1,y);
y6=filter(h6,1,y);
%[y, Fs] = audioread(a);
y=y2*C(1)+y3*C(2)+y4*C(3)+y5*C(4)+y6*C(5);
y=y*volume*0.01;
player = audioplayer(y, Fs);
axes(handles.axes2);
y = y(:,1);
dt = 1/Fs;
t = 0:dt:(length(y)*dt)-dt;
plot(t,y); xlabel('Seconds'); ylabel('Amplitude');
set(handles.edit15, 'string', 'Ready');
set(handles.edit15,'BackgroundColor',[0 1 0])
pushbutton1_Callback(hObject, eventdata, handles);


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
set(handles.edit15, 'string', 'Loading'); 
set(handles.edit15,'BackgroundColor',[1 1 0])
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.slider2, 'Value', 1);
set(handles.slider3, 'Value', 1);
set(handles.slider4, 'Value', 1);
set(handles.slider5, 'Value', 1);
set(handles.slider6, 'Value', 1);
set(handles.edit4,'string','1');
set(handles.edit5,'string','1');
set(handles.edit6,'string','1');
set(handles.edit7,'string','1');
set(handles.edit8,'string','1');
pushbutton6_Callback(hObject, eventdata, handles);


function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function musicInfo(handles, a, x, filenames);

info = audioinfo(a);

artist = info.Artist;
title = info.Title;
if isequal(title, '')
    title=char(filenames(x));
end
comment = info.Comment;

set(handles.edit12,'string',title);
set(handles.edit13,'string',artist);
set(handles.edit14,'string',comment);


function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
set(handles.edit15, 'string', 'Loading'); 
set(handles.edit15,'BackgroundColor',[1 1 0])
global a pathname filenames x numberofsongs player volume;
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit15, 'string', 'Loading'); set(handles.edit15,'BackgroundColor',[1 1 0])
newTitle = get(handles.edit12, 'String');
newArtist = get(handles.edit13, 'String');
newComment = get(handles.edit14, 'String');
[y, Fs] = audioread(a);
switch get(handles.popupmenu1,'Value')   
    case 1
        type='.wav';
    case 2
        type='.ogg';
    case 3
        type='.flac';
    case 4
        type='.m4a';
    case 5
        type='.mp4';
    otherwise
end
deleteOriginal = get(handles.popupmenu2, 'Value');
filename=strcat(newTitle, type);
audiowrite(strcat(pathname,filename),y,Fs,'Title',newTitle,'Artist',newArtist,'Comment',newComment);
if deleteOriginal==2
    if exist(a, 'file');
        delete(a);
        a = strcat(pathname, newTitle, type);
      
    end
    filenames(x) = {filename};
    a = strcat(pathname,filenames(x));
else
    numberofsongs=numberofsongs+1;
    filenames(numberofsongs)={filename};
end
[y, Fs] = audioread(a);
player = audioplayer(y, Fs);
listbox1_Callback(hObject, eventdata, handles);

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1

    

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)

% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit15, 'string', 'Loading'); set(handles.edit15,'BackgroundColor',[1 1 0])
global filenames numberofsongs;
a = sort(filenames);
repeat = true;
i=1;
sortBy='ascend';
while repeat == true
    if (string(filenames(i)))==string(a(i))
        sortBy='descend';
        i=i+1;
    else
        sortBy='ascend';
        repeat=false;
    end
    if i==numberofsongs
        repeat=false;
    end
end
if strcmp(sortBy,'ascend')==1
    filenames=sort(filenames);
else
    filenames=fliplr(filenames);
end
listbox1_Callback(hObject, eventdata, handles);

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)

global filenames numberofsongs pathname;
set(handles.edit15, 'string', 'Loading'); set(handles.edit15,'BackgroundColor',[1 1 0])
artistCells={1,numberofsongs};
for i=1:numberofsongs
    a = strcat(pathname,filenames(i));
    Artists = audioinfo(string(a)).Artist;
    if isequal(Artists, '')
        Artists=' ';
    end
    artistCells(i)={Artists};
end

flipCells=filenames;
newCells={filenames{1,:};artistCells{1,:}};
artistCells=sort(artistCells);
finalCells={1,numberofsongs};
for i=1:length(artistCells)
    z=0;
    for n=1:numberofsongs
        if strcmp(artistCells(i),newCells(2,n))==1
            repeat=true;
            while repeat==true
                if z==0
                    finalCells(i)=newCells(1,n);
                    repeat=false;
                    z=z+1;
                elseif z==length(finalCells)
                    finalCells(i)=newCells(1,n);
                    repeat=false;
                elseif (~isequal(finalCells(z), newCells(1,n))) && z==length(newCells)
                    finalCells(i)=newCells(1,n);
                    z=z+1;    
                    repeat =false;
                elseif isequal(finalCells(z), newCells(1,n))
                    repeat=false;
                else
                    z=z+1;

                end
            end
        end
    end
end
filenames=finalCells;
if isequal(filenames, flipCells)
    filenames=fliplr(filenames);
end
listbox1_Callback(hObject, eventdata, handles);

% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
set(handles.edit15, 'string', 'Loading'); set(handles.edit15,'BackgroundColor',[1 1 0])
global filenames numberofsongs pathname oldComments;
commentCells={1,numberofsongs};
for i=1:numberofsongs
    a = strcat(pathname,filenames(i));
    Comment = audioinfo(string(a)).Comment;
    if isequal(Comment, '')
        Comment=' ';
    end
    commentCells(i)={Comment};
end
flipCells=filenames;
newCells={filenames{1,:};commentCells{1,:}};
disp(commentCells);
if isequal(commentCells, oldComments)
    disp('i');
    commentCells=fliplr(commentCells);
    disp(commentCells);
else
    commentCells=sort(commentCells);
end
disp(commentCells);
finalCells={1,numberofsongs};
for i=1:length(commentCells)
    z=0;
    for n=1:numberofsongs
        if strcmp(commentCells(i),newCells(2,n))==1
            repeat = true;
            while repeat==true
                if z==0
                    finalCells(i)=newCells(1,n);
                    repeat=false;
                    z=z+1;
                elseif z==length(finalCells)
                    finalCells(i)=newCells(1,n);
                    repeat=false;
                elseif (~isequal(finalCells(z), newCells(1,n))) && z==length(newCells)
                    finalCells(i)=newCells(1,n);
                    z=z+1;    
                    repeat =false;
                elseif isequal(finalCells(z), newCells(1,n))
                    repeat=false;
                else
                    z=z+1;

                end
            end
        end
    end
end
filenames=finalCells;
oldComments=commentCells;
listbox1_Callback(hObject, eventdata, handles);
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
global filenames;
global pathname;
global a player;
global y Fs x;
index_selected = get(handles.listbox2,'Value');  
if strcmp(get(gcf,'selectiontype'),'open') && ~isequal(index_selected, x)
    set(handles.edit15, 'string', 'Loading');
    set(handles.edit15,'BackgroundColor',[1 1 0])
    pause(player);
    x=index_selected;
    a = char(strcat(pathname,filenames(x)));
    [y, Fs] = audioread(a);
    player = audioplayer(y, Fs);    
    musicInfo(handles, a, x, filenames);
    pushbutton6_Callback(hObject, eventdata, handles);
end


% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox3.
function listbox3_Callback(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox3


% --- Executes during object creation, after setting all properties.
function listbox3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox4.
function listbox4_Callback(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox4


% --- Executes during object creation, after setting all properties.
function listbox4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
pushbutton1_Callback(hObject, eventdata, handles);
set(handles.edit15, 'string', 'Loading'); 
set(handles.edit15,'BackgroundColor',[1 1 0])
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.slider2, 'Value', 2);
set(handles.slider3, 'Value', 1.6);
set(handles.slider4, 'Value', 1.2);
set(handles.slider5, 'Value', 1.1);
set(handles.slider6, 'Value', 1);
set(handles.edit4,'string','2');
set(handles.edit5,'string','1.6');
set(handles.edit6,'string','1.2');
set(handles.edit7,'string','1.1');
set(handles.edit8,'string','1');
pushbutton6_Callback(hObject, eventdata, handles);

% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
pushbutton1_Callback(hObject, eventdata, handles);
set(handles.edit15, 'string', 'Loading'); 
set(handles.edit15,'BackgroundColor',[1 1 0])
set(handles.slider2, 'Value', -4);
set(handles.slider3, 'Value', -3);
set(handles.slider4, 'Value', -2);
set(handles.slider5, 'Value', -1);
set(handles.slider6, 'Value', 1);
set(handles.edit4,'string','-4');
set(handles.edit5,'string','-3');
set(handles.edit6,'string','-2');
set(handles.edit7,'string','-1');
set(handles.edit8,'string','1');
pushbutton6_Callback(hObject, eventdata, handles);
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
pushbutton1_Callback(hObject, eventdata, handles);
set(handles.edit15, 'string', 'Loading'); 
set(handles.edit15,'BackgroundColor',[1 1 0])
set(handles.slider2, 'Value', 1);
set(handles.slider3, 'Value', 1);
set(handles.slider4, 'Value', 1.2);
set(handles.slider5, 'Value', 2);
set(handles.slider6, 'Value', 3);
set(handles.edit4,'string','1');
set(handles.edit5,'string','1');
set(handles.edit6,'string','1.2');
set(handles.edit7,'string','2');
set(handles.edit8,'string','3');
pushbutton6_Callback(hObject, eventdata, handles);
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
set(handles.edit15, 'string', 'Loading'); 
set(handles.edit15,'BackgroundColor',[1 1 0])
pushbutton1_Callback(hObject, eventdata, handles);
set(handles.slider2, 'Value', 1);
set(handles.slider3, 'Value', -1);
set(handles.slider4, 'Value', -2);
set(handles.slider5, 'Value', -3);
set(handles.slider6, 'Value', -4);
set(handles.edit4,'string','1');
set(handles.edit5,'string','-1');
set(handles.edit6,'string','-2');
set(handles.edit7,'string','-3');
set(handles.edit8,'string','-4');
pushbutton6_Callback(hObject, eventdata, handles);
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
global filenames;
filenames=filenames(randperm(numel(filenames)));
listbox1_Callback(hObject, eventdata, handles);

% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
