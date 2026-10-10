class Type2_Igniz_AI_Lv4 extends Type2_Igniz_AI
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
   function Type2_Igniz_AI_Lv4()
   {
      super();
      this.skill_init();
      this.combo_init();
      this.combo_rate0 = 90;
      this.attack_rate0 = 66;
      this.hold_rate0 = 90;
      this.attack_s0 = 80;
      this.wait_frame0 = 10;
      this.combo_risk0 = 30;
   }
   function skill_init()
   {
      this.dis_array[0] = 125;
      this.dis_array[1] = 200;
      this.dis_array[2] = 250;
      this.dis_array[3] = 300;
      this.dis_array[4] = 350;
      this.dis_array[5] = 480;
      this.dis_array[6] = 550;
      this.dis_array[7] = 1000;
      this.skill_dis[0] = ["walk_b"];
      this.skill_dis[1] = ["walk_b"];
      this.skill_dis[2] = ["dash_f"];
      this.skill_dis[3] = ["dash_f","sk_bdbp_ex","kick_l"];
      this.skill_dis[4] = ["sk_fdbpl_ex","dash_f","dash_f","dash_f","sk_bdfp_ex","kick_l","dash_b"];
      this.skill_dis[5] = ["dash_f","dash_f","dash_b","sk_dfpl_ex","sk_fdbp_ex","sk_dbkl_ex","sk_dfkl_ex","sk_dbk_ex"];
      this.skill_dis[6] = ["dash_f","dash_f","dash_f","sk_dfp_ex","sk_fdbk_ex","sk_dbk_ex","sk_dfk_ex"];
      this.skill_dis[7] = ["dash_f","dash_b","dash_f","roll_f","dash_f","sk_dfp_ex","sk_fdbk_ex","sk_dbk_ex","sk_dfk_ex","sk_dfpl_ex","sk_dbp_ex"];
      this.dis_num = this.dis_array.length;
   }
   function combo_init()
   {
      this.combo_1 = new Object();
      this.combo_land = new Object();
      this.combo_auto = new Object();
      this.combo_burst = new Object();
      this.delay_frames = new Object();
      this.combo_1.punch = ["sk_dbkl_ex","sk_dbpl_ex","sk_bdbp_ex"];
      this.combo_1.punch2 = ["sk_bdfp_ex"];
      this.combo_auto.punch_l = ["kick_l","sk_bfbdf_ex"];
      this.comboDis.punch_l = [500,500];
      this.comboHeightL.punch_l = [0,25];
      this.comboHeightH.punch_l = [5,500];
      this.combo_1.squatKick_l = ["punch2","squatPunch_l","kick","sk_bdbp_ex"];
      this.comboDis.squatKick_l = [100,125,150,500];
      this.combo_1.squatPunch_l = ["punch","kick","punch_l","kick_l"];
      this.comboDis.squatPunch_l = [120,150,200,500];
      this.combo_1.sk_bdfp_ex = ["kick","sk_dfkl_ex","sk_dfk_ex"];
      this.comboDis.sk_bdfp_ex = [175,400,1000];
      this.combo_1.sk_bdfpl_ex = ["kick","kick_l"];
      this.comboDis.sk_bdfpl_ex = [180,500];
      this.combo_auto.kick = ["sk_bdfp_ex","sk_dbkl_ex","sk_bfbdf_ex"];
      this.comboDis.kick = [120,350,500];
      this.comboHeightL.kick = [0,0,25];
      this.comboHeightH.kick = [5,5,500];
      this.combo_auto.kick_l = ["sk_bdbp_ex","sk_bdfp_ex","sk_bfbdf_ex"];
      this.comboDis.kick_l = [300,500,500];
      this.comboHeightL.kick_l = [0,0,25];
      this.comboHeightH.kick_l = [5,5,500];
      this.combo_burst.sk_bdbp_ex = ["sk_bdbp_ex","sk_fdfp_ex","sk_dfpl_ex"];
      this.combo_burst.sk_dfpl_ex = ["sk_dfp_ex"];
      this.combo_burst.sk_dfp_ex = ["sk_dfk_ex"];
      this.combo_auto.sk_dbpl_ex = ["sk_fdbpl_ex","sk_fdbkl_ex","sk_fdbp_ex","sk_fdbk_ex"];
      this.comboDis.sk_dbpl_ex = [230,360,510,650];
      this.combo_auto.sk_dbkl_ex = ["sk_fdbpl_ex","sk_fdbkl_ex","sk_fdbp_ex","sk_fdbk_ex"];
      this.comboDis.sk_dbkl_ex = [230,360,510,650];
      this.combo_auto.sk_dbp_ex = ["sk_fdbpl_ex","sk_fdbkl_ex","sk_fdbp_ex","sk_fdbk_ex"];
      this.comboDis.sk_dbp_ex = [230,360,510,650];
      this.combo_auto.sk_dbk_ex = ["sk_fdbpl_ex","sk_fdbkl_ex","sk_fdbp_ex","sk_fdbk_ex"];
      this.comboDis.sk_dbk_ex = [230,360,510,650];
      this.combo_land.jump_f = ["squatKick_l"];
      this.comboDis.jump_f = [250];
      this.combo_land.jumpSkill_kick = ["punch","kick","squatPunch_l","squatKick_l","kick_l"];
      this.comboDis.jumpSkill_kick = [100,150,200,250,300];
      this.combo_land.jump = ["squatKick_l"];
      this.comboDis.jump = [250];
      this.combo_land.jump_f = ["squatKick_l"];
      this.comboDis.jump = [250];
      this.combo_land.jumpSkill_heavyHit = ["sk_fdbpl_ex","sk_fdfp_ex"];
      this.comboDis.jumpSkill_heavyHit = [150,250];
      this.comboHeightL.jumpSkill_heavyHit = [50,50];
      this.comboHeightH.jumpSkill_heavyHit = [200,200];
      this.combo_burst.sk_fdbpl_ex = ["sk_dfdfp_ex","sk_dfdfk_ex","sk_dfo_ex"];
      this.combo_burst.sk_fdbkl_ex = ["sk_dfdfp_ex","sk_dfdfk_ex"];
      this.combo_burst.sk_dfdfk_ex = ["sk_dfdfp_ex","sk_dfo_ex","sk_dbo_ex"];
      this.combo_burst.sk_dfkl_ex = ["sk_bdbp_ex","sk_dfdfp_ex","sk_dbo_ex","sk_dfo_ex"];
      this.combo_burst.sk_dfk_ex = ["sk_bdbp_ex","sk_dfdfp_ex","sk_bdbk_ex","sk_dfo_ex"];
      this.combo_burst.sk_bdbp_ex = ["sk_bdbp_ex","sk_fdfp_ex","sk_dfpl_ex"];
      this.combo_burst.sk_dfpl_ex = ["sk_dfp_ex"];
      this.combo_burst.sk_dfp_ex = ["sk_dfk_ex"];
      this.action_1 = new Object();
      this.action_1.airAttack = [["punch_l","kick","sk_bdbp_ex"],["sk_dfo_ex","sk_bdbp_ex","sk_bdbp_ex","sk_bdbp_ex","sk_fdbpl_ex","sk_fdfp_ex","sk_fdfp_ex","sk_dfpl_ex","sk_dfdfp_ex"],["sk_dfo_ex","sk_bdbp_ex","sk_bdbp_ex","sk_bdbp_ex","sk_fdbkl_ex","sk_fdfp_ex","sk_fdfp_ex","sk_dfpl_ex","sk_dfdfp_ex"],["kick_l"],["sk_bdbp_ex","sk_bdbp_ex","sk_bdbp_ex","sk_fdbkl_ex","sk_dfpl_ex","sk_dfdfp_ex"],["sk_fdbp_ex","sk_dfkl_ex","sk_dfdfp_ex"],["sk_dfkl_ex","sk_dfdfp_ex"],["sk_fdbp_ex","sk_dfk_ex","sk_dfdfp_ex"],["sk_dfk_ex","sk_dfdfp_ex"],["sk_fdbk_ex","sk_dfk_ex","sk_dfdfp_ex"],["sk_dfdfk_ex"],["sk_dfdfp_ex"],["dash_f"]];
      this.delay_frames.airAttack = [180,180,250,290,300,400,400,500,600,650,700,1000,1000];
      this.delay_framesL.airAttack = [80,300,300,80,300,300,175,300,175,300,485,175,120];
      this.delay_framesH.airAttack = [125,485,485,125,485,485,300,485,300,485,1000,300,175];
      this.action_1.getup = [["jump","jump_f","jump_b","dash_b","squatKick_l","squatPunch_l"],["dash_b"],["sk_bdbp_ex","jump_f","kick_l","sk_dbkl_ex","sk_fdbkl_ex","squatKick"],["sk_dbp_ex","sk_fdbp_ex","dash_b"],["sk_dbp_ex","sk_fdbp_ex"],["dash_f"]];
      this.delay_frames.getup = [150,250,300,490,650,1000];
      this.action_1.down = [["sk_dfdfpl_ex","sk_dbo_ex"],["sk_dfdfpl_ex"]];
      this.delay_frames.down = [470,1000];
      this.action_1.downMove = [["sk_dbo_ex"],["dash_f"]];
      this.delay_frames.downMove = [470,1000];
      this.action_1.downMovePower = [["sk_dfdfk_ex","sk_dbo_ex"],["sk_dfdfk_ex"]];
      this.delay_frames.downMove = [470,1000];
      this.action_1.oppRoll = [["squatPunch_l","squatKick_l"],["squatKick_l","kick_l","jump"],["kick_l","jump","dash_b","jump_b","squatKick_l"],["roll_b","dash_b","sk_dfkl_ex","sk_fdbpl_ex"],["sk_dfkl_ex","sk_dfk_ex","jump_f","sk_dfkl_ex","sk_fdbkl_ex"],["sk_fdbk_ex","sk_fdbp_ex","sk_dfk_ex","sk_dfp_ex","sk_dfpl_ex"]];
      this.delay_frames.oppRoll = [100,200,400,500,660,1000];
      this.action_1.oppRollDown = [["dash_b"],["dash_b","squatKick_l"],["sk_dbpl_ex"],["sk_dbkl_ex"],["sk_dbp_ex"],["sk_dbk_ex"],["sk_dfk_ex"]];
      this.delay_frames.oppRollDown = [150,200,250,350,450,550,1000];
      this.action_1.oppLandHurt = [["punch"],["kick"],["squatPunch_l"],["kick_l","squatKick"]];
      this.delay_frames.oppLandHurt = [100,150,200,250];
      this.action_1.oppLand = [["pitch","pitch2","squatKick_l","squatPunch_l"],["punch_l","squatKick_l","squatPunch_l"],["squatKick_l","squatKick","kick_l"]];
      this.delay_frames.oppLand = [100,200,250];
      this.action_1.oppJump = [["sk_dfo_ex","sk_dfpl_ex","sk_fdfp_ex","sk_dfkl_ex"],["sk_dfpl_ex","sk_dfkl_ex","sk_dbpl_ex"],["sk_dfk_ex","sk_dfp_ex","sk_bdbk_ex"],["sk_dfk_ex","sk_dfp_ex","sk_dbp_ex","sk_dbk_ex","sk_fdbp_ex","sk_fdbk_ex"],["sk_dfk_ex","sk_dfp_ex"]];
      this.delay_frames.oppJump = [250,400,450,450,600,1000];
      this.action_1.wander = [["roll_b","jump_b"],["wait","jump_b","walk_f"],["dash_f"]];
      this.delay_frames.wander = [150,300,1000];
      this.action_1.defend = [["walk_b","walk_b","roll_f"],["walk_b","roll_b"],["walk_b","dash_b","jump_b","roll_b"],["walk_b"]];
      this.delay_frames.defend = [130,200,400,1000];
      this.action_1.defendAttack = [["sk_dfpl_ex","sk_fdfp_ex","sk_dfkl_ex","sk_dfo_ex"],["sk_dfdfk_ex","sk_dfkl_ex","sk_fdbkl_ex"],["sk_fdbp_ex","sk_dfdfp_ex"],["sk_fdbk_ex","sk_dfk_ex"]];
      this.delay_frames.defendAttack = [250,300,450,550];
      this.action_1.defend_f = [["squatKick_l","kick_l"],["sk_bdbp_ex"]];
      this.delay_frames.defend_f = [150,1000];
      this.action_1.defend_dashf = [["roll_f","squatKick_l"],["kick_l"],["sk_bdbp_ex"]];
      this.delay_frames.defend_dashf = [150,200,350];
      this.action_1.defend_h = [["hold_u","hold_u","roll_f"],["hold_u","roll_b"],["hold_u"]];
      this.delay_frames.defend_h = [130,200,1000];
      this.action_1.pos_down = [["squatKick_l","jump","dash_f"],["squatKick_l","dash_f"],["squatKick","dash_f"],["jump_f","dash_f"]];
      this.delay_frames.pos_down = [150,200,300,400];
      this.action_1.pos_up = [["jump","dash_f"],["jump_f","dash_f"],["jump_f","sk_dbkl_ex","dash_f"],["sk_dbp_ex","jump_f"],["sk_dbk_ex","dash_f"]];
      this.delay_frames.pos_up = [150,250,350,450,550];
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
         var _loc6_;
         var _loc5_;
         var _loc9_;
         var _loc7_;
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
                  _loc6_ = _loc3_[_loc2_].area._height;
                  _loc5_ = _loc3_[_loc2_].area.obj_Vx;
                  _loc7_ = _loc3_[_loc2_].area._y;
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
            if(_loc4_ < 130)
            {
               return undefined;
            }
            _loc2_ = Math.random();
            if(_loc9_ == "undefined" || _loc8_ == 1000)
            {
               return undefined;
            }
            if(owner.inBurst && owner.burst_mode == "power")
            {
               owner.toSkill("sk_dfdfk_ex");
               return undefined;
            }
            if(_loc4_ <= 300 && _loc4_ > 200 && _loc8_ < 3 && !_loc9_)
            {
               owner.toSkill("sk_dfpl_ex");
               return undefined;
            }
            if(_loc4_ <= 350 && _loc4_ > 300 && _loc8_ < 3 && !_loc9_)
            {
               if(this.getDis() > 500)
               {
                  owner.toSkill("sk_bdbk_ex");
                  return undefined;
               }
               if(this.getDis() <= 500)
               {
                  owner.toSkill("sk_dfpl_ex");
                  return undefined;
               }
            }
            else
            {
               if(_loc4_ <= 580 && _loc4_ > 500 && _loc8_ < 3 && !_loc9_)
               {
                  owner.toSkill("sk_dfp_ex");
                  return undefined;
               }
               if(_loc4_ <= 500 && _loc2_ < 0.1 * _level0.level)
               {
                  owner.toSkill("sk_dfdfk_ex");
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
