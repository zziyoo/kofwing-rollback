class Type2_Orochi_AI_Lv3 extends Type2_Orochi_AI
{
   var attack_rate0;
   var combo_rate0;
   var delayTimer;
   var dir;
   var dis_array;
   var dis_num;
   var hold_rate0;
   var mc;
   var opp;
   var skill_dis;
   var wait_frame0;
   function Type2_Orochi_AI_Lv3()
   {
      super();
      this.skill_init();
      this.combo_init();
      this.combo_rate0 = 70;
      this.attack_rate0 = 52;
      this.hold_rate0 = 70;
      this.attack_s0 = 46;
      this.wait_frame0 = 50;
      this.combo_risk0 = 50;
   }
   function skill_init()
   {
      this.dis_array[0] = 100;
      this.dis_array[1] = 150;
      this.dis_array[2] = 180;
      this.dis_array[3] = 300;
      this.dis_array[4] = 400;
      this.dis_array[5] = 500;
      this.dis_array[6] = 550;
      this.dis_array[7] = 1000;
      this.skill_dis[0] = ["squatPunch_l","squatKick_l","punch_l"];
      this.skill_dis[1] = ["kick","punch","sk_dfdfk"];
      this.skill_dis[2] = ["sk_dbp_ex","kick_l","walk_f","walk_f"];
      this.skill_dis[3] = ["sk_fdbkl","walk_f","walk_f","walk_f"];
      this.skill_dis[4] = ["walk_f","sk_fdbp","sk_dbp2","walk_f"];
      this.skill_dis[5] = ["walk_f","sk_dbp2","sk_fdbk","walk_f"];
      this.skill_dis[6] = ["sk_dfp2","walk_f","sk_dbp2","walk_f"];
      this.skill_dis[7] = ["sk_dfp2_l","walk_f","walk_f"];
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
      this.combo_1.punch_l = ["kick_l","sk_dfdfk"];
      this.comboDis.punch_l = [500,150];
      this.comboHeightL.punch_l = [0,5];
      this.comboHeightH.punch_l = [5,500];
      this.combo_1.kick_l = ["punch2","kick","sk_dfdfk"];
      this.comboDis.kick_l = [120,300,150];
      this.comboHeightL.kick_l = [0,0,5];
      this.comboHeightH.kick_l = [5,5,500];
      this.combo_1.squatKick_l = ["punch2","kick"];
      this.comboDis.squatKick_l = [120,300];
      this.combo_1.kick = ["sk_shiyue"];
      this.comboDis.kick = [300];
      this.comboHeightL.kick = [0];
      this.comboHeightH.kick = [5];
      this.combo_1.kick2 = ["sk_shiyue","kick_l","kick_l"];
      this.combo_1.punch = ["sk_dfp2"];
      this.combo_1.punch2 = ["sk_dfp2"];
      this.combo_auto.sk_dfp2 = ["walk_f","sk_dfp2_l","walk_f"];
      this.comboDis.sk_dfp2 = [150,200,1000];
      this.combo_auto.sk_dfp2_l = ["walk_f","sk_dfp2","walk_f"];
      this.comboDis.sk_dfp2_l = [150,200,1000];
      this.combo_auto.sk_shiyue = ["sk_dbp_l_ex","sk_dfp2","sk_dbp2"];
      this.comboDis.sk_shiyue = [175,225,500];
      this.combo_1.sk_fdbkl = ["sk_fdbp","sk_dfp2","sk_dfp2_l","walk_f"];
      this.comboDis.sk_fdbkl = [500,500,500,500];
      this.comboHeightL.sk_fdbkl = [150,375,475,0];
      this.comboHeightH.sk_fdbkl = [350,475,1000,500];
      this.combo_1.sk_fdbpl = ["sk_fdbp","sk_dfp2","sk_dbp2","sk_dbp_l_ex","walk_f"];
      this.combo_super.sk_fdbpl = ["sk_fdbp","sk_s_lunhui","sk_dbp2","sk_dbp_l_ex","walk_f"];
      this.combo_defend.sk_fdbpl = ["sk_fdbp","sk_s_lunhui","sk_dbp2","sk_dbp_l_ex","walk_f"];
      this.combo_power.sk_fdbpl = ["sk_fdbp","sk_s_lunhui","sk_dbp2","sk_dbp_l_ex","walk_f"];
      this.comboDis.sk_fdbp = [500,500,500,500,500];
      this.comboHeightL.sk_fdbp = [150,275,475,350,0];
      this.comboHeightH.sk_fdbp = [275,350,1000,475,500];
      this.combo_1.sk_fdbp = ["sk_fdbk","sk_dbp2","sk_dbp2","walk_f"];
      this.combo_super.sk_fdbp = ["sk_fdbp","sk_s_lunhui","sk_dbp2","walk_f"];
      this.combo_defend.sk_fdbp = ["sk_fdbp","sk_s_lunhui","sk_dbp2","walk_f"];
      this.combo_power.sk_fdbp = ["sk_fdbp","sk_s_lunhui","sk_dbp2","walk_f"];
      this.comboDis.sk_fdbp = [500,500,500,500];
      this.comboHeightL.sk_fdbp = [150,350,475,0];
      this.comboHeightH.sk_fdbp = [275,475,1000,500];
      this.combo_super.sk_fdbk = ["sk_s_zhuanpan2","sk_s_zhuanpan","sk_s_zhuanpan"];
      this.comboDis.sk_fdbk = [500,500,500];
      this.comboHeightL.sk_fdbk = [150,150,150];
      this.comboHeightH.sk_fdbk = [500,500,500];
      this.combo_1.sk_dbp_ex = ["sk_fdbpl","sk_fdbpl","sk_fdbpl","sk_dbp2","sk_dfp2"];
      this.delay_frames.sk_dbp_ex = [20,20,20,18,22];
      this.combo_1.sk_dbp_l_ex = ["sk_fdbpl","sk_fdbpl","sk_fdbpl","sk_dbp2","sk_dfp2"];
      this.delay_frames.sk_dbp_l_ex = [20,20,20,18,22];
      this.combo_auto.sk_s_zhuanpan = ["walk_f"];
      this.combo_1.kick2 = ["sk_dfp2","sk_shiyue","punch"];
      this.combo_land.jumpSkill_kick = ["squatKick_l","kick_l","kick"];
      this.comboDis.jumpSkill_kick = [100,125,300];
      this.combo_land.jumpSkill_kick_l = ["squatKick_l","kick_l","kick"];
      this.comboDis.jumpSkill_kick_l = [100,125,300];
      this.combo_land.jumpSkill_punch_l = ["squatKick_l","kick_l","kick"];
      this.comboDis.jumpSkill_punch_l = [100,125,300];
      this.combo_land.jumpSkill_punch = ["squatKick_l","kick_l","kick"];
      this.comboDis.jumpSkill_punch = [100,125,300];
      this.combo_land.jumpSkill_heavyHit = ["sk_dbp_l_ex","sk_dbp_ex","sk_dbp2_l","sk_dfp","sk_dbp2","sk_s_zhuanpan"];
      this.comboDis.jumpSkill_heavyHit = [130,180,300,350,420,1000];
      this.combo_burst.sk_s_zhuanpan2 = ["sk_s_zhuanpan"];
      this.combo_burst.sk_s_zhuanpan = ["sk_s_lunhui","sk_s_jiguang"];
      this.combo_burst.sk_s_lunhui = ["sk_s_sanhua"];
      this.combo_burst.sk_fdfk_ex = ["sk_s_zhuanpan2"];
      this.combo_burst.sk_fdfk_ex_l = ["sk_s_zhuanpan2"];
      this.combo_burst.sk_s_zhuanpan2 = ["sk_s_lunhui","sk_s_zhuanpan"];
      this.action_1 = new Object();
      this.action_1.airAttack = [["sk_dbp_l_ex","sk_dbp_l_ex","sk_dbp_l_ex","jump_f"],["sk_dbp_l_ex","sk_fdbpl"],["punch_l","kick_l","jump_f","sk_dbp_ex"],["sk_fdbpl"],["sk_dfp2","sk_fdbpl"],["sk_fdbkl"],["sk_fdbkl","sk_fdbkl","sk_dfp2","sk_dfp2"],["sk_fdbp"],["sk_fdbk"],["sk_s_zhuanpan","sk_s_zhuanpan2","sk_s_jiguang","sk_s_zhuanpan","sk_fdbp","sk_fdbp","sk_s_lunhui"],["sk_s_zhuanpan","sk_s_zhuanpan2","sk_s_jiguang","sk_s_zhuanpan","sk_fdbk","sk_fdbk"],["sk_dbp2"],["walk_f"]];
      this.delay_frames.airAttack = [165,165,180,200,200,300,300,400,500,400,500,500,1000];
      this.delay_framesL.airAttack = [125,225,75,125,125,125,125,125,125,275,275,450,0];
      this.delay_framesH.airAttack = [200,350,125,225,275,225,275,325,325,1000,1000,1000,1000];
      this.action_1.down = [["sk_dfdfk"],["walk_f"],["sk_dfp2_l"]];
      this.delay_frames.down = [140,450,1000];
      this.action_1.downMove = [["sk_s_sanhua","sk_fdfk_ex","sk_s_zhuanpan2"],["walk_f","sk_fdfk_ex","sk_s_sanhua","sk_s_zhuanpan2"],["walk_f","sk_s_sanhua","sk_s_zhuanpan2"]];
      this.delay_frames.downMove = [140,230,1000];
      this.action_1.getup = [["jump","roll_f","squatKick_l","squatPunch_l"],["sk_dbp2_l","roll_f","jump_f"],["sk_fdbp","sk_dbp2","roll_f"],["sk_dbp2","sk_dfp2"],["sk_dfp2_l"]];
      this.delay_frames.getup = [150,300,350,550,1000];
      this.action_1.oppRoll = [["squatKick_l","squatPunch_l"],["jump_f","sk_dfdfk","roll_f"],["jump_b","sk_s_zhuanpan2"],["roll_b","jump","sk_s_zhuanpan2"],["roll_b","sk_fdbpl","roll_b","sk_s_zhuanpan2","sk_dfp2_l","sk_dbp2_l"],["sk_s_zhuanpan2","sk_fdbkl"],["sk_s_zhuanpan2","sk_fdbp","sk_dbp2","sk_fdbk"]];
      this.delay_frames.oppRoll = [100,140,250,400,500,600,1000];
      this.action_1.oppRollDown = [["sk_dfdfk"],["roll_f"]];
      this.delay_frames.oppRollDown = [140,1000];
      this.action_1.oppLandHurt = [["kick","kick","squatPunch_l","squatKick_l","punch_l"],["squatKick_l","squatPunch_l","punch_l"],["kick"],["sk_dfp2"],["walk_f"]];
      this.delay_frames.oppLandHurt = [100,125,155,185,400];
      this.action_1.oppLand = [["squatKick_l","squatPunch_l"],["squatKick_l","squatPunch_l"],["kick_l","squatKick_l","squatPunch_l"]];
      this.delay_frames.oppLand = [140,180,200];
      this.action_1.oppLandCatch = [["sk_dfdfk","squatKick_l","squatPunch_l"]];
      this.delay_frames.oppLandCatch = [140];
      this.action_1.oppJump = [["sk_dbp_l_ex"],["jump","sk_dbp2_l","sk_s_lunhui"],["sk_dbp2_l","jump_f","sk_s_lunhui"],["sk_dbp2_l","sk_s_zhuanpan2","sk_s_zhuanpan","sk_s_lunhui"],["sk_s_zhuanpan2","sk_s_zhuanpan","sk_dbp2","sk_dfp2","sk_s_lunhui","sk_fdbpl","sk_fdbkl"],["sk_s_zhuanpan2","sk_dfp2","sk_s_zhuanpan","sk_fdbp","sk_fdbk","sk_dbp2"]];
      this.delay_frames.oppJump = [200,290,330,400,500,1000];
      this.action_1.wander = [["roll_f"],["jump_f","roll_f"],["jump_b","walk_f"],["walk_b","roll_b","roll_f"],["walk_b","roll_b","roll_f"]];
      this.delay_frames.wander = [100,200,300,500,1000];
      this.action_1.defend = [["roll_f"],["walk_b"],["walk_b"],["roll_b","roll_f"],["roll_b","walk_b"]];
      this.delay_frames.defend = [100,200,300,500,1000];
      this.action_1.defendAttack = [["kick"],["sk_dbp2_l"],["sk_s_zhuanpan","sk_s_zhuanpan2","sk_dbp2_l"],["sk_s_zhuanpan","sk_s_zhuanpan2","sk_fdbp","sk_dbp2"],["sk_fdbk","sk_dbp2"],["sk_s_zhuanpan","sk_s_zhuanpan2","sk_s_jiguang"]];
      this.delay_frames.defendAttack = [200,300,350,400,500,1000];
      this.action_1.defend_f = [["squatKick_l","kick_l"]];
      this.delay_frames.defend_f = [250];
      this.action_1.defend_dashf = [["roll_f","squatKick_l"],["squatPunch_l"],["jump"]];
      this.delay_frames.defend_dashf = [150,200,300];
      this.action_1.defend_h = [["hold_u"],["hold_u","hold_u","roll_f"],["hold_u","roll_b"],["hold_u"]];
      this.delay_frames.defend_h = [100,130,200,1000];
      this.action_1.pos_down = [["squatKick_l","walk_f"],["squatKick_l","walk_f"],["squatPunch","walk_f","jump"],["squatKick","walk_f"]];
      this.delay_frames.pos_down = [120,180,230,300];
      this.action_1.pos_up = [["kick2","walk_f"],["jump_b","walk_f"],["jump","walk_f"],["walk_f"],["jump_f","walk_f"]];
      this.delay_frames.pos_up = [120,180,220,250,350];
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
         var _loc16_ = int(Math.random() * 100);
         if((opp.mc.hitPos == "up" || opp.status_2 == "air") && owner.status_1 != "hold_u" && owner.status_1 != "hold_d")
         {
            owner.hold_u();
            return undefined;
         }
         if((opp.mc.hitPos == "up" || opp.status_2 == "air") && owner.status_1 == "hold_d" && _loc16_ < 18 * _level0.level)
         {
            owner.hold_u();
            return undefined;
         }
         if((opp.status_1.indexOf("squat") > -1 || opp.mc.hitPos == "down") && owner.status_1 != "hold_u" && owner.status_1 != "hold_d")
         {
            owner.hold_d();
            return undefined;
         }
         if((opp.status_1.indexOf("squat") > -1 || opp.mc.hitPos == "down") && owner.status_1 == "hold_u" && _loc16_ < 18 * _level0.level)
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
         var _loc12_;
         var _loc6_;
         var _loc5_;
         var _loc11_;
         var _loc7_;
         var _loc14_;
         var _loc4_;
         var _loc3_;
         var _loc15_;
         var _loc13_;
         var _loc9_;
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
            _loc10_ = 1000;
            _loc4_ = opp.getObjDis();
            _loc3_ = opp.getObjs();
            _loc2_ = 0;
            while(_loc2_ < _loc3_.length)
            {
               _loc9_ = _loc3_[_loc2_].objName;
               _loc8_ = Math.random();
               if(_loc9_ == "black_dot" && _loc8_ < 0.18 * _level0.level)
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
               if(_loc3_[_loc2_].area.obj_level != "undefined")
               {
                  _loc10_ = _loc3_[_loc2_].area.obj_level;
                  _loc12_ = _loc3_[_loc2_].area._width;
                  _loc6_ = _loc3_[_loc2_].area._height;
                  _loc5_ = _loc3_[_loc2_].area.obj_Vx;
                  _loc7_ = _loc3_[_loc2_].area._y;
                  _loc14_ = _loc3_[_loc2_].area.breakDefend;
                  _loc15_ = _loc3_[_loc2_].area._x;
                  _loc13_ = _loc3_[_loc2_].area.hitPos;
                  _loc11_ = _loc3_[_loc2_].area.people;
               }
               _loc2_ = _loc2_ + 1;
            }
            _loc2_ = Math.random();
            _loc2_ = Math.random();
            if(_loc11_ == "undefined" || _loc10_ == 1000)
            {
               return undefined;
            }
            if(_loc12_ > 250)
            {
               return undefined;
            }
            if(_loc4_ <= 250 && _loc4_ > 150 && _loc10_ < 4 && !_loc11_ && _loc2_ < 0.18 * _level0.level && _loc5_ > 15)
            {
               owner.toSkill("heavyHit");
               return undefined;
            }
            if(_loc4_ <= 130 && _loc4_ > 80 && _loc10_ < 4 && !_loc11_ && _loc2_ < 0.18 * _level0.level && _loc5_ <= 15 && _loc5_ > 5)
            {
               owner.toSkill("heavyHit");
               return undefined;
            }
            if(_loc4_ < 130)
            {
               return undefined;
            }
            if(_loc2_ < 0.5 && _loc2_ < 0.18 * _level0.level)
            {
               if(_loc10_ < 2)
               {
                  owner.toSkill("sk_s_lunhui");
               }
               else if(_loc4_ > 200)
               {
                  owner.toSkill("sk_s_zhuanpan2");
               }
               return undefined;
            }
            if(_loc4_ <= 180 && _loc4_ > 130 && (_loc2_ < 0.03 * _level0.level || _loc14_ || _loc13_ == "all"))
            {
               owner.roll_f();
               return undefined;
            }
            if((_loc11_ || _loc10_ > 3) && _loc2_ <= 0.75)
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
