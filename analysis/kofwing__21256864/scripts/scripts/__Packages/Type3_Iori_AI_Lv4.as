class Type3_Iori_AI_Lv4 extends Type3_Iori_AI
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
   function Type3_Iori_AI_Lv4()
   {
      super();
      this.skill_init();
      this.combo_init();
      this.combo_rate0 = 85;
      this.attack_rate0 = 61;
      this.hold_rate0 = 85;
      this.attack_s0 = 75;
      this.wait_frame0 = 15;
      this.combo_risk0 = 35;
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
      this.skill_dis[1] = ["walk_f"];
      this.skill_dis[2] = ["dash_f"];
      this.skill_dis[3] = ["dash_f"];
      this.skill_dis[4] = ["dash_b"];
      this.skill_dis[5] = ["dash_f","sk2_l","jump","jump_b","roll_b"];
      this.skill_dis[6] = ["dash_f","dash_f","dash_b","sk2o","sk2_l"];
      this.skill_dis[7] = ["dash_f","dash_f","dash_f","sk2o","sk2_l"];
      this.dis_num = this.dis_array.length;
   }
   function combo_init()
   {
      this.combo_1 = new Object();
      this.combo_land = new Object();
      this.combo_auto = new Object();
      this.combo_burst = new Object();
      this.delay_frames = new Object();
      this.combo_1.punch_s1 = ["punch_s2","punch_s2","sk_s1o","sk1_1_l"];
      this.combo_1.punch_s2 = ["sk1_1","sk3o","sk5","sk5","sk5_2","kick_s3"];
      this.combo_1.kick_s3 = ["sk1_1","sk3o","sk1_1","sk3o","sk_s1o","sk5"];
      this.combo_1.kick_s1 = ["sk1_1","sk3o","sk_s1o","sk5"];
      this.combo_1.sk5 = ["sk1_1","sk1_1_l","sk0","sk0","sk0_l","sk3o"];
      this.combo_power.sk5 = ["sk_s_qianzai2o","sk_s_qianzai1","sk_s1o","sk_s1o","sk0","sk3o","sk_s1o"];
      this.combo_defend.sk5 = ["sk_s_qianzai2o","sk_s_qianzai1","sk_s1o","sk_s1o","sk0","sk3o","sk_s1o"];
      this.combo_super.sk5 = ["sk_s_qianzai2o","sk_s_qianzai1","sk_s1o","sk_s1o","sk0","sk3o","sk_s1o"];
      this.combo_1.sk2_l = ["sk1_1_l","sk3o","sk_s1o","sk3o","sk_s1o","sk3o","sk_s1o","sk3o","sk3o","sk_s1o","sk3o","sk2o"];
      this.comboDis.sk2_l = [250,260,270,280,290,300,310,320,330,340,350,450];
      this.combo_1.kick_l2 = ["punch2","punch_s1","punch_s1"];
      this.combo_1.kick_l = ["punch_s1"];
      this.combo_1.punch2 = ["punch_s1","punch_s1"];
      this.combo_1.punch = ["sk1_1","sk3o","sk_s1o"];
      this.combo_1.squatPunch = ["punch_s1"];
      this.combo_1.squatKick_l = ["punch2","squatKick_l","squatPunch_l"];
      this.comboDis.squatKick_l = [100,125,150];
      this.combo_1.squatPunch_l = ["punch2","squatPunch_l","punch_s1"];
      this.comboDis.squatPunch_l = [110,130,150];
      this.combo_1.kick = ["sk1_1","sk2_l"];
      this.combo_1.kick2 = ["sk1_1","sk_s1o","punch_s1"];
      this.combo_1.punch_l = ["punch2","kick_l","punch_s1"];
      this.comboDis.punch_l = [100,130,150];
      this.combo_1.punch_l2 = ["punch2","kick_l","punch_s1"];
      this.comboDis.punch_l2 = [100,130,150];
      this.combo_1.sk1_1 = ["sk1_2"];
      this.combo_1.sk1_2 = ["sk1_3","sk1_3","sk1_3","sk1_3","sk1_3","walk_f"];
      this.delay_frames.sk1_2 = [0,0,0,0,0,0];
      this.combo_auto.sk1_1_l = ["sk1_2_l"];
      this.combo_auto.sk1_2_l = ["sk1_3_l"];
      this.combo_burst.punch = ["sk1_1","sk_s1o"];
      this.combo_burst.punch2 = ["sk1_1","sk4"];
      this.combo_burst.kick = ["sk1_1","sk_s1o","sk_s2"];
      this.combo_burst.kick2 = ["sk1_1"];
      this.combo_burst.heavyHit = ["sk_s1o","sk_s2","sk_s_qianzai1"];
      this.combo_burst.sk1_1 = ["sk1_2","sk1_2","sk4"];
      this.combo_burst.sk1_2 = ["sk1_3","sk_s1o","sk_s2","sk_s_qianzai1"];
      this.delay_frames.sk1_2 = [1,2,10,2];
      this.combo_burst.sk_s1o = ["sk_s_qianzai1","sk_s2"];
      this.combo_burst.sk_s2 = ["sk_s1o","sk0","sk_s_qianzai1"];
      this.delay_frames.sk_s2 = [8,6,8];
      this.combo_land.jump_f = ["squatKick_l"];
      this.comboDis.jump_f = [150];
      this.combo_land.jumpSkill_kick = ["squatKick_l","punch2","punch","sk1_1","squatKick"];
      this.comboDis.jumpSkill_kick = [80,120,150,200,220];
      this.combo_land.jumpSkill_punch = ["squatKick_l","punch2","punch","sk1_1","squatKick"];
      this.comboDis.jumpSkill_punch = [80,120,150,200,220];
      this.combo_land.jumpSkill_kick_l = ["squatKick_l","punch2","punch","sk1_1","squatKick"];
      this.comboDis.jumpSkill_kick_l = [80,120,150,200,220];
      this.combo_land.jump = ["squatKick_l"];
      this.comboDis.jump = [150];
      this.combo_land.jump_f = ["squatKick_l"];
      this.comboDis.jump = [150];
      this.combo_land.jumpSkill_kick_s = ["squatKick_l","punch2","jump_f","squatKick"];
      this.comboDis.jumpSkill_kick_s = [80,120,150,220];
      this.combo_land.jumpSkill_heavyHit = ["sk_s1o","sk_s_qianzai1"];
      this.comboDis.jumpSkill_heavyHit = [200,300];
      this.comboHeightL.jumpSkill_heavyHit = [75,75];
      this.comboHeightH.jumpSkill_heavyHit = [200,200];
      this.action_1 = new Object();
      this.action_1.airAttack = [["sk_s1o","sk0"],["sk_s1o","sk1_1_l"],["sk1_1_l"],["sk1_1"],["dash_f"]];
      this.delay_frames.airAttack = [100,200,250,300,1000];
      this.delay_framesL.airAttack = [100,100,75,125,0];
      this.delay_framesH.airAttack = [350,350,150,400,500];
      this.action_1.downMove = [["sk_s2"],["sk3o"]];
      this.delay_frames.downMove = [350,1000];
      this.action_1.downMovePower = [["sk_s2"],["sk_s_89b","sk3o","sk3o"]];
      this.delay_frames.downMovePower = [350,1000];
      this.action_1.down = [["dash_f"]];
      this.delay_frames.down = [1000];
      this.action_1.getup = [["jump","squatKick_l","squatPunch_l","dash_b"],["dash_b","squatKick_l","jump_f"],["sk2_l"],["sk2o"]];
      this.delay_frames.getup = [150,250,350,550];
      this.action_1.oppRollDown = [["dash_b","squatKick_l"],["dash_b","sk2_l"],["sk2_l"],["sk2o","sk2_l"],["sk2o","sk2_l","sk_s2"],["sk2o","sk2_l"]];
      this.delay_frames.oppRollDown = [150,200,250,450,550,1000];
      this.action_1.oppLandHurt = [["sk4","punch2","squatKick_l","squatPunch_l"],["punch2","squatKick_l","squatPunch_l"],["punch"],["punch_s1"],["sk1_1"],["sk1"]];
      this.delay_frames.oppLandHurt = [80,100,150,200,250,300];
      this.action_1.oppLandCatch = [["sk4"]];
      this.delay_frames.oppLandCatch = [140];
      this.action_1.oppLand = [["squatKick_l","squatPunch_l","punch2"],["squatKick_l","squatPunch_l"],["jump_f","jump_f","punch_s1"],["sk1_1","sk1_1","jump_f"],["jump","jump_f","dash_b"],["sk1","sk1","jump_f"]];
      this.delay_frames.oppLand = [100,150,200,250,300,350];
      this.action_1.oppRoll = [["squatPunch_l","punch_l","squatKick_l","roll_f"],["jump_b","jump","jump_f"],["sk2_l","jump_b","dash_b","sk1_1_l"],["sk1_1","jump_b","sk2_l"],["sk2o","dash_b","roll_b"]];
      this.delay_frames.oppRoll = [150,400,500,600,1000];
      this.action_1.oppJump = [["sk_s1o","sk0","punch2"],["sk_s1o","jump_b","sk_s_qianzai2o"],["jump_b","sk_s1o","sk_s_qianzai1"],["jump","jump","sk0_l","sk0_l","jump_f","dash_b","sk5","sk5_2"],["sk2o"]];
      this.delay_frames.oppJump = [150,275,350,500,1000];
      this.action_1.wander = [["roll_b","jump_b"],["jump_b","walk_f"],["dash_f"]];
      this.delay_frames.wander = [150,300,1000];
      this.action_1.defend = [["walk_b","walk_b","roll_f"],["walk_b","roll_b"],["walk_b","dash_b","jump_b","roll_b"],["walk_b"]];
      this.delay_frames.defend = [130,200,400,1000];
      this.action_1.defendAttack = [["sk_s1o","sk_s_qianzai2o","sk0_l"],["sk_s1o","sk_s_qianzai2o","sk2_l","sk2o"],["sk_s_qianzai1","sk_s2"]];
      this.delay_frames.defendAttack = [150,250,450];
      this.action_1.defend_f = [["squatKick_l","kick_l"],["jump_b"],["dash_b"]];
      this.delay_frames.defend_f = [150,250,1000];
      this.action_1.defend_dashf = [["roll_f","squatPunch_l","squatKick_l"],["squatPunch_l"],["sk1_1"],["dash_b"]];
      this.delay_frames.defend_dashf = [150,200,350,1000];
      this.action_1.defend_h = [["hold_u","hold_u","roll_f"],["hold_u","roll_b"],["sk_s_qianzai1","hold_u"],["hold_u"]];
      this.delay_frames.defend_h = [130,200,350,1000];
      this.action_1.pos_down = [["kick_l2","jump_f"],["squatKick_l","jump","jump_f","jump_f"],["squatKick","jump_b","jump_f","kick","jump_f","jump_f","sk_s2"],["dash_f","sk_s2","sk_s2"],["jump_f","jump_f","dash_f"]];
      this.delay_frames.pos_down = [100,120,150,250,350];
      this.action_1.pos_up = [["kick_l2","jump_f"],["jump","jump_b","jump_f","jump_f"],["jump_f","jump_f","jump_f","jump_f","sk_s2"],["jump_f","jump","dash_f","sk_s2"]];
      this.delay_frames.pos_up = [100,120,250,350];
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
         var _loc7_;
         var _loc5_;
         var _loc9_;
         var _loc6_;
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
                  _loc7_ = _loc3_[_loc2_].area._height;
                  _loc5_ = _loc3_[_loc2_].area.obj_Vx;
                  _loc6_ = _loc3_[_loc2_].area._y;
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
            if(_loc9_ == "undefined" || _loc8_ == 1000)
            {
               return undefined;
            }
            if(_loc4_ <= 400 && _loc4_ > 200 && this.getDis() < 400)
            {
               if(_loc6_ > 50 && _loc2_ < 0.09 * _level0.level)
               {
                  owner.toSkill("sk_s1o");
                  return undefined;
               }
               if(this.getDis() < 350 && _loc2_ < 0.18 * _level0.level)
               {
                  owner.toSkill("sk_s2");
                  return undefined;
               }
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
            if(_loc2_ < 0.05 * _level0.level && (_loc7_ < 100 && _loc6_ < 100 && _level0.cpu_op_mode !== "defend" || _loc7_ < 75 && _loc6_ < 75 && _level0.cpu_op_mode === "defend"))
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
            if(_loc4_ > 300 && _loc4_ < 450 && _loc5_ > 20 && _loc5_ <= 40 && _loc2_ < 0.18 * _level0.level && (_loc7_ < 100 && _loc6_ < 100 && _level0.cpu_op_mode !== "defend" || _loc7_ < 75 && _loc6_ < 75 && _level0.cpu_op_mode === "defend"))
            {
               owner.jump_f();
               return undefined;
            }
            if(_loc4_ > 200 && _loc4_ < 250 && _loc5_ > 12 && _loc5_ <= 20 && _loc2_ < 0.18 * _level0.level && (_loc7_ < 100 && _loc6_ < 100 && _level0.cpu_op_mode !== "defend" || _loc7_ < 75 && _loc6_ < 75 && _level0.cpu_op_mode === "defend"))
            {
               owner.jump_f();
               return undefined;
            }
            if(_loc4_ > 150 && _loc4_ < 200 && _loc5_ > 8 && _loc5_ <= 12 && _loc2_ < 0.18 * _level0.level && (_loc7_ < 100 && _loc6_ < 100 && _level0.cpu_op_mode !== "defend" || _loc7_ < 75 && _loc6_ < 75 && _level0.cpu_op_mode === "defend"))
            {
               owner.jump_f();
               return undefined;
            }
            if(_loc4_ > 400 && _loc4_ <= 500 && _loc5_ > 30 && _loc5_ <= 50 && _loc2_ < 0.18 * _level0.level && (_loc7_ < 100 && _loc6_ < 100 && _level0.cpu_op_mode !== "defend" || _loc7_ < 75 && _loc6_ < 75 && _level0.cpu_op_mode === "defend"))
            {
               owner.jump_f();
               return undefined;
            }
            if(_loc4_ > 325 && _loc4_ <= 400 && _loc5_ > 20 && _loc5_ <= 30 && _loc2_ < 0.18 * _level0.level && (_loc7_ < 100 && _loc6_ < 100 && _level0.cpu_op_mode !== "defend" || _loc7_ < 75 && _loc6_ < 75 && _level0.cpu_op_mode === "defend"))
            {
               owner.jump_f();
               return undefined;
            }
            if(_loc4_ > 250 && _loc4_ <= 325 && _loc5_ > 10 && _loc5_ <= 20 && _loc2_ < 0.18 * _level0.level && (_loc7_ < 100 && _loc6_ < 100 && _level0.cpu_op_mode !== "defend" || _loc7_ < 75 && _loc6_ < 75 && _level0.cpu_op_mode === "defend"))
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
