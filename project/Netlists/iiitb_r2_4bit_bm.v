/* Generated by Yosys 0.20+70 (git sha1 6e907acf86d, gcc 8.3.1 -fPIC -Os) */

module iiitb_r2_4bit_bm(clk, load, reset, M, Q, P);
  wire _000_;
  wire _001_;
  wire _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  wire _078_;
  wire _079_;
  wire _080_;
  wire _081_;
  wire _082_;
  wire _083_;
  wire _084_;
  wire _085_;
  wire _086_;
  wire _087_;
  wire _088_;
  wire _089_;
  wire _090_;
  wire _091_;
  wire _092_;
  wire _093_;
  wire _094_;
  wire _095_;
  wire _096_;
  wire _097_;
  wire _098_;
  wire _099_;
  wire _100_;
  wire _101_;
  wire _102_;
  wire _103_;
  wire _104_;
  wire _105_;
  wire _106_;
  wire _107_;
  wire _108_;
  wire _109_;
  wire _110_;
  wire _111_;
  wire _112_;
  wire _113_;
  wire _114_;
  wire _115_;
  wire _116_;
  wire \A[0] ;
  wire \A[1] ;
  wire \A[2] ;
  wire \A[3] ;
  wire \Count[0] ;
  wire \Count[1] ;
  wire \Count[2] ;
  input [3:0] M;
  wire [3:0] M;
  wire \M_temp[0] ;
  wire \M_temp[1] ;
  wire \M_temp[2] ;
  wire \M_temp[3] ;
  output [7:0] P;
  wire [7:0] P;
  input [3:0] Q;
  wire [3:0] Q;
  wire Q_minus_one;
  wire \Q_temp[0] ;
  wire \Q_temp[1] ;
  wire \Q_temp[2] ;
  wire \Q_temp[3] ;
  input clk;
  wire clk;
  input load;
  wire load;
  input reset;
  wire reset;
  sky130_fd_sc_hd__inv_2 _117_ (
    .A(load),
    .Y(_065_)
  );
  sky130_fd_sc_hd__buf_1 _118_ (
    .A(_065_),
    .X(_066_)
  );
  sky130_fd_sc_hd__buf_1 _119_ (
    .A(_066_),
    .X(_067_)
  );
  sky130_fd_sc_hd__inv_2 _120_ (
    .A(reset),
    .Y(_068_)
  );
  sky130_fd_sc_hd__buf_1 _121_ (
    .A(load),
    .X(_069_)
  );
  sky130_fd_sc_hd__nor3_2 _122_ (
    .A(\Count[2] ),
    .B(\Count[1] ),
    .C(\Count[0] ),
    .Y(_070_)
  );
  sky130_fd_sc_hd__buf_1 _123_ (
    .A(_070_),
    .X(_071_)
  );
  sky130_fd_sc_hd__mux2_2 _124_ (
    .A0(\Q_temp[1] ),
    .A1(\Q_temp[0] ),
    .S(_071_),
    .X(_072_)
  );
  sky130_fd_sc_hd__or2_2 _125_ (
    .A(_069_),
    .B(_072_),
    .X(_073_)
  );
  sky130_fd_sc_hd__o211a_2 _126_ (
    .A1(Q[0]),
    .A2(_067_),
    .B1(_068_),
    .C1(_073_),
    .X(_004_)
  );
  sky130_fd_sc_hd__buf_1 _127_ (
    .A(_069_),
    .X(_074_)
  );
  sky130_fd_sc_hd__mux2_2 _128_ (
    .A0(\Q_temp[2] ),
    .A1(\Q_temp[1] ),
    .S(_071_),
    .X(_075_)
  );
  sky130_fd_sc_hd__or2_2 _129_ (
    .A(Q[1]),
    .B(_066_),
    .X(_076_)
  );
  sky130_fd_sc_hd__o211a_2 _130_ (
    .A1(_074_),
    .A2(_075_),
    .B1(_076_),
    .C1(_068_),
    .X(_005_)
  );
  sky130_fd_sc_hd__mux2_2 _131_ (
    .A0(\Q_temp[3] ),
    .A1(\Q_temp[2] ),
    .S(_071_),
    .X(_077_)
  );
  sky130_fd_sc_hd__or2_2 _132_ (
    .A(Q[2]),
    .B(_065_),
    .X(_078_)
  );
  sky130_fd_sc_hd__o211a_2 _133_ (
    .A1(_074_),
    .A2(_077_),
    .B1(_078_),
    .C1(_068_),
    .X(_006_)
  );
  sky130_fd_sc_hd__nand2_2 _134_ (
    .A(\M_temp[0] ),
    .B(\A[0] ),
    .Y(_079_)
  );
  sky130_fd_sc_hd__buf_1 _135_ (
    .A(\M_temp[0] ),
    .X(_080_)
  );
  sky130_fd_sc_hd__buf_1 _136_ (
    .A(\A[0] ),
    .X(_081_)
  );
  sky130_fd_sc_hd__or2_2 _137_ (
    .A(_080_),
    .B(_081_),
    .X(_082_)
  );
  sky130_fd_sc_hd__buf_1 _138_ (
    .A(\Count[2] ),
    .X(_083_)
  );
  sky130_fd_sc_hd__buf_1 _139_ (
    .A(\Count[0] ),
    .X(_084_)
  );
  sky130_fd_sc_hd__nor2b_2 _140_ (
    .A(\Q_temp[0] ),
    .B_N(Q_minus_one),
    .Y(_085_)
  );
  sky130_fd_sc_hd__and2b_2 _141_ (
    .A_N(Q_minus_one),
    .B(\Q_temp[0] ),
    .X(_086_)
  );
  sky130_fd_sc_hd__o32a_2 _142_ (
    .A1(_083_),
    .A2(\Count[1] ),
    .A3(_084_),
    .B1(_085_),
    .B2(_086_),
    .X(_087_)
  );
  sky130_fd_sc_hd__and3_2 _143_ (
    .A(_079_),
    .B(_082_),
    .C(_087_),
    .X(_088_)
  );
  sky130_fd_sc_hd__nor3_2 _144_ (
    .A(_070_),
    .B(_085_),
    .C(_086_),
    .Y(_089_)
  );
  sky130_fd_sc_hd__a221o_2 _145_ (
    .A1(\Q_temp[3] ),
    .A2(_071_),
    .B1(_089_),
    .B2(_081_),
    .C1(_069_),
    .X(_090_)
  );
  sky130_fd_sc_hd__o221a_2 _146_ (
    .A1(_066_),
    .A2(Q[3]),
    .B1(_088_),
    .B2(_090_),
    .C1(_068_),
    .X(_007_)
  );
  sky130_fd_sc_hd__buf_1 _147_ (
    .A(\A[1] ),
    .X(_091_)
  );
  sky130_fd_sc_hd__a21o_2 _148_ (
    .A1(_091_),
    .A2(_089_),
    .B1(_069_),
    .X(_092_)
  );
  sky130_fd_sc_hd__or2b_2 _149_ (
    .A(\M_temp[1] ),
    .B_N(_091_),
    .X(_093_)
  );
  sky130_fd_sc_hd__nand2b_2 _150_ (
    .A_N(\A[1] ),
    .B(\M_temp[1] ),
    .Y(_094_)
  );
  sky130_fd_sc_hd__nand2_2 _151_ (
    .A(_093_),
    .B(_094_),
    .Y(_095_)
  );
  sky130_fd_sc_hd__o31ai_2 _152_ (
    .A1(\Count[2] ),
    .A2(\Count[1] ),
    .A3(_084_),
    .B1(_085_),
    .Y(_096_)
  );
  sky130_fd_sc_hd__a31o_2 _153_ (
    .A1(_079_),
    .A2(_093_),
    .A3(_094_),
    .B1(_096_),
    .X(_097_)
  );
  sky130_fd_sc_hd__a31o_2 _154_ (
    .A1(_080_),
    .A2(_081_),
    .A3(_095_),
    .B1(_097_),
    .X(_098_)
  );
  sky130_fd_sc_hd__o31ai_2 _155_ (
    .A1(\Count[2] ),
    .A2(\Count[1] ),
    .A3(_084_),
    .B1(_086_),
    .Y(_099_)
  );
  sky130_fd_sc_hd__a21oi_2 _156_ (
    .A1(_095_),
    .A2(_080_),
    .B1(_099_),
    .Y(_100_)
  );
  sky130_fd_sc_hd__inv_2 _157_ (
    .A(_081_),
    .Y(_101_)
  );
  sky130_fd_sc_hd__a211o_2 _158_ (
    .A1(_080_),
    .A2(_101_),
    .B1(_099_),
    .C1(_095_),
    .X(_102_)
  );
  sky130_fd_sc_hd__o211ai_2 _159_ (
    .A1(_081_),
    .A2(_100_),
    .B1(_102_),
    .C1(_096_),
    .Y(_103_)
  );
  sky130_fd_sc_hd__a21oi_2 _160_ (
    .A1(_098_),
    .A2(_103_),
    .B1(_089_),
    .Y(_104_)
  );
  sky130_fd_sc_hd__buf_1 _161_ (
    .A(reset),
    .X(_105_)
  );
  sky130_fd_sc_hd__a21oi_2 _162_ (
    .A1(_101_),
    .A2(_074_),
    .B1(_105_),
    .Y(_106_)
  );
  sky130_fd_sc_hd__o21a_2 _163_ (
    .A1(_092_),
    .A2(_104_),
    .B1(_106_),
    .X(_000_)
  );
  sky130_fd_sc_hd__or3_2 _164_ (
    .A(_070_),
    .B(_085_),
    .C(_086_),
    .X(_107_)
  );
  sky130_fd_sc_hd__buf_1 _165_ (
    .A(\A[2] ),
    .X(_108_)
  );
  sky130_fd_sc_hd__and2b_2 _166_ (
    .A_N(\M_temp[2] ),
    .B(_108_),
    .X(_109_)
  );
  sky130_fd_sc_hd__and2b_2 _167_ (
    .A_N(_108_),
    .B(\M_temp[2] ),
    .X(_110_)
  );
  sky130_fd_sc_hd__and2_2 _168_ (
    .A(\M_temp[1] ),
    .B(_091_),
    .X(_111_)
  );
  sky130_fd_sc_hd__a21oi_2 _169_ (
    .A1(_093_),
    .A2(_094_),
    .B1(_079_),
    .Y(_112_)
  );
  sky130_fd_sc_hd__o22a_2 _170_ (
    .A1(_109_),
    .A2(_110_),
    .B1(_111_),
    .B2(_112_),
    .X(_113_)
  );
  sky130_fd_sc_hd__or2b_2 _171_ (
    .A(\M_temp[2] ),
    .B_N(\A[2] ),
    .X(_114_)
  );
  sky130_fd_sc_hd__or2b_2 _172_ (
    .A(\A[2] ),
    .B_N(\M_temp[2] ),
    .X(_115_)
  );
  sky130_fd_sc_hd__nand2_2 _173_ (
    .A(_114_),
    .B(_115_),
    .Y(_116_)
  );
  sky130_fd_sc_hd__a311oi_2 _174_ (
    .A1(_095_),
    .A2(_081_),
    .A3(_080_),
    .B1(_111_),
    .C1(_116_),
    .Y(_016_)
  );
  sky130_fd_sc_hd__buf_1 _175_ (
    .A(\Count[1] ),
    .X(_017_)
  );
  sky130_fd_sc_hd__o31a_2 _176_ (
    .A1(_083_),
    .A2(_017_),
    .A3(_084_),
    .B1(_085_),
    .X(_018_)
  );
  sky130_fd_sc_hd__o21ai_2 _177_ (
    .A1(_113_),
    .A2(_016_),
    .B1(_018_),
    .Y(_019_)
  );
  sky130_fd_sc_hd__and2b_2 _178_ (
    .A_N(\M_temp[1] ),
    .B(_091_),
    .X(_020_)
  );
  sky130_fd_sc_hd__or2b_2 _179_ (
    .A(\A[0] ),
    .B_N(\M_temp[0] ),
    .X(_021_)
  );
  sky130_fd_sc_hd__o2111ai_2 _180_ (
    .A1(_020_),
    .A2(_021_),
    .B1(_114_),
    .C1(_094_),
    .D1(_115_),
    .Y(_022_)
  );
  sky130_fd_sc_hd__o21ai_2 _181_ (
    .A1(_020_),
    .A2(_021_),
    .B1(_094_),
    .Y(_023_)
  );
  sky130_fd_sc_hd__o21ai_2 _182_ (
    .A1(_109_),
    .A2(_110_),
    .B1(_023_),
    .Y(_024_)
  );
  sky130_fd_sc_hd__a21o_2 _183_ (
    .A1(_022_),
    .A2(_024_),
    .B1(_099_),
    .X(_025_)
  );
  sky130_fd_sc_hd__o2111ai_2 _184_ (
    .A1(_091_),
    .A2(_087_),
    .B1(_107_),
    .C1(_019_),
    .D1(_025_),
    .Y(_026_)
  );
  sky130_fd_sc_hd__a21oi_2 _185_ (
    .A1(_108_),
    .A2(_089_),
    .B1(_074_),
    .Y(_027_)
  );
  sky130_fd_sc_hd__buf_1 _186_ (
    .A(reset),
    .X(_028_)
  );
  sky130_fd_sc_hd__o21bai_2 _187_ (
    .A1(_091_),
    .A2(_066_),
    .B1_N(_028_),
    .Y(_029_)
  );
  sky130_fd_sc_hd__a21oi_2 _188_ (
    .A1(_026_),
    .A2(_027_),
    .B1(_029_),
    .Y(_001_)
  );
  sky130_fd_sc_hd__o22ai_2 _189_ (
    .A1(_109_),
    .A2(_110_),
    .B1(_111_),
    .B2(_112_),
    .Y(_030_)
  );
  sky130_fd_sc_hd__nand2_2 _190_ (
    .A(\M_temp[2] ),
    .B(_108_),
    .Y(_031_)
  );
  sky130_fd_sc_hd__and2_2 _191_ (
    .A(\M_temp[3] ),
    .B(\A[3] ),
    .X(_032_)
  );
  sky130_fd_sc_hd__buf_1 _192_ (
    .A(\A[3] ),
    .X(_033_)
  );
  sky130_fd_sc_hd__nor2_2 _193_ (
    .A(\M_temp[3] ),
    .B(_033_),
    .Y(_034_)
  );
  sky130_fd_sc_hd__nor2_2 _194_ (
    .A(_032_),
    .B(_034_),
    .Y(_035_)
  );
  sky130_fd_sc_hd__a21oi_2 _195_ (
    .A1(_030_),
    .A2(_031_),
    .B1(_035_),
    .Y(_036_)
  );
  sky130_fd_sc_hd__a31o_2 _196_ (
    .A1(_030_),
    .A2(_031_),
    .A3(_035_),
    .B1(_096_),
    .X(_037_)
  );
  sky130_fd_sc_hd__and2b_2 _197_ (
    .A_N(_033_),
    .B(\M_temp[3] ),
    .X(_038_)
  );
  sky130_fd_sc_hd__and2b_2 _198_ (
    .A_N(\M_temp[3] ),
    .B(_033_),
    .X(_039_)
  );
  sky130_fd_sc_hd__o2bb2ai_2 _199_ (
    .A1_N(_114_),
    .A2_N(_022_),
    .B1(_038_),
    .B2(_039_),
    .Y(_040_)
  );
  sky130_fd_sc_hd__o31a_2 _200_ (
    .A1(_083_),
    .A2(_017_),
    .A3(_084_),
    .B1(_086_),
    .X(_041_)
  );
  sky130_fd_sc_hd__o211ai_2 _201_ (
    .A1(_032_),
    .A2(_034_),
    .B1(_114_),
    .C1(_022_),
    .Y(_042_)
  );
  sky130_fd_sc_hd__o21ai_2 _202_ (
    .A1(_108_),
    .A2(_087_),
    .B1(_107_),
    .Y(_043_)
  );
  sky130_fd_sc_hd__a31oi_2 _203_ (
    .A1(_040_),
    .A2(_041_),
    .A3(_042_),
    .B1(_043_),
    .Y(_044_)
  );
  sky130_fd_sc_hd__o21ai_2 _204_ (
    .A1(_036_),
    .A2(_037_),
    .B1(_044_),
    .Y(_045_)
  );
  sky130_fd_sc_hd__buf_1 _205_ (
    .A(load),
    .X(_046_)
  );
  sky130_fd_sc_hd__a21oi_2 _206_ (
    .A1(_033_),
    .A2(_089_),
    .B1(_046_),
    .Y(_047_)
  );
  sky130_fd_sc_hd__o21bai_2 _207_ (
    .A1(_108_),
    .A2(_066_),
    .B1_N(_028_),
    .Y(_048_)
  );
  sky130_fd_sc_hd__a21oi_2 _208_ (
    .A1(_045_),
    .A2(_047_),
    .B1(_048_),
    .Y(_002_)
  );
  sky130_fd_sc_hd__nor2_2 _209_ (
    .A(_033_),
    .B(_087_),
    .Y(_049_)
  );
  sky130_fd_sc_hd__a31oi_2 _210_ (
    .A1(_040_),
    .A2(_041_),
    .A3(_042_),
    .B1(_049_),
    .Y(_050_)
  );
  sky130_fd_sc_hd__o21ai_2 _211_ (
    .A1(_036_),
    .A2(_037_),
    .B1(_050_),
    .Y(_051_)
  );
  sky130_fd_sc_hd__o21bai_2 _212_ (
    .A1(_033_),
    .A2(_066_),
    .B1_N(_028_),
    .Y(_052_)
  );
  sky130_fd_sc_hd__a21oi_2 _213_ (
    .A1(_067_),
    .A2(_051_),
    .B1(_052_),
    .Y(_003_)
  );
  sky130_fd_sc_hd__buf_1 _214_ (
    .A(_084_),
    .X(_053_)
  );
  sky130_fd_sc_hd__o31a_2 _215_ (
    .A1(_083_),
    .A2(_017_),
    .A3(_053_),
    .B1(_065_),
    .X(_054_)
  );
  sky130_fd_sc_hd__o21ba_2 _216_ (
    .A1(Q_minus_one),
    .A2(_054_),
    .B1_N(_028_),
    .X(_055_)
  );
  sky130_fd_sc_hd__o31a_2 _217_ (
    .A1(_074_),
    .A2(\Q_temp[0] ),
    .A3(_071_),
    .B1(_055_),
    .X(_008_)
  );
  sky130_fd_sc_hd__o21ba_2 _218_ (
    .A1(_046_),
    .A2(_080_),
    .B1_N(_105_),
    .X(_056_)
  );
  sky130_fd_sc_hd__o21a_2 _219_ (
    .A1(_067_),
    .A2(M[0]),
    .B1(_056_),
    .X(_009_)
  );
  sky130_fd_sc_hd__o21ba_2 _220_ (
    .A1(_046_),
    .A2(\M_temp[1] ),
    .B1_N(_105_),
    .X(_057_)
  );
  sky130_fd_sc_hd__o21a_2 _221_ (
    .A1(_067_),
    .A2(M[1]),
    .B1(_057_),
    .X(_010_)
  );
  sky130_fd_sc_hd__o21ba_2 _222_ (
    .A1(_046_),
    .A2(\M_temp[2] ),
    .B1_N(_028_),
    .X(_058_)
  );
  sky130_fd_sc_hd__o21a_2 _223_ (
    .A1(_067_),
    .A2(M[2]),
    .B1(_058_),
    .X(_011_)
  );
  sky130_fd_sc_hd__o21ba_2 _224_ (
    .A1(_046_),
    .A2(\M_temp[3] ),
    .B1_N(_028_),
    .X(_059_)
  );
  sky130_fd_sc_hd__o21a_2 _225_ (
    .A1(_067_),
    .A2(M[3]),
    .B1(_059_),
    .X(_012_)
  );
  sky130_fd_sc_hd__nand2_2 _226_ (
    .A(_074_),
    .B(_053_),
    .Y(_060_)
  );
  sky130_fd_sc_hd__or3_2 _227_ (
    .A(_069_),
    .B(_053_),
    .C(_071_),
    .X(_061_)
  );
  sky130_fd_sc_hd__a21oi_2 _228_ (
    .A1(_060_),
    .A2(_061_),
    .B1(_105_),
    .Y(_013_)
  );
  sky130_fd_sc_hd__o21ai_2 _229_ (
    .A1(_046_),
    .A2(_053_),
    .B1(_017_),
    .Y(_062_)
  );
  sky130_fd_sc_hd__or4b_2 _230_ (
    .A(load),
    .B(_017_),
    .C(_053_),
    .D_N(_083_),
    .X(_063_)
  );
  sky130_fd_sc_hd__a21oi_2 _231_ (
    .A1(_062_),
    .A2(_063_),
    .B1(_105_),
    .Y(_014_)
  );
  sky130_fd_sc_hd__or3_2 _232_ (
    .A(_069_),
    .B(_017_),
    .C(_053_),
    .X(_064_)
  );
  sky130_fd_sc_hd__a21o_2 _233_ (
    .A1(_064_),
    .A2(_083_),
    .B1(_105_),
    .X(_015_)
  );
  sky130_fd_sc_hd__dfxtp_2 _234_ (
    .CLK(clk),
    .D(_000_),
    .Q(\A[0] )
  );
  sky130_fd_sc_hd__dfxtp_2 _235_ (
    .CLK(clk),
    .D(_001_),
    .Q(\A[1] )
  );
  sky130_fd_sc_hd__dfxtp_2 _236_ (
    .CLK(clk),
    .D(_002_),
    .Q(\A[2] )
  );
  sky130_fd_sc_hd__dfxtp_2 _237_ (
    .CLK(clk),
    .D(_003_),
    .Q(\A[3] )
  );
  sky130_fd_sc_hd__dfxtp_2 _238_ (
    .CLK(clk),
    .D(_004_),
    .Q(P[0])
  );
  sky130_fd_sc_hd__dfxtp_2 _239_ (
    .CLK(clk),
    .D(_005_),
    .Q(P[1])
  );
  sky130_fd_sc_hd__dfxtp_2 _240_ (
    .CLK(clk),
    .D(_006_),
    .Q(P[2])
  );
  sky130_fd_sc_hd__dfxtp_2 _241_ (
    .CLK(clk),
    .D(_007_),
    .Q(P[3])
  );
  sky130_fd_sc_hd__dfxtp_2 _242_ (
    .CLK(clk),
    .D(_000_),
    .Q(P[4])
  );
  sky130_fd_sc_hd__dfxtp_2 _243_ (
    .CLK(clk),
    .D(_001_),
    .Q(P[5])
  );
  sky130_fd_sc_hd__dfxtp_2 _244_ (
    .CLK(clk),
    .D(_002_),
    .Q(P[6])
  );
  sky130_fd_sc_hd__dfxtp_2 _245_ (
    .CLK(clk),
    .D(_003_),
    .Q(P[7])
  );
  sky130_fd_sc_hd__dfxtp_2 _246_ (
    .CLK(clk),
    .D(_008_),
    .Q(Q_minus_one)
  );
  sky130_fd_sc_hd__dfxtp_2 _247_ (
    .CLK(clk),
    .D(_004_),
    .Q(\Q_temp[0] )
  );
  sky130_fd_sc_hd__dfxtp_2 _248_ (
    .CLK(clk),
    .D(_005_),
    .Q(\Q_temp[1] )
  );
  sky130_fd_sc_hd__dfxtp_2 _249_ (
    .CLK(clk),
    .D(_006_),
    .Q(\Q_temp[2] )
  );
  sky130_fd_sc_hd__dfxtp_2 _250_ (
    .CLK(clk),
    .D(_007_),
    .Q(\Q_temp[3] )
  );
  sky130_fd_sc_hd__dfxtp_2 _251_ (
    .CLK(clk),
    .D(_009_),
    .Q(\M_temp[0] )
  );
  sky130_fd_sc_hd__dfxtp_2 _252_ (
    .CLK(clk),
    .D(_010_),
    .Q(\M_temp[1] )
  );
  sky130_fd_sc_hd__dfxtp_2 _253_ (
    .CLK(clk),
    .D(_011_),
    .Q(\M_temp[2] )
  );
  sky130_fd_sc_hd__dfxtp_2 _254_ (
    .CLK(clk),
    .D(_012_),
    .Q(\M_temp[3] )
  );
  sky130_fd_sc_hd__dfxtp_2 _255_ (
    .CLK(clk),
    .D(_013_),
    .Q(\Count[0] )
  );
  sky130_fd_sc_hd__dfxtp_2 _256_ (
    .CLK(clk),
    .D(_014_),
    .Q(\Count[1] )
  );
  sky130_fd_sc_hd__dfxtp_2 _257_ (
    .CLK(clk),
    .D(_015_),
    .Q(\Count[2] )
  );
endmodule
