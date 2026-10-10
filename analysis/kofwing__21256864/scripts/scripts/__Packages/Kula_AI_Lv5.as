class Kula_AI_Lv5 extends Kula_AI
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
   function Kula_AI_Lv5()
   {
      super();
      this.skill_init();
      this.combo_init();
      this.combo_rate0 = 100;
      this.attack_rate0 = 65;
      this.hold_rate0 = 100;
      this.attack_s0 = 50;
      this.wait_frame0 = 0;
      this.combo_risk0 = 20;
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
      this.dis_array[7] = 550;
      this.dis_array[8] = 625;
      this.dis_array[9] = 1000;
      this.skill_dis[0] = ["walk_b"];
      this.skill_dis[1] = ["walk_f"];
      this.skill_dis[2] = ["walk_f"];
      this.skill_dis[3] = ["punch","punch_l","jump","jump_b","dash_f","kick_l","squatKick_l"];
      this.skill_dis[4] = ["jump","dash_f","dash_f","dash_f","dash_f"];
      this.skill_dis[5] = ["sk_dbk_l","sk_dbk","dash_f","dash_f","jump","dash_f","dash_f","dash_f","dash_f"];
      this.skill_dis[6] = ["sk_dbk","sk_dfp","dash_f","dash_f","sk_bingdian","jump_f"];
      this.skill_dis[7] = ["dash_f","dash_f","dash_f","dash_f","jump","dash_f","dash_f","sk_dfp","roll_f"];
      this.skill_dis[8] = ["dash_f","dash_f","dash_f"];
      this.skill_dis[9] = ["dash_f","dash_f","dash_f","dash_f","jump_f","jump_b","jump"];
      this.dis_num = this.dis_array.length;
   }
   function combo_init()
   {
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
               if(_loc4_ > 130 && _loc4_ <= 180 && _loc2_ < 0.18 * _level0.level && !_loc10_ && _loc9_ < 2)
               {
                  owner.toSkill("sk_beike");
                  return undefined;
               }
               if(_loc4_ > 130 && _loc4_ <= 180 && _loc2_ < 0.18 * _level0.level && !_loc10_ && _loc9_ >= 2)
               {
                  owner.toSkill("sk_tibing");
                  return undefined;
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
      this.combo_1 = new Object();
      this.combo_land = new Object();
      this.combo_auto = new Object();
      this.combo_burst = new Object();
      this.delay_frames = new Object();
      this.combo_1.punch = ["sk_dbk_l","sk_dbk","sk_dfpl","sk_huaxing"];
      this.combo_1.punch2 = ["punch_s1"];
      this.combo_1.punch_s1 = ["sk_dfpl","sk_dbk","sk_dbk_l"];
      this.combo_1.punch_l = ["punch","kick_l"];
      this.comboDis.punch_l = [120,250,1000,1000];
      this.combo_super.punch_l = ["punch","kick_l","sk_dfp","sk_dfp"];
      this.combo_defend.punch_l = ["punch","kick_l","sk_s_jiejie","sk_s_jiejie"];
      this.combo_power.punch_l = ["punch","kick_l","sk_s_jiejie","sk_s_jiejie"];
      this.delay_frames.punch_l = [0,0,5,6];
      this.comboHeightL.punch_l = [0,0,5,5];
      this.comboHeightH.punch_l = [5,5,500,500];
      this.combo_1.kickl = ["sk_dfpl"];
      this.combo_1.sk_dfpl = ["sk_dbk_l"];
      this.combo_1.sk_dfp = ["punch","sk_dfpl","punch","punch"];
      this.combo_1.kick_l = ["sk_dfpl","sk_dfpl","sk_dfpl","kick_l","sk_dbk_l","sk_dbk"];
      this.combo_1.squatPunch_l = ["punch2","squatKick_l"];
      this.comboDis.squatPunch_l = [120,250];
      this.combo_1.squatKick_l = ["punch2","kick_l"];
      this.comboDis.squatKick_l = [120,250];
      this.combo_1.sk_huaxing2 = ["kick2"];
      this.combo_1.sk_tibing0 = ["sk_bingdian","sk_s_bingren","sk_s_luanwu","sk_s_xingchen","squatPunch","sk_fdfp"];
      this.combo_1.kick = ["sk_dfpl"];
      this.combo_1.kick2 = ["sk_fdfp","sk_bingdian","sk_fdfp","sk_bingdian"];
      this.combo_super.kick2 = ["sk_s_bingren","sk_tibing","sk_tibing","sk_s_luanwu"];
      this.combo_defend.kick2 = ["sk_s_xingchen","sk_tibing","sk_tibing","sk_s_bingren"];
      this.combo_power.kick2 = ["sk_s_bingren","sk_tibing","sk_tibing","sk_s_bingren"];
      this.combo_1.squatPunch = ["sk_dfp","sk_dfpl","sk_dfpl","sk_dfpl"];
      this.combo_super.squatPunch = ["sk_dfp","sk_s_jiejie","sk_s_jiejie","sk_dfpl"];
      this.combo_defend.squatPunch = ["sk_bingdian","sk_s_jiejie","sk_s_jiejie","sk_dfpl"];
      this.combo_power.squatPunch = ["sk_dfp","sk_s_jiejie","sk_s_jiejie","sk_s_luanwu"];
      this.delay_frames.squatPunch = [0,3,4,0];
      this.comboDis.squatPunch = [1000,1000,1000,1000];
      this.comboHeightL.squatPunch = [5,5,5,0];
      this.comboHeightH.squatPunch = [500,500,500,5];
      this.combo_land.jump_f = ["punch","kick"];
      this.combo_burst.sk_dfpl = ["sk_fdfp","sk_dbk","sk_bingdian","sk_s_bingren"];
      this.combo_burst.sk_s_bingren = ["sk_s_xingchen","sk_s_jiejie"];
      this.combo_burst.sk_tibing = ["sk_s_xingchen"];
      this.combo_oppOnEgde.sk_tibing = [true];
      this.combo_land.jumpSkill_heavyHit = ["sk_s_luanwu","sk_dbk_l"];
      this.combo_land.jumpSkill_punch = ["squatKick_l","punch2","punch","sk_huaxing"];
      this.comboDis.jumpSkill_punch = [80,100,200,400];
      this.combo_land.jumpSkill_kick = ["squatKick_l","punch2","punch","sk_huaxing"];
      this.comboDis.jumpSkill_kick = [80,100,200,400];
      this.combo_land.jumpSkill_kick_l = ["squatKick_l","punch2","punch","sk_huaxing"];
      this.comboDis.jumpSkill_kick_l = [80,100,200,400];
      this.action_1 = new Object();
      this.action_1.airAttack = [["jump","sk_fdfp","sk_s_luanwu","squatPunch","punch_l","punch_l"],["kick2","kick2","kick2","sk_fdfp","jump","sk_tibing"],["sk_s_bingren","sk_s_bingren","sk_s_xingchen"],["squatPunch","punch_l","punch_l","jump_f"]];
      this.delay_frames.airAttack = [150,150,300,300];
      this.delay_framesL.airAttack = [100,150,225,75];
      this.delay_framesH.airAttack = [150,200,240,250];
      this.action_1.downMovePower = [["dash_b"],["sk_huaxing","dash_f"]];
      this.delay_frames.downMovePower = [250,1000];
      this.action_1.downMove = [["dash_b"],["sk_huaxing","dash_f"]];
      this.delay_frames.downMove = [250,1000];
      this.action_1.down = [["dash_b"],["dash_f","sk_huaxing"]];
      this.delay_frames.down = [200,1000];
      this.action_1.getup = [["jump","jump_f","jump_b","dash_b","squatKick_l","squatPunch_l"],["jump","jump_f","jump_b"],["jump_f","jump"],["sk_huaxing","sk_dfp"],["sk_dfp","sk_bingdian"]];
      this.delay_frames.getup = [150,200,300,350,470];
      this.action_1.oppRoll = [["squatPunch_l","punch_l","squatKick_l","roll_f"],["sk_huaxing","jump_b","jump","jump_f"],["sk_dfpl","jump_b","dash_b","sk_bingdian"],["sk_dfp","jump_b","sk_bingdian"],["sk_dfp","dash_b","roll_b"]];
      this.delay_frames.oppRoll = [150,400,500,600,1000];
      this.action_1.oppRollDown = [["pitch","pitch2"],["squatKick_l"],["jump_b","jump","jump_f","dash_b","sk_dbk_l"],["sk_huaxing","jump_b","sk_dfpl"],["jump_f","sk_dfp","sk_dfpl","sk_bingdian"],["dash_f"]];
      this.delay_frames.oppRollDown = [100,150,200,300,470,1000];
      this.action_1.oppLandHurt = [["kick_l","punch_l","kick2","squatKick_l"],["kick_l","punch_l","squatKick_l","dash_f"],["sk_huaxing","dash_f"],["dash_f","sk_dfpl"],["dash_f","sk_huaxing","sk_dfp","sk_bingdian"],["dash_f"]];
      this.delay_frames.oppLandHurt = [120,150,200,300,470,1000];
      this.action_1.oppLand = [["pitch","pitch2","kick_l","punch_l","squatPunch_l","squatKick_l"],["kick_l","punch_l","squatPunch_l","squatKick_l","dash_f"],["punch_l","kick_l","dash_f"]];
      this.delay_frames.oppLand = [100,140,200];
      this.action_1.oppJump = [["sk_fdfp_l","roll_f","sk_fdfp","sk_tibing"],["jump_b","jump","sk_tibing","sk_s_bingren"],["dash_b","jump","jump_b","jump_f","sk_fdfp","sk_tibing","sk_s_bingren"],["sk_bingdian","sk_dfpl","sk_dfp"]];
      this.delay_frames.oppJump = [200,450,600,800];
      this.action_1.wander = [["roll_b","jump_b"],["wait","jump_b","walk_f"],["dash_f"]];
      this.delay_frames.wander = [150,300,1000];
      this.action_1.defend = [["walk_b","walk_b","roll_f"],["walk_b","roll_b"],["walk_b","dash_b","jump_b","roll_b"],["walk_b"]];
      this.delay_frames.defend = [130,200,400,1000];
      this.action_1.defendAttack = [["sk_fdfp_l","sk_fdfp","sk_tibing","sk_s_jiejie"],["sk_tibing","sk_s_bingren","sk_s_jiejie","sk_dbk_l","sk_huaxing","jump","sk_s_jiejie","sk_s_luanwu","sk_fdfp"],["sk_s_bingren","sk_fdfp","sk_dfpl","sk_s_xingchen","sk_bingdian","sk_s_jiejie"]];
      this.delay_frames.defendAttack = [200,300,500];
      this.action_1.defend_f = [["squatKick_l","punch_l","kick_l","pitch2"],["jump"],["jump_b"],["hold_u"]];
      this.delay_frames.defend_f = [100,150,250,1000];
      this.action_1.defend_dashf = [["pitch","hold_u","roll_f"],["jump","jump_b","jump_f"],["sk_dbk_l","jump_f","jump_b","sk_dfpl","sk_huaxing"],["sk_dbk","jump","jump_b","sk_dfp","sk_bingdian"],["dash_b","dash_f","jump","jump_b"]];
      this.delay_frames.defend_dashf = [100,200,350,500,1000];
      this.action_1.defend_h = [["hold_u","hold_u","roll_f"],["hold_u","roll_b"],["hold_u"]];
      this.delay_frames.defend_h = [130,400,1000];
      this.action_1.pos_down = [["squatKick_l","jump","dash_f"],["squatKick","jump_b","dash_f","kick"],["sk_huaxing","dash_b"],["jump_f","dash_f","sk_dbk_l"],["sk_dbk_l"]];
      this.delay_frames.pos_down = [150,180,240,450,550];
      this.action_1.pos_up = [["jump","jump_b","dash_f"],["jump_f","dash_b","dash_f"],["jump_f","jump","dash_f"],["sk_dbk_l"]];
      this.delay_frames.pos_up = [150,250,450,550];
   }
}
