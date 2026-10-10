class Orochi_AI_Lv5 extends Orochi_AI
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
   function Orochi_AI_Lv5()
   {
      super();
      this.skill_init();
      this.combo_init();
      this.combo_rate0 = 100;
      this.attack_rate0 = 80;
      this.hold_rate0 = 100;
      this.attack_s0 = 70;
      this.wait_frame0 = 0;
      this.combo_risk0 = 10;
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
      this.skill_dis[0] = ["dash_f"];
      this.skill_dis[1] = ["dash_f"];
      this.skill_dis[2] = ["dash_f"];
      this.skill_dis[3] = ["dash_f","dash_f"];
      this.skill_dis[4] = ["dash_f","dash_f","dash_f"];
      this.skill_dis[5] = ["dash_f","dash_f","dash_f","sk_dfk","dbk","dash_f","dash_f"];
      this.skill_dis[6] = ["sk_dfp","dash_f","dash_f","dash_f","sk_dfk","dash_f","dash_f"];
      this.skill_dis[7] = ["sk_dfp","dash_f","dash_f","dash_f","dash_f","dash_f","dash_f","dash_f","dash_f"];
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
      this.combo_auto.kick = ["sk_bdfk"];
      this.combo_auto.sk_bdfk = ["dash_f"];
      this.combo_auto.sk_fdfk = ["dbk_l","dbp","dbk","sk_dfk","sk_s_yangguang"];
      this.comboDis.sk_fdfk = [200,300,400,450,1000];
      this.combo_1.sk_dfp = ["sk_s_yangguang"];
      this.comboDis.sk_dfp = [1000];
      this.comboHeightL.sk_dfp = [0];
      this.comboHeightH.sk_dfp = [5];
      this.combo_auto.punch = ["sk_bdfk"];
      this.combo_auto.squatPunch = ["sk_bdfk"];
      this.combo_auto.kick = ["sk_bdfk"];
      this.combo_land.jumpSkill_kick = ["squatKick_l","punch","kick_l"];
      this.comboDis.jumpSkill_kick = [130,150,300];
      this.combo_land.jumpSkill_kick_l = ["squatKick_l","kick_l","punch"];
      this.comboDis.jumpSkill_kick_l = [130,150,300];
      this.combo_land.jumpSkill_punch_l = ["squatKick_l","kick_l","punch"];
      this.comboDis.jumpSkill_punch_l = [130,150,300];
      this.combo_land.jumpSkill_punch = ["squatKick_l","kick_l","punch"];
      this.comboDis.jumpSkill_punch = [130,150,300];
      this.combo_land.jumpSkill_heavyHit = ["sk_fdfk","sk_dbp","sk_dfk_l","sk_dfk","sk_s_guangzhu"];
      this.comboDis.jumpSkill_heavyHit = [200,250,350,450,1000];
      this.combo_burst.sk_s_guangzhu = ["sk_s_yangguang","sk_s_taoxin"];
      this.combo_burst.sk_s_yangguang = ["sk_s_taoxin"];
      this.comboDis.sk_s_yangguang = [1000];
      this.comboHeightL.sk_s_yangguang = [0];
      this.comboHeightH.sk_s_yangguang = [5];
      this.combo_burst.sk_s_taoxin = ["sk_s_qianshou1"];
      this.action_1 = new Object();
      this.action_1.airAttack = [["sk_fdfk","dbp_l","dbp_l","sk_dfp","dbp_l"],["dbk_l","sk_dfp","sk_dfp","sk_dfp","sk_dfp","jump_f"],["sk_dfk_l","dbk_l"],["dbk_l"],["dbp"],["sk_dfk","dbp"],["dbk"],["dbk","sk_dfk"],["sk_fdfk","sk_fdfk","sk_fdfk","sk_fdfk","sk_dbp"],["sk_s_guangzhu","sk_s_yangguang","sk_s_yangguang"],["sk_s_guangzhu","sk_s_taoxin","sk_s_yangguang"]];
      this.delay_frames.airAttack = [200,250,310,310,400,400,510,510,200,1000,1000];
      this.delay_framesL.airAttack = [275,350,300,225,275,375,275,375,100,150,225];
      this.delay_framesH.airAttack = [375,500,500,375,375,500,375,500,275,225,350];
      this.action_1.airAttackPower = [["sk_fdfk","dbp_l","dbp_l","sk_dfp","dbp_l"],["dbk_l","sk_dfp","sk_dfp","sk_dfp","sk_dfp","jump_f"],["sk_dfk_l","dbk_l"],["dbk_l"],["dbp"],["sk_dfk","dbp"],["dbk"],["dbk","sk_dfk"],["sk_fdfk"],["sk_s_yangguang"],["sk_s_guangzhu","sk_s_taoxin","sk_s_yangguang"]];
      this.delay_frames.airAttackPower = [200,250,310,310,400,400,510,510,200,1000,1000];
      this.delay_framesL.airAttackPower = [275,350,300,250,275,375,275,375,100,250,200];
      this.delay_framesH.airAttackPower = [375,500,500,375,375,500,375,500,225,375,350];
      this.action_1.down = [["sk_97","sk_s_qianshou1"],["sk_s_qianshou1"]];
      this.delay_frames.down = [180,230];
      this.action_1.downMove = [["sk_97","sk_s_qianshou1"],["dash_f"]];
      this.delay_frames.downMove = [200,1000];
      this.action_1.downMovePower = [["sk_s_qianshou1","sk_97"],["sk_97"],["dash_f"]];
      this.delay_frames.downMove = [230,400,1000];
      this.action_1.getup = [["jump","dash_b","squatKick_l","squatPunch_l"],["dash_b","dash_b","kick_l","kick","kick_l","kick_l"],["sk_dfk_l","dash_b","jump_f"],["sk_dfk_l","dbp","dash_b"],["sk_dfk","sk_dfk_l","dbp"],["sk_dfk_l","sk_dfk","dbk"],["sk_dfk","sk_dfp"]];
      this.delay_frames.getup = [150,230,300,350,400,510,600];
      this.action_1.oppRoll = [["squatPunch_l","squatKick_l","sk_97","sk_s_yangguang"],["jump_f","roll_f","sk_dbp","sk_s_yangguang"],["jump_b","sk_s_yangguang"],["roll_b","jump","sk_s_yangguang"],["roll_b","dbp","dbk","roll_b","sk_s_yangguang","sk_dfp"],["sk_s_yangguang","dbp"],["sk_s_yangguang","dbk","sk_dfk"]];
      this.delay_frames.oppRoll = [100,200,250,400,500,600,1000];
      this.action_1.oppRollDown = [["squatKick_l","kick_l","kick"],["dash_b"],["sk_dfp"]];
      this.delay_frames.oppRollDown = [150,450,1000];
      this.action_1.oppLandHurt = [["kick_l","kick_l","sk_fdfk"],["dash_f"],["sk_s_yangguang"]];
      this.delay_frames.oppLandHurt = [110,300,1000];
      this.action_1.oppLand = [["squatPunch_l","squatKick_l"],["kick_l","kick_l","kick_l","kick","punch_l"]];
      this.delay_frames.oppLand = [160,200];
      this.action_1.oppJump = [["sk_s_yangguang","kick","sk_dbp_l","sk_dbp_l","sk_dbp_l","sk_dbp_l","dbp_l"],["sk_s_yangguang","kick","sk_dbp_l","sk_dbp_l","sk_dbp_l","sk_dbp_l","dbk_l"],["sk_s_yangguang","dbp","sk_dfp","jump","sk_dfk_l","dbp"],["sk_s_yangguang","dbk","sk_dfk","sk_dfp","jump_f","dbk"],["sk_s_yangguang","sk_dfk","sk_dfp"],["sk_s_yangguang","sk_dfp"]];
      this.delay_frames.oppJump = [220,310,390,510,550,1000];
      this.action_1.wander = [["roll_b","jump_b"],["wait","jump_b","walk_f"],["dash_f"]];
      this.delay_frames.wander = [150,300,1000];
      this.action_1.defend = [["walk_b","walk_b","roll_f"],["walk_b","roll_b"],["walk_b","dash_b","jump_b","roll_b"],["walk_b"]];
      this.delay_frames.defend = [130,200,400,1000];
      this.action_1.defendAttack = [["sk_97","dbp_l","kick_l","sk_dbp","sk_s_guangzhu"],["dbk_l","sk_dfk_l","sk_s_guangzhu"],["sk_dfk_l","sk_s_guangzhu"],["sk_dfk","dbp","sk_s_guangzhu"],["sk_dfk","dbk","sk_s_yangguang","sk_s_taoxin"],["sk_s_guangzhu","sk_s_yangguang","sk_s_taoxin"]];
      this.delay_frames.defendAttack = [180,300,350,400,500,1000];
      this.action_1.defendAttackPower = [["dbp_l","kick_l","sk_dbp","sk_s_yangguang"],["dbk_l","sk_dfk_l","sk_s_yangguang"],["sk_dfk_l","sk_s_yangguang"],["sk_dfk","dbp","sk_s_yangguang"],["sk_dfk","dbk","sk_s_yangguang"],["sk_s_yangguang"]];
      this.delay_frames.defendAttack = [180,300,350,400,500,1000];
      this.action_1.defend_f = [["squatKick_l","jump_b"],["kick_l","kick","dbp_l"],["jump_b"],["dbp_l","jump_f"],["dbp","dbk_l"],["dbp","dbk"],["sk_dfk","dbk","sk_dfp"]];
      this.delay_frames.defend_f = [100,190,250,310,390,510,1000];
      this.action_1.defend_dashf = [["kick_l","kick","dbp_l","squatKick_l","roll_f"],["squatKick_l","dbp_l","punch_l"],["dbk_l","sk_dfk_l"],["dbp","sk_dfk"],["sk_dfp","dbk"],["sk_dfk"]];
      this.delay_frames.defend_dashf = [150,270,350,470,550,1000];
      this.action_1.defend_h = [["hold_u"],["hold_u","hold_u","roll_f"],["hold_u","roll_b"],["hold_u"]];
      this.delay_frames.defend_h = [100,130,200,1000];
      this.action_1.onEgde = [["hold_u","roll_f"],["jump_f","dash_f"],["hold_u","jump_b"]];
      this.delay_frames.onEgde = [100,250,300];
      this.action_1.pos_down = [["squatKick_l","kick_l","dash_f"],["squatKick_l","kick_l","dash_b","dash_f","jump"],["dash_f","jump_f"],["squatKick","dash_f"],["dash_f","dash_f","dash_f","jump_f"]];
      this.delay_frames.pos_down = [120,180,230,300,400];
      this.action_1.pos_up = [["squatKick_l","kick_l","dash_f"],["squatKick_l","kick_l","jump_b","dash_f"],["jump","dash_f"],["dash_f","dash_f","jump_f","dash_b"],["jump_b","jump_f","dash_f","dash_f"],["dash_f","dash_f","dash_f","jump_f"]];
      this.delay_frames.pos_up = [120,180,220,300,400];
   }
   function move_hold()
   {
      clearInterval(this.delayTimer);
      var opp = this.opp;
      var _loc16_ = this.dir;
      var owner = this;
      delete this.mc.onEnterFrame;
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
         var _loc2_;
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
         var _loc10_;
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
         var _loc9_;
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
            }
            else if((opp.mc.hitPos == "up" || opp.status_2 == "air") && owner.status_1 != "hold_u")
            {
               owner.hold_u();
            }
            _loc10_ = 1000;
            _loc4_ = opp.getObjDis();
            _loc3_ = opp.getObjs();
            _loc2_ = 0;
            while(_loc2_ < _loc3_.length)
            {
               _loc9_ = _loc3_[_loc2_].objName;
               if(_loc9_ == "black_dot")
               {
                  if(_loc4_ <= 175 && _loc4_ > 130)
                  {
                     owner.roll_b();
                  }
                  else if(_loc4_ <= 250)
                  {
                     owner.roll_f();
                  }
               }
               _loc8_ = false;
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
                  _loc8_ = _loc3_[_loc2_].area.people;
               }
               _loc2_ = _loc2_ + 1;
            }
            _loc2_ = Math.random();
            if(_loc8_ == "undefined" || _loc10_ == 1000)
            {
               return undefined;
            }
            if(_loc11_ > 250)
            {
               return undefined;
            }
            if(!_loc8_ && _loc5_ > 40 && _loc10_ < 3)
            {
               owner.toSkill("sk_bdfk");
               return undefined;
            }
            if(_loc4_ < 130)
            {
               return undefined;
            }
            if(_loc4_ <= 350 && _loc4_ > 200 && _loc2_ < 0.18 * _level0.level && !_loc8_ && _loc10_ < 3)
            {
               owner.toSkill("sk_bdfk");
               return undefined;
            }
            if(_loc4_ <= 500 && _loc4_ > 400 && _loc2_ < 0.18 * _level0.level)
            {
               if(_loc8_ != true && _loc10_ < 2 && _loc2_ < 0.09 * _level0.level)
               {
                  owner.toSkill("sk_dfp");
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
            if((_loc8_ || _loc10_ > 3) && _loc2_ <= 0.75)
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
            if(_loc5_ < 25 && _loc5_ > 12 && _loc4_ >= 150 && _loc2_ < 0.18 * _level0.level)
            {
               if(_loc4_ <= 200 && this.getDis() > 450)
               {
                  owner.roll_f();
               }
            }
            owner.move_hold();
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
