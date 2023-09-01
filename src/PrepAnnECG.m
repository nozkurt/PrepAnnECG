function varargout = PrepAnnECG(varargin)
% PREPANNECG MATLAB code for PrepAnnECG.fig
%      PREPANNECG, by itself, creates a new PREPANNECG or raises the existing
%      singleton*.
%
%      H = PREPANNECG returns the handle to a new PREPANNECG or the handle to
%      the existing singleton*.
%
%      PREPANNECG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PREPANNECG.M with the given input arguments.
%
%      PREPANNECG('Property','Value',...) creates a new PREPANNECG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PrepAnnECG_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PrepAnnECG_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PrepAnnECG

% Last Modified by GUIDE v2.5 01-Sep-2023 13:44:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @PrepAnnECG_OpeningFcn, ...
    'gui_OutputFcn',  @PrepAnnECG_OutputFcn, ...
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


% --- Executes just before PrepAnnECG is made visible.
function PrepAnnECG_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PrepAnnECG (see VARARGIN)

% Choose default command line output for PrepAnnECG
% axes(handles.axes1)
% cla

%set(handles.comment,'String','  ');
guidata(hObject, handles);



% UIWAIT makes PrepAnnECG wait for user response (see UIRESUME)
% uiwait(handles.prepannecg);


% --- Outputs from this function are returned to the command line.
function varargout = PrepAnnECG_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
%varargout{1} = handles.output;


% --- Executes on button press in nsr.
function nsr_Callback(hObject, eventdata, handles)
% hObject    handle to nsr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

label=handles.label;
index=handles.index;

label{index,1}='NSR';
axes(handles.axes1)
lgd=legend('NSR');
lgd.TextColor='red';
legend('boxoff')
lgd.FontSize = 16;
lgd.FontWeight = 'bold';

handles.label=label;
guidata(hObject, handles);

% --- Executes on button press in af.
function af_Callback(hObject, eventdata, handles)
% hObject    handle to af (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
label=handles.label;
index=handles.index;

label{index,1}='AF';
axes(handles.axes1)
lgd=legend('AF');
lgd.TextColor='red';
legend('boxoff')
lgd.FontSize = 16;
lgd.FontWeight = 'bold';

handles.label=label;
guidata(hObject, handles);

% --- Executes on button press in prev.
function prev_Callback(hObject, eventdata, handles)
% hObject    handle to prev (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
index=handles.index;
if index-1>=1
    index=index-1;
end
A=handles.A;
label=handles.label;
name=handles.name;

sample=A(index,:);
N=length(sample);
axes(handles.axes1)
sample=A(index,:);
plot(sample)
axis tight;grid on;

place=round(N/8);
text(N-place,(max(sample)*0.9),strcat(num2str(index),". Beat"),'FontSize',12,'FontWeight','Bold');
text(N-place,(max(sample)*0.8),strcat(name),'FontSize',12,'FontWeight','Bold');
handles.axes1.XTick=0:32:N;
handles.axes1.GridColor='r';
hold on,
eks=round(N/2)-round(N/16):round(N/2)+round(N/16);
plot(eks,sample(eks),'m','LineWidth',2),hold off


if size(label,1)>=index
switch label{index}
    case 'AF'
        lgd=legend('AF');
        lgd.TextColor='red';
        
    case 'NSR'
        lgd=legend('NSR')
        lgd.TextColor='g';
        
    case 'LBBB'
        lgd=legend('LBBB')
        lgd.TextColor='b';
        
    case 'RBBB'
        lgd=legend('RBBB')
        lgd.TextColor='y';
        
        
    case 'APB'
        lgd=legend('APB')
        lgd.TextColor='m';
        
        
    case 'PVC'
        lgd=legend('PVC')
        lgd.TextColor='b';
        
    
    case 'other'
        lgd=legend('Other')
        lgd.TextColor='k';
    case '?'
        lgd=legend('?')
        lgd.TextColor='b';
    otherwise
        lgd=legend('  ')
end
legend('boxoff')
lgd.FontSize = 16;
lgd.FontWeight = 'bold';
end

handles.index=index;
guidata(hObject, handles);




% --- Executes on button press in next.
function next_Callback(hObject, eventdata, handles)
% hObject    handle to next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
A=handles.A;
index=handles.index;
name=handles.name;

label=handles.label;
if index+1<=size(A,1)
    index=index+1;
end

sample=A(index,:);
N=length(sample);
axes(handles.axes1)
sample=A(index,:);
plot(sample)
axis tight;grid on;

place=round(N/8);
text(N-place,(max(sample)*0.9),strcat(num2str(index),". Beat"),'FontSize',12,'FontWeight','Bold');
text(N-place,(max(sample)*0.8),strcat(name),'FontSize',12,'FontWeight','Bold');
handles.axes1.XTick=0:32:N;
handles.axes1.GridColor='r';
hold on,
eks=round(N/2)-round(N/16):round(N/2)+round(N/16);
plot(eks,sample(eks),'m','LineWidth',2),hold off


if size(label,1)>=index
switch label{index}
    case 'AF'
        lgd=legend('AF');
        lgd.TextColor='red';

    case 'NSR'
        lgd=legend('NSR')
        lgd.TextColor='g';
        
    case 'LBBB'
        lgd=legend('LBBB')
        lgd.TextColor='b';
        
    case 'RBBB'
        lgd=legend('RBBB')
        lgd.TextColor='y';
        
        
    case 'APB'
        lgd=legend('APB')
        lgd.TextColor='m';
        
        
    case 'PVC'
        lgd=legend('PVC')
        lgd.TextColor='b';
        
        
    case 'other'
        lgd=legend('Other')
        lgd.TextColor='k';
    case '?'
        lgd=legend('?')
        lgd.TextColor='b';
    otherwise
        lgd=legend('  ')
end
legend('boxoff')
lgd.FontSize = 16;
lgd.FontWeight = 'bold';
end

handles.index=index;
guidata(hObject, handles);








% --- Executes on button press in diger.
function diger_Callback(hObject, eventdata, handles)
% hObject    handle to diger (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

label=handles.label;
index=handles.index;

label{index,1}='other';
axes(handles.axes1)
lgd=legend('other');
lgd.TextColor='k';
legend('boxoff')
lgd.FontSize = 16;
lgd.FontWeight = 'bold';

handles.label=label;
guidata(hObject, handles);


% --------------------------------------------------------------------
function Open_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to Open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[file,path] = uigetfile('..\csv\*.csv');
filename=fullfile(path,file);
[filepath,name,ext] = fileparts(filename);
A = readmatrix(filename);

handles.name=name;
handles.A=A;
handles.filename=filename;
NN=size(A,1);
N=size(A,2);


labelpath='..\label\';
labelname=strcat(name,'_label.csv');
labelfname=fullfile(labelpath,labelname);
handles.labelfname=labelfname;

if exist(labelfname, 'file') == 2
    label = readcell(labelfname);
    index=size(label,1)+1;
else
    label={'  '};
    writecell(label, labelfname);
    index=1;
end

axes(handles.axes1)
sample=A(index,:);
plot(sample)
axis tight;grid on;
place=round(N/8);
text(N-place,(max(sample)*0.9),strcat(num2str(index),". Beat"),'FontSize',12,'FontWeight','Bold');
text(N-place,(max(sample)*0.8),strcat(name),'FontSize',12,'FontWeight','Bold');
handles.axes1.XTick=0:32:N;
handles.axes1.GridColor='r';
hold on,
eks=round(N/2)-round(N/16):round(N/2)+round(N/16);
plot(eks,sample(eks),'m','LineWidth',2),hold off

if size(label,1)>=index
switch label{index}
    case 'AF'
        lgd=legend('AF');
        lgd.TextColor='red';
        
    case 'NSR'
        lgd=legend('NSR')
        lgd.TextColor='g';
        
    case 'LBBB'
        lgd=legend('LBBB')
        lgd.TextColor='b';
        
    case 'RBBB'
        lgd=legend('RBBB')
        lgd.TextColor='y';
        
        
    case 'APB'
        lgd=legend('APB')
        lgd.TextColor='m';
        
        
    case 'PVC'
        lgd=legend('PVC')
        lgd.TextColor='b';
        
        
    case 'Diger'
        lgd=legend('Other')
        lgd.TextColor='k';
    case '?'
        lgd=legend('?')
        lgd.TextColor='b';
    otherwise
        lgd=legend('  ')
end
legend('boxoff')
lgd.FontSize = 16;
lgd.FontWeight = 'bold';
end

handles.label=label;
handles.index=index;
guidata(hObject, handles);


% --- Executes on button press in unknown.
function unknown_Callback(hObject, eventdata, handles)
% hObject    handle to unknown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% axes(handles.axes1)
% h = imdistline;
% fcn = makeConstrainToRectFcn('imline',get(gca,'XLim'),get(gca,'YLim'));
% setDragConstraintFcn(h,fcn);

label=handles.label;
index=handles.index;

label{index,1}='?';
axes(handles.axes1)
lgd=legend('?');
lgd.TextColor='red';
legend('boxoff')
lgd.FontSize = 16;
lgd.FontWeight = 'bold';

handles.label=label;
guidata(hObject, handles);


% --- Executes on button press in lbb.
function lbb_Callback(hObject, eventdata, handles)
% hObject    handle to lbb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
label=handles.label;
index=handles.index;

label{index,1}='LBBB';
axes(handles.axes1)
lgd=legend('LBBB');
lgd.TextColor='red';
legend('boxoff')
lgd.FontSize = 16;
lgd.FontWeight = 'bold';

handles.label=label;
guidata(hObject, handles);

% --- Executes on button press in rbb.
function rbb_Callback(hObject, eventdata, handles)
% hObject    handle to rbb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
label=handles.label;
index=handles.index;

label{index,1}='RBBB';
axes(handles.axes1)
lgd=legend('RBBB');
lgd.TextColor='red';
legend('boxoff')
lgd.FontSize = 16;
lgd.FontWeight = 'bold';

handles.label=label;
guidata(hObject, handles);

% --- Executes on button press in apb.
function apb_Callback(hObject, eventdata, handles)
% hObject    handle to apb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
label=handles.label;
index=handles.index;

label{index,1}='APB';
axes(handles.axes1)
lgd=legend('APB');
lgd.TextColor='red';
legend('boxoff')
lgd.FontSize = 16;
lgd.FontWeight = 'bold';

handles.label=label;
guidata(hObject, handles);

% --- Executes on button press in PVC.
function PVC_Callback(hObject, eventdata, handles)
% hObject    handle to PVC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
label=handles.label;
index=handles.index;

label{index,1}='PVC';
axes(handles.axes1)
lgd=legend('PVC');
lgd.TextColor='red';
legend('boxoff')
lgd.FontSize = 16;
lgd.FontWeight = 'bold';

handles.label=label;
guidata(hObject, handles);

% --- Executes when user attempts to close prepannecg.
function prepannecg_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to prepannecg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure

if isfield(handles,'label') & isfield(handles,'labelfname')
    
    label=handles.label;
    labelfname=handles.labelfname;
    writecell(label,labelfname);
end
delete(hObject);

function prepannecg_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to prepannecg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on prepannecg or any of its controls.
function prepannecg_WindowKeyPressFcn(hObject, eventdata, handles)
% hObject    handle to prepannecg (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
