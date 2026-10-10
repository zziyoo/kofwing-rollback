class Zero_AI_Lv2 extends Zero_AI
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
   function Zero_AI_Lv2()
   {
      super();
      this.skill_init();
      this.combo_init();
      this.combo_rate0 = 38;
      this.attack_rate0 = 48;
      this.hold_rate0 = 48;
      this.attack_s0 = 22;
      this.wait_frame0 = 15;
      this.combo_risk0 = 40;
   }
   function skill_init()
   {
      this.dis_array[0] = 100;
      this.dis_array[1] = 200;
      this.dis_array[2] = 250;
      this.dis_array[3] = 350;
      this.dis_array[4] = 550;
      this.dis_array[5] = 1000;
      this.skill_dis[0] = ["walk_b","squatKick_l","squatPunch","squatKick","squatPunch_l","punch_l","punch","kick","kick_l","dfdf_k","dfdf_p","df_o","db_o","df_o_EX"];
      this.skill_dis[1] = ["walk_b","squatKick_l","squatPunch","squatKick","squatPunch_l","punch_l","punch","kick","kick_l","dfdf_k","dfdf_p","df_o","db_o","df_o_EX"];
      this.skill_dis[2] = ["walk_f","roll_f","squatKick_l","kick_l","squatKick_l","squatPunch","squatKick","squatPunch_l","punch_l","punch","kick","kick_l","dfdf_k","db_o"];
      this.skill_dis[3] = ["walk_f","jump_f","walk_f","squatKick_l","dfdf_k","db_o"];
      this.skill_dis[4] = ["walk_f","roll_f","walk_f","walk_f","dfdf_k","db_o"];
      this.skill_dis[5] = ["walk_f","roll_f","walk_f","walk_f","walk_f","db_p","dfdf_k","db_o"];
      this.dis_num = this.dis_array.length;
   }
   function combo_init()
   {
      this.combo_1 = new Object();
      this.combo_land = new Object();
      this.combo_auto = new Object();
      this.combo_burst = new Object();
      this.delay_frames = new Object();
      this.combo_1.punch_l = ["squatPunch_l","df_o","kick_l"];
      this.comboDis.punch_l = [100,150,250];
      this.comboHeightL.punch_l = [0,50,0];
      this.comboHeightH.punch_l = [5,500,5];
      this.combo_auto.squatPunch = ["f_p_EX","df_ph"];
      this.comboDis.squatPunch = [150,500];
      this.combo_auto.punch = ["f_p_EX","f_p_EX","f_p_EX","df_pl","df_ph","df_pl"];
      this.combo_1.punch2 = ["f_p_EX"];
      this.combo_1.f_p_EX = ["df_pl","dfdf_p","db_pl","db_pl","db_pl","db_pl"];
      this.combo_1.kick = ["dfdf_k"];
      this.combo_1.db_p = ["db_k","df_ph","db_pl"];
      this.combo_1.db_k = ["dfdf_p","fdf_ph","df_ph"];
      this.comboDis.db_k = [150,180,400];
      this.comboHeightL.db_k = [100,50,75];
      this.comboHeightH.db_k = [250,250,250];
      this.combo_1.f_p = ["db_p"];
      this.combo_1.kick_l = ["squatPunch_l","kick_l","squatKick_l","df_ph"];
      this.comboDis.kick_l = [100,120,180,220];
      this.combo_land.jumpSkill_heavyHit = ["fdf_ph","df_pl","dfdf_p","df_ph","dfdf_k"];
      this.comboDis.jumpSkill_heavyHit = [150,180,210,400,1000];
      this.comboHeightL.jumpSkill_heavyHit = [75,75,100,50,200];
      this.comboHeightH.jumpSkill_heavyHit = [250,250,250,250,500];
      this.combo_land.jumpSkill_kick = ["squatPunch","squatPunch_l","squatKick_l"];
      this.comboDis.jumpSkill_kick = [140,175,220];
      this.combo_land.jump_f = ["squatKick_l"];
      this.comboDis.jump_f = [220];
      this.combo_1.squatKick_l = ["dfdf_p","kick_l"];
      this.comboDis.squatKick_l = [150,350];
      this.combo_auto.squatPunch_l = ["punch","kick_l"];
      this.comboDis.squatPunch_l = [100,300];
      this.combo_1.df_ph = ["dfdf_p_can","dfdf_k_can"];
      this.comboDis.df_ph = [200,1000];
      this.combo_1.df_pl = ["dfdf_p_can","dfdf_k_can"];
      this.comboDis.df_pl = [200,1000];
      this.combo_burst.db_pl = ["db_k"];
      this.combo_burst.db_p = ["db_k"];
      this.combo_burst.db_k = ["dfdf_k","dfdf_p"];
      this.combo_burst.fdf_pl = ["dfdf_p","dfdf_k"];
      this.combo_burst.fdf_ph = ["dfdf_p","dfdf_k"];
      this.combo_burst.dfdf_p = ["db_o","df_o","df_o_EX"];
      this.combo_burst.dfdf_k = ["db_o","df_o","df_o_EX"];
      this.action_1 = new Object();
      this.action_1.airAttack = [["fdf_ph","db_k","dfdf_p"],["df_pl","db_k","dfdf_p"],["db_k","dfdf_p"],["fdf_ph"],["df_ph"],["dfdf_k"]];
      this.delay_frames.airAttack = [100,130,180,200,350,1000,1000];
      this.delay_framesL.airAttack = [100,100,100,100,150,300,0];
      this.delay_framesH.airAttack = [250,250,250,250,250,500,300];
      this.action_1.downMove = [["df_o","walk_f","df_o_EX"],["walk_f","db_o"],["db_pl","db_p","db_o"],["db_p","db_o"]];
      this.delay_frames.downMove = [150,280,350,1000];
      this.action_1.down = [["df_o","df_o_EX"],["walk_f"]];
      this.delay_frames.down = [150,1000];
      this.action_1.getup = [["jump_b","squatKick_l","jump","roll_f","db_pl"],["db_k","db_k","db_pl"],["jump_f","db_k"]];
      this.delay_frames.getup = [170,250,350];
      this.action_1.oppRoll = [["pitch","pitch2","squatPunch_l","squatKick_l"],["squatKick_l","kick_l","jump"],["df_pl","roll_f"],["roll_b","roll_f","jump_f"],["db_k","jump_f","df_ph"]];
      this.delay_frames.oppRoll = [100,200,400,450,660];
      this.action_1.oppRollDown = [["squatKick_l","roll_f"],["roll_f"]];
      this.delay_frames.oppRollDown = [220,1000];
      this.action_1.oppLandHurt = [["f_p_EX"],["jump_f"],["walk_f"]];
      this.delay_frames.oppLandHurt = [150,350,1000];
      var _temp_3 = this.action_1;
      var _temp_2 = "oppLand";
      var _temp_1 = ["pitch","pitch2","squatKick_l","squatPunch_l"];
      "squatKick_l";
      _temp_3[_temp_2] = [_temp_1.kick_l];
      this.delay_frames.oppLand = [100,250];
      this.action_1.oppJump = [["df_pl","dfdf_p"],["db_k","kick","fdf_ph","dfdf_p"],["db_k","fdf_pl","punch_l","dfdf_p"],["jump","db_pl"],["jump","dfdf_k"],["df_ph"],["roll_f"]];
      this.delay_frames.oppJump = [100,150,200,250,350,380,1000];
      this.action_1.wander = [["roll_b","jump_b"],["wait","jump_b","walk_f"],["walk_f"]];
      this.delay_frames.wander = [150,300,1000];
      this.action_1.defend = [["walk_b","walk_b","roll_f"],["walk_b","roll_b"],["walk_b","roll_f","jump_b","roll_b"],["walk_b"]];
      this.delay_frames.defend = [130,200,400,1000];
      this.action_1.defendAttack = [["db_k","fdf_ph","dfdf_p"],["db_k","fdf_pl"],["df_ph"],["dfdf_k"]];
      this.delay_frames.defendAttack = [150,250,350,1000];
      this.action_1.defend_f = [["squatKick_l","kick_l"],["df_ph"]];
      this.delay_frames.defend_f = [250,350];
      this.action_1.defend_dashf = [["roll_f","fdf_pl"],["squatPunch_l"],["squatKick_l","kick_l"],["df_ph"]];
      this.delay_frames.defend_dashf = [150,200,300,400];
      this.action_1.defend_h = [["hold_u","hold_u","roll_f"],["hold_u","roll_b"],["hold_u"]];
      this.delay_frames.defend_h = [130,200,1000];
      this.action_1.onEgde = [["hold_u","roll_f"],["jump_f","walk_f"],["hold_u","jump_b"]];
      this.delay_frames.onEgde = [100,250,300];
      this.action_1.pos_down = [["pitch"],["squatKick_l","jump","walk_f"],["squatKick","jump_b","walk_f"],["walk_f","roll_f"],["jump_f","walk_f"]];
      this.delay_frames.pos_down = [100,150,180,240,450];
      this.action_1.pos_up = [["pitch"],["jump","jump_b","walk_f","f_p"],["jump_f","roll_f","walk_f"],["jump_f","jump","walk_f"]];
      this.delay_frames.pos_up = [100,180,250,450];
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
         var _loc9_;
         var _loc10_;
         var _loc6_;
         var _loc5_;
         var _loc15_;
         var _loc7_;
         var _loc13_;
         var _loc4_;
         var _loc3_;
         var _loc11_;
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
            if(opp.status_6 == "catch" && this.getDis() < 250)
            {
               owner.toSkill("jump_b");
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
               }
               if(_loc3_[_loc2_].area.obj_level != "undefined")
               {
                  _loc9_ = _loc3_[_loc2_].area.obj_level;
                  _loc10_ = _loc3_[_loc2_].area._width;
                  _loc6_ = _loc3_[_loc2_].area._height;
                  _loc5_ = _loc3_[_loc2_].area.obj_Vx;
                  _loc7_ = _loc3_[_loc2_].area._y;
                  _loc13_ = _loc3_[_loc2_].area.breakDefend;
                  _loc11_ = _loc3_[_loc2_].area._x;
                  _loc12_ = _loc3_[_loc2_].area.hitPos;
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
            if(_loc4_ <= 180 && _loc4_ > 130 && _loc2_ < 0.1)
            {
               owner.roll_f();
               return undefined;
            }
            if(_loc15_ == "undefined" || _loc9_ == 1000)
            {
               return undefined;
            }
            if(_loc4_ <= 350 && _loc4_ > 250 && _loc2_ < 0.18 * _level0.level)
            {
               if(!_loc15_)
               {
                  owner.toSkill("heavyHit");
                  return undefined;
               }
            }
            else if(_loc4_ <= 350 && _loc4_ > 300 && _loc2_ < 0.18 * _level0.level)
            {
               if(!_loc15_)
               {
                  owner.toSkill("df_pl");
                  return undefined;
               }
            }
            else if(_loc4_ > 400 && _loc2_ < 0.1 * _level0.level)
            {
               owner.toSkill("dfdf_k");
               return undefined;
            }
            if(opp.getObjNum() > 1)
            {
               return undefined;
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
                  owner.roll_f();
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
         _loc2_ = int(Math.random() * 100);
         if((opp.mc.hitPos == "up" || opp.status_2 == "air") && owner.status_1 != "hold_u" && _loc2_ < 18 * _level0.level)
         {
            owner.hold_u();
            return undefined;
         }
         if((opp.status_1.indexOf("squat") > -1 || opp.mc.hitPos == "down") && owner.status_1 != "hold_d" && _loc2_ < 18 * _level0.level)
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
