class Type2_Rugal_AI_Lv1 extends Type2_Rugal_AI
{
   var attack_rate0;
   var combo_rate0;
   var dis_array;
   var dis_num;
   var hold_rate0;
   var skill_dis;
   var wait_frame0;
   function Type2_Rugal_AI_Lv1()
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
      this.dis_array[4] = 345;
      this.dis_array[5] = 660;
      this.dis_array[6] = 1000;
      this.skill_dis[0] = ["walk_b","squatKick_l","squatPunch_l","squatPunch","squatKick","punch","punch_l","kick_l","fdf_k3","dfdb_p","dfdf_k"];
      this.skill_dis[1] = ["walk_b","squatKick_l","squatPunch_l","squatPunch","squatKick","punch","punch_l","kick_l","dfdb_p","dfdf_k","fdf_k4"];
      this.skill_dis[2] = ["walk_f","squatKick_l","squatPunch_l","f_kl","fdf_k3","dfdb_p","dfdf_k"];
      this.skill_dis[3] = ["walk_f","roll_b","dfdb_p","dfdf_k"];
      this.skill_dis[4] = ["walk_f","walk_f","fbdf_pl_EX","dfdb_p","dfdf_k"];
      this.skill_dis[5] = ["walk_f","roll_b","walk_f","walk_f","walk_f","fbdf_pl_EX","dfdb_p","dfdf_k"];
      this.skill_dis[6] = ["walk_f","walk_f","walk_f","roll_b","walk_f","roll_f","fbdf_pl_EX","dfdb_p","dfdf_k"];
      this.dis_num = this.dis_array.length;
   }
   function combo_init()
   {
      this.combo_1 = new Object();
      this.combo_land = new Object();
      this.combo_auto = new Object();
      this.combo_burst = new Object();
      this.delay_frames = new Object();
      this.combo_1.punch = ["f_kl"];
      this.combo_1.punch2 = ["f_kl"];
      this.combo_1.kick = ["f_kl"];
      this.combo_1.kick2 = ["f_kl"];
      this.combo_1.squatKick_l = ["punch2","kick2","f_kl","fbdf_pl_EX"];
      this.comboDis.squatKick_l = [110,130,180,300];
      this.combo_1.fdb_kl_EX = ["fdf_k3"];
      this.delay_frames.fdb_kl_EX = [30];
      this.combo_1.squatPunch_l = ["squatPunch_l","squatKick_l"];
      this.comboDis.squatPunch_l = [130,150];
      this.combo_1.squatPunch = ["dfdf_k","dfdb_p"];
      this.comboDis.squatPunch = [280,400];
      this.delay_frames.squatPunch = [40,20];
      this.combo_1.punch_l = ["dfdf_k","dfdb_p"];
      this.comboDis.punch_l = [280,400];
      this.delay_frames.punch_l = [10,5];
      this.combo_1.punch_lc = ["dfdb_p","dfdb_p"];
      this.comboDis.punch_lc = [280,400];
      this.delay_frames.punch_lc = [60,30];
      this.combo_burst.fdf_k3 = ["df_p_EX2"];
      this.combo_burst.df_p_EX2 = ["fdb_ph"];
      this.combo_burst.fdb_ph = ["fdf_k4","dfdb_p"];
      this.combo_burst.fdf_k4 = ["df_p_air_EX"];
      this.delay_frames.fdf_k4 = [18];
      this.combo_burst.dfdb_p = ["df_o_EX"];
      this.combo_land.jump_f = ["squatKick_l"];
      this.comboDis.jump_f = [200];
      this.combo_land.jumpSkill_heavyHit = ["fdf_k3"];
      this.combo_land.jumpSkill_kick = ["squatPunch_l","squatKick_l"];
      this.comboDis.jumpSkill_kick = [150,200];
      this.combo_land.jumpSkill_kick_l = ["squatPunch_l","squatKick_l"];
      this.comboDis.jumpSkill_kick_l = [150,200];
      this.combo_1.df_o_EX = ["fbdf_pl_EX"];
      this.combo_burst.fbdf_pl_EX = ["fbdf_pl_EX","df_o_EX"];
      this.combo_burst.df_o_EX = ["fbdf_pl_EX"];
      this.combo_burst.punch2 = ["dfdb_p","fbdf_pl_EX","fdb_ph"];
      this.combo_burst.kick2 = ["dfdb_p","fbdf_pl_EX","fdb_ph"];
      this.action_1 = new Object();
      this.action_1.airAttack = [["heavyHit","punch_l","df_p_EX2","fdf_k4"],["squatPunch","fdf_k3","fdf_k3","fdf_k3","fdf_k4"],["jump","punch_l"],["fdf_k3","fdf_k3","fdf_k3","jump_f"],["dfdb_p","jump_f"],["fbdf_pl_EX"]];
      this.delay_frames.airAttack = [110,110,150,250,300,1000];
      this.delay_framesL.airAttack = [175,275,150,270,250,125];
      this.delay_framesH.airAttack = [275,400,250,400,400,300];
      this.action_1.downMove = [["df_o_EX","dfdb_p"],["walk_f"]];
      this.delay_frames.downMove = [300,1000];
      this.action_1.downMovePower = [["df_o_EX","dfdb_p"],["walk_f"]];
      this.delay_frames.downMovePower = [300,1000];
      this.action_1.down = [["df_o_EX","dfdb_p"],["df_o_EX"]];
      this.delay_frames.down = [200,1000];
      this.action_1.downPower = [["df_o_EX","dfdb_p"],["df_o_EX"]];
      this.delay_frames.downPower = [200,1000];
      this.action_1.getup = [["squatKick_l","jump_f","roll_b","db_o_EX"],["roll_b"],["fbdf_pl_EX","walk_f"]];
      this.delay_frames.getup = [200,400,1000];
      this.action_1.oppRoll = [["pitch","pitch2","squatKick_l","squatPunch_l"],["squatKick_l","kick_l","jump"],["df_p_EX2","roll_b"],["roll_b","roll_b","jump_f"],["db_k","jump_f","df_p_EX2"],["walk_f","fdb_kl_EX","fdb_k_EX"]];
      this.delay_frames.oppRoll = [100,200,400,450,660,1000];
      this.action_1.oppRollDown = [["squatKick_l","squatKick_l","roll_b","jump_f"],["roll_b"],["fdb_kl_EX"],["fbdf_pl_EX"]];
      this.delay_frames.oppRollDown = [200,250,350,1000];
      this.action_1.oppLandHurt = [["squatPunch_l","f_kl"],["squatKick_l","f_kl"],["walk_f"],["fbdf_pl_EX"]];
      this.delay_frames.oppLandHurt = [130,160,350,1000];
      this.action_1.oppLand = [["squatKick_l","squatPunch_l"],["squatKick_l"]];
      this.delay_frames.oppLand = [100,200];
      this.action_1.oppJump = [["punch_l"],["fdf_k3","fdf_k4"],["df_p_EX","fdb_kl_EX","fdb_kl_EX","fdb_kl_EX","dfdf_k"],["jump_b","df_p_EX2"],["fbdf_pl_EX"]];
      this.delay_frames.oppJump = [100,250,300,350,1000];
      this.action_1.wander = [["roll_f"],["jump_f","roll_f"],["jump_b","walk_f"],["walk_b","roll_b","roll_b"],["walk_b","roll_b","roll_b"]];
      this.delay_frames.wander = [100,200,300,500,1000];
      this.action_1.defend = [["roll_f"],["walk_b"],["walk_b"],["roll_b","roll_b"],["roll_b","walk_b"]];
      this.delay_frames.defend = [100,200,300,500,1000];
      this.action_1.defendAttack = [["fdf_k3","fdf_k4","dfdb_p"],["fdb_kl_EX","dfdf_k"],["fbdf_pl_EX"]];
      this.delay_frames.defendAttack = [250,300,500];
      this.action_1.defend_f = [["squatKick_l"],["roll_b"],["fbdf_pl_EX"],["fbdf_pl_EX"]];
      this.delay_frames.defend_f = [200,300,450,1000];
      this.action_1.defend_dashf = [["squatKick_l"],["df_p_EX"],["fbdf_pl_EX"]];
      this.delay_frames.defend_dashf = [275,350,500];
      this.action_1.defend_h = [["hold_u","hold_u","roll_f"],["hold_u","roll_b"],["hold_u"]];
      this.delay_frames.defend_h = [130,200,1000];
      this.action_1.onEgde = [["hold_u","roll_f"],["jump_f","walk_f"],["hold_u","jump_b"]];
      this.delay_frames.onEgde = [100,250,300];
      this.action_1.pos_down = [["squatKick_l","squatKick_l","squatKick_l","squatKick","jump_f","walk_f"],["jump_f","walk_f"]];
      this.delay_frames.pos_down = [100,250,350];
      this.action_1.pos_up = [["jump","f_kl","walk_f"],["jump_f","walk_f"]];
      this.delay_frames.pos_up = [175,350];
   }
}
