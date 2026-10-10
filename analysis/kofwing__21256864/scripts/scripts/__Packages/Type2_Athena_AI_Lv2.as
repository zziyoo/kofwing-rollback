class Type2_Athena_AI_Lv2 extends Type2_Athena_AI
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
   function Type2_Athena_AI_Lv2()
   {
      super();
      this.skill_init();
      this.combo_init();
      this.combo_rate0 = 30;
      this.attack_rate0 = 40;
      this.hold_rate0 = 40;
      this.attack_s0 = 15;
      this.wait_frame0 = 25;
      this.combo_risk0 = 50;
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
      this.skill_dis[0] = ["squatKick_l","squatPunch","squatKick","squatPunch_l","punch_l","punch","kick","kick_l","sk_dfdf_k","sk_s_89b","sk_s_abcd1","sk_s_summonbao"];
      this.skill_dis[1] = ["squatKick_l","squatPunch","squatKick","squatPunch_l","punch_l","punch","kick","kick_l","sk_dfdf_k","sk_s_89b","sk_s_abcd1","sk_s_summonbao"];
      this.skill_dis[2] = ["squatKick_l","squatPunch","squatKick","squatPunch_l","punch_l","punch","kick","kick_l","sk_dfdf_k","sk_s_89b","sk_s_abcd1","sk_s_summonbao"];
      this.skill_dis[3] = ["walk_f","walk_f","roll_f","walk_f","walk_f","sk5_fake","sk_dfdf_k","sk_s_abcd1"];
      this.skill_dis[4] = ["walk_f","sk_s_abcd1"];
      this.skill_dis[5] = ["roll_f","walk_f","walk_f","walk_f","walk_f","sk2_l","sk5_fake","sk2_s_h","sk2_s_l"];
      this.skill_dis[6] = ["walk_f","walk_f","walk_f","roll_f","walk_f","sk2_l_ai","sk5_fake","sk2_s_h","sk2_s_l"];
      this.skill_dis[7] = ["walk_f","walk_f","walk_f","walk_f","sk2_l_ai","sk5_fake","sk2_s_h","sk2_s_l"];
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
      this.combo_auto.sk2_l_ai = ["sk2","sk5","sk5","sk5","sk5"];
      this.combo_1.sk2_l = ["sk2_l","punch","sk5_l"];
      this.comboDis.sk2_l = [150,190,400];
      this.combo_auto.sk2 = ["sk5"];
      this.combo_auto.sk2_s_l = ["sk2_s_h","sk5","sk5_fake"];
      this.combo_auto.sk2_s_h = ["sk2_l","sk2"];
      this.comboDis.sk2_s_h = [350,1000];
      this.combo_1.punch_l = ["kick2","kick_s1"];
      this.comboDis.punch_l = [100,300];
      this.combo_1.kick2 = ["kick_s1"];
      this.combo_1.punch2 = ["kick_s1"];
      this.combo_1.kick_l = ["punch2","kick_s1"];
      this.comboDis.kick_l = [100,300];
      this.combo_1.squatPunch_l = ["punch2","kick_s1"];
      this.comboDis.squatPunch_l = [100,300];
      this.combo_1.squatKick_l = ["kick2","kick_s1"];
      this.comboDis.squatKick_l = [100,300];
      this.combo_auto.kick_s1 = ["jairbackDo","jairbackDo","jairback","sk0","sk0_l","jairbackDo","jairback","sk_s_abcd1","jairbackDo"];
      this.combo_auto.punch = ["sk5_l","sk5_l","sk5_fake"];
      this.combo_auto.kick = ["sk5_l","sk5_l","sk5_fake"];
      this.combo_1.squatPunch = ["kick_s1"];
      this.combo_1.sk_s_abcd1 = ["sk_s_abcd2","sk_s_abcd3","sk_s_abcd0"];
      this.combo_land.jump_f = ["squatKick_l"];
      this.comboDis.jump_f = [150];
      this.combo_land.jumpSkill_kick = ["squatKick_l","punch","jump_f"];
      this.comboDis.jumpSkill_kick = [80,200,220];
      this.combo_land.jumpSkill_punch = ["squatKick_l","punch","jump_f"];
      this.comboDis.jumpSkill_punch = [80,200,220];
      this.combo_land.jumpSkill_kick_l = ["squatKick_l","punch","jump_f"];
      this.comboDis.jumpSkill_kick_l = [80,200,220];
      this.combo_land.jump = ["squatKick_l"];
      this.comboDis.jump = [150];
      this.combo_land.jump_f = ["squatKick_l"];
      this.comboDis.jump = [150];
      this.combo_land.jumpSkill_heavyHit = ["sk_s_89b"];
      this.comboDis.jumpSkill_heavyHit = [200];
      this.comboHeightL.jumpSkill_heavyHit = [125];
      this.comboHeightH.jumpSkill_heavyHit = [500];
      this.combo_burst.sk0 = ["sk0_l","sk0_l","sk0_l","sk_s_89b"];
      this.combo_oppOnEgde.sk0 = [true,true,true,true];
      this.combo_burst.sk0_l = ["sk0"];
      this.combo_oppOnEgde.sk0_l = [true];
      this.combo_burst.sk_s_89b = ["sk_s_abcd1"];
      this.combo_oppOnEgde.sk_s_89b = [true];
      this.combo_burst.sk_dfdf_k = ["sk_s_abcd1","sk_s_abcd1"];
      this.combo_burst.sk_dfdf_k_air = ["sk_s_abcd1","sk_s_abcd1"];
      this.combo_burst.sk3_l_air = ["kick_s1"];
      this.comboDis.sk3_l_air = [250];
      this.action_1 = new Object();
      this.action_1.airAttack = [["sk0_l","sk0"],["sk2_l","sk2_l","sk2_l","sk2_l","sk2_l","sk0","jump_f"],["sk2_l","sk3_l","sk_s_89b"],["jump_f","sk_s_89b"],["sk2_s_h","sk2_l"],["sk2_s_h","sk2"]];
      this.delay_frames.airAttack = [150,200,200,200,400,1000];
      this.delay_framesL.airAttack = [100,175,250,300,250,350];
      this.delay_framesH.airAttack = [175,250,300,1000,350,1000];
      this.action_1.downMove = [["roll_f"],["sk_s_summonbao"],["sk5","sk5","sk5_fake"]];
      this.delay_frames.downMove = [200,350,1000];
      this.action_1.down = [["roll_f"],["sk5_l","sk5"]];
      this.delay_frames.down = [200,400];
      this.action_1.getup = [["jump_f","jump","squatKick_l","squatPunch_l","roll_f"],["roll_f","jump_f","sk5_fake"],["sk2_l","jump_f","walk_f"],["sk2_l","jump_f","walk_f","walk_f","walk_f","walk_f"],["sk2_l","walk_f","walk_f","walk_f"]];
      this.delay_frames.getup = [150,250,300,350,380];
      this.action_1.oppRollDown = [["roll_f","squatKick_l","jump"],["squatKick","jump_f"],["roll_f","sk5_l"],["sk2_l","sk5_l"],["sk2_l","jump_f","sk5_l"],["sk2_l","walk_f","sk5_l"],["sk5"]];
      this.delay_frames.oppRollDown = [150,200,250,300,350,380,650];
      this.action_1.oppLandHurt = [["squatPunch_l","squatKick_l","squatPunch_l","squatKick_l","jump"],["squatPunch_l","squatKick_l","squatPunch_l","squatKick_l","jump_f","sk5_fake"],["sk5_l","sk5"]];
      this.delay_frames.oppLandHurt = [150,300,650];
      this.action_1.oppLand = [["squatKick_l","squatPunch_l","punch_l"],["kick_l","squatKick_l"],["punch"]];
      this.delay_frames.oppLand = [100,150,170,200];
      this.action_1.oppRoll = [["punch_l","squatPunch_l","squatKick_l","jump","jump_b","sk5_l","sk5"],["jump_f","sk5_l","sk5"],["jump_b","sk5_l","sk5"],["jump","sk5_l","sk5"],["sk5"]];
      this.delay_frames.oppRoll = [150,250,350,400,650];
      this.action_1.oppJump = [["sk0","sk0"],["sk3_l","sk_s_89b"],["jump","jump_f","jump_b","sk5_l","sk5"],["jump","jump_f","roll_f","sk5_l","sk5","sk2_l","sk2_l"],["sk2_l","roll_f","sk2","sk5","jump_f"]];
      this.delay_frames.oppJump = [130,200,300,400,500];
      this.action_1.wander = [["roll_b","jump_b"],["wait","jump_b","walk_f"],["walk_f","wait"]];
      this.delay_frames.wander = [150,300,1000];
      this.action_1.defend = [["walk_b","walk_b","roll_f"],["walk_b","roll_b"],["walk_b","roll_f","jump_b","roll_b"],["walk_b","wait"]];
      this.delay_frames.defend = [130,200,400,1000];
      this.action_1.defendAttack = [["sk0","sk0_l","sk_s_89b","sk_s_abcd1"],["sk3_l","sk_s_89b","sk_s_abcd1"],["sk5","sk5_l","sk2_l"],["sk5","sk5_l","sk2_l"],["sk5","sk5_l","sk2_l","sk2"]];
      this.delay_frames.defendAttack = [130,200,300,400,450];
      this.action_1.defend_f = [["squatKick_l","kick_l"],["jump_b"],["roll_f"]];
      this.delay_frames.defend_f = [150,250,1000];
      this.action_1.defend_dashf = [["roll_f","squatPunch_l","squatKick_l"],["squatPunch_l","sk5_l"],["sk5_l","sk5"]];
      this.delay_frames.defend_dashf = [150,200,350];
      this.action_1.defend_h = [["hold_u","hold_d"],["hold_u","hold_d"],["hold_u","roll_b"],["hold_u","hold_d"]];
      this.delay_frames.defend_h = [100,130,200,1000];
      this.action_1.pos_down = [["squatKick_l","jump","walk_f"],["squatKick","jump_b","walk_f","sk5_fake"],["walk_f","sk5_fake"],["jump_f","walk_f","walk_f"]];
      this.delay_frames.pos_down = [150,220,230,450];
      this.action_1.pos_up = [["jump","jump_b","walk_f","kick_s1"],["jump_f","walk_f","kick_s1","sk5_fake"],["jump_f","jump","walk_f","walk_f"]];
      this.delay_frames.pos_up = [150,280,450];
   }
   function move_hold()
   {
      clearInterval(this.delayTimer);
      var opp = this.opp;
      var _loc16_ = this.dir;
      var owner = this;
      var ownertoOppDis;
      ownertoOppDis = this.getDis();
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
         if(ownertoOppDis < 200 && opp.status_4 == "hitBack")
         {
            owner.toSkill("heavyHit");
            return undefined;
         }
         var _loc9_;
         var _loc11_;
         var _loc7_;
         var _loc5_;
         var _loc10_;
         var _loc8_;
         var _loc14_;
         var _loc4_;
         var _loc3_;
         var _loc12_;
         var _loc13_;
         var _loc6_;
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
            if((opp.mc.hitPos == "up" || opp.status_2 == "air") && owner.status_1 != "hold_u")
            {
               owner.hold_u();
               return undefined;
            }
            if((opp.status_1.indexOf("squat") > -1 || opp.mc.hitPos == "down") && owner.status_1 != "hold_d")
            {
               owner.hold_d();
               return undefined;
            }
            if(opp._roleName == "CZero" && ownertoOppDis > 110 && ownertoOppDis < 290 && opp.status_1 == "df_k")
            {
               owner.roll_f();
               return undefined;
            }
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
            _loc9_ = 1000;
            _loc4_ = opp.getObjDis();
            _loc3_ = opp.getObjs();
            _loc2_ = 0;
            while(_loc2_ < _loc3_.length)
            {
               this.objName = _loc3_[_loc2_].objName;
               _loc6_ = Math.random();
               if(this.objName == "black_dot" && _loc6_ < 0.18 * _level0.level)
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
               if(this.objName == "ASH_646A")
               {
                  if(_loc4_ >= 300)
                  {
                     owner.roll_f();
                  }
                  else
                  {
                     owner.hold_d();
                  }
               }
               if(this.objName == "ASH_24")
               {
                  if(ownertoOppDis <= 100)
                  {
                     owner.toSkill("pitch");
                  }
               }
               if(_loc3_[_loc2_].area.obj_level != "undefined")
               {
                  _loc9_ = _loc3_[_loc2_].area.obj_level;
                  _loc11_ = _loc3_[_loc2_].area._width;
                  _loc7_ = _loc3_[_loc2_].area._height;
                  _loc5_ = _loc3_[_loc2_].area.obj_Vx;
                  _loc8_ = _loc3_[_loc2_].area._y;
                  _loc14_ = _loc3_[_loc2_].area.breakDefend;
                  _loc12_ = _loc3_[_loc2_].area._x;
                  _loc13_ = _loc3_[_loc2_].area.hitPos;
                  _loc10_ = _loc3_[_loc2_].area.people;
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
            if(_loc4_ <= 180 && _loc4_ > 130 && _loc2_ < 0.1)
            {
               owner.roll_f();
               return undefined;
            }
            if(_loc10_ == "undefined" || _loc9_ == 1000)
            {
               return undefined;
            }
            if(_loc5_ >= 50 && !_loc10_ && _loc9_ < 3 && _loc2_ < 0.09 * _level0.level)
            {
               owner.toSkill("sk3_l");
            }
            if(_loc5_ <= 15 && !_loc10_ && _loc9_ < 3 && _loc2_ < 0.09 * _level0.level && _loc4_ > 400)
            {
               owner.toSkill("sk2");
            }
            if(_loc4_ > 250 && _loc4_ < 350 && _loc2_ < 0.18 * _level0.level && !_loc10_ && _loc9_ < 3 && _loc5_ < 50 && _loc5_ > 15)
            {
               owner.toSkill("sk3_l");
            }
            if(opp.getObjNum() > 1)
            {
               return undefined;
            }
            if(_loc2_ < 0.1 * _level0.level && (_loc7_ < 100 && _loc8_ < 100 && _level0.cpu_op_mode !== "defend" || _loc7_ < 75 && _loc8_ < 75 && _level0.cpu_op_mode === "defend"))
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
            if(_loc4_ > 400 && _loc4_ <= 500 && _loc5_ > 30 && _loc5_ <= 50 && _loc2_ < 0.18 * _level0.level && (_loc7_ < 100 && _loc8_ < 100 && _level0.cpu_op_mode !== "defend" || _loc7_ < 75 && _loc8_ < 75 && _level0.cpu_op_mode === "defend"))
            {
               owner.jump_f();
               return undefined;
            }
            if(_loc4_ > 325 && _loc4_ <= 400 && _loc5_ > 20 && _loc5_ <= 30 && _loc2_ < 0.18 * _level0.level && (_loc7_ < 100 && _loc8_ < 100 && _level0.cpu_op_mode !== "defend" || _loc7_ < 75 && _loc8_ < 75 && _level0.cpu_op_mode === "defend"))
            {
               owner.jump_f();
               return undefined;
            }
            if(_loc4_ > 250 && _loc4_ <= 325 && _loc5_ > 10 && _loc5_ <= 20 && _loc2_ < 0.18 * _level0.level && (_loc7_ < 100 && _loc8_ < 100 && _level0.cpu_op_mode !== "defend" || _loc7_ < 75 && _loc8_ < 75 && _level0.cpu_op_mode === "defend"))
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
               if(_loc4_ <= 200 && ownertoOppDis > 450)
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
               if(_loc4_ <= 200 && ownertoOppDis > 450)
               {
                  owner.roll_f();
               }
            }
            owner.move_hold();
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
         if(opp._roleName == "CZero" && ownertoOppDis > 110 && ownertoOppDis < 290 && opp.status_1 == "df_k" && _loc2_ < 18 * _level0.level)
         {
            owner.roll_f();
            return undefined;
         }
         if(opp.status_6 == "catch" && ownertoOppDis < 250 && _loc2_ < 18 * _level0.level)
         {
            owner.toSkill("jump_b");
            return undefined;
         }
         if(opp.status_3 != "attack" && !opp.hasObj() && owner.holdFreeze == false)
         {
            if(!owner.checkAction())
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
         else if(owner.holdFreeze == false && opp.hit_over())
         {
            if(!owner.checkAction())
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
