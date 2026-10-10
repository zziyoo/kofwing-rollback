class Ryu_AI_Lv3 extends Ryu_AI
{
   var attack_rate0;
   var combo_rate0;
   var delayTimer;
   var dir;
   var dis_array;
   var dis_num;
   var hold_rate0;
   var inBurst;
   var mc;
   var objName;
   var opp;
   var skill_dis;
   var wait_frame0;
   function Ryu_AI_Lv3()
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
      this.dis_array[4] = 400;
      this.dis_array[5] = 450;
      this.dis_array[6] = 550;
      this.dis_array[7] = 1000;
      this.skill_dis[0] = ["walk_b"];
      this.skill_dis[1] = ["walk_b"];
      this.skill_dis[2] = ["walk_f","jump"];
      this.skill_dis[3] = ["walk_f","walk_f","walk_f","jump_b","jump_f"];
      this.skill_dis[4] = ["walk_f","walk_f","walk_f","walk_f","jump_b","jump_f"];
      this.skill_dis[5] = ["walk_f","walk_f","walk_f","roll_f","sk1_l","sk1","jump_f"];
      this.skill_dis[6] = ["walk_f","walk_f","walk_f","roll_f","sk1_l","sk1"];
      this.skill_dis[7] = ["walk_f","walk_f","walk_f","roll_f","walk_f","walk_f","sk1_l","sk1"];
      this.dis_num = this.dis_array.length;
   }
   function combo_init()
   {
      this.combo_1 = new Object();
      this.combo_land = new Object();
      this.combo_auto = new Object();
      this.combo_burst = new Object();
      this.delay_frames = new Object();
      this.combo_auto.sk1_l = ["walk_f","sk_SKF"];
      this.comboDis.sk1_l = [400,1000];
      this.combo_1.punch_l = ["punch2","kick_l"];
      this.comboDis.punch_l = [110,300];
      this.combo_1.squatPunch = ["punch2","kick3"];
      this.comboDis.squatPunch = [110,300];
      this.combo_1.squatPunch_l = ["punch2","kick3"];
      this.comboDis.squatPunch_l = [110,300];
      this.combo_1.kick_l = ["punch2","kick_l","kick3"];
      this.comboDis.kick_l = [110,130,300];
      this.combo_1.squatKick_l = ["kick2","kick3"];
      this.comboDis.squatKick_l = [110,300];
      this.combo_1.kick3 = ["sk2_l"];
      this.combo_auto.punch2 = ["kick3","kick3","kick3","kick1"];
      this.combo_auto.punch = ["kick3","kick3","kick3","kick1"];
      this.combo_auto.kick = ["kick3","kick3","kick3","kick1"];
      this.combo_auto.kick1 = ["sk_bodong_air2","sk_s_sys_air"];
      this.comboDis.kick1 = [1000,1000];
      this.comboHeightL.kick1 = [0,5];
      this.comboHeightH.kick1 = [5,200];
      this.combo_auto.kick2 = ["kick3","punch_b","kick1","punch_b","kick1"];
      this.comboDis.kick2 = [200,200,250,200,1000];
      this.comboHeightL.kick2 = [0,50,100,150,0];
      this.comboHeightH.kick2 = [5,100,150,300,5];
      this.combo_auto.punch_b = ["sk5_h"];
      this.combo_land.jumpSkill_punch = ["squatKick_l","punch2","kick","kick3"];
      this.comboDis.jumpSkill_kick = [80,120,150,200];
      this.combo_land.jumpSkill_punch_l = ["squatKick_l","punch2","kick","kick3"];
      this.comboDis.jumpSkill_punch_l = [80,120,150,200];
      this.combo_land.jumpSkill_kick_l = ["squatKick_l","kick2","punch","punch_s"];
      this.comboDis.jumpSkill_kick_l = [80,120,150,200];
      this.combo_land.jumpSkill_kick = ["squatKick_l","kick2","punch","kick3"];
      this.comboDis.jumpSkill_kick = [80,120,150,200];
      this.combo_land.jump = ["squatKick_l"];
      this.comboDis.jump = [150];
      this.combo_land.jump_f = ["squatKick_l"];
      this.comboDis.jump_f = [150];
      this.combo_land.jumpSkill_heavyHit = ["kick2","sk3"];
      this.comboDis.jumpSkill_heavyHit = [130,200];
      this.comboHeightL.jumpSkill_heavyHit = [50,75];
      this.comboHeightH.jumpSkill_heavyHit = [500,500];
      this.combo_burst.sk2 = ["sk1","sk3","sk10","sk14"];
      this.combo_burst.sk3 = ["sk4","sk_s_sys"];
      this.delay_frames.sk3 = [5,0];
      this.combo_burst.sk3_l = ["sk_s_sys"];
      this.combo_burst.sk2_l = ["sk_s_sys"];
      this.combo_burst.sk14 = ["sk3","sk13","sk_s_sys"];
      this.combo_oppOnEgde.sk14 = [true,true,true];
      this.action_1 = new Object();
      this.action_1.airAttack = [["kick2"],["sk3_l","sk13"],["sk_s_swms","sk14","sk10"],["sk2_l","sk2"],["sk3","sk5_h","sk5_h","sk5_h","sk10"],["dash_f"]];
      this.delay_frames.airAttack = [150,180,180,300,300,1000];
      this.delay_framesL.airAttack = [175,100,250,100,250,450];
      this.delay_framesH.airAttack = [200,250,500,150,350,1000];
      this.action_1.downMovePower = [["sk_SKB","sk_SKF"]];
      this.delay_frames.downMovePower = [1000];
      this.action_1.downMovePower = [["sk_SKB","sk_SKF"]];
      this.delay_frames.downMovePower = [1000];
      this.action_1.down = [["sk_SKF"]];
      this.delay_frames.down = [1000];
      this.action_1.downPower = [["sk_SKF"]];
      this.delay_frames.downPower = [1000];
      this.action_1.getup = [["jump_b","jump_f","jump","squatKick_l","squatPunch_l","sk_SKB","roll_f"],["roll_f","jump","jump_f","walk_f"],["sk1_l","walk_f","jump_f"],["jump","sk1","walk_f","kick1"],["walk_f","kick1"]];
      this.delay_frames.getup = [150,200,250,380,550];
      this.action_1.oppRollDown = [["sk_SKB","roll_f","squatKick_l"],["sk_SKB","roll_f","sk2_l"],["sk2_l","sk2"],["sk1","sk1_l","sk_s_sys"]];
      this.delay_frames.oppRollDown = [150,200,250,380];
      this.action_1.oppLandHurt = [["punch_l","squatPunch_l","squatKick_l"],["punch2","kick2"],["sk5"],["sk5_h","sk2"]];
      this.delay_frames.oppLandHurt = [80,110,160,280];
      this.action_1.oppLand = [["squatKick_l","squatPunch_l","kick_l","punch_l","sk_s_sys","sk_s_sys","sk_s_sys","sk_s_sys"],["squatKick_l","squatPunch_l","kick_l","punch_l","sk_s_sys","sk_s_sys","sk_s_sys"],["sk_s_sys"]];
      this.delay_frames.oppLand = [100,150,250];
      this.action_1.oppRoll = [["squatPunch_l","punch_l","squatKick_l","roll_f"],["jump_b","jump","jump_f","sk_SKF"],["sk1_l","jump_b","roll_f","sk2","sk2_l","sk_SKB"],["sk1_","jump_b","sk2"],["sk10","sk_SKF","roll_b","sk_SKB"]];
      this.delay_frames.oppRoll = [150,400,500,600,1000];
      this.action_1.oppJump = [["jump_b","jump","sk3_l","sk3","sk13","punch_b","sk14","squatPunch"],["sk2","punch_b"],["jump","jump_b","jump_f"],["jump","jump_f","sk_SKF"],["sk_SKF","sk_SKB","sk1","sk1_l"]];
      this.delay_frames.oppJump = [200,250,280,450,600];
      this.action_1.wander = [["roll_b","jump_b"],["jump_b","walk_f"],["walk_f"]];
      this.delay_frames.wander = [150,300,1000];
      this.action_1.defend = [["walk_b","walk_b","roll_f"],["walk_b","roll_b"],["walk_b","roll_f","jump_b","roll_b"],["walk_b"]];
      this.delay_frames.defend = [130,200,400,1000];
      this.action_1.defendAttack = [["sk3_l","sk3","sk13","sk5","sk_s_swms","sk14"],["sk2","sk5","sk10","sk_s_sys"],["sk_SKB","sk2","sk_s_sys","sk10"],["sk_s_sys","sk10","sk_SKF"],["sk_SKF","sk_s_sys"]];
      this.delay_frames.defendAttack = [200,250,280,450,600];
      this.action_1.defend_f = [["squatKick_l","kick_l"],["jump_b"],["roll_f"]];
      this.delay_frames.defend_f = [150,250,1000];
      this.action_1.defend_dashf = [["roll_f","squatPunch_l","squatKick_l"],["squatPunch_l"],["jump_f"],["roll_f"]];
      this.delay_frames.defend_dashf = [150,200,350,1000];
      this.action_1.defend_h = [["hold_u","hold_u","hold_u","hold_u","roll_f"],["hold_u","hold_u","hold_u","roll_b"],["hold_u"]];
      this.delay_frames.defend_h = [130,400,1000];
      this.action_1.onEgde = [["attack","jump_f"],["attack"],["attack"],["walk_f","walk_f"]];
      this.delay_frames.onEgde = [150,250,400,1000];
      this.action_1.pos_down = [["squatKick_l","jump","walk_f"],["squatKick","jump_b","walk_f","kick1"],["walk_f","kick3","roll_f"],["jump_f","walk_f","walk_f"]];
      this.delay_frames.pos_down = [150,180,230,450];
      this.action_1.pos_up = [["jump","jump_b","walk_f"],["jump_f","roll_f","walk_f"],["jump_f","jump","walk_f","walk_f"]];
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
            if(opp.status_6 == "catch" && this.getDis() < 250)
            {
               owner.toSkill("jump_b");
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
            if(_loc4_ > 600 && !_loc9_ && this.inBurst)
            {
               owner.toSkill("sk2");
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
