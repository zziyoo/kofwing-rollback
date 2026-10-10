class Type2_Kula_AI_Lv3 extends Type2_Kula_AI
{
   var attack_rate0;
   var combo_rate0;
   var dis_array;
   var dis_num;
   var hold_rate0;
   var skill_dis;
   var wait_frame0;
   function Type2_Kula_AI_Lv3()
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
      this.dis_array[1] = 150;
      this.dis_array[2] = 200;
      this.dis_array[3] = 250;
      this.dis_array[4] = 300;
      this.dis_array[5] = 400;
      this.dis_array[6] = 500;
      this.dis_array[7] = 550;
      this.dis_array[8] = 625;
      this.dis_array[9] = 1000;
      this.skill_dis[0] = ["walk_b"];
      this.skill_dis[1] = ["walk_f"];
      this.skill_dis[2] = ["walk_f"];
      this.skill_dis[3] = ["punch","punch_l","jump_b","walk_f","kick_l","squatKick_l","jump"];
      this.skill_dis[4] = ["walk_f","walk_f","jump_f","roll_f"];
      this.skill_dis[5] = ["sk_flyKick","walk_f","walk_f","jump"];
      this.skill_dis[6] = ["sk_flyKick","sk_dfp","roll_f","walk_f","sk_bingdian","jump_f","jump","jump_b"];
      this.skill_dis[7] = ["walk_f","walk_f","walk_f","dash_n","jump_f","walk_f","walk_f","sk_dfp","sk_tibing1","jump_f","jump","jump_b"];
      this.skill_dis[8] = ["walk_f","walk_f","walk_f","roll_f","walk_f","jump_f","jump","jump_b"];
      this.skill_dis[9] = ["walk_f","walk_f","roll_f","walk_f","sk_tibing1","jump_f","jump","jump_b"];
      this.dis_num = this.dis_array.length;
   }
   function combo_init()
   {
      this.combo_1 = new Object();
      this.combo_land = new Object();
      this.combo_auto = new Object();
      this.combo_burst = new Object();
      this.delay_frames = new Object();
      this.combo_1.sk_tibing2 = ["sk_s_xiangdong","sk_fdfp","sk_flyKick"];
      this.combo_1.sk_flyKick = ["sk_tibing2"];
      this.combo_1.punch = ["sk_dfpl"];
      this.combo_1.punch2 = ["punch_s1","sk_dongjie","sk_dongjie"];
      this.combo_1.punch_s1 = ["sk_dfpl"];
      this.combo_1.punch_l = ["punch2","kick_l"];
      this.comboDis.punch_l = [120,250];
      this.combo_1.kickl = ["sk_dfpl"];
      this.combo_1.sk_dfpl = ["sk_tibing1","sk_tibing1","sk_tibing1"];
      this.combo_1.sk_tibing1 = ["sk_s_handong","sk_flyKick"];
      this.combo_1.sk_dfp = ["punch","sk_dfpl","punch","punch"];
      this.combo_1.kick_l = ["sk_dfpl","sk_dfpl","sk_dfpl","kick_l","sk_flyKick"];
      this.combo_1.squatPunch_l = ["punch2","squatKick_l"];
      this.comboDis.squatPunch_l = [120,250];
      this.combo_1.squatKick_l = ["punch2","kick_l"];
      this.comboDis.squatKick_l = [120,250];
      this.combo_1.sk_dongjie = ["punch"];
      this.combo_1.kick = ["sk_dfpl"];
      this.combo_1.kick2 = ["sk_flyKick","sk_flyKick","sk_flyKick","sk_fdfp","sk_bingdian","sk_s_storm"];
      this.combo_land.jump_f = ["punch","kick"];
      this.combo_burst.sk_tibing2 = ["sk_fdfp","sk_flyKick","sk_s_luobing","sk_s_storm","sk_s_luanren"];
      this.combo_burst.sk_fdfp = ["sk_lacachora_ai"];
      this.combo_burst.sk_fdfp_l = ["sk_lacachora_ai"];
      this.combo_burst.sk_flyKick = ["sk_lacachora_ai"];
      this.combo_burst.jumpSkill_heavyHit = ["sk_lacachora_ai"];
      this.combo_land.jumpSkill_heavyHit = ["sk_s_luobing","sk_flyKick"];
      this.combo_land.jumpSkill_punch = ["squatKick_l","punch2","punch"];
      this.comboDis.jumpSkill_punch = [80,100,400];
      this.combo_land.jumpSkill_kick = ["squatKick_l","punch2","punch"];
      this.comboDis.jumpSkill_kick = [80,100,400];
      this.combo_land.jumpSkill_kick_l = ["squatKick_l","punch2","punch"];
      this.comboDis.jumpSkill_kick_l = [80,100,400];
      this.action_1 = new Object();
      this.action_1.airAttack = [["jump_f","sk_tibing2","sk_tibing2","sk_tibing2"],["kick2","kick2","kick2","sk_fdfp","jump","sk_s_luobing","jump_f"],["sk_s_xiangdong","sk_flyKick"],["sk_s_luobing"],["sk_s_handong","sk_tibing1","sk_tibing1"]];
      this.delay_frames.airAttack = [150,150,400,400,400];
      this.delay_framesL.airAttack = [25,125,100,150,225];
      this.delay_framesH.airAttack = [125,175,150,225,250];
      this.action_1.downMovePower = [["roll_f"],["sk_huaxing","walk_f"]];
      this.delay_frames.downMovePower = [250,1000];
      this.action_1.downMove = [["roll_f"],["sk_huaxing","walk_f"]];
      this.delay_frames.downMove = [250,1000];
      this.action_1.down = [["sk_s_luobing"]];
      this.delay_frames.down = [1000];
      this.action_1.getup = [["jump","jump_f","jump_b","roll_f","squatKick_l","squatPunch_l"],["jump","jump_f","jump_b"],["jump_f","jump"],["sk_huaxing","sk_dfp"],["sk_dfp","sk_bingdian"]];
      this.delay_frames.getup = [150,200,300,350,470];
      this.action_1.oppRoll = [["squatPunch_l","punch_l","squatKick_l","roll_f"],["sk_huaxing","jump_b","jump","jump_f"],["sk_dfpl","jump_b","roll_f","sk_bingdian"],["sk_dfp","jump_b","sk_bingdian"],["sk_dfp","roll_f","roll_b"]];
      this.delay_frames.oppRoll = [150,400,500,600,1000];
      this.action_1.oppRollDown = [["squatKick_l"],["jump_b","jump","jump_f","roll_f","sk_flyKick"],["sk_huaxing","jump_b","sk_dfpl"],["jump_f","sk_dfp","sk_dfpl","sk_bingdian"],["walk_f"]];
      this.delay_frames.oppRollDown = [150,200,300,470,1000];
      this.action_1.oppLandHurt = [["kick_l","sk_dongjie","squatKick_l"],["punch","walk_f"],["punch"]];
      this.delay_frames.oppLandHurt = [120,150,200];
      this.action_1.oppLandCatch = [["sk_dongjie"]];
      this.delay_frames.oppLandCatch = [125];
      this.action_1.oppLand = [["sk_dongjie","sk_dongjie","squatPunch_l","squatKick_l"],["sk_dongjie","sk_dongjie","squatPunch_l","squatKick_l","walk_f"],["punch_l","kick_l","walk_f"]];
      this.delay_frames.oppLand = [100,140,200];
      this.action_1.oppJump = [["sk_fdfp_l","roll_f","sk_fdfp","sk_s_luobing"],["jump_b","jump","sk_s_luobing"],["roll_f","jump","jump_b","jump_f","sk_fdfp","sk_s_luobing","sk_s_xiangdong"],["sk_bingdian","sk_dfpl","sk_dfp","sk_s_luobing","sk_s_handong"]];
      this.delay_frames.oppJump = [200,450,600,800];
      this.action_1.wander = [["roll_b","jump_b"],["wait","jump_b","walk_f"],["walk_f"]];
      this.delay_frames.wander = [150,300,1000];
      this.action_1.defend = [["walk_b","walk_b","roll_f"],["walk_b","roll_b"],["walk_b","roll_f","jump_b","roll_b"],["walk_b"]];
      this.delay_frames.defend = [130,200,400,1000];
      this.action_1.defendAttack = [["sk_fdfp_l","sk_fdfp","sk_s_luobing","sk_s_luanren","sk_s_xiangdong"],["sk_s_handong","sk_s_xiangdong","sk_s_luanren","sk_flyKick","sk_huaxing","jump","sk_s_luobing","sk_s_storm","sk_fdfp"],["sk_s_luobing","sk_fdfp","sk_dfpl","sk_bingdian"]];
      this.delay_frames.defendAttack = [200,300,500];
      this.action_1.defend_f = [["squatKick_l","punch_l","kick_l","pitch2"],["jump"],["jump_b"],["hold_u"]];
      this.delay_frames.defend_f = [100,150,250,1000];
      this.action_1.defend_dashf = [["hold_u","roll_f"],["jump","jump_b","jump_f"],["sk_flyKick","jump_f","jump_b","sk_dfpl","sk_huaxing"],["sk_flyKick","jump","jump_b","sk_dfp","sk_bingdian"],["roll_f","walk_f","jump","jump_b"]];
      this.delay_frames.defend_dashf = [100,200,350,500,1000];
      this.action_1.defend_h = [["hold_u","hold_u","roll_f"],["hold_u","roll_b"],["hold_u"]];
      this.delay_frames.defend_h = [130,400,1000];
      this.action_1.pos_down = [["squatKick_l","jump","walk_f"],["squatKick","jump_b","walk_f","kick"],["sk_huaxing"],["jump_f","walk_f"]];
      this.delay_frames.pos_down = [150,180,240,450];
      this.action_1.pos_up = [["jump","jump_b","walk_f"],["jump_f","walk_f"],["jump_f","jump","walk_f"],["sk_flyKick"]];
      this.delay_frames.pos_up = [150,250,450,550];
   }
}
