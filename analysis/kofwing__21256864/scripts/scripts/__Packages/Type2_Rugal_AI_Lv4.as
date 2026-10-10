class Type2_Rugal_AI_Lv4 extends Type2_Rugal_AI
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
   function Type2_Rugal_AI_Lv4()
   {
      super();
      this.skill_init();
      this.combo_init();
      this.combo_rate0 = 88;
      this.attack_rate0 = 64;
      this.hold_rate0 = 88;
      this.attack_s0 = 77;
      this.wait_frame0 = 10;
      this.combo_risk0 = 30;
   }
   function skill_init()
   {
      this.dis_array[0] = 100;
      this.dis_array[1] = 200;
      this.dis_array[2] = 250;
      this.dis_array[3] = 450;
      this.dis_array[4] = 550;
      this.dis_array[5] = 660;
      this.dis_array[6] = 1000;
      this.skill_dis[0] = ["walk_b"];
      this.skill_dis[1] = ["walk_b"];
      this.skill_dis[2] = ["dash_f"];
      this.skill_dis[3] = ["dash_f","dash_b"];
      this.skill_dis[4] = ["dash_f","dash_f","fbdf_p_EX"];
      this.skill_dis[5] = ["dash_f","dash_b","dash_f","dash_f","dash_f","fbdf_pl_EX","fbdf_p_EX"];
      this.skill_dis[6] = ["dash_f","dash_f","dash_f","dash_b","dash_f","roll_f","fbdf_pl_EX","fbdf_p_EX"];
      this.dis_num = this.dis_array.length;
   }
   function combo_init()
   {
      this.combo_1 = new Object();
      this.combo_land = new Object();
      this.combo_auto = new Object();
      this.combo_burst = new Object();
      this.delay_frames = new Object();
      this.combo_1.punch = ["fdb_k_EX","fdb_kl_EX","fdb_kl_EX"];
      this.combo_1.punch2 = ["f_kl"];
      this.combo_1.kick = ["fdb_k_EX","fdb_kl_EX","fdb_kl_EX"];
      this.combo_1.kick2 = ["f_kl"];
      this.combo_1.squatKick_l = ["squatPunch_l","kick2","f_kl"];
      this.combo_1.squatPunch_l = ["punch2","f_kl"];
      this.comboDis.squatPunch_l = [110,180];
      this.combo_1.squatPunch = ["dfdf_k","dfdb_p","db_o_EX"];
      this.delay_frames.squatPunch = [5,5,4];
      this.combo_1.punch_l = ["dfdf_k","dfdb_p","db_o_EX"];
      this.delay_frames.punch_l = [6,6,4];
      this.combo_1.punch_lc = ["dfdf_k","dfdb_p","db_o_EX"];
      this.delay_frames.punch_lc = [6,6,5];
      this.combo_burst.fdf_k3 = ["df_p_EX2"];
      this.combo_burst.df_p_EX2 = ["fdb_ph"];
      this.combo_burst.fdb_ph = ["fdf_k4","dfdb_p"];
      this.combo_burst.fdf_k4 = ["df_p_air_EX"];
      this.combo_burst.dfdb_p = ["df_o_EX"];
      this.combo_land.jump_f = ["squatKick_l"];
      this.comboDis.jump_f = [200];
      this.combo_land.jumpSkill_heavyHit = ["fdf_k3"];
      this.combo_land.jumpSkill_kick = ["squatPunch_l","squatKick_l"];
      this.comboDis.jumpSkill_kick = [150,200];
      this.combo_land.jumpSkill_kick_l = ["squatPunch_l","squatKick_l"];
      this.comboDis.jumpSkill_kick_l = [150,200];
      this.combo_1.df_o_EX = ["fbdf_pl_EX"];
      this.combo_burst.fbdf_pl_EX = ["fbdf_pl_EX","df_o_EX"];
      this.combo_burst.df_o_EX = ["fbdf_pl_EX"];
      this.combo_burst.punch2 = ["dfdb_p","fbdf_pl_EX","fdb_ph"];
      this.combo_burst.kick2 = ["dfdb_p","fbdf_pl_EX","fdb_ph"];
      this.action_1 = new Object();
      this.action_1.airAttackAlways = ["dfdf_k","dfdb_p"];
      this.delay_frames.airAttackAlways = [280,400];
      this.delay_framesL.airAttackAlways = [50,150];
      this.delay_framesH.airAttackAlways = [250,350];
      this.action_1.airAttack = [["heavyHit","punch_l","df_p_EX2","fdf_k4"],["jump","punch_l","squatPunch","fdf_k3","fdf_k3","fdf_k3","fdf_k4"],["punch_l","dfdf_k"],["fdf_k3","fdf_k3","fdf_k3","jump_f"],["dfdb_p","jump_f"],["fbdf_pl_EX"]];
      this.delay_frames.airAttack = [110,110,150,250,300,1000];
      this.delay_framesL.airAttack = [100,220,100,220,200,75];
      this.delay_framesH.airAttack = [200,350,200,350,350,250];
      this.action_1.downMove = [["df_o_EX","dfdb_p"],["dash_f"],["fbdf_p_EX"]];
      this.delay_frames.downMove = [250,400,500];
      this.action_1.down = [["df_o_EX"],["df_o_EX"],["fbdf_p_EX","df_o_EX"]];
      this.delay_frames.down = [150,450,1000];
      this.action_1.getup = [["squatKick_l","jump_f","dash_b","db_o_EX"],["dash_b"],["fbdf_p_EX"]];
      this.delay_frames.getup = [200,400,600];
      this.action_1.oppRoll = [["squatKick_l","squatPunch_l"],["squatKick_l","kick_l","jump"],["df_p_EX2","dash_b"],["roll_b","dash_b","jump_f"],["db_k","jump_f","df_p_EX2"],["dash_f","fdb_kl_EX","fdb_k_EX"]];
      this.delay_frames.oppRoll = [100,200,400,450,660,1000];
      this.action_1.oppRollDown = [["squatKick_l","squatKick_l","dash_b","jump_f"],["dash_b"],["fdb_kl_EX"],["fbdf_p_EX"]];
      this.delay_frames.oppRollDown = [200,250,350,1000];
      this.action_1.oppLandHurt = [["squatPunch_l","f_kl"],["squatKick_l","f_kl","dash_f"],["dash_f"],["fbdf_pl_EX"]];
      this.delay_frames.oppLandHurt = [130,160,350,1000];
      this.action_1.oppLand = [["squatKick_l","squatPunch_l"],["squatKick_l"]];
      this.delay_frames.oppLand = [100,200];
      this.action_1.oppJump = [["punch_l"],["fdf_k3","fdf_k4"],["df_p_EX","fdb_kl_EX","fdb_kl_EX","fdb_kl_EX","dfdf_k"],["jump_b","df_p_EX2"],["fbdf_pl_EX"]];
      this.delay_frames.oppJump = [100,250,300,350,1000];
      this.action_1.wander = [["roll_f"],["jump_f","roll_f"],["jump_b","dash_f"],["walk_b","roll_b","dash_b"],["walk_b","roll_b","dash_b"]];
      this.delay_frames.wander = [100,200,300,500,1000];
      this.action_1.defend = [["roll_f"],["walk_b"],["walk_b"],["roll_b","dash_b"],["roll_b","walk_b"]];
      this.delay_frames.defend = [100,200,300,500,1000];
      this.action_1.defendAttack = [["fdf_k3","fdf_k4","dfdb_p"],["fdb_kl_EX","dfdf_k"],["fbdf_pl_EX"]];
      this.delay_frames.defendAttack = [250,300,500];
      this.action_1.defend_f = [["squatKick_l"],["dash_b"],["fbdf_pl_EX"],["fbdf_pl_EX"]];
      this.delay_frames.defend_f = [200,300,450,1000];
      this.action_1.defend_dashf = [["squatKick_l"],["df_p_EX"],["fbdf_pl_EX"]];
      this.delay_frames.defend_dashf = [275,350,500];
      this.action_1.defend_h = [["hold_u","hold_u","roll_f"],["hold_u","roll_b"],["hold_u"]];
      this.delay_frames.defend_h = [130,200,1000];
      this.action_1.onEgde = [["hold_u","roll_f"],["jump_f","dash_f"],["hold_u","jump_b"]];
      this.delay_frames.onEgde = [100,250,300];
      this.action_1.pos_down = [["squatKick_l","squatKick_l","squatKick_l","squatKick","jump_f","dash_f"],["jump_f","dash_f"]];
      this.delay_frames.pos_down = [100,250,350];
      this.action_1.pos_up = [["jump","f_kl","dash_f"],["jump_f","dash_f"]];
      this.delay_frames.pos_up = [175,350];
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
         _loc2_ = Math.random();
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
            _loc2_ = Math.random();
            if(_loc11_ > 250)
            {
               return undefined;
            }
            if(_loc4_ < 130)
            {
               return undefined;
            }
            if(_loc5_ > 40)
            {
               owner.toSkill("df_k");
               return undefined;
            }
            if(_loc9_ == "undefined" || _loc10_ == 1000)
            {
               return undefined;
            }
            if(_loc4_ <= 350 && _loc4_ > 250 && !_loc9_ && _loc2_ < 0.18 * _level0.level)
            {
               owner.toSkill("df_k");
               return undefined;
            }
            if(_loc4_ <= 550 && _loc4_ > 350 && !_loc9_ && _loc10_ < 1 && _loc2_ < 0.18 * _level0.level)
            {
               owner.toSkill("fbdf_pl_EX");
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
