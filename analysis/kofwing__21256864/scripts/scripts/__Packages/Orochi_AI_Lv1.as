class Orochi_AI_Lv1 extends Orochi_AI
{
   var attack_rate0;
   var combo_rate0;
   var dis_array;
   var dis_num;
   var hold_rate0;
   var skill_dis;
   var wait_frame0;
   function Orochi_AI_Lv1()
   {
      super();
      this.skill_init();
      this.combo_init();
      this.combo_rate0 = 30;
      this.attack_rate0 = 32;
      this.hold_rate0 = 30;
      this.attack_s0 = 18;
      this.wait_frame0 = 90;
      this.combo_risk0 = 90;
   }
   function skill_init()
   {
      this.dis_array[0] = 100;
      this.dis_array[1] = 200;
      this.dis_array[2] = 300;
      this.dis_array[3] = 310;
      this.dis_array[4] = 390;
      this.dis_array[5] = 510;
      this.dis_array[6] = 550;
      this.dis_array[7] = 1000;
      this.skill_dis[0] = ["sk_dfp","kick","punch_l","sk_s_yangguang"];
      this.skill_dis[1] = ["sk_dfp","walk_f","sk_s_yangguang"];
      this.skill_dis[2] = ["sk_dfp","walk_f","sk_s_yangguang","roll_f"];
      this.skill_dis[3] = ["dbk_l","walk_f","sk_s_yangguang","sk_97","roll_f"];
      this.skill_dis[4] = ["walk_f","dbp","sk_dfk_l","sk_s_yangguang","sk_97"];
      this.skill_dis[5] = ["sk_dbp_l","walk_f","sk_dfk","dbk","sk_s_yangguang","sk_97"];
      this.skill_dis[6] = ["walk_f","sk_dbp","sk_s_yangguang","roll_f"];
      this.skill_dis[7] = ["walk_f","walk_f","sk_s_yangguang","roll_f"];
      this.dis_num = this.dis_array.length;
   }
   function combo_init()
   {
      this.combo_1 = new Object();
      this.combo_land = new Object();
      this.combo_auto = new Object();
      this.combo_burst = new Object();
      this.delay_frames = new Object();
      this.combo_1.squatPunch_l = ["kick_l"];
      this.combo_1.punch_l = ["kick_l"];
      this.combo_1.squatKick_l = ["squatPunch_l","punch_l"];
      this.combo_auto.kick_l = ["sk_bdfk"];
      this.combo_1.sk_bdfk = ["walk_f"];
      this.combo_1.sk_fdfk = ["sk_dbp_l","dbk_l","dbp","dbk","sk_dfk","sk_s_yangguang"];
      this.comboDis.sk_fdfk = [100,200,300,400,450,1000];
      this.comboHeightL.sk_fdfk = [100,0,0,0,0];
      this.comboHeightH.sk_fdfk = [500,500,500,500,500];
      this.combo_1.sk_dfp = ["sk_s_yangguang"];
      this.combo_1.punch = ["kick"];
      this.combo_land.jumpSkill_kick = ["squatKick_l","punch","kick_l"];
      this.comboDis.jumpSkill_kick = [130,150,300];
      this.combo_land.jumpSkill_kick_l = ["squatKick_l","kick_l","punch"];
      this.comboDis.jumpSkill_kick_l = [130,150,300];
      this.combo_land.jumpSkill_punch_l = ["squatKick_l","kick_l","punch"];
      this.comboDis.jumpSkill_punch_l = [130,150,300];
      this.combo_land.jumpSkill_punch = ["squatKick_l","kick_l","punch"];
      this.comboDis.jumpSkill_punch = [130,150,300];
      this.combo_land.jumpSkill_heavyHit = ["sk_dbp","sk_dfk_l","sk_dfk","sk_s_guangzhu"];
      this.comboDis.jumpSkill_heavyHit = [250,350,450,1000];
      this.combo_burst.sk_s_guangzhu = ["sk_s_yangguang","sk_s_taoxin"];
      this.combo_burst.sk_s_yangguang = ["sk_s_taoxin"];
      this.combo_burst.sk_s_taoxin = ["sk_s_qianshou1"];
      this.action_1 = new Object();
      this.action_1.down = [["sk_97","walk_f"],["sk_s_qianshou1","walk_f"],["walk_f","roll_b","walk_f"],["walk_f","walk_f","sk_dfp"],["sk_dfp","walk_f"]];
      this.delay_frames.down = [170,230,350,550,1000];
      this.action_1.oppRoll = [["squatPunch_l","squatKick_l"],["jump_f","sk_97","roll_f"],["jump_b","sk_s_yangguang","sk_dbp"],["roll_b","jump","sk_s_yangguang"],["roll_b","dbp","dbk","roll_b","sk_s_yangguang","sk_dfp"],["sk_s_yangguang","dbp"],["sk_s_yangguang","dbk","sk_dfk"]];
      this.delay_frames.oppRoll = [100,200,250,300,500,600,1000];
      this.action_1.oppRollDown = [["squatKick_l"],["sk_97"],["walk_f"]];
      this.delay_frames.oppRollDown = [150,200,1000];
      this.action_1.oppLandHurt = [["kick","kick","kick","kick","kick","sk_fdfk","sk_dbp"],["walk_f"]];
      this.delay_frames.oppLandHurt = [150,300];
      this.action_1.oppLand = [["pitch","pitch2","squatKick_l"],["sk_97","squatPunch_l","squatKick_l"]];
      this.delay_frames.oppLand = [100,180];
      this.action_1.oppJump = [["sk_fdfk"],["sk_dbp"],["dbp","sk_dfp","jump","sk_dfk_l"],["dbk","sk_dfk","sk_dfp","jump_f"],["sk_s_yangguang","sk_dfk","sk_dfp"],["sk_s_yangguang","sk_dfp"]];
      this.delay_frames.oppJump = [220,310,390,510,550,1000];
      this.action_1.wander = [["roll_f"],["jump_f","roll_f"],["jump_b","walk_f"],["walk_f","roll_b","walk_f"],["walk_f","roll_b","walk_f"]];
      this.delay_frames.wander = [100,200,300,500,1000];
      this.action_1.defend = [["roll_f"],["walk_f"],["walk_f"],["roll_b","walk_f"],["roll_b","walk_f"]];
      this.delay_frames.defend = [100,200,300,500,1000];
      this.action_1.defendAttack = [["dbp_l","sk_fdfk","kick"],["dbk_l","sk_dfk_l"],["sk_dfk_l"],["sk_dfk","dbp"],["sk_dfk","dbk"],["sk_s_guangzhu"]];
      this.delay_frames.defendAttack = [200,300,350,400,500,1000];
      this.action_1.defend_f = [["squatKick_l","jump_b"],["dbp_l"],["jump_b"],["dbk_l"],["dbp"],["dbk"],["sk_dfk"]];
      this.delay_frames.defend_f = [100,190,250,310,390,510,1000];
      this.action_1.defend_dashf = [["sk_fdfk","dbp_l","squatKick_l","roll_f"],["dbk_l"],["dbp","sk_dfk_l"],["dbk","sk_dfk"],["sk_dfp"],["sk_dfk"]];
      this.delay_frames.defend_dashf = [150,270,350,470,550,1000];
      this.action_1.defend_h = [["hold_u","hold_u","roll_f"],["hold_u","roll_b"],["hold_u"]];
      this.delay_frames.defend_h = [130,200,1000];
      this.action_1.onEgde = [["hold_u","roll_f"],["jump_f","walk_f"],["hold_u","jump_b"]];
      this.delay_frames.onEgde = [100,250,300];
      this.action_1.pos_down = [["squatKick_l"],["squatPunch"],["squatKick"]];
      this.delay_frames.pos_down = [180,230,300];
      this.action_1.pos_up = [["punch"].jump,["jump_f"]];
      this.delay_frames.pos_up = [120,250,350];
      this.action_1.super = [["sk_s_yangguang"],["sk_s_guangzhu"]];
      this.delay_frames.super = [350,1000];
      this.action_1.busrt = [["sk_s_yangguang"],["sk_s_guangzhu"]];
      this.delay_frames.busrt = [350,1000];
   }
}
