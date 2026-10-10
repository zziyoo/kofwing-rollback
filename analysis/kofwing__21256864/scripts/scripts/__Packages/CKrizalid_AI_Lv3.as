class CKrizalid_AI_Lv3 extends CKrizalid_AI
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
   function CKrizalid_AI_Lv3()
   {
      super();
      this.skill_init();
      this.combo_init();
      this.combo_rate0 = 68;
      this.attack_rate0 = 50;
      this.hold_rate0 = 68;
      this.attack_s0 = 43;
      this.wait_frame0 = 50;
      this.combo_risk0 = 50;
   }
   function skill_init()
   {
      this.dis_array[0] = 100;
      this.dis_array[1] = 150;
      this.dis_array[2] = 200;
      this.dis_array[3] = 250;
      this.dis_array[4] = 300;
      this.dis_array[5] = 400;
      this.dis_array[6] = 500;
      this.dis_array[7] = 600;
      this.dis_array[8] = 650;
      this.dis_array[9] = 1000;
      this.skill_dis[0] = ["punch_l","kick_l","kick","walk_f","punch","squatKick_l","squatKick","squatKick_l","squatKick","jump_b","jump_b","jump","jump"];
      this.skill_dis[1] = ["squatKick","squatKick_l","punch_l","kick_l","punch","jump_b","jump_b","jump","jump"];
      this.skill_dis[2] = ["squatKick","squatKick_l","punch_l","kick_l","punch","jump","roll_b","jump_f","jump_f","heavyHit"];
      this.skill_dis[3] = ["roll_f","walk_f","jump_f","jump_f"];
      this.skill_dis[4] = ["walk_f","walk_f","jump_f","jump_f"];
      this.skill_dis[5] = ["walk_f","walk_f","df_pl","roll_b","jump_f","roll_f","walk_f","walk_f"];
      this.skill_dis[6] = ["walk_f","roll_f","df_pl","df_ph","walk_f","walk_f","walk_f"];
      this.skill_dis[7] = ["walk_f","roll_b","df_ph","walk_f","walk_f","walk_f","walk_f","walk_f"];
      this.skill_dis[8] = ["walk_f","walk_f","df_ph","df_pl","walk_f","roll_f","walk_f","walk_f","walk_f"];
      this.skill_dis[9] = ["walk_f","walk_f","df_ph","walk_f","walk_f","roll_b","roll_f","walk_f"];
      this.dis_num = this.dis_array.length;
   }
   function combo_init()
   {
      this.combo_1 = new Object();
      this.combo_land = new Object();
      this.combo_auto = new Object();
      this.combo_burst = new Object();
      this.delay_frames = new Object();
      this.combo_1.roll_b = ["punch"];
      this.combo_1.punch = ["df_pl","df_ph"];
      this.combo_1.punch2 = ["df_pl","df_ph"];
      this.combo_1.punch_l = ["punch","kick","kick_l","squatKick_l","squatKick","heavyHit"];
      this.combo_1.kick_l = ["punch","kick","squatKick","heavyHit"];
      this.combo_1.kick_lc = ["punch","kick","squatKick","heavyHit"];
      this.combo_1.kick = ["df_pl","df_ph"];
      this.combo_1.kick2 = ["df_pl","df_ph"];
      this.combo_1.squatKick = ["df_pl","df_ph","df_ph"];
      this.combo_1.heavyHit = ["df_pl","df_ph"];
      this.combo_1.squatPunch = ["df_pl","df_ph"];
      this.combo_1.squatKick_l = ["punch_l","punch","kick","squatKick","heavyHit"];
      this.combo_1.squatPunch_l = ["punch_l","squatKick_l","punch","squatKick","heavyHit"];
      this.combo_1.jumpSkill_kick = ["df_kl","df_kh","walk_b"];
      this.combo_land.df_kl = ["heavyHit","jump","df_ph"];
      this.combo_land.df_kh = ["heavyHit","jump","df_ph"];
      this.combo_burst.punch2 = ["df_pl","df_ph"];
      this.combo_burst.kick2 = ["df_pl","df_ph"];
      this.combo_burst.punch = ["df_pl","df_ph"];
      this.combo_burst.kick = ["df_pl","df_ph"];
      this.combo_burst.squatPunch = this.combo_burst.punch2;
      this.combo_burst.df_pl = ["df_ph"];
      this.combo_burst.df_ph = ["df_pl"];
      this.combo_oppOnEgde.df_pl = [true,true];
      this.combo_oppOnEgde.df_ph = [true,true];
      this.combo_land.jumpSkill_heavyHit = ["df_ph","df_pl","jump"];
      this.comboDis.jumpSkill_heavyHit = [500,300,200];
      this.comboHeightL.jumpSkill_heavyHit = [50,100,150];
      this.comboHeightH.jumpSkill_heavyHit = [150,200,250];
      this.combo_land.jumpSkill_kick = ["squatKick_l","kick_l"];
      this.combo_land.jump_f = ["squatKick_l","jump_b"];
      this.comboDis.jump_f = [250,400];
      this.combo_land.jump = ["squatKick_l","jump_b"];
      this.comboDis.jump = [250,400];
      this.action_1 = new Object();
      this.action_1.airAttack = [["df_ph"],["walk_f"]];
      this.delay_frames.airAttack = [1000,1000];
      this.delay_framesL.airAttack = [25,0];
      this.delay_framesH.airAttack = [350,500];
      this.action_1.down = [["roll_f"],["walk_f"]];
      this.delay_frames.down = [200,1000];
      this.action_1.downMove = [["roll_f"],["walk_f"]];
      this.delay_frames.downMove = [200,1000];
      this.action_1.getup = [["jump","jump_f","jump_b","roll_f","squatKick_l","squatPunch_l"],["roll_f","jump_b","jump","roll_b"],["df_pl"],["df_ph"]];
      this.delay_frames.getup = [250,400,500,1000];
      this.action_1.oppRoll = [["pitch","punch_l","squatPunch_l","squatKick_l"],["squatKick_l","kick_l","kick","jump_b"],["jump","jump_b"],["roll_b","roll_f","df_pl"],["df_ph","df_ph","df_pl"]];
      this.delay_frames.oppRoll = [150,300,400,600,1000];
      this.action_1.oppRollDown = [["pitch","pitch2"],["squatKick_l","squatPunch_l"],["roll_f","jump_b","jump","roll_b"],["df_pl"],["df_ph"]];
      this.delay_frames.oppRollDown = [100,270,400,500,1000];
      this.action_1.oppLandHurt = [["kick_l","squatKick_l","squatPunch_l","squatKick"],["jump","jump_f","df_pl"],["df_ph","df_ph","walk_f"]];
      this.delay_frames.oppLandHurt = [225,400,1000];
      this.action_1.oppLand = [["pitch","pitch2","squatKick_l","squatPunch_l","punch_l","kick_l"],["squatKick_l","squatKick","kick_l"]];
      this.delay_frames.oppLand = [100,270];
      this.action_1.wander = [["roll_b","jump_b"],["wait","jump_b","jump","jump_f","walk_f","roll_f"],["walk_f","wait"]];
      this.delay_frames.wander = [150,300,1000];
      this.action_1.defend = [["walk_b","walk_b"],["walk_b","roll_f","roll_b"],["walk_b","roll_f","jump_b","roll_f","roll_b"],["walk_b","wait"]];
      this.delay_frames.defend = [130,200,400,1000];
      this.action_1.defend_f = [["roll_f"],["hold_u"]];
      this.delay_frames.defend_f = [150,1000];
      this.action_1.defend_dashf = [["squatKick_l","squatKick","kick_l"],["jump","jump_b","jump_f"],["df_pl","jump"],["df_ph","walk_f","df_ph"]];
      this.delay_frames.defend_dashf = [270,400,500,1000];
      this.action_1.defend_h = [["hold_u","hold_u","roll_f"],["hold_u","roll_b"],["hold_u"]];
      this.delay_frames.defend_h = [130,200,1000];
      this.action_1.onEgde = [["attack","attack","roll_f","roll_b"],["attack"],["attack","walk_f"],["walk_f","walk_f"]];
      this.delay_frames.onEgde = [150,250,400,1000];
      this.action_1.pos_down = [["squatKick_l","squatKick","walk_f"],["squatKick","jump","walk_f"],["walk_f","jump_f","jump"]];
      this.delay_frames.pos_down = [150,250,400];
      this.action_1.pos_up = [["jump_f","jump","walk_f"],["walk_f","jump_f","jump"]];
      this.delay_frames.pos_up = [250,400];
      this.action_1.oppJump = [["roll_f","roll_b","kick_l"],["jump_b","jump","roll_f","walk_b","kick","kick"],["df_ph","df_pl","df_ph","df_pl","jump_f","jump"]];
      this.delay_frames.oppJump = [200,300,1000];
      this.action_1.defendAttack = [["punch_l","hold_u","hold_d","heavyHit"],["roll_f","roll_b","jump","jump_b"]];
      this.delay_frames.defendAttack = [200,400];
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
                  else if(_loc4_ > 250)
                  {
                     owner.toSkill("df_ph");
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
            if(_loc4_ > 300 && _loc2_ < 0.18 * _level0.level)
            {
               _loc16_ = Math.random();
               if(_loc16_ < 0.5)
               {
                  owner.toSkill("df_pl");
               }
               else
               {
                  owner.toSkill("df_ph");
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
         if(opp.status_3 != "attack" && opp.status_6 == "normal" && !opp.hasObj() && owner.holdFreeze == false)
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
