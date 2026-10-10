class Type2_KyoW_AI_Lv2 extends Type2_KyoW_AI
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
   function Type2_KyoW_AI_Lv2()
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
      this.dis_array[1] = 200;
      this.dis_array[2] = 250;
      this.dis_array[3] = 300;
      this.dis_array[4] = 350;
      this.dis_array[5] = 450;
      this.dis_array[6] = 550;
      this.dis_array[7] = 1000;
      this.skill_dis[0] = ["walk_b","squatKick_l","squatPunch","squatKick","squatKick_s","squatPunch_l","sk0","sk0_l","sk31","sk28","sk28_h","punch_l","punch","kick","kick_l","sk_s_120","sk_shenchen","sk_neoMax","sk_max3"];
      this.skill_dis[1] = ["walk_f","squatKick_l","squatPunch","squatKick","squatKick_s","squatPunch_l","sk0","sk0_l","sk31","sk28","sk28_h","punch_l","punch","kick","kick_l","sk_s_120","sk_neoMax","sk_max3"];
      this.skill_dis[2] = ["walk_f","sk31","sk28","sk28_h","sk_s_120","sk_neoMax","sk_max3"];
      this.skill_dis[3] = ["walk_f","walk_f","walk_f","walk_f","roll_f","sk19s_ai","jump_f","sk31","sk29","sk28","sk28_h","sk_s_120","sk_neoMax","sk_max3"];
      this.skill_dis[4] = ["walk_f","walk_f","walk_f","walk_f","walk_f","sk31","sk28","sk28_h","sk_s_120","sk_neoMax"];
      this.skill_dis[5] = ["walk_f","walk_f","walk_f","jump_f","sk28","sk28_h","sk_s_120","sk_neoMax"];
      this.skill_dis[6] = ["walk_f","walk_f","roll_f","sk30","sk30_l"];
      this.skill_dis[7] = ["walk_f","walk_f","walk_f","walk_f","roll_f","walk_f","walk_f","sk30","sk30_l"];
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
      this.combo_1.sk30_l = ["jump_f","sk_s_120"];
      this.comboDis.sk30_l = [300,350];
      this.combo_1.squatKick_l = ["punch2","squatPunch_l","punch","sk_s_120"];
      this.comboDis.squatKick_l = [100,120,200,500];
      this.combo_1.squatPunch_l = ["kick2","kick","sk_s_120"];
      this.comboDis.squatPunch_l = [120,200,500];
      this.combo_1.punch_lc = ["kick2","punch_l","kick_lc","squatKick_l","squatPunch_l"];
      this.combo_1.kick_lc = ["kick2","punch_l","squatKick_l","squatPunch_l"];
      this.combo_1.punch_l = ["punch","squatKick_l","squatPunch_l"];
      this.combo_1.punch = ["sk15","sk19","sk1","sk1","sk1","sk1","sk1","sk1"];
      this.combo_1.punch2 = ["kick3"];
      this.combo_1.kick2 = ["kick3"];
      this.combo_auto.kick = ["sk1"];
      this.combo_1.kick3 = ["sk1","sk1","sk1","sk1","sk1","sk1","sk29","sk15","sk19"];
      this.combo_1.kick1 = ["sk1","sk1","sk1","sk1","sk1","sk1","sk29","sk15","sk19"];
      this.combo_1.squatPunch = ["sk15","sk19","sk1","sk1","sk1","sk1","sk1","sk1"];
      this.combo_auto.sk19s_ai = ["sk21_2s_ai"];
      this.combo_auto.sk21_2s_ai = ["squatKick_s","kickls"];
      this.combo_auto.sk1 = ["sk1_2"];
      this.combo_land.sk1_2 = ["sk_longche_l","sk_longche_l","sk_longche_l","sk_longche_l","sk_max3"];
      this.combo_land.sk_longche_l = ["sk1","sk1","sk19s","sk1","sk1","sk19s","sk_canggui2","sk_longche"];
      this.combo_1.sk15s = ["sk16"];
      this.delay_frames.sk15s = [5];
      this.combo_1.sk16 = ["sk17"];
      this.delay_frames.sk16 = [4];
      this.combo_1.sk19s = ["sk20s","sk20s","sk20s","sk20s","sk20s","sk20s","sk28_h"];
      this.delay_frames.sk19s = [2,2,2,2,2,2,0];
      this.combo_1.sk28_h = ["jump","jump","jump","sk31","sk_max3"];
      this.combo_auto.sk20s = ["sk21","sk14","sk28","sk28","sk28","sk28","sk28","sk28","sk21_2s"];
      this.delay_frames.sk20s = [7,7,0,0,0,0,0,0,7];
      this.combo_1.sk28 = ["sk15s","sk15s","sk15s","sk15s","sk15s","sk15s","sk31","sk_s_120","sk_max3"];
      this.delay_frames.sk28 = [2,2,2,2,2,2,0,3,0];
      this.combo_1.sk21_2s = ["sk13"];
      this.combo_1.sk_s_120 = ["sk_shenchen2"];
      this.combo_land.jump_f = ["squatKick_l"];
      this.comboDis.jump_f = [150];
      this.combo_land.jumpSkill_kick = ["squatKick_l","punch2","punch","squatKick"];
      this.comboDis.jumpSkill_kick = [80,120,200,220];
      this.combo_land.jumpSkill_punch = ["squatKick_l","kick2","punch","squatKick"];
      this.comboDis.jumpSkill_punch = [80,120,200,220];
      this.combo_land.jumpSkill_kick_l = ["squatKick_l","punch","squatKick"];
      this.comboDis.jumpSkill_kick_l = [100,200,220];
      this.combo_land.jump = ["squatKick_l"];
      this.comboDis.jump = [150];
      this.combo_land.jump_f = ["squatKick_l"];
      this.comboDis.jump = [150];
      this.combo_land.jumpSkill_heavyHit = ["sk0","sk19s","sk15s","sk_s_120"];
      this.comboDis.jumpSkill_heavyHit = [300,300,300,300];
      this.comboHeightL.jumpSkill_heavyHit = [75,125,175,250];
      this.comboHeightH.jumpSkill_heavyHit = [125,175,250,500];
      this.combo_land.jumpSkill_punch_s = ["jump","punch","squatKick"];
      this.comboDis.jumpSkill_punch_s = [100,150,220];
      this.combo_burst.heavyHit = ["sk0","sk_longche","sk31","sk_s_120","sk_neoMax","sk_max3"];
      this.combo_burst.sk_longche = ["sk31"];
      this.combo_burst.sk43 = ["sk1","heavyHit","sk31","sk_s_120","sk_neoMax","sk_max3"];
      this.combo_oppOnEgde.sk28 = [true,true,true,true,true,true];
      this.combo_burst.sk15s = ["sk16","sk16","sk19s","sk28","sk1"];
      this.combo_burst.sk16 = ["sk19s","sk19s","sk1","heavyHit","sk28","sk29"];
      this.combo_burst.sk19s = ["sk20s","sk20s","heavyHit","sk1","sk28"];
      this.combo_burst.sk20s = ["sk1","heavyHit","sk29"];
      this.combo_burst.sk28 = ["sk29"];
      this.combo_burst.sk43_l = ["sk1","heavyHit","sk31","sk_s_120","sk_neoMax","sk_max3"];
      this.combo_oppOnEgde.sk28 = [true,true,true,true,true,true];
      this.combo_burst.sk_s_120 = ["sk_neoMax","sk_neoMax","sk_max3","sk31"];
      this.combo_oppOnEgde.sk_s_120 = [false,false,true,true];
      this.combo_burst.sk31 = ["sk_s_120","sk_neoMax","sk_max3"];
      this.action_1 = new Object();
      this.action_1.airAttack = [["sk0_l","sk0"],["sk15s","sk_s_120","sk19s"],["sk15s","sk19s"],["sk_longche_l","sk_longche","sk_max3"]];
      this.delay_frames.airAttack = [150,300,350,350];
      this.delay_framesL.airAttack = [100,175,250,300];
      this.delay_framesH.airAttack = [175,250,300,1000];
      this.action_1.downMove = [["roll_f"],["walk_f"]];
      this.delay_frames.downMove = [200,1000];
      this.action_1.down = [["roll_f"]];
      this.delay_frames.down = [200];
      this.action_1.getup = [["jump_f","jump","squatKick_l","squatPunch_l","roll_f"],["roll_f","jump_f"],["sk19s_ai","jump_f","walk_f"],["jump_f","walk_f","walk_f","walk_f","walk_f"],["sk30_l"],["sk30","sk30_l"],["sk30"]];
      this.delay_frames.getup = [150,250,300,350,500,600,1000];
      this.action_1.oppRollDown = [["roll_f","squatKick_l","jump"],["squatKick","jump_f"],["roll_f","squatKick_s"],["sk19s_ai","squatKick_s"],["jump_f","sk30","sk30_l"],["sk30_l"],["sk30","sk30_l"],["sk30"]];
      this.delay_frames.oppRollDown = [150,200,250,300,350,500,600,1000];
      this.action_1.oppLandHurt = [["kick2","punch2","kick_lc","jump","sk_shenchen"],["squatPunch_l","squatKick_l","jump_f"],["sk30","sk30_l"]];
      this.delay_frames.oppLandHurt = [100,150,450];
      this.action_1.oppLandCatch = [["pitch","squatKick_l","squatKick_l","squatKick_l","squatKick_l","squatKick_l","sk_shenchen"],["sk_shenchen"]];
      this.delay_frames.oppLandCatch = [100,150];
      this.action_1.oppLand = [["squatKick_l","squatPunch_l","punch_l"],["squatKick_l","squatPunch_l"]];
      this.delay_frames.oppLand = [100,175];
      this.action_1.oppRoll = [["punch_l","squatPunch_l","squatKick_l","jump","jump_b"],["jump_f"],["jump_b"]];
      this.delay_frames.oppRoll = [150,250,350];
      this.action_1.oppJump = [["squatPunch","punch"],["jump","squatPunch"],["jump","sk0_l","sk0"],["kick_l"],["jump","jump_f","jump_b","sk_longche_l"],["jump","jump_f","roll_f","sk31","sk_s_120","sk_longche_l","sk_neoMax"],["sk31","roll_f","jump_f","sk_neoMax","sk30_l"],["jump_f","sk_neoMax","sk30_l","sk30"]];
      this.delay_frames.oppJump = [120,150,180,200,275,400,500,1000];
      this.action_1.wander = [["roll_b","jump_b"],["wait","jump_b","walk_f"],["walk_f","wait"]];
      this.delay_frames.wander = [150,300,1000];
      this.action_1.defend = [["walk_b","walk_b","roll_f"],["walk_b","roll_b"],["walk_b","roll_f","jump_b","roll_b"],["walk_b","wait"]];
      this.delay_frames.defend = [130,200,400,1000];
      this.action_1.defendAttack = [["roll_f","sk_s_120","sk0_l","sk_max3"],["sk_s_120","sk_max3","sk31"],["sk19s_ai","sk_s_120","sk_longche_l","sk_max3"],["sk_neoMax","sk_s_120","sk_neoMax"],["sk_neoMax"]];
      this.delay_frames.defendAttack = [175,230,270,350,1000];
      this.action_1.defend_f = [["squatKick_l","kick_l"],["jump_b"],["roll_f"]];
      this.delay_frames.defend_f = [150,250,1000];
      this.action_1.defend_dashf = [["roll_f","squatPunch_l","squatKick_l"],["squatPunch_l","sk0_l"],["sk19s_ai","heavyHit"],["roll_f"]];
      this.delay_frames.defend_dashf = [150,200,350,1000];
      this.action_1.defend_h = [["hold_u","hold_d"],["hold_u","hold_d"],["hold_u","roll_b"],["hold_u","hold_d"]];
      this.delay_frames.defend_h = [100,130,200,1000];
      this.action_1.pos_down = [["kick_lc","walk_f"],["squatKick_l","jump","walk_f","squatKick_s"],["squatKick","jump_b","walk_f","squatKick_s"],["walk_f"],["jump_f","walk_f","walk_f"]];
      this.delay_frames.pos_down = [120,150,180,230,450];
      this.action_1.pos_up = [["jump","jump_b","walk_f","kick1"],["jump_f","walk_f"],["kick"],["jump_f","jump","walk_f","walk_f"]];
      this.delay_frames.pos_up = [150,230,260,450];
   }
   function move_hold()
   {
      clearInterval(this.delayTimer);
      var opp = this.opp;
      var _loc15_ = this.dir;
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
         var _loc13_ = int(Math.random() * 100);
         if((opp.mc.hitPos == "up" || opp.status_2 == "air") && owner.status_1 != "hold_u" && owner.status_1 != "hold_d")
         {
            owner.hold_u();
            return undefined;
         }
         if((opp.mc.hitPos == "up" || opp.status_2 == "air") && owner.status_1 == "hold_d" && _loc13_ < 18 * _level0.level)
         {
            owner.hold_u();
            return undefined;
         }
         if((opp.status_1.indexOf("squat") > -1 || opp.mc.hitPos == "down") && owner.status_1 != "hold_u" && owner.status_1 != "hold_d")
         {
            owner.hold_d();
            return undefined;
         }
         if((opp.status_1.indexOf("squat") > -1 || opp.mc.hitPos == "down") && owner.status_1 == "hold_u" && _loc13_ < 18 * _level0.level)
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
         var _loc14_;
         var _loc7_;
         var _loc12_;
         var _loc4_;
         var _loc3_;
         var _loc10_;
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
            if(opp.status_6 == "catch" && this.getDis() < 250)
            {
               owner.toSkill("jump_b");
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
                  _loc12_ = _loc3_[_loc2_].area.breakDefend;
                  _loc10_ = _loc3_[_loc2_].area._x;
                  _loc11_ = _loc3_[_loc2_].area.hitPos;
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
            if(_loc4_ <= 180 && _loc4_ > 130 && _loc2_ < 0.1)
            {
               owner.roll_f();
               return undefined;
            }
            if(_loc14_ == "undefined" || _loc8_ == 1000)
            {
               return undefined;
            }
            if(_loc2_ < 0.18 * _level0.level)
            {
               owner.toSkill("sk_neoMax");
               return undefined;
            }
            if(opp.getObjNum() > 1)
            {
               return undefined;
            }
            if(_loc2_ < 0.1 * _level0.level && (_loc6_ < 100 && _loc7_ < 100 && _level0.cpu_op_mode !== "defend" || _loc6_ < 75 && _loc7_ < 75 && _level0.cpu_op_mode === "defend"))
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
