class Terry_AI_Lv3 extends Terry_AI
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
   function Terry_AI_Lv3()
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
      this.dis_array[1] = 200;
      this.dis_array[2] = 250;
      this.dis_array[3] = 300;
      this.dis_array[4] = 350;
      this.dis_array[5] = 450;
      this.dis_array[6] = 550;
      this.dis_array[7] = 1000;
      this.skill_dis[0] = ["walk_b","squatKick_l"];
      this.skill_dis[1] = ["walk_f"];
      this.skill_dis[2] = ["walk_f","walk_f","walk_f","walk_f","walk_f","walk_f","df_ph"];
      this.skill_dis[3] = ["walk_f","walk_f","walk_f","walk_f","walk_f","walk_f","walk_f","roll_f"];
      this.skill_dis[4] = ["walk_f","roll_f","db_pl","walk_f"];
      this.skill_dis[5] = ["walk_f","walk_f","df_p_EX","roll_f"];
      this.skill_dis[6] = ["walk_f","walk_f","walk_f","walk_f","walk_f","roll_f","df_p_EX","walk_f","roll_b"];
      this.skill_dis[7] = ["walk_f","walk_f","roll_f","walk_f","walk_f","walk_f","walk_f","walk_f","db_p"];
      this.dis_num = this.dis_array.length;
   }
   function combo_init()
   {
      this.combo_1 = new Object();
      this.combo_land = new Object();
      this.combo_auto = new Object();
      this.combo_burst = new Object();
      this.combo_power = new Object();
      this.delay_frames = new Object();
      this.combo_1.squatKick_l = ["squatPunch_l","punch"];
      this.comboDis.squatKick_l = [100,300];
      this.combo_1.punch = ["f_p2","f_p2","df_ph"];
      this.combo_1.punch2 = ["f_p2"];
      this.combo_1.kick3 = ["f_p2","f_p2","df_ph"];
      this.combo_1.kick2 = ["f_p2"];
      this.combo_1.punch_l2 = ["squatPunch_l","squatKick_l"];
      this.combo_1.kick_l2 = ["squatPunch_l","squatKick_l"];
      this.combo_auto.f_p2 = ["df_ph","df_ph","df_ph","df_ph","df_p_EX"];
      this.combo_auto.f_p = ["df_ph","df_ph","df_ph","df_ph","df_p_EX"];
      this.combo_1.df_ph = ["df_k_EX","df_k_EX","df_k_EX","df_k_EX","df_k_EX","db_pl","db_k"];
      this.combo_1.db_kh = ["db_k"];
      this.combo_1.squatPunch_l = ["df_p_ai","df_p_ai","kick","kick","kick"];
      this.combo_1.punch_l = ["punch","kick","punch","kick","punch","kick","squatPunch"];
      this.combo_1.squatPunch = ["f_p2"];
      this.combo_1.df_p = ["dfdf_k","dbdf_p","fdf_ph","db_pl","fdf_kl","fdf_k","fdf_ph","db_pl","fdf_kl","fdf_k"];
      this.combo_power.df_p = ["dfdf_k","dbdf_p","df_o","fdf_ph","db_pl","fdf_kl","fdf_k"];
      this.combo_1.df_p_ai = ["f_p2"];
      this.combo_1.df_k_EX = ["fdf_p","db_kh","walk_f","db_kh","db_kh","df_ph"];
      this.delay_frames.df_k_EX = [0,6,6,6,6,6];
      this.combo_land.jump_f = ["squatKick_l","squatKick"];
      this.comboDis.jump_f = [150,200];
      this.combo_land.jumpSkill_kick = ["squatKick_l","punch","kick"];
      this.comboDis.jumpSkill_kick = [120,150,200];
      this.combo_land.jumpSkill_kick_l = ["squatKick_l","punch","kick"];
      this.comboDis.jumpSkill_kick_l = [120,150,200];
      this.combo_land.jumpSkill_punch = ["squatKick_l","punch","squatKick"];
      this.comboDis.jumpSkill_punch = [120,150,200];
      this.combo_land.jump = ["squatKick_l","squatKick"];
      this.comboDis.jump = [150,200];
      this.combo_land.jump_f = ["squatKick_l","squatKick"];
      this.comboDis.jump = [150,200];
      this.combo_land.jumpSkill_heavyHit = ["dfdf_k","fdf_ph","dbdf_p"];
      this.comboDis.jumpSkill_heavyHit = [300,190,200];
      this.comboHeightL.jumpSkill_heavyHit = [75,125,175];
      this.comboHeightH.jumpSkill_heavyHit = [125,175,250];
      this.combo_burst.dfdf_k = ["dbdf_p","df_o","df_ph"];
      this.combo_burst.dbdf_p = ["db_o","dfdf_k","db_kh"];
      this.action_1 = new Object();
      this.action_1.airAttack = [["fdf_ph","fdf_kl","fdf_k"],["df_p","df_p","df_p","df_p","df_p","dfdf_k","dbdf_p"],["db_k","db_k","db_k","db_k","df_ph"],["db_pl"],["df_o","db_p"]];
      this.delay_frames.airAttack = [190,190,270,330,500];
      this.delay_framesL.airAttack = [75,125,250,125,125];
      this.delay_framesH.airAttack = [125,250,350,500,200];
      this.action_1.downMove = [["walk_f"]];
      this.delay_frames.downMove = [1000];
      this.action_1.down = [["db_o"],["df_p_EX"]];
      this.delay_frames.down = [300,450];
      this.action_1.getup = [["jump_f","jump","squatKick_l","squatPunch_l","roll_f"],["roll_f","squatKick_l","jump_f"],["df_ph","walk_f"],["df_p_EX","db_pl"],["df_p_EX"]];
      this.delay_frames.getup = [150,250,300,350,480];
      this.action_1.oppRollDown = [["roll_f","squatKick_l"],["squatKick"],["roll_f"],["db_pl","df_p_EX"],["df_p_EX"]];
      this.delay_frames.oppRollDown = [150,200,300,350,450];
      this.action_1.oppLandHurt = [["squatKick_l","squatPunch_l","punch_l"],["squatKick_l","kick_l","kick_l"],["df_k_EX","kick_l","df_p_EX","df_ph"]];
      this.delay_frames.oppLandHurt = [100,200,280];
      this.action_1.oppLand = [["squatKick_l","squatPunch_l","punch_l","squatPunch_l"],["kick_l","kick_l","kick3"],["walk_f"],["df_p_EX","df_ph","walk_f","walk_f","walk_f","walk_f","walk_f","walk_f"]];
      this.delay_frames.oppLand = [150,250,400,1000];
      this.action_1.oppRoll = [["punch_l","squatPunch_l","squatKick_l","jump","jump_b"],["jump_f"],["jump_b","roll_f","kick_l"],["db_pl","df_p_EX"]];
      this.delay_frames.oppRoll = [150,250,350,550];
      this.action_1.oppJump = [["df_p","fdf_ph","fdf_ph","fdf_ph","fdf_p"],["fdf_ph","fdf_ph","fdf_ph","fdf_p"],["dbdf_p","df_k_EX","fdf_p"],["dfdf_k","heavyHit","kick_l","kick_l","kick_l","df_ph","db_o"],["df_p_EX","db_pl"],["jump_f","dash_b","db_p","df_o"]];
      this.delay_frames.oppJump = [140,190,250,300,450,550];
      this.action_1.wander = [["roll_b","jump_b"],["wait","jump_b","walk_f"],["walk_f","wait"]];
      this.delay_frames.wander = [150,300,1000];
      this.action_1.defend = [["walk_b","walk_b","roll_f"],["walk_b","roll_b"],["walk_b","roll_f","jump_b","roll_b"],["walk_b","wait"]];
      this.delay_frames.defend = [130,200,400,1000];
      this.action_1.defendAttack = [["roll_f","fdf_ph","dfdf_k"],["dbdf_p","db_pl","df_o","dfdf_k","fdf_p"],["db_p","db_pl","db_o"],["db_p","db_pl","roll_f","df_o"],["roll_b","db_p"]];
      this.delay_frames.defendAttack = [190,250,300,350,450];
      this.action_1.defend_f = [["squatKick_l","kick_l"],["jump_b"],["df_p_EX"]];
      this.delay_frames.defend_f = [150,350,500];
      this.action_1.defend_dashf = [["roll_f","kick_l","squatKick_l"],["df_ph"],["df_p_EX"],["roll_f"]];
      this.delay_frames.defend_dashf = [200,350,450,1000];
      this.action_1.defend_h = [["hold_u","hold_d","roll_f"],["hold_u","roll_b"],["hold_u","hold_d"]];
      this.delay_frames.defend_h = [130,200,1000];
      this.action_1.onEgde = [["hold_u","roll_f","fdf_p","fdf_ph"],["jump_f","walk_f"],["hold_u","jump_b"]];
      this.delay_frames.onEgde = [100,250,300];
      this.action_1.pos_down = [["squatKick_l","jump","walk_f"],["squatKick","jump_b","walk_f"],["walk_f","kick_l","kick3"],["jump_f","walk_f"]];
      this.delay_frames.pos_down = [150,180,240,450];
      this.action_1.pos_up = [["jump","jump_b","walk_f","f_p"],["jump_f","walk_f","f_p","kick_l","kick3"],["jump_f","jump","walk_f"]];
      this.delay_frames.pos_up = [180,250,450];
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
         var _loc9_;
         var _loc6_;
         var _loc5_;
         var _loc10_;
         var _loc7_;
         var _loc13_;
         var _loc4_;
         var _loc3_;
         var _loc11_;
         var _loc12_;
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
                  _loc9_ = _loc3_[_loc2_].area._width;
                  _loc6_ = _loc3_[_loc2_].area._height;
                  _loc5_ = _loc3_[_loc2_].area.obj_Vx;
                  _loc7_ = _loc3_[_loc2_].area._y;
                  _loc13_ = _loc3_[_loc2_].area.breakDefend;
                  _loc11_ = _loc3_[_loc2_].area._x;
                  _loc12_ = _loc3_[_loc2_].area.hitPos;
                  _loc10_ = _loc3_[_loc2_].area.people;
               }
               _loc2_ = _loc2_ + 1;
            }
            _loc2_ = Math.random();
            _loc2_ = Math.random();
            if(_loc9_ > 250)
            {
               return undefined;
            }
            if(_loc4_ < 130)
            {
               return undefined;
            }
            if(_loc10_ == "undefined" || _loc8_ == 1000)
            {
               return undefined;
            }
            if(_loc4_ <= 590 && _loc4_ > 350 && _loc2_ < 0.18 * _level0.level)
            {
               owner.toSkill("db_p");
               return undefined;
            }
            _loc2_ = _loc2_ * 15 * _level0.level;
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
