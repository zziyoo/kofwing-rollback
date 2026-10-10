class Chunli_AI_Lv3 extends Chunli_AI
{
   var attack_rate0;
   var combo_rate0;
   var dis_array;
   var dis_num;
   var hold_rate0;
   var skill_dis;
   var wait_frame0;
   function Chunli_AI_Lv3()
   {
      super();
      this.skill_init();
      this.combo_init();
      this.combo_rate0 = 60;
      this.attack_rate0 = 42;
      this.hold_rate0 = 60;
      this.attack_s0 = 36;
      this.wait_frame0 = 60;
      this.combo_risk0 = 60;
   }
   function skill_init()
   {
      this.dis_array[0] = 100;
      this.dis_array[1] = 200;
      this.dis_array[2] = 250;
      this.dis_array[3] = 300;
      this.dis_array[4] = 400;
      this.dis_array[5] = 450;
      this.dis_array[6] = 550;
      this.dis_array[7] = 1000;
      this.skill_dis[0] = ["walk_b"];
      this.skill_dis[1] = ["walk_b"];
      this.skill_dis[2] = ["walk_f"];
      this.skill_dis[3] = ["walk_f","walk_f","roll_f","jump_b","jump_f"];
      this.skill_dis[4] = ["walk_f","walk_f","walk_f","walk_f"];
      this.skill_dis[5] = ["walk_f","walk_f","walk_f","roll_f","sk_bo"];
      this.skill_dis[6] = ["walk_f","roll_f","walk_f","walk_f","sk_bo"];
      this.skill_dis[7] = ["walk_f","walk_f","walk_f","walk_f","roll_f","walk_f","sk_bo"];
      this.dis_num = this.dis_array.length;
   }
   function combo_init()
   {
      this.combo_1 = new Object();
      this.combo_land = new Object();
      this.combo_auto = new Object();
      this.combo_burst = new Object();
      this.delay_frames = new Object();
      this.combo_1.sk_bo = ["walk_f","sk_s_fengyi","sk_huixuan","walk_f"];
      this.comboDis.sk_bo = [300,350,400,650];
      this.combo_auto.punch_l = ["squatKick_l","punch2","kick_l","punch","sk_bailietui_h","sk_bashan"];
      this.comboDis.punch_l = [80,100,150,220,330,380];
      this.combo_1.punch_l2 = ["squatKick_l","punch2","kick_l","punch","sk_bailietui_h","sk_bashan"];
      this.comboDis.punch_l2 = [80,100,150,220,330,380];
      this.combo_1.kick_l = ["kick2","punch","sk_bailietui_h","sk_bashan"];
      this.comboDis.kick_l = [100,220,350,380];
      this.combo_1.kick_l2 = ["kick2","punch","sk_bailietui_h","sk_bashan"];
      this.comboDis.kick_l2 = [100,220,350,380];
      this.combo_1.squatPunch_l = ["squatKick_l","punch2","squatKick_l","punch","sk_bailietui_h","sk_bashan"];
      this.comboDis.squatPunch_l = [80,100,150,220,350,380];
      this.combo_1.squatKick_l = ["kick_l","punch2","kick_l","punch","sk_bailietui_h","sk_bashan"];
      this.comboDis.squatKick_l = [80,100,150,220,350,380];
      this.combo_land.sk_shengtian = ["kick2","kick"];
      this.comboDis.sk_shengtian = [120,150];
      this.combo_1.kick = ["sk_bailietui","sk_shengtian","sk_bo","sk_bailietui","sk_shengtian","sk_s_fengyi","sk_s_qixing","sk_s_bo_ss"];
      this.combo_1.kick2 = ["sk_bailietui","sk_shengtian","sk_bo","sk_bailietui","sk_shengtian","sk_s_fengyi","sk_s_qixing","sk_s_bo_ss"];
      this.combo_land.jumpSkill_punch = ["squatKick_l"];
      this.combo_land.sk_bailietui_air = ["squatKick_l","jump"];
      this.combo_land.jumpSkill_punch_l = ["squatKick_l"];
      this.combo_land.jumpSkill_kick_l = ["squatKick_l"];
      this.combo_land.jumpSkill_kick = ["squatKick_l"];
      this.combo_land.jump = ["kick_s1","squatKick_l"];
      this.comboDis.jump = [150,200];
      this.combo_land.jump_f = ["kick_s1","squatKick_l"];
      this.comboDis.jump_f = [150,200];
      this.combo_land.jumpSkill_heavyHit = ["kick2","kick","sk_shengtian"];
      this.comboDis.jumpSkill_heavyHit = [120,150,200];
      this.combo_burst.punch2 = ["sk_bailietui","sk_huixuan","sk_shengtian","sk_s_bo","sk_s_fengyi","sk_s_qixing","sk_s_bo_ss"];
      this.combo_burst.squatPunch = this.combo_burst.punch2;
      this.combo_burst.sk_huixuan = ["sk_xuanyuan","sk_bailietui","sk_xuanyuan","sk_shengtian","sk_s_bo","sk_s_fengyi","sk_s_qixing","sk_s_bo_ss"];
      this.combo_burst.sk_bailietui = ["sk_xuanyuan","sk_huixuan","sk_shengtian","sk_s_bo","sk_s_fengyi","sk_s_qixing","sk_s_bo_ss"];
      this.combo_burst.sk_s_bo = ["sk_bailietui","sk_huixuan","sk_s_fengyi","sk_s_qixing","sk_s_bo_ss"];
      this.combo_burst.sk_s_fengyi = ["sk_bailietui","sk_huixuan","sk_s_bo","sk_s_qixing","sk_s_bo_ss"];
      this.action_1 = new Object();
      this.action_1.airAttack = [["kick2"],["kick"],["jump","jump_f"]];
      this.delay_frames.airAttack = [120,150,200];
      this.delay_framesL.airAttack = [125,125,75];
      this.delay_framesH.airAttack = [250,250,125];
      this.action_1.downMove = [["walk_f"]];
      this.delay_frames.downMovePower = [1000];
      this.action_1.down = [["walk_f"]];
      this.delay_frames.down = [1000];
      this.action_1.getup = [["jump_b","jump_f","jump","squatKick_l","squatPunch_l","roll_f"],["roll_f","jump","jump_f","walk_f"],["sk_huixuan_l","jump_f"],["sk_huixuan_l","jump_f","sk_huixuan","jump_f"],["sk_bo","walk_f","sk_bo","walk_f","sk_bo","walk_f","sk_huixuan"]];
      this.delay_frames.getup = [150,250,300,400,650];
      this.action_1.oppRollDown = [["roll_f","squatKick_l"],["roll_f"],["jump_f","sk_bo","sk_huixuan_l"],["sk_bo","sk_huixuan"]];
      this.delay_frames.oppRollDown = [150,350,400,650];
      this.action_1.oppLandHurt = [["punch_l","squatPunch_l","squatKick_l","jump"],["squatPunch"],["punch"],["sk_huixuan_l","kick_s1","kick_s1"],["sk_bo"]];
      this.delay_frames.oppLandHurt = [100,150,200,350,450];
      this.action_1.oppLand = [["squatKick_l","squatPunch_l","punch_l","kick_l"],["squatKick_l","squatPunch_l","punch_l","kick_l","jump","jump"]];
      this.delay_frames.oppLand = [150,200];
      this.action_1.oppRoll = [["squatPunch_l","punch_l","squatKick_l","roll_f","jump_b"],["jump_b","jump","jump_f"],["jump_f","jump_b","jump","roll_f"],["jump_b","jump_f"],["roll_b"]];
      this.delay_frames.oppRoll = [150,400,500,600,1000];
      this.action_1.oppJump = [["jump_b","jump","sk_shengtian"],["jump","jump_f","sk_s_bo","sk_s_bo_ss"],["jump","jump_b","jump_f","sk_s_bo_ss","sk_s_bo"],["jump","jump_f","sk_huixuan"],["jump_f","sk_bo","sk_bailietui_h","sk_huixuan"]];
      this.delay_frames.oppJump = [200,250,280,450,600];
      this.action_1.wander = [["roll_b","jump_b"],["jump_b","walk_f"],["walk_f"]];
      this.delay_frames.wander = [150,300,1000];
      this.action_1.defend = [["walk_b","walk_b","roll_f"],["walk_b","roll_b"],["walk_b","roll_f","jump_b","roll_b"],["walk_b"]];
      this.delay_frames.defend = [130,200,400,1000];
      this.action_1.defendAttack = [["sk_bailietui","sk_xuanyuan","sk_shengtian","sk_s_fengyi","sk_s_bo","sk_s_qixing"],["sk_bailietui_h","sk_xuanyuan","sk_s_fengyi","sk_s_bo","sk_s_bo_ss","sk_huixuan_l"],["sk_xuanyuan","sk_s_fengyi","sk_huixuan_l"]];
      this.delay_frames.defendAttack = [200,280,330];
      this.action_1.defend_f = [["squatKick_l","squatPunch_l"],["jump_b"],["roll_f"]];
      this.delay_frames.defend_f = [150,250,1000];
      this.action_1.defend_dashf = [["roll_f","squatPunch_l","squatKick_l"],["squatPunch_l"],["jump_f"],["roll_f"]];
      this.delay_frames.defend_dashf = [150,200,350,1000];
      this.action_1.defend_h = [["hold_u","hold_u","hold_u","hold_u","roll_f"],["hold_u","hold_u","hold_u","roll_b"],["hold_u"]];
      this.delay_frames.defend_h = [130,400,1000];
      this.action_1.pos_down = [["squatKick_l","jump","walk_f","squatPunch","kick_s1","kick_s1_ai"],["jump_b","walk_f","squatPunch","sk_bailietui"],["walk_f","squatKick"],["kick_s1","jump_f"],["jump_f","walk_f","walk_f"]];
      this.delay_frames.pos_down = [150,200,230,300,450];
      this.action_1.pos_up = [["jump","jump_b","walk_f","kick_s1","kick_s1_ai"],["jump_f","walk_f"],["jump_f","jump","walk_f","walk_f"]];
      this.delay_frames.pos_up = [150,250,450];
   }
}
