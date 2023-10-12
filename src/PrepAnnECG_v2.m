function varargout = PrepAnnECG_v2(varargin)
% PREPANNECG_V2 MATLAB code for PrepAnnECG_v2.fig
%      PREPANNECG_V2, by itself, creates a new PREPANNECG_V2 or raises the existing
%      singleton*.
%
%      H = PREPANNECG_V2 returns the handle to a new PREPANNECG_V2 or the handle to
%      the existing singleton*.
%
%      PREPANNECG_V2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PREPANNECG_V2.M with the given input arguments.
%
%      PREPANNECG_V2('Property','Value',...) creates a new PREPANNECG_V2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PrepAnnECG_v2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PrepAnnECG_v2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PrepAnnECG_v2

% Last Modified by GUIDE v2.5 11-Oct-2023 17:56:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @PrepAnnECG_v2_OpeningFcn, ...
    'gui_OutputFcn',  @PrepAnnECG_v2_OutputFcn, ...
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


% --- Executes just before PrepAnnECG_v2 is made visible.
function PrepAnnECG_v2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PrepAnnECG_v2 (see VARARGIN)

% Choose default command line output for PrepAnnECG_v2
% axes(handles.axes1)
% cla

%set(handles.comment,'String','  ');
guidata(hObject, handles);



% UIWAIT makes PrepAnnECG_v2 wait for user response (see UIRESUME)
% uiwait(handles.prepannecg_v2);


% --- Outputs from this function are returned to the command line.
function varargout = PrepAnnECG_v2_OutputFcn(hObject, eventdata, handles)
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

place=round(N/10);
text(place,(max(sample)*0.9),strcat(num2str(index),". Beat"),'FontSize',12,'FontWeight','Bold');
text(place,(max(sample)*0.8),strcat(name),'FontSize',12,'FontWeight','Bold');
handles.axes1.XTick=0:32:N;
handles.axes1.GridColor='r';
hold on,
eks=round(N/2)-round(N/16):round(N/2)+round(N/16);
plot(eks,sample(eks),'m','LineWidth',2),hold off


if size(label,1)>=index & ~ismissing(label{index,1})
    switch char(label(index,1))
        case 'AF'
            lgd=legend('AF');
            lgd.TextColor='red';
            
        case 'NSR'
            lgd=legend('NSR')
            lgd.TextColor='g';
            
            
        case 'AFL'
            lgd=legend('AFL')
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

if size(label,1)>=index & ~ismissing(label{index,2})
switch char(label{index,2})
    case 'NQRS'
    text(N-round(N/20),(max(sample)*0.8),'NQRS','FontSize',16,'FontWeight','Bold','Color','b');

     case 'WQRS'
     text(N-round(N/20),(max(sample)*0.8),'WQRS','FontSize',16,'FontWeight','Bold','Color','b');

    otherwise
end
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

place=round(N/10);
text(place,(max(sample)*0.9),strcat(num2str(index),". Beat"),'FontSize',12,'FontWeight','Bold');
text(place,(max(sample)*0.8),strcat(name),'FontSize',12,'FontWeight','Bold');
handles.axes1.XTick=0:32:N;
handles.axes1.GridColor='r';
hold on,
eks=round(N/2)-round(N/16):round(N/2)+round(N/16);
plot(eks,sample(eks),'m','LineWidth',2),hold off


if size(label,1)>=index & ~ismissing(label{index,1})
switch char(label(index,1))
    case 'AF'
        lgd=legend('AF');
        lgd.TextColor='red';

    case 'NSR'
        lgd=legend('NSR')
        lgd.TextColor='g';
        
         
    case 'AFL'
        lgd=legend('AFL')
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

 axes(handles.axes1)
 
 if size(label,1)>=index & ~ismissing(label{index,2})
     switch char(label(index,2))
         case 'NQRS'
             text(N-round(N/20),(max(sample)*0.8),'NQRS','FontSize',16,'FontWeight','Bold','Color','b');
             
         case 'WQRS'
             text(N-round(N/20),(max(sample)*0.8),'WQRS','FontSize',16,'FontWeight','Bold','Color','b');
             
         otherwise
     end
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
    if(size(label,1)+1)<=NN index=size(label,1)+1;
    else index=size(label,1)
    end
else
    label={'  '};
    writecell(label, labelfname);
    index=1;
end

axes(handles.axes1)
sample=A(index,:);
plot(sample)
axis tight;grid on;
place=round(N/10);
text(place,(max(sample)*0.9),strcat(num2str(index),". Beat"),'FontSize',12,'FontWeight','Bold');
text(place,(max(sample)*0.8),strcat(name),'FontSize',12,'FontWeight','Bold');
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
        
    case 'WQRS'
        lgd=legend('WQRS')
        lgd.TextColor='b';
        
    case 'AFI'
        lgd=legend('AFI')
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


% --- Executes on button press in wqrs.
function wqrs_Callback(hObject, eventdata, handles)
% hObject    handle to wqrs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
label=handles.label;
index=handles.index;

A=handles.A;
N=size(A,2);
sample=A(index,:);

label{index,2}='WQRS';
axes(handles.axes1)
text(N-round(N/20),(max(sample)*0.8),'WQRS','FontSize',16,'FontWeight','Bold','Color','b');


handles.label=label;
guidata(hObject, handles);

% --- Executes on button press in afl.
function afl_Callback(hObject, eventdata, handles)
% hObject    handle to afl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
label=handles.label;
index=handles.index;

label{index,1}='AFL';
axes(handles.axes1)
lgd=legend('AFL');
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

% --- Executes when user attempts to close prepannecg_v2.
function prepannecg_CloseRequestFcn(hObject, ~, handles)
% hObject    handle to prepannecg_v2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure

if isfield(handles,'label') & isfield(handles,'labelfname')
    
    label=handles.label;
    labelfname=handles.labelfname;
    writetable(cell2table(label),labelfname);
end
delete(hObject);

function prepannecg_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to prepannecg_v2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on prepannecg_v2 or any of its controls.
function prepannecg_WindowKeyPressFcn(hObject, eventdata, handles)
% hObject    handle to prepannecg_v2 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in nqrs.
function nqrs_Callback(hObject, eventdata, handles)
% hObject    handle to nqrs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

label=handles.label;
index=handles.index;

A=handles.A;
N=size(A,2);
sample=A(index,:);

label{index,2}='NQRS';
axes(handles.axes1)
text(N-round(N/20),(max(sample)*0.8),'NQRS','FontSize',16,'FontWeight','Bold','Color','b');


handles.label=label;
guidata(hObject, handles);
