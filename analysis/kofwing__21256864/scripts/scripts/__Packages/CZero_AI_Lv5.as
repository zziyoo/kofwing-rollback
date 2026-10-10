class CZero_AI_Lv5 extends CZero_AI
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
   function CZero_AI_Lv5()
   {
      super();
      this.skill_init();
      this.combo_init();
      this.combo_rate0 = 100;
      this.attack_rate0 = 80;
      this.hold_rate0 = 100;
      this.attack_s0 = 50;
      this.wait_frame0 = 0;
      this.combo_risk0 = 15;
   }
   function skill_init()
   {
      this.dis_array[0] = 100;
      this.dis_array[1] = 200;
      this.dis_array[2] = 250;
      this.dis_array[3] = 280;
      this.dis_array[4] = 350;
      this.dis_array[5] = 500;
      this.dis_array[6] = 1000;
      this.skill_dis[0] = ["walk_b"];
      this.skill_dis[1] = ["walk_b"];
      this.skill_dis[2] = ["dash_f","dash_f","dash_f","dash_f","dash_f","dash_f","heavyHit","kick_l","df_pl"];
      this.skill_dis[3] = ["dash_f","dash_f","dash_f","dash_f","kick_l"];
      this.skill_dis[4] = ["dash_f","dash_f","dash_f","dash_f","dash_f"];
      this.skill_dis[5] = ["dash_f"];
      this.skill_dis[6] = ["dash_f"];
      this.dis_num = this.dis_array.length;
   }
   function combo_init()
   {
      this.combo_1 = new Object();
      this.combo_land = new Object();
      this.combo_auto = new Object();
      this.combo_burst = new Object();
      this.delay_frames = new Object();
      this.combo_1.punch_l = ["punch","dfdf_k","squatKick_l","kick_l"];
      this.comboDis.punch_l = [100,150,180,210];
      this.comboHeightL.punch_l = [0,50,0,0];
      this.comboHeightH.punch_l = [5,500,5,5];
      this.combo_1.punch = ["f_p_EX"];
      this.combo_1.punch2 = ["f_p_EX"];
      this.combo_1.f_p_EX = ["df_pl","dfdf_p","df_k","df_k","df_k","df_k"];
      this.combo_1.kick = ["f_p_EX","dfdf_k"];
      this.comboDis.kick = [100,1000];
      this.combo_1.kick2 = ["f_p_EX"];
      this.combo_power.df_k = ["dfdf_p_max_can"];
      this.comboDis.df_k = [200];
      this.combo_1.df_k = ["dfdf_p_can"];
      this.comboDis.df_k = [200];
      this.combo_1.kick_l = ["punch","squatPunch","squatKick_l","df_ph"];
      this.comboDis.kick_l = [100,120,180,220];
      this.combo_land.jumpSkill_heavyHit = ["fdf_ph","df_pl","dfdf_p","df_ph","dfdf_k"];
      this.comboDis.jumpSkill_heavyHit = [150,180,210,400,1000];
      this.comboHeightL.jumpSkill_heavyHit = [75,75,50,50,75];
      this.comboHeightH.jumpSkill_heavyHit = [250,250,250,250,500];
      this.combo_land.jumpSkill_kick = ["kick2","punch","squatPunch","squatPunch_l","squatKick_l"];
      this.comboDis.jumpSkill_kick = [100,120,150,175,220];
      this.combo_1.squatPunch = ["f_p_EX","df_ph"];
      this.combo_1.squatKick_l = ["punch","squatPunch","kick_l","df_k","df_ph"];
      this.comboDis.squatKick_l = [100,120,180,210,350];
      this.combo_1.squatPunch_l = ["punch","squatPunch","squatKick_l"];
      this.comboDis.squatPunch_l = [100,120,150];
      this.combo_land.jump_f = ["squatKick_l"];
      this.comboDis.jump_f = [220];
      this.combo_burst.df_k = ["punch","dfdf_p","kick"];
      this.combo_burst.df_pl = ["dfdf_p"];
      this.comboDis.df_pl = [200];
      this.combo_burst.fdf_pl = ["dfdf_p","df_k"];
      this.combo_burst.fdf_ph = ["dfdf_k","db_o"];
      this.combo_burst.dfdf_p = ["db_o","df_o"];
      this.combo_burst.dfdf_k = ["db_o"];
      this.action_1 = new Object();
      this.action_1.airAttack = [["fdf_ph","dfdf_p"],["df_pl","dfdf_p"],["fdf_pl"],["dfdf_p"],["df_ph"],["dfdf_k","dash_f"],["dash_f"]];
      this.delay_frames.airAttack = [100,130,200,220,350,1000,1000];
      this.delay_framesL.airAttack = [150,150,150,150,150,300,0];
      this.delay_framesH.airAttack = [250,250,250,250,250,500,300];
      this.action_1.downMove = [["dfdf_k","db_o"],["dash_f","db_o"]];
      this.delay_frames.downMove = [200,1000];
      this.action_1.down = [["dfdf_k"]];
      this.delay_frames.down = [1000];
      this.action_1.getup = [["squatPunch_l","squatKick_l","jump","dash_b","jump_b"],["df_k"],["jump_f"]];
      this.delay_frames.getup = [170,280,350];
      this.action_1.oppRoll = [["squatKick_l","squatPunch_l"],["squatKick_l","kick_l","jump"],["df_pl","dash_b"],["roll_b","dash_b","jump_f","df_k"],["jump_f","df_ph"]];
      this.delay_frames.oppRoll = [100,200,400,450,660];
      this.action_1.oppRollDown = [["squatKick_l","dash_b"],["dash_b"]];
      this.delay_frames.oppRollDown = [220,1000];
      this.action_1.oppLandHurt = [["squatPunch_l","punch_l"],["kick_l"],["jump_f"],["dash_f"]];
      this.delay_frames.oppLandHurt = [160,250,300,350];
      this.action_1.oppLandCatch = [["pitch","db_k","df_o"],["db_k","df_o"],["df_o"]];
      this.delay_frames.oppLandCatch = [100,160,240];
      this.action_1.oppLand = [["squatKick_l","squatPunch_l","punch_l"],["squatKick_l","kick_l"]];
      this.delay_frames.oppLand = [160,280];
      this.action_1.oppJump = [["df_pl","dfdf_p"],["kick","fdf_ph"],["db_k","dfdf_k","fdf_pl","punch_l"],["jump"],["jump","dfdf_k"],["df_ph"],["df_k"],["dash_b"]];
      this.delay_frames.oppJump = [100,150,200,250,350,380,500,1000];
      this.action_1.wander = [["roll_b","jump_b"],["wait","jump_b","walk_f"],["dash_f"]];
      this.delay_frames.wander = [150,300,1000];
      this.action_1.defend = [["walk_b","walk_b","roll_f"],["walk_b","roll_b"],["walk_b","dash_b","jump_b","roll_b"],["walk_b"]];
      this.delay_frames.defend = [130,200,400,1000];
      this.action_1.defendAttack = [["fdf_ph","dfdf_p"],["fdf_pl"],["df_k"],["df_ph","dfdf_k"],["dfdf_k"]];
      this.delay_frames.defendAttack = [150,250,280,350,1000];
      this.action_1.defend_f = [["squatKick_l","kick_l"],["df_ph"]];
      this.delay_frames.defend_f = [250,350];
      this.action_1.defend_h = [["hold_u","hold_u","roll_f"],["hold_u","roll_b"],["hold_u"]];
      this.delay_frames.defend_h = [130,200,1000];
      this.action_1.onEgde = [["hold_u","roll_f"],["jump_f"],["hold_u","jump_b"]];
      this.delay_frames.onEgde = [100,250,300];
      this.action_1.pos_down = [["squatKick","jump","dash_f","dash_b"],["squatKick_l","jump_f","dash_f"],["dash_f","dash_f","dash_f"],["jump_f"]];
      this.delay_frames.pos_down = [170,220,280,400];
      this.action_1.pos_up = [["jump","f_p","jump","dash_f","dash_b"],["dash_f","dash_f","dash_f","dash_f"],["jump_f"]];
      this.delay_frames.pos_up = [200,280,400];
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
            if(_loc4_ <= 350 && _loc4_ > 250 && _loc2_ < 0.18 * _level0.level)
            {
               if(!_loc9_)
               {
                  owner.toSkill("df_pl");
                  return undefined;
               }
            }
            else if(_loc4_ > 400 && _loc2_ < 0.1 * _level0.level)
            {
               owner.toSkill("dfdf_k");
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
