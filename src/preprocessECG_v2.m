function varargout = preprocessECG_v2(varargin)
% PREPROCESSECG_V2 MATLAB code for preprocessECG_v2.fig
%      PREPROCESSECG_V2, by itself, creates a new PREPROCESSECG_V2 or raises the existing
%      singleton*.
%
%      H = PREPROCESSECG_V2 returns the handle to a new PREPROCESSECG_V2 or the handle to
%      the existing singleton*.
%
%      PREPROCESSECG_V2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PREPROCESSECG_V2.M with the given input arguments.
%
%      PREPROCESSECG_V2('Property','Value',...) creates a new PREPROCESSECG_V2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before preprocessECG_v2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to preprocessECG_v2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help preprocessECG_v2

% Last Modified by GUIDE v2.5 10-Oct-2023 10:59:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @preprocessECG_v2_OpeningFcn, ...
                   'gui_OutputFcn',  @preprocessECG_v2_OutputFcn, ...
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


% --- Executes just before preprocessECG_v2 is made visible.
function preprocessECG_v2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to preprocessECG_v2 (see VARARGIN)

% Choose default command line output for preprocessECG_v2
handles.output = hObject;
handles.Hd=0;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes preprocessECG_v2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = preprocessECG_v2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function startp_Callback(hObject, eventdata, handles)
% hObject    handle to startp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of startp as text
%        str2double(get(hObject,'String')) returns contents of startp as a double


% --- Executes during object creation, after setting all properties.
function startp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to startp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function endp_Callback(hObject, eventdata, handles)
% hObject    handle to endp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of endp as text
%        str2double(get(hObject,'String')) returns contents of endp as a double


% --- Executes during object creation, after setting all properties.
function endp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to endp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in crop.
function crop_Callback(hObject, eventdata, handles)
% hObject    handle to crop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

startp=str2double(get(handles.startp, 'String'));
endp=str2double(get(handles.endp, 'String'));
ecg=handles.ecg;
ecg=ecg(startp:endp);
axes(handles.axes1)
 plot(ecg), axis tight; grid on;
 
 mmax=max(ecg); %max of whole signal display
 mmin=min(ecg);
 mmu=mean(ecg); % mean of whole signal display
 stde=std(ecg);
 
 fmmu= sprintf('%.3f',mmu);
 fstd= sprintf('%.3f',stde);
  
 set(handles.edit_min,'String',mmin)
 set(handles.edit_max,'String',mmax)
 set(handles.edit_mean,'String',fmmu)
 set(handles.edit_std,'String',fstd)

 set(handles.messages,'String','Signal interval selected.')

 
 handles.ecg=ecg;
 guidata(hObject, handles);
 


function a_start_Callback(hObject, eventdata, handles)
% hObject    handle to a_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a_start as text
%        str2double(get(hObject,'String')) returns contents of a_start as a double


% --- Executes during object creation, after setting all properties.
function a_start_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a_end_Callback(hObject, eventdata, handles)
% hObject    handle to a_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a_end as text
%        str2double(get(hObject,'String')) returns contents of a_end as a double


% --- Executes during object creation, after setting all properties.
function a_end_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function maxlevel_Callback(hObject, eventdata, handles)
% hObject    handle to maxlevel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of maxlevel as text
%        str2double(get(hObject,'String')) returns contents of maxlevel as a double


% --- Executes during object creation, after setting all properties.
function maxlevel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to maxlevel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in removeart.
function removeart_Callback(hObject, eventdata, handles)
% hObject    handle to removeart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
astart=str2double(get(handles.a_start, 'String'));
aend=str2double(get(handles.a_end, 'String'));
ecg=handles.ecg;
ecg(astart:aend)=0;
ecg=nonzeros(ecg);

axes(handles.axes1)
 plot(ecg), axis tight; grid on;
 
 mmax=max(ecg); %max of whole signal display
 mmin=min(ecg);
 mmu=mean(ecg); % mean of whole signal display
 stde=std(ecg);
 
 fmmu= sprintf('%.3f',mmu);
 fstd= sprintf('%.3f',stde);
  
 set(handles.edit_min,'String',mmin)
 set(handles.edit_max,'String',mmax)
 set(handles.edit_mean,'String',fmmu)
 set(handles.edit_std,'String',fstd)

 set(handles.messages,'String','Artifact manually cropped')

 handles.ecg=ecg;
 guidata(hObject, handles);


    
% --- Executes on button press in load_ecg.
function load_ecg_Callback(hObject, eventdata, handles)
% hObject    handle to load_ecg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[file,path] = uigetfile('..\data\*.txt');

hFigure = gcf; % Get the current figure handle
set(hFigure, 'Pointer', 'watch');
drawnow;

fname=fullfile(path,file);
handles.fname=fname;
% ff=fopen(fname,'r');
% firstline=fgetl(ff); 
% 
% while ~isnumeric(firstline)
% firstline=fgetl(ff); 
% end
% ff=fopen(fname,'w');
% fprintf(ff,'%s\n');
% fclose(ff);   

data=load(fname);
 
 [s1,s2]=size(data);
  if s1<s2
      data=data';
  end
 [s1,s2]=size(data);
 ch=1:s2;
 handles.data=data;
 
 newItems = num2cell(ch);
 set(handles.pop_chan, 'String', newItems);
 
 set(hFigure, 'Pointer', 'arrow');
drawnow;
 
set(handles.messages,'String','File Loaded. Please enter Fs and select channel')
guidata(hObject, handles);

 
 
function fs_edit_Callback(hObject, eventdata, handles)
% hObject    handle to fs_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fs_edit as text
%        str2double(get(hObject,'String')) returns contents of fs_edit as a double


% --- Executes during object creation, after setting all properties.
function fs_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fs_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sigmax_Callback(hObject, eventdata, handles)
% hObject    handle to sigmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sigmax as text
%        str2double(get(hObject,'String')) returns contents of sigmax as a double


% --- Executes during object creation, after setting all properties.
function sigmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sigmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sigmean_Callback(hObject, eventdata, handles)
% hObject    handle to sigmean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sigmean as text
%        str2double(get(hObject,'String')) returns contents of sigmean as a double


% --- Executes during object creation, after setting all properties.
function sigmean_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sigmean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in filter_des.
function filter_des_Callback(hObject, eventdata, handles)
% hObject    handle to filter_des (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filterDesigner

% --- Executes on button press in load_filter.
function load_filter_Callback(hObject, eventdata, handles)
% hObject    handle to load_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path] = uigetfile('..\filtercoefs\*.mat');

pathw=pwd;
cd(path)
load(file)
cd(pathw)

handles.Hd=Hd;
guidata(hObject, handles);
set(handles.messages,'String','Filter coefficients loaded, please apply filter')


% --- Executes on button press in app_filter.
function app_filter_Callback(hObject, eventdata, handles)
% hObject    handle to app_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Hd=handles.Hd;

if Hd~=0
    x=handles.ecg;
    y = filter(Hd,x);
    handles.y=y;
else
    error('Please load filter coefficients')
end

N=length(x);

if isprop(Hd,'Numerator')
    T=round(length(Hd.Numerator)/2);
else
    T=(Hd.order-1)/2;
end

y=y(T:end);

axes(handles.axes1)
plot(1:N,x,'b',1:N-T+1,y,'r'); axis tight; grid on;
legend('Original','Filtered')

set(handles.messages,'String','If you are happy with the results, save filtered signal ')
 
guidata(hObject, handles);

% --- Executes on button press in save_y.
function save_y_Callback(hObject, eventdata, handles)
% hObject    handle to save_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
y=handles.y;
handles.ecg=y;
guidata(hObject, handles);

set(handles.messages,'String','ECG signal updated')

 axes(handles.axes1)
 plot(y), axis tight; grid on;


% --- Executes on selection change in pop_chan.
function pop_chan_Callback(hObject, eventdata, handles)
% hObject    handle to pop_chan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pop_chan contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pop_chan


% --- Executes during object creation, after setting all properties.
function pop_chan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop_chan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in load_signal.
function load_signal_Callback(hObject, eventdata, handles)
% hObject    handle to load_signal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 fs = str2double(get(handles.fs_edit, 'String'));
 handles.fs=fs;
 ch = get(handles.pop_chan, 'Value'); 
 ecg=handles.data(:,ch);
 handles.ecg=ecg;
 guidata(hObject, handles);
 axes(handles.axes1)
 plot(ecg), axis tight; grid on;
 
 
 mmax=max(ecg); %max of whole signal display
 mmin=min(ecg);
 mmu=mean(ecg); % mean of whole signal display
 stde=std(ecg);
 
 fmmu= sprintf('%.3f',mmu);
 fstd= sprintf('%.3f',stde);
  
 set(handles.edit_min,'String',mmin)
 set(handles.edit_max,'String',mmax)
 set(handles.edit_mean,'String',fmmu)
 set(handles.edit_std,'String',fstd)
 
  set(handles.messages,'String','Selected signal plotted')
 

function edit_min_Callback(hObject, eventdata, handles)
% hObject    handle to edit_min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_min as text
%        str2double(get(hObject,'String')) returns contents of edit_min as a double


% --- Executes during object creation, after setting all properties.
function edit_min_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit_max_Callback(hObject, eventdata, handles)
% hObject    handle to edit_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_max as text
%        str2double(get(hObject,'String')) returns contents of edit_max as a double


% --- Executes during object creation, after setting all properties.
function edit_max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_mean_Callback(hObject, eventdata, handles)
% hObject    handle to edit_mean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_mean as text
%        str2double(get(hObject,'String')) returns contents of edit_mean as a double


% --- Executes during object creation, after setting all properties.
function edit_mean_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_mean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_std_Callback(hObject, eventdata, handles)
% hObject    handle to edit_std (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_std as text
%        str2double(get(hObject,'String')) returns contents of edit_std as a double


% --- Executes during object creation, after setting all properties.
function edit_std_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_std (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in locater.
function locater_Callback(hObject, eventdata, handles)
% hObject    handle to locater (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ecg=handles.ecg;
R_loc=PT_rloc(ecg,handles.fs);

handles.rloc=R_loc;
guidata(hObject, handles);

N=length(ecg);
axes(handles.axes1)
plot(1:N,ecg,'b', R_loc,ecg(R_loc),'r*'); axis tight; grid on;

set(handles.messages,'String','R peaks located, write segment length')

    
% --- Executes on selection change in segmentle.
function segmentle_Callback(hObject, eventdata, handles)
% hObject    handle to segmentle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns segmentle contents as cell array
%        contents{get(hObject,'Value')} returns selected item from segmentle


% --- Executes during object creation, after setting all properties.
function segmentle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to segmentle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in segment.
function segment_Callback(hObject, eventdata, handles)
% hObject    handle to segment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

ecg=handles.ecg;
slen=str2double(get(handles.slength,'String'));
N=length(ecg);

if isfield(handles,'rloc')
    R_loc=handles.rloc;
    i_start=find(R_loc-slen>0,1);
    i_end=find(N-R_loc<slen,1)-1;
    len=round(slen/2);
    k=1;
    Data=[];
    for i=i_start:i_end
        Data(k,:)=ecg(R_loc(i)-len:R_loc(i)+len-1);
        k=k+1;
    end
    
    [filepath,name,ext] = fileparts(handles.fname);
    fname1=strcat('..\csv\',name,'.csv');
    
    [file,path] = uiputfile(fname1);
    if isequal(file,0) || isequal(path,0)
        set(handles.messages,'String','User clicked Cancel, csv file not saved')
    else
        fname2=fullfile(path,file);
        writematrix(Data,fname2)
        set(handles.messages,'String','Segmented data saved to csv file')
    end
else
    set(handles.messages,'String','Please locate R peaks first')
end

  
function messages_Callback(hObject, eventdata, handles)
% hObject    handle to messages (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of messages as text
%        str2double(get(hObject,'String')) returns contents of messages as a double


% --- Executes during object creation, after setting all properties.
function messages_CreateFcn(hObject, eventdata, handles)
% hObject    handle to messages (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function slength_Callback(hObject, eventdata, handles)
% hObject    handle to slength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of slength as text
%        str2double(get(hObject,'String')) returns contents of slength as a double


% --- Executes during object creation, after setting all properties.
function slength_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in resetfilter.
function resetfilter_Callback(hObject, eventdata, handles)
% hObject    handle to resetfilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

ecg=handles.ecg;
set(handles.messages,'String','Signal restored to its state before filtering.')

 guidata(hObject, handles);
 axes(handles.axes1)
 plot(ecg), axis tight; grid on;


% --- Executes on button press in custom.
function custom_Callback(hObject, eventdata, handles)
% hObject    handle to custom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[func1,path]=uigetfile('..\custom\*.m');
set(handles.messages,'String','Custom function selected, enter the arguments and apply function')

func=fullfile(path,func1);
handles.func=func;
guidata(hObject, handles);


% --- Executes on button press in reset_custom.
function reset_custom_Callback(hObject, eventdata, handles)
% hObject    handle to reset_custom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ecg=handles.ecg;
set(handles.messages,'String','Signal restored to its state before custom function application.')


 guidata(hObject, handles);
 axes(handles.axes1)
 plot(ecg), axis tight; grid on;

% --- Executes on button press in save_custom.
function save_custom_Callback(hObject, eventdata, handles)
% hObject    handle to save_custom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

y=handles.y;
handles.ecg=y;
guidata(hObject, handles);

set(handles.messages,'String','Signal updated')

 axes(handles.axes1)
 plot(y), axis tight; grid on;



function arg_Callback(hObject, eventdata, handles)
% hObject    handle to arg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of arg as text
%        str2double(get(hObject,'String')) returns contents of arg as a double


% --- Executes during object creation, after setting all properties.
function arg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to arg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in apply_custom.
function apply_custom_Callback(hObject, eventdata, handles)
% hObject    handle to apply_custom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

ecg=handles.ecg;

func=handles.func;
[filepath,fun_name,ext] = fileparts(func);

argu=str2num(get(handles.arg,'String'));

path=pwd;
cd(filepath)
y=feval(fun_name,ecg,argu);
cd(path)

handles.y=y;
guidata(hObject, handles);

axes(handles.axes1)
plot(1:length(ecg),ecg,'b',1:length(y),y,'r'), axis tight; grid on;
legend('Original','Processed')
set(handles.messages,'String','Custom script applied. If you are happy with the result save signal otherwise reset')



% --- Executes on button press in minmax.
function minmax_Callback(hObject, eventdata, handles)
% hObject    handle to minmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ecg=handles.ecg;
ecg=(ecg-min(ecg))/(max(ecg)-min(ecg));


axes(handles.axes1)
plot(ecg), axis tight; grid on;
 
mmax=max(ecg); %max of whole signal display
mmin=min(ecg);
mmu=mean(ecg); % mean of whole signal display
stde=std(ecg);

fmmu= sprintf('%.3f',mmu);
fstd= sprintf('%.3f',stde);

set(handles.edit_min,'String',mmin);
set(handles.edit_max,'String',mmax)
set(handles.edit_mean,'String',fmmu)
set(handles.edit_std,'String',fstd)

handles.ecg=ecg;
set(handles.messages,'String','Signal normalized')

guidata(hObject,handles)
