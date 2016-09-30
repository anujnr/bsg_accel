module AccumulatorExample(input clk, input reset,
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
    output io_mem_invalidate_lr,
    //input  io_mem_ordered
    output io_busy,
    input  io_s,
    output io_interrupt,
    input  io_autl_acquire_ready,
    output io_autl_acquire_valid,
    //output[25:0] io_autl_acquire_bits_addr_block
    //output[2:0] io_autl_acquire_bits_client_xact_id
    //output[1:0] io_autl_acquire_bits_addr_beat
    //output io_autl_acquire_bits_is_builtin_type
    //output[2:0] io_autl_acquire_bits_a_type
    //output[16:0] io_autl_acquire_bits_union
    //output[127:0] io_autl_acquire_bits_data
    output io_autl_grant_ready,
    input  io_autl_grant_valid,
    input [1:0] io_autl_grant_bits_addr_beat,
    input [2:0] io_autl_grant_bits_client_xact_id,
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

  wire T0;
  wire T1;
  wire stallResp;
  wire T2;
  wire T3;
  wire T4;
  wire stallLoad;
  wire T5;
  wire doLoad;
  wire T6;
  wire stallReg;
  wire T7;
  reg  busy_0;
  wire T61;
  wire T8;
  wire T9;
  wire T10;
  wire T11;
  wire[3:0] T12;
  wire[1:0] T13;
  wire[1:0] addr;
  wire T14;
  wire T15;
  wire T16;
  wire[3:0] T17;
  wire[1:0] T18;
  wire[1:0] memRespTag;
  reg  busy_1;
  wire T62;
  wire T19;
  wire T20;
  wire T21;
  wire T22;
  wire T23;
  wire T24;
  wire T25;
  wire T26;
  reg  busy_2;
  wire T63;
  wire T27;
  wire T28;
  wire T29;
  wire T30;
  wire T31;
  wire T32;
  reg  busy_3;
  wire T64;
  wire T33;
  wire T34;
  wire T35;
  wire T36;
  wire T37;
  wire T38;
  wire T39;
  wire T40;
  wire T41;
  wire T42;
  wire T43;
  wire T44;
  wire[9:0] T65;
  wire[39:0] T66;
  wire T45;
  wire T46;
  wire T47;
  wire T48;
  wire T49;
  wire[63:0] accum;
  reg [63:0] regfile [3:0];
  wire[63:0] T50;
  wire[63:0] T51;
  wire[63:0] wdata;
  wire[63:0] T52;
  wire doWrite;
  wire T53;
  wire T54;
  wire doAccum;
  wire T55;
  wire T56;
  wire T57;
  wire T58;
  wire T59;
  wire T60;
  wire Queue_io_enq_ready;
  wire Queue_io_deq_valid;
  wire[6:0] Queue_io_deq_bits_inst_funct;
  wire Queue_io_deq_bits_inst_xd;
  wire[4:0] Queue_io_deq_bits_inst_rd;
  wire[63:0] Queue_io_deq_bits_rs1;
  wire[63:0] Queue_io_deq_bits_rs2;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    busy_0 = {1{$random}};
    busy_1 = {1{$random}};
    busy_2 = {1{$random}};
    busy_3 = {1{$random}};
    for (initvar = 0; initvar < 4; initvar = initvar+1)
      regfile[initvar] = {2{$random}};
  end
// synthesis translate_on
`endif

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
//  assign io_mem_req_bits_kill = {1{$random}};
// synthesis translate_on
`endif
  assign T0 = T3 & T1;
  assign T1 = stallResp ^ 1'h1;
  assign stallResp = Queue_io_deq_bits_inst_xd & T2;
  assign T2 = io_resp_ready ^ 1'h1;
  assign T3 = T6 & T4;
  assign T4 = stallLoad ^ 1'h1;
  assign stallLoad = doLoad & T5;
  assign T5 = io_mem_req_ready ^ 1'h1;
  assign doLoad = Queue_io_deq_bits_inst_funct == 7'h2;
  assign T6 = stallReg ^ 1'h1;
  assign stallReg = T40 ? T26 : T7;
  assign T7 = T25 ? busy_1 : busy_0;
  assign T61 = reset ? 1'h0 : T8;
  assign T8 = T15 ? 1'h0 : T9;
  assign T9 = T10 ? 1'h1 : busy_0;
  assign T10 = T14 & T11;
  assign T11 = T12[1'h0:1'h0];
  assign T12 = 1'h1 << T13;
  assign T13 = addr;
  assign addr = Queue_io_deq_bits_rs2[1'h1:1'h0];
  assign T14 = io_mem_req_ready & io_mem_req_valid;
  assign T15 = io_mem_resp_valid & T16;
  assign T16 = T17[1'h0:1'h0];
  assign T17 = 1'h1 << T18;
  assign T18 = memRespTag;
  assign memRespTag = io_mem_resp_bits_tag[1'h1:1'h0];
  assign T62 = reset ? 1'h0 : T19;
  assign T19 = T23 ? 1'h0 : T20;
  assign T20 = T21 ? 1'h1 : busy_1;
  assign T21 = T14 & T22;
  assign T22 = T12[1'h1:1'h1];
  assign T23 = io_mem_resp_valid & T24;
  assign T24 = T17[1'h1:1'h1];
  assign T25 = T13[1'h0:1'h0];
  assign T26 = T39 ? busy_3 : busy_2;
  assign T63 = reset ? 1'h0 : T27;
  assign T27 = T31 ? 1'h0 : T28;
  assign T28 = T29 ? 1'h1 : busy_2;
  assign T29 = T14 & T30;
  assign T30 = T12[2'h2:2'h2];
  assign T31 = io_mem_resp_valid & T32;
  assign T32 = T17[2'h2:2'h2];
  assign T64 = reset ? 1'h0 : T33;
  assign T33 = T37 ? 1'h0 : T34;
  assign T34 = T35 ? 1'h1 : busy_3;
  assign T35 = T14 & T36;
  assign T36 = T12[2'h3:2'h3];
  assign T37 = io_mem_resp_valid & T38;
  assign T38 = T17[2'h3:2'h3];
  assign T39 = T13[1'h0:1'h0];
  assign T40 = T13[1'h1:1'h1];
  assign io_autl_grant_ready = 1'h0;
  assign io_autl_acquire_valid = 1'h0;
  assign io_interrupt = 1'h0;
  assign io_busy = T41;
  assign T41 = Queue_io_deq_valid | T42;
  assign T42 = T43 | busy_3;
  assign T43 = T44 | busy_2;
  assign T44 = busy_0 | busy_1;
  assign io_mem_invalidate_lr = 1'h0;
  assign io_mem_req_bits_data = 64'h0;
  assign io_mem_req_bits_phys = 1'h1;
  assign io_mem_req_bits_typ = 3'h3;
  assign io_mem_req_bits_cmd = 5'h0;
  assign io_mem_req_bits_tag = T65;
  assign T65 = {8'h0, addr};
  assign io_mem_req_bits_addr = T66;
  assign T66 = Queue_io_deq_bits_rs1[6'h27:1'h0];
  assign io_mem_req_valid = T45;
  assign T45 = T47 & T46;
  assign T46 = stallResp ^ 1'h1;
  assign T47 = T49 & T48;
  assign T48 = stallReg ^ 1'h1;
  assign T49 = Queue_io_deq_valid & doLoad;
  assign io_resp_bits_data = accum;
  assign accum = regfile[addr];
  assign wdata = doWrite ? Queue_io_deq_bits_rs1 : T52;
  assign T52 = accum + Queue_io_deq_bits_rs1;
  assign doWrite = Queue_io_deq_bits_inst_funct == 7'h0;
  assign T53 = T55 & T54;
  assign T54 = doWrite | doAccum;
  assign doAccum = Queue_io_deq_bits_inst_funct == 7'h3;
  assign T55 = T0 & Queue_io_deq_valid;
  assign io_resp_bits_rd = Queue_io_deq_bits_inst_rd;
  assign io_resp_valid = T56;
  assign T56 = T58 & T57;
  assign T57 = stallLoad ^ 1'h1;
  assign T58 = T60 & T59;
  assign T59 = stallReg ^ 1'h1;
  assign T60 = Queue_io_deq_valid & Queue_io_deq_bits_inst_xd;
  assign io_cmd_ready = Queue_io_enq_ready;
  Queue_10 Queue(.clk(clk), .reset(reset),
       .io_enq_ready( Queue_io_enq_ready ),
       .io_enq_valid( io_cmd_valid ),
       .io_enq_bits_inst_funct( io_cmd_bits_inst_funct ),
       .io_enq_bits_inst_rs2( io_cmd_bits_inst_rs2 ),
       .io_enq_bits_inst_rs1( io_cmd_bits_inst_rs1 ),
       .io_enq_bits_inst_xd( io_cmd_bits_inst_xd ),
       .io_enq_bits_inst_xs1( io_cmd_bits_inst_xs1 ),
       .io_enq_bits_inst_xs2( io_cmd_bits_inst_xs2 ),
       .io_enq_bits_inst_rd( io_cmd_bits_inst_rd ),
       .io_enq_bits_inst_opcode( io_cmd_bits_inst_opcode ),
       .io_enq_bits_rs1( io_cmd_bits_rs1 ),
       .io_enq_bits_rs2( io_cmd_bits_rs2 ),
       .io_deq_ready( T0 ),
       .io_deq_valid( Queue_io_deq_valid ),
       .io_deq_bits_inst_funct( Queue_io_deq_bits_inst_funct ),
       //.io_deq_bits_inst_rs2(  )
       //.io_deq_bits_inst_rs1(  )
       .io_deq_bits_inst_xd( Queue_io_deq_bits_inst_xd ),
       //.io_deq_bits_inst_xs1(  )
       //.io_deq_bits_inst_xs2(  )
       .io_deq_bits_inst_rd( Queue_io_deq_bits_inst_rd ),
       //.io_deq_bits_inst_opcode(  )
       .io_deq_bits_rs1( Queue_io_deq_bits_rs1 ),
       .io_deq_bits_rs2( Queue_io_deq_bits_rs2 )
       //.io_count(  )
  );

  always @(posedge clk) begin
    if(reset) begin
      busy_0 <= 1'h0;
    end else if(T15) begin
      busy_0 <= 1'h0;
    end else if(T10) begin
      busy_0 <= 1'h1;
    end
    if(reset) begin
      busy_1 <= 1'h0;
    end else if(T23) begin
      busy_1 <= 1'h0;
    end else if(T21) begin
      busy_1 <= 1'h1;
    end
    if(reset) begin
      busy_2 <= 1'h0;
    end else if(T31) begin
      busy_2 <= 1'h0;
    end else if(T29) begin
      busy_2 <= 1'h1;
    end
    if(reset) begin
      busy_3 <= 1'h0;
    end else if(T37) begin
      busy_3 <= 1'h0;
    end else if(T35) begin
      busy_3 <= 1'h1;
    end
    if (io_mem_resp_valid)
      regfile[memRespTag] <= io_mem_resp_bits_data;
    if (T53)
      regfile[addr] <= wdata;
  end
endmodule


