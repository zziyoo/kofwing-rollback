class Type2_Goenitz_AI_Lv5 extends Type2_Goenitz_AI
{
   var attack_rate0;
   var combo_rate0;
   var dis_array;
   var dis_num;
   var hold_rate0;
   var skill_dis;
   var wait_frame0;
   function Type2_Goenitz_AI_Lv5()
   {
      super();
      this.skill_init();
      this.combo_init();
      this.combo_rate0 = 100;
      this.attack_rate0 = 90;
      this.hold_rate0 = 95;
      this.attack_s0 = 70;
      this.wait_frame0 = 0;
      this.combo_risk0 = 20;
   }
   function skill_init()
   {
      this.dis_array[0] = 100;
      this.dis_array[1] = 150;
      this.dis_array[2] = 200;
      this.dis_array[3] = 250;
      this.dis_array[4] = 300;
      this.dis_array[5] = 400;
      this.dis_array[6] = 1000;
      this.skill_dis[0] = ["punch_l","punch_s1","kick_l","dash_f","kick_l","squatPunch","walk_f","sk_CChun","sk_YTao"];
      this.skill_dis[1] = ["sk_CYue","sk_MNiao","sk_YTao","punch_l","dash_f"];
      this.skill_dis[2] = ["sk_CYue","sk_MNiao","sk_YTao","walk_f"];
      this.skill_dis[3] = ["jump_f","walk_f","sk_YTao","dash_f","sk5_1","dash_b"];
      this.skill_dis[4] = ["sk_MNiao","walk_f","dash_f","jump_f"];
      this.skill_dis[5] = ["dash_f","dash_f","sk_YJue"];
      this.skill_dis[6] = ["dash_f","dash_f","roll_f"];
      this.dis_num = this.dis_array.length;
   }
   function combo_init()
   {
      this.combo_1 = new Object();
      this.combo_land = new Object();
      this.combo_auto = new Object();
      this.combo_burst = new Object();
      this.delay_frames = new Object();
      this.combo_1.punch_s1 = ["punch_s2"];
      this.combo_1.punch_s2 = ["sk_YJue","sk_MNiao","sk_s1xiii"];
      this.combo_1.kick_s2 = ["punch_s1","punch","sk_CChun","sk_s1xiii"];
      this.combo_1.squatPunch = ["punch_s1","sk_s1xiii","sk_CChun","sk_MNiao","sk_YTao","sk_CYue"];
      this.combo_1.punch = ["sk_MNiao","sk_CYue"];
      this.combo_1.punch2 = ["sk_CChun","sk_MNiao","sk_CYue"];
      this.combo_1.kick = ["sk_MNiao","sk_YJue"];
      this.combo_1.kick2 = ["sk_MNiao","sk_CChun","sk_YJue","sk_YTao","sk_s1xiii"];
      this.combo_land.punch_l = ["punch_l","kick_l","squatKick_l","punch_s1"];
      this.combo_land.squatKick_l = ["squatKick_l","punch_s1"];
      this.combo_land.squatPunch_l = ["squatPunch_l","squatKick_l","punch_s1"];
      this.combo_1.sk5_1 = ["sk_CChun","sk_MNiao","sk_YTao","sk_s1xiii","sk_8ZW"];
      this.combo_1.sk_CChun = ["sk5_1","sk_YJue","sk_CYue","sk_sixiii","sk_8ZW","sk_8ZW","sk_YTao"];
      this.combo_burst.punch = ["sk5_1","sk_s1xiii","sk_8ZW","sk_s_zhuangqiang"];
      this.combo_burst.punch2 = ["sk_YTao","sk_s1xiii","sk_8ZW","sk_s_zhuangqiang"];
      this.combo_burst.kick2 = ["sk_CYue","sk_s1xiii","sk_8ZW","sk_s_zhuangqiang"];
      this.combo_burst.heavyHit = ["sk_s1xiii","sk_s_qianzai1","sk_s_zhuangqiang"];
      this.combo_burst.sk_hang = ["sk_CChun","sk_MNiao","sk_YTao","sk_s1xiii","sk_8ZW"];
      this.combo_burst.sk_YTao = ["sk_s1xiii","sk_8ZW","sk_s_qianzai1","sk_s_zhuangqiang"];
      this.combo_burst.sk_CChun = ["sk_s1xiii","sk_s1xiii","sk_s_qianzai1","sk_YTao","sk_s_zhuangqiang","sk_8ZW","sk_8ZW","sk_8ZW"];
      this.combo_burst.sk_YJue = ["sk_CYue","sk_s1xiii","sk_8ZW"];
      this.combo_burst.sk_s1xiii = ["sk_8ZW","sk_8ZW","sk_8ZW","sk_s_qianzai1","sk_s_zhuangqiang"];
      this.combo_land.jump_f = ["punch","kick","punch_s1","kick_s2","kick_l"];
      this.combo_land.sk_CChun = ["sk5_1","sk_YTao","sk_YJue","sk_s1xiii","sk_8ZW"];
      this.action_1 = new Object();
      this.action_1.down = [["dash_b","roll_b","jump_b"],["walk_f","dash_f"]];
      this.delay_frames.down = [200,1000];
      this.action_1.oppRoll = [["punch_l","squatPunch_l"],["squatKick_l","kick_l"]];
      this.delay_frames.oppRoll = [150,300];
      this.action_1.oppJump = [["sk_YTao"],["sk_CYue","jump"],["sk_8ZW"]];
      this.delay_frames.oppJump = [150,300,350];
      this.action_1.wander = [["roll_b","dash_b"],["jump_b","walk_f","dash_b"],["dash_f"]];
      this.delay_frames.wander = [150,300,1000];
      this.action_1.defend = [["walk_b","walk_b","roll_f"],["walk_b","roll_b"],["walk_b","dash_b","jump_b","roll_b"],["walk_b"]];
      this.delay_frames.defend = [130,200,400,1000];
      this.action_1.defendAttack = [["hold_u","sk_CYue","sk_YTao","sk_s1xiii"],["hold_u","sk_YJue"]];
      this.delay_frames.defendAttack = [150,250];
      this.action_1.defend_f = [["roll_f"],["hold_u"]];
      this.delay_frames.defend_f = [150,1000];
      this.action_1.defend_h = [["hold_u","hold_u","roll_f"],["hold_u","roll_b"],["hold_u"]];
      this.delay_frames.defend_h = [130,200,1000];
      this.action_1.onEgde = [["attack","roll_f","kick_s1"],["attack"],["attack","dash_f"],["walk_f","dash_f"]];
      this.delay_frames.onEgde = [150,250,400,1000];
      this.action_1.pos_down = [["squatKick_l"],["squatKick"]];
      this.delay_frames.pos_down = [150,200];
      this.action_1.pos_up = [["pitch"],["sk_hang"],["jump_f"]];
      this.delay_frames.pos_up = [100,150,250];
   }
}
