class Type2_Chunli_AI_Lv2 extends Type2_Chunli_AI
{
   var attack_rate0;
   var combo_rate0;
   var dis_array;
   var dis_num;
   var hold_rate0;
   var skill_dis;
   var wait_frame0;
   function Type2_Chunli_AI_Lv2()
   {
      super();
      this.skill_init();
      this.combo_init();
      this.combo_rate0 = 30;
      this.attack_rate0 = 40;
      this.hold_rate0 = 40;
      this.attack_s0 = 15;
      this.wait_frame0 = 25;
      this.combo_risk0 = 50;
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
      this.skill_dis[0] = ["walk_b","squatKick_l","squatPunch","squatKick","squatPunch_l","punch_l","punch","kick","kick_l","sk_s_qianlie_air","sk_s_bo2","sk_s_tianxing","sk_s_zuhe"];
      this.skill_dis[1] = ["walk_b","squatKick_l","squatPunch","squatKick","squatPunch_l","punch_l","punch","kick","kick_l","sk_s_qianlie_air","sk_s_bo2","sk_s_tianxing","sk_s_zuhe"];
      this.skill_dis[2] = ["roll_f","jump_f","squatKick_l","squatPunch","squatKick","squatPunch_l","punch_l","punch","kick","kick_l","sk_s_qianlie_air","sk_s_bo2","sk_s_tianxing","sk_s_zuhe"];
      this.skill_dis[3] = ["walk_f","roll_f","walk_f","jump_b","sk_s_qianlie_air","sk_s_bo2","sk_s_tianxing","sk_s_zuhe"];
      this.skill_dis[4] = ["walk_f","walk_f","roll_f","walk_f","jump_f","sk_s_bo2","sk_s_tianxing"];
      this.skill_dis[5] = ["walk_f","walk_f","walk_f","walk_f","sk_s_bo2"];
      this.skill_dis[6] = ["walk_f","walk_f","walk_f","walk_f","sk_s_bo2"];
      this.skill_dis[7] = ["walk_f","walk_f","roll_f","walk_f","walk_f","walk_f","sk_s_bo2"];
      this.dis_num = this.dis_array.length;
   }
   function combo_init()
   {
      this.combo_1 = new Object();
      this.combo_land = new Object();
      this.combo_auto = new Object();
      this.combo_burst = new Object();
      this.delay_frames = new Object();
      this.combo_oppOnEgde = new Object();
      this.combo_1.sk_s_bo2 = ["walk_f"];
      this.comboDis.sk_s_bo2 = [400];
      this.combo_1.punch_l = ["sk_huixuan2"];
      this.combo_1.punch_l2 = ["sk_huixuan2"];
      this.combo_1.squatPunch_l = ["squatKick_l","punch2","squatKick_l","punch","sk_huixuan2","sk_bailietui2","sk_bashan"];
      this.comboDis.squatPunch_l = [80,100,150,200,250,330,380];
      this.combo_1.squatKick_l = ["punch_l","punch2","punch_l","punch","sk_bailietui2","sk_bashan"];
      this.comboDis.squatKick_l = [80,100,150,200,330,380];
      this.combo_1.kick_l = ["sk_huixuan2"];
      this.combo_1.kick_l2 = ["sk_huixuan2"];
      this.combo_1.kick = ["sk_bailietui2","sk_huixuan2","sk_bo2","sk_bailietui2","sk_huixuan2","sk_s_qianlie_air","sk_s_zuhe","sk_s_tianxing"];
      this.combo_1.kick2 = ["sk_bailietui2","sk_huixuan2","sk_bo2","sk_bailietui2","sk_huixuan2","sk_s_qianlie_air","sk_s_zuhe","sk_s_tianxing"];
      this.combo_land.jumpSkill_punch = ["squatKick_l"];
      this.combo_land.jumpSkill_punch_l = ["squatKick_l"];
      this.combo_land.jumpSkill_kick_l = ["squatKick_l"];
      this.combo_land.jumpSkill_kick = ["squatKick_l"];
      this.combo_land.jumpSkill_heavyHit = ["kick2","kick","sk_huixuan2"];
      this.comboDis.jumpSkill_heavyHit = [120,150,200];
      this.comboHeightL.jumpSkill_heavyHit = [175,175,150];
      this.comboHeightH.jumpSkill_heavyHit = [225,225,200];
      this.combo_burst.sk_bailietui2 = ["sk_xuanyuan","sk_huixuan2","sk_huixuan2","sk_s_bo2","sk_s_qianlie_air","sk_s_zuhe","sk_s_tianxing"];
      this.combo_burst.sk_s_bo2 = ["sk_bailietui2","sk_s_qianlie_air","sk_s_zuhe","sk_s_tianxing"];
      this.action_1 = new Object();
      this.action_1.airAttack = [["kick","jump_f"],["sk_shengtian","sk_huixuan2"],["punch_l","kick_l"],["jump_f","sk_shengtian","sk_huixuan2","sk_s_qianlie_air"]];
      this.delay_frames.airAttack = [150,200,200,250];
      this.delay_framesL.airAttack = [150,100,50,150];
      this.delay_framesH.airAttack = [225,150,100,1000];
      this.action_1.downMove = [["walk_f"]];
      this.delay_frames.downMovePower = [1000];
      this.action_1.down = [["walk_f"]];
      this.delay_frames.down = [1000];
      this.action_1.getup = [["jump_b","jump_f","jump","squatKick_l","squatPunch_l","roll_f"],["roll_f","jump","jump_f","walk_f"],["walk_f","jump_f","sk_bo2"],["jump_f","walk_f"]];
      this.delay_frames.getup = [150,200,230,400];
      this.action_1.oppRollDown = [["roll_f","squatKick_l"],["roll_f","sk_bo2"],["roll_f"],["jump_f"]];
      this.delay_frames.oppRollDown = [150,230,350,400];
      this.action_1.oppLandHurt = [["punch_l","squatPunch_l","squatKick_l","jump"],["kick_l","punch_l"],["punch_l"]];
      this.delay_frames.oppLandHurt = [100,130,180];
      this.action_1.oppLand = [["squatKick_l","squatPunch_l","punch_l","kick_l"]];
      this.delay_frames.oppLand = [180];
      this.action_1.oppRoll = [["squatPunch_l","punch_l","squatKick_l","roll_f","jump_b"],["jump_b","jump","jump_f"],["jump_f","jump_b","jump","roll_f"],["jump_b","jump_f"],["roll_b"]];
      this.delay_frames.oppRoll = [150,400,500,600,1000];
      this.action_1.oppJump = [["jump_b","jump","sk_huixuan2","sk_shengtian"],["jump","jump_f","sk_s_tianxing","sk_s_qianlie_air"],["jump","jump_b","jump_f","sk_s_tianxing","sk_s_qianlie_air"],["jump","jump_f","sk_s_qianlie_air","sk_s_bo2"],["jump_f","sk_s_zuhe","sk_xuanyuan"]];
      this.delay_frames.oppJump = [200,250,280,450,600];
      this.action_1.wander = [["roll_b","jump_b"],["jump_b","walk_f"],["walk_f"]];
      this.delay_frames.wander = [150,300,1000];
      this.action_1.defend = [["walk_b","walk_b","roll_f"],["walk_b","roll_b"],["walk_b","roll_f","jump_b","roll_b"],["walk_b"]];
      this.delay_frames.defend = [130,200,400,1000];
      this.action_1.defendAttack = [["sk_bailietui2","sk_xuanyuan","sk_huixuan2","sk_s_qianlie_air","sk_s_bo2","sk_s_tianxing","sk_shengtian"],["sk_s_qianlie_air","sk_xuanyuan","sk_s_tianxing","sk_s_bo2","sk_s_zuhe"],["sk_xuanyuan","sk_s_qianlie_air","sk_s_tianxing","sk_s_bo2"]];
      this.delay_frames.defendAttack = [200,280,370];
      this.action_1.defend_f = [["squatKick_l","squatPunch_l"],["jump_b"],["roll_f"]];
      this.delay_frames.defend_f = [150,250,1000];
      this.action_1.defend_dashf = [["roll_f","squatPunch_l","squatKick_l"],["squatPunch_l"],["jump_f"],["roll_f"]];
      this.delay_frames.defend_dashf = [150,200,350,1000];
      this.action_1.defend_h = [["hold_u","hold_u","hold_u","hold_u","roll_f"],["hold_u","hold_u","hold_u","roll_b"],["hold_u"]];
      this.delay_frames.defend_h = [130,400,1000];
      this.action_1.pos_down = [["squatKick_l","jump","walk_f","squatPunch","kick_s1","kick_s1_ai"],["jump_b","walk_f","squatPunch"],["walk_f","squatKick"],["kick_s1","jump_f"],["jump_f","walk_f","walk_f"]];
      this.delay_frames.pos_down = [150,180,230,300,450];
      this.action_1.pos_up = [["jump","jump_b","walk_f","kick_s1","kick_s1_ai"],["jump_f","walk_f"],["jump_f","jump","walk_f","walk_f"]];
      this.delay_frames.pos_up = [150,250,450];
   }
}
