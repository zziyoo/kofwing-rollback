class Type2_Igniz_AI_Lv2 extends Type2_Igniz_AI
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
   function Type2_Igniz_AI_Lv2()
   {
      super();
      this.skill_init();
      this.combo_init();
      this.combo_rate0 = 40;
      this.attack_rate0 = 50;
      this.hold_rate0 = 50;
      this.attack_s0 = 25;
      this.wait_frame0 = 15;
      this.combo_risk0 = 40;
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
      this.skill_dis[0] = ["walk_b","punch","squatKick_l","squatPunch_l","punch_l","kick_l","sk_dfo_ex"];
      this.skill_dis[1] = ["walk_b","squatPunch_l","punch_l","sk_dfo_ex"];
      this.skill_dis[2] = ["walk_f","kick","sk_dfo_ex","sk_dbo_ex"];
      this.skill_dis[3] = ["walk_f","sk_bdbp_ex","kick_l","sk_dfdfk_ex","sk_dfdfp_ex","sk_dfdfpl_ex","sk_dbo_ex"];
      this.skill_dis[4] = ["sk_fdbpl_ex","walk_f","walk_f","walk_f","sk_bdfp_ex","kick_l","roll_b","sk_dbo_ex"];
      this.skill_dis[5] = ["walk_f","walk_f","roll_b","sk_dfpl_ex","sk_fdbp_ex","sk_dbkl_ex","sk_dfkl_ex","sk_dbk_ex","sk_dfdfk_ex","sk_dfdfp_ex","sk_dfdfpl_ex"];
      this.skill_dis[6] = ["walk_f","walk_f","walk_f","sk_dfp_ex","sk_fdbk_ex","sk_dbk_ex","sk_dfk_ex","sk_dfdfp_ex","sk_dfdfpl_ex"];
      this.skill_dis[7] = ["walk_f","roll_b","walk_f","roll_f","walk_f","sk_dfp_ex","sk_fdbk_ex","sk_dbk_ex","sk_dfk_ex","sk_dfpl_ex","sk_dbp_ex","sk_dfdfp_ex","sk_dfdfpl_ex"];
      this.dis_num = this.dis_array.length;
   }
   function combo_init()
   {
      this.combo_1 = new Object();
      this.combo_land = new Object();
      this.combo_auto = new Object();
      this.combo_burst = new Object();
      this.delay_frames = new Object();
      this.combo_1.punch = ["sk_bdfpl_ex","sk_bdfp_ex"];
      this.comboDis.punch = [150,200];
      this.combo_1.punch2 = ["sk_dfpl_ex","sk_bdfp_ex"];
      this.comboDis.punch2 = [150,200];
      this.combo_1.punch_l = ["kick_l","sk_bfbdf_ex"];
      this.comboDis.punch_l = [200,500];
      this.comboHeightL.punch_l = [0,50];
      this.comboHeightH.punch_l = [5,500];
      this.combo_1.squatPunch_l = ["punch","kick","squatPunch_l","kick_l"];
      this.comboDis.squatPunch_l = [120,150,200,250];
      this.combo_1.sk_bdfp_ex = ["kick","sk_dfkl_ex"];
      this.comboDis.sk_bdfp_ex = [175,300];
      this.combo_1.sk_bdfpl_ex = ["kick","kick_l"];
      this.comboDis.sk_bdfpl_ex = [180,250];
      this.combo_1.kick = ["sk_fdbpl_ex","sk_fdb_ex","sk_bfbdf_ex"];
      this.comboDis.kick = [100,150,500];
      this.comboHeightL.kick = [0,0,50];
      this.comboHeightH.kick = [5,5,500];
      this.combo_1.kick_l = ["sk_fdfp_ex","sk_fdbp_ex","sk_dfkl_ex","sk_bfbdf_ex"];
      this.comboDis.kick_l = [200,250,300,500];
      this.comboHeightL.kick_l = [0,0,0,50];
      this.comboHeightH.kick_l = [5,5,5,500];
      this.combo_1.sk_bfbdf_ex = ["sk_dfdfpl_ex"];
      this.combo_1.sk_fdbkl_ex = ["sk_dfkl_ex"];
      this.combo_1.sk_dfkl_ex = ["sk_bdbp_ex"];
      this.combo_1.sk_bdbp_ex = ["sk_bdbp_ex","sk_bdbp_ex","sk_fdfp_ex"];
      this.combo_1.sk_dbkl_ex = ["sk_fdbpl_ex"];
      this.combo_1.sk_fdbpl_ex = ["sk_fdfp_ex"];
      this.combo_1.sk_fdbkl_ex = ["sk_dfkl_ex"];
      this.combo_1.sk_fdfp_ex = ["sk_dfkl_ex"];
      this.combo_1.sk_fdbp_ex = ["sk_dfkl_ex"];
      this.combo_1.sk_fdbk_ex = ["sk_dfk_ex"];
      this.combo_1.sk_dfk_ex = ["sk_bdbk_ex"];
      this.combo_1.sk_dbkl_ex = ["sk_fdbkl_ex"];
      this.combo_1.sk_dbp_ex = ["sk_fdbp_ex"];
      this.combo_1.sk_dbk_ex = ["sk_fdbk_ex"];
      this.combo_burst.sk_dfpl_ex = ["sk_dfk_ex","sk_dfdfp_ex","sk_dfdfk_ex"];
      this.combo_burst.sk_dfp_ex = ["sk_dfk_ex","sk_dfdfp_ex","sk_dfdfk_ex"];
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
      this.combo_1.punch_l = ["sk_bdfpl_ex","squatKick"];
      this.comboDis.punch_l = [200,250];
      this.combo_1.squatKick_l = ["squatPunch_l","sk_bdfpl_ex","squatKick_l","kick_l"];
      this.comboDis.squatKick_l = [150,200,250,300];
      this.combo_burst.sk_fdbpl_ex = ["sk_dfdfp_ex","sk_dfdfk_ex","sk_dfo_ex"];
      this.combo_burst.sk_fdbkl_ex = ["sk_dfdfp_ex","sk_dfdfk_ex"];
      this.combo_burst.sk_dfpl_ex = ["sk_dfdfp_ex","sk_dbo_ex","sk_dbo_ex"];
      this.combo_burst.sk_dfp_ex = ["sk_dfdfp_ex","sk_dbo_ex","sk_dbo_ex"];
      this.combo_burst.sk_dfkl_ex = ["sk_dfdfp_ex","sk_dbo_ex","sk_dbo_ex","sk_dfdfk_ex"];
      this.combo_burst.sk_dfk_ex = ["sk_dfdfp_ex","sk_dbo_ex","sk_dbo_ex","sk_dfdfk_ex"];
      this.combo_burst.sk_dfdfk_ex = ["sk_dfdfp_ex","sk_dfo_ex","sk_dbo_ex"];
      this.action_1 = new Object();
      this.action_1.airAttack = [["sk_dfo_ex","sk_fdbkl_ex","sk_fdfp_ex","kick"],["sk_dfo_ex","sk_fdbkl_ex","sk_dfpl_ex","sk_fdbkl_ex","sk_dfdfk_ex","sk_fdfp_ex","kick_l"],["sk_dfkl_ex","sk_fdbp_ex"],["sk_dfk_ex","sk_fdbp_ex"],["sk_fdbp_ex"],["sk_fdbk_ex","walk_f"]];
      this.delay_frames.airAttack = [100,250,350,400,400,450];
      this.delay_framesL.airAttack = [150,150,150,150,200,200];
      this.delay_framesH.airAttack = [400,400,500,400,500,400];
      this.action_1.getup = [["jump_f","jump"],["roll_b","sk_bdbp_ex"],["jump_f","sk_bdfp_ex"],["sk_fdbp_ex"],["walk_f"]];
      this.delay_frames.down = [150,300,350,400,1000];
      this.action_1.down = [["roll_b","sk_dfdfpl_ex"],["sk_dbo_ex","walk_f","sk_dfdfpl_ex"]];
      this.delay_frames.down = [350,450];
      this.action_1.downPower = [["sk_dfdfk_ex","sk_dbo_ex"],["sk_dbo_ex","sk_dfdfk_ex"],["sk_dfdfk_ex"]];
      this.delay_frames.down = [350,450,1000];
      this.action_1.downMove = [["roll_b","sk_dbo_ex"],["walk_f"]];
      this.delay_frames.downMove = [350,1000];
      this.action_1.downMovePower = [["sk_dfdfk_ex","sk_dbo_ex"],["walk_f"]];
      this.delay_frames.downMove = [350,1000];
      this.action_1.oppRoll = [["pitch","pitch2","squatPunch_l","squatKick_l"],["squatKick_l","kick_l","jump"],["kick_l","jump","roll_b","jump_b","squatKick_l"],["roll_b","roll_b","sk_dfkl_ex","sk_fdbpl_ex"],["sk_dfkl_ex","sk_dfk_ex","jump_f","sk_dfkl_ex","sk_fdbkl_ex"],["sk_fdbk_ex","sk_fdbp_ex","sk_dfk_ex","sk_dfp_ex","sk_dfpl_ex"]];
      this.delay_frames.oppRoll = [100,200,400,500,660,1000];
      this.action_1.oppRollDown = [["roll_b"],["roll_b","squatKick_l"],["sk_dbpl_ex"],["sk_dbkl_ex"],["sk_dbp_ex"],["sk_dbk_ex"],["sk_dfk_ex"]];
      this.delay_frames.oppRollDown = [150,200,250,350,450,550,1000];
      this.action_1.oppLandHurt = [["punch"],["kick"],["squatPunch_l"],["kick_l","squatKick"]];
      this.delay_frames.oppLandHurt = [100,150,200,250];
      this.action_1.oppLand = [["pitch","pitch2","squatKick_l","squatPunch_l"],["punch_l","squatKick_l","squatPunch_l"],["squatKick_l","squatKick","kick_l"]];
      this.delay_frames.oppLand = [100,200,250];
      this.action_1.oppJump = [["sk_dfo_ex","sk_dfpl_ex","sk_fdfp_ex","sk_dfkl_ex"],["sk_dfpl_ex","sk_dfkl_ex","sk_dbpl_ex"],["sk_dfk_ex","sk_dfp_ex","sk_bdbk_ex"],["sk_dfk_ex","sk_dfp_ex","sk_dbp_ex","sk_dbk_ex","sk_fdbp_ex","sk_fdbk_ex"],["sk_dfk_ex","sk_dfp_ex"]];
      this.delay_frames.oppJump = [250,400,450,450,600,1000];
      this.action_1.wander = [["roll_b","jump_b"],["wait","jump_b","walk_f"],["walk_f"]];
      this.delay_frames.wander = [150,300,1000];
      this.action_1.defend = [["walk_b","walk_b","roll_f"],["walk_b","roll_b"],["walk_b","roll_b","jump_b","roll_b"],["walk_b"]];
      this.delay_frames.defend = [130,200,400,1000];
      this.action_1.defendAttack = [["sk_dfpl_ex","sk_fdfp_ex","sk_dfkl_ex","sk_dfo_ex"],["sk_dfdfk_ex","sk_dfkl_ex","sk_fdbkl_ex"],["sk_fdbp_ex","sk_dfdfp_ex"],["sk_fdbk_ex","sk_dfk_ex"]];
      this.delay_frames.defendAttack = [250,300,450,550];
      this.action_1.defend_f = [["squatKick_l","kick_l"],["sk_bdbp_ex"]];
      this.delay_frames.defend_f = [150,1000];
      this.action_1.defend_dashf = [["roll_f","squatKick_l"],["kick_l"],["sk_bdbp_ex"]];
      this.delay_frames.defend_dashf = [150,200,350];
      this.action_1.defend_h = [["hold_u","hold_u","roll_f"],["hold_u","roll_b"],["hold_u"]];
      this.delay_frames.defend_h = [130,200,1000];
      this.action_1.onEgde = [["hold_u","roll_f","sk_fdfp_ex"],["jump_f","walk_f"],["hold_u","jump_b"]];
      this.delay_frames.onEgde = [100,250,300];
      this.action_1.pos_down = [["squatKick_l","jump","walk_f"],["squatKick_l","walk_f"],["squatKick","walk_f"],["jump_f","walk_f"]];
      this.delay_frames.pos_down = [150,200,300,400];
      this.action_1.pos_up = [["jump","walk_f"],["jump_f","walk_f"],["jump_f","sk_dbkl_ex","walk_f"],["sk_dbp_ex","jump_f"],["sk_dbk_ex","walk_f"]];
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
         var _loc9_;
         var _loc6_;
         var _loc5_;
         var _loc13_;
         var _loc7_;
         var _loc12_;
         var _loc4_;
         var _loc3_;
         var _loc10_;
         var _loc11_;
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
            _loc2_ = Math.random();
            if(_loc13_ == "undefined" || _loc8_ == 1000)
            {
               return undefined;
            }
            if(owner.inBurst && owner.burst_mode == "power")
            {
               owner.toSkill("sk_dfdfk_ex");
               return undefined;
            }
            if(_loc4_ <= 300 && _loc4_ > 200 && _loc8_ < 3 && !_loc13_)
            {
               owner.toSkill("sk_dfpl_ex");
               return undefined;
            }
            if(_loc4_ <= 350 && _loc4_ > 300 && _loc8_ < 3 && !_loc13_)
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
               if(_loc4_ <= 580 && _loc4_ > 500 && _loc8_ < 3 && !_loc13_)
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
            if(opp.getObjNum() > 1)
            {
               return undefined;
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
                  owner.roll_b();
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
