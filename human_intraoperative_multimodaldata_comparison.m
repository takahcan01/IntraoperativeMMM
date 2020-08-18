cla
clf

tic

%==================== vaiables definition =================================
PRESTR    = 'IntraoperativeFBC_and_MMM_';
CH0132STR = '_Ch01-32';
CH3364STR = '_Ch33-64';
POSTSTR   = '(NC05-CL10-RW05)';
POSTSTR2  = '(NC05-CL15-RW05)';

CL_START  = 60000;  % 5
RW_START  = 180000; % 15
RW_START2 = 240000; % 20
REC_END   = 240000; % 20
REC_END2  = 300000; % 25

ONEMIN = 12000;

AC_YLIM   = [-0.00015  0.00015];
DC_YLIM   = [-0.2      0.2    ];
BRT_YLIM  = [ 0       40      ];
NIRS_YLIM = [-0.01     0.01   ];
MMM_XLIM  = [ 1       REC_END ]; 

AC_COLOR   = [0.2 0.2 0.2];
DC_COLOR   = [0.0 0.4 0.7];
BRT_COLOR  = [0.8 0.3 0.1];
HHB_COLOR  = [1.0 0.0 0.0];
O2HB_COLOR = [0.0 0.0 0.0];
HBT_COLOR  = [0.0 0.7 0.0];

xtick_points = [1,...
                CL_START,...
                CL_START+(RW_START-CL_START)/2,...
                RW_START,...
                REC_END];

dataAC  = zeros(3,9); 
dataDC  = zeros(3,9);
dataBRT = zeros(3,9); 
dataHHB = zeros(3,9);
dataO2HB= zeros(3,9);
dataHBT = zeros(3,9);
dataHR  = zeros(3,9);
dataMABP= zeros(3,9);
 
%==================== Data Load ===========================================
%========== 20170630 ==========
%Load data variable 
load([ PRESTR '20170630' POSTSTR2 ]);

buf = data(datastart(11):dataend(11))*10^6; 
dataAC(1,1) = rms(buf(CL_START -ONEMIN:CL_START ));
dataAC(2,1) = rms(buf(RW_START2-ONEMIN:RW_START2)); 
dataAC(3,1) = rms(buf(REC_END2 -ONEMIN:REC_END2 ));

buf = data(datastart(5):dataend(5));
dataDC(1,1) = mean(buf(CL_START -ONEMIN:CL_START )) *-1;
dataDC(2,1) = mean(buf(RW_START2-ONEMIN:RW_START2)) *-1; 
dataDC(3,1) = mean(buf(REC_END2 -ONEMIN:REC_END2 )) *-1;

buf = data(datastart(15):dataend(15));
dataHR(1,1) = mean(buf(CL_START -ONEMIN:CL_START ));
dataHR(2,1) = mean(buf(RW_START2-ONEMIN:RW_START2)); 
dataHR(3,1) = mean(buf(REC_END2 -ONEMIN:REC_END2 ));

buf = data(datastart(16):dataend(16));
dataMABP(1,1) = mean(buf(CL_START -ONEMIN:CL_START ));
dataMABP(2,1) = mean(buf(RW_START2-ONEMIN:RW_START2)); 
dataMABP(3,1) = mean(buf(REC_END2 -ONEMIN:REC_END2 ));

%Load data variable
load([ PRESTR '20170630' CH3364STR POSTSTR2 ]);

buf = data(datastart(5):dataend(5));
dataBRT(1,1) = mean(buf(CL_START - ONEMIN:CL_START )) +5;
dataBRT(2,1) = mean(buf(RW_START2- ONEMIN:RW_START2)) +5;
dataBRT(3,1) = mean(buf(REC_END2 - ONEMIN:REC_END2 )) +5;

buf = data(datastart(17):dataend(17))-data(datastart(17)+CL_START);
dataHHB(1,1) = mean(buf(CL_START - ONEMIN:CL_START ));
dataHHB(2,1) = mean(buf(RW_START2- ONEMIN:RW_START2));
dataHHB(3,1) = mean(buf(REC_END2 - ONEMIN:REC_END2 ));

buf = data(datastart(23):dataend(23))-data(datastart(23)+CL_START);
dataO2HB(1,1) = mean(buf(CL_START - ONEMIN:CL_START ));
dataO2HB(2,1) = mean(buf(RW_START2- ONEMIN:RW_START2));
dataO2HB(3,1) = mean(buf(REC_END2 - ONEMIN:REC_END2 ));

buf = data(datastart(29):dataend(29))-data(datastart(29)+CL_START);
dataHBT(1,1) = mean(buf(CL_START - ONEMIN:CL_START ));
dataHBT(2,1) = mean(buf(RW_START2- ONEMIN:RW_START2));
dataHBT(3,1) = mean(buf(REC_END2 - ONEMIN:REC_END2 ));


%========== 20180216 ==========
%Load data variable
load([ PRESTR '20180216' POSTSTR ]);

buf = data(datastart(10):dataend(10)); 
dataAC(1,2) = rms(buf(CL_START - ONEMIN:CL_START ));
dataAC(2,2) = rms(buf(RW_START - ONEMIN:RW_START )); 
dataAC(3,2) = rms(buf(REC_END  - ONEMIN:REC_END  ));

buf = data(datastart(4):dataend(4));
dataDC(1,2) = mean(buf(CL_START- ONEMIN:CL_START ));
dataDC(2,2) = mean(buf(RW_START- ONEMIN:RW_START )); 
dataDC(3,2) = mean(buf(REC_END - ONEMIN:REC_END  ));

buf = data(datastart(15):dataend(15));
dataHR(1,2) = mean(buf(CL_START -ONEMIN:CL_START ));
dataHR(2,2) = mean(buf(RW_START -ONEMIN:RW_START )); 
dataHR(3,2) = mean(buf(REC_END  -ONEMIN:REC_END  ));

buf = data(datastart(16):dataend(16));
dataMABP(1,2) = mean(buf(CL_START-ONEMIN:CL_START));
dataMABP(2,2) = mean(buf(RW_START-ONEMIN:RW_START)); 
dataMABP(3,2) = mean(buf(REC_END -ONEMIN:REC_END ));

%Load data variable
load([ PRESTR '20180216' CH3364STR POSTSTR ]);

buf = data(datastart(4):dataend(4));
dataBRT(1,2) = mean(buf(CL_START - ONEMIN:CL_START ));
dataBRT(2,2) = mean(buf(RW_START - ONEMIN:RW_START ));
dataBRT(3,2) = mean(buf(REC_END  - ONEMIN:REC_END  ));

buf = data(datastart(16):dataend(16))-data(datastart(16)+CL_START);
dataHHB(1,2) = mean(buf(CL_START - ONEMIN:CL_START ));
dataHHB(2,2) = mean(buf(RW_START - ONEMIN:RW_START ));
dataHHB(3,2) = mean(buf(REC_END  - ONEMIN:REC_END  ));

buf = data(datastart(22):dataend(22))-data(datastart(22)+CL_START);
dataO2HB(1,2) = mean(buf(CL_START - ONEMIN:CL_START ));
dataO2HB(2,2) = mean(buf(RW_START - ONEMIN:RW_START ));
dataO2HB(3,2) = mean(buf(REC_END  - ONEMIN:REC_END  ));

buf = data(datastart(28):dataend(28))-data(datastart(28)+CL_START);
dataHBT(1,2) = mean(buf(CL_START - ONEMIN:CL_START ));
dataHBT(2,2) = mean(buf(RW_START - ONEMIN:RW_START ));
dataHBT(3,2) = mean(buf(REC_END  - ONEMIN:REC_END  ));

%========== 20180420 ==========
%Load data variable
load([ PRESTR '20180420' POSTSTR ]);

buf = data(datastart(10):dataend(10))*10^6; 
dataAC(1,3) = rms(buf(CL_START - ONEMIN:CL_START ));
dataAC(2,3) = rms(buf(RW_START - ONEMIN:RW_START )); 
dataAC(3,3) = rms(buf(REC_END  - ONEMIN:REC_END  ));

buf = data(datastart(4):dataend(4));
dataDC(1,3) = mean(buf(CL_START - ONEMIN:CL_START ));
dataDC(2,3) = mean(buf(RW_START - ONEMIN:RW_START )); 
dataDC(3,3) = mean(buf(REC_END  - ONEMIN:REC_END  ));

buf = data(datastart(15):dataend(15));
dataHR(1,3) = mean(buf(CL_START -ONEMIN:CL_START ));
dataHR(2,3) = mean(buf(RW_START -ONEMIN:RW_START )); 
dataHR(3,3) = mean(buf(REC_END  -ONEMIN:REC_END  ));

buf = data(datastart(16):dataend(16));
dataMABP(1,3) = mean(buf(CL_START-ONEMIN:CL_START));
dataMABP(2,3) = mean(buf(RW_START-ONEMIN:RW_START)); 
dataMABP(3,3) = mean(buf(REC_END -ONEMIN:REC_END ));

%Load data variable
load([ PRESTR '20180420' CH3364STR POSTSTR ]);

buf = data(datastart(4):dataend(4));
dataBRT(1,3) = mean(buf(CL_START - ONEMIN:CL_START ));
dataBRT(2,3) = mean(buf(RW_START - ONEMIN:RW_START ));
dataBRT(3,3) = mean(buf(REC_END  - ONEMIN:REC_END  ));

buf = data(datastart(16):dataend(16))-data(datastart(16)+CL_START);
dataHHB(1,3) = mean(buf(CL_START - ONEMIN:CL_START ));
dataHHB(2,3) = mean(buf(RW_START - ONEMIN:RW_START ));
dataHHB(3,3) = mean(buf(REC_END  - ONEMIN:REC_END  ));

buf = data(datastart(22):dataend(22))-data(datastart(22)+CL_START);
dataO2HB(1,3) = mean(buf(CL_START - ONEMIN:CL_START ));
dataO2HB(2,3) = mean(buf(RW_START - ONEMIN:RW_START ));
dataO2HB(3,3) = mean(buf(REC_END  - ONEMIN:REC_END  ));

buf = data(datastart(28):dataend(28))-data(datastart(28)+CL_START);
dataHBT(1,3) = mean(buf(CL_START - ONEMIN:CL_START ));
dataHBT(2,3) = mean(buf(RW_START - ONEMIN:RW_START ));
dataHBT(3,3) = mean(buf(REC_END  - ONEMIN:REC_END  ));

%========== 20180817 ==========
%Load data variable
load([ PRESTR '20180817' POSTSTR ]);

buf = data(datastart(10):dataend(10)); 
dataAC(1,4) = rms(buf(CL_START - ONEMIN:CL_START ));
dataAC(2,4) = rms(buf(RW_START - ONEMIN:RW_START )); 
dataAC(3,4) = rms(buf(REC_END  - ONEMIN:REC_END  ));

buf = data(datastart(4):dataend(4));
dataDC(1,4) = mean(buf(CL_START - ONEMIN:CL_START ));
dataDC(2,4) = mean(buf(RW_START - ONEMIN:RW_START )); 
dataDC(3,4) = mean(buf(REC_END  - ONEMIN:REC_END  ));

buf = data(datastart(15):dataend(15));
dataHR(1,4) = mean(buf(CL_START -ONEMIN:CL_START ));
dataHR(2,4) = mean(buf(RW_START -ONEMIN:RW_START )); 
dataHR(3,4) = mean(buf(REC_END  -ONEMIN:REC_END  ));

buf = data(datastart(16):dataend(16));
dataMABP(1,4) = mean(buf(CL_START-ONEMIN:CL_START));
dataMABP(2,4) = mean(buf(RW_START-ONEMIN:RW_START)); 
dataMABP(3,4) = mean(buf(REC_END -ONEMIN:REC_END ));

%Load data variable
load([ PRESTR '20180817' CH3364STR POSTSTR ]);

buf = data(datastart(4):dataend(4));
dataBRT(1,4) = mean(buf(CL_START - ONEMIN:CL_START ));
dataBRT(2,4) = mean(buf(RW_START - ONEMIN:RW_START ));
dataBRT(3,4) = mean(buf(REC_END  - ONEMIN:REC_END  ));

buf = data(datastart(16):dataend(16))-data(datastart(16)+CL_START);
dataHHB(1,4) = mean(buf(CL_START - ONEMIN:CL_START ));
dataHHB(2,4) = mean(buf(RW_START - ONEMIN:RW_START ));
dataHHB(3,4) = mean(buf(REC_END  - ONEMIN:REC_END  ));

buf = data(datastart(22):dataend(22))-data(datastart(22)+CL_START);
dataO2HB(1,4) = mean(buf(CL_START - ONEMIN:CL_START ));
dataO2HB(2,4) = mean(buf(RW_START - ONEMIN:RW_START ));
dataO2HB(3,4) = mean(buf(REC_END  - ONEMIN:REC_END  ));

buf = data(datastart(28):dataend(28))-data(datastart(28)+CL_START);
dataHBT(1,4) = mean(buf(CL_START - ONEMIN:CL_START ));
dataHBT(2,4) = mean(buf(RW_START - ONEMIN:RW_START ));
dataHBT(3,4) = mean(buf(REC_END  - ONEMIN:REC_END  ));

%========== 20170224 ==========
%Load data variable
load([ PRESTR '20170224' POSTSTR ]);

buf = data(datastart(9):dataend(9))*10^6; 
dataAC(1,5) = rms(buf(CL_START -ONEMIN:CL_START ));
dataAC(2,5) = rms(buf(RW_START-ONEMIN:RW_START)); 
dataAC(3,5) = rms(buf(REC_END -ONEMIN:REC_END ));

buf = data(datastart(3):dataend(3));
dataDC(1,5) = mean(buf(CL_START -ONEMIN:CL_START )) *-1;
dataDC(2,5) = mean(buf(RW_START-ONEMIN:RW_START)) *-1; 
dataDC(3,5) = mean(buf(REC_END -ONEMIN:REC_END )) *-1;

buf = data(datastart(15):dataend(15));
dataHR(1,5) = mean(buf(CL_START -ONEMIN:CL_START ));
dataHR(2,5) = mean(buf(RW_START -ONEMIN:RW_START )); 
dataHR(3,5) = mean(buf(REC_END  -ONEMIN:REC_END  ));

buf = data(datastart(16):dataend(16));
dataMABP(1,5) = mean(buf(CL_START-ONEMIN:CL_START));
dataMABP(2,5) = mean(buf(RW_START-ONEMIN:RW_START)); 
dataMABP(3,5) = mean(buf(REC_END -ONEMIN:REC_END ));

%Load data variable
load([ PRESTR '20170224' CH0132STR POSTSTR ]);

buf = data(datastart(6):dataend(6));
dataBRT(1,5) = mean(buf(CL_START - ONEMIN:CL_START )); 
dataBRT(2,5) = mean(buf(RW_START - ONEMIN:RW_START ));
dataBRT(3,5) = mean(buf(REC_END  - ONEMIN:REC_END  ));

buf = data(datastart(18):dataend(18))-data(datastart(18)+CL_START);
dataHHB(1,5) = mean(buf(CL_START - ONEMIN:CL_START ));
dataHHB(2,5) = mean(buf(RW_START - ONEMIN:RW_START ));
dataHHB(3,5) = mean(buf(REC_END  - ONEMIN:REC_END  ));

buf = data(datastart(24):dataend(24))-data(datastart(24)+CL_START);
dataO2HB(1,5) = mean(buf(CL_START - ONEMIN:CL_START ));
dataO2HB(2,5) = mean(buf(RW_START - ONEMIN:RW_START ));
dataO2HB(3,5) = mean(buf(REC_END  - ONEMIN:REC_END  ));

buf = data(datastart(30):dataend(30))-data(datastart(30)+CL_START);
dataHBT(1,5) = mean(buf(CL_START - ONEMIN:CL_START ));
dataHBT(2,5) = mean(buf(RW_START - ONEMIN:RW_START ));
dataHBT(3,5) = mean(buf(REC_END  - ONEMIN:REC_END  ));

%========== 20160617 ==========
%Load data variable
load([ PRESTR '20160617' POSTSTR ]);

buf = data(datastart(10):dataend(10)); 
dataAC(1,6) = rms(buf(CL_START -ONEMIN:CL_START ));
dataAC(2,6) = rms(buf(RW_START-ONEMIN:RW_START)); 
dataAC(3,6) = rms(buf(REC_END -ONEMIN:REC_END ));

buf = data(datastart(4):dataend(4));
dataDC(1,6) = mean(buf(CL_START -ONEMIN:CL_START ));
dataDC(2,6) = mean(buf(RW_START-ONEMIN:RW_START)); 
dataDC(3,6) = mean(buf(REC_END -ONEMIN:REC_END ));

buf = data(datastart(15):dataend(15));
dataHR(1,6) = mean(buf(CL_START -ONEMIN:CL_START ));
dataHR(2,6) = mean(buf(RW_START -ONEMIN:RW_START )); 
dataHR(3,6) = mean(buf(REC_END  -ONEMIN:REC_END  ));

buf = data(datastart(16):dataend(16));
dataMABP(1,6) = mean(buf(CL_START-ONEMIN:CL_START));
dataMABP(2,6) = mean(buf(RW_START-ONEMIN:RW_START)); 
dataMABP(3,6) = mean(buf(REC_END -ONEMIN:REC_END ));

%Load data variable
load([ PRESTR '20160617' CH3364STR POSTSTR ]);

buf = data(datastart(4):dataend(4));
dataBRT(1,6) = mean(buf(CL_START - ONEMIN:CL_START )); 
dataBRT(2,6) = mean(buf(RW_START - ONEMIN:RW_START ));
dataBRT(3,6) = mean(buf(REC_END  - ONEMIN:REC_END  ));

buf = data(datastart(16):dataend(16))-data(datastart(16)+CL_START);
dataHHB(1,6) = mean(buf(CL_START - ONEMIN:CL_START ));
dataHHB(2,6) = mean(buf(RW_START - ONEMIN:RW_START ));
dataHHB(3,6) = mean(buf(REC_END  - ONEMIN:REC_END  ));

buf = data(datastart(22):dataend(22))-data(datastart(22)+CL_START);
dataO2HB(1,6) = mean(buf(CL_START - ONEMIN:CL_START ));
dataO2HB(2,6) = mean(buf(RW_START - ONEMIN:RW_START ));
dataO2HB(3,6) = mean(buf(REC_END  - ONEMIN:REC_END  ));

buf = data(datastart(28):dataend(28))-data(datastart(28)+CL_START);
dataHBT(1,6) = mean(buf(CL_START - ONEMIN:CL_START ));
dataHBT(2,6) = mean(buf(RW_START - ONEMIN:RW_START ));
dataHBT(3,6) = mean(buf(REC_END  - ONEMIN:REC_END  ));

%========== 20160715 ==========
%Load data variable
load('IntraoperativeFBC_and_MMM_20160715(NC05-CL10-RW05)');

buf = dataecog(dataecogstart(11):dataecogend(11)); 
dataAC(1,7) = rms(buf(CL_START -ONEMIN:CL_START ))*0.1;
dataAC(2,7) = rms(buf(RW_START-ONEMIN:RW_START))*0.1; 
dataAC(3,7) = rms(buf(REC_END -ONEMIN:REC_END ))*0.1;

buf = dataecog(dataecogstart(5):dataecogend(5));
dataDC(1,7) = mean(buf(CL_START -ONEMIN:CL_START ));
dataDC(2,7) = mean(buf(RW_START-ONEMIN:RW_START)); 
dataDC(3,7) = mean(buf(REC_END -ONEMIN:REC_END ));

buf = dataecog(dataecogstart(15):dataecogend(15));
dataHR(1,7) = mean(buf(CL_START -ONEMIN:CL_START ));
dataHR(2,7) = mean(buf(RW_START -ONEMIN:RW_START )); 
dataHR(3,7) = mean(buf(REC_END  -ONEMIN:REC_END  ));

buf = dataecog(dataecogstart(16):dataecogend(16));
dataMABP(1,7) = mean(buf(CL_START-ONEMIN:CL_START));
dataMABP(2,7) = mean(buf(RW_START-ONEMIN:RW_START)); 
dataMABP(3,7) = mean(buf(REC_END -ONEMIN:REC_END ));

%Load data variable
load('IntraoperativeFBC_and_MMM_20160715(NC05-CL10-RW05)');

buf = datach3364(datanirsstart(5):datanirsend(5));
dataBRT(1,7) = mean(buf(CL_START - ONEMIN:CL_START )); 
dataBRT(2,7) = mean(buf(RW_START - ONEMIN:RW_START ));
dataBRT(3,7) = mean(buf(REC_END  - ONEMIN:REC_END  ));

buf = datach3364(datanirsstart(17):datanirsend(17))-...
      datach3364(datanirsstart(17)+CL_START);
dataHHB(1,7) = mean(buf(CL_START - ONEMIN:CL_START ));
dataHHB(2,7) = mean(buf(RW_START - ONEMIN:RW_START ));
dataHHB(3,7) = mean(buf(REC_END  - ONEMIN:REC_END  ));

buf = datach3364(datanirsstart(23):datanirsend(23))-...
      datach3364(datanirsstart(23)+CL_START);
dataO2HB(1,7) = mean(buf(CL_START - ONEMIN:CL_START ));
dataO2HB(2,7) = mean(buf(RW_START - ONEMIN:RW_START ));
dataO2HB(3,7) = mean(buf(REC_END  - ONEMIN:REC_END  ));

buf = datach3364(datanirsstart(29):datanirsend(29))-...
      datach3364(datanirsstart(29)+CL_START);
dataHBT(1,7) = mean(buf(CL_START - ONEMIN:CL_START ));
dataHBT(2,7) = mean(buf(RW_START - ONEMIN:RW_START ));
dataHBT(3,7) = mean(buf(REC_END  - ONEMIN:REC_END  ));

%========== 20160506 ==========
%Load data variable
load('20160506_multimodalitydata');

buf = dataecog(dataecogstart(11):dataecogend(11)); 
dataAC(1,8) = rms(buf(CL_START -ONEMIN:CL_START ));
dataAC(2,8) = rms(buf(RW_START-ONEMIN:RW_START)); 
dataAC(3,8) = rms(buf(REC_END -ONEMIN:REC_END ));

buf = data(dataecogstart(5):dataecogend(5));
dataDC(1,8) = mean(buf(CL_START -ONEMIN:CL_START )) ;
dataDC(2,8) = mean(buf(RW_START-ONEMIN:RW_START)) ; 
dataDC(3,8) = mean(buf(REC_END -ONEMIN:REC_END )) ;

buf = datach3364(datanirsstart(5):datanirsend(5));
dataBRT(1,8) = mean(buf(CL_START - ONEMIN:CL_START )); 
dataBRT(2,8) = mean(buf(RW_START - ONEMIN:RW_START ));
dataBRT(3,8) = mean(buf(REC_END  - ONEMIN:REC_END  ));

buf = datach3364(datanirsstart(17):datanirsend(17))-...
      datach3364(datanirsstart(17)+CL_START);
dataHHB(1,8) = mean(buf(CL_START - ONEMIN:CL_START ));
dataHHB(2,8) = mean(buf(RW_START - ONEMIN:RW_START ));
dataHHB(3,8) = mean(buf(REC_END  - ONEMIN:REC_END  ));

buf = datach3364(datanirsstart(23):datanirsend(23))-...
      datach3364(datanirsstart(23)+CL_START);
dataO2HB(1,8) = mean(buf(CL_START - ONEMIN:CL_START ));
dataO2HB(2,8) = mean(buf(RW_START - ONEMIN:RW_START ));
dataO2HB(3,8) = mean(buf(REC_END  - ONEMIN:REC_END  ));

buf = datach3364(datanirsstart(29):datanirsend(29))-...
      datach3364(datanirsstart(29)+CL_START);
dataHBT(1,8) = mean(buf(CL_START - ONEMIN:CL_START ));
dataHBT(2,8) = mean(buf(RW_START - ONEMIN:RW_START ));
dataHBT(3,8) = mean(buf(REC_END  - ONEMIN:REC_END  ));

%========== 20170405 ==========
%Load data variable
load('20170405_multimodalitydata');

buf = dataecog(dataecogstart(9):dataecogend(9)); 
dataAC(1,9) = rms(buf(CL_START-ONEMIN:CL_START ));
dataAC(2,9) = rms(buf(RW_START-ONEMIN:RW_START)); 
dataAC(3,9) = rms(buf(REC_END -ONEMIN:REC_END ));

buf = dataecog(dataecogstart(3):dataecogend(3));
dataDC(1,9) = mean(buf(CL_START-ONEMIN:CL_START))*-1;
dataDC(2,9) = mean(buf(RW_START-ONEMIN:RW_START))*-1; 
dataDC(3,9) = mean(buf(REC_END -ONEMIN:REC_END ))*-1;

buf = dataecog(dataecogstart(15):dataecogend(15));
dataHR(1,9) = mean(buf(CL_START -ONEMIN:CL_START ));
dataHR(2,9) = mean(buf(RW_START -ONEMIN:RW_START )); 
dataHR(3,9) = mean(buf(REC_END  -ONEMIN:REC_END  ));

buf = dataecog(dataecogstart(16):dataecogend(16));
dataMABP(1,9) = mean(buf(CL_START-ONEMIN:CL_START));
dataMABP(2,9) = mean(buf(RW_START-ONEMIN:RW_START)); 
dataMABP(3,9) = mean(buf(REC_END -ONEMIN:REC_END ));

buf = datach0132(datanirsstart(6):datanirsend(6));
dataBRT(1,9) = mean(buf(CL_START - ONEMIN:CL_START )); 
dataBRT(2,9) = mean(buf(RW_START - ONEMIN:RW_START ));
dataBRT(3,9) = mean(buf(REC_END  - ONEMIN:REC_END  ));

buf = datach0132(datanirsstart(18):datanirsend(18))-...
      datach0132(datanirsstart(18)+CL_START);
dataHHB(1,9) = mean(buf(CL_START - ONEMIN:CL_START ));
dataHHB(2,9) = mean(buf(RW_START - ONEMIN:RW_START ));
dataHHB(3,9) = mean(buf(REC_END  - ONEMIN:REC_END  ));

buf = datach0132(datanirsstart(24):datanirsend(24))-...
      datach0132(datanirsstart(24)+CL_START);
dataO2HB(1,9) = mean(buf(CL_START - ONEMIN:CL_START ));
dataO2HB(2,9) = mean(buf(RW_START - ONEMIN:RW_START ));
dataO2HB(3,9) = mean(buf(REC_END  - ONEMIN:REC_END  ));

buf = datach0132(datanirsstart(30):datanirsend(30))-...
      datach0132(datanirsstart(30)+CL_START);
dataHBT(1,9) = mean(buf(CL_START - ONEMIN:CL_START ));
dataHBT(2,9) = mean(buf(RW_START - ONEMIN:RW_START ));
dataHBT(3,9) = mean(buf(REC_END  - ONEMIN:REC_END  ));

%==================== Plot ================================================

subplot(24,1,[1 2 3]);
plot(dataBRT(:,1),'k-o'); hold on;
plot(dataBRT(:,2),'k-+');
plot(dataBRT(:,3),'k-*');
plot(dataBRT(:,4),'k-d');
plot(dataBRT(:,5),'k-x');
plot(dataBRT(:,6),'k-s');
plot(dataBRT(:,7),'k-^');
plot(dataBRT(:,8),'k-v');
plot(dataBRT(:,9),'k->');
ylabel('Brain Temp. [degC]');
xlim([0.5 3.5]);
ylim([0 40]);
set(gca,'xtick',[1 2 3]);
set(gca,'xticklabel',[]);

subplot(24,1,[4 5 6]);
plot(dataAC(:,1),'k-o'); hold on;
plot(dataAC(:,2),'k-+');
plot(dataAC(:,3),'k-*');
plot(dataAC(:,4),'k-d');
plot(dataAC(:,5),'k-x');
plot(dataAC(:,6),'k-s');
plot(dataAC(:,7),'k-^');
plot(dataAC(:,8),'k-v');
plot(dataAC(:,9),'k->');
ylabel('RMS(AC ECoG) [uV]');
xlim([0.5 3.5]);
ylim([0 80])
set(gca,'xtick',[1 2 3]);
set(gca,'xticklabel',[]);

subplot(24,1,[7 8 9]);
plot(dataDC(:,1),'k-o'); hold on;
plot(dataDC(:,2),'k-+');
plot(dataDC(:,3),'k-*');
plot(dataDC(:,4),'k-d');
plot(dataDC(:,5),'k-x');
plot(dataDC(:,6),'k-s');
plot(dataDC(:,7),'k-^');
%plot(dataDC(:,8),'k-v'); <- Data was not recoreded corectly.
plot(dataDC(:,9),'k->');
ylabel('DC ECoG [mV]');
xlim([0.5 3.5]);
set(gca,'xtick',[1 2 3]);
set(gca,'xticklabel',[]);

subplot(24,1,[10 11 12])
plot(dataHHB(:,1),'k-o'); hold on;
plot(dataHHB(:,2),'k-+');
plot(dataHHB(:,3),'k-*');
plot(dataHHB(:,4),'k-d');
plot(dataHHB(:,5),'k-x');
plot(dataHHB(:,6),'k-s');
plot(dataHHB(:,7),'k-^');
plot(dataHHB(:,8),'k-v');
plot(dataHHB(:,9),'k->');
ylabel('delta HHb [mM]');
xlim([0.5 3.5]);
ylim([-0.006 0.013])
set(gca,'xtick',[1 2 3]);
set(gca,'xticklabel',[]);

subplot(24,1,[13 14 15])
plot(dataO2HB(:,1),'k-o'); hold on;
plot(dataO2HB(:,2),'k-+');
plot(dataO2HB(:,3),'k-*');
plot(dataO2HB(:,4),'k-d');
plot(dataO2HB(:,5),'k-x');
plot(dataO2HB(:,6),'k-s');
plot(dataO2HB(:,7),'k-^');
plot(dataO2HB(:,8),'k-v');
plot(dataO2HB(:,9),'k->');
ylabel('delta O2Hb [mM]');
xlim([0.5 3.5]);
ylim([-0.006 0.013])
set(gca,'xtick',[1 2 3]);
set(gca,'xticklabel',[]);

subplot(24,1,[16 17 18])
plot(dataHBT(:,1),'k-o'); hold on;
plot(dataHBT(:,2),'k-+');
plot(dataHBT(:,3),'k-*');
plot(dataHBT(:,4),'k-d');
plot(dataHBT(:,5),'k-x');
plot(dataHBT(:,6),'k-s');
plot(dataHBT(:,7),'k-^');
plot(dataHBT(:,8),'k-v');
plot(dataHBT(:,9),'k->');
ylabel('delta HbT [mM]');
xlim([0.5 3.5]);
ylim([-0.006 0.013])
set(gca,'xtick',[1 2 3]);
set(gca,'xticklabel',{'NC' 'CL' 'RW'});

subplot(24,1,[19 20 21]);
plot(dataHR(:,1),'k-o'); hold on;
plot(dataHR(:,2),'k-+');
plot(dataHR(:,3),'k-*');
plot(dataHR(:,4),'k-d');
plot(dataHR(:,5),'k-x');
plot(dataHR(:,6),'k-s');
plot(dataHR(:,7),'k-^');
%plot(dataHR(:,8),'k-v'); <- no data
plot(dataHR(:,9),'k->');
ylabel('HR [bpm]');
xlim([0.5 3.5]);
ylim([55 95])
set(gca,'xtick',[1 2 3]);
set(gca,'xticklabel',[]);

subplot(24,1,[22 23 24]);
plot(dataMABP(:,1),'k-o'); hold on;
plot(dataMABP(:,2),'k-+');
plot(dataMABP(:,3),'k-*');
plot(dataMABP(:,4),'k-d');
plot(dataMABP(:,5),'k-x');
plot(dataMABP(:,6),'k-s');
plot(dataMABP(:,7),'k-^');
%plot(dataMABP(:,8),'k-v'); <- no data
plot(dataMABP(:,9),'k->');
ylabel('MABP [mmHg]');
xlim([0.5 3.5]);
ylim([55 85])
set(gca,'xtick',[1 2 3]);
set(gca,'xticklabel',[]);


toc
