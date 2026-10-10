class Rugal_AI_Lv1 extends Rugal_AI
{
   var attack_rate0;
   var combo_rate0;
   var dis_array;
   var dis_num;
   var hold_rate0;
   var skill_dis;
   var wait_frame0;
   function Rugal_AI_Lv1()
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
      this.dis_array[1] = 200;
      this.dis_array[2] = 250;
      this.dis_array[3] = 300;
      this.dis_array[4] = 400;
      this.dis_array[5] = 660;
      this.dis_array[6] = 1000;
      this.skill_dis[0] = ["walk_b","squatPunch_l","squatKick_l","squatPunch","squatKick","punch_l","kick_l","fdf_k3","dfdf_k","dfdf_k_EX","dfdf_kl_EX","dfdf_p_EX"];
      this.skill_dis[1] = ["walk_f","squatPunch_l","squatKick_l","squatPunch","squatKick","punch_l","kick_l","fdf_k3","dfdf_k","dfdf_k_EX","dfdf_p_EX"];
      this.skill_dis[2] = ["bdf_k","fdb_p_EX","fdf_k3","dfdf_k","dfdf_k_EX","dfdf_kl_EX","dfdf_p_EX"];
      this.skill_dis[3] = ["bdf_k","df_pl","fdb_p_EX2","roll_b","dfdf_k","dfdf_k_EX","dfdf_kl_EX","dfdf_p_EX"];
      this.skill_dis[4] = ["bdf_k","walk_f","fbdf_p","df_pl","jump_b","fdb_p_EX2","roll_b","dfdf_k","dfdf_k_EX","dfdf_kl_EX","dfdf_p_EX"];
      this.skill_dis[5] = ["walk_f","roll_b","fbdf_p","db_p","df_ph","jump_b","fdb_p_EX2","dfdf_k","dfdf_k_EX","dfdf_kl_EX","dfdf_p_EX"];
      this.skill_dis[6] = ["walk_f","fbdf_p","db_p","df_ph","jump","roll_b","dfdf_k","dfdf_k_EX","dfdf_kl_EX","dfdf_p_EX"];
      this.dis_num = this.dis_array.length;
   }
   function combo_init()
   {
      this.combo_1 = new Object();
      this.combo_land = new Object();
      this.combo_auto = new Object();
      this.combo_burst = new Object();
      this.delay_frames = new Object();
      this.combo_1.punch = ["fbdf_p"];
      this.combo_1.punch2 = ["f_kl"];
      this.combo_1.kick = ["fbdf_p"];
      this.combo_1.kick2 = ["f_kl"];
      this.combo_1.squatKick_l = ["punch2","kick2","f_kl"];
      this.comboDis.squatKick_l = [110,130,180];
      this.combo_1.f_kl = ["df_pl","df_pl","df_ph","df_ph","fdb_p_EX2","db_o","fdb_p_EX2"];
      this.combo_1.fdb_p_EX2 = ["roll_b"];
      this.comboDis.fdb_p_EX2 = [400];
      this.combo_1.df_pl = ["f_kl","dfdf_k","dfdf_p_EX","fbdf_p"];
      this.comboDis.df_pl = [150,200,350,1000];
      this.combo_1.df_ph = ["f_kl","dfdf_k","dfdf_p_EX","fbdf_p"];
      this.comboDis.df_ph = [150,200,350,1000];
      this.combo_land.jumpSkill_heavyHit = ["dfdf_k","fdf_k2","dfdf_p_EX"];
      this.comboDis.jumpSkill_heavyHit = [150,250,500];
      this.comboHeightL.jumpSkill_heavyHit = [40,75,75];
      this.comboHeightH.jumpSkill_heavyHit = [75,500,150];
      this.combo_land.jumpSkill_kick = ["squatPunch_l","squatKick_l"];
      this.comboDis.jumpSkill_kick = [150,200];
      this.combo_land.jumpSkill_kick_l = ["squatPunch_l","squatKick_l"];
      this.comboDis.jumpSkill_kick_l = [150,200];
      this.combo_1.df_o = ["fbdf_p"];
      this.combo_burst.fbdf_p = ["fbdf_p","walk_f"];
      this.combo_burst.fdf_k1 = ["df_p_air_EX"];
      this.delay_frames.fdf_k1 = [16];
      this.combo_burst.punch2 = ["db_o","fbdf_p","fdb_p_EX"];
      this.combo_burst.kick2 = ["db_o","fbdf_p","fdb_p_EX"];
      this.combo_burst.dfdf_p_EX = ["db_o"];
      this.combo_oppOnEgde.fbdf_p = [true,true];
      this.action_1 = new Object();
      this.action_1.airAttack = [["dfdf_k"],["db_p","fdf_k2","jump"],["db_p","jump"],["walk_f"],["fdf_k2","db_p"],["jump_f"],["dfdf_p_EX"],["bdf_k","fbdf_p"]];
      this.delay_frames.airAttack = [150,150,150,280,280,400,400,1000];
      this.delay_framesL.airAttack = [80,100,150,350,100,350,60,175];
      this.delay_framesH.airAttack = [110,150,225,500,150,500,80,250];
      this.action_1.downMove = [["roll_b"],["walk_f"]];
      this.delay_frames.downMove = [250,1000];
      this.action_1.down = [["roll_b"],["df_pl"],["df_ph"],["walk_f"]];
      this.delay_frames.down = [250,300,500,1000];
      this.action_1.getup = [["roll_b","jump_f","squatKick_l"],["df_ph","walk_f"],["df_ph","walk_f","bdf_k"]];
      this.delay_frames.getup = [200,450,1000];
      this.action_1.oppRoll = [["squatKick_l","squatPunch_l","bdf_k","bdf_p"],["squatKick_l","kick_l","jump","bdf_k"],["df_pl","roll_b"],["roll_b","roll_b","jump_f","db_p"],["db_p","jump_f","df_ph","jump_b"],["walk_f","fbdf_p","db_p","jump"]];
      this.delay_frames.oppRoll = [100,200,400,450,660,1000];
      this.action_1.oppRollDown = [["squatKick_l","squatKick_l","roll_b","jump_f"],["roll_b"],["df_pl"]];
      this.delay_frames.oppRollDown = [200,250,350];
      this.action_1.oppLandHurt = [["squatPunch_l","f_kl"],["squatKick_l","f_kl"],["walk_f"],["fbdf_p"]];
      this.delay_frames.oppLandHurt = [130,160,350,1000];
      this.action_1.oppLand = [["squatKick_l","squatPunch_l","bdf_p"],["squatKick_l","jump_f"],["walk_f","df_ph","bdf_k"],["walk_f","df_ph"]];
      this.delay_frames.oppLand = [100,200,350,1000];
      this.action_1.oppJump = [["dfdf_kl_EX","punch_l"],["dfdf_k_EX","fdf_k2","fdf_k1","dfdf_k"],["dfdf_k_EX","dfdf_p_EX","bdf_k","bdf_k","dfdf_k","db_p"],["jump_b","df_pl","db_p"],["fbdf_p"]];
      this.delay_frames.oppJump = [100,250,300,350,1000];
      this.action_1.wander = [["roll_b","jump_b"],["wait","jump_b","walk_f"],["walk_f"]];
      this.delay_frames.wander = [150,300,1000];
      this.action_1.defend = [["walk_b","walk_b","roll_f"],["walk_b","roll_b"],["walk_b","roll_b","jump_b","roll_b"],["walk_b"]];
      this.delay_frames.defend = [130,200,400,1000];
      this.action_1.defendAttack = [["fdf_k1","fdf_k2","dfdf_p_EX"],["bdf_k","dfdf_p_EX"],["fbdf_p","dfdf_p_EX"]];
      this.delay_frames.defendAttack = [250,300,450];
      this.action_1.defend_f = [["squatKick_l"],["roll_b","bdf_k"],["fbdf_p"],["fbdf_p"]];
      this.delay_frames.defend_f = [200,300,450,1000];
      this.action_1.defend_dashf = [["squatKick_l"],["df_pl","bdf_k"],["fbdf_p"]];
      this.delay_frames.defend_dashf = [275,350,500];
      this.action_1.defend_h = [["hold_u","hold_u","roll_f"],["hold_u","roll_b","bdf_k"],["hold_u"]];
      this.delay_frames.defend_h = [130,200,1000];
      this.action_1.onEgde = [["hold_u","roll_f","bdf_k"],["jump_f","walk_f"],["hold_u","jump_b"]];
      this.delay_frames.onEgde = [100,250,300];
      this.action_1.pos_down = [["squatKick_l","squatKick_l","squatKick_l","squatKick","roll_b","jump_f","walk_f"],["jump_f","walk_f"]];
      this.delay_frames.pos_down = [250,350];
      this.action_1.pos_up = [["jump","f_kl","walk_f","roll_b"],["jump_f","walk_f"]];
      this.delay_frames.pos_up = [175,350];
   }
}
