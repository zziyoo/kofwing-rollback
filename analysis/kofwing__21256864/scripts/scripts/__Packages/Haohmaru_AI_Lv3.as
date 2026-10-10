class Haohmaru_AI_Lv3 extends Haohmaru_AI
{
   var attack_rate0;
   var combo_rate0;
   var delayTimer;
   var dir;
   var dis_array;
   var dis_num;
   var hold_rate0;
   var mc;
   var objName;
   var opp;
   var skill_dis;
   var wait_frame0;
   function Haohmaru_AI_Lv3()
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
      this.skill_dis[1] = ["walk_b"];
      this.skill_dis[2] = ["jump","jump_b","walk_f","walk_f"];
      this.skill_dis[3] = ["jump","jump_b","walk_f","walk_f","walk_f"];
      this.skill_dis[4] = ["jump","walk_f","walk_f","roll_f","walk_f"];
      this.skill_dis[5] = ["walk_f","jump","walk_f","walk_f"];
      this.skill_dis[6] = ["walk_f","roll_f","walk_f","walk_f","jump_f"];
      this.skill_dis[7] = ["walk_f","walk_f","walk_f","walk_f","walk_f","walk_f","jump_b","jump_f","df_kl","df_p"];
      this.skill_dis[8] = ["walk_f","roll_f","walk_f","walk_f","walk_f","jump","jump_f","df_p"];
      this.skill_dis[9] = ["walk_f","walk_f","jump_f","jump_b"];
      this.dis_num = this.dis_array.length;
   }
   function combo_init()
   {
      this.combo_1 = new Object();
      this.combo_land = new Object();
      this.combo_auto = new Object();
      this.combo_burst = new Object();
      this.delay_frames = new Object();
      this.combo_1.punch = ["fdb_p","df_p","df_p","df_p","df_p","df_p","df_p","df_kl"];
      this.combo_1.df_p = ["jump","jump_b","jump_f"];
      this.comboDis.df_p = [200,300,400];
      this.combo_1.df_kl = ["fdbf_p"];
      this.comboDis.df_kl = [310];
      this.combo_1.punch2 = ["f_pl","rfdf_kl"];
      this.comboDis.punch2 = [120,350];
      this.combo_1.kick = ["f_pl"];
      this.combo_1.kick2 = ["f_pl"];
      this.combo_1.f_pl = ["f_kl"];
      this.combo_1.f_kl = ["rfdf_kl","rfdf_kl","rfdf_kl","rfdf_kl","bdf_p","db_k"];
      this.combo_land.rfdf_kl = ["dash_kl","dash_pl"];
      this.combo_land.airdf_kl = ["jump_b","jump","jump_f"];
      this.comboDis.airdf_kl = [200,300,400];
      this.combo_auto.f_kl_ai = ["bdb_p"];
      this.combo_auto.squatKick_l = ["punch2","squatPunch_l","punch"];
      this.comboDis.squatKick_l = [160,210,500];
      this.combo_auto.squatPunch_l = ["punch2","kick_l","punch"];
      this.comboDis.squatPunch_l = [160,280,500];
      this.combo_1.kick_l = ["f_kl","punch"];
      this.comboDis.kick_l = [220,500];
      this.combo_1.punch_l = ["kick_l"];
      this.combo_1.squatPunch = ["rfdf_kl"];
      this.combo_burst.dash_pl = ["f_pl"];
      this.combo_burst.dash_kl = ["df_kl","dfdf_p"];
      this.combo_burst.df_kl = ["dfdf_p"];
      this.combo_burst.dfdf_p = ["df_o","db_o","db_k","fdbf_p"];
      this.combo_burst.db_k = ["dfdf_p"];
      this.combo_burst.dash_k = ["rfdf_kl"];
      this.combo_land.jumpSkill_heavyHit = ["rfdf_kl"];
      this.comboDis.jumpSkill_heavyHit = [275];
      this.comboHeightL.jumpSkill_heavyHit = [100];
      this.comboHeightH.jumpSkill_heavyHit = [250];
      this.combo_land.jumpSkill_kick = ["squatKick_l","punch2","dash_k"];
      this.comboDis.jumpSkill_kick = [100,160,340];
      this.combo_land.jumpSkill_punch = ["squatKick_l","punch2","dash_k"];
      this.comboDis.jumpSkill_punch = [100,160,340];
      this.combo_land.jumpSkill_kick_l = ["squatKick_l","punch2","dash_k"];
      this.comboDis.jumpSkill_kick_l = [100,160,340];
      this.combo_land.jump_f = ["squatKick_l"];
      this.comboDis.jump_f = [200];
      this.action_1 = new Object();
      this.action_1.airAttack = [["rfdf_pl","dfdf_p"],["punch","dash_pl","dash_kl","bdf_p"]];
      this.delay_frames.airAttack = [200,420];
      this.delay_framesL.airAttack = [100,150];
      this.delay_framesH.airAttack = [150,225];
      this.action_1.downMove = [["f_kl_ai"],["bdb_p"],["walk_f"]];
      this.delay_frames.downMove = [220,350,1000];
      this.action_1.down = [["walk_f"]];
      this.delay_frames.down = [1000];
      this.action_1.getup = [["jump","jump_f","jump_b","roll_f","squatKick_l","squatPunch_l"],["jump_f","jump_b","roll_f","squatKick_l","squatPunch_l","punch_l","kick_l"],["df_kl","df_pl","roll_f","roll_f"],["roll_f","bdf_p","bdf_p"],["fdb_p","dash_p","dash_k"],["df_kl","dash_pl","dash_kl"],["df_p"]];
      this.delay_frames.getup = [150,200,300,360,400,600];
      this.action_1.oppRoll = [["punch_l","squatPunch_l","squatPunch_l","kick_l"],["jump","jump_f","jump_b","walk_f"],["jump","jump_b"],["jump_f","jump_b","roll_f"],["df_kl","df_pl","df_p","bdf_p","fdb_p"]];
      this.delay_frames.oppRoll = [150,350,450,550,1000];
      this.action_1.oppRollDown = [["squatKick_l","squatPunch_l","punch_l","kick_l"],["roll_f"],["df_pl","jump","jump_b"],["dash_p","dash_k"],["dash_kl","jump_b","dash_pl","df_kl","df_p"],["walk_f"]];
      this.delay_frames.oppRollDown = [150,200,300,350,450,1000];
      this.action_1.oppLandHurt = [["kick2","punch2","squatKick_l","squatPunch_l"],["squatKick_l","squatPunch_l"],["dash_p"],["dash_p","dash_k"],["dash_kl","dash_p","dash_pl"]];
      this.delay_frames.oppLandHurt = [100,160,200,300,350];
      this.action_1.oppLand = [["squatKick_l","squatPunch_l","kick_l","punch_l"],["jump","jump_b","jump_f","dash_k","dash_p","dash_kl"],["dash_k","dash_p","dash_k","dash_p","dash_kl","dash_p"],["punch","jump_f","dash_pl","dash_pl"]];
      this.delay_frames.oppLand = [190,300,350,420];
      this.action_1.oppJump = [["rfdf_pl","rfdf_kl","rfdf_p","db_k","squatPunch"],["rfdf_pl","rfdf_kl","rfdf_p"],["fdbf_p","jump_b","jump_f","dfdf_p","rfdf_p","rfdf_kl"],["df_o","dfdf_p","fdbf_p","rfdf_p","jump","jump_b"],["fdbf_p","jump_f","jump_b","df_pl"],["df_kl","jump_f","jump_b","df_p","dash_kl"]];
      this.delay_frames.oppJump = [200,250,300,350,420,500];
      this.action_1.wander = [["roll_b","jump_b"],["wait","jump_b","walk_f"],["walk_f"]];
      this.delay_frames.wander = [150,300,1000];
      this.action_1.defend = [["walk_b","walk_b","roll_f"],["walk_b","roll_b"],["walk_b","roll_f","jump_b","roll_b"],["walk_b"]];
      this.delay_frames.defend = [130,200,400,1000];
      this.action_1.defendAttack = [["df_k","rfdf_pl","rfdf_p","dfdf_p","df_o"],["df_k","bdb_pl","bdb_kl","bdf_p","fdb_p","db_o","dfdf_p"],["dash_pl","bdf_p","dash_k","fdbf_p","roll_f"]];
      this.delay_frames.defendAttack = [200,300,400];
      this.action_1.defend_f = [["squatKick_l"],["jump_b"]];
      this.delay_frames.defend_f = [100,250];
      this.action_1.defend_dashf = [["hold_u","roll_f"],["jump","jump_b","jump_f"],["roll_f","jump_f"],["jump_b"],["walk_f","jump","jump_b"]];
      this.delay_frames.defend_dashf = [100,150,250,400,1000];
      this.action_1.defend_h = [["hold_u","hold_u","roll_f"],["hold_u","roll_b"],["hold_u"]];
      this.delay_frames.defend_h = [130,400,1000];
      this.action_1.pos_down = [["squatKick_l","jump","walk_f"],["squatKick","jump_b","walk_f","dash_p"],["jump_f","walk_f","dash_k"],["jump_f","walk_f"]];
      this.delay_frames.pos_down = [150,200,340,450];
      this.action_1.pos_up = [["jump","jump_b","walk_f"],["jump_f","walk_f","dash_p"],["jump_f","jump","walk_f","bdb_kl"],["jump_f","jump","walk_f"]];
      this.delay_frames.pos_up = [150,250,350,450];
   }
   function move_hold()
   {
      clearInterval(this.delayTimer);
      var opp = this.opp;
      var _loc15_ = this.dir;
      var owner = this;
      this.mc.onEnterFrame = function()
      {
         if(_level0.inPause)
         {
            return undefined;
         }
         if(owner.inFreeze)
         {
            return undefined;
         }
         if(owner.check_special_defend())
         {
            return undefined;
         }
         if(opp.status_8 == "jingling")
         {
            owner.check_jingling();
            return undefined;
         }
         if(opp.status_8 == "yingzi")
         {
            owner.check_yingzi();
            return undefined;
         }
         var _loc14_ = int(Math.random() * 100);
         if((opp.mc.hitPos == "up" || opp.status_2 == "air") && owner.status_1 != "hold_u" && owner.status_1 != "hold_d")
         {
            owner.hold_u();
            return undefined;
         }
         if((opp.mc.hitPos == "up" || opp.status_2 == "air") && owner.status_1 == "hold_d" && _loc14_ < 18 * _level0.level)
         {
            owner.hold_u();
            return undefined;
         }
         if((opp.status_1.indexOf("squat") > -1 || opp.mc.hitPos == "down") && owner.status_1 != "hold_u" && owner.status_1 != "hold_d")
         {
            owner.hold_d();
            return undefined;
         }
         if((opp.status_1.indexOf("squat") > -1 || opp.mc.hitPos == "down") && owner.status_1 == "hold_u" && _loc14_ < 18 * _level0.level)
         {
            owner.hold_d();
            return undefined;
         }
         if(owner.checkMustDefendSkill(opp.status_1))
         {
            return undefined;
         }
         var _loc2_;
         _loc2_ = Math.random();
         var _loc8_;
         var _loc10_;
         var _loc6_;
         var _loc5_;
         var _loc9_;
         var _loc7_;
         var _loc12_;
         var _loc4_;
         var _loc3_;
         var _loc13_;
         var _loc11_;
         if(opp.hasObj() && opp.status_8 != "jingling" && opp.status_8 != "yingzi")
         {
            if(opp.status_3 == "hurt")
            {
               if(owner.combo_check2())
               {
                  return undefined;
               }
               if(owner.combo_check())
               {
                  return undefined;
               }
               if(owner.checkAction())
               {
                  return undefined;
               }
            }
            if((opp.status_1.indexOf("squat") > -1 || opp.mc.hitPos == "down") && owner.status_1 != "hold_d")
            {
               owner.hold_d();
               return undefined;
            }
            if((opp.mc.hitPos == "up" || opp.status_2 == "air") && owner.status_1 != "hold_u")
            {
               owner.hold_u();
               return undefined;
            }
            _loc8_ = 1000;
            _loc4_ = opp.getObjDis();
            _loc3_ = opp.getObjs();
            _loc2_ = 0;
            while(_loc2_ < _loc3_.length)
            {
               this.objName = _loc3_[_loc2_].objName;
               if(this.objName == "black_dot")
               {
                  if(_loc4_ <= 175 && _loc4_ > 130)
                  {
                     owner.roll_b();
                  }
                  else if(_loc4_ <= 250 && _loc4_ > 175)
                  {
                     owner.roll_f();
                  }
               }
               if(_loc3_[_loc2_].area.obj_level != "undefined")
               {
                  _loc8_ = _loc3_[_loc2_].area.obj_level;
                  _loc10_ = _loc3_[_loc2_].area._width;
                  _loc6_ = _loc3_[_loc2_].area._height;
                  _loc5_ = _loc3_[_loc2_].area.obj_Vx;
                  _loc7_ = _loc3_[_loc2_].area._y;
                  _loc12_ = _loc3_[_loc2_].area.breakDefend;
                  _loc13_ = _loc3_[_loc2_].area._x;
                  _loc11_ = _loc3_[_loc2_].area.hitPos;
                  _loc9_ = _loc3_[_loc2_].area.people;
               }
               _loc2_ = _loc2_ + 1;
            }
            _loc2_ = Math.random();
            _loc2_ = Math.random();
            if(_loc10_ > 250)
            {
               return undefined;
            }
            if(_loc4_ < 130)
            {
               return undefined;
            }
            if(_loc9_ == "undefined" || _loc8_ == 1000)
            {
               return undefined;
            }
            if(_loc4_ <= 230 && _loc4_ > 180 && _loc2_ < 0.09 * _level0.level || _loc5_ > 60 && _loc2_ < 0.09 * _level0.level)
            {
               owner.toSkill("df_k");
               return undefined;
            }
            if(_loc4_ <= 350 && _loc4_ > 250 && !_loc9_ && _loc2_ < 0.18 * _level0.level && _loc8_ < 1)
            {
               owner.toSkill("db_k");
               return undefined;
            }
            if(_loc4_ <= 180 && _loc4_ > 130 && (_loc2_ < 0.03 * _level0.level || _loc12_ || _loc11_ == "all"))
            {
               owner.roll_f();
               return undefined;
            }
            if((_loc9_ || _loc8_ > 3) && _loc2_ <= 0.75)
            {
               _loc2_ = _loc2_ * 10 * _level0.level;
            }
            if(_loc2_ < 0.05 * _level0.level && (_loc6_ < 100 && _loc7_ < 100 && _level0.cpu_op_mode !== "defend" || _loc6_ < 75 && _loc7_ < 75 && _level0.cpu_op_mode === "defend"))
            {
               if(_loc5_ > 30 && _loc5_ <= 50 && _loc4_ < 225)
               {
                  owner.jump();
               }
               if(_loc5_ > 20 && _loc5_ <= 30 && _loc4_ < 175)
               {
                  owner.jump();
               }
               if(_loc5_ > 10 && _loc5_ <= 20 && _loc4_ < 125)
               {
                  owner.jump();
               }
            }
            if(_loc4_ > 300 && _loc4_ < 450 && _loc5_ > 20 && _loc5_ <= 40 && _loc2_ < 0.18 * _level0.level && (_loc6_ < 100 && _loc7_ < 100 && _level0.cpu_op_mode !== "defend" || _loc6_ < 75 && _loc7_ < 75 && _level0.cpu_op_mode === "defend"))
            {
               owner.jump_f();
               return undefined;
            }
            if(_loc4_ > 200 && _loc4_ < 250 && _loc5_ > 12 && _loc5_ <= 20 && _loc2_ < 0.18 * _level0.level && (_loc6_ < 100 && _loc7_ < 100 && _level0.cpu_op_mode !== "defend" || _loc6_ < 75 && _loc7_ < 75 && _level0.cpu_op_mode === "defend"))
            {
               owner.jump_f();
               return undefined;
            }
            if(_loc4_ > 150 && _loc4_ < 200 && _loc5_ > 8 && _loc5_ <= 12 && _loc2_ < 0.18 * _level0.level && (_loc6_ < 100 && _loc7_ < 100 && _level0.cpu_op_mode !== "defend" || _loc6_ < 75 && _loc7_ < 75 && _level0.cpu_op_mode === "defend"))
            {
               owner.jump_f();
               return undefined;
            }
            if(_loc4_ > 400 && _loc4_ <= 500 && _loc5_ > 30 && _loc5_ <= 50 && _loc2_ < 0.18 * _level0.level && (_loc6_ < 100 && _loc7_ < 100 && _level0.cpu_op_mode !== "defend" || _loc6_ < 75 && _loc7_ < 75 && _level0.cpu_op_mode === "defend"))
            {
               owner.jump_f();
               return undefined;
            }
            if(_loc4_ > 325 && _loc4_ <= 400 && _loc5_ > 20 && _loc5_ <= 30 && _loc2_ < 0.18 * _level0.level && (_loc6_ < 100 && _loc7_ < 100 && _level0.cpu_op_mode !== "defend" || _loc6_ < 75 && _loc7_ < 75 && _level0.cpu_op_mode === "defend"))
            {
               owner.jump_f();
               return undefined;
            }
            if(_loc4_ > 250 && _loc4_ <= 325 && _loc5_ > 10 && _loc5_ <= 20 && _loc2_ < 0.18 * _level0.level && (_loc6_ < 100 && _loc7_ < 100 && _level0.cpu_op_mode !== "defend" || _loc6_ < 75 && _loc7_ < 75 && _level0.cpu_op_mode === "defend"))
            {
               owner.jump_f();
               return undefined;
            }
            if(_loc5_ == 0 && _loc2_ < 0.18 * _level0.level)
            {
               if(_loc4_ <= 25)
               {
                  owner.roll_f();
               }
               else if(_loc4_ <= 200)
               {
                  owner.dash_b();
               }
            }
            if(_loc5_ <= 12 && _loc4_ < 500 && _loc4_ >= 150 && _loc2_ < 0.18 * _level0.level)
            {
               if(_loc4_ < 350)
               {
                  owner.roll_f();
               }
               else if(_loc4_ > 350)
               {
                  owner.roll_b();
               }
            }
            if(_loc5_ > 25 && _loc5_ < 40 && _loc4_ >= 150 && _loc2_ < 0.18 * _level0.level)
            {
               if(_loc4_ <= 200 && this.getDis() > 450)
               {
                  owner.roll_f();
               }
            }
            if(_loc5_ > 40 && _loc5_ < 70 && _loc4_ >= 150 && _loc2_ < 0.18 * _level0.level)
            {
               if(_loc4_ <= 200)
               {
                  owner.roll_b();
               }
               else if(_loc4_ <= 350)
               {
                  owner.roll_f();
               }
            }
            if(_loc5_ > 70 && _loc4_ >= 150 && _loc2_ < 0.18 * _level0.level)
            {
               if(_loc4_ <= 250)
               {
                  owner.roll_b();
               }
               else if(_loc4_ >= 450)
               {
                  owner.roll_f();
               }
            }
            owner.move_hold();
            if(_loc5_ < 25 && _loc5_ > 12 && _loc4_ >= 150 && _loc2_ < 0.18 * _level0.level)
            {
               if(_loc4_ <= 200 && this.getDis() > 450)
               {
                  owner.roll_f();
               }
            }
            return undefined;
         }
         if(owner.check_special_defend())
         {
            return undefined;
         }
         if(opp.status_8 == "jingling")
         {
            owner.check_jingling();
            return undefined;
         }
         if(opp.status_8 == "yingzi")
         {
            owner.check_yingzi();
            return undefined;
         }
         _loc2_ = int(Math.random() * 100);
         if((opp.mc.hitPos == "up" || opp.status_2 == "air") && owner.status_1 != "hold_u" && owner.status_1 != "hold_d")
         {
            owner.hold_u();
            return undefined;
         }
         if((opp.mc.hitPos == "up" || opp.status_2 == "air") && owner.status_1 == "hold_d" && _loc2_ < 18 * _level0.level)
         {
            owner.hold_u();
            return undefined;
         }
         if((opp.status_1.indexOf("squat") > -1 || opp.mc.hitPos == "down") && owner.status_1 != "hold_u" && owner.status_1 != "hold_d")
         {
            owner.hold_d();
            return undefined;
         }
         if((opp.status_1.indexOf("squat") > -1 || opp.mc.hitPos == "down") && owner.status_1 == "hold_u" && _loc2_ < 18 * _level0.level)
         {
            owner.hold_d();
            return undefined;
         }
         if(opp.status_3 != "attack" && !opp.hasObj() && owner.holdFreeze == false)
         {
            if(owner.status_1 == "hold_d")
            {
               owner.squat();
            }
            else
            {
               owner.stand();
            }
         }
         else if(owner.holdFreeze == false && opp.hit_over())
         {
            if(!owner.checkAttack())
            {
               if(owner.status_1 == "hold_d")
               {
                  owner.squat();
               }
               else
               {
                  owner.stand();
               }
            }
         }
      };
   }
}
