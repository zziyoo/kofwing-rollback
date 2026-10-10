class Igniz_AI_Lv5 extends Igniz_AI
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
   function Igniz_AI_Lv5()
   {
      super();
      this.skill_init();
      this.combo_init();
      this.combo_rate0 = 100;
      this.attack_rate0 = 70;
      this.hold_rate0 = 100;
      this.attack_s0 = 60;
      this.wait_frame0 = 0;
      this.combo_risk0 = 0;
   }
   function skill_init()
   {
      this.dis_array[0] = 100;
      this.dis_array[1] = 150;
      this.dis_array[2] = 250;
      this.dis_array[3] = 300;
      this.dis_array[4] = 500;
      this.dis_array[5] = 650;
      this.dis_array[6] = 1000;
      this.skill_dis[0] = ["walk_b"];
      this.skill_dis[1] = ["walk_b"];
      this.skill_dis[2] = ["dash_f"];
      this.skill_dis[3] = ["dash_f","dash_f"];
      this.skill_dis[4] = ["dash_f","dash_f"];
      this.skill_dis[5] = ["dash_f","dash_f","dash_f","dash_f","dash_f","dash_f","db_pl"];
      this.skill_dis[6] = ["dash_f","dash_f","dash_f","dash_f","dash_f","dash_f","dash_f","dash_f","dash_f","db_pl","db_pl"];
      this.dis_num = this.dis_array.length;
   }
   function combo_init()
   {
      this.combo_1 = new Object();
      this.combo_land = new Object();
      this.combo_auto = new Object();
      this.combo_burst = new Object();
      this.delay_frames = new Object();
      this.combo_1.punch = ["df_ph"];
      this.combo_1.punch_l = ["db_k"];
      this.combo_1.squatKick_l = ["df_pl","squatPunch_l","kick_l"];
      this.comboDis.squatKick_l = [125,150,250];
      this.combo_1.db_pl = ["fdf_p","fdf_p","jump_f","db_p","dash_f"];
      this.combo_super.db_pl = ["dfdf_p","dfdf_p","dfdb_p","dfdb_p","dash_f"];
      this.combo_power.db_pl = ["dfdf_p","dfdf_p","dfdb_p","dfdb_p","dash_f"];
      this.combo_defend.db_pl = ["dfdf_p","dfdf_p","dfdb_p","dfdb_p","dash_f"];
      this.comboDis.db_pl = [200,300,400,400,1000];
      this.comboHeightL.db_pl = [5,5,5,5,0,0];
      this.comboHeightH.db_pl = [500,500,500,5,500];
      this.combo_1.kick_l = ["df_pl","kick","fdf_p","squatKick","db_k"];
      this.comboDis.kick_l = [125,160,225,260,350];
      this.combo_1.kick = ["df_pl","df_ph"];
      this.comboDis.kick = [120,200];
      this.combo_1.df_pl = ["kick","fdf_pl"];
      this.comboDis.df_pl = [150,200];
      this.combo_1.squatPunch_l = ["punch","kick","fdf_p","kick_l"];
      this.comboDis.squatPunch_l = [120,150,200,250];
      this.combo_1.db_p = ["dfdb_p","fdf_p"];
      this.combo_1.df_ph = ["fdf_p","df_ph","dfdf_p"];
      this.comboDis.df_ph = [250,300,400];
      this.combo_1.dfdf_p_max = ["dfdb_p_max"];
      this.comboDis.dfdf_p_max = [450];
      this.combo_1.dfdf_k_max = ["dfdb_p_max"];
      this.comboDis.dfdf_k_max = [350];
      this.combo_1.df_pl = ["df_ph"];
      this.combo_1.punch2 = ["df_ph","df_ph","df_ph","db_k","db_p"];
      this.combo_1.fdf_p = ["db_k","db_pl","db_pl","db_p","df_ph"];
      this.combo_super.fdf_p = ["dfdf_p","dfdf_k","dfdf_p","dfdb_p","dfdf_p"];
      this.combo_power.fdf_p = ["dfdf_p","dfdf_k","dfdf_k","dfdb_p","dfdf_p"];
      this.combo_defend.fdf_p = ["dfdf_p","dfdf_k","dfdf_p","dfdb_p","dfdf_p"];
      this.comboDis.fdf_p = [150,250,300,350,400];
      this.comboHeightL.fdf_p = [450,150,150,100,100];
      this.comboHeightH.fdf_p = [1000,500,500,500,500];
      this.combo_land.jumpSkill_kick = ["punch","kick","squatPunch_l","squatKick_l","kick_l"];
      this.comboDis.jumpSkill_kick = [100,150,200,250,300];
      this.combo_land.jump = ["squatKick_l"];
      this.comboDis.jump = [250];
      this.combo_land.jump_f = ["squatKick_l"];
      this.comboDis.jump = [250];
      this.combo_land.jumpSkill_heavyHit = ["dfdb_p","fdf_p"];
      this.comboDis.jumpSkill_heavyHit = [250,350];
      this.comboHeightL.jumpSkill_heavyHit = [50,50];
      this.comboHeightH.jumpSkill_heavyHit = [200,200];
      this.combo_burst.kick_l = ["df_ph"];
      this.combo_burst.df_pl = ["df_ph"];
      this.combo_burst.df_ph = ["fdf_p"];
      this.combo_burst.df_ph = ["df_ph","df_ph","fdf_p"];
      this.combo_burst.fdf_p = ["dfdb_p","dfdf_k","dfdf_p"];
      this.combo_burst.db_pl = ["dfdb_p"];
      this.combo_burst.dfdf_p = ["dfdf_k","dfdb_p","df_o"];
      this.combo_burst.dfdf_k = ["dfdb_p","df_o"];
      this.action_1 = new Object();
      this.action_1.airAttack = [["dfdb_p","df_o","fdf_p","db_pl"],["db_k","dfdf_k","df_ph","df_ph","fdf_p","dfdf_p"],["dfdb_p","df_o","jump_f","dfdf_p","db_p","db_pl","fdf_p"],["jump_f","df_o","dfdf_p","db_pl","db_pl"],["dfdf_p","db_pl"],["df_ph","df_ph","df_ph","df_ph","dfdf_k"]];
      this.delay_frames.airAttack = [200,200,250,350,400,400];
      this.delay_framesL.airAttack = [125,400,125,250,100,400];
      this.delay_framesH.airAttack = [175,500,175,350,150,500];
      this.action_1.down = [["dash_b"],["dash_f"]];
      this.delay_frames.down = [200,1000];
      this.action_1.downMove = [["dash_b"],["dash_f"]];
      this.delay_frames.downMove = [200,1000];
      this.action_1.getup = [["db_o","jump","dash_b","squatKick_l","squatPunch_l"],["db_o","dash_b","jump_f"],["db_o","db_p","df_ph","squatKick","kick_l","db_p","db_p"],["db_o","df_ph","jump_f","db_p"],["db_o","dash_f"],["db_o","dash_f","db_pl"]];
      this.delay_frames.getup = [150,280,350,400,550,1000];
      this.action_1.oppRoll = [["squatPunch_l","squatKick_l"],["squatKick_l","kick_l","jump"],["df_ph","dash_b"],["roll_b","dash_b","jump_f"],["db_k","jump_f","df_ph"],["dash_f"]];
      this.delay_frames.oppRoll = [100,150,400,450,660,1000];
      this.action_1.oppRollDown = [["squatKick_l"],["dash_b"],["db_o"]];
      this.delay_frames.oppRollDown = [150,200,1000];
      this.action_1.oppLandHurt = [["punch2"],["kick","kick","kick","db_k"],["squatKick_l","squatPunch_l","db_k"],["kick_l","squatKick"],["dfdf_p","db_p"],["db_pl"]];
      this.delay_frames.oppLandHurt = [100,150,200,250,400,1000];
      this.action_1.oppLand = [["db_o","squatKick_l","squatPunch_l","punch_l","kick"],["db_o","squatKick_l","squatPunch_l","punch_l"],["db_o","squatKick_l","squatKick","kick_l"],["db_o"]];
      this.delay_frames.oppLand = [100,200,250,1000];
      this.action_1.oppJump = [["db_k","df_o","fdf_pl","fdf_pl","fdf_pl","fdf_p","roll_f","db_pl","db_k"],["db_k","jump","df_o","fdf_p","df_k","dfdf_p","db_pl","db_k"],["jump_b","jump","dfdf_p","fdf_p","dfdb_p","db_pl","db_k","db_k","db_k"],["jump_f","df_ph","dfdb_p","db_pl","dfdf_k"],["dash_b"]];
      this.delay_frames.oppJump = [200,250,450,600,1000];
      this.action_1.wander = [["roll_b","jump_b"],["wait","jump_b","walk_f"],["dash_f"]];
      this.delay_frames.wander = [150,300,1000];
      this.action_1.defend = [["walk_b","walk_b","roll_f"],["walk_b","roll_b"],["walk_b","dash_b","jump_b","roll_b"],["walk_b"]];
      this.delay_frames.defend = [130,200,400,1000];
      this.action_1.defendAttack = [["df_o","fdf_p","dfdf_p","df_k","db_k","fdf_pl"],["df_o","dfdf_p","fdf_p","db_k","df_k","db_k"],["db_o","dfdf_p"],["db_o"]];
      this.delay_frames.defendAttack = [200,300,450,1000];
      this.action_1.defend_f = [["squatKick_l","kick_l"],["db_o"],["db_o"]];
      this.delay_frames.defend_f = [150,1000];
      this.action_1.defend_dashf = [["squatKick_l","squatPunch_l"],["kick_l"],["db_o"]];
      this.delay_frames.defend_dashf = [150,300,1000];
      this.action_1.defend_h = [["hold_u","hold_u","roll_f"],["hold_u","roll_b"],["hold_u"]];
      this.delay_frames.defend_h = [130,200,1000];
      this.action_1.pos_down = [["db_k","squatKick_l","db_o","jump","dash_f"],["db_k","squatKick_l","db_o","dash_b","dash_f"],["db_p","dash_f"],["squatKick","db_p","db_o","jump_f","dash_f","dash_f"],["squatKick","db_o","jump_f","dash_f","dash_f"],["db_o","dash_f"]];
      this.delay_frames.pos_down = [150,250,300,350,400,1000];
      this.action_1.pos_up = [["db_k","db_o","jump_f","dash_b","dash_f"],["jump_f","db_o","dash_f"],["db_o","dash_f"]];
      this.delay_frames.pos_up = [250,350,1000];
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
         var _loc9_;
         var _loc10_;
         var _loc6_;
         var _loc5_;
         var _loc8_;
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
            _loc9_ = 1000;
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
                  _loc9_ = _loc3_[_loc2_].area.obj_level;
                  _loc10_ = _loc3_[_loc2_].area._width;
                  _loc6_ = _loc3_[_loc2_].area._height;
                  _loc5_ = _loc3_[_loc2_].area.obj_Vx;
                  _loc7_ = _loc3_[_loc2_].area._y;
                  _loc12_ = _loc3_[_loc2_].area.breakDefend;
                  _loc13_ = _loc3_[_loc2_].area._x;
                  _loc11_ = _loc3_[_loc2_].area.hitPos;
                  _loc8_ = _loc3_[_loc2_].area.people;
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
            if(_loc8_ == "undefined" || _loc9_ == 1000)
            {
               return undefined;
            }
            if(_loc4_ <= 800 && _loc4_ > 650 && _loc9_ < 3 && !_loc8_ && _loc2_ < 0.18 * _level0.level)
            {
               owner.toSkill("db_pl");
               return undefined;
            }
            if(_loc4_ <= 400 && _loc4_ > 250 && !_loc8_ && _loc2_ < 0.18 * _level0.level)
            {
               owner.toSkill("db_k");
               return undefined;
            }
            if(_loc4_ <= 400 && _loc4_ > 150 && _loc2_ < 0.1 * _level0.level && this.getDis() < 400)
            {
               owner.toSkill("dfdf_p");
               return undefined;
            }
            if(_loc4_ <= 180 && _loc4_ > 130 && (_loc2_ < 0.03 * _level0.level || _loc12_ || _loc11_ == "all"))
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
