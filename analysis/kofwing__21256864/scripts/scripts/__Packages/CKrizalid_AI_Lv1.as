class CKrizalid_AI_Lv1 extends CKrizalid_AI
{
   var attack_rate0;
   var combo_rate0;
   var dis_array;
   var dis_num;
   var hold_rate0;
   var skill_dis;
   var wait_frame0;
   function CKrizalid_AI_Lv1()
   {
      super();
      this.skill_init();
      this.combo_init();
      this.combo_rate0 = 28;
      this.attack_rate0 = 30;
      this.hold_rate0 = 28;
      this.attack_s0 = 15;
      this.wait_frame0 = 90;
      this.combo_risk0 = 90;
   }
   function skill_init()
   {
      this.dis_array[0] = 100;
      this.dis_array[1] = 150;
      this.dis_array[2] = 200;
      this.dis_array[3] = 250;
      this.dis_array[4] = 300;
      this.dis_array[5] = 400;
      this.dis_array[6] = 500;
      this.dis_array[7] = 600;
      this.dis_array[8] = 650;
      this.dis_array[9] = 1000;
      this.skill_dis[0] = ["punch_l","kick_l","kick","walk_f","punch","squatKick_l","squatKick","squatKick_l","squatKick","jump_b","jump_b","jump","jump"];
      this.skill_dis[1] = ["squatKick","squatKick_l","punch_l","kick_l","punch","jump_b","jump_b","jump","jump"];
      this.skill_dis[2] = ["squatKick","squatKick_l","punch_l","kick_l","punch","jump","roll_b","jump_f","jump_f","heavyHit"];
      this.skill_dis[3] = ["roll_f","walk_f","jump_f","jump_f"];
      this.skill_dis[4] = ["walk_f","walk_f","jump_f","jump_f"];
      this.skill_dis[5] = ["walk_f","walk_f","df_pl","roll_b","jump_f","roll_f","walk_f","walk_f"];
      this.skill_dis[6] = ["walk_f","roll_f","df_pl","df_ph","walk_f","walk_f","walk_f"];
      this.skill_dis[7] = ["walk_f","roll_b","df_ph","walk_f","walk_f","walk_f","walk_f","walk_f"];
      this.skill_dis[8] = ["walk_f","walk_f","df_ph","df_pl","walk_f","roll_f","walk_f","walk_f","walk_f"];
      this.skill_dis[9] = ["walk_f","walk_f","df_ph","walk_f","walk_f","roll_b","roll_f","walk_f"];
      this.dis_num = this.dis_array.length;
   }
   function combo_init()
   {
      this.combo_1 = new Object();
      this.combo_land = new Object();
      this.combo_auto = new Object();
      this.combo_burst = new Object();
      this.delay_frames = new Object();
      this.combo_1.roll_b = ["punch"];
      this.combo_1.punch = ["df_pl","df_ph"];
      this.combo_1.punch2 = ["df_pl","df_ph"];
      this.combo_1.punch_l = ["punch","kick","kick_l","squatKick_l","squatKick","heavyHit"];
      this.combo_1.kick_l = ["punch","kick","squatKick","heavyHit"];
      this.combo_1.kick_lc = ["punch","kick","squatKick","heavyHit"];
      this.combo_1.kick = ["df_pl","df_ph"];
      this.combo_1.kick2 = ["df_pl","df_ph"];
      this.combo_1.squatKick = ["df_pl","df_ph","df_ph"];
      this.combo_1.heavyHit = ["df_pl","df_ph"];
      this.combo_1.squatPunch = ["df_pl","df_ph"];
      this.combo_1.squatKick_l = ["punch_l","punch","kick","squatKick","heavyHit"];
      this.combo_1.squatPunch_l = ["punch_l","squatKick_l","punch","squatKick","heavyHit"];
      this.combo_1.jumpSkill_kick = ["df_kl","df_kh","walk_b"];
      this.combo_land.df_kl = ["heavyHit","jump","df_ph"];
      this.combo_land.df_kh = ["heavyHit","jump","df_ph"];
      this.combo_burst.punch2 = ["df_pl","df_ph"];
      this.combo_burst.kick2 = ["df_pl","df_ph"];
      this.combo_burst.punch = ["df_pl","df_ph"];
      this.combo_burst.kick = ["df_pl","df_ph"];
      this.combo_burst.squatPunch = this.combo_burst.punch2;
      this.combo_burst.df_pl = ["df_ph"];
      this.combo_burst.df_ph = ["df_pl"];
      this.combo_oppOnEgde.df_pl = [true,true];
      this.combo_oppOnEgde.df_ph = [true,true];
      this.combo_land.jumpSkill_heavyHit = ["df_ph","df_pl","jump"];
      this.comboDis.jumpSkill_heavyHit = [500,300,200];
      this.comboHeightL.jumpSkill_heavyHit = [50,100,150];
      this.comboHeightH.jumpSkill_heavyHit = [150,200,250];
      this.combo_land.jumpSkill_kick = ["squatKick_l","kick_l"];
      this.combo_land.jump_f = ["squatKick_l","jump_b"];
      this.comboDis.jump_f = [250,400];
      this.combo_land.jump = ["squatKick_l","jump_b"];
      this.comboDis.jump = [250,400];
      this.action_1 = new Object();
      this.action_1.airAttack = [["df_ph"],["walk_f"]];
      this.delay_frames.airAttack = [1000,1000];
      this.delay_framesL.airAttack = [25,0];
      this.delay_framesH.airAttack = [350,500];
      this.action_1.down = [["roll_f"],["walk_f"]];
      this.delay_frames.down = [200,1000];
      this.action_1.downMove = [["roll_f"],["walk_f"]];
      this.delay_frames.downMove = [200,1000];
      this.action_1.getup = [["jump","jump_f","jump_b","roll_f","squatKick_l","squatPunch_l"],["roll_f","jump_b","jump","roll_b"],["df_pl"],["df_ph"]];
      this.delay_frames.getup = [250,400,500,1000];
      this.action_1.oppRoll = [["pitch","punch_l","squatPunch_l","squatKick_l"],["squatKick_l","kick_l","kick","jump_b"],["jump","jump_b"],["roll_b","roll_f","df_pl"],["df_ph","df_ph","df_pl"]];
      this.delay_frames.oppRoll = [150,300,400,600,1000];
      this.action_1.oppRollDown = [["pitch","pitch2"],["squatKick_l","squatPunch_l"],["roll_f","jump_b","jump","roll_b"],["df_pl"],["df_ph"]];
      this.delay_frames.oppRollDown = [100,270,400,500,1000];
      this.action_1.oppLandHurt = [["kick_l","squatKick_l","squatPunch_l","squatKick"],["jump","jump_f","df_pl"],["df_ph","df_ph","walk_f"]];
      this.delay_frames.oppLandHurt = [225,400,1000];
      this.action_1.oppLand = [["pitch","pitch2","squatKick_l","squatPunch_l","punch_l","kick_l"],["squatKick_l","squatKick","kick_l"]];
      this.delay_frames.oppLand = [100,270];
      this.action_1.wander = [["roll_b","jump_b"],["wait","jump_b","jump","jump_f","walk_f","roll_f"],["walk_f","wait"]];
      this.delay_frames.wander = [150,300,1000];
      this.action_1.defend = [["walk_b","walk_b"],["walk_b","roll_f","roll_b"],["walk_b","roll_f","jump_b","roll_f","roll_b"],["walk_b","wait"]];
      this.delay_frames.defend = [130,200,400,1000];
      this.action_1.defend_f = [["roll_f"],["hold_u"]];
      this.delay_frames.defend_f = [150,1000];
      this.action_1.defend_dashf = [["squatKick_l","squatKick","kick_l"],["jump","jump_b","jump_f"],["df_pl","jump"],["df_ph","walk_f","df_ph"]];
      this.delay_frames.defend_dashf = [270,400,500,1000];
      this.action_1.defend_h = [["hold_u","hold_u","roll_f"],["hold_u","roll_b"],["hold_u"]];
      this.delay_frames.defend_h = [130,200,1000];
      this.action_1.onEgde = [["attack","attack","roll_f","roll_b"],["attack"],["attack","walk_f"],["walk_f","walk_f"]];
      this.delay_frames.onEgde = [150,250,400,1000];
      this.action_1.pos_down = [["squatKick_l","squatKick","walk_f"],["squatKick","jump","walk_f"],["walk_f","jump_f","jump"]];
      this.delay_frames.pos_down = [150,250,400];
      this.action_1.pos_up = [["jump_f","jump","walk_f"],["walk_f","jump_f","jump"]];
      this.delay_frames.pos_up = [250,400];
      this.action_1.oppJump = [["roll_f","roll_b","kick_l"],["jump_b","jump","roll_f","walk_b","kick","kick"],["df_ph","df_pl","df_ph","df_pl","jump_f","jump"]];
      this.delay_frames.oppJump = [200,300,1000];
      this.action_1.defendAttack = [["punch_l","hold_u","hold_d","heavyHit"],["roll_f","roll_b","jump","jump_b"]];
      this.delay_frames.defendAttack = [200,400];
   }
}
