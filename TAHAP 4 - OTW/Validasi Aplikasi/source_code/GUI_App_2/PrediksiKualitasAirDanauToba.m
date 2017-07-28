% Inisialisasi callback dari figure
% Bagian default dari MATLAB
% Perhatian: BAGIAN INI TIDAK BOLEH DIUBAH ATAUPUN DIHAPUS
function varargout = PrediksiKualitasAirDanauToba(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PrediksiKualitasAirDanauToba_OpeningFcn, ...
                   'gui_OutputFcn',  @PrediksiKualitasAirDanauToba_OutputFcn, ...
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


% Dijalankan ketika figure dibuka
function PrediksiKualitasAirDanauToba_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PrediksiKualitasAirDanauToba (see VARARGIN)

% Choose default command line output for PrediksiKualitasAirDanauToba
handles.output = hObject;
handles.ActivationFunction = 'sig';
handles.HiddenNeuronNumber = 1;
handles.TrainingTime = 0.0;
handles.TrainingAccuracy = 0.0;
handles.TestingTime = 0.0;
handles.TestingAccuracy = 0.0;
handles.Iterations = 1;

% Untuk memasukkan logo institusi ke GUI
logo_institusi = imread('logo_institusi.jpg');
comp_logo_institusi = handles.logo_institusi;
imshow(logo_institusi, 'Parent', comp_logo_institusi);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PrediksiKualitasAirDanauToba wait for user response (see UIRESUME)
% uiwait(handles.main_figure);


% --- Outputs from this function are returned to the command line.
function varargout = PrediksiKualitasAirDanauToba_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txtTrainingFileLocation_Callback(hObject, eventdata, handles)
% hObject    handle to txtTrainingFileLocation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtTrainingFileLocation as text
%        str2double(get(hObject,'String')) returns contents of txtTrainingFileLocation as a double


% --- Executes during object creation, after setting all properties.
function txtTrainingFileLocation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtTrainingFileLocation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnPilihFileTesting.
function btnPilihFileTesting_Callback(hObject, eventdata, handles)
% hObject    handle to btnPilihFileTesting (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[TestingFileName, TestingFilePath] = uigetfile('*.txt', 'Select testing dataset.')
testingTextBox = handles.txtTestingFileLocation;
set(testingTextBox, 'String', strcat(TestingFilePath, TestingFileName));
guidata(hObject, handles);

function txtTestingFileLocation_Callback(hObject, eventdata, handles)
% hObject    handle to txtTestingFileLocation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtTestingFileLocation as text
%        str2double(get(hObject,'String')) returns contents of txtTestingFileLocation as a double


% --- Executes during object creation, after setting all properties.
function txtTestingFileLocation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtTestingFileLocation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnPilihFileTraining.
function btnPilihFileTraining_Callback(hObject, eventdata, handles)
% hObject    handle to btnPilihFileTraining (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[TrainingFileName, TrainingFilePath] = uigetfile('*.txt', 'Select training dataset.');
trainTextBox = handles.txtTrainingFileLocation;
set(trainTextBox, 'String', strcat(TrainingFilePath, TrainingFileName));
guidata(hObject, handles);


function txtJumlahHiddenNeuron_Callback(hObject, eventdata, handles)
% hObject    handle to txtJumlahHiddenNeuron (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtJumlahHiddenNeuron as text
%        str2double(get(hObject,'String')) returns contents of txtJumlahHiddenNeuron as a double


% --- Executes during object creation, after setting all properties.
function txtJumlahHiddenNeuron_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtJumlahHiddenNeuron (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over txtJumlahHiddenNeuron.
function txtJumlahHiddenNeuron_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to txtJumlahHiddenNeuron (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnNaikkanJumlahHiddenNeuron.
function btnNaikkanJumlahHiddenNeuron_Callback(hObject, eventdata, handles)
% hObject    handle to btnNaikkanJumlahHiddenNeuron (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
boxHiddenNeuron = handles.txtJumlahHiddenNeuron;
if str2num(get(boxHiddenNeuron, 'String')) < 100
    handles.HiddenNeuronNumber = str2num(get(boxHiddenNeuron, 'String')) + 1;
    set(boxHiddenNeuron, 'String', num2str(handles.HiddenNeuronNumber));
end
guidata(hObject, handles);


% --- Executes on button press in btnKurangiJumlahHiddenNeuron.
function btnKurangiJumlahHiddenNeuron_Callback(hObject, eventdata, handles)
% hObject    handle to btnKurangiJumlahHiddenNeuron (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
boxHiddenNeuron = handles.txtJumlahHiddenNeuron;
if str2num(get(boxHiddenNeuron, 'String')) > 1
    handles.HiddenNeuronNumber = str2num(get(boxHiddenNeuron, 'String')) - 1;
    set(boxHiddenNeuron, 'String', num2str(handles.HiddenNeuronNumber));
end
guidata(hObject, handles);

% --- Executes on selection change in cbxFungsiAktivasi.
function cbxFungsiAktivasi_Callback(hObject, eventdata, handles)
% hObject    handle to cbxFungsiAktivasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns cbxFungsiAktivasi contents as cell array
%        contents{get(hObject,'Value')} returns selected item from cbxFungsiAktivasi
contents = cellstr(get(hObject, 'String'));
handles.ActivationFunction = contents{get(hObject, 'Value')};
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function cbxFungsiAktivasi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cbxFungsiAktivasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% Fungsi callback untuk tombol "Start Prediction"
function btnPrediksi_Callback(hObject, eventdata, handles)
% hObject    handle to btnPrediksi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Ambil objek textbox
boxLokasiFileTraining = handles.txtTrainingFileLocation;
boxLokasiFileTesting = handles.txtTestingFileLocation;

% Ambil objek fungsi aktivasi
boxPilihFgsAktivasi = handles.cbxFungsiAktivasi;

% Ambil lokasi file dataset
lokasi_file_training = get(boxLokasiFileTraining, 'String');
lokasi_file_testing = get(boxLokasiFileTesting, 'String');

% Ambil fungsi aktivasi yang dipilih
content = get(boxPilihFgsAktivasi, 'String');

% Perbandingan, jika salah satu dari dataset latih atau uji tidak
% disediakan, maka operasi tidak akan berjalan.
%       
% Operasi baru dapat dijalankan jika dataset latih dan dataset uji
% disediakan kepada sistem.
if isequal(lokasi_file_training, 'Select the dataset file first.') ...
        || isequal(lokasi_file_testing, 'Select the dataset file first.')
    % Munculkan notifikasi
    msgbox('Sorry, you do not provide training or testing dataset file yet. Please check and try again.', 'Notification');
else
    % Mengubah teks pada Notifikasi di bagian bawah
    set(handles.NotificationText, 'String', 'Please wait, the prediction process is being performed.');
    % Mengubah status "Enabled" pada btnPrediksi
    set(handles.btnPrediksi, 'Enable', 'off');
    
    pause('on');
    pause(1);
    pause('off');
    
    % Inisialisasi matriks dan variabel untuk perekaman hasil prediksi, error
    % latih dan uji, epoch, serta waktu latih dan uji
    TrainingAccuracyRecord = [];
    TrainingTimeRecord = [];
    TestingAccuracyRecord = [];
    TestingTimeRecord = [];
    EpochRecord = [];
    ResultsRecord = [];
    
    % Ganti notifikasi di bawah menjadi kalimat untuk mengisyaratkan
    % pengguna agar menunggu proses prediksi.
    NotifText = handles.NotificationText;
    set(NotifText, 'String', 'Please wait while the prediction process is being performed.');
    
    % Memuat data file testing dan mengambil keluaran yang diharapkan dari
    % file testing tersebut
    tData = load(lokasi_file_testing);
    predictedOutput = tData(:, 1)';
    
    % Menetapkan hitungan awal dan batas atas perulangan proses pelatihan
    % dan pengujian
    epochCount = 0;
    maxEpoch = 3000;
    
    % Untuk setiap perulangan
    while epochCount < maxEpoch
        % Tambahkan epoch dengan 1
        epochCount = epochCount + 1;
        
        % Rekam epoch ke matriks
        EpochRecord = [EpochRecord epochCount];
        
        % Rekam waktu mulai pelatihan
        TrainingStartTime = cputime;
        
        % Mulai proses pelatihan
        [TrainingTime, TrainingAccuracy] = elm_train(lokasi_file_training, 0, handles.HiddenNeuronNumber, handles.ActivationFunction);
        
        % Rekam waktu selesai pelatihan
        TrainingEndTime = cputime;
        
        % Rekam waktu latih
        TrainingTimeRecord = [TrainingTimeRecord (TrainingEndTime - TrainingStartTime)];
        
        % Rekam error latih
        TrainingAccuracyRecord = [TrainingAccuracyRecord TrainingAccuracy];
        
        % Ambil waktu mulai pengujian
        TestingStartTime = cputime;
        
        % Mulai proses pengujian
        [TestingTime, TestingAccuracy] = elm_predict(lokasi_file_testing);
        
        % Ambil waktu selesai pengujian
        TestingEndTime = cputime;
        
        % Rekam error uji
        TestingAccuracyRecord = [TestingAccuracyRecord TestingAccuracy];
        
        % Rekam waktu uji
        TestingTimeRecord = [TestingTimeRecord (TestingEndTime - TestingStartTime)];
        
        % Muat hasil prediksi dari proses pengujian
        load('elm_output.mat', 'output');
        
        % Simpan hasil prediksi ke dalam matriks
        ResultsRecord = [ResultsRecord; output];
    end
    
    % Simpan hasil pengujian ke dalam sebuah file bernama 'records.mat',
    % yang dapat diubah menjadi format JSON pada kemudian hari.
    save('records',...
        'TrainingAccuracyRecord', 'TestingAccuracyRecord',...
        'TrainingTimeRecord', 'TestingTimeRecord',...
        'ResultsRecord');
    
    % Pengambilan hasil terbaik dari setiap pengujian
    % Untuk setiap pengujian, sampel data akan disimpan
    % Data yang disimpan:
    % - Error latih terendah
    BestTrainingAccuracy = min(TrainingAccuracyRecord);
    
    % - Error uji terendah
    BestTestingAccuracy = min(TestingAccuracyRecord);
    
    % - Epoch untuk mencapai error latih terendah
    BestTrainingEpoch = find(TrainingAccuracyRecord == BestTrainingAccuracy);
    
    % - Epoch untuk mencapai error uji terendah
    BestTestingEpoch = find(TestingAccuracyRecord == BestTestingAccuracy);
    
    % - Error uji pada saat mencapai error latih terendah
    TestingErrorOfBestTrainingResult = TestingAccuracyRecord(:, BestTrainingEpoch);
    
    % - Error latih pada saat mencapai error uji terendah
    TrainingErrorOfBestTestingResult = TrainingAccuracyRecord(:, BestTestingEpoch);
    
    % - Hasil prediksi pada saat mencapai error latih terendah
    BestTrainingResult = ResultsRecord(BestTrainingEpoch, :);
    
    % - Hasil prediksi pada saat mencapai error uji terendah
    BestTestingResult = ResultsRecord(BestTestingEpoch, :);

    % - Waktu latih pada saat mencapai error latih terendah
    TrainingTimeOfBestTrainingResult = TrainingTimeRecord(:, BestTrainingEpoch);
    
    % - Waktu uji pada saat mencapai error latih terendah
    TestingTimeOfBestTrainingResult = TestingTimeRecord(:, BestTrainingEpoch);
    
    % - Waktu latih pada saat mencapai error uji terendah
    TrainingTimeOfBestTestingResult = TrainingTimeRecord(:, BestTestingEpoch);
    
    % - Waktu uji pada saat mencapai error uji terendah
    TestingTimeOfBestTestingResult = TestingTimeRecord(:, BestTestingEpoch);
    
    % Inisialisasi matriks untuk matriks x pada plot yang akan digambarkan
    matrixAngkaHasil = [];
    
    % Inisialisasi matriks untuk kualitas air sangat baik pada grafik
	matrixKualitasSangatBaik = [];
    
    % Inisialisasi matriks untuk kualitas air baik pada grafik
	matrixKualitasBaik = [];
    
    % Inisialisasi matriks untuk kualitas air sedang pada grafik
	matrixKualitasSedang  = [];
    
    % Pengisian masing-masing matriks yang digunakan dalam grafik
    for i = 0:(numel(BestTrainingResult) - 1)
        matrixAngkaHasil = [matrixAngkaHasil (i+1)];
		matrixKualitasSangatBaik = [matrixKualitasSangatBaik 0.0];
		matrixKualitasBaik = [matrixKualitasBaik -11.0];
		matrixKualitasSedang  = [matrixKualitasSedang -31.0];
    end
    
    % Inisialisasi figure untuk tampilkan hasil pelatihan terbaik
    figurHasilPelatihanTerbaik = figure;
    
    % Pengaturan tampilan dari figure yang akan ditampilkan.
    set(figurHasilPelatihanTerbaik, 'Color', 'white');
    set(figurHasilPelatihanTerbaik, 'Position', [100 100 800 600]);
    set(figurHasilPelatihanTerbaik, 'Name', 'Prediction Result Obtained by Best Training Accuracy');
    set(figurHasilPelatihanTerbaik, 'Toolbar', 'none');
    set(figurHasilPelatihanTerbaik, 'NumberTitle', 'off');
    
    % Penambahan grafik yang berupa objek plot pada figure.
    plotHasilTraining = plot(matrixAngkaHasil, BestTrainingResult, 'k', ...
		matrixAngkaHasil, predictedOutput, 'b--', ...
		matrixAngkaHasil, matrixKualitasSangatBaik, 'g--', ...
		matrixAngkaHasil, matrixKualitasBaik, 'y--', ...
		matrixAngkaHasil, matrixKualitasSedang, 'r--');
    
    % Pemberian atribut-atribut tambahan pada plot, yaitu:
    % Judul grafik
    title('Prediction Result Obtained by Best Training Accuracy');
    % Label pada sumbu x grafik
    xlabel('-th measurement');
    % Label pada sumbu y grafik
    ylabel('WQI');
    % Legenda setiap garis pada grafik
    leg = legend('Predicted quality index','Measured quality index', 'Best water quality', 'Good water quality threshold', 'Moderate water quality threshold');
    % Atur lokasi legenda
    set(leg, 'Location', 'southwest');
    % Inisialisasi peletakan boks catatan
    dim = [0.25 0 .5 .5];
    % Pembuatan string array untuk menampilkan annotation (boks catatan)
    % lebih dari satu baris
    str = {...
        strcat('Training time: ', num2str(TrainingTimeOfBestTrainingResult, 4), ' s'),...
        strcat('Testing time: ', num2str(TestingTimeOfBestTrainingResult, 4), ' s'),...
        strcat('Epoch: ', num2str(BestTrainingEpoch, '%i')),...
        strcat('Train err: ', num2str(BestTrainingAccuracy, 4)),...
        strcat('Test err: ', num2str(TestingErrorOfBestTrainingResult, 4))...
    };
    % Letakkan boks anotasi pada grafik
    annotation('textbox',dim,'String',str,'FitBoxToText','on');
    
    % Inisialisasi figure untuk tampilkan hasil pengujian terbaik.
    figurHasilPengujianTerbaik = figure;
    set(figurHasilPengujianTerbaik, 'Color', 'white');
    set(figurHasilPengujianTerbaik, 'Position', [100 100 800 600]);
    set(figurHasilPengujianTerbaik, 'Name', 'Prediction Result Obtained by Best Testing Accuracy');
    set(figurHasilPengujianTerbaik, 'Toolbar', 'none');
    set(figurHasilPengujianTerbaik, 'NumberTitle', 'off');
    
    plotHasilTesting = plot(matrixAngkaHasil, BestTestingResult, 'k', ...
		matrixAngkaHasil, predictedOutput, 'b--', ...
		matrixAngkaHasil, matrixKualitasSangatBaik, 'g--', ...
		matrixAngkaHasil, matrixKualitasBaik, 'y--', ...
		matrixAngkaHasil, matrixKualitasSedang, 'r--');
    title('Prediction Result Obtained by Best Testing Accuracy');
    xlabel('-th measurement');
    ylabel('WQI');
    leg = legend('Predicted quality index','Measured quality index', 'Best water quality', 'Good water quality threshold', 'Moderate water quality threshold');
    set(leg, 'Location', 'southwest');
    dim = [0.25 0 .5 .5];
    str = {...
        strcat('Training time: ', num2str(TrainingTimeOfBestTestingResult, 4), ' s'),...
        strcat('Testing time: ', num2str(TestingTimeOfBestTestingResult, 4), ' s'),...
        strcat('Epoch: ', num2str(BestTestingEpoch, '%i')),...
        strcat('Train err: ', num2str(TrainingErrorOfBestTestingResult, 4)),...
        strcat('Test err: ', num2str(BestTestingAccuracy, 4))...
    };
    annotation('textbox',dim,'String',str,'FitBoxToText','on');
    
    figurTrainingAccuracy = figure;
    set(figurTrainingAccuracy, 'Color', 'white');
    set(figurTrainingAccuracy, 'Position', [100 100 800 600]);
    set(figurTrainingAccuracy, 'Name', 'Training Accuracy Record');
    set(figurTrainingAccuracy, 'Toolbar', 'none');
    set(figurTrainingAccuracy, 'NumberTitle', 'off');
    
    plotTrainingAccuracy = plot(EpochRecord, TrainingAccuracyRecord, 'g');
    title('Training Accuracy Record');
    xlabel('-th iteration');
    ylabel('RMSE');
    str = {...
        strcat('Best training error: ', num2str(BestTrainingAccuracy)),...
        strcat('Testing error: ', num2str(TestingErrorOfBestTrainingResult)),...
        strcat('Epoch: ', num2str(BestTrainingEpoch, '%i')),...
        strcat('Training time (s): ', num2str(TrainingTimeOfBestTrainingResult)),...
        strcat('Testing time (s): ', num2str(TestingTimeOfBestTrainingResult))...
    };
    annotation('textbox',dim,'String',str,'FitBoxToText','on');
    
    figurTestingAccuracy = figure;
    set(figurTestingAccuracy, 'Color', 'white');
    set(figurTestingAccuracy, 'Position', [100 100 800 600]);
    set(figurTestingAccuracy, 'Name', 'Testing Accuracy Record');
    set(figurTestingAccuracy, 'Toolbar', 'none');
    set(figurTestingAccuracy, 'NumberTitle', 'off');
    
    plotTestingAccuracy = plot(EpochRecord, TestingAccuracyRecord, 'g');
    title('Testing Accuracy Record');
    xlabel('-th iteration');
    ylabel('RMSE');
    str = {...
        strcat('Best testing error: ', num2str(BestTestingAccuracy)),...
        strcat('Training error: ', num2str(TrainingErrorOfBestTestingResult)),...
        strcat('Epoch: ', num2str(BestTestingEpoch, '%i')),...
        strcat('Training time (s): ', num2str(TrainingTimeOfBestTestingResult)),...
        strcat('Testing time (s): ', num2str(TestingTimeOfBestTestingResult))...
    };
    annotation('textbox',dim,'String',str,'FitBoxToText','on');

    % Kembalikan fungsi tombol "Prediksi"
    set(handles.btnPrediksi, 'Enable', 'on');
    % Ubah kembali teks pada notifikasi.
    set(handles.NotificationText, 'String', 'The training process will be iterated for 3,000 times.');
end
