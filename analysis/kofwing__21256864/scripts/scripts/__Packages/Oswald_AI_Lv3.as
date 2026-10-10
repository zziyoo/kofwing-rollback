class Oswald_AI_Lv3 extends Oswald_AI
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
   function Oswald_AI_Lv3()
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
      this.dis_array[0] = 150;
      this.dis_array[1] = 200;
      this.dis_array[2] = 250;
      this.dis_array[3] = 300;
      this.dis_array[4] = 350;
      this.dis_array[5] = 450;
      this.dis_array[6] = 700;
      this.dis_array[7] = 1000;
      this.skill_dis[0] = ["walk_f"];
      this.skill_dis[1] = ["walk_f"];
      this.skill_dis[2] = ["walk_f","walk_f","walk_f","roll_f"];
      this.skill_dis[3] = ["walk_f"];
      this.skill_dis[4] = ["walk_f"];
      this.skill_dis[5] = ["walk_f","walk_f","roll_f","QA","QB"];
      this.skill_dis[6] = ["walk_f","walk_f","walk_f","QD","QB","QC"];
      this.skill_dis[7] = ["walk_f","walk_f","walk_f","walk_f","walk_f","walk_f","walk_f","walk_f","QD","QB"];
      this.dis_num = this.dis_array.length;
   }
   function combo_init()
   {
      this.combo_1 = new Object();
      this.combo_land = new Object();
      this.combo_1 = new Object();
      this.combo_burst = new Object();
      this.delay_frames = new Object();
      this.combo_oppOnEgde = new Object();
      this.combo_1.fang2_l_ai = ["fang0_l"];
      this.combo_1.fang3_l_ai = ["fang0_l"];
      this.combo_1.kick_l = ["ten2","ten2","ten2","punch","kick","squatPunch","fang_l"];
      this.combo_1.punch_l = ["ten2","ten2","ten2","punch","kick","squatPunch","fang_l"];
      this.combo_power.punch_l = ["sk_max2","sk_max2","sk_max2"];
      this.combo_defend.punch_l = ["sk_max2","sk_max2","sk_max2"];
      this.combo_1.kick = ["ten2","fang_l","hei","heit_l","hei"];
      this.combo_1.punch = ["ten2","fang_l","hei","heit_l","hei"];
      this.combo_1.punch2 = ["J2","J2","ten2","ten2","fang_l","hei","heit_l","hei"];
      this.combo_1.kick2 = ["J2","J2","ten2","ten2","fang_l","hei","heit_l","hei"];
      this.combo_1.squatKick_l = ["punch","kick","squatPunch"];
      this.combo_1.kick_l2 = ["ten2","ten2","ten2","punch","kick","squatPunch","fang_l"];
      this.combo_1.squatPunch_l = ["ten2","ten2","ten2","punch","kick","squatPunch"];
      this.combo_1.squatPunch = ["J2","J2","ten2","ten2","fang_l","hei","heit_l","hei"];
      this.combo_1.J2 = ["hei","fang_l","heit_l","mei_l","fang","mei_l","mei","heit_l"];
      this.combo_1.ten = ["mei","mei","fang","hei","hong"];
      this.delay_frames.ten = [0,0,0,4,0];
      this.combo_1.fang_l = ["hong2_l","hong2","hei2","hei2_l","fang0_l","fang0","hei2","hei2_l"];
      this.combo_1.fang = ["hong2_l","hong2","hei2","hei2_l","fang0_l","fang0","hei2","hei2_l"];
      this.combo_1.mei_l = ["hong2_l","hong2","fang2","fang2_l","hei2_l"];
      this.combo_1.mei = ["hong2_l","hong2","fang2","fang2_l","hei2_l"];
      this.combo_1.fang2_l = ["hong3_l","hong3","hei3","hei3_l","fang0_l","fang0","hei3","hei3_l"];
      this.combo_1.fang2 = ["hong3_l","hong3","hei3","hei3_l","fang0_l","fang0","hei3","hei3_l"];
      this.combo_1.hei3_l = ["hei0_l","hei0"];
      this.combo_1.hei3 = ["hei0_l","hei0"];
      this.combo_1.fang3_l = ["fang0","fang0_l"];
      this.combo_1.fang3 = ["fang0","fang0_l"];
      this.combo_land.jumpSkill_kick = ["squatKick_l","squatPunch_l","punch","squatPunch","squatKick"];
      this.comboDis.jumpSkill_kick = [150,180,220,245,350];
      this.combo_land.jumpSkill_kick_l = ["squatKick_l","squatPunch_l","punch","squatPunch","squatKick"];
      this.comboDis.jumpSkill_kick_l = [150,180,220,245,350];
      this.combo_land.jumpSkill_punch = ["squatKick_l","squatPunch_l","kick","squatPunch","squatKick"];
      this.comboDis.jumpSkill_punch = [150,180,220,245,350];
      this.combo_land.jumpSkill_punch_l = ["squatKick_l","squatPunch_l","kick","squatPunch","squatKick"];
      this.comboDis.jumpSkill_punch_l = [150,180,220,245,350];
      this.combo_land.jumpSkill_heavyHit = ["punch_l"];
      this.combo_1.hei = ["fang2","fang2_l","mei2_l","hei0","hei0_l"];
      this.combo_1.heit_l = ["fang2","fang2_l","mei2_l","hei0","hei0_l"];
      this.combo_1.hong = ["hei2","hei2_l","fang2","fang2_l"];
      this.combo_1.hong_l = ["hei2","hei2_l","fang2","fang2_l"];
      this.combo_1.mei = ["hei2","hei2_l","fang2","fang2_l"];
      this.combo_1.mei_l = ["hei2","hei2_l","fang2","fang2_l"];
      this.combo_1.fang = ["hei2","hei2_l","fang0_l","fang0"];
      this.combo_1.fang_l = ["hei2","hei2_l","fang0_l","fang0"];
      this.combo_1.fang2_l = ["hei3","hei3_l","hong3","hong3_l","mei3","mei3_l","fang0","fang0_l"];
      this.combo_1.fang2 = ["hei3","hei3_l","hong3","hong3_l","mei3","mei3_l","fang0","fang0_l"];
      this.combo_1.hei2_l = ["hong3","hong3_l","mei3","mei3_l","fang3","fang3_l","hei0","hei0_l"];
      this.combo_1.hei2 = ["hong3","hong3_l","mei3","mei3_l","fang3","fang3_l","hei0","hei0_l"];
      this.combo_1.mei2_l = ["hei3","hei3_l","hong3","hong3_l","fang3","fang3_l"];
      this.combo_1.mei2 = ["hei3","hei3_l","hong3","hong3_l","fang3","fang3_l"];
      this.combo_1.fang3_l = ["fang0_l","fang0"];
      this.combo_1.fang3 = ["fang0_l","fang0"];
      this.combo_1.hei3_l = ["hei0_l","hei0"];
      this.combo_1.heit3 = ["hei0_l","hei0"];
      this.combo_burst.hei3_l = ["sk_s2_l","sk_s2","sk_s1"];
      this.combo_burst.hei3 = ["sk_s2_l","sk_s2","sk_s1"];
      this.combo_burst.fang3_l = ["sk_s2_l","sk_s2","sk_s1"];
      this.combo_burst.fang3 = ["sk_s2_l","sk_s2","sk_s1"];
      this.combo_burst.sk_s1 = ["sk_s2_l","sk_s2"];
      this.combo_burst.sk_s2_l = ["sk_s1","sk_max2"];
      this.combo_burst.sk_s2 = ["sk_s1","sk_max2"];
      this.action_1 = new Object();
      this.action_1.airAttack = [["ten","fang_l"],["hei"]];
      this.delay_frames.airAttack = [180,400];
      this.delay_framesL.airAttack = [100,125];
      this.delay_framesH.airAttack = [150,175];
      this.action_1.downMove = [["QA","sk_max3"],["QB","sk_max3"],["QC","sk_max3"],["QD","sk_max3"],["walk_f","sk_max3"]];
      this.delay_frames.downMove = [200,320,480,600,1000];
      this.action_1.down = [["walk_f"],["walk_f"],["QC"],["QD"],["walk_f"]];
      this.delay_frames.down = [200,420,480,600,1000];
      this.action_1.getup = [["jump_f","jump","squatKick_l","squatPunch_l","roll_f"],["roll_f","squatKick_l","jump_f","jump"],["jump_f","walk_f"],["jump_f","jump_f","walk_f","walk_f","walk_f"]];
      this.delay_frames.getup = [150,200,300,400];
      this.action_1.oppRollDown = [["roll_f","squatKick_l"],["squatKick"],["roll_f","jump_f"],["jump_f","walk_f"],["QC","walk_f","walk_f","walk_f"],["QC","QD","walk_f","walk_f","walk_f","walk_f","walk_f"]];
      this.delay_frames.oppRollDown = [150,200,250,350,500,1000];
      this.action_1.oppLandHurt = [["kick_l","ten","ten"],["squatKick_l","ten","ten"],["punch_l","squatPunch_l","squatPunch_l","jump_f"],["jump_f"],["jump_f","QB"],["QC","QD"]];
      this.delay_frames.oppLandHurt = [120,150,200,250,400,500];
      this.action_1.oppLand = [["squatKick_l","squatPunch_l","squatKick_l","squatPunch_l","kick_l","punch_l"],["squatPunch","squatKick","kick"],["jump_f","jump_f","kick"]];
      this.delay_frames.oppLand = [150,200,250];
      this.action_1.oppRoll = [["punch_l","squatPunch_l","squatKick_l","jump","jump_b"],["jump_f"],["jump_b"]];
      this.delay_frames.oppRoll = [150,250,350];
      this.action_1.oppJump = [["punch2","K","K_l"],["punch_l","kick_l","fang","fang_l","K","K_l"],["jump_b","jump","sk_s1","kick","K","K_l","ten"],["walk_f","roll_f","roll_f","K","K_l","kick"],["jump_f","jump","ten"],["roll_f"],["QA","QB","QC","QD"]];
      this.delay_frames.oppJump = [120,180,230,350,400,600,1000];
      this.action_1.wander = [["roll_b","jump_b"],["wait","jump_b","walk_f"],["walk_f","wait"]];
      this.delay_frames.wander = [150,300,1000];
      this.action_1.defend = [["walk_b","walk_b","roll_f"],["walk_b","roll_b"],["walk_b","roll_f","jump_b","roll_b"],["walk_b","wait"]];
      this.delay_frames.defend = [130,200,400,1000];
      this.action_1.defendAttack = [["sk_s1","sk_max2","K","K_l"],["sk_s1","sk_s2","sk_max2","K","K_l"],["sk_s2","sk_max2"]];
      this.delay_frames.defendAttack = [200,300,400];
      this.action_1.defendAttack = [["sk_s1","sk_max2"],["sk_s1","sk_s2","sk_max2"],["sk_s2","sk_max2"]];
      this.delay_frames.defendAttack = [200,300,400];
      this.action_1.defendAttackUp = [["sk_s1","sk_max2","K","K_l"],["sk_s1","sk_s2","sk_max2","K","K_l"],["sk_s2","sk_max2"]];
      this.delay_frames.defendAttackUp = [200,300,400];
      this.action_1.defend_f = [["squatKick_l","kick_l"],["jump_b"],["roll_f"]];
      this.delay_frames.defend_f = [150,250,1000];
      this.action_1.defend_dashf = [["roll_f","squatPunch_l","squatKick_l"],["squatPunch_l"],["roll_f"]];
      this.delay_frames.defend_dashf = [150,200,350];
      this.action_1.defend_h = [["hold_u","hold_d"],["hold_u","hold_d"],["hold_u","roll_b"],["hold_u","hold_d"]];
      this.delay_frames.defend_h = [100,130,200,1000];
      this.action_1.pos_down = [["squatKick_l","walk_f"],["jump","walk_f","squatKick","jump_b"],["jump_f","walk_f"],["walk_f"]];
      this.delay_frames.pos_down = [150,250,325,500];
      this.action_1.pos_up = [["jump","jump_b","walk_f","mei_l"],["mei_l"],["jump_f","roll_f","walk_f","mei"],["jump_f","walk_f"],["walk_f"]];
      this.delay_frames.pos_up = [150,250,350,415,500];
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
         var _loc7_;
         var _loc5_;
         var _loc10_;
         var _loc8_;
         var _loc13_;
         var _loc4_;
         var _loc3_;
         var _loc14_;
         var _loc12_;
         var _loc6_;
         var _loc16_;
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
               if(_loc3_[_loc2_].area.obj_level != "undefined")
               {
                  _loc9_ = _loc3_[_loc2_].area.obj_level;
                  _loc11_ = _loc3_[_loc2_].area._width;
                  _loc7_ = _loc3_[_loc2_].area._height;
                  _loc5_ = _loc3_[_loc2_].area.obj_Vx;
                  _loc8_ = _loc3_[_loc2_].area._y;
                  _loc13_ = _loc3_[_loc2_].area.breakDefend;
                  _loc14_ = _loc3_[_loc2_].area._x;
                  _loc12_ = _loc3_[_loc2_].area.hitPos;
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
            if(_loc10_ == "undefined" || _loc9_ == 1000)
            {
               return undefined;
            }
            _loc16_ = Math.random();
            if(_loc4_ <= 400 && _loc4_ > 300 && _loc2_ < 0.18 * _level0.level && _loc16_ <= 0.3)
            {
               if(!_loc10_ && _loc9_ <= 2)
               {
                  owner.toSkill("hong");
                  return undefined;
               }
            }
            else if(_loc4_ <= 300 && _loc4_ > 200 && _loc2_ < 0.18 * _level0.level)
            {
               if(!_loc10_ && _loc9_ <= 2)
               {
                  owner.toSkill("hong_l");
                  return undefined;
               }
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
            if(_loc2_ < 0.05 * _level0.level && (_loc7_ < 100 && _loc8_ < 100 && _level0.cpu_op_mode !== "defend" || _loc7_ < 75 && _loc8_ < 75 && _level0.cpu_op_mode === "defend"))
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
            if(_loc4_ > 300 && _loc4_ < 450 && _loc5_ > 20 && _loc5_ <= 40 && _loc2_ < 0.18 * _level0.level && _loc7_ < 150 && _loc8_ < 100)
            {
               owner.jump_f();
               return undefined;
            }
            if(_loc4_ > 200 && _loc4_ < 250 && _loc5_ > 12 && _loc5_ <= 20 && _loc2_ < 0.18 * _level0.level && _loc7_ < 150 && _loc8_ < 100)
            {
               owner.jump_f();
               return undefined;
            }
            if(_loc4_ > 150 && _loc4_ < 200 && _loc5_ > 8 && _loc5_ <= 12 && _loc2_ < 0.18 * _level0.level && _loc7_ < 150 && _loc8_ < 100)
            {
               owner.jump_f();
               return undefined;
            }
            if(_loc4_ > 400 && _loc4_ <= 500 && _loc5_ > 30 && _loc5_ <= 50 && _loc2_ < 0.18 * _level0.level && _loc7_ < 150 && _loc8_ < 100)
            {
               owner.jump_f();
               return undefined;
            }
            if(_loc4_ > 325 && _loc4_ <= 400 && _loc5_ > 20 && _loc5_ <= 30 && _loc2_ < 0.18 * _level0.level && _loc7_ < 150 && _loc8_ < 100)
            {
               owner.jump_f();
               return undefined;
            }
            if(_loc4_ > 250 && _loc4_ <= 325 && _loc5_ > 10 && _loc5_ <= 20 && _loc2_ < 0.18 * _level0.level && _loc7_ < 150 && _loc8_ < 100)
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
