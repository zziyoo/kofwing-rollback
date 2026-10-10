class Goenitz_AI_Lv1 extends Goenitz_AI
{
   var attack_rate0;
   var combo_rate0;
   var dis_array;
   var dis_num;
   var hold_rate0;
   var onEgde;
   var opp;
   var skill_dis;
   var wait_frame0;
   function Goenitz_AI_Lv1()
   {
      super();
      this.skill_init();
      this.combo_init();
      this.combo_rate0 = 0;
      this.attack_rate0 = 20;
      this.hold_rate0 = 15;
      this.attack_s0 = 5;
      this.wait_frame0 = 30;
      this.combo_risk0 = 0;
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
      this.skill_dis[0] = ["punch","punch_l","punch_s1","kick_l","kick","walk_f","squatPunch"];
      this.skill_dis[1] = ["kick","punch","squatKick","sk1_1","sk0","heavyHit"];
      this.skill_dis[2] = ["kick","squatKick","sk1_1","sk2","jump_f"];
      this.skill_dis[3] = ["sk2","sk3","jump_f","walk_f"];
      this.skill_dis[4] = ["sk2","sk3","walk_f","jump_f"];
      this.skill_dis[5] = ["walk_f","sk2"];
      this.skill_dis[6] = ["walk_f","sk2"];
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
      this.combo_1.punch_s2 = ["sk1_1","sk_s1"];
      this.combo_1.kick_s2 = ["punch_s1","punch","sk4"];
      this.combo_1.squatPunch = ["sk2","sk3"];
      this.combo_1.punch = ["sk1_1","sk2"];
      this.combo_1.punch2 = ["sk1_1","sk2","sk3","sk_s1","sk_s_89b"];
      this.combo_1.kick = ["sk2"];
      this.combo_1.kick2 = ["sk1_1","sk2","sk3","sk_s1","sk_s_89b"];
      this.combo_1.punch_l = ["punch_l","kick_l"];
      this.combo_1.squatKick_l = ["squatKick_l"];
      this.combo_1.squatPunch_l = ["squatPunch_l","squatKick_l"];
      this.combo_1.sk1_1 = ["sk1_2"];
      this.combo_1.sk1_2 = ["sk1_3"];
      this.combo_burst.punch = ["sk1_1","sk_s1"];
      this.combo_burst.punch2 = ["sk1_1","sk_s1"];
      this.combo_burst.kick2 = ["sk1_1","sk_s1"];
      this.combo_burst.heavyHit = ["sk_s1","sk_s_89b","sk_s_qianzai1"];
      this.combo_burst.sk1_1 = ["sk1_2","sk1_2","sk3","sk4"];
      this.combo_burst.sk1_2 = ["sk0","sk_s1","sk_s_89b","sk_s_3shenji2","sk_s_qianzai1"];
      this.combo_burst.sk_s1 = ["sk_s_89b","sk_s_3shenji2","sk_s_qianzai1"];
      this.combo_land.jump_f = ["punch","kick","punch_s1","kick_s2","kick_l"];
      this.action_1 = new Object();
      this.action_1.down = [["walk_b","jump_b"],["walk_f"]];
      this.delay_frames.down = [200,1000];
      this.action_1.oppRoll = [["punch_l","squatPunch_l"],["squatKick_l","kick_l"]];
      this.delay_frames.oppRoll = [150,300];
      this.action_1.oppJump = [["sk0"],["sk0","jump"],["sk_s1"]];
      this.delay_frames.oppJump = [150,300,350];
      this.action_1.super = [["sk_s1","sk_s_89b"],["sk_s1","sk_s_89b"]];
      this.delay_frames.super = [200,500];
      this.action_1.busrt = [["sk_s_3shenji2"],["sk_s_qianzai1"]];
      this.delay_frames.busrt = [150,350];
   }
   function actionDefend()
   {
   }
   function cpu_control()
   {
      if(this.checkDefend())
      {
         return true;
      }
      if(this.checkAction())
      {
         return true;
      }
      if(this.checkAttack())
      {
         return true;
      }
      this.checkWait();
   }
   function checkAction()
   {
      var _loc2_;
      if(this.combo_check2())
      {
         return true;
      }
      var _loc3_;
      if(this.getDis() > 300 && !_level0.KO)
      {
         if(this.checkBurst())
         {
            return true;
         }
      }
      else
      {
         if(this.opp.status_3 == "down" && !_level0.KO)
         {
            if(this.checkBurst())
            {
               return true;
            }
            _loc2_ = this.action_select("action_1","down");
            this.toSkill(_loc2_);
            return true;
         }
         if(this.onEgde)
         {
            _loc3_ = this.action_select("action_1","onEgde");
            this.toSkill(_loc3_);
            return true;
         }
      }
   }
}
