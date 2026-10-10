class Type2_Ash_AI_Lv5 extends Type2_Ash_AI
{
   var attack_rate0;
   var combo_rate0;
   var dis_array;
   var dis_num;
   var hold_rate0;
   var skill_dis;
   var wait_frame0;
   function Type2_Ash_AI_Lv5()
   {
      super();
      this.skill_init();
      this.combo_init();
      this.combo_rate0 = 100;
      this.attack_rate0 = 70;
      this.hold_rate0 = 100;
      this.attack_s0 = 55;
      this.wait_frame0 = 0;
      this.combo_risk0 = 15;
   }
   function skill_init()
   {
      this.dis_array[0] = 80;
      this.dis_array[1] = 150;
      this.dis_array[2] = 250;
      this.dis_array[3] = 300;
      this.dis_array[4] = 450;
      this.dis_array[5] = 550;
      this.dis_array[6] = 650;
      this.dis_array[7] = 1000;
      this.skill_dis[0] = ["walk_b"];
      this.skill_dis[1] = ["walk_f"];
      this.skill_dis[2] = ["walk_f"];
      this.skill_dis[3] = ["dash_f"];
      this.skill_dis[4] = ["dash_f"];
      this.skill_dis[5] = ["dash_f","dash_f","dash_f","dash_f","dash_f","dash_f","dash_f","dash_f","dash_f","dash_f","dash_f","dash_f","bf_C_2","bf_A_2"];
      this.skill_dis[6] = ["dash_f","dash_f","dash_f","dash_f","dash_f","dash_f","dash_f","dash_f","dash_f","bf_C_2"];
      this.skill_dis[7] = ["dash_f","dash_f","dash_f","dash_f","dash_f","dash_f","dash_f","db_C","db_D","bdf_B_2","dash_f","bf_C_2","bf_A_2"];
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
      this.combo_1.squatKick_l = ["kick2"];
      this.combo_1.squatPunch_l = ["kick"];
      this.combo_1.kick_l = ["punch"];
      this.combo_1.punch_l = ["kick"];
      this.combo_1.punch_l2 = ["kick","punch"];
      this.combo_1.kick_l2 = ["kick","punch"];
      this.combo_1.punch2 = ["cf_A","b_B","bdf_B_2"];
      this.comboDis.punch2 = [150,200,350];
      this.combo_auto.kick2 = ["b_B"];
      this.combo_1.squatPunch = ["cf_A","b_B","db_A","bf_A_2","db_B","bf_C_2"];
      this.comboDis.squatPunch = [80,135,160,220,260,350];
      this.combo_1.punch = ["bf_C_2"];
      this.combo_1.cf_A = ["b_B"];
      this.combo_1.f_A = ["b_B"];
      this.combo_auto.squatKick = ["b_D","b_B","bf_C_2"];
      this.delay_frames.squatKick = [3,1,0];
      this.combo_oppOnEgde.squatKick = [true,0,0];
      this.combo_auto.bf_A_2 = ["bf_C_2"];
      this.combo_land.jump_f = ["squatKick_l","cf_A","squatKick"];
      this.comboDis.jump_f = [70,140,300];
      this.combo_land.jumpSkill_kick = ["squatKick_l","punch","squatKick"];
      this.comboDis.jumpSkill_kick = [70,150,300];
      this.combo_land.jumpSkill_punch = ["squatKick_l","kick","squatKick"];
      this.comboDis.jumpSkill_punch = [70,150,300];
      this.combo_land.jump = ["squatKick_l","cf_A","squatKick"];
      this.comboDis.jump = [70,140,300];
      this.combo_land.jump_f = ["squatKick_l","cf_A","squatKick"];
      this.comboDis.jump = [70,140,300];
      this.combo_land.jumpSkill_heavyHit = ["bdf_B_2","bf_C_2"];
      this.comboDis.jumpSkill_heavyHit = [300,300];
      this.comboHeightL.jumpSkill_heavyHit = [100,150];
      this.comboHeightH.jumpSkill_heavyHit = [150,200];
      this.combo_burst.bdf_B_2 = ["dfdf_P_2","dfdf_K","dd_o_2","dbdf_P_2"];
      this.action_1 = new Object();
      this.action_1.airAttack = [["b_D","bf_C_2"],["walk_f"],["dfdf_P_2","bf_C_2","dd_o_2"],["fdf_B","bf_C_2"],["dfdf_K","bdf_B_2","bf_A_2","bf_C_2","dbdf_P_2","dbdf_P_2"],["bf_A_2","bf_C_2","fdf_B","bdf_B_2"],["bf_C_2","dbdf_P_2"],["bf_A_2","bf_C_2","dash_f","dash_f"],["dd_o_2","bf_C_2","dash_f"]];
      this.delay_frames.airAttack = [150,150,150,200,200,200,400,400,1000];
      this.delay_framesL.airAttack = [200,250,400,75,100,165,165,225,350];
      this.delay_framesH.airAttack = [250,400,1000,100,165,225,225,350,500];
      this.action_1.downMove = [["jump_b"],["jump"],["jump_f"]];
      this.delay_frames.downMove = [300,500,1000];
      this.action_1.down = [["db_A"],["db_B"],["db_C"],["db_D"]];
      this.delay_frames.down = [160,260,360,460];
      this.action_1.getup = [["jump","squatKick_l","dash_b"],["dash_b","jump_f","jump","jump_b"],["bf_C_2","bf_C_2","bf_A_2"],["bf_C_2"]];
      this.delay_frames.getup = [120,250,350,1000];
      this.action_1.oppRollDown = [["dash_b","squatKick_l"],["squatKick","db_A"],["dash_b"],["bf_C_2","db_B"],["bf_C_2","bf_A_2","db_C"],["db_D","bf_C_2"],["bf_C_2"],["bdf_B_2"]];
      this.delay_frames.oppRollDown = [150,200,250,300,360,460,600,650];
      this.action_1.oppLandHurt = [["squatKick_l","bf_C_2"],["dash_f"],["dash_f","dbdf_P_2"],["bf_C_2","dd_o_2","bdf_B_2"]];
      this.delay_frames.oppLandHurt = [120,225,400,1000];
      this.action_1.oppLandCatch = [["pitch","bdf_AC","squatKick_l","db_o_2","squatKick_l"],["db_o_2","bdf_AC","squatKick_l","kick2"]];
      this.delay_frames.oppLandCatch = [100,120];
      this.action_1.oppLand = [["squatKick_l","squatPunch_l","punch_l","kick2","squatPunch"],["squatKick_l","kick2"],["dash_f","dash_f","dash_f","dash_f","punch","squatKick"],["dash_f","dash_f","dash_f","dash_f","dash_f","squatKick","bf_C_2"]];
      this.delay_frames.oppLand = [100,120,150,280];
      this.action_1.oppRoll = [["punch_l","squatPunch_l","squatKick_l","jump","jump_b"],["jump","jump_f","jump_b"],["jump","jump_b","dash_b","squatKick","bf_A_2","bf_C_2"],["dbdf_P_2","bf_C_2"],["bf_C_2"]];
      this.delay_frames.oppRoll = [150,250,400,550,1000];
      this.action_1.oppJump = [["squatPunch","fdf_B"],["bf_C_2","fdf_B","dfdf_P_2","dfdf_K"],["bf_C_2","fdf_D","fdf_B","dfdf_K"],["bf_C_2","jump_b","dd_o_2"],["bf_C_2","dash_b","dd_o_2","dbdf_P_2","jump","jump_f"],["bf_C_2","dd_o_2"]];
      this.delay_frames.oppJump = [120,150,200,400,500,1000];
      this.action_1.wander = [["roll_b","jump_b"],["wait","jump_b","walk_f"],["dash_f","wait"]];
      this.delay_frames.wander = [150,300,1000];
      this.action_1.defend = [["walk_b","walk_b","roll_f"],["walk_b","roll_b"],["walk_b","dash_b","jump_b","roll_b"],["walk_b","wait"]];
      this.delay_frames.defend = [130,200,400,1000];
      this.action_1.defendAttack = [["fdf_B","dfdf_P_2","dbdf_P_2"],["dfdf_K","fdf_D","dbdf_P_2"],["bf_C_2","dbdf_P_2"],["bf_C_2","roll_f","dbdf_P_2"],["bf_C_2","bdf_B_2","dbdf_P_2"],["dd_o_2","bf_C_2"]];
      this.delay_frames.defendAttack = [150,220,300,350,380,1000];
      this.action_1.defend_f = [["squatKick_l","kick_l"],["jump_b"],["bf_C_2"]];
      this.delay_frames.defend_f = [150,350,500];
      this.action_1.defend_dashf = [["roll_f","squatPunch_l","squatKick_l"],["squatPunch_l","fdf_D"],["bf_C_2"],["dash_b"]];
      this.delay_frames.defend_dashf = [150,200,350,1000];
      this.action_1.defend_h = [["hold_u","hold_d","roll_f"],["hold_u","roll_b"],["hold_u","hold_d"]];
      this.delay_frames.defend_h = [130,200,1000];
      this.action_1.pos_down = [["jump","squatKick_l","dash_f"],["jump_f","dash_f","squatKick","jump_b"],["jump_f","dash_b","dash_f"],["bf_C_2","dash_f"]];
      this.delay_frames.pos_down = [120,200,400,450];
      this.action_1.pos_up = [["jump","jump_b","dash_f","f_A"],["jump_f","dash_b","dash_f"],["jump_f","dash_b","dash_f","bf_C_2","bf_A_2"],["bf_C_2","dash_f"]];
      this.delay_frames.pos_up = [140,350,415,450];
   }
}
