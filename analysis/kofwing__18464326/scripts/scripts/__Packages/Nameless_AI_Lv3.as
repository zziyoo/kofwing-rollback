class Nameless_AI_Lv3 extends Nameless_AI
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
   function Nameless_AI_Lv3()
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
      this.dis_array[3] = 300;
      this.dis_array[4] = 400;
      this.dis_array[5] = 450;
      this.dis_array[6] = 550;
      this.dis_array[7] = 1000;
      this.skill_dis[0] = ["walk_b"];
      this.skill_dis[1] = ["walk_b"];
      this.skill_dis[2] = ["walk_f"];
      this.skill_dis[3] = ["walk_f","walk_f","roll_f","db_kl","jump_f"];
      this.skill_dis[4] = ["df_ph","walk_f"];
      this.skill_dis[5] = ["df_ph","df_pl","roll_f","walk_f"];
      this.skill_dis[6] = ["walk_f","walk_f","walk_f","walk_f","roll_f"];
      this.skill_dis[7] = ["df_ph","walk_f","walk_f","walk_f","walk_f","walk_f","df_k"];
      this.dis_num = this.dis_array.length;
   }
   function combo_init()
   {
      this.combo_1 = new Object();
      this.combo_land = new Object();
      this.combo_auto = new Object();
      this.combo_burst = new Object();
      this.delay_frames = new Object();
      this.combo_1.punch_l = ["punch2","punch"];
      this.comboDis.punch_l = [130,200];
      this.combo_1.squatPunch_l = ["punch2","f_k"];
      this.comboDis.squatPunch_l = [130,200];
      this.combo_1.punch2 = ["f_k","f_k","f_k","df_k"];
      this.combo_1.squatKick_l = ["punch2","f_p","df_k"];
      this.comboDis.squatKick_l = [130,180,350];
      this.combo_1.kick = ["f_p","df_k","df_k"];
      this.combo_1.kick2 = ["df_o"];
      this.combo_1.kick_l = ["punch2","f_p","df_k"];
      this.comboDis.kick_l = [130,170,1000];
      this.combo_1.f_k = ["df_k","df_k","df_k","df_k","df_k","df_k","f_p","df_pl","df_pl","df_pl"];
      this.combo_1.df_k = ["db_kl","f_p","df_pl","df_pl","df_pl"];
      this.combo_1.fdf_pl = ["dfdf_p_can"];
      this.combo_1.f_p = ["dfdf_p_can","walk_f"];
      this.comboDis.f_p = [180,500];
      this.combo_power.f_p = ["dfdf_p_max_can","walk_f"];
      this.comboDis.f_p = [180,500];
      this.combo_1.squatPunch = ["f_k","f_p","f_k","df_k","f_k"];
      this.combo_1.db_kl = ["kick2","fdf_ph","dfdf_k","dfdf_p"];
      this.combo_land.jumpSkill_punch = ["squatKick_l","punch2","squatPunch","df_k"];
      this.comboDis.jumpSkill_kick = [80,120,260,350];
      this.combo_land.jumpSkill_punch_l = ["squatKick_l","punch2","squatPunch","df_k"];
      this.comboDis.jumpSkill_punch_l = [80,120,260,350];
      this.combo_land.jumpSkill_kick_l = ["squatKick_l","punch2","squatPunch","df_k"];
      this.comboDis.jumpSkill_kick_l = [80,120,260,350];
      this.combo_land.jump = ["squatKick_l"];
      this.comboDis.jump = [150];
      this.combo_land.jump_f = ["squatKick_l"];
      this.comboDis.jump_f = [150];
      this.combo_land.jumpSkill_heavyHit = ["dfdf_k"];
      this.comboDis.jumpSkill_heavyHit = [1000];
      this.comboHeightL.jumpSkill_heavyHit = [75];
      this.comboHeightH.jumpSkill_heavyHit = [500];
      this.combo_burst.df_k = ["f_p","db_k","db_k"];
      this.combo_burst.f_p = ["db_k","df_k","df_pl"];
      this.combo_burst.db_k = ["df_k","df_k","fdf_ph"];
      this.combo_burst.fdf_ph = ["dfdf_p"];
      this.combo_burst.dfdf_p = ["dfdf_k","db_o"];
      this.combo_burst.dbdf_k = ["dfdf_p","df_o"];
      this.combo_oppOnEgde.dfdf_p = [true,true];
      this.combo_oppOnEgde.dbdf_k = [true,true];
      this.action_1 = new Object();
      this.action_1.airAttack = [["dfdf_p"],["db_o","fdf_ph"],["db_kl","fdf_ph"],["fdf_pl"],["dfdf_k","dfdf_k","db_k"]];
      this.delay_frames.airAttack = [150,150,280,300,1000];
      this.delay_framesL.airAttack = [175,150,100,50,150];
      this.delay_framesH.airAttack = [500,225,150,100,225];
      this.action_1.downMovePower = [["df_o","walk_f"]];
      this.delay_frames.downMovePower = [1000];
      this.action_1.downMove = [["df_o","walk_f"]];
      this.delay_frames.downMove = [1000];
      this.action_1.down = [["df_o","walk_f"]];
      this.delay_frames.down = [1000];
      this.action_1.downPower = [["df_o","walk_f"]];
      this.delay_frames.downPower = [1000];
      this.action_1.getup = [["jump_b","jump_f","jump","squatKick_l","squatPunch_l","roll_f","roll_b","roll_f"],["roll_f","jump","jump_f","walk_f"],["df_pl","walk_f"],["df_k","df_ph","walk_f"],["walk_f"]];
      this.delay_frames.getup = [150,200,250,380,550];
      this.action_1.oppRollDown = [["roll_f","squatKick_l"],["roll_f","db_kl"],["df_pl","db_kl"],["df_ph","db_k"]];
      this.delay_frames.oppRollDown = [150,200,250,380];
      this.action_1.oppLandHurt = [["punch_l","squatPunch_l","squatKick_l"],["punch2"],["kick"],["f_p"]];
      this.delay_frames.oppLandHurt = [80,110,160,280];
      this.action_1.oppLand = [["squatKick_l","squatPunch_l","kick_l","punch_l"],["kick_l"]];
      this.delay_frames.oppLand = [150,200];
      this.action_1.oppRoll = [["squatPunch_l","punch_l","squatKick_l","roll_f"],["jump_b","jump","jump_f","dfdf_k"],["df_pl","jump_b","roll_f","db_kl","df_k"],["df_ph","jump_b","db_k"],["dfdf_k","roll_f","roll_b"]];
      this.delay_frames.oppRoll = [150,400,500,600,1000];
      this.action_1.oppJump = [["fdf_ph","dfdf_p","fdf_pl"],["db_o","fdf_ph","dfdf_p","fdf_pl","db_kl"],["fdf_ph","fdf_pl","db_kl"],["fdf_pl","fdf_pl","db_k"],["dfdf_k"]];
      this.delay_frames.oppJump = [230,250,280,300,1000];
      this.action_1.wander = [["roll_b","jump_b"],["jump_b","walk_f"],["walk_f"]];
      this.delay_frames.wander = [150,300,1000];
      this.action_1.defend = [["walk_b","walk_b","roll_f"],["walk_b","roll_b"],["walk_b","roll_f","jump_b","roll_b"],["walk_b"]];
      this.delay_frames.defend = [130,200,400,1000];
      this.action_1.defendAttack = [["fdf_ph","dfdf_p","fdf_pl","dfdf_k","df_o"],["db_o","fdf_ph","dfdf_p","fdf_pl","dfdf_k","df_o","db_kl"],["fdf_ph","fdf_pl","dfdf_k","df_o","db_kl","db_k"],["fdf_pl","dfdf_k","df_o","db_k"],["dfdf_k","df_o"]];
      this.delay_frames.defendAttack = [230,250,280,300,1000];
      this.action_1.defend_f = [["squatKick_l","kick_l"],["jump_b"],["roll_f"]];
      this.delay_frames.defend_f = [150,250,1000];
      this.action_1.defend_dashf = [["roll_f","squatPunch_l","squatKick_l"],["squatPunch_l"],["jump_f"],["roll_f"]];
      this.delay_frames.defend_dashf = [150,200,350,1000];
      this.action_1.defend_h = [["hold_u","hold_u","hold_u","hold_u","roll_f"],["hold_u","hold_u","hold_u","roll_b"],["hold_u"]];
      this.delay_frames.defend_h = [130,400,1000];
      this.action_1.pos_down = [["squatKick_l","jump","walk_f"],["squatKick","jump_b","walk_f","kick"],["walk_f"],["df_k"],["jump_f","walk_f","walk_f"]];
      this.delay_frames.pos_down = [150,180,260,310,450];
      this.action_1.pos_up = [["jump","jump_b","walk_f"],["jump_f","walk_f"],["jump_f","jump","walk_f","walk_f"]];
      this.delay_frames.pos_up = [150,250,450];
   }
   function move_hold()
   {
      clearInterval(this.delayTimer);
      var opp = this.opp;
      var _loc16_ = this.dir;
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
         var _loc15_ = int(Math.random() * 100);
         if((opp.mc.hitPos == "up" || opp.status_2 == "air") && owner.status_1 != "hold_u" && owner.status_1 != "hold_d")
         {
            owner.hold_u();
            return undefined;
         }
         if((opp.mc.hitPos == "up" || opp.status_2 == "air") && owner.status_1 == "hold_d" && _loc15_ < 18 * _level0.level)
         {
            owner.hold_u();
            return undefined;
         }
         if((opp.status_1.indexOf("squat") > -1 || opp.mc.hitPos == "down") && owner.status_1 != "hold_u" && owner.status_1 != "hold_d")
         {
            owner.hold_d();
            return undefined;
         }
         if((opp.status_1.indexOf("squat") > -1 || opp.mc.hitPos == "down") && owner.status_1 == "hold_u" && _loc15_ < 18 * _level0.level)
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
         var _loc9_;
         var _loc11_;
         var _loc6_;
         var _loc5_;
         var _loc10_;
         var _loc7_;
         var _loc13_;
         var _loc4_;
         var _loc3_;
         var _loc14_;
         var _loc12_;
         var _loc8_;
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
            _loc9_ = 1000;
            _loc4_ = opp.getObjDis();
            _loc3_ = opp.getObjs();
            _loc2_ = 0;
            while(_loc2_ < _loc3_.length)
            {
               this.objName = _loc3_[_loc2_].objName;
               _loc8_ = Math.random();
               if(this.objName == "black_dot" && _loc8_ < 0.18 * _level0.level)
               {
                  if(_loc4_ <= 175 && _loc4_ > 130)
                  {
                     owner.roll_b();
                  }
                  else if(_loc4_ <= 250 && _loc4_ > 175)
                  {
                     owner.roll_f();
                  }
                  else if(_loc4_ > 250 && _loc4_ < 325)
                  {
                     owner.toSkill("db_k");
                  }
               }
               if(_loc3_[_loc2_].area.obj_level != "undefined")
               {
                  _loc9_ = _loc3_[_loc2_].area.obj_level;
                  _loc11_ = _loc3_[_loc2_].area._width;
                  _loc6_ = _loc3_[_loc2_].area._height;
                  _loc5_ = _loc3_[_loc2_].area.obj_Vx;
                  _loc7_ = _loc3_[_loc2_].area._y;
                  _loc13_ = _loc3_[_loc2_].area.breakDefend;
                  _loc14_ = _loc3_[_loc2_].area._x;
                  _loc12_ = _loc3_[_loc2_].area.hitPos;
                  _loc10_ = _loc3_[_loc2_].area.people;
               }
               _loc2_ = _loc2_ + 1;
            }
            _loc2_ = Math.random();
            if(_loc11_ > 250)
            {
               return undefined;
            }
            if(_loc4_ < 130)
            {
               return undefined;
            }
            _loc2_ = Math.random();
            if(_loc10_ == "undefined" || _loc9_ == 1000)
            {
               return undefined;
            }
            if(_loc4_ > 250 && _loc4_ < 450 && _loc2_ < 0.18 * _level0.level)
            {
               owner.toSkill("db_k");
               return undefined;
            }
            if(_loc4_ <= 180 && _loc4_ > 130 && (_loc2_ < 0.03 * _level0.level || _loc13_ || _loc12_ == "all"))
            {
               owner.roll_f();
               return undefined;
            }
            if((_loc10_ || _loc9_ > 3) && _loc2_ <= 0.75)
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
