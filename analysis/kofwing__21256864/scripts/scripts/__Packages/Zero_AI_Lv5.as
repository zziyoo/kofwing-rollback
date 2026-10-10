class Zero_AI_Lv5 extends Zero_AI
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
   function Zero_AI_Lv5()
   {
      super();
      this.skill_init();
      this.combo_init();
      this.combo_rate0 = 100;
      this.attack_rate0 = 70;
      this.hold_rate0 = 100;
      this.attack_s0 = 50;
      this.wait_frame0 = 0;
      this.combo_risk0 = 15;
   }
   function skill_init()
   {
      this.dis_array[0] = 100;
      this.dis_array[1] = 200;
      this.dis_array[2] = 300;
      this.dis_array[3] = 375;
      this.dis_array[4] = 425;
      this.dis_array[5] = 1000;
      this.skill_dis[0] = ["walk_b"];
      this.skill_dis[1] = ["walk_b"];
      this.skill_dis[2] = ["dash_f"];
      this.skill_dis[3] = ["dash_f","dash_f"];
      this.skill_dis[4] = ["dash_f","dash_f","dash_f","dash_f"];
      this.skill_dis[5] = ["dash_f","dash_f","dash_f","dash_f","dash_f","dash_f","dash_f","dash_f"];
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
      this.combo_1.punch_l = ["squatPunch_l","df_pl","db_pl","kick_l"];
      this.comboDis.punch_l = [100,150,200,250];
      this.comboHeightL.punch_l = [0,0,0,0];
      this.comboHeightH.punch_l = [5,5,5,5];
      this.combo_auto.squatPunch = ["f_p_EX","df_ph"];
      this.comboDis.squatPunch = [150,500];
      this.combo_1.punch = ["f_p_EX","f_p_EX","f_p_EX","df_pl","df_ph","df_pl"];
      this.combo_1.punch2 = ["f_p_EX"];
      this.combo_1.f_p_EX = ["db_pl","dfdf_p","df_ph","fdf_ph","fdf_pl","db_k"];
      this.combo_super.f_p_EX = ["dfdf_p","dfdf_p","df_ph","dfdf_p","fdf_pl","db_k"];
      this.combo_defend.f_p_EX = ["dfdf_p","dfdf_p","df_ph","dfdf_p","fdf_pl","db_k"];
      this.combo_power.f_p_EX = ["dfdf_p","dfdf_p","df_ph","dfdf_p","fdf_pl","dfdf_p"];
      this.combo_oppOnEgde.f_p_EX = [true,1,1,1,1,1];
      this.combo_1.kick = ["dfdf_k"];
      this.combo_auto.db_p = ["df_pl","db_k","db_pl","df_ph","dash_f"];
      this.combo_super.db_p = ["dfdf_p","dfdf_k","dfdf_k","dfdf_k","dfdf_k"];
      this.combo_defend.db_p = ["df_o_EX","db_k","dfdf_k","dfdf_k","dfdf_k"];
      this.combo_power.db_p = ["dfdf_p","db_k","dfdf_k","dfdf_k","dfdf_k"];
      this.comboDis.db_p = [180,225,275,325,1000];
      this.combo_1.db_k = ["dfdf_p","fdf_ph","df_ph"];
      this.comboDis.db_k = [150,180,400];
      this.comboHeightL.db_k = [150,150,125];
      this.comboHeightH.db_k = [250,250,250];
      this.combo_1.f_p = ["db_p"];
      this.combo_1.kick_l = ["df_pl","squatKick_l","db_pl","df_ph"];
      this.comboDis.kick_l = [175,250,300,350];
      this.comboHeightL.kick_l = [0,0,0,0];
      this.comboHeightH.kick_l = [5,5,5,5];
      this.combo_land.jumpSkill_heavyHit = ["fdf_ph","df_pl","dfdf_p","df_ph"];
      this.comboDis.jumpSkill_heavyHit = [150,180,210,400];
      this.comboHeightL.jumpSkill_heavyHit = [125,125,150,150];
      this.comboHeightH.jumpSkill_heavyHit = [250,250,250,300];
      this.combo_land.jumpSkill_kick = ["squatPunch_l","kick_l"];
      this.comboDis.jumpSkill_kick = [200,300];
      this.combo_land.jump_f = ["squatKick_l"];
      this.comboDis.jump_f = [300];
      this.combo_1.squatPunch_l = ["punch","kick_l"];
      this.comboDis.squatPunch_l = [200,300];
      this.combo_burst.db_pl = ["db_k"];
      this.combo_burst.db_p = ["db_k"];
      this.combo_burst.fdf_pl = ["dfdf_p","dfdf_k"];
      this.combo_burst.fdf_ph = ["dfdf_p","dfdf_k"];
      this.action_1 = new Object();
      this.action_1.airAttack = [["fdf_ph","fdf_ph","fdf_ph","jump_f","db_k","db_pl"],["dfdf_p","fdf_pl","df_pl"],["df_ph","fdf_ph","fdf_pl"],["fdf_pl","db_k","df_ph"],["fdf_pl"],["dfdf_k"]];
      this.delay_frames.airAttack = [200,200,250,350,350,1000];
      this.delay_framesL.airAttack = [250,125,175,175,175,500];
      this.delay_framesH.airAttack = [400,175,225,225,250,1000];
      this.action_1.downMove = [["db_pl","df_o","df_o_EX"],["db_pl","db_pl","db_pl","roll_f","db_o"],["db_pl","db_pl","db_pl","db_o"],["db_pl","db_pl","db_pl","db_o"],["dash_f","db_o"]];
      this.delay_frames.downMove = [180,225,300,350,1000];
      this.action_1.down = [["df_o","df_o_EX"],["db_pl","db_p"],["db_p"],["db_p"]];
      this.delay_frames.down = [180,350,600,1000];
      this.action_1.getup = [["jump_b","jump","dash_b","squatPunch_l","squatPunch_l","df_o_EX"],["jump_b","jump","dash_b","df_pl","squatPunch_l","squatPunch_l"],["jump_f"],["jump_f","db_k","kick_l"],["df_ph"],["dash_f","db_p"],["db_p"]];
      this.delay_frames.getup = [150,200,275,325,400,600,1000];
      this.action_1.oppRoll = [["jump_b"],["dash_b","jump_b"],["df_pl","roll_b","dash_b","jump_f","jump","squatPunch_l","squatKick_l","punch_l","kick_l"],["db_k","jump_f","df_ph"]];
      this.delay_frames.oppRoll = [200,400,450,660];
      this.action_1.oppRollDown = [["squatPunch_l","kick_l","squatKick_l","dash_b","df_pl","punch_l"],["kick_l","squatKick_l"],["dash_f"],["db_p"]];
      this.delay_frames.oppRollDown = [200,300,650,1000];
      this.action_1.oppLandHurt = [["squatPunch_l","squatPunch_l"],["squatPunch_l","squatPunch_l","kick_l","punch_l"],["jump_f","df_ph"],["dash_f"]];
      this.delay_frames.oppLandHurt = [125,300,325,1000];
      this.action_1.oppLand = [["squatKick_l","squatPunch_l","kick_l","df_pl","punch_l","jump_b","squatPunch_l","squatPunch_l","df_o_EX"],["squatKick_l","squatPunch_l","kick_l","df_pl","punch_l","jump_b","dash_b","jump_f","squatPunch_l","squatPunch_l"],["jump_f","squatKick_l","kick_l","dash_f","dash_b","dash_f","dash_f","dash_f"],["jump_f","df_ph","kick_l","squatKick_l","dash_f","dash_f","dash_f","dash_f","dash_f","dash_f"]];
      this.delay_frames.oppLand = [150,200,300,350];
      this.action_1.oppJump = [["db_k","db_k","db_k","df_pl","fdf_ph","fdf_pl"],["db_k","db_k","db_k","fdf_ph"],["db_k","db_k","db_k","db_k","fdf_pl","punch_l","dfdf_p","db_pl"],["db_k","db_k","db_k","db_pl","fdf_pl"],["dfdf_k"],["df_ph"],["jump_f","jump"]];
      this.delay_frames.oppJump = [100,150,200,250,350,380,450];
      this.action_1.wander = [["roll_b","jump_b"],["wait","jump_b","walk_f"],["dash_f"]];
      this.delay_frames.wander = [150,300,1000];
      this.action_1.defend = [["walk_b","walk_b","roll_f"],["walk_b","roll_b"],["walk_b","dash_b","jump_b","roll_b"],["walk_b"]];
      this.delay_frames.defend = [130,200,400,1000];
      this.action_1.defendAttack = [["db_k","db_k","db_k","db_k","fdf_ph","dfdf_p","df_pl","fdf_pl"],["db_k","db_k","db_k","db_k","fdf_pl"],["df_ph"],["dfdf_k"]];
      this.delay_frames.defendAttack = [200,250,350,1000];
      this.action_1.defend_f = [["squatKick_l","kick_l"]];
      this.delay_frames.defend_f = [250];
      this.action_1.defend_dashf = [["roll_f","fdf_pl"],["squatPunch_l"],["squatKick_l","kick_l"]];
      this.delay_frames.defend_dashf = [150,200,300];
      this.action_1.defend_h = [["hold_u","hold_u","roll_f"],["hold_u","roll_b"],["hold_u"]];
      this.delay_frames.defend_h = [130,200,1000];
      this.action_1.onEgde = [["hold_u","roll_f"],["jump_f","dash_f"],["hold_u","jump_b"]];
      this.delay_frames.onEgde = [100,250,300];
      this.action_1.pos_down = [["squatKick_l","jump","dash_f","punch_l","squatPunch_l","punch_l","df_o_EX"],["squatKick_l","squatKick","jump_b","dash_f","punch_l","squatPunch_l","kick_l","df_pl"],["dash_f","dash_b","kick_l","squatKick_l"],["df_ph"],["jump_f","dash_f"]];
      this.delay_frames.pos_down = [150,200,300,400,450];
      this.action_1.pos_up = [["squatKick_l","jump","jump_b","dash_f","f_p","squatPunch_l","punch_l","df_o_EX"],["squatKick_l","jump","jump_b","dash_f","f_p","squatPunch_l","df_pl"],["squatKick_l","jump_f","dash_b","dash_f","squatPunch_l","kick_l"],["df_ph"],["jump_f","jump","dash_f"]];
      this.delay_frames.pos_up = [150,200,300,400,450];
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
         var _loc10_;
         var _loc11_;
         var _loc6_;
         var _loc5_;
         var _loc9_;
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
            _loc10_ = 1000;
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
               }
               if(_loc3_[_loc2_].area.obj_level != "undefined")
               {
                  _loc10_ = _loc3_[_loc2_].area.obj_level;
                  _loc11_ = _loc3_[_loc2_].area._width;
                  _loc6_ = _loc3_[_loc2_].area._height;
                  _loc5_ = _loc3_[_loc2_].area.obj_Vx;
                  _loc7_ = _loc3_[_loc2_].area._y;
                  _loc13_ = _loc3_[_loc2_].area.breakDefend;
                  _loc14_ = _loc3_[_loc2_].area._x;
                  _loc12_ = _loc3_[_loc2_].area.hitPos;
                  _loc9_ = _loc3_[_loc2_].area.people;
               }
               _loc2_ = _loc2_ + 1;
            }
            _loc2_ = Math.random();
            _loc2_ = Math.random();
            if(_loc11_ > 250)
            {
               return undefined;
            }
            if(_loc4_ < 130)
            {
               return undefined;
            }
            if(_loc9_ == "undefined" || _loc10_ == 1000)
            {
               return undefined;
            }
            if(_loc4_ <= 300 && _loc4_ > 250 && _loc2_ < 0.18 * _level0.level)
            {
               if(!_loc9_)
               {
                  owner.toSkill("heavyHit");
                  return undefined;
               }
            }
            else if(_loc4_ <= 350 && _loc4_ > 300 && _loc2_ < 0.18 * _level0.level)
            {
               if(!_loc9_)
               {
                  owner.toSkill("df_pl");
                  return undefined;
               }
            }
            else if(_loc4_ > 350 && _loc2_ < 0.1 * _level0.level)
            {
               owner.toSkill("dfdf_k");
               return undefined;
            }
            if(_loc4_ <= 180 && _loc4_ > 130 && (_loc2_ < 0.03 * _level0.level || _loc13_ || _loc12_ == "all"))
            {
               owner.roll_f();
               return undefined;
            }
            if((_loc9_ || _loc10_ > 3) && _loc2_ <= 0.75)
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
