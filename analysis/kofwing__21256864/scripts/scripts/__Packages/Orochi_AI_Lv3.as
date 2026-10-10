class Orochi_AI_Lv3 extends Orochi_AI
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
   var opp;
   var skill_dis;
   var wait_frame0;
   function Orochi_AI_Lv3()
   {
      super();
      this.skill_init();
      this.combo_init();
      this.combo_rate0 = 70;
      this.attack_rate0 = 52;
      this.hold_rate0 = 70;
      this.attack_s0 = 45;
      this.wait_frame0 = 50;
      this.combo_risk0 = 50;
   }
   function skill_init()
   {
      this.dis_array[0] = 100;
      this.dis_array[1] = 200;
      this.dis_array[2] = 300;
      this.dis_array[3] = 310;
      this.dis_array[4] = 390;
      this.dis_array[5] = 510;
      this.dis_array[6] = 550;
      this.dis_array[7] = 1000;
      this.skill_dis[0] = ["sk_fdfk","squatKick_l"];
      this.skill_dis[1] = ["walk_f","kick","sk_dfp"];
      this.skill_dis[2] = ["walk_f","sk_dfp","dbp_l"];
      this.skill_dis[3] = ["sk_dfp","dbk_l","dash_b"];
      this.skill_dis[4] = ["sk_dfp","walk_f","dbp","sk_dfk_l"];
      this.skill_dis[5] = ["walk_f","walk_f","walk_f","dbk","dbp"];
      this.skill_dis[6] = ["walk_f","walk_f","walk_f","walk_f","dbk"];
      this.skill_dis[7] = ["walk_f","walk_f"];
      this.dis_num = this.dis_array.length;
   }
   function combo_init()
   {
      this.combo_1 = new Object();
      this.combo_land = new Object();
      this.combo_auto = new Object();
      this.combo_burst = new Object();
      this.delay_frames = new Object();
      this.combo_1.squatPunch_l = ["kick_l"];
      this.combo_1.punch_l = ["kick_l"];
      this.combo_1.squatKick_l = ["squatPunch_l","punch_l"];
      this.combo_auto.kick_l = ["sk_bdfk"];
      this.combo_1.sk_bdfk = ["walk_f"];
      this.combo_1.sk_fdfk = ["sk_dbp_l","dbk_l","dbp","dbk","sk_dfk","sk_s_yangguang"];
      this.comboDis.sk_fdfk = [100,200,300,400,450,1000];
      this.comboHeightL.sk_fdfk = [100,0,0,0,0];
      this.comboHeightH.sk_fdfk = [500,500,500,500,500];
      this.combo_1.sk_dfp = ["sk_s_yangguang"];
      this.combo_1.punch = ["kick"];
      this.combo_land.jumpSkill_kick = ["squatKick_l","punch","kick_l"];
      this.comboDis.jumpSkill_kick = [130,150,300];
      this.combo_land.jumpSkill_kick_l = ["squatKick_l","kick_l","punch"];
      this.comboDis.jumpSkill_kick_l = [130,150,300];
      this.combo_land.jumpSkill_punch_l = ["squatKick_l","kick_l","punch"];
      this.comboDis.jumpSkill_punch_l = [130,150,300];
      this.combo_land.jumpSkill_punch = ["squatKick_l","kick_l","punch"];
      this.comboDis.jumpSkill_punch = [130,150,300];
      this.combo_land.jumpSkill_heavyHit = ["sk_dbp","sk_dfk_l","sk_dfk","sk_s_guangzhu"];
      this.comboDis.jumpSkill_heavyHit = [250,350,450,1000];
      this.combo_burst.sk_s_guangzhu = ["sk_s_yangguang","sk_s_taoxin"];
      this.combo_burst.sk_s_yangguang = ["sk_s_taoxin"];
      this.combo_burst.sk_s_taoxin = ["sk_s_qianshou1"];
      this.action_1 = new Object();
      this.action_1.airAttack = [["sk_fdfk","dbp_l","dbp_l","sk_dfp","dbp_l"],["sk_dfk_l","dbk_l","sk_dfp","jump_f"],["dbk_l"],["dbp"],["sk_dfk","dbp"],["dbk"],["dbk","sk_dfk"],["sk_fdfk","sk_fdfk","sk_fdfk","sk_fdfk","sk_dbp"],["sk_s_guangzhu","sk_s_yangguang","sk_s_yangguang"],["sk_s_guangzhu","sk_s_taoxin","sk_s_yangguang"]];
      this.delay_frames.airAttack = [200,250,310,400,400,510,510,200,1000,1000];
      this.delay_framesL.airAttack = [275,300,225,275,375,275,375,100,150,225];
      this.delay_framesH.airAttack = [375,500,375,375,500,375,500,275,225,350];
      this.action_1.airAttackPower = [["sk_fdfk","dbp_l","dbp_l","sk_dfp","dbp_l","jump_f"],["sk_dfk_l","dbk_l","sk_dfp"],["dbk_l"],["dbp"],["sk_dfk","dbp"],["dbk"],["dbk","sk_dfk"],["sk_fdfk"],["sk_s_yangguang"],["sk_s_guangzhu","sk_s_taoxin","sk_s_yangguang"]];
      this.delay_frames.airAttackPower = [200,250,310,400,400,510,510,200,1000,1000];
      this.delay_framesL.airAttackPower = [275,300,250,275,375,275,375,100,225,200];
      this.delay_framesH.airAttackPower = [375,500,375,375,500,375,500,225,375,350];
      this.action_1.down = [["sk_97","dash_b"],["sk_s_qianshou1","dash_b"],["dash_b","roll_b","walk_f"],["dash_b","walk_f","sk_dfp"],["sk_dfp","walk_f"]];
      this.delay_frames.down = [170,230,350,550,1000];
      this.action_1.oppRoll = [["squatPunch_l","squatKick_l"],["jump_f","sk_97","roll_f"],["jump_b","sk_s_yangguang","sk_dbp"],["roll_b","jump","sk_s_yangguang"],["roll_b","dbp","dbk","roll_b","sk_s_yangguang","sk_dfp"],["sk_s_yangguang","dbp"],["sk_s_yangguang","dbk","sk_dfk"]];
      this.delay_frames.oppRoll = [100,200,250,300,500,600,1000];
      this.action_1.oppRollDown = [["squatKick_l"],["sk_97"],["dash_b"]];
      this.delay_frames.oppRollDown = [150,200,1000];
      this.action_1.oppLandHurt = [["kick_l","kick_l","kick","sk_fdfk","sk_dbp"],["sk_s_yangguang","sk_97","sk_dfp"],["sk_s_yangguang"],["walk_f"]];
      this.delay_frames.oppLandHurt = [180,250,450,1000];
      this.action_1.oppLand = [["squatKick_l"],["kick","sk_97"],["kick","sk_dbp","sk_dfp"]];
      this.delay_frames.oppLand = [100,220,250];
      this.action_1.oppJump = [["sk_fdfk","sk_dbp_l"],["sk_dbp","sk_dbp_l","sk_dbp_l"],["sk_dbp","dbp","sk_dfp","jump","sk_dfk_l","sk_dfk_l"],["dbk","sk_dfk","sk_dfp","jump_f"],["sk_s_yangguang","sk_dfk","sk_dfp"],["sk_s_yangguang","sk_dfp"]];
      this.delay_frames.oppJump = [220,310,390,510,550,1000];
      this.action_1.wander = [["roll_f"],["jump_f","roll_f"],["jump_b","walk_f"],["walk_b","roll_b","dash_b"],["walk_b","roll_b","dash_b"]];
      this.delay_frames.wander = [100,200,300,500,1000];
      this.action_1.defend = [["roll_f"],["walk_b"],["walk_b"],["roll_b","dash_b"],["roll_b","walk_b"]];
      this.delay_frames.defend = [100,200,300,500,1000];
      this.action_1.defendAttack = [["dbp_l","sk_fdfk","kick"],["dbk_l","sk_dfk_l"],["sk_dfk_l"],["sk_dfk","dbp"],["sk_dfk","dbk"],["sk_s_guangzhu"]];
      this.delay_frames.defendAttack = [200,300,350,400,500,1000];
      this.action_1.defend_f = [["squatKick_l","jump_b"],["dbp_l"],["jump_b"],["dbk_l"],["dbp"],["dbk"],["sk_dfk"]];
      this.delay_frames.defend_f = [100,190,250,310,390,510,1000];
      this.action_1.defend_dashf = [["sk_fdfk","dbp_l","squatKick_l","roll_f"],["dbk_l"],["dbp","sk_dfk_l"],["dbk","sk_dfk"],["sk_dfp"],["sk_dfk"]];
      this.delay_frames.defend_dashf = [150,270,350,470,550,1000];
      this.action_1.defend_h = [["hold_u","hold_u","roll_f"],["hold_u","roll_b"],["hold_u"]];
      this.delay_frames.defend_h = [130,200,1000];
      this.action_1.onEgde = [["hold_u","roll_f"],["jump_f","walk_f"],["hold_u","jump_b"]];
      this.delay_frames.onEgde = [100,250,300];
      this.action_1.pos_down = [["squatKick_l"],["squatPunch","sk_97"],["squatKick","sk_dfp","sk_dbp"]];
      this.delay_frames.pos_down = [180,230,300];
      var _temp_4 = this.action_1;
      var _temp_3 = "pos_up";
      var _temp_2 = ["jump_f","sk_dfp","sk_dbp"];
      var _temp_1 = ["punch"];
      "jump";
      _temp_4[_temp_3] = [_temp_1.sk_97,_temp_2];
      this.delay_frames.pos_up = [120,250,350];
      this.action_1.super = [["sk_s_yangguang"],["sk_s_guangzhu"]];
      this.delay_frames.super = [350,1000];
      this.action_1.busrt = [["sk_s_yangguang"],["sk_s_guangzhu"]];
      this.delay_frames.busrt = [350,1000];
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
         var _loc6_;
         var _loc5_;
         var _loc8_;
         var _loc7_;
         var _loc13_;
         var _loc4_;
         var _loc3_;
         var _loc14_;
         var _loc12_;
         var _loc10_;
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
               _loc10_ = _loc3_[_loc2_].objName;
               if(_loc10_ == "black_dot")
               {
                  if(_loc4_ <= 175 && _loc4_ > 130)
                  {
                     owner.roll_b();
                  }
                  else if(_loc4_ <= 250)
                  {
                     owner.roll_f();
                  }
                  return undefined;
               }
               _loc8_ = false;
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
                  _loc8_ = _loc3_[_loc2_].area.people;
               }
               _loc2_ = _loc2_ + 1;
            }
            _loc2_ = Math.random();
            _loc2_ = Math.random();
            if(_loc8_ == "undefined" || _loc9_ == 1000)
            {
               return undefined;
            }
            if(_loc11_ > 250)
            {
               return undefined;
            }
            if(!_loc8_ && _loc5_ > 40 && _loc9_ < 3)
            {
               owner.toSkill("sk_bdfk");
               return undefined;
            }
            if(_loc4_ < 130)
            {
               return undefined;
            }
            if(_loc4_ <= 350 && _loc4_ > 200 && _loc2_ < 0.18 * _level0.level && !_loc8_ && _loc9_ < 3)
            {
               owner.toSkill("sk_bdfk");
               return undefined;
            }
            if(_loc4_ <= 500 && _loc4_ > 400 && _loc2_ < 0.18 * _level0.level)
            {
               if(_loc8_ != true && _loc9_ < 2 && _loc2_ < 0.09 * _level0.level)
               {
                  owner.toSkill("sk_dfp");
               }
               else if(_loc9_ < 2 && _loc2_ >= 0.09 * _level0.level && !_loc8_)
               {
                  owner.toSkill("sk_s_yangguang");
               }
               else if(owner.inBurst && owner.burst_mode == "power")
               {
                  owner.toSkill("sk_s_yangguang");
               }
               return undefined;
            }
            if(_loc4_ > 500 && _loc2_ < 0.14 * _level0.level && _loc5_ < 40 && this.inBurst)
            {
               owner.toSkill("sk_s_taoxin");
               return undefined;
            }
            if(_loc4_ <= 180 && _loc4_ > 130 && (_loc2_ < 0.03 * _level0.level || _loc13_ || _loc12_ == "all"))
            {
               owner.roll_f();
               return undefined;
            }
            if((_loc8_ || _loc9_ > 3) && _loc2_ <= 0.75)
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
            if(_loc4_ > 100 && _loc4_ < 150 && _loc5_ < 12 && _loc5_ <= 20 && _loc2_ < 0.18 * _level0.level && (_loc6_ < 100 && _loc7_ < 100 && _level0.cpu_op_mode !== "defend" || _loc6_ < 75 && _loc7_ < 75 && _level0.cpu_op_mode === "defend"))
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
            if(_loc4_ > 250 && _loc4_ <= 325 && _loc5_ > 8 && _loc5_ <= 20 && _loc2_ < 0.18 * _level0.level && (_loc6_ < 100 && _loc7_ < 100 && _level0.cpu_op_mode !== "defend" || _loc6_ < 75 && _loc7_ < 75 && _level0.cpu_op_mode === "defend"))
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
            if(_loc5_ > 70 && _loc4_ >= 150)
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
