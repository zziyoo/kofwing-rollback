class Type3_Goenitz_AI_Lv2 extends Type3_Goenitz_AI
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
   var superSkillCan;
   var wait_frame0;
   function Type3_Goenitz_AI_Lv2()
   {
      super();
      this.skill_init();
      this.combo_init();
      this.combo_rate0 = 35;
      this.attack_rate0 = 45;
      this.hold_rate0 = 45;
      this.attack_s0 = 20;
      this.wait_frame0 = 20;
      this.combo_risk0 = 45;
   }
   function skill_init()
   {
      this.dis_array[0] = 100;
      this.dis_array[1] = 150;
      this.dis_array[2] = 200;
      this.dis_array[3] = 250;
      this.dis_array[4] = 280;
      this.dis_array[5] = 370;
      this.dis_array[6] = 490;
      this.dis_array[7] = 560;
      this.dis_array[8] = 650;
      this.dis_array[9] = 1000;
      this.skill_dis[0] = ["walk_b","squatKick_l","squatPunch","squatKick","squatPunch_l","punch_l","punch","kick","kick_l","sk_s2","sk_s1","sk_s1_k","fsyc","fsyc_h","sk_s_qianzai1"];
      this.skill_dis[1] = ["walk_b","squatKick_l","squatPunch","squatKick","squatPunch_l","punch_l","punch","kick","kick_l","sk_s2","sk_s1","sk_s1_k","fsyc","fsyc_h","sk_s_qianzai1"];
      this.skill_dis[2] = ["walk_b","squatKick_l","squatPunch","squatKick","squatPunch_l","punch_l","punch","kick","kick_l","sk_s1","sk_s1_k","fsyc","fsyc_h","sk_s_qianzai1"];
      this.skill_dis[3] = ["roll_f","sk1_1_l","sk_s1","sk_s1_k","fsyc","fsyc_h","sk_s_qianzai1"];
      this.skill_dis[4] = ["sk1_1","walk_f","walk_f","walk_f","sk_s1","sk_s1_k","fsyc","fsyc_h","sk_s_qianzai1"];
      this.skill_dis[5] = ["walk_f","walk_f","walk_f","walk_f","walk_f","sk_s1","sk_s1_k","fsyc","fsyc_h"];
      this.skill_dis[6] = ["walk_f","walk_f","walk_f","walk_f","walk_f"];
      this.skill_dis[7] = ["walk_f"];
      this.skill_dis[8] = ["walk_f","walk_f","walk_f","walk_f","walk_f","roll_f","sk5","sk4"];
      this.skill_dis[9] = ["walk_f","walk_f","walk_f","walk_f","roll_f","walk_f","walk_f","walk_f","walk_f","walk_f","sk5"];
      this.dis_num = this.dis_array.length;
   }
   function combo_init()
   {
      this.combo_1 = new Object();
      this.combo_land = new Object();
      this.combo_auto = new Object();
      this.combo_burst = new Object();
      this.delay_frames = new Object();
      this.combo_1.squatKick_l = ["punch","kick_l","squatPunch_l","punch_s2"];
      this.comboDis.squatKick_l = [100,115,150,350];
      this.combo_auto.punch = ["punch_s2"];
      this.combo_auto.punch2 = ["punch_s2"];
      this.combo_auto.kick2 = ["punch_s2"];
      this.combo_1.punch_l = ["punch","kick_l","squatPunch_l","punch_s2"];
      this.comboDis.punch_l = [100,115,150,350];
      this.combo_1.punch_l2 = ["punch","kick_l","squatPunch_l","punch_s2"];
      this.comboDis.punch_l2 = [100,115,150,350];
      this.combo_1.punch_s2 = ["sk1_1_l","sk1_1","sk1_1_l","sk1_1","sk3","sk_s1","fsyc","sk0_l"];
      this.combo_1.punch_s1 = ["sk1_1_l","sk1_1","sk1_1_l","sk1_1","sk3","sk_s1","fsyc","sk0_l"];
      this.combo_1.sk1_1_l = ["sk1_2_l","sk1_2_l","sk1_2_l","sk1_2_l","sk1_2_l","walk_f"];
      this.combo_1.sk1_2_l = ["sk1_3_l","sk1_3_l","sk1_3_l","walk_f"];
      this.combo_1.sk1_1 = ["sk1_2","sk1_2","sk1_2","sk1_2","sk1_2","sk1_2","walk_f"];
      this.combo_1.sk1_2 = ["sk1_3","sk1_3","sk1_3","sk1_3","walk_f"];
      this.combo_1.squatPunch = ["sk0","punch_s2","sk_s1"];
      this.combo_1.squatPunch_l = ["punch","kick_l","squatPunch_l","punch_s2"];
      this.comboDis.squatPunch_l = [100,115,150,350];
      this.combo_1.sk2_l = ["wind_land","wind_back","wind_back","wind_back"];
      this.combo_1.sk2 = ["wind_land","wind_back","wind_back","wind_back"];
      this.combo_1.sk4 = ["wind_land","wind_back","wind_back","wind_back"];
      this.combo_1.sk5 = ["wind_land","wind_back","wind_back","wind_back"];
      this.combo_1.kick_l = ["punch","kick_l","squatPunch_l","punch_s2"];
      this.comboDis.kick_l = [100,115,150,350];
      this.combo_1.kick_s2 = ["punch","kick_l","squatPunch_l","punch_s2"];
      this.comboDis.kick_s2 = [100,115,150,350];
      this.combo_1.kick = ["sk1_1","sk1_1_l","punch_s2"];
      this.combo_land.jumpSkill_heavyHit = ["sk0","sk0_l","sk_s1","sk3"];
      this.comboDis.jumpSkill_heavyHit = [230,280,350,400];
      this.comboHeightL.jumpSkill_heavyHit = [150,75,75,75];
      this.comboHeightH.jumpSkill_heavyHit = [250,150,150,150];
      this.combo_land.jumpSkill_kick = ["punch","squatKick_l","kick_l"];
      this.comboDis.jumpSkill_kick = [100,150,170];
      this.combo_land.jumpSkill_punch = ["punch","squatKick_l","kick_l"];
      this.comboDis.jumpSkill_punch = [100,150,170];
      this.combo_land.jumpSkill_kick_l = ["punch","squatKick_l","kick_l"];
      this.comboDis.jumpSkill_kick_l = [100,150,170];
      this.combo_land.jump_f = ["squatKick_l"];
      this.comboDis.jump_f = [150];
      this.combo_burst.wind_back = ["sk0_l","sk_s1_s"];
      this.combo_burst.punch = ["sk1_1","sk_s1","sk_s_qianzai1"];
      this.combo_burst.sk1_2_l = ["sk_s1","sk_s2"];
      this.combo_burst.sk1_2 = ["sk_s1","sk_s2"];
      this.combo_burst.sk1_1 = ["sk1_2","sk1_2","sk1_2","sk_s2"];
      this.combo_burst.sk1_1_l = ["sk1_2_l","sk1_2_l","sk1_2_l","sk_s2"];
      this.combo_burst.sk_s1 = ["sk_s_qianzai1"];
      this.combo_burst.sk2 = ["sk5","sk_s1_k","wind_back","wind_back"];
      this.combo_burst.sk4 = ["sk2","sk_s1_k","wind_back","wind_back"];
      this.combo_burst.sk2_l = ["sk4","sk_s1_k","wind_back","wind_back"];
      this.combo_burst.sk5 = ["sk_s1_k","wind_back","wind_back"];
      this.combo_burst.sk1_1 = ["sk1_2_l","sk1_2","sk3","sk4"];
      this.combo_burst.sk1_2 = ["sk0","sk_s1","sk_s_qianzai1","sk_s2"];
      this.combo_burst.fsyc = ["sk_s1_s"];
      this.combo_burst.fsyc_h = ["sk_s1_s"];
      this.combo_burst.sk_s1_k = ["sk_s_qianzai1"];
      this.delay_frames.sk_s1_k = [0];
      this.combo_burst.sk_s1 = ["sk_s_qianzai1"];
      this.delay_frames.sk_s1 = [0];
      this.combo_burst.sk3 = ["sk_s_qianzai1","sk_s1_k","fsyc_h","sk_s1_s"];
      this.combo_burst.sk0_l = ["sk1_1","sk1_1_l"];
      this.action_1 = new Object();
      this.action_1.airAttack = [["sk2_l","sk_s_qianzai1","jump_f","sk_s1_k"],["sk_s_qianzai1","jump_f","jump_f","sk_s1_k"],["sk_s1_k","sk0_l","sk3","jump_f"],["sk4","sk4","sk1_1_l"],["sk_s1_k","sk0_l","sk3","jump_f"],["sk2"],["sk_s1_k","sk3"],["sk5"],["sk_s1","sk3"]];
      this.delay_frames.airAttack = [190,230,230,280,280,370,370,490,430];
      this.delay_framesL.airAttack = [200,200,125,200,125,200,125,225,125];
      this.delay_framesH.airAttack = [350,350,200,350,200,350,200,350,225];
      this.action_1.down = [["sk2_l"],["sk4"],["sk2"],["sk5"],["walk_f"]];
      this.delay_frames.down = [190,290,370,490,1000];
      this.action_1.downMove = [["roll_f"],["walk_f"]];
      this.delay_frames.downMove = [200,1000];
      this.action_1.getup = [["jump","jump_f","jump_b","roll_f","squatKick_l","squatPunch_l"],["roll_f"],["sk0_l"],["walk_f","roll_f"],["sk5","walk_f"],["binghe_d","walk_f"]];
      this.delay_frames.getup = [150,250,280,400,560,1000];
      this.action_1.oppRoll = [["pitch","pitch2","squatKick_l","squatPunch_l","sk_s2"],["squatPunch_l","roll_f","jump_b","sk_s2"],["sk_s2"],["squatKick_l","squatPunch_l","jump_f"],["jump"],["jump_f","walk_f","sk2_l"],["sk4","walk_f"],["sk5","walk_f"]];
      this.delay_frames.oppRoll = [100,120,135,300,400,550,670,780];
      this.action_1.oppRollDown = [["pitch","pitch2"],["squatKick_l"],["roll_f"],["sk4"],["sk2","binghe_t","binghe_d"],["sk5"],["walk_f"]];
      this.delay_frames.oppRollDown = [100,180,260,290,400,490,1000];
      this.action_1.oppLandHurt = [["punch"],["kick_l","punch_l","squatKick_l","squatKick_l"],["kick_l","punch_l"],["punch_s2","sk1_1_l"],["sk1_1","sk0_l"]];
      this.delay_frames.oppLandHurt = [100,140,170,250,280];
      this.action_1.oppLandCatch = [["pitch","sk_s2","squatKick_l","squatKick_l","squatKick_l","squatKick_l"],["sk_s2"]];
      this.delay_frames.oppLandCatch = [100,140];
      this.action_1.oppLand = [["punch_l","squatKick_l","punch2"],["punch_l","squatKick_l","squatPunch_l"],["kick_l"]];
      this.delay_frames.oppLand = [100,150,170];
      this.action_1.oppJump = [["kick","sk_s1_k","sk0","squatPunch"],["sk1_1_l","sk1_1","sk0","sk_s1_k","squatPunch"],["binghe_t","binghe_d"],["sk2_l","sk_s1"],["sk2","sk4","sk_s1"],["sk5"]];
      this.delay_frames.oppJump = [251,300,400,500,600,1000];
      this.action_1.wander = [["roll_b","jump_b"],["wait","jump_b","walk_f"],["walk_f"]];
      this.delay_frames.wander = [150,300,1000];
      this.action_1.defend = [["walk_b","walk_b","roll_f"],["walk_b","roll_b"],["walk_b","roll_f","jump_b","roll_b"],["walk_b"]];
      this.delay_frames.defend = [130,200,400,1000];
      this.action_1.defendAttack = [["pitch","pitch2","fsyc_h","sk_s1"],["squatKick_l","squatPunch_l","fsyc","fsyc_h","sk_s1","sk_s_qianzai1"],["sk0_l","sk1_1_l","sk1_1","fsyc","sk_s1_k","sk0_l","sk4","sk4"],["sk3","fsyc","sk_s1_k","sk2"],["fsyc","sk5"]];
      this.delay_frames.defendAttack = [100,200,280,370,420,500];
      this.action_1.defend_f = [["squatKick_l","jump","pitch2"],["jump"],["jump_b"],["hold_u"]];
      this.delay_frames.defend_f = [100,150,250,1000];
      this.action_1.defend_dashf = [["pitch","hold_u","roll_f"],["jump"],["roll_f","jump_f"],["binghe_t","binghe_d"],["walk_f"]];
      this.delay_frames.defend_dashf = [100,150,250,400,1000];
      this.action_1.defend_h = [["hold_u","hold_u","hold_u","hold_u","roll_f"],["hold_u","hold_u","hold_u","roll_b"],["hold_u"]];
      this.delay_frames.defend_h = [130,400,1000];
      this.action_1.pos_down = [["squatKick_l","jump","walk_f","walk_f","walk_f"],["jump_b","walk_f","squatKick_l","walk_f","walk_f","walk_f"],["squatKick","walk_f","walk_f","walk_f","walk_f"],["jump_f","walk_f","walk_f","walk_f","walk_f","walk_f","walk_f"]];
      this.delay_frames.pos_down = [100,150,170,230,450];
      this.action_1.pos_up = [["jump","jump_b","walk_f","walk_f","walk_f"],["jump_f","walk_f","walk_f","walk_f","walk_f","walk_f","punch_s1"],["jump_f","jump","walk_f","walk_f","walk_f","walk_f","walk_f","walk_f","walk_f"]];
      this.delay_frames.pos_up = [180,250,400];
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
         var _loc2_;
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
         var _loc13_ = int(Math.random() * 100);
         if((opp.mc.hitPos == "up" || opp.status_2 == "air") && owner.status_1 != "hold_u" && owner.status_1 != "hold_d")
         {
            owner.hold_u();
            return undefined;
         }
         if((opp.mc.hitPos == "up" || opp.status_2 == "air") && owner.status_1 == "hold_d" && _loc13_ < 18 * _level0.level)
         {
            owner.hold_u();
            return undefined;
         }
         if((opp.status_1.indexOf("squat") > -1 || opp.mc.hitPos == "down") && owner.status_1 != "hold_u" && owner.status_1 != "hold_d")
         {
            owner.hold_d();
            return undefined;
         }
         if((opp.status_1.indexOf("squat") > -1 || opp.mc.hitPos == "down") && owner.status_1 == "hold_u" && _loc13_ < 18 * _level0.level)
         {
            owner.hold_d();
            return undefined;
         }
         if(owner.checkMustDefendSkill(opp.status_1))
         {
            return undefined;
         }
         var _loc8_;
         var _loc9_;
         var _loc6_;
         var _loc5_;
         var _loc14_;
         var _loc7_;
         var _loc12_;
         var _loc3_;
         var _loc4_;
         var _loc10_;
         var _loc11_;
         var _loc15_;
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
            _loc3_ = opp.getObjDis();
            _loc4_ = opp.getObjs();
            _loc2_ = 0;
            while(_loc2_ < _loc4_.length)
            {
               this.objName = _loc4_[_loc2_].objName;
               if(this.objName == "black_dot")
               {
                  if(_loc3_ <= 175 && _loc3_ > 130)
                  {
                     owner.roll_b();
                  }
                  else if(_loc3_ <= 250 && _loc3_ > 175)
                  {
                     owner.roll_f();
                  }
                  else if(_loc3_ > 250 && _loc3_ < 350)
                  {
                     owner.toSkill("binghe_d");
                  }
               }
               if(_loc4_[_loc2_].area.obj_level != "undefined")
               {
                  _loc8_ = _loc4_[_loc2_].area.obj_level;
                  _loc9_ = _loc4_[_loc2_].area._width;
                  _loc6_ = _loc4_[_loc2_].area._height;
                  _loc5_ = _loc4_[_loc2_].area.obj_Vx;
                  _loc7_ = _loc4_[_loc2_].area._y;
                  _loc12_ = _loc4_[_loc2_].area.breakDefend;
                  _loc10_ = _loc4_[_loc2_].area._x;
                  _loc11_ = _loc4_[_loc2_].area.hitPos;
               }
               _loc2_ = _loc2_ + 1;
            }
            _loc2_ = Math.random();
            _loc2_ = Math.random();
            if(_loc9_ > 250)
            {
               return undefined;
            }
            if(_loc3_ < 130)
            {
               return undefined;
            }
            if(_loc3_ <= 180 && _loc3_ > 130 && _loc2_ < 0.1)
            {
               owner.roll_f();
               return undefined;
            }
            if(_loc14_ == "undefined" || _loc8_ == 1000)
            {
               return undefined;
            }
            if(_loc2_ < 0.18 * _level0.level)
            {
               if(_loc3_ > 100 && _loc5_ <= 15 || _loc3_ > 200 && _loc5_ <= 25 && _loc5_ > 15 || _loc3_ > 300 && _loc5_ <= 50 && _loc5_ > 25 || _loc3_ > 450 && _loc5_ > 50)
               {
                  if(this.getDis() < 400)
                  {
                     owner.toSkill("binghe_t");
                  }
                  else if(this.getDis() < 500)
                  {
                     owner.toSkill("binghe_d");
                  }
                  return undefined;
               }
               if(this.getDis() > 650 && _loc3_ < 450 && _loc3_ > 300 && _loc2_ < 0.18 * _level0.level)
               {
                  _loc15_ = Math.random();
                  if(_loc15_ <= 0.5)
                  {
                     owner.toSkill("binghe_t");
                  }
                  else
                  {
                     owner.toSkill("binghe_d");
                  }
                  return undefined;
               }
            }
            if(_loc3_ > 250 && _loc3_ < 450 && (_loc6_ < 100 && _loc7_ < 100 && _level0.cpu_op_mode !== "defend" || _loc6_ < 75 && _loc7_ < 75 && _level0.cpu_op_mode === "defend") && this.getDis() < 450 && _loc2_ < 0.18 * _level0.level)
            {
               if(this.superSkillCan)
               {
                  owner.toSkill("sk_s1_k");
                  return undefined;
               }
            }
            if(_loc6_ < 65 && _loc7_ >= 150 && _loc3_ > 200 && _loc3_ < 450 && this.getDis() < 450 && _loc2_ < 0.18 * _level0.level)
            {
               if(this.superSkillCan)
               {
                  owner.toSkill("sk_s1");
                  return undefined;
               }
            }
            else
            {
               if(_loc3_ <= 400 && _loc3_ > 300 && _loc8_ < 3 && !_loc14_ && _loc2_ < 0.18 * _level0.level)
               {
                  owner.toSkill("sk2_l");
                  return undefined;
               }
               if(_loc3_ > 400 && _loc8_ < 3 && !_loc14_ && _loc2_ < 0.18 * _level0.level)
               {
                  owner.toSkill("sk4");
                  return undefined;
               }
            }
            if(_loc2_ < 0.05 * _level0.level && (_loc6_ < 100 && _loc7_ < 100 && _level0.cpu_op_mode !== "defend" || _loc6_ < 75 && _loc7_ < 75 && _level0.cpu_op_mode === "defend"))
            {
               if(_loc5_ > 30 && _loc5_ <= 50 && _loc3_ < 225)
               {
                  owner.jump();
               }
               if(_loc5_ > 20 && _loc5_ <= 30 && _loc3_ < 175)
               {
                  owner.jump();
               }
               if(_loc5_ > 10 && _loc5_ <= 20 && _loc3_ < 125)
               {
                  owner.jump();
               }
            }
            if(_loc3_ > 300 && _loc3_ < 450 && _loc5_ > 20 && _loc5_ <= 40 && _loc2_ < 0.18 * _level0.level && (_loc6_ < 100 && _loc7_ < 100 && _level0.cpu_op_mode !== "defend" || _loc6_ < 75 && _loc7_ < 75 && _level0.cpu_op_mode === "defend"))
            {
               owner.jump_f();
               return undefined;
            }
            if(_loc3_ > 200 && _loc3_ < 250 && _loc5_ > 12 && _loc5_ <= 20 && _loc2_ < 0.18 * _level0.level && (_loc6_ < 100 && _loc7_ < 100 && _level0.cpu_op_mode !== "defend" || _loc6_ < 75 && _loc7_ < 75 && _level0.cpu_op_mode === "defend"))
            {
               owner.jump_f();
               return undefined;
            }
            if(_loc3_ > 150 && _loc3_ < 200 && _loc5_ > 8 && _loc5_ <= 12 && _loc2_ < 0.18 * _level0.level && (_loc6_ < 100 && _loc7_ < 100 && _level0.cpu_op_mode !== "defend" || _loc6_ < 75 && _loc7_ < 75 && _level0.cpu_op_mode === "defend"))
            {
               owner.jump_f();
               return undefined;
            }
            if(_loc3_ > 400 && _loc3_ <= 500 && _loc5_ > 30 && _loc5_ <= 50 && _loc2_ < 0.18 * _level0.level && (_loc6_ < 100 && _loc7_ < 100 && _level0.cpu_op_mode !== "defend" || _loc6_ < 75 && _loc7_ < 75 && _level0.cpu_op_mode === "defend"))
            {
               owner.jump_f();
               return undefined;
            }
            if(_loc3_ > 325 && _loc3_ <= 400 && _loc5_ > 20 && _loc5_ <= 30 && _loc2_ < 0.18 * _level0.level && (_loc6_ < 100 && _loc7_ < 100 && _level0.cpu_op_mode !== "defend" || _loc6_ < 75 && _loc7_ < 75 && _level0.cpu_op_mode === "defend"))
            {
               owner.jump_f();
               return undefined;
            }
            if(_loc3_ > 250 && _loc3_ <= 325 && _loc5_ > 10 && _loc5_ <= 20 && _loc2_ < 0.18 * _level0.level && (_loc6_ < 100 && _loc7_ < 100 && _level0.cpu_op_mode !== "defend" || _loc6_ < 75 && _loc7_ < 75 && _level0.cpu_op_mode === "defend"))
            {
               owner.jump_f();
               return undefined;
            }
            if(_loc5_ == 0 && _loc2_ < 0.18 * _level0.level)
            {
               if(_loc3_ <= 25)
               {
                  owner.roll_f();
               }
               else if(_loc3_ <= 200)
               {
                  owner.roll_f();
               }
            }
            if(_loc5_ <= 12 && _loc3_ < 500 && _loc3_ >= 150 && _loc2_ < 0.18 * _level0.level)
            {
               if(_loc3_ < 350)
               {
                  owner.roll_f();
               }
               else if(_loc3_ > 350)
               {
                  owner.roll_b();
               }
            }
            if(_loc5_ > 25 && _loc5_ < 40 && _loc3_ >= 150 && _loc2_ < 0.18 * _level0.level)
            {
               if(_loc3_ <= 200 && this.getDis() > 450)
               {
                  owner.roll_f();
               }
            }
            if(_loc5_ > 40 && _loc5_ < 70 && _loc3_ >= 150 && _loc2_ < 0.18 * _level0.level)
            {
               if(_loc3_ <= 200)
               {
                  owner.roll_b();
               }
               else if(_loc3_ <= 350)
               {
                  owner.roll_f();
               }
            }
            if(_loc5_ > 70 && _loc3_ >= 150 && _loc2_ < 0.18 * _level0.level)
            {
               if(_loc3_ <= 250)
               {
                  owner.roll_b();
               }
               else if(_loc3_ >= 450)
               {
                  owner.roll_f();
               }
            }
            owner.move_hold();
            if(_loc5_ < 25 && _loc5_ > 12 && _loc3_ >= 150 && _loc2_ < 0.18 * _level0.level)
            {
               if(_loc3_ <= 200 && this.getDis() > 450)
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
