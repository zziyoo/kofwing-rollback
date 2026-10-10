class Krizalid_AI_Lv2 extends Krizalid_AI
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
   function Krizalid_AI_Lv2()
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
      this.dis_array[1] = 175;
      this.dis_array[2] = 220;
      this.dis_array[3] = 265;
      this.dis_array[4] = 350;
      this.dis_array[5] = 400;
      this.dis_array[6] = 550;
      this.dis_array[7] = 1000;
      this.skill_dis[0] = ["walk_b","squatKick_l","squatPunch","squatKick","squatPunch_l","punch_l","punch","kick","kick_l","df_k","dfdb_p","dbdf_p","df_o","db_o"];
      this.skill_dis[1] = ["walk_b","squatKick_l","squatPunch","squatKick","squatPunch_l","punch_l","punch","kick","kick_l","df_k","dfdb_p","dbdf_p","df_o","db_o"];
      this.skill_dis[2] = ["walk_b","df_ph","roll_f","squatKick_l","squatPunch","squatKick","squatPunch_l","punch_l","punch","kick","kick_l","df_k","dfdb_p","dbdf_p","df_o","db_o"];
      this.skill_dis[3] = ["kick_l","kick","roll_f","walk_f","df_ph","df_pl","df_k","dfdb_p","df_o"];
      this.skill_dis[4] = ["walk_f","walk_f","walk_f","df_ph","df_pl","df_k","dfdb_p","df_o"];
      this.skill_dis[5] = ["walk_f","walk_f","walk_f","roll_f","walk_f","df_pl","dfdb_p","df_o"];
      this.skill_dis[6] = ["walk_f","walk_f","walk_f","walk_f","walk_f","walk_f","df_pl","df_o"];
      this.skill_dis[7] = ["walk_f","walk_f","walk_f","walk_f","walk_f","walk_f","df_o"];
      this.dis_num = this.dis_array.length;
   }
   function combo_init()
   {
      this.combo_1 = new Object();
      this.combo_land = new Object();
      this.combo_auto = new Object();
      this.combo_burst = new Object();
      this.delay_frames = new Object();
      this.combo_1.squatPunch_l = ["punch","squatPunch_l","punch","kick","kick_l","fdb_p"];
      this.comboDis.squatPunch_l = [110,130,150,240,280,400];
      this.combo_1.squatPunch = ["punch","kick","kick_l","fdb_p"];
      this.comboDis.squatPunch = [150,240,280,400];
      this.combo_1.squatKick_l = ["punch","kick_l","squatKick_l","squatPunch_l","punch","kick","kick_l","fdb_p"];
      this.comboDis.squatKick_l = [100,110,120,140,160,240,280,400];
      this.combo_auto.punch = ["f_p2"];
      this.combo_1.punch2 = ["f_p2"];
      this.combo_auto.kick_l = ["df_pl","df_pl","df_pl","df_ph"];
      this.combo_1.punch_l = ["punch","kick","kick_l"];
      this.combo_1.punch_l2 = ["punch","kick","kick_l"];
      this.combo_1.kick_l2 = ["punch","kick"];
      this.combo_auto.f_p = ["df_ph","fdb_p"];
      this.comboDis.f_p = [150,1000];
      this.comboHeightL.f_p = [75,0];
      this.comboHeightH.f_p = [150,75];
      this.combo_auto.f_p2 = ["fdb_p"];
      this.combo_auto.kick = ["df_pl","df_pl","df_pl","df_ph"];
      this.combo_1.kick2 = ["f_p2"];
      this.combo_1.fdb_p = ["pp","df_k","fdf_ph","df_ph","df_pl","fdf_pl","dfdb_p","dbdf_p","walk_f","walk_f","walk_f","walk_f","walk_f","walk_f","walk_f","walk_f"];
      this.combo_land.jumpSkill_heavyHit = ["fdf_ph","fdb_p","dfdb_p","df_pl","df_o"];
      this.comboDis.jumpSkill_heavyHit = [150,250,350,400,1000];
      this.comboHeightL.jumpSkill_heavyHit = [50,100,100,50,75];
      this.comboHeightH.jumpSkill_heavyHit = [250,250,250,250,500];
      this.combo_land.jumpSkill_kick = ["punch","squatKick_l","f_p","squatKick","kick","kick_l","df_pl"];
      this.comboDis.jumpSkill_kick = [120,150,180,220,250,280,400];
      this.combo_land.jump_f = ["squatKick_l","kick_l"];
      this.comboDis.jump_f = [180,280];
      this.combo_burst.punch2 = ["f_p2","df_k","fdf_ph","df_ph","df_pl","fdf_pl","fdb_p","fdb_p","fdb_p","dfdb_p"];
      this.combo_burst.kick2 = ["f_p2","df_k","fdf_ph","df_ph","df_pl","fdf_pl","fdb_p","fdb_p","fdb_p","dfdb_p"];
      this.combo_burst.squatPunch = ["f_p2","df_k","fdf_ph","df_ph","df_pl","fdf_pl","fdb_p","fdb_p","fdb_p","dfdb_p"];
      this.combo_burst.df_ph = ["fdb_p","dfdb_p"];
      this.combo_burst.df_pl = ["fdb_p","dfdb_p"];
      this.combo_burst.fdb_p = ["pp","pp","pp","df_k","fdf_ph","fdf_pl","dfdb_p","dbdf_p","db_o","fdb_o"];
      this.combo_burst.pp = ["df_k","fdf_ph","fdf_pl","fdb_p","fdb_p","fdb_p","dfdb_p","dbdf_p","db_o"];
      this.combo_burst.dbdf_p = ["df_o","dfdb_p"];
      this.combo_burst.dfdb_p = ["db_o","fdb_p"];
      this.combo_oppOnEgde.dbdf_p = [true,true];
      this.combo_oppOnEgde.dfdb_p = [true,true];
      this.action_1 = new Object();
      this.action_1.airAttack = [["dbdf_p","jump"],["fdf_ph","fdf_ph","fdf_ph","dbdf_p"],["f_p"],["df_ph","df_pl"],["fdb_p","dfdb_p"],["df_ph"],["df_pl"],["df_o"],["walk_f"],["walk_f"]];
      this.delay_frames.airAttack = [150,150,220,220,300,300,400,1000,1000,1000];
      this.delay_framesL.airAttack = [100,175,100,150,100,125,100,150,300,0];
      this.delay_framesH.airAttack = [175,500,150,250,125,300,250,300,500,150];
      this.action_1.downMove = [["df_o","roll_f"],["df_o","walk_f"]];
      this.delay_frames.downMove = [150,1000];
      this.action_1.down = [["df_o","walk_b"],["df_o","df_ph"],["df_pl"]];
      this.delay_frames.down = [230,280,350];
      this.action_1.downMovePower = [["df_o","roll_f"],["df_o","walk_f"]];
      this.delay_frames.downMovePower = [150,1000];
      this.action_1.downPower = [["df_o","walk_b"],["df_o","df_ph"],["df_pl"]];
      this.delay_frames.downPower = [230,280,350];
      this.action_1.getup = [["jump_b","squatKick_l","jump","roll_f","df_k","df_ph"],["df_pl"],["roll_f"],["df_pl"],["walk_f"]];
      this.delay_frames.getup = [150,250,350,400,1000];
      this.action_1.oppRoll = [["squatPunch_l","squatKick_l","fdb_o"],["squatKick_l","squatPunch_l","fdb_o","jump_b"],["df_ph","df_ph","df_pl","roll_f","jump","dbdf_p"],["roll_b","roll_f","jump_f"],["jump_f","df_pl"]];
      this.delay_frames.oppRoll = [100,160,350,450,660];
      this.action_1.oppRollDown = [["squatKick_l","roll_f"],["roll_f"]];
      this.delay_frames.oppRollDown = [180,1000];
      this.action_1.oppLandHurt = [["squatKick_l","squatPunch_l"],["df_ph","dfdb_p"]];
      this.delay_frames.oppLandHurt = [140,200];
      var _temp_3 = this.action_1;
      var _temp_2 = "oppLand";
      var _temp_1 = ["squatKick_l","squatPunch_l","punch","fdb_o"];
      "squatKick_l";
      _temp_3[_temp_2] = [_temp_1.fdb_o];
      this.delay_frames.oppLand = [100,160];
      this.action_1.oppJump = [["fdf_ph","dbdf_p","fdb_p"],["df_k","fdf_ph","dbdf_p","fdb_p"],["roll_f","jump_b","punch","dfdb_p","heavyHit","fdb_p"],["jump","df_pl","df_ph","dfdb_p","fdb_p"],["jump_f","jump","dfdb_p","df_pl","fdb_p"],["roll_f"]];
      this.delay_frames.oppJump = [100,140,200,250,400,1000];
      this.action_1.wander = [["roll_b","jump_b"],["wait","jump_b","walk_f"],["walk_f"]];
      this.delay_frames.wander = [150,300,1000];
      this.action_1.defend = [["walk_b","walk_b","roll_f"],["walk_b","roll_b"],["walk_b","roll_f","jump_b","roll_b"],["walk_b"]];
      this.delay_frames.defend = [130,200,400,1000];
      this.action_1.defendAttack = [["fdb_p","df_k","df_k","fdf_pl","dbdf_p"],["heavyHit","fdf_pl","df_k"],["df_ph","dfdb_p","fdb_p","kick_l","df_o"],["fdb_p","df_pl","dfdb_p","df_o"],["df_o"]];
      this.delay_frames.defendAttack = [140,180,250,350,1000];
      this.action_1.defend_f = [["kick_l","df_ph"],["df_pl"]];
      this.delay_frames.defend_f = [300,350];
      this.action_1.defend_dashf = [["squatKick_l","squatPunch_l"],["kick_l"],["roll_f","df_pl","df_ph"],["roll_f","df_pl"]];
      this.delay_frames.defend_dashf = [150,400,500,600];
      this.action_1.defend_h = [["hold_u","hold_u","roll_f"],["hold_u","roll_b"],["hold_u"]];
      this.delay_frames.defend_h = [130,200,1000];
      this.action_1.pos_down = [["squatKick_l","walk_f"],["heavyHit","walk_f"],["squatKick","kick_l","walk_f"],["walk_f"],["jump_f"]];
      this.delay_frames.pos_down = [180,220,270,350,400];
      this.action_1.pos_up = [["f_p","jump_b","dash_f"],["f_p","df_k","jump","dash_f"],["squatKick_l"],["heavyHit","dash_f"],["dash_f"],["dash_f"],["jump_f"]];
      this.delay_frames.pos_up = [150,180,220,250,350,400];
   }
   function move_hold()
   {
      clearInterval(this.delayTimer);
      var opp = this.opp;
      var _loc17_ = this.dir;
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
         var _loc16_;
         _loc16_ = int(Math.random() * 100);
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
         if(opp.hasObj())
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
            if((_loc4_ > 600 && _loc5_ > 40 || _loc4_ < 600 && _loc4_ > 400 && _loc5_ > 25) && !_loc15_ && _loc2_ < 0.18 * _level0.level)
            {
               owner.toSkill("df_ph");
               return undefined;
            }
            if(_loc4_ > 600 && _loc2_ < 0.18 * _level0.level)
            {
               if(owner.inBurst)
               {
                  owner.toSkill("df_o");
                  return undefined;
               }
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
