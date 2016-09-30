module CtrlModule(input clk, input reset,
    input  io_rocc_req_val,
    output io_rocc_req_rdy,
    input [1:0] io_rocc_funct,
    input [63:0] io_rocc_rs1,
    input [63:0] io_rocc_rs2,
    input [4:0] io_rocc_rd,
    output io_busy,
    output io_dmem_req_val,
    input  io_dmem_req_rdy,
    output[6:0] io_dmem_req_tag,
    output[31:0] io_dmem_req_addr,
    output[4:0] io_dmem_req_cmd,
    output[2:0] io_dmem_req_typ,
    input  io_dmem_resp_val,
    input [6:0] io_dmem_resp_tag,
    input [63:0] io_dmem_resp_data,
    output[4:0] io_round,
    output io_stage,
    output io_absorb,
    output[4:0] io_aindex,
    output io_init,
    output io_write,
    output[2:0] io_windex,
    output[63:0] io_buffer_out
);

  wire[3:0] byte_offset;
  reg [63:0] msg_len;
  wire[63:0] T1054;
  wire[63:0] T0;
  wire[63:0] T1;
  wire T2;
  wire T3;
  wire T4;
  wire T5;
  wire T6;
  wire T7;
  wire T8;
  wire T9;
  reg  busy;
  wire T1055;
  wire T10;
  wire T11;
  wire T12;
  wire T13;
  wire T14;
  wire T15;
  wire T16;
  wire[63:0] T1056;
  reg [31:0] hashed;
  wire[31:0] T1057;
  wire[31:0] T17;
  wire[31:0] T18;
  wire[31:0] T19;
  wire T20;
  wire T21;
  wire T22;
  reg [2:0] state;
  wire[2:0] T1058;
  wire[2:0] T23;
  wire[2:0] T24;
  wire[2:0] T25;
  wire[2:0] T26;
  wire[2:0] T27;
  wire[2:0] T28;
  wire[2:0] T29;
  wire[2:0] T30;
  wire[2:0] T31;
  wire[2:0] T32;
  wire[2:0] T33;
  wire T34;
  wire T35;
  wire T36;
  wire T37;
  wire T38;
  wire T39;
  wire T40;
  reg  sindex;
  wire T1059;
  wire T41;
  wire T42;
  wire T43;
  wire T44;
  wire T45;
  wire T46;
  reg [4:0] rindex;
  wire[4:0] T1060;
  wire[4:0] T47;
  wire[4:0] T48;
  wire[4:0] T49;
  wire[4:0] T50;
  wire T51;
  wire T52;
  wire T53;
  wire T54;
  wire T55;
  wire T56;
  wire T57;
  wire T58;
  wire[63:0] T1061;
  wire T59;
  wire[63:0] T1062;
  wire T60;
  wire T61;
  wire T62;
  wire T63;
  wire T64;
  wire T65;
  wire T66;
  reg  writes_done_3;
  wire T1063;
  wire T67;
  wire T68;
  wire T69;
  wire T70;
  wire[3:0] T71;
  wire[1:0] T72;
  wire[1:0] T1064;
  wire[4:0] T73;
  wire[4:0] T74;
  reg [6:0] dmem_resp_tag_reg;
  wire T75;
  wire T76;
  wire[4:0] T77;
  wire T78;
  wire T79;
  reg  writes_done_2;
  wire T1065;
  wire T80;
  wire T81;
  wire T82;
  wire T83;
  wire T84;
  reg  writes_done_1;
  wire T1066;
  wire T85;
  wire T86;
  wire T87;
  wire T88;
  reg  writes_done_0;
  wire T1067;
  wire T89;
  wire T90;
  wire T91;
  wire T92;
  wire T93;
  wire T94;
  reg  buffer_valid;
  wire T1068;
  wire T95;
  wire T96;
  wire T97;
  wire T98;
  wire T99;
  wire T100;
  wire T101;
  wire T102;
  wire T103;
  wire T104;
  wire T105;
  wire T106;
  wire T107;
  wire T108;
  wire[63:0] T1069;
  reg [31:0] read;
  wire[31:0] T1070;
  wire[31:0] T109;
  wire[31:0] T110;
  wire[31:0] T111;
  wire[31:0] T112;
  wire[31:0] T113;
  wire T114;
  wire T115;
  wire T116;
  wire T117;
  wire T118;
  reg [2:0] mem_s;
  wire[2:0] T1071;
  wire[2:0] T119;
  wire[2:0] T120;
  wire[2:0] T121;
  wire[2:0] T122;
  wire[2:0] T123;
  wire[2:0] T124;
  wire[2:0] T125;
  wire[2:0] T126;
  wire[2:0] T127;
  wire[2:0] T128;
  wire[2:0] T129;
  wire[2:0] T130;
  wire[2:0] T131;
  wire[2:0] T132;
  wire[2:0] T133;
  wire[2:0] T134;
  wire[2:0] T135;
  wire[2:0] T136;
  wire[2:0] T137;
  wire T138;
  wire T139;
  wire T140;
  wire T141;
  wire T142;
  reg [4:0] buffer_count;
  wire[4:0] T1072;
  wire[4:0] T143;
  wire[4:0] T144;
  wire[4:0] T145;
  wire[4:0] T146;
  wire[4:0] T147;
  wire[4:0] T148;
  wire[4:0] T149;
  wire T150;
  wire T151;
  wire[4:0] T152;
  wire T153;
  wire T154;
  wire[4:0] T155;
  wire T156;
  wire T157;
  wire T158;
  wire T159;
  wire T160;
  wire[63:0] T1073;
  wire T161;
  wire[63:0] T1074;
  wire T162;
  wire T163;
  wire T164;
  wire T165;
  wire T166;
  wire T167;
  wire T168;
  wire T169;
  reg [4:0] mindex;
  wire[4:0] T1075;
  wire[4:0] T170;
  wire[4:0] T171;
  wire[4:0] T172;
  wire[4:0] T173;
  wire[4:0] T174;
  wire[4:0] T175;
  wire[4:0] T176;
  wire T177;
  wire T191;
  wire T192;
  wire T193;
  wire T194;
  wire T195;
  wire T196;
  wire[63:0] T1076;
  wire[31:0] T197;
  wire T198;
  wire T199;
  wire[63:0] T1077;
  wire T200;
  wire T201;
  wire T202;
  wire T203;
  wire T204;
  wire T205;
  wire T206;
  wire T207;
  wire T208;
  wire T209;
  reg  areg;
  wire T1078;
  wire T210;
  wire T211;
  wire T212;
  wire T213;
  wire T214;
  wire T215;
  reg [4:0] pindex;
  wire[4:0] T1079;
  wire[4:0] T180;
  wire[4:0] T181;
  wire[4:0] T182;
  wire[4:0] T183;
  wire[4:0] T184;
  wire[4:0] T185;
  wire[4:0] T186;
  wire[4:0] T187;
  wire[4:0] T188;
  wire[4:0] T189;
  wire T216;
  wire T217;
  wire T218;
  wire T219;
  wire T220;
  wire T221;
  wire T222;
  reg [4:0] aindex;
  wire[4:0] T1080;
  wire[4:0] T223;
  wire[4:0] T224;
  wire[4:0] T225;
  wire T226;
  wire T227;
  wire[31:0] T228;
  wire T229;
  wire T230;
  wire[63:0] T231;
  wire T232;
  wire T233;
  wire[63:0] T1081;
  wire T234;
  wire T235;
  wire T236;
  wire T237;
  wire T238;
  wire T239;
  wire[63:0] T1082;
  wire[63:0] T240;
  wire T241;
  wire T242;
  wire T243;
  wire T244;
  wire[63:0] T1083;
  wire[31:0] T245;
  wire T246;
  wire T247;
  wire T248;
  wire T249;
  reg  next_buff_val;
  wire T1084;
  wire T178;
  wire T179;
  wire T190;
  wire T250;
  wire T251;
  wire T252;
  wire T253;
  wire T254;
  wire[63:0] T1085;
  wire T255;
  wire T256;
  wire T257;
  wire T258;
  reg [4:0] rindex_reg;
  wire T259;
  wire T260;
  reg [1:0] rocc_s;
  wire[1:0] T1086;
  wire T261;
  wire[4:0] words_filled;
  wire[4:0] T262;
  wire T263;
  wire[63:0] buffer_rdata;
  wire[63:0] buffer_wdata;
  wire[63:0] buffer_waddr;
  wire buffer_wen;
  wire[63:0] T264;
  wire[63:0] T265;
  wire[63:0] T266;
  wire[63:0] T267;
  wire[63:0] T268;
  reg [63:0] buffer_0;
  wire[63:0] T269;
  wire[63:0] T1087;
  wire[63:0] T270;
  wire[63:0] T271;
  wire[63:0] T272;
  wire[63:0] T273;
  wire[63:0] T274;
  wire[63:0] T275;
  wire[63:0] T276;
  wire[63:0] T277;
  wire[63:0] T278;
  wire[63:0] T279;
  wire[63:0] T280;
  wire[63:0] T281;
  wire[63:0] T282;
  wire[63:0] T283;
  wire[63:0] T284;
  wire T285;
  wire T286;
  wire[31:0] T287;
  wire[4:0] T288;
  wire[4:0] T289;
  wire T290;
  wire T291;
  wire[31:0] T292;
  wire[4:0] T293;
  wire T294;
  wire T295;
  wire T296;
  wire T297;
  wire T298;
  wire[4:0] T299;
  wire T300;
  wire T301;
  wire T302;
  wire T303;
  wire T304;
  wire T305;
  wire T306;
  wire T307;
  wire T308;
  wire T309;
  wire T310;
  wire T311;
  wire T312;
  wire[63:0] T313;
  wire[55:0] T314;
  wire[63:0] T315;
  wire[63:0] T316;
  wire[63:0] T317;
  wire[63:0] T318;
  wire[63:0] T319;
  wire T320;
  wire[63:0] T321;
  reg [63:0] buffer_2;
  wire[63:0] T322;
  wire[63:0] T1088;
  wire[63:0] T323;
  wire[63:0] T324;
  wire[63:0] T325;
  wire[63:0] T326;
  wire[63:0] T327;
  wire[63:0] T328;
  wire[63:0] T329;
  wire[63:0] T330;
  wire[63:0] T331;
  wire[63:0] T332;
  wire[63:0] T333;
  wire[63:0] T334;
  wire[63:0] T335;
  wire[63:0] T336;
  wire[63:0] T337;
  wire T338;
  wire T339;
  wire T340;
  wire T341;
  wire T342;
  wire T343;
  wire T344;
  wire T345;
  wire T346;
  wire T347;
  wire T348;
  wire T349;
  wire T350;
  wire T351;
  wire T352;
  wire T353;
  wire T354;
  wire T355;
  wire T356;
  wire T357;
  wire T358;
  wire T359;
  wire[63:0] T1089;
  wire[15:0] T889;
  wire[7:0] T890;
  wire T360;
  wire T361;
  wire T362;
  wire T363;
  wire T364;
  wire T365;
  wire T366;
  wire T367;
  wire T368;
  wire T369;
  wire[63:0] T1090;
  wire[23:0] T892;
  wire[15:0] T893;
  wire T370;
  wire T371;
  wire T372;
  wire T373;
  wire T374;
  wire[63:0] T1091;
  wire[31:0] T895;
  wire[23:0] T896;
  wire T375;
  wire T376;
  wire T377;
  wire T378;
  wire T379;
  wire T380;
  wire[63:0] T1092;
  wire[39:0] T898;
  wire[31:0] T899;
  wire T381;
  wire T382;
  wire T383;
  wire T384;
  wire T385;
  wire T386;
  wire[63:0] T1093;
  wire[47:0] T901;
  wire[39:0] T902;
  wire T387;
  wire T388;
  wire T389;
  wire T390;
  wire T391;
  wire T392;
  wire[63:0] T1094;
  wire[55:0] T904;
  wire[47:0] T905;
  wire T393;
  wire T394;
  wire T395;
  wire T396;
  wire T397;
  wire T398;
  wire T399;
  wire T400;
  wire T401;
  wire T402;
  wire T403;
  wire T404;
  wire T405;
  wire T406;
  wire T407;
  wire T408;
  wire T409;
  wire T410;
  wire T411;
  wire T412;
  wire T413;
  wire[31:0] T414;
  wire[4:0] T415;
  wire[4:0] T416;
  reg [63:0] buffer_3;
  wire[63:0] T417;
  wire[63:0] T1095;
  wire[63:0] T418;
  wire[63:0] T419;
  wire[63:0] T420;
  wire[63:0] T421;
  wire[63:0] T422;
  wire[63:0] T423;
  wire[63:0] T424;
  wire[63:0] T425;
  wire[63:0] T426;
  wire[63:0] T427;
  wire[63:0] T428;
  wire[63:0] T429;
  wire[63:0] T430;
  wire[63:0] T431;
  wire[63:0] T432;
  wire T433;
  wire T434;
  wire T435;
  wire T436;
  wire T437;
  wire T438;
  wire T439;
  wire T440;
  wire[63:0] T1096;
  wire T441;
  wire[63:0] T1097;
  wire T442;
  wire[63:0] T1098;
  wire T443;
  wire[63:0] T1099;
  wire T444;
  wire[63:0] T1100;
  wire T445;
  wire[63:0] T1101;
  wire T446;
  wire T447;
  wire T448;
  wire T449;
  wire T450;
  wire T451;
  wire T452;
  wire[63:0] T453;
  wire[63:0] T454;
  reg [63:0] buffer_4;
  wire[63:0] T455;
  wire[63:0] T1102;
  wire[63:0] T456;
  wire[63:0] T457;
  wire[63:0] T458;
  wire[63:0] T459;
  wire[63:0] T460;
  wire[63:0] T461;
  wire[63:0] T462;
  wire[63:0] T463;
  wire[63:0] T464;
  wire[63:0] T465;
  wire[63:0] T466;
  wire[63:0] T467;
  wire[63:0] T468;
  wire[63:0] T469;
  wire[63:0] T470;
  wire T471;
  wire T472;
  wire T473;
  wire T474;
  wire T475;
  wire T476;
  wire T477;
  wire T478;
  wire[63:0] T1103;
  wire T479;
  wire[63:0] T1104;
  wire T480;
  wire[63:0] T1105;
  wire T481;
  wire[63:0] T1106;
  wire T482;
  wire[63:0] T1107;
  wire T483;
  wire[63:0] T1108;
  wire T484;
  wire T485;
  wire T486;
  wire T487;
  wire T488;
  reg [63:0] buffer_5;
  wire[63:0] T489;
  wire[63:0] T1109;
  wire[63:0] T490;
  wire[63:0] T491;
  wire[63:0] T492;
  wire[63:0] T493;
  wire[63:0] T494;
  wire[63:0] T495;
  wire[63:0] T496;
  wire[63:0] T497;
  wire[63:0] T498;
  wire[63:0] T499;
  wire[63:0] T500;
  wire[63:0] T501;
  wire[63:0] T502;
  wire[63:0] T503;
  wire[63:0] T504;
  wire T505;
  wire T506;
  wire T507;
  wire T508;
  wire T509;
  wire T510;
  wire T511;
  wire T512;
  wire[63:0] T1110;
  wire T513;
  wire[63:0] T1111;
  wire T514;
  wire[63:0] T1112;
  wire T515;
  wire[63:0] T1113;
  wire T516;
  wire[63:0] T1114;
  wire T517;
  wire[63:0] T1115;
  wire T518;
  wire T519;
  wire T520;
  wire T521;
  wire T522;
  wire T523;
  wire[63:0] T524;
  reg [63:0] buffer_6;
  wire[63:0] T525;
  wire[63:0] T1116;
  wire[63:0] T526;
  wire[63:0] T527;
  wire[63:0] T528;
  wire[63:0] T529;
  wire[63:0] T530;
  wire[63:0] T531;
  wire[63:0] T532;
  wire[63:0] T533;
  wire[63:0] T534;
  wire[63:0] T535;
  wire[63:0] T536;
  wire[63:0] T537;
  wire[63:0] T538;
  wire[63:0] T539;
  wire[63:0] T540;
  wire T541;
  wire T542;
  wire T543;
  wire T544;
  wire T545;
  wire T546;
  wire T547;
  wire T548;
  wire[63:0] T1117;
  wire T549;
  wire[63:0] T1118;
  wire T550;
  wire[63:0] T1119;
  wire T551;
  wire[63:0] T1120;
  wire T552;
  wire[63:0] T1121;
  wire T553;
  wire[63:0] T1122;
  wire T554;
  wire T555;
  wire T556;
  wire T557;
  wire T558;
  reg [63:0] buffer_7;
  wire[63:0] T559;
  wire[63:0] T1123;
  wire[63:0] T560;
  wire[63:0] T561;
  wire[63:0] T562;
  wire[63:0] T563;
  wire[63:0] T564;
  wire[63:0] T565;
  wire[63:0] T566;
  wire[63:0] T567;
  wire[63:0] T568;
  wire[63:0] T569;
  wire[63:0] T570;
  wire[63:0] T571;
  wire[63:0] T572;
  wire[63:0] T573;
  wire[63:0] T574;
  wire T575;
  wire T576;
  wire T577;
  wire T578;
  wire T579;
  wire T580;
  wire T581;
  wire T582;
  wire[63:0] T1124;
  wire T583;
  wire[63:0] T1125;
  wire T584;
  wire[63:0] T1126;
  wire T585;
  wire[63:0] T1127;
  wire T586;
  wire[63:0] T1128;
  wire T587;
  wire[63:0] T1129;
  wire T588;
  wire T589;
  wire T590;
  wire T591;
  wire T592;
  wire T593;
  wire T594;
  wire T595;
  wire[63:0] T596;
  wire[63:0] T597;
  wire[63:0] T598;
  reg [63:0] buffer_8;
  wire[63:0] T599;
  wire[63:0] T1130;
  wire[63:0] T600;
  wire[63:0] T601;
  wire[63:0] T602;
  wire[63:0] T603;
  wire[63:0] T604;
  wire[63:0] T605;
  wire[63:0] T606;
  wire[63:0] T607;
  wire[63:0] T608;
  wire[63:0] T609;
  wire[63:0] T610;
  wire[63:0] T611;
  wire[63:0] T612;
  wire[63:0] T613;
  wire[63:0] T614;
  wire T615;
  wire T616;
  wire T617;
  wire T618;
  wire T619;
  wire T620;
  wire T621;
  wire T622;
  wire[63:0] T1131;
  wire T623;
  wire[63:0] T1132;
  wire T624;
  wire[63:0] T1133;
  wire T625;
  wire[63:0] T1134;
  wire T626;
  wire[63:0] T1135;
  wire T627;
  wire[63:0] T1136;
  wire T628;
  wire T629;
  wire T630;
  wire T631;
  wire T632;
  reg [63:0] buffer_9;
  wire[63:0] T633;
  wire[63:0] T1137;
  wire[63:0] T634;
  wire[63:0] T635;
  wire[63:0] T636;
  wire[63:0] T637;
  wire[63:0] T638;
  wire[63:0] T639;
  wire[63:0] T640;
  wire[63:0] T641;
  wire[63:0] T642;
  wire[63:0] T643;
  wire[63:0] T644;
  wire[63:0] T645;
  wire[63:0] T646;
  wire[63:0] T647;
  wire[63:0] T648;
  wire T649;
  wire T650;
  wire T651;
  wire T652;
  wire T653;
  wire T654;
  wire T655;
  wire T656;
  wire[63:0] T1138;
  wire T657;
  wire[63:0] T1139;
  wire T658;
  wire[63:0] T1140;
  wire T659;
  wire[63:0] T1141;
  wire T660;
  wire[63:0] T1142;
  wire T661;
  wire[63:0] T1143;
  wire T662;
  wire T663;
  wire T664;
  wire T665;
  wire T666;
  wire T667;
  wire[63:0] T668;
  reg [63:0] buffer_10;
  wire[63:0] T669;
  wire[63:0] T1144;
  wire[63:0] T670;
  wire[63:0] T671;
  wire[63:0] T672;
  wire[63:0] T673;
  wire[63:0] T674;
  wire[63:0] T675;
  wire[63:0] T676;
  wire[63:0] T677;
  wire[63:0] T678;
  wire[63:0] T679;
  wire[63:0] T680;
  wire[63:0] T681;
  wire[63:0] T682;
  wire[63:0] T683;
  wire[63:0] T684;
  wire T685;
  wire T686;
  wire T687;
  wire T688;
  wire T689;
  wire T690;
  wire T691;
  wire T692;
  wire[63:0] T1145;
  wire T693;
  wire[63:0] T1146;
  wire T694;
  wire[63:0] T1147;
  wire T695;
  wire[63:0] T1148;
  wire T696;
  wire[63:0] T1149;
  wire T697;
  wire[63:0] T1150;
  wire T698;
  wire T699;
  wire T700;
  wire T701;
  wire T702;
  reg [63:0] buffer_11;
  wire[63:0] T703;
  wire[63:0] T1151;
  wire[63:0] T704;
  wire[63:0] T705;
  wire[63:0] T706;
  wire[63:0] T707;
  wire[63:0] T708;
  wire[63:0] T709;
  wire[63:0] T710;
  wire[63:0] T711;
  wire[63:0] T712;
  wire[63:0] T713;
  wire[63:0] T714;
  wire[63:0] T715;
  wire[63:0] T716;
  wire[63:0] T717;
  wire[63:0] T718;
  wire T719;
  wire T720;
  wire T721;
  wire T722;
  wire T723;
  wire T724;
  wire T725;
  wire T726;
  wire[63:0] T1152;
  wire T727;
  wire[63:0] T1153;
  wire T728;
  wire[63:0] T1154;
  wire T729;
  wire[63:0] T1155;
  wire T730;
  wire[63:0] T1156;
  wire T731;
  wire[63:0] T1157;
  wire T732;
  wire T733;
  wire T734;
  wire T735;
  wire T736;
  wire T737;
  wire T738;
  wire[63:0] T739;
  wire[63:0] T740;
  reg [63:0] buffer_12;
  wire[63:0] T741;
  wire[63:0] T1158;
  wire[63:0] T742;
  wire[63:0] T743;
  wire[63:0] T744;
  wire[63:0] T745;
  wire[63:0] T746;
  wire[63:0] T747;
  wire[63:0] T748;
  wire[63:0] T749;
  wire[63:0] T750;
  wire[63:0] T751;
  wire[63:0] T752;
  wire[63:0] T753;
  wire[63:0] T754;
  wire[63:0] T755;
  wire[63:0] T756;
  wire T757;
  wire T758;
  wire T759;
  wire T760;
  wire T761;
  wire T762;
  wire T763;
  wire T764;
  wire[63:0] T1159;
  wire T765;
  wire[63:0] T1160;
  wire T766;
  wire[63:0] T1161;
  wire T767;
  wire[63:0] T1162;
  wire T768;
  wire[63:0] T1163;
  wire T769;
  wire[63:0] T1164;
  wire T770;
  wire T771;
  wire T772;
  wire T773;
  wire T774;
  reg [63:0] buffer_13;
  wire[63:0] T775;
  wire[63:0] T1165;
  wire[63:0] T776;
  wire[63:0] T777;
  wire[63:0] T778;
  wire[63:0] T779;
  wire[63:0] T780;
  wire[63:0] T781;
  wire[63:0] T782;
  wire[63:0] T783;
  wire[63:0] T784;
  wire[63:0] T785;
  wire[63:0] T786;
  wire[63:0] T787;
  wire[63:0] T788;
  wire[63:0] T789;
  wire[63:0] T790;
  wire T791;
  wire T792;
  wire T793;
  wire T794;
  wire T795;
  wire T796;
  wire T797;
  wire T798;
  wire[63:0] T1166;
  wire T799;
  wire[63:0] T1167;
  wire T800;
  wire[63:0] T1168;
  wire T801;
  wire[63:0] T1169;
  wire T802;
  wire[63:0] T1170;
  wire T803;
  wire[63:0] T1171;
  wire T804;
  wire T805;
  wire T806;
  wire T807;
  wire T808;
  wire T809;
  wire[63:0] T810;
  reg [63:0] buffer_14;
  wire[63:0] T811;
  wire[63:0] T1172;
  wire[63:0] T812;
  wire[63:0] T813;
  wire[63:0] T814;
  wire[63:0] T815;
  wire[63:0] T816;
  wire[63:0] T817;
  wire[63:0] T818;
  wire[63:0] T819;
  wire[63:0] T820;
  wire[63:0] T821;
  wire[63:0] T822;
  wire[63:0] T823;
  wire[63:0] T824;
  wire[63:0] T825;
  wire[63:0] T826;
  wire T827;
  wire T828;
  wire T829;
  wire T830;
  wire T831;
  wire T832;
  wire T833;
  wire T834;
  wire[63:0] T1173;
  wire T835;
  wire[63:0] T1174;
  wire T836;
  wire[63:0] T1175;
  wire T837;
  wire[63:0] T1176;
  wire T838;
  wire[63:0] T1177;
  wire T839;
  wire[63:0] T1178;
  wire T840;
  wire T841;
  wire T842;
  wire T843;
  wire T844;
  reg [63:0] buffer_15;
  wire[63:0] T845;
  wire[63:0] T1179;
  wire[63:0] T846;
  wire[63:0] T847;
  wire[63:0] T848;
  wire[63:0] T849;
  wire[63:0] T850;
  wire[63:0] T851;
  wire[63:0] T852;
  wire[63:0] T853;
  wire[63:0] T854;
  wire[63:0] T855;
  wire[63:0] T856;
  wire[63:0] T857;
  wire[63:0] T858;
  wire[63:0] T859;
  wire[63:0] T860;
  wire T861;
  wire T862;
  wire T863;
  wire T864;
  wire T865;
  wire T866;
  wire T867;
  wire T868;
  wire[63:0] T1180;
  wire T869;
  wire[63:0] T1181;
  wire T870;
  wire[63:0] T1182;
  wire T871;
  wire[63:0] T1183;
  wire T872;
  wire[63:0] T1184;
  wire T873;
  wire[63:0] T1185;
  wire T874;
  wire T875;
  wire T876;
  wire T877;
  wire T878;
  wire T879;
  wire T880;
  wire T881;
  wire T882;
  wire T883;
  wire T884;
  wire T885;
  wire[63:0] T886;
  wire[55:0] T887;
  wire T888;
  wire[63:0] T1186;
  wire T891;
  wire[63:0] T1187;
  wire T894;
  wire[63:0] T1188;
  wire T897;
  wire[63:0] T1189;
  wire T900;
  wire[63:0] T1190;
  wire T903;
  wire[63:0] T1191;
  wire T906;
  wire[63:0] T907;
  wire[55:0] T908;
  wire T909;
  wire T910;
  wire T911;
  wire T912;
  reg [63:0] buffer_1;
  wire[63:0] T913;
  wire[63:0] T1192;
  wire[63:0] T914;
  wire[63:0] T915;
  wire[63:0] T916;
  wire[63:0] T917;
  wire[63:0] T918;
  wire[63:0] T919;
  wire[63:0] T920;
  wire[63:0] T921;
  wire[63:0] T922;
  wire[63:0] T923;
  wire[63:0] T924;
  wire[63:0] T925;
  wire[63:0] T926;
  wire[63:0] T927;
  wire[63:0] T928;
  wire T929;
  wire T930;
  wire T931;
  wire T932;
  wire T933;
  wire T934;
  wire T935;
  wire T936;
  wire[63:0] T1193;
  wire T937;
  wire[63:0] T1194;
  wire T938;
  wire[63:0] T1195;
  wire T939;
  wire[63:0] T1196;
  wire T940;
  wire[63:0] T1197;
  wire T941;
  wire[63:0] T1198;
  wire T942;
  wire T943;
  wire T944;
  wire T945;
  wire T946;
  wire T947;
  wire[4:0] T948;
  wire[63:0] T949;
  wire T950;
  wire T951;
  wire[63:0] T952;
  wire[63:0] T953;
  wire T954;
  wire[63:0] T955;
  wire T956;
  wire T957;
  wire T958;
  wire[63:0] T959;
  wire[63:0] T960;
  wire[63:0] T961;
  wire T962;
  wire[63:0] T963;
  wire T964;
  wire T965;
  wire[63:0] T966;
  wire[63:0] T967;
  wire T968;
  wire[63:0] T969;
  wire T970;
  wire T971;
  wire T972;
  wire T973;
  reg [63:0] buffer_16;
  wire[63:0] T974;
  wire[63:0] T1199;
  wire[63:0] T975;
  wire[63:0] T976;
  wire[63:0] T977;
  wire[63:0] T978;
  wire[63:0] T979;
  wire[63:0] T980;
  wire[63:0] T981;
  wire[63:0] T982;
  wire[63:0] T983;
  wire[63:0] T984;
  wire[63:0] T985;
  wire[63:0] T986;
  wire[63:0] T987;
  wire[63:0] T988;
  wire[63:0] T989;
  wire T990;
  wire T991;
  wire T992;
  wire T993;
  wire T994;
  wire T995;
  wire T996;
  wire T997;
  wire[63:0] T1200;
  wire T998;
  wire[63:0] T1201;
  wire T999;
  wire[63:0] T1202;
  wire T1000;
  wire[63:0] T1203;
  wire T1001;
  wire[63:0] T1204;
  wire T1002;
  wire[63:0] T1205;
  wire T1003;
  wire T1004;
  wire T1005;
  wire T1006;
  wire T1007;
  wire T1008;
  reg [2:0] windex;
  wire[2:0] T1206;
  wire[2:0] T1009;
  wire[2:0] T1010;
  wire[2:0] T1011;
  wire[2:0] T1012;
  wire T1013;
  wire T1014;
  wire T1015;
  wire T1016;
  wire T1017;
  wire T1018;
  reg [4:0] R1019;
  wire T1020;
  wire[4:0] T1021;
  wire[4:0] T1022;
  wire[4:0] T1023;
  wire[31:0] T1207;
  wire[63:0] T1024;
  wire[63:0] T1025;
  wire[63:0] T1026;
  wire[63:0] T1208;
  wire[7:0] T1027;
  reg [63:0] msg_addr;
  wire[63:0] T1209;
  wire[63:0] T1028;
  wire[63:0] T1029;
  wire[63:0] T1030;
  wire[63:0] T1031;
  wire T1032;
  wire[63:0] T1033;
  wire[63:0] T1034;
  wire[63:0] T1035;
  wire[63:0] T1210;
  wire[5:0] T1036;
  reg [63:0] hash_addr;
  wire[63:0] T1211;
  wire[63:0] T1037;
  wire[63:0] T1038;
  wire[6:0] T1212;
  wire[4:0] T1039;
  wire[4:0] T1040;
  wire[4:0] T1041;
  wire[4:0] T1213;
  wire T1042;
  wire T1043;
  wire T1044;
  wire T1045;
  wire T1046;
  wire[63:0] T1214;
  wire T1047;
  wire T1048;
  wire T1049;
  wire T1050;
  wire T1051;
  wire T1052;
  wire T1053;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    msg_len = {2{$random}};
    busy = {1{$random}};
    hashed = {1{$random}};
    state = {1{$random}};
    sindex = {1{$random}};
    rindex = {1{$random}};
    writes_done_3 = {1{$random}};
    dmem_resp_tag_reg = {1{$random}};
    writes_done_2 = {1{$random}};
    writes_done_1 = {1{$random}};
    writes_done_0 = {1{$random}};
    buffer_valid = {1{$random}};
    read = {1{$random}};
    mem_s = {1{$random}};
    buffer_count = {1{$random}};
    mindex = {1{$random}};
    areg = {1{$random}};
    pindex = {1{$random}};
    aindex = {1{$random}};
    next_buff_val = {1{$random}};
    rindex_reg = {1{$random}};
    rocc_s = {1{$random}};
    buffer_0 = {2{$random}};
    buffer_2 = {2{$random}};
    buffer_3 = {2{$random}};
    buffer_4 = {2{$random}};
    buffer_5 = {2{$random}};
    buffer_6 = {2{$random}};
    buffer_7 = {2{$random}};
    buffer_8 = {2{$random}};
    buffer_9 = {2{$random}};
    buffer_10 = {2{$random}};
    buffer_11 = {2{$random}};
    buffer_12 = {2{$random}};
    buffer_13 = {2{$random}};
    buffer_14 = {2{$random}};
    buffer_15 = {2{$random}};
    buffer_1 = {2{$random}};
    buffer_16 = {2{$random}};
    windex = {1{$random}};
    R1019 = {1{$random}};
    msg_addr = {2{$random}};
    hash_addr = {2{$random}};
  end
// synthesis translate_on
`endif

`ifndef SYNTHESIS
// synthesis translate_off
  assign buffer_rdata = {2{$random}};
  assign T269 = {2{$random}};
  assign T322 = {2{$random}};
  assign T417 = {2{$random}};
  assign T455 = {2{$random}};
  assign T489 = {2{$random}};
  assign T525 = {2{$random}};
  assign T559 = {2{$random}};
  assign T599 = {2{$random}};
  assign T633 = {2{$random}};
  assign T669 = {2{$random}};
  assign T703 = {2{$random}};
  assign T741 = {2{$random}};
  assign T775 = {2{$random}};
  assign T811 = {2{$random}};
  assign T845 = {2{$random}};
  assign T913 = {2{$random}};
  assign T974 = {2{$random}};
// synthesis translate_on
`endif
  assign byte_offset = msg_len % 4'h8;
  assign T1054 = reset ? 64'h0 : T0;
  assign T0 = T261 ? 64'h0 : T1;
  assign T1 = T2 ? io_rocc_rs1 : msg_len;
  assign T2 = T7 & T3;
  assign T3 = T5 & T4;
  assign T4 = io_rocc_funct == 2'h1;
  assign T5 = T6 ^ 1'h1;
  assign T6 = io_rocc_funct == 2'h0;
  assign T7 = T260 & T8;
  assign T8 = io_rocc_req_val & T9;
  assign T9 = busy ^ 1'h1;
  assign T1055 = reset ? 1'h0 : T10;
  assign T10 = T261 ? 1'h0 : T11;
  assign T11 = T13 ? 1'h1 : T12;
  assign T12 = T2 ? 1'h1 : busy;
  assign T13 = T259 & T14;
  assign T14 = busy & T15;
  assign T15 = T94 & T16;
  assign T16 = T1056 <= msg_len;
  assign T1056 = {32'h0, hashed};
  assign T1057 = reset ? 32'h0 : T17;
  assign T17 = T261 ? 32'h0 : T18;
  assign T18 = T20 ? T19 : hashed;
  assign T19 = hashed + 32'h88;
  assign T20 = T22 & T21;
  assign T21 = 5'h10 <= io_aindex;
  assign T22 = 3'h1 == state;
  assign T1058 = reset ? 3'h0 : T23;
  assign T23 = T64 ? 3'h4 : T24;
  assign T24 = T261 ? 3'h0 : T25;
  assign T25 = T62 ? 3'h0 : T26;
  assign T26 = T54 ? 3'h4 : T27;
  assign T27 = T52 ? 3'h3 : T28;
  assign T28 = T39 ? 3'h3 : T29;
  assign T29 = T38 ? 3'h3 : T30;
  assign T30 = T36 ? 3'h1 : T31;
  assign T31 = T20 ? 3'h2 : T32;
  assign T32 = T34 ? 3'h0 : T33;
  assign T33 = T13 ? 3'h1 : state;
  assign T34 = T259 & T35;
  assign T35 = T14 ^ 1'h1;
  assign T36 = T22 & T37;
  assign T37 = T21 ^ 1'h1;
  assign T38 = 3'h2 == state;
  assign T39 = T45 & T40;
  assign T40 = sindex < 1'h0;
  assign T1059 = reset ? 1'h0 : T41;
  assign T41 = T52 ? 1'h0 : T42;
  assign T42 = T39 ? T44 : T43;
  assign T43 = T20 ? 1'h0 : sindex;
  assign T44 = sindex + 1'h1;
  assign T45 = T51 & T46;
  assign T46 = rindex < 5'h18;
  assign T1060 = reset ? 5'h19 : T47;
  assign T47 = T261 ? 5'h19 : T48;
  assign T48 = T52 ? T50 : T49;
  assign T49 = T20 ? 5'h0 : rindex;
  assign T50 = rindex + 5'h1;
  assign T51 = 3'h3 == state;
  assign T52 = T45 & T53;
  assign T53 = T40 ^ 1'h1;
  assign T54 = T60 & T55;
  assign T55 = T59 | T56;
  assign T56 = T58 & T57;
  assign T57 = rindex == 5'h18;
  assign T58 = T1061 == msg_len;
  assign T1061 = {32'h0, hashed};
  assign T59 = msg_len < T1062;
  assign T1062 = {32'h0, hashed};
  assign T60 = T51 & T61;
  assign T61 = T46 ^ 1'h1;
  assign T62 = T60 & T63;
  assign T63 = T55 ^ 1'h1;
  assign T64 = T93 & T65;
  assign T65 = T66 ^ 1'h1;
  assign T66 = T79 & writes_done_3;
  assign T1063 = reset ? 1'h0 : T67;
  assign T67 = T261 ? 1'h0 : T68;
  assign T68 = T69 ? 1'h1 : writes_done_3;
  assign T69 = T75 & T70;
  assign T70 = T71[2'h3:2'h3];
  assign T71 = 1'h1 << T72;
  assign T72 = T1064;
  assign T1064 = T73[1'h1:1'h0];
  assign T73 = T74 - 5'h11;
  assign T74 = dmem_resp_tag_reg[3'h4:1'h0];
  assign T75 = T78 & T76;
  assign T76 = 5'h11 <= T77;
  assign T77 = dmem_resp_tag_reg[3'h4:1'h0];
  assign T78 = T93 & io_dmem_resp_val;
  assign T79 = T84 & writes_done_2;
  assign T1065 = reset ? 1'h0 : T80;
  assign T80 = T261 ? 1'h0 : T81;
  assign T81 = T82 ? 1'h1 : writes_done_2;
  assign T82 = T75 & T83;
  assign T83 = T71[2'h2:2'h2];
  assign T84 = writes_done_0 & writes_done_1;
  assign T1066 = reset ? 1'h0 : T85;
  assign T85 = T261 ? 1'h0 : T86;
  assign T86 = T87 ? 1'h1 : writes_done_1;
  assign T87 = T75 & T88;
  assign T88 = T71[1'h1:1'h1];
  assign T1067 = reset ? 1'h0 : T89;
  assign T89 = T261 ? 1'h0 : T90;
  assign T90 = T91 ? 1'h1 : writes_done_0;
  assign T91 = T75 & T92;
  assign T92 = T71[1'h0:1'h0];
  assign T93 = 3'h4 == state;
  assign T94 = T258 & buffer_valid;
  assign T1068 = reset ? 1'h0 : T95;
  assign T95 = T261 ? 1'h0 : T96;
  assign T96 = T20 ? 1'h0 : T97;
  assign T97 = T252 ? 1'h1 : T98;
  assign T98 = T251 ? 1'h1 : T99;
  assign T99 = T250 ? next_buff_val : T100;
  assign T100 = T248 ? 1'h1 : T101;
  assign T101 = T243 ? 1'h0 : T102;
  assign T102 = T241 ? 1'h0 : T103;
  assign T103 = T238 ? 1'h0 : T104;
  assign T104 = T237 ? 1'h0 : T105;
  assign T105 = T235 ? 1'h0 : T106;
  assign T106 = T107 ? 1'h0 : buffer_valid;
  assign T107 = T232 & T108;
  assign T108 = T231 < T1069;
  assign T1069 = {32'h0, read};
  assign T1070 = reset ? 32'h0 : T109;
  assign T109 = T261 ? 32'h0 : T110;
  assign T110 = T229 ? T228 : T111;
  assign T111 = T226 ? 32'h1 : T112;
  assign T112 = T114 ? T113 : read;
  assign T113 = read + 32'h8;
  assign T114 = T116 & T115;
  assign T115 = io_dmem_req_rdy & io_dmem_req_val;
  assign T116 = T118 & T117;
  assign T117 = state != 3'h4;
  assign T118 = 3'h1 == mem_s;
  assign T1071 = reset ? 3'h0 : T119;
  assign T119 = T221 ? 3'h0 : T120;
  assign T120 = T219 ? 3'h3 : T121;
  assign T121 = T213 ? 3'h3 : T122;
  assign T122 = T211 ? 3'h4 : T123;
  assign T123 = T209 ? 3'h0 : T124;
  assign T124 = T248 ? 3'h0 : T125;
  assign T125 = T243 ? 3'h3 : T126;
  assign T126 = T202 ? 3'h1 : T127;
  assign T127 = T241 ? 3'h3 : T128;
  assign T128 = T198 ? 3'h1 : T129;
  assign T129 = T238 ? 3'h3 : T130;
  assign T130 = T194 ? 3'h0 : T131;
  assign T131 = T237 ? 3'h3 : T132;
  assign T132 = T165 ? 3'h1 : T133;
  assign T133 = T235 ? 3'h3 : T134;
  assign T134 = T232 ? 3'h1 : T135;
  assign T135 = T107 ? 3'h3 : T136;
  assign T136 = T163 ? 3'h0 : T137;
  assign T137 = T138 ? 3'h1 : mem_s;
  assign T138 = T162 & T139;
  assign T139 = busy & T140;
  assign T140 = T157 & T141;
  assign T141 = T156 & T142;
  assign T142 = buffer_count == 5'h0;
  assign T1072 = reset ? 5'h0 : T143;
  assign T143 = T261 ? 5'h0 : T144;
  assign T144 = T20 ? 5'h0 : T145;
  assign T145 = T153 ? T152 : T146;
  assign T146 = T209 ? 5'h0 : T147;
  assign T147 = T150 ? T149 : T148;
  assign T148 = T138 ? 5'h0 : buffer_count;
  assign T149 = buffer_count + 5'h1;
  assign T150 = T151 & io_dmem_resp_val;
  assign T151 = 3'h2 == mem_s;
  assign T152 = buffer_count + 5'h1;
  assign T153 = io_dmem_resp_val & T154;
  assign T154 = T155 < 5'h11;
  assign T155 = io_dmem_resp_tag[3'h4:1'h0];
  assign T156 = buffer_valid ^ 1'h1;
  assign T157 = T161 | T158;
  assign T158 = T160 & T159;
  assign T159 = msg_len == 64'h0;
  assign T160 = T1073 == msg_len;
  assign T1073 = {32'h0, read};
  assign T161 = T1074 < msg_len;
  assign T1074 = {32'h0, read};
  assign T162 = 3'h0 == mem_s;
  assign T163 = T162 & T164;
  assign T164 = T139 ^ 1'h1;
  assign T165 = T191 & T166;
  assign T166 = T169 & T167;
  assign T167 = T168 ^ 1'h1;
  assign T168 = io_dmem_req_rdy & io_dmem_req_val;
  assign T169 = mindex < 5'h11;
  assign T1075 = reset ? 5'h0 : T170;
  assign T170 = T209 ? 5'h0 : T171;
  assign T171 = T177 ? 5'h0 : T172;
  assign T172 = T229 ? T176 : T173;
  assign T173 = T114 ? T175 : T174;
  assign T174 = T138 ? 5'h0 : mindex;
  assign T175 = mindex + 5'h1;
  assign T176 = mindex + 5'h1;
  assign T177 = T250 & next_buff_val;
  assign T191 = T118 & T192;
  assign T192 = T193 ^ 1'h1;
  assign T193 = mindex < 5'h10;
  assign T194 = T229 & T195;
  assign T195 = T196 ^ 1'h1;
  assign T196 = msg_len < T1076;
  assign T1076 = {32'h0, T197};
  assign T197 = read + 32'h8;
  assign T198 = T200 & T199;
  assign T199 = T1077 < msg_len;
  assign T1077 = {32'h0, read};
  assign T200 = T150 & T201;
  assign T201 = mindex < 5'h10;
  assign T202 = T207 & T203;
  assign T203 = T206 & T204;
  assign T204 = T205 ^ 1'h1;
  assign T205 = io_dmem_req_rdy & io_dmem_req_val;
  assign T206 = mindex < 5'h11;
  assign T207 = T150 & T208;
  assign T208 = T201 ^ 1'h1;
  assign T209 = T177 & areg;
  assign T1078 = reset ? 1'h0 : T210;
  assign T210 = T38 ? 1'h0 : T22;
  assign T211 = T177 & T212;
  assign T212 = areg ^ 1'h1;
  assign T213 = T217 & T214;
  assign T214 = T216 & T215;
  assign T215 = buffer_count <= pindex;
  assign T1079 = reset ? 5'h0 : T180;
  assign T180 = T219 ? T189 : T181;
  assign T181 = T211 ? 5'h0 : T182;
  assign T182 = T209 ? 5'h0 : T183;
  assign T183 = T243 ? words_filled : T184;
  assign T184 = T241 ? words_filled : T185;
  assign T185 = T238 ? words_filled : T186;
  assign T186 = T237 ? words_filled : T187;
  assign T187 = T235 ? words_filled : T188;
  assign T188 = T107 ? words_filled : pindex;
  assign T189 = pindex + 5'h1;
  assign T216 = buffer_count < mindex;
  assign T217 = T250 & T218;
  assign T218 = next_buff_val ^ 1'h1;
  assign T219 = T217 & T220;
  assign T220 = T214 ^ 1'h1;
  assign T221 = T251 & T222;
  assign T222 = 5'h10 <= aindex;
  assign T1080 = reset ? 5'h0 : T223;
  assign T223 = T20 ? 5'h0 : T224;
  assign T224 = T22 ? T225 : aindex;
  assign T225 = aindex + 5'h1;
  assign T226 = T116 & T227;
  assign T227 = msg_len == 64'h0;
  assign T228 = read + 32'h8;
  assign T229 = T191 & T230;
  assign T230 = T166 ^ 1'h1;
  assign T231 = msg_len + 64'h8;
  assign T232 = T234 & T233;
  assign T233 = T1081 < msg_len;
  assign T1081 = {32'h0, read};
  assign T234 = T118 & T193;
  assign T235 = T234 & T236;
  assign T236 = T233 ^ 1'h1;
  assign T237 = T229 & T196;
  assign T238 = T198 & T239;
  assign T239 = T240 < T1082;
  assign T1082 = {32'h0, read};
  assign T240 = msg_len + 64'h8;
  assign T241 = T200 & T242;
  assign T242 = T199 ^ 1'h1;
  assign T243 = T246 & T244;
  assign T244 = msg_len < T1083;
  assign T1083 = {32'h0, T245};
  assign T245 = read + 32'h8;
  assign T246 = T207 & T247;
  assign T247 = T203 ^ 1'h1;
  assign T248 = T246 & T249;
  assign T249 = T244 ^ 1'h1;
  assign T1084 = reset ? 1'h0 : T178;
  assign T178 = T190 & T179;
  assign T179 = 5'h10 <= pindex;
  assign T190 = mindex <= buffer_count;
  assign T250 = 3'h3 == mem_s;
  assign T251 = 3'h4 == mem_s;
  assign T252 = T255 & T253;
  assign T253 = T254 ^ 1'h1;
  assign T254 = msg_len < T1085;
  assign T1085 = {32'h0, read};
  assign T255 = T257 & T256;
  assign T256 = 5'h11 <= mindex;
  assign T257 = mindex <= buffer_count;
  assign T258 = 5'h18 <= rindex_reg;
  assign T259 = 3'h0 == state;
  assign T260 = 2'h0 == rocc_s;
  assign T1086 = reset ? 2'h0 : rocc_s;
  assign T261 = T93 & T66;
  assign words_filled = T263 ? T262 : mindex;
  assign T262 = mindex - 5'h1;
  assign T263 = 5'h0 < mindex;
  assign buffer_wdata = 64'h0;
  assign buffer_waddr = 64'h0;
  assign buffer_wen = 1'h0;
  assign io_buffer_out = T264;
  assign T264 = T1008 ? buffer_16 : T265;
  assign T265 = T973 ? T959 : T266;
  assign T266 = T958 ? T952 : T267;
  assign T267 = T951 ? T949 : T268;
  assign T268 = T947 ? buffer_1 : buffer_0;
  assign T1087 = reset ? T269 : T270;
  assign T270 = T911 ? io_dmem_resp_data : T271;
  assign T271 = T910 ? 64'h1 : T272;
  assign T272 = T909 ? T907 : T273;
  assign T273 = T906 ? T1191 : T274;
  assign T274 = T903 ? T1190 : T275;
  assign T275 = T900 ? T1189 : T276;
  assign T276 = T897 ? T1188 : T277;
  assign T277 = T894 ? T1187 : T278;
  assign T278 = T891 ? T1186 : T279;
  assign T279 = T888 ? T886 : T280;
  assign T280 = T885 ? 64'h8000000000000000 : T281;
  assign T281 = T884 ? T313 : T282;
  assign T282 = T310 ? 64'h0 : T283;
  assign T283 = T290 ? 64'h1 : T284;
  assign T284 = T285 ? io_dmem_resp_data : buffer_0;
  assign T285 = T150 & T286;
  assign T286 = T287[1'h0:1'h0];
  assign T287 = 1'h1 << T288;
  assign T288 = T289;
  assign T289 = mindex - 5'h1;
  assign T290 = T294 & T291;
  assign T291 = T292[1'h0:1'h0];
  assign T292 = 1'h1 << T293;
  assign T293 = pindex;
  assign T294 = T301 & T295;
  assign T295 = T297 & T296;
  assign T296 = 5'h0 < words_filled;
  assign T297 = T300 & T298;
  assign T298 = pindex == T299;
  assign T299 = words_filled + 5'h1;
  assign T300 = byte_offset == 4'h0;
  assign T301 = T305 & T302;
  assign T302 = T304 & T303;
  assign T303 = pindex < 5'h10;
  assign T304 = words_filled < pindex;
  assign T305 = T250 & T306;
  assign T306 = T307 ^ 1'h1;
  assign T307 = T309 & T308;
  assign T308 = buffer_count <= pindex;
  assign T309 = buffer_count < mindex;
  assign T310 = T311 & T291;
  assign T311 = T301 & T312;
  assign T312 = T295 ^ 1'h1;
  assign T313 = {8'h81, T314};
  assign T314 = T315[6'h37:1'h0];
  assign T315 = T883 ? buffer_16 : T316;
  assign T316 = T882 ? T596 : T317;
  assign T317 = T595 ? T453 : T318;
  assign T318 = T452 ? T321 : T319;
  assign T319 = T320 ? buffer_1 : buffer_0;
  assign T320 = T293[1'h0:1'h0];
  assign T321 = T451 ? buffer_3 : buffer_2;
  assign T1088 = reset ? T322 : T323;
  assign T323 = T412 ? io_dmem_resp_data : T324;
  assign T324 = T405 ? 64'h1 : T325;
  assign T325 = T399 ? T907 : T326;
  assign T326 = T393 ? T1094 : T327;
  assign T327 = T387 ? T1093 : T328;
  assign T328 = T381 ? T1092 : T329;
  assign T329 = T375 ? T1091 : T330;
  assign T330 = T370 ? T1090 : T331;
  assign T331 = T360 ? T1089 : T332;
  assign T332 = T357 ? T886 : T333;
  assign T333 = T352 ? 64'h8000000000000000 : T334;
  assign T334 = T343 ? T313 : T335;
  assign T335 = T342 ? 64'h0 : T336;
  assign T336 = T340 ? 64'h1 : T337;
  assign T337 = T338 ? io_dmem_resp_data : buffer_2;
  assign T338 = T150 & T339;
  assign T339 = T287[2'h2:2'h2];
  assign T340 = T294 & T341;
  assign T341 = T292[2'h2:2'h2];
  assign T342 = T311 & T341;
  assign T343 = T344 & T341;
  assign T344 = T346 & T345;
  assign T345 = byte_offset == 4'h7;
  assign T346 = T348 & T347;
  assign T347 = words_filled == 5'h10;
  assign T348 = T305 & T349;
  assign T349 = T351 & T350;
  assign T350 = pindex == 5'h10;
  assign T351 = T302 ^ 1'h1;
  assign T352 = T353 & T341;
  assign T353 = T355 & T354;
  assign T354 = words_filled < 5'h10;
  assign T355 = T348 & T356;
  assign T356 = T347 ^ 1'h1;
  assign T357 = T358 & T341;
  assign T358 = T355 & T359;
  assign T359 = T354 ^ 1'h1;
  assign T1089 = {48'h0, T889};
  assign T889 = {8'h1, T890};
  assign T890 = T315[3'h7:1'h0];
  assign T360 = T361 & T341;
  assign T361 = T363 & T362;
  assign T362 = byte_offset == 4'h1;
  assign T363 = T365 & T364;
  assign T364 = byte_offset != 4'h0;
  assign T365 = T305 & T366;
  assign T366 = T368 & T367;
  assign T367 = pindex == words_filled;
  assign T368 = T369 ^ 1'h1;
  assign T369 = T302 | T350;
  assign T1090 = {40'h0, T892};
  assign T892 = {8'h1, T893};
  assign T893 = T315[4'hf:1'h0];
  assign T370 = T371 & T341;
  assign T371 = T363 & T372;
  assign T372 = T374 & T373;
  assign T373 = byte_offset == 4'h2;
  assign T374 = T362 ^ 1'h1;
  assign T1091 = {32'h0, T895};
  assign T895 = {8'h1, T896};
  assign T896 = T315[5'h17:1'h0];
  assign T375 = T376 & T341;
  assign T376 = T363 & T377;
  assign T377 = T379 & T378;
  assign T378 = byte_offset == 4'h3;
  assign T379 = T380 ^ 1'h1;
  assign T380 = T362 | T373;
  assign T1092 = {24'h0, T898};
  assign T898 = {8'h1, T899};
  assign T899 = T315[5'h1f:1'h0];
  assign T381 = T382 & T341;
  assign T382 = T363 & T383;
  assign T383 = T385 & T384;
  assign T384 = byte_offset == 4'h4;
  assign T385 = T386 ^ 1'h1;
  assign T386 = T380 | T378;
  assign T1093 = {16'h0, T901};
  assign T901 = {8'h1, T902};
  assign T902 = T315[6'h27:1'h0];
  assign T387 = T388 & T341;
  assign T388 = T363 & T389;
  assign T389 = T391 & T390;
  assign T390 = byte_offset == 4'h5;
  assign T391 = T392 ^ 1'h1;
  assign T392 = T386 | T384;
  assign T1094 = {8'h0, T904};
  assign T904 = {8'h1, T905};
  assign T905 = T315[6'h2f:1'h0];
  assign T393 = T394 & T341;
  assign T394 = T363 & T395;
  assign T395 = T397 & T396;
  assign T396 = byte_offset == 4'h6;
  assign T397 = T398 ^ 1'h1;
  assign T398 = T392 | T390;
  assign T399 = T400 & T341;
  assign T400 = T363 & T401;
  assign T401 = T403 & T402;
  assign T402 = byte_offset == 4'h7;
  assign T403 = T404 ^ 1'h1;
  assign T404 = T398 | T396;
  assign T405 = T406 & T341;
  assign T406 = T410 & T407;
  assign T407 = T409 & T408;
  assign T408 = byte_offset == 4'h0;
  assign T409 = words_filled == 5'h0;
  assign T410 = T365 & T411;
  assign T411 = T364 ^ 1'h1;
  assign T412 = T153 & T413;
  assign T413 = T414[2'h2:2'h2];
  assign T414 = 1'h1 << T415;
  assign T415 = T416;
  assign T416 = io_dmem_resp_tag[3'h4:1'h0];
  assign T1095 = reset ? T417 : T418;
  assign T418 = T449 ? io_dmem_resp_data : T419;
  assign T419 = T448 ? 64'h1 : T420;
  assign T420 = T447 ? T907 : T421;
  assign T421 = T446 ? T1101 : T422;
  assign T422 = T445 ? T1100 : T423;
  assign T423 = T444 ? T1099 : T424;
  assign T424 = T443 ? T1098 : T425;
  assign T425 = T442 ? T1097 : T426;
  assign T426 = T441 ? T1096 : T427;
  assign T427 = T440 ? T886 : T428;
  assign T428 = T439 ? 64'h8000000000000000 : T429;
  assign T429 = T438 ? T313 : T430;
  assign T430 = T437 ? 64'h0 : T431;
  assign T431 = T435 ? 64'h1 : T432;
  assign T432 = T433 ? io_dmem_resp_data : buffer_3;
  assign T433 = T150 & T434;
  assign T434 = T287[2'h3:2'h3];
  assign T435 = T294 & T436;
  assign T436 = T292[2'h3:2'h3];
  assign T437 = T311 & T436;
  assign T438 = T344 & T436;
  assign T439 = T353 & T436;
  assign T440 = T358 & T436;
  assign T1096 = {48'h0, T889};
  assign T441 = T361 & T436;
  assign T1097 = {40'h0, T892};
  assign T442 = T371 & T436;
  assign T1098 = {32'h0, T895};
  assign T443 = T376 & T436;
  assign T1099 = {24'h0, T898};
  assign T444 = T382 & T436;
  assign T1100 = {16'h0, T901};
  assign T445 = T388 & T436;
  assign T1101 = {8'h0, T904};
  assign T446 = T394 & T436;
  assign T447 = T400 & T436;
  assign T448 = T406 & T436;
  assign T449 = T153 & T450;
  assign T450 = T414[2'h3:2'h3];
  assign T451 = T293[1'h0:1'h0];
  assign T452 = T293[1'h1:1'h1];
  assign T453 = T594 ? T524 : T454;
  assign T454 = T523 ? buffer_5 : buffer_4;
  assign T1102 = reset ? T455 : T456;
  assign T456 = T487 ? io_dmem_resp_data : T457;
  assign T457 = T486 ? 64'h1 : T458;
  assign T458 = T485 ? T907 : T459;
  assign T459 = T484 ? T1108 : T460;
  assign T460 = T483 ? T1107 : T461;
  assign T461 = T482 ? T1106 : T462;
  assign T462 = T481 ? T1105 : T463;
  assign T463 = T480 ? T1104 : T464;
  assign T464 = T479 ? T1103 : T465;
  assign T465 = T478 ? T886 : T466;
  assign T466 = T477 ? 64'h8000000000000000 : T467;
  assign T467 = T476 ? T313 : T468;
  assign T468 = T475 ? 64'h0 : T469;
  assign T469 = T473 ? 64'h1 : T470;
  assign T470 = T471 ? io_dmem_resp_data : buffer_4;
  assign T471 = T150 & T472;
  assign T472 = T287[3'h4:3'h4];
  assign T473 = T294 & T474;
  assign T474 = T292[3'h4:3'h4];
  assign T475 = T311 & T474;
  assign T476 = T344 & T474;
  assign T477 = T353 & T474;
  assign T478 = T358 & T474;
  assign T1103 = {48'h0, T889};
  assign T479 = T361 & T474;
  assign T1104 = {40'h0, T892};
  assign T480 = T371 & T474;
  assign T1105 = {32'h0, T895};
  assign T481 = T376 & T474;
  assign T1106 = {24'h0, T898};
  assign T482 = T382 & T474;
  assign T1107 = {16'h0, T901};
  assign T483 = T388 & T474;
  assign T1108 = {8'h0, T904};
  assign T484 = T394 & T474;
  assign T485 = T400 & T474;
  assign T486 = T406 & T474;
  assign T487 = T153 & T488;
  assign T488 = T414[3'h4:3'h4];
  assign T1109 = reset ? T489 : T490;
  assign T490 = T521 ? io_dmem_resp_data : T491;
  assign T491 = T520 ? 64'h1 : T492;
  assign T492 = T519 ? T907 : T493;
  assign T493 = T518 ? T1115 : T494;
  assign T494 = T517 ? T1114 : T495;
  assign T495 = T516 ? T1113 : T496;
  assign T496 = T515 ? T1112 : T497;
  assign T497 = T514 ? T1111 : T498;
  assign T498 = T513 ? T1110 : T499;
  assign T499 = T512 ? T886 : T500;
  assign T500 = T511 ? 64'h8000000000000000 : T501;
  assign T501 = T510 ? T313 : T502;
  assign T502 = T509 ? 64'h0 : T503;
  assign T503 = T507 ? 64'h1 : T504;
  assign T504 = T505 ? io_dmem_resp_data : buffer_5;
  assign T505 = T150 & T506;
  assign T506 = T287[3'h5:3'h5];
  assign T507 = T294 & T508;
  assign T508 = T292[3'h5:3'h5];
  assign T509 = T311 & T508;
  assign T510 = T344 & T508;
  assign T511 = T353 & T508;
  assign T512 = T358 & T508;
  assign T1110 = {48'h0, T889};
  assign T513 = T361 & T508;
  assign T1111 = {40'h0, T892};
  assign T514 = T371 & T508;
  assign T1112 = {32'h0, T895};
  assign T515 = T376 & T508;
  assign T1113 = {24'h0, T898};
  assign T516 = T382 & T508;
  assign T1114 = {16'h0, T901};
  assign T517 = T388 & T508;
  assign T1115 = {8'h0, T904};
  assign T518 = T394 & T508;
  assign T519 = T400 & T508;
  assign T520 = T406 & T508;
  assign T521 = T153 & T522;
  assign T522 = T414[3'h5:3'h5];
  assign T523 = T293[1'h0:1'h0];
  assign T524 = T593 ? buffer_7 : buffer_6;
  assign T1116 = reset ? T525 : T526;
  assign T526 = T557 ? io_dmem_resp_data : T527;
  assign T527 = T556 ? 64'h1 : T528;
  assign T528 = T555 ? T907 : T529;
  assign T529 = T554 ? T1122 : T530;
  assign T530 = T553 ? T1121 : T531;
  assign T531 = T552 ? T1120 : T532;
  assign T532 = T551 ? T1119 : T533;
  assign T533 = T550 ? T1118 : T534;
  assign T534 = T549 ? T1117 : T535;
  assign T535 = T548 ? T886 : T536;
  assign T536 = T547 ? 64'h8000000000000000 : T537;
  assign T537 = T546 ? T313 : T538;
  assign T538 = T545 ? 64'h0 : T539;
  assign T539 = T543 ? 64'h1 : T540;
  assign T540 = T541 ? io_dmem_resp_data : buffer_6;
  assign T541 = T150 & T542;
  assign T542 = T287[3'h6:3'h6];
  assign T543 = T294 & T544;
  assign T544 = T292[3'h6:3'h6];
  assign T545 = T311 & T544;
  assign T546 = T344 & T544;
  assign T547 = T353 & T544;
  assign T548 = T358 & T544;
  assign T1117 = {48'h0, T889};
  assign T549 = T361 & T544;
  assign T1118 = {40'h0, T892};
  assign T550 = T371 & T544;
  assign T1119 = {32'h0, T895};
  assign T551 = T376 & T544;
  assign T1120 = {24'h0, T898};
  assign T552 = T382 & T544;
  assign T1121 = {16'h0, T901};
  assign T553 = T388 & T544;
  assign T1122 = {8'h0, T904};
  assign T554 = T394 & T544;
  assign T555 = T400 & T544;
  assign T556 = T406 & T544;
  assign T557 = T153 & T558;
  assign T558 = T414[3'h6:3'h6];
  assign T1123 = reset ? T559 : T560;
  assign T560 = T591 ? io_dmem_resp_data : T561;
  assign T561 = T590 ? 64'h1 : T562;
  assign T562 = T589 ? T907 : T563;
  assign T563 = T588 ? T1129 : T564;
  assign T564 = T587 ? T1128 : T565;
  assign T565 = T586 ? T1127 : T566;
  assign T566 = T585 ? T1126 : T567;
  assign T567 = T584 ? T1125 : T568;
  assign T568 = T583 ? T1124 : T569;
  assign T569 = T582 ? T886 : T570;
  assign T570 = T581 ? 64'h8000000000000000 : T571;
  assign T571 = T580 ? T313 : T572;
  assign T572 = T579 ? 64'h0 : T573;
  assign T573 = T577 ? 64'h1 : T574;
  assign T574 = T575 ? io_dmem_resp_data : buffer_7;
  assign T575 = T150 & T576;
  assign T576 = T287[3'h7:3'h7];
  assign T577 = T294 & T578;
  assign T578 = T292[3'h7:3'h7];
  assign T579 = T311 & T578;
  assign T580 = T344 & T578;
  assign T581 = T353 & T578;
  assign T582 = T358 & T578;
  assign T1124 = {48'h0, T889};
  assign T583 = T361 & T578;
  assign T1125 = {40'h0, T892};
  assign T584 = T371 & T578;
  assign T1126 = {32'h0, T895};
  assign T585 = T376 & T578;
  assign T1127 = {24'h0, T898};
  assign T586 = T382 & T578;
  assign T1128 = {16'h0, T901};
  assign T587 = T388 & T578;
  assign T1129 = {8'h0, T904};
  assign T588 = T394 & T578;
  assign T589 = T400 & T578;
  assign T590 = T406 & T578;
  assign T591 = T153 & T592;
  assign T592 = T414[3'h7:3'h7];
  assign T593 = T293[1'h0:1'h0];
  assign T594 = T293[1'h1:1'h1];
  assign T595 = T293[2'h2:2'h2];
  assign T596 = T881 ? T739 : T597;
  assign T597 = T738 ? T668 : T598;
  assign T598 = T667 ? buffer_9 : buffer_8;
  assign T1130 = reset ? T599 : T600;
  assign T600 = T631 ? io_dmem_resp_data : T601;
  assign T601 = T630 ? 64'h1 : T602;
  assign T602 = T629 ? T907 : T603;
  assign T603 = T628 ? T1136 : T604;
  assign T604 = T627 ? T1135 : T605;
  assign T605 = T626 ? T1134 : T606;
  assign T606 = T625 ? T1133 : T607;
  assign T607 = T624 ? T1132 : T608;
  assign T608 = T623 ? T1131 : T609;
  assign T609 = T622 ? T886 : T610;
  assign T610 = T621 ? 64'h8000000000000000 : T611;
  assign T611 = T620 ? T313 : T612;
  assign T612 = T619 ? 64'h0 : T613;
  assign T613 = T617 ? 64'h1 : T614;
  assign T614 = T615 ? io_dmem_resp_data : buffer_8;
  assign T615 = T150 & T616;
  assign T616 = T287[4'h8:4'h8];
  assign T617 = T294 & T618;
  assign T618 = T292[4'h8:4'h8];
  assign T619 = T311 & T618;
  assign T620 = T344 & T618;
  assign T621 = T353 & T618;
  assign T622 = T358 & T618;
  assign T1131 = {48'h0, T889};
  assign T623 = T361 & T618;
  assign T1132 = {40'h0, T892};
  assign T624 = T371 & T618;
  assign T1133 = {32'h0, T895};
  assign T625 = T376 & T618;
  assign T1134 = {24'h0, T898};
  assign T626 = T382 & T618;
  assign T1135 = {16'h0, T901};
  assign T627 = T388 & T618;
  assign T1136 = {8'h0, T904};
  assign T628 = T394 & T618;
  assign T629 = T400 & T618;
  assign T630 = T406 & T618;
  assign T631 = T153 & T632;
  assign T632 = T414[4'h8:4'h8];
  assign T1137 = reset ? T633 : T634;
  assign T634 = T665 ? io_dmem_resp_data : T635;
  assign T635 = T664 ? 64'h1 : T636;
  assign T636 = T663 ? T907 : T637;
  assign T637 = T662 ? T1143 : T638;
  assign T638 = T661 ? T1142 : T639;
  assign T639 = T660 ? T1141 : T640;
  assign T640 = T659 ? T1140 : T641;
  assign T641 = T658 ? T1139 : T642;
  assign T642 = T657 ? T1138 : T643;
  assign T643 = T656 ? T886 : T644;
  assign T644 = T655 ? 64'h8000000000000000 : T645;
  assign T645 = T654 ? T313 : T646;
  assign T646 = T653 ? 64'h0 : T647;
  assign T647 = T651 ? 64'h1 : T648;
  assign T648 = T649 ? io_dmem_resp_data : buffer_9;
  assign T649 = T150 & T650;
  assign T650 = T287[4'h9:4'h9];
  assign T651 = T294 & T652;
  assign T652 = T292[4'h9:4'h9];
  assign T653 = T311 & T652;
  assign T654 = T344 & T652;
  assign T655 = T353 & T652;
  assign T656 = T358 & T652;
  assign T1138 = {48'h0, T889};
  assign T657 = T361 & T652;
  assign T1139 = {40'h0, T892};
  assign T658 = T371 & T652;
  assign T1140 = {32'h0, T895};
  assign T659 = T376 & T652;
  assign T1141 = {24'h0, T898};
  assign T660 = T382 & T652;
  assign T1142 = {16'h0, T901};
  assign T661 = T388 & T652;
  assign T1143 = {8'h0, T904};
  assign T662 = T394 & T652;
  assign T663 = T400 & T652;
  assign T664 = T406 & T652;
  assign T665 = T153 & T666;
  assign T666 = T414[4'h9:4'h9];
  assign T667 = T293[1'h0:1'h0];
  assign T668 = T737 ? buffer_11 : buffer_10;
  assign T1144 = reset ? T669 : T670;
  assign T670 = T701 ? io_dmem_resp_data : T671;
  assign T671 = T700 ? 64'h1 : T672;
  assign T672 = T699 ? T907 : T673;
  assign T673 = T698 ? T1150 : T674;
  assign T674 = T697 ? T1149 : T675;
  assign T675 = T696 ? T1148 : T676;
  assign T676 = T695 ? T1147 : T677;
  assign T677 = T694 ? T1146 : T678;
  assign T678 = T693 ? T1145 : T679;
  assign T679 = T692 ? T886 : T680;
  assign T680 = T691 ? 64'h8000000000000000 : T681;
  assign T681 = T690 ? T313 : T682;
  assign T682 = T689 ? 64'h0 : T683;
  assign T683 = T687 ? 64'h1 : T684;
  assign T684 = T685 ? io_dmem_resp_data : buffer_10;
  assign T685 = T150 & T686;
  assign T686 = T287[4'ha:4'ha];
  assign T687 = T294 & T688;
  assign T688 = T292[4'ha:4'ha];
  assign T689 = T311 & T688;
  assign T690 = T344 & T688;
  assign T691 = T353 & T688;
  assign T692 = T358 & T688;
  assign T1145 = {48'h0, T889};
  assign T693 = T361 & T688;
  assign T1146 = {40'h0, T892};
  assign T694 = T371 & T688;
  assign T1147 = {32'h0, T895};
  assign T695 = T376 & T688;
  assign T1148 = {24'h0, T898};
  assign T696 = T382 & T688;
  assign T1149 = {16'h0, T901};
  assign T697 = T388 & T688;
  assign T1150 = {8'h0, T904};
  assign T698 = T394 & T688;
  assign T699 = T400 & T688;
  assign T700 = T406 & T688;
  assign T701 = T153 & T702;
  assign T702 = T414[4'ha:4'ha];
  assign T1151 = reset ? T703 : T704;
  assign T704 = T735 ? io_dmem_resp_data : T705;
  assign T705 = T734 ? 64'h1 : T706;
  assign T706 = T733 ? T907 : T707;
  assign T707 = T732 ? T1157 : T708;
  assign T708 = T731 ? T1156 : T709;
  assign T709 = T730 ? T1155 : T710;
  assign T710 = T729 ? T1154 : T711;
  assign T711 = T728 ? T1153 : T712;
  assign T712 = T727 ? T1152 : T713;
  assign T713 = T726 ? T886 : T714;
  assign T714 = T725 ? 64'h8000000000000000 : T715;
  assign T715 = T724 ? T313 : T716;
  assign T716 = T723 ? 64'h0 : T717;
  assign T717 = T721 ? 64'h1 : T718;
  assign T718 = T719 ? io_dmem_resp_data : buffer_11;
  assign T719 = T150 & T720;
  assign T720 = T287[4'hb:4'hb];
  assign T721 = T294 & T722;
  assign T722 = T292[4'hb:4'hb];
  assign T723 = T311 & T722;
  assign T724 = T344 & T722;
  assign T725 = T353 & T722;
  assign T726 = T358 & T722;
  assign T1152 = {48'h0, T889};
  assign T727 = T361 & T722;
  assign T1153 = {40'h0, T892};
  assign T728 = T371 & T722;
  assign T1154 = {32'h0, T895};
  assign T729 = T376 & T722;
  assign T1155 = {24'h0, T898};
  assign T730 = T382 & T722;
  assign T1156 = {16'h0, T901};
  assign T731 = T388 & T722;
  assign T1157 = {8'h0, T904};
  assign T732 = T394 & T722;
  assign T733 = T400 & T722;
  assign T734 = T406 & T722;
  assign T735 = T153 & T736;
  assign T736 = T414[4'hb:4'hb];
  assign T737 = T293[1'h0:1'h0];
  assign T738 = T293[1'h1:1'h1];
  assign T739 = T880 ? T810 : T740;
  assign T740 = T809 ? buffer_13 : buffer_12;
  assign T1158 = reset ? T741 : T742;
  assign T742 = T773 ? io_dmem_resp_data : T743;
  assign T743 = T772 ? 64'h1 : T744;
  assign T744 = T771 ? T907 : T745;
  assign T745 = T770 ? T1164 : T746;
  assign T746 = T769 ? T1163 : T747;
  assign T747 = T768 ? T1162 : T748;
  assign T748 = T767 ? T1161 : T749;
  assign T749 = T766 ? T1160 : T750;
  assign T750 = T765 ? T1159 : T751;
  assign T751 = T764 ? T886 : T752;
  assign T752 = T763 ? 64'h8000000000000000 : T753;
  assign T753 = T762 ? T313 : T754;
  assign T754 = T761 ? 64'h0 : T755;
  assign T755 = T759 ? 64'h1 : T756;
  assign T756 = T757 ? io_dmem_resp_data : buffer_12;
  assign T757 = T150 & T758;
  assign T758 = T287[4'hc:4'hc];
  assign T759 = T294 & T760;
  assign T760 = T292[4'hc:4'hc];
  assign T761 = T311 & T760;
  assign T762 = T344 & T760;
  assign T763 = T353 & T760;
  assign T764 = T358 & T760;
  assign T1159 = {48'h0, T889};
  assign T765 = T361 & T760;
  assign T1160 = {40'h0, T892};
  assign T766 = T371 & T760;
  assign T1161 = {32'h0, T895};
  assign T767 = T376 & T760;
  assign T1162 = {24'h0, T898};
  assign T768 = T382 & T760;
  assign T1163 = {16'h0, T901};
  assign T769 = T388 & T760;
  assign T1164 = {8'h0, T904};
  assign T770 = T394 & T760;
  assign T771 = T400 & T760;
  assign T772 = T406 & T760;
  assign T773 = T153 & T774;
  assign T774 = T414[4'hc:4'hc];
  assign T1165 = reset ? T775 : T776;
  assign T776 = T807 ? io_dmem_resp_data : T777;
  assign T777 = T806 ? 64'h1 : T778;
  assign T778 = T805 ? T907 : T779;
  assign T779 = T804 ? T1171 : T780;
  assign T780 = T803 ? T1170 : T781;
  assign T781 = T802 ? T1169 : T782;
  assign T782 = T801 ? T1168 : T783;
  assign T783 = T800 ? T1167 : T784;
  assign T784 = T799 ? T1166 : T785;
  assign T785 = T798 ? T886 : T786;
  assign T786 = T797 ? 64'h8000000000000000 : T787;
  assign T787 = T796 ? T313 : T788;
  assign T788 = T795 ? 64'h0 : T789;
  assign T789 = T793 ? 64'h1 : T790;
  assign T790 = T791 ? io_dmem_resp_data : buffer_13;
  assign T791 = T150 & T792;
  assign T792 = T287[4'hd:4'hd];
  assign T793 = T294 & T794;
  assign T794 = T292[4'hd:4'hd];
  assign T795 = T311 & T794;
  assign T796 = T344 & T794;
  assign T797 = T353 & T794;
  assign T798 = T358 & T794;
  assign T1166 = {48'h0, T889};
  assign T799 = T361 & T794;
  assign T1167 = {40'h0, T892};
  assign T800 = T371 & T794;
  assign T1168 = {32'h0, T895};
  assign T801 = T376 & T794;
  assign T1169 = {24'h0, T898};
  assign T802 = T382 & T794;
  assign T1170 = {16'h0, T901};
  assign T803 = T388 & T794;
  assign T1171 = {8'h0, T904};
  assign T804 = T394 & T794;
  assign T805 = T400 & T794;
  assign T806 = T406 & T794;
  assign T807 = T153 & T808;
  assign T808 = T414[4'hd:4'hd];
  assign T809 = T293[1'h0:1'h0];
  assign T810 = T879 ? buffer_15 : buffer_14;
  assign T1172 = reset ? T811 : T812;
  assign T812 = T843 ? io_dmem_resp_data : T813;
  assign T813 = T842 ? 64'h1 : T814;
  assign T814 = T841 ? T907 : T815;
  assign T815 = T840 ? T1178 : T816;
  assign T816 = T839 ? T1177 : T817;
  assign T817 = T838 ? T1176 : T818;
  assign T818 = T837 ? T1175 : T819;
  assign T819 = T836 ? T1174 : T820;
  assign T820 = T835 ? T1173 : T821;
  assign T821 = T834 ? T886 : T822;
  assign T822 = T833 ? 64'h8000000000000000 : T823;
  assign T823 = T832 ? T313 : T824;
  assign T824 = T831 ? 64'h0 : T825;
  assign T825 = T829 ? 64'h1 : T826;
  assign T826 = T827 ? io_dmem_resp_data : buffer_14;
  assign T827 = T150 & T828;
  assign T828 = T287[4'he:4'he];
  assign T829 = T294 & T830;
  assign T830 = T292[4'he:4'he];
  assign T831 = T311 & T830;
  assign T832 = T344 & T830;
  assign T833 = T353 & T830;
  assign T834 = T358 & T830;
  assign T1173 = {48'h0, T889};
  assign T835 = T361 & T830;
  assign T1174 = {40'h0, T892};
  assign T836 = T371 & T830;
  assign T1175 = {32'h0, T895};
  assign T837 = T376 & T830;
  assign T1176 = {24'h0, T898};
  assign T838 = T382 & T830;
  assign T1177 = {16'h0, T901};
  assign T839 = T388 & T830;
  assign T1178 = {8'h0, T904};
  assign T840 = T394 & T830;
  assign T841 = T400 & T830;
  assign T842 = T406 & T830;
  assign T843 = T153 & T844;
  assign T844 = T414[4'he:4'he];
  assign T1179 = reset ? T845 : T846;
  assign T846 = T877 ? io_dmem_resp_data : T847;
  assign T847 = T876 ? 64'h1 : T848;
  assign T848 = T875 ? T907 : T849;
  assign T849 = T874 ? T1185 : T850;
  assign T850 = T873 ? T1184 : T851;
  assign T851 = T872 ? T1183 : T852;
  assign T852 = T871 ? T1182 : T853;
  assign T853 = T870 ? T1181 : T854;
  assign T854 = T869 ? T1180 : T855;
  assign T855 = T868 ? T886 : T856;
  assign T856 = T867 ? 64'h8000000000000000 : T857;
  assign T857 = T866 ? T313 : T858;
  assign T858 = T865 ? 64'h0 : T859;
  assign T859 = T863 ? 64'h1 : T860;
  assign T860 = T861 ? io_dmem_resp_data : buffer_15;
  assign T861 = T150 & T862;
  assign T862 = T287[4'hf:4'hf];
  assign T863 = T294 & T864;
  assign T864 = T292[4'hf:4'hf];
  assign T865 = T311 & T864;
  assign T866 = T344 & T864;
  assign T867 = T353 & T864;
  assign T868 = T358 & T864;
  assign T1180 = {48'h0, T889};
  assign T869 = T361 & T864;
  assign T1181 = {40'h0, T892};
  assign T870 = T371 & T864;
  assign T1182 = {32'h0, T895};
  assign T871 = T376 & T864;
  assign T1183 = {24'h0, T898};
  assign T872 = T382 & T864;
  assign T1184 = {16'h0, T901};
  assign T873 = T388 & T864;
  assign T1185 = {8'h0, T904};
  assign T874 = T394 & T864;
  assign T875 = T400 & T864;
  assign T876 = T406 & T864;
  assign T877 = T153 & T878;
  assign T878 = T414[4'hf:4'hf];
  assign T879 = T293[1'h0:1'h0];
  assign T880 = T293[1'h1:1'h1];
  assign T881 = T293[2'h2:2'h2];
  assign T882 = T293[2'h3:2'h3];
  assign T883 = T293[3'h4:3'h4];
  assign T884 = T344 & T291;
  assign T885 = T353 & T291;
  assign T886 = {8'h80, T887};
  assign T887 = T315[6'h37:1'h0];
  assign T888 = T358 & T291;
  assign T1186 = {48'h0, T889};
  assign T891 = T361 & T291;
  assign T1187 = {40'h0, T892};
  assign T894 = T371 & T291;
  assign T1188 = {32'h0, T895};
  assign T897 = T376 & T291;
  assign T1189 = {24'h0, T898};
  assign T900 = T382 & T291;
  assign T1190 = {16'h0, T901};
  assign T903 = T388 & T291;
  assign T1191 = {8'h0, T904};
  assign T906 = T394 & T291;
  assign T907 = {8'h1, T908};
  assign T908 = T315[6'h37:1'h0];
  assign T909 = T400 & T291;
  assign T910 = T406 & T291;
  assign T911 = T153 & T912;
  assign T912 = T414[1'h0:1'h0];
  assign T1192 = reset ? T913 : T914;
  assign T914 = T945 ? io_dmem_resp_data : T915;
  assign T915 = T944 ? 64'h1 : T916;
  assign T916 = T943 ? T907 : T917;
  assign T917 = T942 ? T1198 : T918;
  assign T918 = T941 ? T1197 : T919;
  assign T919 = T940 ? T1196 : T920;
  assign T920 = T939 ? T1195 : T921;
  assign T921 = T938 ? T1194 : T922;
  assign T922 = T937 ? T1193 : T923;
  assign T923 = T936 ? T886 : T924;
  assign T924 = T935 ? 64'h8000000000000000 : T925;
  assign T925 = T934 ? T313 : T926;
  assign T926 = T933 ? 64'h0 : T927;
  assign T927 = T931 ? 64'h1 : T928;
  assign T928 = T929 ? io_dmem_resp_data : buffer_1;
  assign T929 = T150 & T930;
  assign T930 = T287[1'h1:1'h1];
  assign T931 = T294 & T932;
  assign T932 = T292[1'h1:1'h1];
  assign T933 = T311 & T932;
  assign T934 = T344 & T932;
  assign T935 = T353 & T932;
  assign T936 = T358 & T932;
  assign T1193 = {48'h0, T889};
  assign T937 = T361 & T932;
  assign T1194 = {40'h0, T892};
  assign T938 = T371 & T932;
  assign T1195 = {32'h0, T895};
  assign T939 = T376 & T932;
  assign T1196 = {24'h0, T898};
  assign T940 = T382 & T932;
  assign T1197 = {16'h0, T901};
  assign T941 = T388 & T932;
  assign T1198 = {8'h0, T904};
  assign T942 = T394 & T932;
  assign T943 = T400 & T932;
  assign T944 = T406 & T932;
  assign T945 = T153 & T946;
  assign T946 = T414[1'h1:1'h1];
  assign T947 = T948[1'h0:1'h0];
  assign T948 = io_aindex;
  assign T949 = T950 ? buffer_3 : buffer_2;
  assign T950 = T948[1'h0:1'h0];
  assign T951 = T948[1'h1:1'h1];
  assign T952 = T957 ? T955 : T953;
  assign T953 = T954 ? buffer_5 : buffer_4;
  assign T954 = T948[1'h0:1'h0];
  assign T955 = T956 ? buffer_7 : buffer_6;
  assign T956 = T948[1'h0:1'h0];
  assign T957 = T948[1'h1:1'h1];
  assign T958 = T948[2'h2:2'h2];
  assign T959 = T972 ? T966 : T960;
  assign T960 = T965 ? T963 : T961;
  assign T961 = T962 ? buffer_9 : buffer_8;
  assign T962 = T948[1'h0:1'h0];
  assign T963 = T964 ? buffer_11 : buffer_10;
  assign T964 = T948[1'h0:1'h0];
  assign T965 = T948[1'h1:1'h1];
  assign T966 = T971 ? T969 : T967;
  assign T967 = T968 ? buffer_13 : buffer_12;
  assign T968 = T948[1'h0:1'h0];
  assign T969 = T970 ? buffer_15 : buffer_14;
  assign T970 = T948[1'h0:1'h0];
  assign T971 = T948[1'h1:1'h1];
  assign T972 = T948[2'h2:2'h2];
  assign T973 = T948[2'h3:2'h3];
  assign T1199 = reset ? T974 : T975;
  assign T975 = T1006 ? io_dmem_resp_data : T976;
  assign T976 = T1005 ? 64'h1 : T977;
  assign T977 = T1004 ? T907 : T978;
  assign T978 = T1003 ? T1205 : T979;
  assign T979 = T1002 ? T1204 : T980;
  assign T980 = T1001 ? T1203 : T981;
  assign T981 = T1000 ? T1202 : T982;
  assign T982 = T999 ? T1201 : T983;
  assign T983 = T998 ? T1200 : T984;
  assign T984 = T997 ? T886 : T985;
  assign T985 = T996 ? 64'h8000000000000000 : T986;
  assign T986 = T995 ? T313 : T987;
  assign T987 = T994 ? 64'h0 : T988;
  assign T988 = T992 ? 64'h1 : T989;
  assign T989 = T990 ? io_dmem_resp_data : buffer_16;
  assign T990 = T150 & T991;
  assign T991 = T287[5'h10:5'h10];
  assign T992 = T294 & T993;
  assign T993 = T292[5'h10:5'h10];
  assign T994 = T311 & T993;
  assign T995 = T344 & T993;
  assign T996 = T353 & T993;
  assign T997 = T358 & T993;
  assign T1200 = {48'h0, T889};
  assign T998 = T361 & T993;
  assign T1201 = {40'h0, T892};
  assign T999 = T371 & T993;
  assign T1202 = {32'h0, T895};
  assign T1000 = T376 & T993;
  assign T1203 = {24'h0, T898};
  assign T1001 = T382 & T993;
  assign T1204 = {16'h0, T901};
  assign T1002 = T388 & T993;
  assign T1205 = {8'h0, T904};
  assign T1003 = T394 & T993;
  assign T1004 = T400 & T993;
  assign T1005 = T406 & T993;
  assign T1006 = T153 & T1007;
  assign T1007 = T414[5'h10:5'h10];
  assign T1008 = T948[3'h4:3'h4];
  assign io_windex = windex;
  assign T1206 = reset ? 3'h0 : T1009;
  assign T1009 = T261 ? 3'h4 : T1010;
  assign T1010 = T1013 ? T1012 : T1011;
  assign T1011 = T54 ? 3'h0 : windex;
  assign T1012 = windex + 3'h1;
  assign T1013 = T93 & io_dmem_req_rdy;
  assign io_write = T1014;
  assign T1014 = T60 ? 1'h1 : T1015;
  assign T1015 = T52 ? 1'h0 : T1016;
  assign T1016 = T39 ? 1'h0 : T1017;
  assign T1017 = T22 ? T1018 : 1'h1;
  assign T1018 = areg ^ 1'h1;
  assign io_init = T261;
  assign io_aindex = R1019;
  assign io_absorb = areg;
  assign io_stage = T1020;
  assign T1020 = T39 ? sindex : sindex;
  assign io_round = T1021;
  assign T1021 = T52 ? rindex : T1022;
  assign T1022 = T39 ? rindex : rindex;
  assign io_dmem_req_typ = 3'h3;
  assign io_dmem_req_cmd = T1023;
  assign T1023 = T93 ? 5'h1 : 5'h0;
  assign io_dmem_req_addr = T1207;
  assign T1207 = T1024[5'h1f:1'h0];
  assign T1024 = T93 ? T1035 : T1025;
  assign T1025 = T116 ? T1026 : 64'h0;
  assign T1026 = msg_addr + T1208;
  assign T1208 = {56'h0, T1027};
  assign T1027 = mindex << 2'h3;
  assign T1209 = reset ? 64'h0 : T1028;
  assign T1028 = T261 ? 64'h0 : T1029;
  assign T1029 = T246 ? T1034 : T1030;
  assign T1030 = T229 ? T1033 : T1031;
  assign T1031 = T1032 ? io_rocc_rs1 : msg_addr;
  assign T1032 = T7 & T6;
  assign T1033 = msg_addr + 64'h88;
  assign T1034 = msg_addr + 64'h88;
  assign T1035 = hash_addr + T1210;
  assign T1210 = {58'h0, T1036};
  assign T1036 = windex << 2'h3;
  assign T1211 = reset ? 64'h0 : T1037;
  assign T1037 = T261 ? 64'h0 : T1038;
  assign T1038 = T1032 ? io_rocc_rs2 : hash_addr;
  assign io_dmem_req_tag = T1212;
  assign T1212 = {2'h0, T1039};
  assign T1039 = T93 ? T1041 : T1040;
  assign T1040 = T116 ? mindex : rindex;
  assign T1041 = 5'h11 + T1213;
  assign T1213 = {2'h0, windex};
  assign io_dmem_req_val = T1042;
  assign T1042 = T93 ? T1047 : T1043;
  assign T1043 = T116 ? T1044 : 1'h0;
  assign T1044 = T1046 & T1045;
  assign T1045 = mindex < 5'h11;
  assign T1046 = T1214 < msg_len;
  assign T1214 = {32'h0, read};
  assign T1047 = windex < 3'h4;
  assign io_busy = T1048;
  assign T1048 = T2 ? 1'h1 : T1049;
  assign T1049 = T1032 ? 1'h1 : busy;
  assign io_rocc_req_rdy = T1050;
  assign T1050 = T2 ? 1'h1 : T1051;
  assign T1051 = T1032 ? 1'h1 : T1052;
  assign T1052 = T260 ? T1053 : 1'h0;
  assign T1053 = busy ^ 1'h1;

  always @(posedge clk) begin
    if(reset) begin
      msg_len <= 64'h0;
    end else if(T261) begin
      msg_len <= 64'h0;
    end else if(T2) begin
      msg_len <= io_rocc_rs1;
    end
    if(reset) begin
      busy <= 1'h0;
    end else if(T261) begin
      busy <= 1'h0;
    end else if(T13) begin
      busy <= 1'h1;
    end else if(T2) begin
      busy <= 1'h1;
    end
    if(reset) begin
      hashed <= 32'h0;
    end else if(T261) begin
      hashed <= 32'h0;
    end else if(T20) begin
      hashed <= T19;
    end
    if(reset) begin
      state <= 3'h0;
    end else if(T64) begin
      state <= 3'h4;
    end else if(T261) begin
      state <= 3'h0;
    end else if(T62) begin
      state <= 3'h0;
    end else if(T54) begin
      state <= 3'h4;
    end else if(T52) begin
      state <= 3'h3;
    end else if(T39) begin
      state <= 3'h3;
    end else if(T38) begin
      state <= 3'h3;
    end else if(T36) begin
      state <= 3'h1;
    end else if(T20) begin
      state <= 3'h2;
    end else if(T34) begin
      state <= 3'h0;
    end else if(T13) begin
      state <= 3'h1;
    end
    if(reset) begin
      sindex <= 1'h0;
    end else if(T52) begin
      sindex <= 1'h0;
    end else if(T39) begin
      sindex <= T44;
    end else if(T20) begin
      sindex <= 1'h0;
    end
    if(reset) begin
      rindex <= 5'h19;
    end else if(T261) begin
      rindex <= 5'h19;
    end else if(T52) begin
      rindex <= T50;
    end else if(T20) begin
      rindex <= 5'h0;
    end
    if(reset) begin
      writes_done_3 <= 1'h0;
    end else if(T261) begin
      writes_done_3 <= 1'h0;
    end else if(T69) begin
      writes_done_3 <= 1'h1;
    end
    dmem_resp_tag_reg <= io_dmem_resp_tag;
    if(reset) begin
      writes_done_2 <= 1'h0;
    end else if(T261) begin
      writes_done_2 <= 1'h0;
    end else if(T82) begin
      writes_done_2 <= 1'h1;
    end
    if(reset) begin
      writes_done_1 <= 1'h0;
    end else if(T261) begin
      writes_done_1 <= 1'h0;
    end else if(T87) begin
      writes_done_1 <= 1'h1;
    end
    if(reset) begin
      writes_done_0 <= 1'h0;
    end else if(T261) begin
      writes_done_0 <= 1'h0;
    end else if(T91) begin
      writes_done_0 <= 1'h1;
    end
    if(reset) begin
      buffer_valid <= 1'h0;
    end else if(T261) begin
      buffer_valid <= 1'h0;
    end else if(T20) begin
      buffer_valid <= 1'h0;
    end else if(T252) begin
      buffer_valid <= 1'h1;
    end else if(T251) begin
      buffer_valid <= 1'h1;
    end else if(T250) begin
      buffer_valid <= next_buff_val;
    end else if(T248) begin
      buffer_valid <= 1'h1;
    end else if(T243) begin
      buffer_valid <= 1'h0;
    end else if(T241) begin
      buffer_valid <= 1'h0;
    end else if(T238) begin
      buffer_valid <= 1'h0;
    end else if(T237) begin
      buffer_valid <= 1'h0;
    end else if(T235) begin
      buffer_valid <= 1'h0;
    end else if(T107) begin
      buffer_valid <= 1'h0;
    end
    if(reset) begin
      read <= 32'h0;
    end else if(T261) begin
      read <= 32'h0;
    end else if(T229) begin
      read <= T228;
    end else if(T226) begin
      read <= 32'h1;
    end else if(T114) begin
      read <= T113;
    end
    if(reset) begin
      mem_s <= 3'h0;
    end else if(T221) begin
      mem_s <= 3'h0;
    end else if(T219) begin
      mem_s <= 3'h3;
    end else if(T213) begin
      mem_s <= 3'h3;
    end else if(T211) begin
      mem_s <= 3'h4;
    end else if(T209) begin
      mem_s <= 3'h0;
    end else if(T248) begin
      mem_s <= 3'h0;
    end else if(T243) begin
      mem_s <= 3'h3;
    end else if(T202) begin
      mem_s <= 3'h1;
    end else if(T241) begin
      mem_s <= 3'h3;
    end else if(T198) begin
      mem_s <= 3'h1;
    end else if(T238) begin
      mem_s <= 3'h3;
    end else if(T194) begin
      mem_s <= 3'h0;
    end else if(T237) begin
      mem_s <= 3'h3;
    end else if(T165) begin
      mem_s <= 3'h1;
    end else if(T235) begin
      mem_s <= 3'h3;
    end else if(T232) begin
      mem_s <= 3'h1;
    end else if(T107) begin
      mem_s <= 3'h3;
    end else if(T163) begin
      mem_s <= 3'h0;
    end else if(T138) begin
      mem_s <= 3'h1;
    end
    if(reset) begin
      buffer_count <= 5'h0;
    end else if(T261) begin
      buffer_count <= 5'h0;
    end else if(T20) begin
      buffer_count <= 5'h0;
    end else if(T153) begin
      buffer_count <= T152;
    end else if(T209) begin
      buffer_count <= 5'h0;
    end else if(T150) begin
      buffer_count <= T149;
    end else if(T138) begin
      buffer_count <= 5'h0;
    end
    if(reset) begin
      mindex <= 5'h0;
    end else if(T209) begin
      mindex <= 5'h0;
    end else if(T177) begin
      mindex <= 5'h0;
    end else if(T229) begin
      mindex <= T176;
    end else if(T114) begin
      mindex <= T175;
    end else if(T138) begin
      mindex <= 5'h0;
    end
    if(reset) begin
      areg <= 1'h0;
    end else if(T38) begin
      areg <= 1'h0;
    end else begin
      areg <= T22;
    end
    if(reset) begin
      pindex <= 5'h0;
    end else if(T219) begin
      pindex <= T189;
    end else if(T211) begin
      pindex <= 5'h0;
    end else if(T209) begin
      pindex <= 5'h0;
    end else if(T243) begin
      pindex <= words_filled;
    end else if(T241) begin
      pindex <= words_filled;
    end else if(T238) begin
      pindex <= words_filled;
    end else if(T237) begin
      pindex <= words_filled;
    end else if(T235) begin
      pindex <= words_filled;
    end else if(T107) begin
      pindex <= words_filled;
    end
    if(reset) begin
      aindex <= 5'h0;
    end else if(T20) begin
      aindex <= 5'h0;
    end else if(T22) begin
      aindex <= T225;
    end
    if(reset) begin
      next_buff_val <= 1'h0;
    end else begin
      next_buff_val <= T178;
    end
    rindex_reg <= rindex;
    if(reset) begin
      rocc_s <= 2'h0;
    end
    if(reset) begin
      buffer_0 <= T269;
    end else if(T911) begin
      buffer_0 <= io_dmem_resp_data;
    end else if(T910) begin
      buffer_0 <= 64'h1;
    end else if(T909) begin
      buffer_0 <= T907;
    end else if(T906) begin
      buffer_0 <= T1191;
    end else if(T903) begin
      buffer_0 <= T1190;
    end else if(T900) begin
      buffer_0 <= T1189;
    end else if(T897) begin
      buffer_0 <= T1188;
    end else if(T894) begin
      buffer_0 <= T1187;
    end else if(T891) begin
      buffer_0 <= T1186;
    end else if(T888) begin
      buffer_0 <= T886;
    end else if(T885) begin
      buffer_0 <= 64'h8000000000000000;
    end else if(T884) begin
      buffer_0 <= T313;
    end else if(T310) begin
      buffer_0 <= 64'h0;
    end else if(T290) begin
      buffer_0 <= 64'h1;
    end else if(T285) begin
      buffer_0 <= io_dmem_resp_data;
    end
    if(reset) begin
      buffer_2 <= T322;
    end else if(T412) begin
      buffer_2 <= io_dmem_resp_data;
    end else if(T405) begin
      buffer_2 <= 64'h1;
    end else if(T399) begin
      buffer_2 <= T907;
    end else if(T393) begin
      buffer_2 <= T1094;
    end else if(T387) begin
      buffer_2 <= T1093;
    end else if(T381) begin
      buffer_2 <= T1092;
    end else if(T375) begin
      buffer_2 <= T1091;
    end else if(T370) begin
      buffer_2 <= T1090;
    end else if(T360) begin
      buffer_2 <= T1089;
    end else if(T357) begin
      buffer_2 <= T886;
    end else if(T352) begin
      buffer_2 <= 64'h8000000000000000;
    end else if(T343) begin
      buffer_2 <= T313;
    end else if(T342) begin
      buffer_2 <= 64'h0;
    end else if(T340) begin
      buffer_2 <= 64'h1;
    end else if(T338) begin
      buffer_2 <= io_dmem_resp_data;
    end
    if(reset) begin
      buffer_3 <= T417;
    end else if(T449) begin
      buffer_3 <= io_dmem_resp_data;
    end else if(T448) begin
      buffer_3 <= 64'h1;
    end else if(T447) begin
      buffer_3 <= T907;
    end else if(T446) begin
      buffer_3 <= T1101;
    end else if(T445) begin
      buffer_3 <= T1100;
    end else if(T444) begin
      buffer_3 <= T1099;
    end else if(T443) begin
      buffer_3 <= T1098;
    end else if(T442) begin
      buffer_3 <= T1097;
    end else if(T441) begin
      buffer_3 <= T1096;
    end else if(T440) begin
      buffer_3 <= T886;
    end else if(T439) begin
      buffer_3 <= 64'h8000000000000000;
    end else if(T438) begin
      buffer_3 <= T313;
    end else if(T437) begin
      buffer_3 <= 64'h0;
    end else if(T435) begin
      buffer_3 <= 64'h1;
    end else if(T433) begin
      buffer_3 <= io_dmem_resp_data;
    end
    if(reset) begin
      buffer_4 <= T455;
    end else if(T487) begin
      buffer_4 <= io_dmem_resp_data;
    end else if(T486) begin
      buffer_4 <= 64'h1;
    end else if(T485) begin
      buffer_4 <= T907;
    end else if(T484) begin
      buffer_4 <= T1108;
    end else if(T483) begin
      buffer_4 <= T1107;
    end else if(T482) begin
      buffer_4 <= T1106;
    end else if(T481) begin
      buffer_4 <= T1105;
    end else if(T480) begin
      buffer_4 <= T1104;
    end else if(T479) begin
      buffer_4 <= T1103;
    end else if(T478) begin
      buffer_4 <= T886;
    end else if(T477) begin
      buffer_4 <= 64'h8000000000000000;
    end else if(T476) begin
      buffer_4 <= T313;
    end else if(T475) begin
      buffer_4 <= 64'h0;
    end else if(T473) begin
      buffer_4 <= 64'h1;
    end else if(T471) begin
      buffer_4 <= io_dmem_resp_data;
    end
    if(reset) begin
      buffer_5 <= T489;
    end else if(T521) begin
      buffer_5 <= io_dmem_resp_data;
    end else if(T520) begin
      buffer_5 <= 64'h1;
    end else if(T519) begin
      buffer_5 <= T907;
    end else if(T518) begin
      buffer_5 <= T1115;
    end else if(T517) begin
      buffer_5 <= T1114;
    end else if(T516) begin
      buffer_5 <= T1113;
    end else if(T515) begin
      buffer_5 <= T1112;
    end else if(T514) begin
      buffer_5 <= T1111;
    end else if(T513) begin
      buffer_5 <= T1110;
    end else if(T512) begin
      buffer_5 <= T886;
    end else if(T511) begin
      buffer_5 <= 64'h8000000000000000;
    end else if(T510) begin
      buffer_5 <= T313;
    end else if(T509) begin
      buffer_5 <= 64'h0;
    end else if(T507) begin
      buffer_5 <= 64'h1;
    end else if(T505) begin
      buffer_5 <= io_dmem_resp_data;
    end
    if(reset) begin
      buffer_6 <= T525;
    end else if(T557) begin
      buffer_6 <= io_dmem_resp_data;
    end else if(T556) begin
      buffer_6 <= 64'h1;
    end else if(T555) begin
      buffer_6 <= T907;
    end else if(T554) begin
      buffer_6 <= T1122;
    end else if(T553) begin
      buffer_6 <= T1121;
    end else if(T552) begin
      buffer_6 <= T1120;
    end else if(T551) begin
      buffer_6 <= T1119;
    end else if(T550) begin
      buffer_6 <= T1118;
    end else if(T549) begin
      buffer_6 <= T1117;
    end else if(T548) begin
      buffer_6 <= T886;
    end else if(T547) begin
      buffer_6 <= 64'h8000000000000000;
    end else if(T546) begin
      buffer_6 <= T313;
    end else if(T545) begin
      buffer_6 <= 64'h0;
    end else if(T543) begin
      buffer_6 <= 64'h1;
    end else if(T541) begin
      buffer_6 <= io_dmem_resp_data;
    end
    if(reset) begin
      buffer_7 <= T559;
    end else if(T591) begin
      buffer_7 <= io_dmem_resp_data;
    end else if(T590) begin
      buffer_7 <= 64'h1;
    end else if(T589) begin
      buffer_7 <= T907;
    end else if(T588) begin
      buffer_7 <= T1129;
    end else if(T587) begin
      buffer_7 <= T1128;
    end else if(T586) begin
      buffer_7 <= T1127;
    end else if(T585) begin
      buffer_7 <= T1126;
    end else if(T584) begin
      buffer_7 <= T1125;
    end else if(T583) begin
      buffer_7 <= T1124;
    end else if(T582) begin
      buffer_7 <= T886;
    end else if(T581) begin
      buffer_7 <= 64'h8000000000000000;
    end else if(T580) begin
      buffer_7 <= T313;
    end else if(T579) begin
      buffer_7 <= 64'h0;
    end else if(T577) begin
      buffer_7 <= 64'h1;
    end else if(T575) begin
      buffer_7 <= io_dmem_resp_data;
    end
    if(reset) begin
      buffer_8 <= T599;
    end else if(T631) begin
      buffer_8 <= io_dmem_resp_data;
    end else if(T630) begin
      buffer_8 <= 64'h1;
    end else if(T629) begin
      buffer_8 <= T907;
    end else if(T628) begin
      buffer_8 <= T1136;
    end else if(T627) begin
      buffer_8 <= T1135;
    end else if(T626) begin
      buffer_8 <= T1134;
    end else if(T625) begin
      buffer_8 <= T1133;
    end else if(T624) begin
      buffer_8 <= T1132;
    end else if(T623) begin
      buffer_8 <= T1131;
    end else if(T622) begin
      buffer_8 <= T886;
    end else if(T621) begin
      buffer_8 <= 64'h8000000000000000;
    end else if(T620) begin
      buffer_8 <= T313;
    end else if(T619) begin
      buffer_8 <= 64'h0;
    end else if(T617) begin
      buffer_8 <= 64'h1;
    end else if(T615) begin
      buffer_8 <= io_dmem_resp_data;
    end
    if(reset) begin
      buffer_9 <= T633;
    end else if(T665) begin
      buffer_9 <= io_dmem_resp_data;
    end else if(T664) begin
      buffer_9 <= 64'h1;
    end else if(T663) begin
      buffer_9 <= T907;
    end else if(T662) begin
      buffer_9 <= T1143;
    end else if(T661) begin
      buffer_9 <= T1142;
    end else if(T660) begin
      buffer_9 <= T1141;
    end else if(T659) begin
      buffer_9 <= T1140;
    end else if(T658) begin
      buffer_9 <= T1139;
    end else if(T657) begin
      buffer_9 <= T1138;
    end else if(T656) begin
      buffer_9 <= T886;
    end else if(T655) begin
      buffer_9 <= 64'h8000000000000000;
    end else if(T654) begin
      buffer_9 <= T313;
    end else if(T653) begin
      buffer_9 <= 64'h0;
    end else if(T651) begin
      buffer_9 <= 64'h1;
    end else if(T649) begin
      buffer_9 <= io_dmem_resp_data;
    end
    if(reset) begin
      buffer_10 <= T669;
    end else if(T701) begin
      buffer_10 <= io_dmem_resp_data;
    end else if(T700) begin
      buffer_10 <= 64'h1;
    end else if(T699) begin
      buffer_10 <= T907;
    end else if(T698) begin
      buffer_10 <= T1150;
    end else if(T697) begin
      buffer_10 <= T1149;
    end else if(T696) begin
      buffer_10 <= T1148;
    end else if(T695) begin
      buffer_10 <= T1147;
    end else if(T694) begin
      buffer_10 <= T1146;
    end else if(T693) begin
      buffer_10 <= T1145;
    end else if(T692) begin
      buffer_10 <= T886;
    end else if(T691) begin
      buffer_10 <= 64'h8000000000000000;
    end else if(T690) begin
      buffer_10 <= T313;
    end else if(T689) begin
      buffer_10 <= 64'h0;
    end else if(T687) begin
      buffer_10 <= 64'h1;
    end else if(T685) begin
      buffer_10 <= io_dmem_resp_data;
    end
    if(reset) begin
      buffer_11 <= T703;
    end else if(T735) begin
      buffer_11 <= io_dmem_resp_data;
    end else if(T734) begin
      buffer_11 <= 64'h1;
    end else if(T733) begin
      buffer_11 <= T907;
    end else if(T732) begin
      buffer_11 <= T1157;
    end else if(T731) begin
      buffer_11 <= T1156;
    end else if(T730) begin
      buffer_11 <= T1155;
    end else if(T729) begin
      buffer_11 <= T1154;
    end else if(T728) begin
      buffer_11 <= T1153;
    end else if(T727) begin
      buffer_11 <= T1152;
    end else if(T726) begin
      buffer_11 <= T886;
    end else if(T725) begin
      buffer_11 <= 64'h8000000000000000;
    end else if(T724) begin
      buffer_11 <= T313;
    end else if(T723) begin
      buffer_11 <= 64'h0;
    end else if(T721) begin
      buffer_11 <= 64'h1;
    end else if(T719) begin
      buffer_11 <= io_dmem_resp_data;
    end
    if(reset) begin
      buffer_12 <= T741;
    end else if(T773) begin
      buffer_12 <= io_dmem_resp_data;
    end else if(T772) begin
      buffer_12 <= 64'h1;
    end else if(T771) begin
      buffer_12 <= T907;
    end else if(T770) begin
      buffer_12 <= T1164;
    end else if(T769) begin
      buffer_12 <= T1163;
    end else if(T768) begin
      buffer_12 <= T1162;
    end else if(T767) begin
      buffer_12 <= T1161;
    end else if(T766) begin
      buffer_12 <= T1160;
    end else if(T765) begin
      buffer_12 <= T1159;
    end else if(T764) begin
      buffer_12 <= T886;
    end else if(T763) begin
      buffer_12 <= 64'h8000000000000000;
    end else if(T762) begin
      buffer_12 <= T313;
    end else if(T761) begin
      buffer_12 <= 64'h0;
    end else if(T759) begin
      buffer_12 <= 64'h1;
    end else if(T757) begin
      buffer_12 <= io_dmem_resp_data;
    end
    if(reset) begin
      buffer_13 <= T775;
    end else if(T807) begin
      buffer_13 <= io_dmem_resp_data;
    end else if(T806) begin
      buffer_13 <= 64'h1;
    end else if(T805) begin
      buffer_13 <= T907;
    end else if(T804) begin
      buffer_13 <= T1171;
    end else if(T803) begin
      buffer_13 <= T1170;
    end else if(T802) begin
      buffer_13 <= T1169;
    end else if(T801) begin
      buffer_13 <= T1168;
    end else if(T800) begin
      buffer_13 <= T1167;
    end else if(T799) begin
      buffer_13 <= T1166;
    end else if(T798) begin
      buffer_13 <= T886;
    end else if(T797) begin
      buffer_13 <= 64'h8000000000000000;
    end else if(T796) begin
      buffer_13 <= T313;
    end else if(T795) begin
      buffer_13 <= 64'h0;
    end else if(T793) begin
      buffer_13 <= 64'h1;
    end else if(T791) begin
      buffer_13 <= io_dmem_resp_data;
    end
    if(reset) begin
      buffer_14 <= T811;
    end else if(T843) begin
      buffer_14 <= io_dmem_resp_data;
    end else if(T842) begin
      buffer_14 <= 64'h1;
    end else if(T841) begin
      buffer_14 <= T907;
    end else if(T840) begin
      buffer_14 <= T1178;
    end else if(T839) begin
      buffer_14 <= T1177;
    end else if(T838) begin
      buffer_14 <= T1176;
    end else if(T837) begin
      buffer_14 <= T1175;
    end else if(T836) begin
      buffer_14 <= T1174;
    end else if(T835) begin
      buffer_14 <= T1173;
    end else if(T834) begin
      buffer_14 <= T886;
    end else if(T833) begin
      buffer_14 <= 64'h8000000000000000;
    end else if(T832) begin
      buffer_14 <= T313;
    end else if(T831) begin
      buffer_14 <= 64'h0;
    end else if(T829) begin
      buffer_14 <= 64'h1;
    end else if(T827) begin
      buffer_14 <= io_dmem_resp_data;
    end
    if(reset) begin
      buffer_15 <= T845;
    end else if(T877) begin
      buffer_15 <= io_dmem_resp_data;
    end else if(T876) begin
      buffer_15 <= 64'h1;
    end else if(T875) begin
      buffer_15 <= T907;
    end else if(T874) begin
      buffer_15 <= T1185;
    end else if(T873) begin
      buffer_15 <= T1184;
    end else if(T872) begin
      buffer_15 <= T1183;
    end else if(T871) begin
      buffer_15 <= T1182;
    end else if(T870) begin
      buffer_15 <= T1181;
    end else if(T869) begin
      buffer_15 <= T1180;
    end else if(T868) begin
      buffer_15 <= T886;
    end else if(T867) begin
      buffer_15 <= 64'h8000000000000000;
    end else if(T866) begin
      buffer_15 <= T313;
    end else if(T865) begin
      buffer_15 <= 64'h0;
    end else if(T863) begin
      buffer_15 <= 64'h1;
    end else if(T861) begin
      buffer_15 <= io_dmem_resp_data;
    end
    if(reset) begin
      buffer_1 <= T913;
    end else if(T945) begin
      buffer_1 <= io_dmem_resp_data;
    end else if(T944) begin
      buffer_1 <= 64'h1;
    end else if(T943) begin
      buffer_1 <= T907;
    end else if(T942) begin
      buffer_1 <= T1198;
    end else if(T941) begin
      buffer_1 <= T1197;
    end else if(T940) begin
      buffer_1 <= T1196;
    end else if(T939) begin
      buffer_1 <= T1195;
    end else if(T938) begin
      buffer_1 <= T1194;
    end else if(T937) begin
      buffer_1 <= T1193;
    end else if(T936) begin
      buffer_1 <= T886;
    end else if(T935) begin
      buffer_1 <= 64'h8000000000000000;
    end else if(T934) begin
      buffer_1 <= T313;
    end else if(T933) begin
      buffer_1 <= 64'h0;
    end else if(T931) begin
      buffer_1 <= 64'h1;
    end else if(T929) begin
      buffer_1 <= io_dmem_resp_data;
    end
    if(reset) begin
      buffer_16 <= T974;
    end else if(T1006) begin
      buffer_16 <= io_dmem_resp_data;
    end else if(T1005) begin
      buffer_16 <= 64'h1;
    end else if(T1004) begin
      buffer_16 <= T907;
    end else if(T1003) begin
      buffer_16 <= T1205;
    end else if(T1002) begin
      buffer_16 <= T1204;
    end else if(T1001) begin
      buffer_16 <= T1203;
    end else if(T1000) begin
      buffer_16 <= T1202;
    end else if(T999) begin
      buffer_16 <= T1201;
    end else if(T998) begin
      buffer_16 <= T1200;
    end else if(T997) begin
      buffer_16 <= T886;
    end else if(T996) begin
      buffer_16 <= 64'h8000000000000000;
    end else if(T995) begin
      buffer_16 <= T313;
    end else if(T994) begin
      buffer_16 <= 64'h0;
    end else if(T992) begin
      buffer_16 <= 64'h1;
    end else if(T990) begin
      buffer_16 <= io_dmem_resp_data;
    end
    if(reset) begin
      windex <= 3'h0;
    end else if(T261) begin
      windex <= 3'h4;
    end else if(T1013) begin
      windex <= T1012;
    end else if(T54) begin
      windex <= 3'h0;
    end
    R1019 <= aindex;
    if(reset) begin
      msg_addr <= 64'h0;
    end else if(T261) begin
      msg_addr <= 64'h0;
    end else if(T246) begin
      msg_addr <= T1034;
    end else if(T229) begin
      msg_addr <= T1033;
    end else if(T1032) begin
      msg_addr <= io_rocc_rs1;
    end
    if(reset) begin
      hash_addr <= 64'h0;
    end else if(T261) begin
      hash_addr <= 64'h0;
    end else if(T1032) begin
      hash_addr <= io_rocc_rs2;
    end
  end
endmodule

module ThetaModule(
    input [63:0] io_state_i_24,
    input [63:0] io_state_i_23,
    input [63:0] io_state_i_22,
    input [63:0] io_state_i_21,
    input [63:0] io_state_i_20,
    input [63:0] io_state_i_19,
    input [63:0] io_state_i_18,
    input [63:0] io_state_i_17,
    input [63:0] io_state_i_16,
    input [63:0] io_state_i_15,
    input [63:0] io_state_i_14,
    input [63:0] io_state_i_13,
    input [63:0] io_state_i_12,
    input [63:0] io_state_i_11,
    input [63:0] io_state_i_10,
    input [63:0] io_state_i_9,
    input [63:0] io_state_i_8,
    input [63:0] io_state_i_7,
    input [63:0] io_state_i_6,
    input [63:0] io_state_i_5,
    input [63:0] io_state_i_4,
    input [63:0] io_state_i_3,
    input [63:0] io_state_i_2,
    input [63:0] io_state_i_1,
    input [63:0] io_state_i_0,
    output[63:0] io_state_o_24,
    output[63:0] io_state_o_23,
    output[63:0] io_state_o_22,
    output[63:0] io_state_o_21,
    output[63:0] io_state_o_20,
    output[63:0] io_state_o_19,
    output[63:0] io_state_o_18,
    output[63:0] io_state_o_17,
    output[63:0] io_state_o_16,
    output[63:0] io_state_o_15,
    output[63:0] io_state_o_14,
    output[63:0] io_state_o_13,
    output[63:0] io_state_o_12,
    output[63:0] io_state_o_11,
    output[63:0] io_state_o_10,
    output[63:0] io_state_o_9,
    output[63:0] io_state_o_8,
    output[63:0] io_state_o_7,
    output[63:0] io_state_o_6,
    output[63:0] io_state_o_5,
    output[63:0] io_state_o_4,
    output[63:0] io_state_o_3,
    output[63:0] io_state_o_2,
    output[63:0] io_state_o_1,
    output[63:0] io_state_o_0
);

  wire[63:0] T0;
  wire[63:0] T1;
  wire[63:0] T70;
  wire[64:0] T2;
  wire[64:0] T3;
  wire[64:0] T71;
  wire T4;
  wire[63:0] bc_1;
  wire[63:0] T5;
  wire[63:0] T6;
  wire[63:0] T7;
  wire[63:0] T8;
  wire[64:0] T9;
  wire[64:0] T72;
  wire[63:0] bc_4;
  wire[63:0] T10;
  wire[63:0] T11;
  wire[63:0] T12;
  wire[63:0] T13;
  wire[63:0] T14;
  wire[63:0] T15;
  wire[63:0] T16;
  wire[63:0] T17;
  wire[63:0] T18;
  wire[63:0] T19;
  wire[63:0] T73;
  wire[64:0] T20;
  wire[64:0] T21;
  wire[64:0] T74;
  wire T22;
  wire[63:0] bc_2;
  wire[63:0] T23;
  wire[63:0] T24;
  wire[63:0] T25;
  wire[63:0] T26;
  wire[64:0] T27;
  wire[64:0] T75;
  wire[63:0] bc_0;
  wire[63:0] T28;
  wire[63:0] T29;
  wire[63:0] T30;
  wire[63:0] T31;
  wire[63:0] T32;
  wire[63:0] T33;
  wire[63:0] T34;
  wire[63:0] T35;
  wire[63:0] T36;
  wire[63:0] T37;
  wire[63:0] T76;
  wire[64:0] T38;
  wire[64:0] T39;
  wire[64:0] T77;
  wire T40;
  wire[63:0] bc_3;
  wire[63:0] T41;
  wire[63:0] T42;
  wire[63:0] T43;
  wire[63:0] T44;
  wire[64:0] T45;
  wire[64:0] T78;
  wire[63:0] T46;
  wire[63:0] T47;
  wire[63:0] T48;
  wire[63:0] T49;
  wire[63:0] T50;
  wire[63:0] T51;
  wire[63:0] T79;
  wire[64:0] T52;
  wire[64:0] T53;
  wire[64:0] T80;
  wire T54;
  wire[64:0] T55;
  wire[64:0] T81;
  wire[63:0] T56;
  wire[63:0] T57;
  wire[63:0] T58;
  wire[63:0] T59;
  wire[63:0] T60;
  wire[63:0] T61;
  wire[63:0] T82;
  wire[64:0] T62;
  wire[64:0] T63;
  wire[64:0] T83;
  wire T64;
  wire[64:0] T65;
  wire[64:0] T84;
  wire[63:0] T66;
  wire[63:0] T67;
  wire[63:0] T68;
  wire[63:0] T69;


  assign io_state_o_0 = T0;
  assign T0 = io_state_i_0 ^ T1;
  assign T1 = T70;
  assign T70 = T2[6'h3f:1'h0];
  assign T2 = T72 ^ T3;
  assign T3 = T9 | T71;
  assign T71 = {64'h0, T4};
  assign T4 = bc_1 >> 7'h3f;
  assign bc_1 = T5;
  assign T5 = T6 ^ io_state_i_9;
  assign T6 = T7 ^ io_state_i_8;
  assign T7 = T8 ^ io_state_i_7;
  assign T8 = io_state_i_5 ^ io_state_i_6;
  assign T9 = bc_1 << 1'h1;
  assign T72 = {1'h0, bc_4};
  assign bc_4 = T10;
  assign T10 = T11 ^ io_state_i_24;
  assign T11 = T12 ^ io_state_i_23;
  assign T12 = T13 ^ io_state_i_22;
  assign T13 = io_state_i_20 ^ io_state_i_21;
  assign io_state_o_1 = T14;
  assign T14 = io_state_i_1 ^ T1;
  assign io_state_o_2 = T15;
  assign T15 = io_state_i_2 ^ T1;
  assign io_state_o_3 = T16;
  assign T16 = io_state_i_3 ^ T1;
  assign io_state_o_4 = T17;
  assign T17 = io_state_i_4 ^ T1;
  assign io_state_o_5 = T18;
  assign T18 = io_state_i_5 ^ T19;
  assign T19 = T73;
  assign T73 = T20[6'h3f:1'h0];
  assign T20 = T75 ^ T21;
  assign T21 = T27 | T74;
  assign T74 = {64'h0, T22};
  assign T22 = bc_2 >> 7'h3f;
  assign bc_2 = T23;
  assign T23 = T24 ^ io_state_i_14;
  assign T24 = T25 ^ io_state_i_13;
  assign T25 = T26 ^ io_state_i_12;
  assign T26 = io_state_i_10 ^ io_state_i_11;
  assign T27 = bc_2 << 1'h1;
  assign T75 = {1'h0, bc_0};
  assign bc_0 = T28;
  assign T28 = T29 ^ io_state_i_4;
  assign T29 = T30 ^ io_state_i_3;
  assign T30 = T31 ^ io_state_i_2;
  assign T31 = io_state_i_0 ^ io_state_i_1;
  assign io_state_o_6 = T32;
  assign T32 = io_state_i_6 ^ T19;
  assign io_state_o_7 = T33;
  assign T33 = io_state_i_7 ^ T19;
  assign io_state_o_8 = T34;
  assign T34 = io_state_i_8 ^ T19;
  assign io_state_o_9 = T35;
  assign T35 = io_state_i_9 ^ T19;
  assign io_state_o_10 = T36;
  assign T36 = io_state_i_10 ^ T37;
  assign T37 = T76;
  assign T76 = T38[6'h3f:1'h0];
  assign T38 = T78 ^ T39;
  assign T39 = T45 | T77;
  assign T77 = {64'h0, T40};
  assign T40 = bc_3 >> 7'h3f;
  assign bc_3 = T41;
  assign T41 = T42 ^ io_state_i_19;
  assign T42 = T43 ^ io_state_i_18;
  assign T43 = T44 ^ io_state_i_17;
  assign T44 = io_state_i_15 ^ io_state_i_16;
  assign T45 = bc_3 << 1'h1;
  assign T78 = {1'h0, bc_1};
  assign io_state_o_11 = T46;
  assign T46 = io_state_i_11 ^ T37;
  assign io_state_o_12 = T47;
  assign T47 = io_state_i_12 ^ T37;
  assign io_state_o_13 = T48;
  assign T48 = io_state_i_13 ^ T37;
  assign io_state_o_14 = T49;
  assign T49 = io_state_i_14 ^ T37;
  assign io_state_o_15 = T50;
  assign T50 = io_state_i_15 ^ T51;
  assign T51 = T79;
  assign T79 = T52[6'h3f:1'h0];
  assign T52 = T81 ^ T53;
  assign T53 = T55 | T80;
  assign T80 = {64'h0, T54};
  assign T54 = bc_4 >> 7'h3f;
  assign T55 = bc_4 << 1'h1;
  assign T81 = {1'h0, bc_2};
  assign io_state_o_16 = T56;
  assign T56 = io_state_i_16 ^ T51;
  assign io_state_o_17 = T57;
  assign T57 = io_state_i_17 ^ T51;
  assign io_state_o_18 = T58;
  assign T58 = io_state_i_18 ^ T51;
  assign io_state_o_19 = T59;
  assign T59 = io_state_i_19 ^ T51;
  assign io_state_o_20 = T60;
  assign T60 = io_state_i_20 ^ T61;
  assign T61 = T82;
  assign T82 = T62[6'h3f:1'h0];
  assign T62 = T84 ^ T63;
  assign T63 = T65 | T83;
  assign T83 = {64'h0, T64};
  assign T64 = bc_0 >> 7'h3f;
  assign T65 = bc_0 << 1'h1;
  assign T84 = {1'h0, bc_3};
  assign io_state_o_21 = T66;
  assign T66 = io_state_i_21 ^ T61;
  assign io_state_o_22 = T67;
  assign T67 = io_state_i_22 ^ T61;
  assign io_state_o_23 = T68;
  assign T68 = io_state_i_23 ^ T61;
  assign io_state_o_24 = T69;
  assign T69 = io_state_i_24 ^ T61;
endmodule

module RhoPiModule(
    input [63:0] io_state_i_24,
    input [63:0] io_state_i_23,
    input [63:0] io_state_i_22,
    input [63:0] io_state_i_21,
    input [63:0] io_state_i_20,
    input [63:0] io_state_i_19,
    input [63:0] io_state_i_18,
    input [63:0] io_state_i_17,
    input [63:0] io_state_i_16,
    input [63:0] io_state_i_15,
    input [63:0] io_state_i_14,
    input [63:0] io_state_i_13,
    input [63:0] io_state_i_12,
    input [63:0] io_state_i_11,
    input [63:0] io_state_i_10,
    input [63:0] io_state_i_9,
    input [63:0] io_state_i_8,
    input [63:0] io_state_i_7,
    input [63:0] io_state_i_6,
    input [63:0] io_state_i_5,
    input [63:0] io_state_i_4,
    input [63:0] io_state_i_3,
    input [63:0] io_state_i_2,
    input [63:0] io_state_i_1,
    input [63:0] io_state_i_0,
    output[63:0] io_state_o_24,
    output[63:0] io_state_o_23,
    output[63:0] io_state_o_22,
    output[63:0] io_state_o_21,
    output[63:0] io_state_o_20,
    output[63:0] io_state_o_19,
    output[63:0] io_state_o_18,
    output[63:0] io_state_o_17,
    output[63:0] io_state_o_16,
    output[63:0] io_state_o_15,
    output[63:0] io_state_o_14,
    output[63:0] io_state_o_13,
    output[63:0] io_state_o_12,
    output[63:0] io_state_o_11,
    output[63:0] io_state_o_10,
    output[63:0] io_state_o_9,
    output[63:0] io_state_o_8,
    output[63:0] io_state_o_7,
    output[63:0] io_state_o_6,
    output[63:0] io_state_o_5,
    output[63:0] io_state_o_4,
    output[63:0] io_state_o_3,
    output[63:0] io_state_o_2,
    output[63:0] io_state_o_1,
    output[63:0] io_state_o_0
);

  wire[63:0] T0;
  wire[63:0] T96;
  wire[64:0] T1;
  wire[64:0] T2;
  wire[27:0] T3;
  wire[36:0] T4;
  wire[63:0] T97;
  wire[64:0] T5;
  wire[64:0] T6;
  wire T7;
  wire[63:0] T98;
  wire[64:0] T8;
  wire[64:0] T9;
  wire[26:0] T10;
  wire[37:0] T11;
  wire[63:0] T99;
  wire[64:0] T12;
  wire[64:0] T13;
  wire[61:0] T14;
  wire[2:0] T15;
  wire[63:0] T100;
  wire[64:0] T16;
  wire[64:0] T17;
  wire[43:0] T18;
  wire[20:0] T19;
  wire[63:0] T101;
  wire[64:0] T20;
  wire[64:0] T21;
  wire[19:0] T22;
  wire[44:0] T23;
  wire[63:0] T102;
  wire[64:0] T24;
  wire[64:0] T25;
  wire[5:0] T26;
  wire[58:0] T27;
  wire[63:0] T103;
  wire[64:0] T28;
  wire[64:0] T29;
  wire[35:0] T30;
  wire[28:0] T31;
  wire[63:0] T104;
  wire[64:0] T32;
  wire[64:0] T33;
  wire[54:0] T34;
  wire[9:0] T35;
  wire[63:0] T105;
  wire[64:0] T36;
  wire[64:0] T37;
  wire[42:0] T38;
  wire[21:0] T39;
  wire[63:0] T106;
  wire[64:0] T40;
  wire[64:0] T41;
  wire[2:0] T42;
  wire[61:0] T43;
  wire[63:0] T107;
  wire[64:0] T44;
  wire[64:0] T45;
  wire[24:0] T46;
  wire[39:0] T47;
  wire[63:0] T108;
  wire[64:0] T48;
  wire[64:0] T49;
  wire[9:0] T50;
  wire[54:0] T51;
  wire[63:0] T109;
  wire[64:0] T52;
  wire[64:0] T53;
  wire[38:0] T54;
  wire[25:0] T55;
  wire[63:0] T110;
  wire[64:0] T56;
  wire[64:0] T57;
  wire[20:0] T58;
  wire[43:0] T59;
  wire[63:0] T111;
  wire[64:0] T60;
  wire[64:0] T61;
  wire[44:0] T62;
  wire[19:0] T63;
  wire[63:0] T112;
  wire[64:0] T64;
  wire[64:0] T65;
  wire[7:0] T66;
  wire[56:0] T67;
  wire[63:0] T113;
  wire[64:0] T68;
  wire[64:0] T69;
  wire[14:0] T70;
  wire[49:0] T71;
  wire[63:0] T114;
  wire[64:0] T72;
  wire[64:0] T73;
  wire[40:0] T74;
  wire[23:0] T75;
  wire[63:0] T115;
  wire[64:0] T76;
  wire[64:0] T77;
  wire[13:0] T78;
  wire[50:0] T79;
  wire[63:0] T116;
  wire[64:0] T80;
  wire[64:0] T81;
  wire[60:0] T82;
  wire[3:0] T83;
  wire[63:0] T117;
  wire[64:0] T84;
  wire[64:0] T85;
  wire[17:0] T86;
  wire[46:0] T87;
  wire[63:0] T118;
  wire[64:0] T88;
  wire[64:0] T89;
  wire[55:0] T90;
  wire[8:0] T91;
  wire[63:0] T119;
  wire[64:0] T92;
  wire[64:0] T93;
  wire[1:0] T94;
  wire[62:0] T95;


  assign io_state_o_0 = T0;
  assign T0 = io_state_i_0;
  assign io_state_o_1 = T96;
  assign T96 = T1[6'h3f:1'h0];
  assign T1 = T2;
  assign T2 = {T4, T3};
  assign T3 = io_state_i_15[6'h3f:6'h24];
  assign T4 = io_state_i_15[6'h24:1'h0];
  assign io_state_o_2 = T97;
  assign T97 = T5[6'h3f:1'h0];
  assign T5 = T6;
  assign T6 = {io_state_i_5, T7};
  assign T7 = io_state_i_5[6'h3f:6'h3f];
  assign io_state_o_3 = T98;
  assign T98 = T8[6'h3f:1'h0];
  assign T8 = T9;
  assign T9 = {T11, T10};
  assign T10 = io_state_i_20[6'h3f:6'h25];
  assign T11 = io_state_i_20[6'h25:1'h0];
  assign io_state_o_4 = T99;
  assign T99 = T12[6'h3f:1'h0];
  assign T12 = T13;
  assign T13 = {T15, T14};
  assign T14 = io_state_i_10[6'h3f:2'h2];
  assign T15 = io_state_i_10[2'h2:1'h0];
  assign io_state_o_5 = T100;
  assign T100 = T16[6'h3f:1'h0];
  assign T16 = T17;
  assign T17 = {T19, T18};
  assign T18 = io_state_i_6[6'h3f:5'h14];
  assign T19 = io_state_i_6[5'h14:1'h0];
  assign io_state_o_6 = T101;
  assign T101 = T20[6'h3f:1'h0];
  assign T20 = T21;
  assign T21 = {T23, T22};
  assign T22 = io_state_i_21[6'h3f:6'h2c];
  assign T23 = io_state_i_21[6'h2c:1'h0];
  assign io_state_o_7 = T102;
  assign T102 = T24[6'h3f:1'h0];
  assign T24 = T25;
  assign T25 = {T27, T26};
  assign T26 = io_state_i_11[6'h3f:6'h3a];
  assign T27 = io_state_i_11[6'h3a:1'h0];
  assign io_state_o_8 = T103;
  assign T103 = T28[6'h3f:1'h0];
  assign T28 = T29;
  assign T29 = {T31, T30};
  assign T30 = io_state_i_1[6'h3f:5'h1c];
  assign T31 = io_state_i_1[5'h1c:1'h0];
  assign io_state_o_9 = T104;
  assign T104 = T32[6'h3f:1'h0];
  assign T32 = T33;
  assign T33 = {T35, T34};
  assign T34 = io_state_i_16[6'h3f:4'h9];
  assign T35 = io_state_i_16[4'h9:1'h0];
  assign io_state_o_10 = T105;
  assign T105 = T36[6'h3f:1'h0];
  assign T36 = T37;
  assign T37 = {T39, T38};
  assign T38 = io_state_i_12[6'h3f:5'h15];
  assign T39 = io_state_i_12[5'h15:1'h0];
  assign io_state_o_11 = T106;
  assign T106 = T40[6'h3f:1'h0];
  assign T40 = T41;
  assign T41 = {T43, T42};
  assign T42 = io_state_i_2[6'h3f:6'h3d];
  assign T43 = io_state_i_2[6'h3d:1'h0];
  assign io_state_o_12 = T107;
  assign T107 = T44[6'h3f:1'h0];
  assign T44 = T45;
  assign T45 = {T47, T46};
  assign T46 = io_state_i_17[6'h3f:6'h27];
  assign T47 = io_state_i_17[6'h27:1'h0];
  assign io_state_o_13 = T108;
  assign T108 = T48[6'h3f:1'h0];
  assign T48 = T49;
  assign T49 = {T51, T50};
  assign T50 = io_state_i_7[6'h3f:6'h36];
  assign T51 = io_state_i_7[6'h36:1'h0];
  assign io_state_o_14 = T109;
  assign T109 = T52[6'h3f:1'h0];
  assign T52 = T53;
  assign T53 = {T55, T54};
  assign T54 = io_state_i_22[6'h3f:5'h19];
  assign T55 = io_state_i_22[5'h19:1'h0];
  assign io_state_o_15 = T110;
  assign T110 = T56[6'h3f:1'h0];
  assign T56 = T57;
  assign T57 = {T59, T58};
  assign T58 = io_state_i_18[6'h3f:6'h2b];
  assign T59 = io_state_i_18[6'h2b:1'h0];
  assign io_state_o_16 = T111;
  assign T111 = T60[6'h3f:1'h0];
  assign T60 = T61;
  assign T61 = {T63, T62};
  assign T62 = io_state_i_8[6'h3f:5'h13];
  assign T63 = io_state_i_8[5'h13:1'h0];
  assign io_state_o_17 = T112;
  assign T112 = T64[6'h3f:1'h0];
  assign T64 = T65;
  assign T65 = {T67, T66};
  assign T66 = io_state_i_23[6'h3f:6'h38];
  assign T67 = io_state_i_23[6'h38:1'h0];
  assign io_state_o_18 = T113;
  assign T113 = T68[6'h3f:1'h0];
  assign T68 = T69;
  assign T69 = {T71, T70};
  assign T70 = io_state_i_13[6'h3f:6'h31];
  assign T71 = io_state_i_13[6'h31:1'h0];
  assign io_state_o_19 = T114;
  assign T114 = T72[6'h3f:1'h0];
  assign T72 = T73;
  assign T73 = {T75, T74};
  assign T74 = io_state_i_3[6'h3f:5'h17];
  assign T75 = io_state_i_3[5'h17:1'h0];
  assign io_state_o_20 = T115;
  assign T115 = T76[6'h3f:1'h0];
  assign T76 = T77;
  assign T77 = {T79, T78};
  assign T78 = io_state_i_24[6'h3f:6'h32];
  assign T79 = io_state_i_24[6'h32:1'h0];
  assign io_state_o_21 = T116;
  assign T116 = T80[6'h3f:1'h0];
  assign T80 = T81;
  assign T81 = {T83, T82};
  assign T82 = io_state_i_14[6'h3f:2'h3];
  assign T83 = io_state_i_14[2'h3:1'h0];
  assign io_state_o_22 = T117;
  assign T117 = T84[6'h3f:1'h0];
  assign T84 = T85;
  assign T85 = {T87, T86};
  assign T86 = io_state_i_4[6'h3f:6'h2e];
  assign T87 = io_state_i_4[6'h2e:1'h0];
  assign io_state_o_23 = T118;
  assign T118 = T88[6'h3f:1'h0];
  assign T88 = T89;
  assign T89 = {T91, T90};
  assign T90 = io_state_i_19[6'h3f:4'h8];
  assign T91 = io_state_i_19[4'h8:1'h0];
  assign io_state_o_24 = T119;
  assign T119 = T92[6'h3f:1'h0];
  assign T92 = T93;
  assign T93 = {T95, T94};
  assign T94 = io_state_i_9[6'h3f:6'h3e];
  assign T95 = io_state_i_9[6'h3e:1'h0];
endmodule

module ChiModule(
    input [63:0] io_state_i_24,
    input [63:0] io_state_i_23,
    input [63:0] io_state_i_22,
    input [63:0] io_state_i_21,
    input [63:0] io_state_i_20,
    input [63:0] io_state_i_19,
    input [63:0] io_state_i_18,
    input [63:0] io_state_i_17,
    input [63:0] io_state_i_16,
    input [63:0] io_state_i_15,
    input [63:0] io_state_i_14,
    input [63:0] io_state_i_13,
    input [63:0] io_state_i_12,
    input [63:0] io_state_i_11,
    input [63:0] io_state_i_10,
    input [63:0] io_state_i_9,
    input [63:0] io_state_i_8,
    input [63:0] io_state_i_7,
    input [63:0] io_state_i_6,
    input [63:0] io_state_i_5,
    input [63:0] io_state_i_4,
    input [63:0] io_state_i_3,
    input [63:0] io_state_i_2,
    input [63:0] io_state_i_1,
    input [63:0] io_state_i_0,
    output[63:0] io_state_o_24,
    output[63:0] io_state_o_23,
    output[63:0] io_state_o_22,
    output[63:0] io_state_o_21,
    output[63:0] io_state_o_20,
    output[63:0] io_state_o_19,
    output[63:0] io_state_o_18,
    output[63:0] io_state_o_17,
    output[63:0] io_state_o_16,
    output[63:0] io_state_o_15,
    output[63:0] io_state_o_14,
    output[63:0] io_state_o_13,
    output[63:0] io_state_o_12,
    output[63:0] io_state_o_11,
    output[63:0] io_state_o_10,
    output[63:0] io_state_o_9,
    output[63:0] io_state_o_8,
    output[63:0] io_state_o_7,
    output[63:0] io_state_o_6,
    output[63:0] io_state_o_5,
    output[63:0] io_state_o_4,
    output[63:0] io_state_o_3,
    output[63:0] io_state_o_2,
    output[63:0] io_state_o_1,
    output[63:0] io_state_o_0
);

  wire[63:0] T0;
  wire[63:0] T1;
  wire[63:0] T2;
  wire[63:0] T3;
  wire[63:0] T4;
  wire[63:0] T5;
  wire[63:0] T6;
  wire[63:0] T7;
  wire[63:0] T8;
  wire[63:0] T9;
  wire[63:0] T10;
  wire[63:0] T11;
  wire[63:0] T12;
  wire[63:0] T13;
  wire[63:0] T14;
  wire[63:0] T15;
  wire[63:0] T16;
  wire[63:0] T17;
  wire[63:0] T18;
  wire[63:0] T19;
  wire[63:0] T20;
  wire[63:0] T21;
  wire[63:0] T22;
  wire[63:0] T23;
  wire[63:0] T24;
  wire[63:0] T25;
  wire[63:0] T26;
  wire[63:0] T27;
  wire[63:0] T28;
  wire[63:0] T29;
  wire[63:0] T30;
  wire[63:0] T31;
  wire[63:0] T32;
  wire[63:0] T33;
  wire[63:0] T34;
  wire[63:0] T35;
  wire[63:0] T36;
  wire[63:0] T37;
  wire[63:0] T38;
  wire[63:0] T39;
  wire[63:0] T40;
  wire[63:0] T41;
  wire[63:0] T42;
  wire[63:0] T43;
  wire[63:0] T44;
  wire[63:0] T45;
  wire[63:0] T46;
  wire[63:0] T47;
  wire[63:0] T48;
  wire[63:0] T49;
  wire[63:0] T50;
  wire[63:0] T51;
  wire[63:0] T52;
  wire[63:0] T53;
  wire[63:0] T54;
  wire[63:0] T55;
  wire[63:0] T56;
  wire[63:0] T57;
  wire[63:0] T58;
  wire[63:0] T59;
  wire[63:0] T60;
  wire[63:0] T61;
  wire[63:0] T62;
  wire[63:0] T63;
  wire[63:0] T64;
  wire[63:0] T65;
  wire[63:0] T66;
  wire[63:0] T67;
  wire[63:0] T68;
  wire[63:0] T69;
  wire[63:0] T70;
  wire[63:0] T71;
  wire[63:0] T72;
  wire[63:0] T73;
  wire[63:0] T74;


  assign io_state_o_0 = T0;
  assign T0 = io_state_i_0 ^ T1;
  assign T1 = T2 & io_state_i_10;
  assign T2 = ~ io_state_i_5;
  assign io_state_o_1 = T3;
  assign T3 = io_state_i_1 ^ T4;
  assign T4 = T5 & io_state_i_11;
  assign T5 = ~ io_state_i_6;
  assign io_state_o_2 = T6;
  assign T6 = io_state_i_2 ^ T7;
  assign T7 = T8 & io_state_i_12;
  assign T8 = ~ io_state_i_7;
  assign io_state_o_3 = T9;
  assign T9 = io_state_i_3 ^ T10;
  assign T10 = T11 & io_state_i_13;
  assign T11 = ~ io_state_i_8;
  assign io_state_o_4 = T12;
  assign T12 = io_state_i_4 ^ T13;
  assign T13 = T14 & io_state_i_14;
  assign T14 = ~ io_state_i_9;
  assign io_state_o_5 = T15;
  assign T15 = io_state_i_5 ^ T16;
  assign T16 = T17 & io_state_i_15;
  assign T17 = ~ io_state_i_10;
  assign io_state_o_6 = T18;
  assign T18 = io_state_i_6 ^ T19;
  assign T19 = T20 & io_state_i_16;
  assign T20 = ~ io_state_i_11;
  assign io_state_o_7 = T21;
  assign T21 = io_state_i_7 ^ T22;
  assign T22 = T23 & io_state_i_17;
  assign T23 = ~ io_state_i_12;
  assign io_state_o_8 = T24;
  assign T24 = io_state_i_8 ^ T25;
  assign T25 = T26 & io_state_i_18;
  assign T26 = ~ io_state_i_13;
  assign io_state_o_9 = T27;
  assign T27 = io_state_i_9 ^ T28;
  assign T28 = T29 & io_state_i_19;
  assign T29 = ~ io_state_i_14;
  assign io_state_o_10 = T30;
  assign T30 = io_state_i_10 ^ T31;
  assign T31 = T32 & io_state_i_20;
  assign T32 = ~ io_state_i_15;
  assign io_state_o_11 = T33;
  assign T33 = io_state_i_11 ^ T34;
  assign T34 = T35 & io_state_i_21;
  assign T35 = ~ io_state_i_16;
  assign io_state_o_12 = T36;
  assign T36 = io_state_i_12 ^ T37;
  assign T37 = T38 & io_state_i_22;
  assign T38 = ~ io_state_i_17;
  assign io_state_o_13 = T39;
  assign T39 = io_state_i_13 ^ T40;
  assign T40 = T41 & io_state_i_23;
  assign T41 = ~ io_state_i_18;
  assign io_state_o_14 = T42;
  assign T42 = io_state_i_14 ^ T43;
  assign T43 = T44 & io_state_i_24;
  assign T44 = ~ io_state_i_19;
  assign io_state_o_15 = T45;
  assign T45 = io_state_i_15 ^ T46;
  assign T46 = T47 & io_state_i_0;
  assign T47 = ~ io_state_i_20;
  assign io_state_o_16 = T48;
  assign T48 = io_state_i_16 ^ T49;
  assign T49 = T50 & io_state_i_1;
  assign T50 = ~ io_state_i_21;
  assign io_state_o_17 = T51;
  assign T51 = io_state_i_17 ^ T52;
  assign T52 = T53 & io_state_i_2;
  assign T53 = ~ io_state_i_22;
  assign io_state_o_18 = T54;
  assign T54 = io_state_i_18 ^ T55;
  assign T55 = T56 & io_state_i_3;
  assign T56 = ~ io_state_i_23;
  assign io_state_o_19 = T57;
  assign T57 = io_state_i_19 ^ T58;
  assign T58 = T59 & io_state_i_4;
  assign T59 = ~ io_state_i_24;
  assign io_state_o_20 = T60;
  assign T60 = io_state_i_20 ^ T61;
  assign T61 = T62 & io_state_i_5;
  assign T62 = ~ io_state_i_0;
  assign io_state_o_21 = T63;
  assign T63 = io_state_i_21 ^ T64;
  assign T64 = T65 & io_state_i_6;
  assign T65 = ~ io_state_i_1;
  assign io_state_o_22 = T66;
  assign T66 = io_state_i_22 ^ T67;
  assign T67 = T68 & io_state_i_7;
  assign T68 = ~ io_state_i_2;
  assign io_state_o_23 = T69;
  assign T69 = io_state_i_23 ^ T70;
  assign T70 = T71 & io_state_i_8;
  assign T71 = ~ io_state_i_3;
  assign io_state_o_24 = T72;
  assign T72 = io_state_i_24 ^ T73;
  assign T73 = T74 & io_state_i_9;
  assign T74 = ~ io_state_i_4;
endmodule

module IotaModule(
    input [63:0] io_state_i_24,
    input [63:0] io_state_i_23,
    input [63:0] io_state_i_22,
    input [63:0] io_state_i_21,
    input [63:0] io_state_i_20,
    input [63:0] io_state_i_19,
    input [63:0] io_state_i_18,
    input [63:0] io_state_i_17,
    input [63:0] io_state_i_16,
    input [63:0] io_state_i_15,
    input [63:0] io_state_i_14,
    input [63:0] io_state_i_13,
    input [63:0] io_state_i_12,
    input [63:0] io_state_i_11,
    input [63:0] io_state_i_10,
    input [63:0] io_state_i_9,
    input [63:0] io_state_i_8,
    input [63:0] io_state_i_7,
    input [63:0] io_state_i_6,
    input [63:0] io_state_i_5,
    input [63:0] io_state_i_4,
    input [63:0] io_state_i_3,
    input [63:0] io_state_i_2,
    input [63:0] io_state_i_1,
    input [63:0] io_state_i_0,
    output[63:0] io_state_o_24,
    output[63:0] io_state_o_23,
    output[63:0] io_state_o_22,
    output[63:0] io_state_o_21,
    output[63:0] io_state_o_20,
    output[63:0] io_state_o_19,
    output[63:0] io_state_o_18,
    output[63:0] io_state_o_17,
    output[63:0] io_state_o_16,
    output[63:0] io_state_o_15,
    output[63:0] io_state_o_14,
    output[63:0] io_state_o_13,
    output[63:0] io_state_o_12,
    output[63:0] io_state_o_11,
    output[63:0] io_state_o_10,
    output[63:0] io_state_o_9,
    output[63:0] io_state_o_8,
    output[63:0] io_state_o_7,
    output[63:0] io_state_o_6,
    output[63:0] io_state_o_5,
    output[63:0] io_state_o_4,
    output[63:0] io_state_o_3,
    output[63:0] io_state_o_2,
    output[63:0] io_state_o_1,
    output[63:0] io_state_o_0,
    input [4:0] io_round
);

  reg [63:0] const;
  wire[63:0] T1;


  always @(*) case (io_round)
    0: const = 64'h1;
    1: const = 64'h8082;
    2: const = 64'h800000000000808a;
    3: const = 64'h8000000080008000;
    4: const = 64'h808b;
    5: const = 64'h80000001;
    6: const = 64'h8000000080008081;
    7: const = 64'h8000000000008009;
    8: const = 64'h8a;
    9: const = 64'h88;
    10: const = 64'h80008009;
    11: const = 64'h8000000a;
    12: const = 64'h8000808b;
    13: const = 64'h800000000000008b;
    14: const = 64'h8000000000008089;
    15: const = 64'h8000000000008003;
    16: const = 64'h8000000000008002;
    17: const = 64'h8000000000000080;
    18: const = 64'h800a;
    19: const = 64'h800000008000000a;
    20: const = 64'h8000000080008081;
    21: const = 64'h8000000000008080;
    22: const = 64'h80000001;
    23: const = 64'h8000000080008008;
    24: const = 64'h0;
    default: begin
      const = 64'bx;
`ifndef SYNTHESIS
// synthesis translate_off
      const = {2{$random}};
// synthesis translate_on
`endif
    end
  endcase
  assign io_state_o_0 = T1;
  assign T1 = io_state_i_0 ^ const;
  assign io_state_o_1 = io_state_i_1;
  assign io_state_o_2 = io_state_i_2;
  assign io_state_o_3 = io_state_i_3;
  assign io_state_o_4 = io_state_i_4;
  assign io_state_o_5 = io_state_i_5;
  assign io_state_o_6 = io_state_i_6;
  assign io_state_o_7 = io_state_i_7;
  assign io_state_o_8 = io_state_i_8;
  assign io_state_o_9 = io_state_i_9;
  assign io_state_o_10 = io_state_i_10;
  assign io_state_o_11 = io_state_i_11;
  assign io_state_o_12 = io_state_i_12;
  assign io_state_o_13 = io_state_i_13;
  assign io_state_o_14 = io_state_i_14;
  assign io_state_o_15 = io_state_i_15;
  assign io_state_o_16 = io_state_i_16;
  assign io_state_o_17 = io_state_i_17;
  assign io_state_o_18 = io_state_i_18;
  assign io_state_o_19 = io_state_i_19;
  assign io_state_o_20 = io_state_i_20;
  assign io_state_o_21 = io_state_i_21;
  assign io_state_o_22 = io_state_i_22;
  assign io_state_o_23 = io_state_i_23;
  assign io_state_o_24 = io_state_i_24;
endmodule

module DpathModule(input clk, input reset,
    input  io_absorb,
    input  io_init,
    input  io_write,
    input [4:0] io_round,
    input  io_stage,
    input [4:0] io_aindex,
    input [63:0] io_message_in,
    output[63:0] io_hash_out_3,
    output[63:0] io_hash_out_2,
    output[63:0] io_hash_out_1,
    output[63:0] io_hash_out_0
);

  reg [63:0] state_0;
  wire[63:0] T263;
  wire[63:0] T0;
  wire[63:0] T1;
  wire[63:0] T2;
  wire[63:0] T3;
  wire[63:0] T4;
  wire[63:0] T5;
  wire T6;
  wire[63:0] T7;
  wire[63:0] T8;
  wire[63:0] T9;
  wire[63:0] T10;
  wire[63:0] T11;
  wire[63:0] T12;
  reg [63:0] state_1;
  wire[63:0] T264;
  wire[63:0] T13;
  wire[63:0] T14;
  wire[63:0] T15;
  wire[63:0] T16;
  wire[63:0] T17;
  wire[63:0] T18;
  wire T19;
  wire T20;
  wire[31:0] T21;
  wire[4:0] T22;
  wire[4:0] T265;
  wire[5:0] T23;
  wire[5:0] T266;
  wire[4:0] T24;
  wire[5:0] T25;
  wire[2:0] T26;
  wire T27;
  wire T28;
  wire T29;
  wire[4:0] T30;
  wire[4:0] T267;
  wire[5:0] T31;
  wire[5:0] T268;
  wire[4:0] T32;
  wire[5:0] T33;
  wire[2:0] T34;
  wire[63:0] T35;
  reg [63:0] state_2;
  wire[63:0] T269;
  wire[63:0] T36;
  wire[63:0] T37;
  wire[63:0] T38;
  wire[63:0] T39;
  wire[63:0] T40;
  wire[63:0] T41;
  wire T42;
  wire T43;
  reg [63:0] state_3;
  wire[63:0] T270;
  wire[63:0] T44;
  wire[63:0] T45;
  wire[63:0] T46;
  wire[63:0] T47;
  wire[63:0] T48;
  wire[63:0] T49;
  wire T50;
  wire T51;
  wire T52;
  wire T53;
  wire[63:0] T54;
  wire[63:0] T55;
  reg [63:0] state_4;
  wire[63:0] T271;
  wire[63:0] T56;
  wire[63:0] T57;
  wire[63:0] T58;
  wire[63:0] T59;
  wire[63:0] T60;
  wire[63:0] T61;
  wire T62;
  wire T63;
  reg [63:0] state_5;
  wire[63:0] T272;
  wire[63:0] T64;
  wire[63:0] T65;
  wire[63:0] T66;
  wire[63:0] T67;
  wire[63:0] T68;
  wire[63:0] T69;
  wire T70;
  wire T71;
  wire T72;
  wire[63:0] T73;
  reg [63:0] state_6;
  wire[63:0] T273;
  wire[63:0] T74;
  wire[63:0] T75;
  wire[63:0] T76;
  wire[63:0] T77;
  wire[63:0] T78;
  wire[63:0] T79;
  wire T80;
  wire T81;
  reg [63:0] state_7;
  wire[63:0] T274;
  wire[63:0] T82;
  wire[63:0] T83;
  wire[63:0] T84;
  wire[63:0] T85;
  wire[63:0] T86;
  wire[63:0] T87;
  wire T88;
  wire T89;
  wire T90;
  wire T91;
  wire T92;
  wire[63:0] T93;
  wire[63:0] T94;
  wire[63:0] T95;
  reg [63:0] state_8;
  wire[63:0] T275;
  wire[63:0] T96;
  wire[63:0] T97;
  wire[63:0] T98;
  wire[63:0] T99;
  wire[63:0] T100;
  wire[63:0] T101;
  wire T102;
  wire T103;
  reg [63:0] state_9;
  wire[63:0] T276;
  wire[63:0] T104;
  wire[63:0] T105;
  wire[63:0] T106;
  wire[63:0] T107;
  wire[63:0] T108;
  wire[63:0] T109;
  wire T110;
  wire T111;
  wire T112;
  wire[63:0] T113;
  reg [63:0] state_10;
  wire[63:0] T277;
  wire[63:0] T114;
  wire[63:0] T115;
  wire[63:0] T116;
  wire[63:0] T117;
  wire[63:0] T118;
  wire[63:0] T119;
  wire T120;
  wire T121;
  reg [63:0] state_11;
  wire[63:0] T278;
  wire[63:0] T122;
  wire[63:0] T123;
  wire[63:0] T124;
  wire[63:0] T125;
  wire[63:0] T126;
  wire[63:0] T127;
  wire T128;
  wire T129;
  wire T130;
  wire T131;
  wire[63:0] T132;
  wire[63:0] T133;
  reg [63:0] state_12;
  wire[63:0] T279;
  wire[63:0] T134;
  wire[63:0] T135;
  wire[63:0] T136;
  wire[63:0] T137;
  wire[63:0] T138;
  wire[63:0] T139;
  wire T140;
  wire T141;
  reg [63:0] state_13;
  wire[63:0] T280;
  wire[63:0] T142;
  wire[63:0] T143;
  wire[63:0] T144;
  wire[63:0] T145;
  wire[63:0] T146;
  wire[63:0] T147;
  wire T148;
  wire T149;
  wire T150;
  wire[63:0] T151;
  reg [63:0] state_14;
  wire[63:0] T281;
  wire[63:0] T152;
  wire[63:0] T153;
  wire[63:0] T154;
  wire[63:0] T155;
  wire[63:0] T156;
  wire[63:0] T157;
  wire T158;
  wire T159;
  reg [63:0] state_15;
  wire[63:0] T282;
  wire[63:0] T160;
  wire[63:0] T161;
  wire[63:0] T162;
  wire[63:0] T163;
  wire[63:0] T164;
  wire[63:0] T165;
  wire T166;
  wire T167;
  wire T168;
  wire T169;
  wire T170;
  wire T171;
  wire[63:0] T172;
  wire[63:0] T173;
  wire[63:0] T174;
  wire[63:0] T175;
  reg [63:0] state_16;
  wire[63:0] T283;
  wire[63:0] T176;
  wire[63:0] T177;
  wire[63:0] T178;
  wire[63:0] T179;
  wire[63:0] T180;
  wire[63:0] T181;
  wire T182;
  wire T183;
  reg [63:0] state_17;
  wire[63:0] T284;
  wire[63:0] T184;
  wire[63:0] T185;
  wire[63:0] T186;
  wire[63:0] T187;
  wire[63:0] T188;
  wire[63:0] T189;
  wire T190;
  wire T191;
  wire T192;
  wire[63:0] T193;
  reg [63:0] state_18;
  wire[63:0] T285;
  wire[63:0] T194;
  wire[63:0] T195;
  wire[63:0] T196;
  wire[63:0] T197;
  wire[63:0] T198;
  wire[63:0] T199;
  wire T200;
  wire T201;
  reg [63:0] state_19;
  wire[63:0] T286;
  wire[63:0] T202;
  wire[63:0] T203;
  wire[63:0] T204;
  wire[63:0] T205;
  wire[63:0] T206;
  wire[63:0] T207;
  wire T208;
  wire T209;
  wire T210;
  wire T211;
  wire[63:0] T212;
  wire[63:0] T213;
  reg [63:0] state_20;
  wire[63:0] T287;
  wire[63:0] T214;
  wire[63:0] T215;
  wire[63:0] T216;
  wire[63:0] T217;
  wire[63:0] T218;
  wire[63:0] T219;
  wire T220;
  wire T221;
  reg [63:0] state_21;
  wire[63:0] T288;
  wire[63:0] T222;
  wire[63:0] T223;
  wire[63:0] T224;
  wire[63:0] T225;
  wire[63:0] T226;
  wire[63:0] T227;
  wire T228;
  wire T229;
  wire T230;
  wire[63:0] T231;
  reg [63:0] state_22;
  wire[63:0] T289;
  wire[63:0] T232;
  wire[63:0] T233;
  wire[63:0] T234;
  wire[63:0] T235;
  wire[63:0] T236;
  wire[63:0] T237;
  wire T238;
  wire T239;
  reg [63:0] state_23;
  wire[63:0] T290;
  wire[63:0] T240;
  wire[63:0] T241;
  wire[63:0] T242;
  wire[63:0] T243;
  wire[63:0] T244;
  wire[63:0] T245;
  wire T246;
  wire T247;
  wire T248;
  wire T249;
  wire T250;
  reg [63:0] state_24;
  wire[63:0] T291;
  wire[63:0] T251;
  wire[63:0] T252;
  wire[63:0] T253;
  wire[63:0] T254;
  wire[63:0] T255;
  wire[63:0] T256;
  wire T257;
  wire T258;
  wire T259;
  wire T260;
  wire T261;
  wire T262;
  wire[63:0] ThetaModule_io_state_o_24;
  wire[63:0] ThetaModule_io_state_o_23;
  wire[63:0] ThetaModule_io_state_o_22;
  wire[63:0] ThetaModule_io_state_o_21;
  wire[63:0] ThetaModule_io_state_o_20;
  wire[63:0] ThetaModule_io_state_o_19;
  wire[63:0] ThetaModule_io_state_o_18;
  wire[63:0] ThetaModule_io_state_o_17;
  wire[63:0] ThetaModule_io_state_o_16;
  wire[63:0] ThetaModule_io_state_o_15;
  wire[63:0] ThetaModule_io_state_o_14;
  wire[63:0] ThetaModule_io_state_o_13;
  wire[63:0] ThetaModule_io_state_o_12;
  wire[63:0] ThetaModule_io_state_o_11;
  wire[63:0] ThetaModule_io_state_o_10;
  wire[63:0] ThetaModule_io_state_o_9;
  wire[63:0] ThetaModule_io_state_o_8;
  wire[63:0] ThetaModule_io_state_o_7;
  wire[63:0] ThetaModule_io_state_o_6;
  wire[63:0] ThetaModule_io_state_o_5;
  wire[63:0] ThetaModule_io_state_o_4;
  wire[63:0] ThetaModule_io_state_o_3;
  wire[63:0] ThetaModule_io_state_o_2;
  wire[63:0] ThetaModule_io_state_o_1;
  wire[63:0] ThetaModule_io_state_o_0;
  wire[63:0] RhoPiModule_io_state_o_24;
  wire[63:0] RhoPiModule_io_state_o_23;
  wire[63:0] RhoPiModule_io_state_o_22;
  wire[63:0] RhoPiModule_io_state_o_21;
  wire[63:0] RhoPiModule_io_state_o_20;
  wire[63:0] RhoPiModule_io_state_o_19;
  wire[63:0] RhoPiModule_io_state_o_18;
  wire[63:0] RhoPiModule_io_state_o_17;
  wire[63:0] RhoPiModule_io_state_o_16;
  wire[63:0] RhoPiModule_io_state_o_15;
  wire[63:0] RhoPiModule_io_state_o_14;
  wire[63:0] RhoPiModule_io_state_o_13;
  wire[63:0] RhoPiModule_io_state_o_12;
  wire[63:0] RhoPiModule_io_state_o_11;
  wire[63:0] RhoPiModule_io_state_o_10;
  wire[63:0] RhoPiModule_io_state_o_9;
  wire[63:0] RhoPiModule_io_state_o_8;
  wire[63:0] RhoPiModule_io_state_o_7;
  wire[63:0] RhoPiModule_io_state_o_6;
  wire[63:0] RhoPiModule_io_state_o_5;
  wire[63:0] RhoPiModule_io_state_o_4;
  wire[63:0] RhoPiModule_io_state_o_3;
  wire[63:0] RhoPiModule_io_state_o_2;
  wire[63:0] RhoPiModule_io_state_o_1;
  wire[63:0] RhoPiModule_io_state_o_0;
  wire[63:0] ChiModule_io_state_o_24;
  wire[63:0] ChiModule_io_state_o_23;
  wire[63:0] ChiModule_io_state_o_22;
  wire[63:0] ChiModule_io_state_o_21;
  wire[63:0] ChiModule_io_state_o_20;
  wire[63:0] ChiModule_io_state_o_19;
  wire[63:0] ChiModule_io_state_o_18;
  wire[63:0] ChiModule_io_state_o_17;
  wire[63:0] ChiModule_io_state_o_16;
  wire[63:0] ChiModule_io_state_o_15;
  wire[63:0] ChiModule_io_state_o_14;
  wire[63:0] ChiModule_io_state_o_13;
  wire[63:0] ChiModule_io_state_o_12;
  wire[63:0] ChiModule_io_state_o_11;
  wire[63:0] ChiModule_io_state_o_10;
  wire[63:0] ChiModule_io_state_o_9;
  wire[63:0] ChiModule_io_state_o_8;
  wire[63:0] ChiModule_io_state_o_7;
  wire[63:0] ChiModule_io_state_o_6;
  wire[63:0] ChiModule_io_state_o_5;
  wire[63:0] ChiModule_io_state_o_4;
  wire[63:0] ChiModule_io_state_o_3;
  wire[63:0] ChiModule_io_state_o_2;
  wire[63:0] ChiModule_io_state_o_1;
  wire[63:0] ChiModule_io_state_o_0;
  wire[63:0] iota_io_state_o_24;
  wire[63:0] iota_io_state_o_23;
  wire[63:0] iota_io_state_o_22;
  wire[63:0] iota_io_state_o_21;
  wire[63:0] iota_io_state_o_20;
  wire[63:0] iota_io_state_o_19;
  wire[63:0] iota_io_state_o_18;
  wire[63:0] iota_io_state_o_17;
  wire[63:0] iota_io_state_o_16;
  wire[63:0] iota_io_state_o_15;
  wire[63:0] iota_io_state_o_14;
  wire[63:0] iota_io_state_o_13;
  wire[63:0] iota_io_state_o_12;
  wire[63:0] iota_io_state_o_11;
  wire[63:0] iota_io_state_o_10;
  wire[63:0] iota_io_state_o_9;
  wire[63:0] iota_io_state_o_8;
  wire[63:0] iota_io_state_o_7;
  wire[63:0] iota_io_state_o_6;
  wire[63:0] iota_io_state_o_5;
  wire[63:0] iota_io_state_o_4;
  wire[63:0] iota_io_state_o_3;
  wire[63:0] iota_io_state_o_2;
  wire[63:0] iota_io_state_o_1;
  wire[63:0] iota_io_state_o_0;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    state_0 = {2{$random}};
    state_1 = {2{$random}};
    state_2 = {2{$random}};
    state_3 = {2{$random}};
    state_4 = {2{$random}};
    state_5 = {2{$random}};
    state_6 = {2{$random}};
    state_7 = {2{$random}};
    state_8 = {2{$random}};
    state_9 = {2{$random}};
    state_10 = {2{$random}};
    state_11 = {2{$random}};
    state_12 = {2{$random}};
    state_13 = {2{$random}};
    state_14 = {2{$random}};
    state_15 = {2{$random}};
    state_16 = {2{$random}};
    state_17 = {2{$random}};
    state_18 = {2{$random}};
    state_19 = {2{$random}};
    state_20 = {2{$random}};
    state_21 = {2{$random}};
    state_22 = {2{$random}};
    state_23 = {2{$random}};
    state_24 = {2{$random}};
  end
// synthesis translate_on
`endif

  assign T263 = reset ? 64'h0 : T0;
  assign T0 = reset ? 64'h0 : T1;
  assign T1 = io_init ? 64'h0 : T2;
  assign T2 = io_write ? state_0 : T3;
  assign T3 = T261 ? T7 : T4;
  assign T4 = io_absorb ? state_0 : T5;
  assign T5 = T6 ? iota_io_state_o_0 : iota_io_state_o_0;
  assign T6 = 1'h0 == io_stage;
  assign T7 = T8 ^ io_message_in;
  assign T8 = T260 ? T172 : T9;
  assign T9 = T171 ? T93 : T10;
  assign T10 = T92 ? T54 : T11;
  assign T11 = T53 ? T35 : T12;
  assign T12 = T29 ? state_1 : state_0;
  assign T264 = reset ? 64'h0 : T13;
  assign T13 = reset ? 64'h0 : T14;
  assign T14 = io_init ? 64'h0 : T15;
  assign T15 = io_write ? state_1 : T16;
  assign T16 = T19 ? T7 : T17;
  assign T17 = io_absorb ? state_1 : T18;
  assign T18 = T6 ? iota_io_state_o_1 : iota_io_state_o_1;
  assign T19 = T27 & T20;
  assign T20 = T21[1'h1:1'h1];
  assign T21 = 1'h1 << T22;
  assign T22 = T265;
  assign T265 = T23[3'h4:1'h0];
  assign T23 = T25 + T266;
  assign T266 = {1'h0, T24};
  assign T24 = io_aindex / 3'h5;
  assign T25 = T26 * 3'h5;
  assign T26 = io_aindex % 3'h5;
  assign T27 = io_absorb & T28;
  assign T28 = io_aindex < 5'h11;
  assign T29 = T30[1'h0:1'h0];
  assign T30 = T267;
  assign T267 = T31[3'h4:1'h0];
  assign T31 = T33 + T268;
  assign T268 = {1'h0, T32};
  assign T32 = io_aindex / 3'h5;
  assign T33 = T34 * 3'h5;
  assign T34 = io_aindex % 3'h5;
  assign T35 = T52 ? state_3 : state_2;
  assign T269 = reset ? 64'h0 : T36;
  assign T36 = reset ? 64'h0 : T37;
  assign T37 = io_init ? 64'h0 : T38;
  assign T38 = io_write ? state_2 : T39;
  assign T39 = T42 ? T7 : T40;
  assign T40 = io_absorb ? state_2 : T41;
  assign T41 = T6 ? iota_io_state_o_2 : iota_io_state_o_2;
  assign T42 = T27 & T43;
  assign T43 = T21[2'h2:2'h2];
  assign T270 = reset ? 64'h0 : T44;
  assign T44 = reset ? 64'h0 : T45;
  assign T45 = io_init ? 64'h0 : T46;
  assign T46 = io_write ? state_3 : T47;
  assign T47 = T50 ? T7 : T48;
  assign T48 = io_absorb ? state_3 : T49;
  assign T49 = T6 ? iota_io_state_o_3 : iota_io_state_o_3;
  assign T50 = T27 & T51;
  assign T51 = T21[2'h3:2'h3];
  assign T52 = T30[1'h0:1'h0];
  assign T53 = T30[1'h1:1'h1];
  assign T54 = T91 ? T73 : T55;
  assign T55 = T72 ? state_5 : state_4;
  assign T271 = reset ? 64'h0 : T56;
  assign T56 = reset ? 64'h0 : T57;
  assign T57 = io_init ? 64'h0 : T58;
  assign T58 = io_write ? state_4 : T59;
  assign T59 = T62 ? T7 : T60;
  assign T60 = io_absorb ? state_4 : T61;
  assign T61 = T6 ? iota_io_state_o_4 : iota_io_state_o_4;
  assign T62 = T27 & T63;
  assign T63 = T21[3'h4:3'h4];
  assign T272 = reset ? 64'h0 : T64;
  assign T64 = reset ? 64'h0 : T65;
  assign T65 = io_init ? 64'h0 : T66;
  assign T66 = io_write ? state_5 : T67;
  assign T67 = T70 ? T7 : T68;
  assign T68 = io_absorb ? state_5 : T69;
  assign T69 = T6 ? iota_io_state_o_5 : iota_io_state_o_5;
  assign T70 = T27 & T71;
  assign T71 = T21[3'h5:3'h5];
  assign T72 = T30[1'h0:1'h0];
  assign T73 = T90 ? state_7 : state_6;
  assign T273 = reset ? 64'h0 : T74;
  assign T74 = reset ? 64'h0 : T75;
  assign T75 = io_init ? 64'h0 : T76;
  assign T76 = io_write ? state_6 : T77;
  assign T77 = T80 ? T7 : T78;
  assign T78 = io_absorb ? state_6 : T79;
  assign T79 = T6 ? iota_io_state_o_6 : iota_io_state_o_6;
  assign T80 = T27 & T81;
  assign T81 = T21[3'h6:3'h6];
  assign T274 = reset ? 64'h0 : T82;
  assign T82 = reset ? 64'h0 : T83;
  assign T83 = io_init ? 64'h0 : T84;
  assign T84 = io_write ? state_7 : T85;
  assign T85 = T88 ? T7 : T86;
  assign T86 = io_absorb ? state_7 : T87;
  assign T87 = T6 ? iota_io_state_o_7 : iota_io_state_o_7;
  assign T88 = T27 & T89;
  assign T89 = T21[3'h7:3'h7];
  assign T90 = T30[1'h0:1'h0];
  assign T91 = T30[1'h1:1'h1];
  assign T92 = T30[2'h2:2'h2];
  assign T93 = T170 ? T132 : T94;
  assign T94 = T131 ? T113 : T95;
  assign T95 = T112 ? state_9 : state_8;
  assign T275 = reset ? 64'h0 : T96;
  assign T96 = reset ? 64'h0 : T97;
  assign T97 = io_init ? 64'h0 : T98;
  assign T98 = io_write ? state_8 : T99;
  assign T99 = T102 ? T7 : T100;
  assign T100 = io_absorb ? state_8 : T101;
  assign T101 = T6 ? iota_io_state_o_8 : iota_io_state_o_8;
  assign T102 = T27 & T103;
  assign T103 = T21[4'h8:4'h8];
  assign T276 = reset ? 64'h0 : T104;
  assign T104 = reset ? 64'h0 : T105;
  assign T105 = io_init ? 64'h0 : T106;
  assign T106 = io_write ? state_9 : T107;
  assign T107 = T110 ? T7 : T108;
  assign T108 = io_absorb ? state_9 : T109;
  assign T109 = T6 ? iota_io_state_o_9 : iota_io_state_o_9;
  assign T110 = T27 & T111;
  assign T111 = T21[4'h9:4'h9];
  assign T112 = T30[1'h0:1'h0];
  assign T113 = T130 ? state_11 : state_10;
  assign T277 = reset ? 64'h0 : T114;
  assign T114 = reset ? 64'h0 : T115;
  assign T115 = io_init ? 64'h0 : T116;
  assign T116 = io_write ? state_10 : T117;
  assign T117 = T120 ? T7 : T118;
  assign T118 = io_absorb ? state_10 : T119;
  assign T119 = T6 ? iota_io_state_o_10 : iota_io_state_o_10;
  assign T120 = T27 & T121;
  assign T121 = T21[4'ha:4'ha];
  assign T278 = reset ? 64'h0 : T122;
  assign T122 = reset ? 64'h0 : T123;
  assign T123 = io_init ? 64'h0 : T124;
  assign T124 = io_write ? state_11 : T125;
  assign T125 = T128 ? T7 : T126;
  assign T126 = io_absorb ? state_11 : T127;
  assign T127 = T6 ? iota_io_state_o_11 : iota_io_state_o_11;
  assign T128 = T27 & T129;
  assign T129 = T21[4'hb:4'hb];
  assign T130 = T30[1'h0:1'h0];
  assign T131 = T30[1'h1:1'h1];
  assign T132 = T169 ? T151 : T133;
  assign T133 = T150 ? state_13 : state_12;
  assign T279 = reset ? 64'h0 : T134;
  assign T134 = reset ? 64'h0 : T135;
  assign T135 = io_init ? 64'h0 : T136;
  assign T136 = io_write ? state_12 : T137;
  assign T137 = T140 ? T7 : T138;
  assign T138 = io_absorb ? state_12 : T139;
  assign T139 = T6 ? iota_io_state_o_12 : iota_io_state_o_12;
  assign T140 = T27 & T141;
  assign T141 = T21[4'hc:4'hc];
  assign T280 = reset ? 64'h0 : T142;
  assign T142 = reset ? 64'h0 : T143;
  assign T143 = io_init ? 64'h0 : T144;
  assign T144 = io_write ? state_13 : T145;
  assign T145 = T148 ? T7 : T146;
  assign T146 = io_absorb ? state_13 : T147;
  assign T147 = T6 ? iota_io_state_o_13 : iota_io_state_o_13;
  assign T148 = T27 & T149;
  assign T149 = T21[4'hd:4'hd];
  assign T150 = T30[1'h0:1'h0];
  assign T151 = T168 ? state_15 : state_14;
  assign T281 = reset ? 64'h0 : T152;
  assign T152 = reset ? 64'h0 : T153;
  assign T153 = io_init ? 64'h0 : T154;
  assign T154 = io_write ? state_14 : T155;
  assign T155 = T158 ? T7 : T156;
  assign T156 = io_absorb ? state_14 : T157;
  assign T157 = T6 ? iota_io_state_o_14 : iota_io_state_o_14;
  assign T158 = T27 & T159;
  assign T159 = T21[4'he:4'he];
  assign T282 = reset ? 64'h0 : T160;
  assign T160 = reset ? 64'h0 : T161;
  assign T161 = io_init ? 64'h0 : T162;
  assign T162 = io_write ? state_15 : T163;
  assign T163 = T166 ? T7 : T164;
  assign T164 = io_absorb ? state_15 : T165;
  assign T165 = T6 ? iota_io_state_o_15 : iota_io_state_o_15;
  assign T166 = T27 & T167;
  assign T167 = T21[4'hf:4'hf];
  assign T168 = T30[1'h0:1'h0];
  assign T169 = T30[1'h1:1'h1];
  assign T170 = T30[2'h2:2'h2];
  assign T171 = T30[2'h3:2'h3];
  assign T172 = T259 ? state_24 : T173;
  assign T173 = T250 ? T212 : T174;
  assign T174 = T211 ? T193 : T175;
  assign T175 = T192 ? state_17 : state_16;
  assign T283 = reset ? 64'h0 : T176;
  assign T176 = reset ? 64'h0 : T177;
  assign T177 = io_init ? 64'h0 : T178;
  assign T178 = io_write ? state_16 : T179;
  assign T179 = T182 ? T7 : T180;
  assign T180 = io_absorb ? state_16 : T181;
  assign T181 = T6 ? iota_io_state_o_16 : iota_io_state_o_16;
  assign T182 = T27 & T183;
  assign T183 = T21[5'h10:5'h10];
  assign T284 = reset ? 64'h0 : T184;
  assign T184 = reset ? 64'h0 : T185;
  assign T185 = io_init ? 64'h0 : T186;
  assign T186 = io_write ? state_17 : T187;
  assign T187 = T190 ? T7 : T188;
  assign T188 = io_absorb ? state_17 : T189;
  assign T189 = T6 ? iota_io_state_o_17 : iota_io_state_o_17;
  assign T190 = T27 & T191;
  assign T191 = T21[5'h11:5'h11];
  assign T192 = T30[1'h0:1'h0];
  assign T193 = T210 ? state_19 : state_18;
  assign T285 = reset ? 64'h0 : T194;
  assign T194 = reset ? 64'h0 : T195;
  assign T195 = io_init ? 64'h0 : T196;
  assign T196 = io_write ? state_18 : T197;
  assign T197 = T200 ? T7 : T198;
  assign T198 = io_absorb ? state_18 : T199;
  assign T199 = T6 ? iota_io_state_o_18 : iota_io_state_o_18;
  assign T200 = T27 & T201;
  assign T201 = T21[5'h12:5'h12];
  assign T286 = reset ? 64'h0 : T202;
  assign T202 = reset ? 64'h0 : T203;
  assign T203 = io_init ? 64'h0 : T204;
  assign T204 = io_write ? state_19 : T205;
  assign T205 = T208 ? T7 : T206;
  assign T206 = io_absorb ? state_19 : T207;
  assign T207 = T6 ? iota_io_state_o_19 : iota_io_state_o_19;
  assign T208 = T27 & T209;
  assign T209 = T21[5'h13:5'h13];
  assign T210 = T30[1'h0:1'h0];
  assign T211 = T30[1'h1:1'h1];
  assign T212 = T249 ? T231 : T213;
  assign T213 = T230 ? state_21 : state_20;
  assign T287 = reset ? 64'h0 : T214;
  assign T214 = reset ? 64'h0 : T215;
  assign T215 = io_init ? 64'h0 : T216;
  assign T216 = io_write ? state_20 : T217;
  assign T217 = T220 ? T7 : T218;
  assign T218 = io_absorb ? state_20 : T219;
  assign T219 = T6 ? iota_io_state_o_20 : iota_io_state_o_20;
  assign T220 = T27 & T221;
  assign T221 = T21[5'h14:5'h14];
  assign T288 = reset ? 64'h0 : T222;
  assign T222 = reset ? 64'h0 : T223;
  assign T223 = io_init ? 64'h0 : T224;
  assign T224 = io_write ? state_21 : T225;
  assign T225 = T228 ? T7 : T226;
  assign T226 = io_absorb ? state_21 : T227;
  assign T227 = T6 ? iota_io_state_o_21 : iota_io_state_o_21;
  assign T228 = T27 & T229;
  assign T229 = T21[5'h15:5'h15];
  assign T230 = T30[1'h0:1'h0];
  assign T231 = T248 ? state_23 : state_22;
  assign T289 = reset ? 64'h0 : T232;
  assign T232 = reset ? 64'h0 : T233;
  assign T233 = io_init ? 64'h0 : T234;
  assign T234 = io_write ? state_22 : T235;
  assign T235 = T238 ? T7 : T236;
  assign T236 = io_absorb ? state_22 : T237;
  assign T237 = T6 ? iota_io_state_o_22 : iota_io_state_o_22;
  assign T238 = T27 & T239;
  assign T239 = T21[5'h16:5'h16];
  assign T290 = reset ? 64'h0 : T240;
  assign T240 = reset ? 64'h0 : T241;
  assign T241 = io_init ? 64'h0 : T242;
  assign T242 = io_write ? state_23 : T243;
  assign T243 = T246 ? T7 : T244;
  assign T244 = io_absorb ? state_23 : T245;
  assign T245 = T6 ? iota_io_state_o_23 : iota_io_state_o_23;
  assign T246 = T27 & T247;
  assign T247 = T21[5'h17:5'h17];
  assign T248 = T30[1'h0:1'h0];
  assign T249 = T30[1'h1:1'h1];
  assign T250 = T30[2'h2:2'h2];
  assign T291 = reset ? 64'h0 : T251;
  assign T251 = reset ? 64'h0 : T252;
  assign T252 = io_init ? 64'h0 : T253;
  assign T253 = io_write ? state_24 : T254;
  assign T254 = T257 ? T7 : T255;
  assign T255 = io_absorb ? state_24 : T256;
  assign T256 = T6 ? iota_io_state_o_24 : iota_io_state_o_24;
  assign T257 = T27 & T258;
  assign T258 = T21[5'h18:5'h18];
  assign T259 = T30[2'h3:2'h3];
  assign T260 = T30[3'h4:3'h4];
  assign T261 = T27 & T262;
  assign T262 = T21[1'h0:1'h0];
  assign io_hash_out_0 = state_0;
  assign io_hash_out_1 = state_5;
  assign io_hash_out_2 = state_10;
  assign io_hash_out_3 = state_15;
  ThetaModule ThetaModule(
       .io_state_i_24( state_24 ),
       .io_state_i_23( state_23 ),
       .io_state_i_22( state_22 ),
       .io_state_i_21( state_21 ),
       .io_state_i_20( state_20 ),
       .io_state_i_19( state_19 ),
       .io_state_i_18( state_18 ),
       .io_state_i_17( state_17 ),
       .io_state_i_16( state_16 ),
       .io_state_i_15( state_15 ),
       .io_state_i_14( state_14 ),
       .io_state_i_13( state_13 ),
       .io_state_i_12( state_12 ),
       .io_state_i_11( state_11 ),
       .io_state_i_10( state_10 ),
       .io_state_i_9( state_9 ),
       .io_state_i_8( state_8 ),
       .io_state_i_7( state_7 ),
       .io_state_i_6( state_6 ),
       .io_state_i_5( state_5 ),
       .io_state_i_4( state_4 ),
       .io_state_i_3( state_3 ),
       .io_state_i_2( state_2 ),
       .io_state_i_1( state_1 ),
       .io_state_i_0( state_0 ),
       .io_state_o_24( ThetaModule_io_state_o_24 ),
       .io_state_o_23( ThetaModule_io_state_o_23 ),
       .io_state_o_22( ThetaModule_io_state_o_22 ),
       .io_state_o_21( ThetaModule_io_state_o_21 ),
       .io_state_o_20( ThetaModule_io_state_o_20 ),
       .io_state_o_19( ThetaModule_io_state_o_19 ),
       .io_state_o_18( ThetaModule_io_state_o_18 ),
       .io_state_o_17( ThetaModule_io_state_o_17 ),
       .io_state_o_16( ThetaModule_io_state_o_16 ),
       .io_state_o_15( ThetaModule_io_state_o_15 ),
       .io_state_o_14( ThetaModule_io_state_o_14 ),
       .io_state_o_13( ThetaModule_io_state_o_13 ),
       .io_state_o_12( ThetaModule_io_state_o_12 ),
       .io_state_o_11( ThetaModule_io_state_o_11 ),
       .io_state_o_10( ThetaModule_io_state_o_10 ),
       .io_state_o_9( ThetaModule_io_state_o_9 ),
       .io_state_o_8( ThetaModule_io_state_o_8 ),
       .io_state_o_7( ThetaModule_io_state_o_7 ),
       .io_state_o_6( ThetaModule_io_state_o_6 ),
       .io_state_o_5( ThetaModule_io_state_o_5 ),
       .io_state_o_4( ThetaModule_io_state_o_4 ),
       .io_state_o_3( ThetaModule_io_state_o_3 ),
       .io_state_o_2( ThetaModule_io_state_o_2 ),
       .io_state_o_1( ThetaModule_io_state_o_1 ),
       .io_state_o_0( ThetaModule_io_state_o_0 )
  );
  RhoPiModule RhoPiModule(
       .io_state_i_24( ThetaModule_io_state_o_24 ),
       .io_state_i_23( ThetaModule_io_state_o_23 ),
       .io_state_i_22( ThetaModule_io_state_o_22 ),
       .io_state_i_21( ThetaModule_io_state_o_21 ),
       .io_state_i_20( ThetaModule_io_state_o_20 ),
       .io_state_i_19( ThetaModule_io_state_o_19 ),
       .io_state_i_18( ThetaModule_io_state_o_18 ),
       .io_state_i_17( ThetaModule_io_state_o_17 ),
       .io_state_i_16( ThetaModule_io_state_o_16 ),
       .io_state_i_15( ThetaModule_io_state_o_15 ),
       .io_state_i_14( ThetaModule_io_state_o_14 ),
       .io_state_i_13( ThetaModule_io_state_o_13 ),
       .io_state_i_12( ThetaModule_io_state_o_12 ),
       .io_state_i_11( ThetaModule_io_state_o_11 ),
       .io_state_i_10( ThetaModule_io_state_o_10 ),
       .io_state_i_9( ThetaModule_io_state_o_9 ),
       .io_state_i_8( ThetaModule_io_state_o_8 ),
       .io_state_i_7( ThetaModule_io_state_o_7 ),
       .io_state_i_6( ThetaModule_io_state_o_6 ),
       .io_state_i_5( ThetaModule_io_state_o_5 ),
       .io_state_i_4( ThetaModule_io_state_o_4 ),
       .io_state_i_3( ThetaModule_io_state_o_3 ),
       .io_state_i_2( ThetaModule_io_state_o_2 ),
       .io_state_i_1( ThetaModule_io_state_o_1 ),
       .io_state_i_0( ThetaModule_io_state_o_0 ),
       .io_state_o_24( RhoPiModule_io_state_o_24 ),
       .io_state_o_23( RhoPiModule_io_state_o_23 ),
       .io_state_o_22( RhoPiModule_io_state_o_22 ),
       .io_state_o_21( RhoPiModule_io_state_o_21 ),
       .io_state_o_20( RhoPiModule_io_state_o_20 ),
       .io_state_o_19( RhoPiModule_io_state_o_19 ),
       .io_state_o_18( RhoPiModule_io_state_o_18 ),
       .io_state_o_17( RhoPiModule_io_state_o_17 ),
       .io_state_o_16( RhoPiModule_io_state_o_16 ),
       .io_state_o_15( RhoPiModule_io_state_o_15 ),
       .io_state_o_14( RhoPiModule_io_state_o_14 ),
       .io_state_o_13( RhoPiModule_io_state_o_13 ),
       .io_state_o_12( RhoPiModule_io_state_o_12 ),
       .io_state_o_11( RhoPiModule_io_state_o_11 ),
       .io_state_o_10( RhoPiModule_io_state_o_10 ),
       .io_state_o_9( RhoPiModule_io_state_o_9 ),
       .io_state_o_8( RhoPiModule_io_state_o_8 ),
       .io_state_o_7( RhoPiModule_io_state_o_7 ),
       .io_state_o_6( RhoPiModule_io_state_o_6 ),
       .io_state_o_5( RhoPiModule_io_state_o_5 ),
       .io_state_o_4( RhoPiModule_io_state_o_4 ),
       .io_state_o_3( RhoPiModule_io_state_o_3 ),
       .io_state_o_2( RhoPiModule_io_state_o_2 ),
       .io_state_o_1( RhoPiModule_io_state_o_1 ),
       .io_state_o_0( RhoPiModule_io_state_o_0 )
  );
  ChiModule ChiModule(
       .io_state_i_24( RhoPiModule_io_state_o_24 ),
       .io_state_i_23( RhoPiModule_io_state_o_23 ),
       .io_state_i_22( RhoPiModule_io_state_o_22 ),
       .io_state_i_21( RhoPiModule_io_state_o_21 ),
       .io_state_i_20( RhoPiModule_io_state_o_20 ),
       .io_state_i_19( RhoPiModule_io_state_o_19 ),
       .io_state_i_18( RhoPiModule_io_state_o_18 ),
       .io_state_i_17( RhoPiModule_io_state_o_17 ),
       .io_state_i_16( RhoPiModule_io_state_o_16 ),
       .io_state_i_15( RhoPiModule_io_state_o_15 ),
       .io_state_i_14( RhoPiModule_io_state_o_14 ),
       .io_state_i_13( RhoPiModule_io_state_o_13 ),
       .io_state_i_12( RhoPiModule_io_state_o_12 ),
       .io_state_i_11( RhoPiModule_io_state_o_11 ),
       .io_state_i_10( RhoPiModule_io_state_o_10 ),
       .io_state_i_9( RhoPiModule_io_state_o_9 ),
       .io_state_i_8( RhoPiModule_io_state_o_8 ),
       .io_state_i_7( RhoPiModule_io_state_o_7 ),
       .io_state_i_6( RhoPiModule_io_state_o_6 ),
       .io_state_i_5( RhoPiModule_io_state_o_5 ),
       .io_state_i_4( RhoPiModule_io_state_o_4 ),
       .io_state_i_3( RhoPiModule_io_state_o_3 ),
       .io_state_i_2( RhoPiModule_io_state_o_2 ),
       .io_state_i_1( RhoPiModule_io_state_o_1 ),
       .io_state_i_0( RhoPiModule_io_state_o_0 ),
       .io_state_o_24( ChiModule_io_state_o_24 ),
       .io_state_o_23( ChiModule_io_state_o_23 ),
       .io_state_o_22( ChiModule_io_state_o_22 ),
       .io_state_o_21( ChiModule_io_state_o_21 ),
       .io_state_o_20( ChiModule_io_state_o_20 ),
       .io_state_o_19( ChiModule_io_state_o_19 ),
       .io_state_o_18( ChiModule_io_state_o_18 ),
       .io_state_o_17( ChiModule_io_state_o_17 ),
       .io_state_o_16( ChiModule_io_state_o_16 ),
       .io_state_o_15( ChiModule_io_state_o_15 ),
       .io_state_o_14( ChiModule_io_state_o_14 ),
       .io_state_o_13( ChiModule_io_state_o_13 ),
       .io_state_o_12( ChiModule_io_state_o_12 ),
       .io_state_o_11( ChiModule_io_state_o_11 ),
       .io_state_o_10( ChiModule_io_state_o_10 ),
       .io_state_o_9( ChiModule_io_state_o_9 ),
       .io_state_o_8( ChiModule_io_state_o_8 ),
       .io_state_o_7( ChiModule_io_state_o_7 ),
       .io_state_o_6( ChiModule_io_state_o_6 ),
       .io_state_o_5( ChiModule_io_state_o_5 ),
       .io_state_o_4( ChiModule_io_state_o_4 ),
       .io_state_o_3( ChiModule_io_state_o_3 ),
       .io_state_o_2( ChiModule_io_state_o_2 ),
       .io_state_o_1( ChiModule_io_state_o_1 ),
       .io_state_o_0( ChiModule_io_state_o_0 )
  );
  IotaModule iota(
       .io_state_i_24( ChiModule_io_state_o_24 ),
       .io_state_i_23( ChiModule_io_state_o_23 ),
       .io_state_i_22( ChiModule_io_state_o_22 ),
       .io_state_i_21( ChiModule_io_state_o_21 ),
       .io_state_i_20( ChiModule_io_state_o_20 ),
       .io_state_i_19( ChiModule_io_state_o_19 ),
       .io_state_i_18( ChiModule_io_state_o_18 ),
       .io_state_i_17( ChiModule_io_state_o_17 ),
       .io_state_i_16( ChiModule_io_state_o_16 ),
       .io_state_i_15( ChiModule_io_state_o_15 ),
       .io_state_i_14( ChiModule_io_state_o_14 ),
       .io_state_i_13( ChiModule_io_state_o_13 ),
       .io_state_i_12( ChiModule_io_state_o_12 ),
       .io_state_i_11( ChiModule_io_state_o_11 ),
       .io_state_i_10( ChiModule_io_state_o_10 ),
       .io_state_i_9( ChiModule_io_state_o_9 ),
       .io_state_i_8( ChiModule_io_state_o_8 ),
       .io_state_i_7( ChiModule_io_state_o_7 ),
       .io_state_i_6( ChiModule_io_state_o_6 ),
       .io_state_i_5( ChiModule_io_state_o_5 ),
       .io_state_i_4( ChiModule_io_state_o_4 ),
       .io_state_i_3( ChiModule_io_state_o_3 ),
       .io_state_i_2( ChiModule_io_state_o_2 ),
       .io_state_i_1( ChiModule_io_state_o_1 ),
       .io_state_i_0( ChiModule_io_state_o_0 ),
       .io_state_o_24( iota_io_state_o_24 ),
       .io_state_o_23( iota_io_state_o_23 ),
       .io_state_o_22( iota_io_state_o_22 ),
       .io_state_o_21( iota_io_state_o_21 ),
       .io_state_o_20( iota_io_state_o_20 ),
       .io_state_o_19( iota_io_state_o_19 ),
       .io_state_o_18( iota_io_state_o_18 ),
       .io_state_o_17( iota_io_state_o_17 ),
       .io_state_o_16( iota_io_state_o_16 ),
       .io_state_o_15( iota_io_state_o_15 ),
       .io_state_o_14( iota_io_state_o_14 ),
       .io_state_o_13( iota_io_state_o_13 ),
       .io_state_o_12( iota_io_state_o_12 ),
       .io_state_o_11( iota_io_state_o_11 ),
       .io_state_o_10( iota_io_state_o_10 ),
       .io_state_o_9( iota_io_state_o_9 ),
       .io_state_o_8( iota_io_state_o_8 ),
       .io_state_o_7( iota_io_state_o_7 ),
       .io_state_o_6( iota_io_state_o_6 ),
       .io_state_o_5( iota_io_state_o_5 ),
       .io_state_o_4( iota_io_state_o_4 ),
       .io_state_o_3( iota_io_state_o_3 ),
       .io_state_o_2( iota_io_state_o_2 ),
       .io_state_o_1( iota_io_state_o_1 ),
       .io_state_o_0( iota_io_state_o_0 ),
       .io_round( io_round )
  );

  always @(posedge clk) begin
    if(reset) begin
      state_0 <= 64'h0;
    end else if(reset) begin
      state_0 <= 64'h0;
    end else if(io_init) begin
      state_0 <= 64'h0;
    end else if(io_write) begin
      state_0 <= state_0;
    end else if(T261) begin
      state_0 <= T7;
    end else if(io_absorb) begin
      state_0 <= state_0;
    end else if(T6) begin
      state_0 <= iota_io_state_o_0;
    end else begin
      state_0 <= iota_io_state_o_0;
    end
    if(reset) begin
      state_1 <= 64'h0;
    end else if(reset) begin
      state_1 <= 64'h0;
    end else if(io_init) begin
      state_1 <= 64'h0;
    end else if(io_write) begin
      state_1 <= state_1;
    end else if(T19) begin
      state_1 <= T7;
    end else if(io_absorb) begin
      state_1 <= state_1;
    end else if(T6) begin
      state_1 <= iota_io_state_o_1;
    end else begin
      state_1 <= iota_io_state_o_1;
    end
    if(reset) begin
      state_2 <= 64'h0;
    end else if(reset) begin
      state_2 <= 64'h0;
    end else if(io_init) begin
      state_2 <= 64'h0;
    end else if(io_write) begin
      state_2 <= state_2;
    end else if(T42) begin
      state_2 <= T7;
    end else if(io_absorb) begin
      state_2 <= state_2;
    end else if(T6) begin
      state_2 <= iota_io_state_o_2;
    end else begin
      state_2 <= iota_io_state_o_2;
    end
    if(reset) begin
      state_3 <= 64'h0;
    end else if(reset) begin
      state_3 <= 64'h0;
    end else if(io_init) begin
      state_3 <= 64'h0;
    end else if(io_write) begin
      state_3 <= state_3;
    end else if(T50) begin
      state_3 <= T7;
    end else if(io_absorb) begin
      state_3 <= state_3;
    end else if(T6) begin
      state_3 <= iota_io_state_o_3;
    end else begin
      state_3 <= iota_io_state_o_3;
    end
    if(reset) begin
      state_4 <= 64'h0;
    end else if(reset) begin
      state_4 <= 64'h0;
    end else if(io_init) begin
      state_4 <= 64'h0;
    end else if(io_write) begin
      state_4 <= state_4;
    end else if(T62) begin
      state_4 <= T7;
    end else if(io_absorb) begin
      state_4 <= state_4;
    end else if(T6) begin
      state_4 <= iota_io_state_o_4;
    end else begin
      state_4 <= iota_io_state_o_4;
    end
    if(reset) begin
      state_5 <= 64'h0;
    end else if(reset) begin
      state_5 <= 64'h0;
    end else if(io_init) begin
      state_5 <= 64'h0;
    end else if(io_write) begin
      state_5 <= state_5;
    end else if(T70) begin
      state_5 <= T7;
    end else if(io_absorb) begin
      state_5 <= state_5;
    end else if(T6) begin
      state_5 <= iota_io_state_o_5;
    end else begin
      state_5 <= iota_io_state_o_5;
    end
    if(reset) begin
      state_6 <= 64'h0;
    end else if(reset) begin
      state_6 <= 64'h0;
    end else if(io_init) begin
      state_6 <= 64'h0;
    end else if(io_write) begin
      state_6 <= state_6;
    end else if(T80) begin
      state_6 <= T7;
    end else if(io_absorb) begin
      state_6 <= state_6;
    end else if(T6) begin
      state_6 <= iota_io_state_o_6;
    end else begin
      state_6 <= iota_io_state_o_6;
    end
    if(reset) begin
      state_7 <= 64'h0;
    end else if(reset) begin
      state_7 <= 64'h0;
    end else if(io_init) begin
      state_7 <= 64'h0;
    end else if(io_write) begin
      state_7 <= state_7;
    end else if(T88) begin
      state_7 <= T7;
    end else if(io_absorb) begin
      state_7 <= state_7;
    end else if(T6) begin
      state_7 <= iota_io_state_o_7;
    end else begin
      state_7 <= iota_io_state_o_7;
    end
    if(reset) begin
      state_8 <= 64'h0;
    end else if(reset) begin
      state_8 <= 64'h0;
    end else if(io_init) begin
      state_8 <= 64'h0;
    end else if(io_write) begin
      state_8 <= state_8;
    end else if(T102) begin
      state_8 <= T7;
    end else if(io_absorb) begin
      state_8 <= state_8;
    end else if(T6) begin
      state_8 <= iota_io_state_o_8;
    end else begin
      state_8 <= iota_io_state_o_8;
    end
    if(reset) begin
      state_9 <= 64'h0;
    end else if(reset) begin
      state_9 <= 64'h0;
    end else if(io_init) begin
      state_9 <= 64'h0;
    end else if(io_write) begin
      state_9 <= state_9;
    end else if(T110) begin
      state_9 <= T7;
    end else if(io_absorb) begin
      state_9 <= state_9;
    end else if(T6) begin
      state_9 <= iota_io_state_o_9;
    end else begin
      state_9 <= iota_io_state_o_9;
    end
    if(reset) begin
      state_10 <= 64'h0;
    end else if(reset) begin
      state_10 <= 64'h0;
    end else if(io_init) begin
      state_10 <= 64'h0;
    end else if(io_write) begin
      state_10 <= state_10;
    end else if(T120) begin
      state_10 <= T7;
    end else if(io_absorb) begin
      state_10 <= state_10;
    end else if(T6) begin
      state_10 <= iota_io_state_o_10;
    end else begin
      state_10 <= iota_io_state_o_10;
    end
    if(reset) begin
      state_11 <= 64'h0;
    end else if(reset) begin
      state_11 <= 64'h0;
    end else if(io_init) begin
      state_11 <= 64'h0;
    end else if(io_write) begin
      state_11 <= state_11;
    end else if(T128) begin
      state_11 <= T7;
    end else if(io_absorb) begin
      state_11 <= state_11;
    end else if(T6) begin
      state_11 <= iota_io_state_o_11;
    end else begin
      state_11 <= iota_io_state_o_11;
    end
    if(reset) begin
      state_12 <= 64'h0;
    end else if(reset) begin
      state_12 <= 64'h0;
    end else if(io_init) begin
      state_12 <= 64'h0;
    end else if(io_write) begin
      state_12 <= state_12;
    end else if(T140) begin
      state_12 <= T7;
    end else if(io_absorb) begin
      state_12 <= state_12;
    end else if(T6) begin
      state_12 <= iota_io_state_o_12;
    end else begin
      state_12 <= iota_io_state_o_12;
    end
    if(reset) begin
      state_13 <= 64'h0;
    end else if(reset) begin
      state_13 <= 64'h0;
    end else if(io_init) begin
      state_13 <= 64'h0;
    end else if(io_write) begin
      state_13 <= state_13;
    end else if(T148) begin
      state_13 <= T7;
    end else if(io_absorb) begin
      state_13 <= state_13;
    end else if(T6) begin
      state_13 <= iota_io_state_o_13;
    end else begin
      state_13 <= iota_io_state_o_13;
    end
    if(reset) begin
      state_14 <= 64'h0;
    end else if(reset) begin
      state_14 <= 64'h0;
    end else if(io_init) begin
      state_14 <= 64'h0;
    end else if(io_write) begin
      state_14 <= state_14;
    end else if(T158) begin
      state_14 <= T7;
    end else if(io_absorb) begin
      state_14 <= state_14;
    end else if(T6) begin
      state_14 <= iota_io_state_o_14;
    end else begin
      state_14 <= iota_io_state_o_14;
    end
    if(reset) begin
      state_15 <= 64'h0;
    end else if(reset) begin
      state_15 <= 64'h0;
    end else if(io_init) begin
      state_15 <= 64'h0;
    end else if(io_write) begin
      state_15 <= state_15;
    end else if(T166) begin
      state_15 <= T7;
    end else if(io_absorb) begin
      state_15 <= state_15;
    end else if(T6) begin
      state_15 <= iota_io_state_o_15;
    end else begin
      state_15 <= iota_io_state_o_15;
    end
    if(reset) begin
      state_16 <= 64'h0;
    end else if(reset) begin
      state_16 <= 64'h0;
    end else if(io_init) begin
      state_16 <= 64'h0;
    end else if(io_write) begin
      state_16 <= state_16;
    end else if(T182) begin
      state_16 <= T7;
    end else if(io_absorb) begin
      state_16 <= state_16;
    end else if(T6) begin
      state_16 <= iota_io_state_o_16;
    end else begin
      state_16 <= iota_io_state_o_16;
    end
    if(reset) begin
      state_17 <= 64'h0;
    end else if(reset) begin
      state_17 <= 64'h0;
    end else if(io_init) begin
      state_17 <= 64'h0;
    end else if(io_write) begin
      state_17 <= state_17;
    end else if(T190) begin
      state_17 <= T7;
    end else if(io_absorb) begin
      state_17 <= state_17;
    end else if(T6) begin
      state_17 <= iota_io_state_o_17;
    end else begin
      state_17 <= iota_io_state_o_17;
    end
    if(reset) begin
      state_18 <= 64'h0;
    end else if(reset) begin
      state_18 <= 64'h0;
    end else if(io_init) begin
      state_18 <= 64'h0;
    end else if(io_write) begin
      state_18 <= state_18;
    end else if(T200) begin
      state_18 <= T7;
    end else if(io_absorb) begin
      state_18 <= state_18;
    end else if(T6) begin
      state_18 <= iota_io_state_o_18;
    end else begin
      state_18 <= iota_io_state_o_18;
    end
    if(reset) begin
      state_19 <= 64'h0;
    end else if(reset) begin
      state_19 <= 64'h0;
    end else if(io_init) begin
      state_19 <= 64'h0;
    end else if(io_write) begin
      state_19 <= state_19;
    end else if(T208) begin
      state_19 <= T7;
    end else if(io_absorb) begin
      state_19 <= state_19;
    end else if(T6) begin
      state_19 <= iota_io_state_o_19;
    end else begin
      state_19 <= iota_io_state_o_19;
    end
    if(reset) begin
      state_20 <= 64'h0;
    end else if(reset) begin
      state_20 <= 64'h0;
    end else if(io_init) begin
      state_20 <= 64'h0;
    end else if(io_write) begin
      state_20 <= state_20;
    end else if(T220) begin
      state_20 <= T7;
    end else if(io_absorb) begin
      state_20 <= state_20;
    end else if(T6) begin
      state_20 <= iota_io_state_o_20;
    end else begin
      state_20 <= iota_io_state_o_20;
    end
    if(reset) begin
      state_21 <= 64'h0;
    end else if(reset) begin
      state_21 <= 64'h0;
    end else if(io_init) begin
      state_21 <= 64'h0;
    end else if(io_write) begin
      state_21 <= state_21;
    end else if(T228) begin
      state_21 <= T7;
    end else if(io_absorb) begin
      state_21 <= state_21;
    end else if(T6) begin
      state_21 <= iota_io_state_o_21;
    end else begin
      state_21 <= iota_io_state_o_21;
    end
    if(reset) begin
      state_22 <= 64'h0;
    end else if(reset) begin
      state_22 <= 64'h0;
    end else if(io_init) begin
      state_22 <= 64'h0;
    end else if(io_write) begin
      state_22 <= state_22;
    end else if(T238) begin
      state_22 <= T7;
    end else if(io_absorb) begin
      state_22 <= state_22;
    end else if(T6) begin
      state_22 <= iota_io_state_o_22;
    end else begin
      state_22 <= iota_io_state_o_22;
    end
    if(reset) begin
      state_23 <= 64'h0;
    end else if(reset) begin
      state_23 <= 64'h0;
    end else if(io_init) begin
      state_23 <= 64'h0;
    end else if(io_write) begin
      state_23 <= state_23;
    end else if(T246) begin
      state_23 <= T7;
    end else if(io_absorb) begin
      state_23 <= state_23;
    end else if(T6) begin
      state_23 <= iota_io_state_o_23;
    end else begin
      state_23 <= iota_io_state_o_23;
    end
    if(reset) begin
      state_24 <= 64'h0;
    end else if(reset) begin
      state_24 <= 64'h0;
    end else if(io_init) begin
      state_24 <= 64'h0;
    end else if(io_write) begin
      state_24 <= state_24;
    end else if(T257) begin
      state_24 <= T7;
    end else if(io_absorb) begin
      state_24 <= state_24;
    end else if(T6) begin
      state_24 <= iota_io_state_o_24;
    end else begin
      state_24 <= iota_io_state_o_24;
    end
  end
endmodule

module Sha3Accel(input clk, input reset,
    output io_cmd_ready,
    input  io_cmd_valid,
    input [6:0] io_cmd_bits_inst_funct,
    input [4:0] io_cmd_bits_inst_rs2,
    input [4:0] io_cmd_bits_inst_rs1,
    input  io_cmd_bits_inst_xd,
    input  io_cmd_bits_inst_xs1,
    input  io_cmd_bits_inst_xs2,
    input [4:0] io_cmd_bits_inst_rd,
    input [6:0] io_cmd_bits_inst_opcode,
    input [63:0] io_cmd_bits_rs1,
    input [63:0] io_cmd_bits_rs2,
    input  io_resp_ready,
    output io_resp_valid,
    output[4:0] io_resp_bits_rd,
    output[63:0] io_resp_bits_data,
    input  io_mem_req_ready,
    output io_mem_req_valid,
    output[39:0] io_mem_req_bits_addr,
    output[9:0] io_mem_req_bits_tag,
    output[4:0] io_mem_req_bits_cmd,
    output[2:0] io_mem_req_bits_typ,
    //output io_mem_req_bits_kill
    output io_mem_req_bits_phys,
    output[63:0] io_mem_req_bits_data,
    input  io_mem_resp_valid,
    input [39:0] io_mem_resp_bits_addr,
    input [9:0] io_mem_resp_bits_tag,
    input [4:0] io_mem_resp_bits_cmd,
    input [2:0] io_mem_resp_bits_typ,
    input [63:0] io_mem_resp_bits_data,
    input  io_mem_resp_bits_nack,
    input  io_mem_resp_bits_replay,
    input  io_mem_resp_bits_has_data,
    input [63:0] io_mem_resp_bits_data_word_bypass,
    input [63:0] io_mem_resp_bits_store_data,
    //input  io_mem_replay_next_valid
    //input [9:0] io_mem_replay_next_bits
    //input  io_mem_xcpt_ma_ld
    //input  io_mem_xcpt_ma_st
    //input  io_mem_xcpt_pf_ld
    //input  io_mem_xcpt_pf_st
    //output io_mem_invalidate_lr
    //input  io_mem_ordered
    output io_busy,
    input  io_s,
    output io_interrupt,
    input  io_autl_acquire_ready,
    output io_autl_acquire_valid,
    //output[25:0] io_autl_acquire_bits_addr_block
    //output[5:0] io_autl_acquire_bits_client_xact_id
    //output[1:0] io_autl_acquire_bits_addr_beat
    //output io_autl_acquire_bits_is_builtin_type
    //output[2:0] io_autl_acquire_bits_a_type
    //output[16:0] io_autl_acquire_bits_union
    //output[127:0] io_autl_acquire_bits_data
    output io_autl_grant_ready,
    input  io_autl_grant_valid,
    input [1:0] io_autl_grant_bits_addr_beat,
    input [5:0] io_autl_grant_bits_client_xact_id,
    input [3:0] io_autl_grant_bits_manager_xact_id,
    input  io_autl_grant_bits_is_builtin_type,
    input [3:0] io_autl_grant_bits_g_type,
    input [127:0] io_autl_grant_bits_data,
    //input  io_fpu_req_ready
    //output io_fpu_req_valid
    //output[4:0] io_fpu_req_bits_cmd
    //output io_fpu_req_bits_ldst
    //output io_fpu_req_bits_wen
    //output io_fpu_req_bits_ren1
    //output io_fpu_req_bits_ren2
    //output io_fpu_req_bits_ren3
    //output io_fpu_req_bits_swap12
    //output io_fpu_req_bits_swap23
    //output io_fpu_req_bits_single
    //output io_fpu_req_bits_fromint
    //output io_fpu_req_bits_toint
    //output io_fpu_req_bits_fastpipe
    //output io_fpu_req_bits_fma
    //output io_fpu_req_bits_div
    //output io_fpu_req_bits_sqrt
    //output io_fpu_req_bits_round
    //output io_fpu_req_bits_wflags
    //output[2:0] io_fpu_req_bits_rm
    //output[1:0] io_fpu_req_bits_typ
    //output[64:0] io_fpu_req_bits_in1
    //output[64:0] io_fpu_req_bits_in2
    //output[64:0] io_fpu_req_bits_in3
    //output io_fpu_resp_ready
    //input  io_fpu_resp_valid
    //input [64:0] io_fpu_resp_bits_data
    //input [4:0] io_fpu_resp_bits_exc
    input  io_exception,
    //input [11:0] io_csr_waddr
    //input [63:0] io_csr_wdata
    //input  io_csr_wen
    input  io_host_id
);

  wire[6:0] T7;
  wire[1:0] T8;
  wire[63:0] T0;
  wire[63:0] T1;
  wire T2;
  wire[1:0] T3;
  wire[1:0] T9;
  wire[63:0] T4;
  wire T5;
  wire T6;
  wire[9:0] T10;
  wire[39:0] T11;
  wire ctrl_io_rocc_req_rdy;
  wire ctrl_io_busy;
  wire ctrl_io_dmem_req_val;
  wire[6:0] ctrl_io_dmem_req_tag;
  wire[31:0] ctrl_io_dmem_req_addr;
  wire[4:0] ctrl_io_dmem_req_cmd;
  wire[2:0] ctrl_io_dmem_req_typ;
  wire[4:0] ctrl_io_round;
  wire ctrl_io_stage;
  wire ctrl_io_absorb;
  wire[4:0] ctrl_io_aindex;
  wire ctrl_io_init;
  wire ctrl_io_write;
  wire[2:0] ctrl_io_windex;
  wire[63:0] ctrl_io_buffer_out;
  wire[63:0] dpath_io_hash_out_3;
  wire[63:0] dpath_io_hash_out_2;
  wire[63:0] dpath_io_hash_out_1;
  wire[63:0] dpath_io_hash_out_0;


`ifndef SYNTHESIS
// synthesis translate_off
//  assign io_fpu_resp_ready = {1{$random}};
//  assign io_fpu_req_bits_in3 = {3{$random}};
//  assign io_fpu_req_bits_in2 = {3{$random}};
//  assign io_fpu_req_bits_in1 = {3{$random}};
//  assign io_fpu_req_bits_typ = {1{$random}};
//  assign io_fpu_req_bits_rm = {1{$random}};
//  assign io_fpu_req_bits_wflags = {1{$random}};
//  assign io_fpu_req_bits_round = {1{$random}};
//  assign io_fpu_req_bits_sqrt = {1{$random}};
//  assign io_fpu_req_bits_div = {1{$random}};
//  assign io_fpu_req_bits_fma = {1{$random}};
//  assign io_fpu_req_bits_fastpipe = {1{$random}};
//  assign io_fpu_req_bits_toint = {1{$random}};
//  assign io_fpu_req_bits_fromint = {1{$random}};
//  assign io_fpu_req_bits_single = {1{$random}};
//  assign io_fpu_req_bits_swap23 = {1{$random}};
//  assign io_fpu_req_bits_swap12 = {1{$random}};
//  assign io_fpu_req_bits_ren3 = {1{$random}};
//  assign io_fpu_req_bits_ren2 = {1{$random}};
//  assign io_fpu_req_bits_ren1 = {1{$random}};
//  assign io_fpu_req_bits_wen = {1{$random}};
//  assign io_fpu_req_bits_ldst = {1{$random}};
//  assign io_fpu_req_bits_cmd = {1{$random}};
//  assign io_fpu_req_valid = {1{$random}};
//  assign io_autl_acquire_bits_data = {4{$random}};
//  assign io_autl_acquire_bits_union = {1{$random}};
//  assign io_autl_acquire_bits_a_type = {1{$random}};
//  assign io_autl_acquire_bits_is_builtin_type = {1{$random}};
//  assign io_autl_acquire_bits_addr_beat = {1{$random}};
//  assign io_autl_acquire_bits_client_xact_id = {1{$random}};
//  assign io_autl_acquire_bits_addr_block = {1{$random}};
//  assign io_mem_invalidate_lr = {1{$random}};
//  assign io_mem_req_bits_kill = {1{$random}};
  assign io_resp_bits_data = {2{$random}};
  assign io_resp_bits_rd = {1{$random}};
// synthesis translate_on
`endif
  assign T7 = io_mem_resp_bits_tag[3'h6:1'h0];
  assign T8 = io_cmd_bits_inst_funct[1'h1:1'h0];
  assign io_autl_grant_ready = 1'h0;
  assign io_autl_acquire_valid = 1'h0;
  assign io_interrupt = 1'h0;
  assign io_busy = ctrl_io_busy;
  assign io_mem_req_bits_data = T0;
  assign T0 = T6 ? T4 : T1;
  assign T1 = T2 ? dpath_io_hash_out_1 : dpath_io_hash_out_0;
  assign T2 = T3[1'h0:1'h0];
  assign T3 = T9;
  assign T9 = ctrl_io_windex[1'h1:1'h0];
  assign T4 = T5 ? dpath_io_hash_out_3 : dpath_io_hash_out_2;
  assign T5 = T3[1'h0:1'h0];
  assign T6 = T3[1'h1:1'h1];
  assign io_mem_req_bits_phys = 1'h1;
  assign io_mem_req_bits_typ = ctrl_io_dmem_req_typ;
  assign io_mem_req_bits_cmd = ctrl_io_dmem_req_cmd;
  assign io_mem_req_bits_tag = T10;
  assign T10 = {3'h0, ctrl_io_dmem_req_tag};
  assign io_mem_req_bits_addr = T11;
  assign T11 = {8'h0, ctrl_io_dmem_req_addr};
  assign io_mem_req_valid = ctrl_io_dmem_req_val;
  assign io_resp_valid = 1'h0;
  assign io_cmd_ready = ctrl_io_rocc_req_rdy;
  CtrlModule ctrl(.clk(clk), .reset(reset),
       .io_rocc_req_val( io_cmd_valid ),
       .io_rocc_req_rdy( ctrl_io_rocc_req_rdy ),
       .io_rocc_funct( T8 ),
       .io_rocc_rs1( io_cmd_bits_rs1 ),
       .io_rocc_rs2( io_cmd_bits_rs2 ),
       .io_rocc_rd( io_cmd_bits_inst_rd ),
       .io_busy( ctrl_io_busy ),
       .io_dmem_req_val( ctrl_io_dmem_req_val ),
       .io_dmem_req_rdy( io_mem_req_ready ),
       .io_dmem_req_tag( ctrl_io_dmem_req_tag ),
       .io_dmem_req_addr( ctrl_io_dmem_req_addr ),
       .io_dmem_req_cmd( ctrl_io_dmem_req_cmd ),
       .io_dmem_req_typ( ctrl_io_dmem_req_typ ),
       .io_dmem_resp_val( io_mem_resp_valid ),
       .io_dmem_resp_tag( T7 ),
       .io_dmem_resp_data( io_mem_resp_bits_data ),
       .io_round( ctrl_io_round ),
       .io_stage( ctrl_io_stage ),
       .io_absorb( ctrl_io_absorb ),
       .io_aindex( ctrl_io_aindex ),
       .io_init( ctrl_io_init ),
       .io_write( ctrl_io_write ),
       .io_windex( ctrl_io_windex ),
       .io_buffer_out( ctrl_io_buffer_out )
  );
  DpathModule dpath(.clk(clk), .reset(reset),
       .io_absorb( ctrl_io_absorb ),
       .io_init( ctrl_io_init ),
       .io_write( ctrl_io_write ),
       .io_round( ctrl_io_round ),
       .io_stage( ctrl_io_stage ),
       .io_aindex( ctrl_io_aindex ),
       .io_message_in( ctrl_io_buffer_out ),
       .io_hash_out_3( dpath_io_hash_out_3 ),
       .io_hash_out_2( dpath_io_hash_out_2 ),
       .io_hash_out_1( dpath_io_hash_out_1 ),
       .io_hash_out_0( dpath_io_hash_out_0 )
  );
endmodule


