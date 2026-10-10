class Kim_AI extends Kim_role
{
   var Vdash;
   var Vjump_far;
   var Vjump_x;
   var Vjump_y;
   var Vwalk;
   var Vx;
   var Vy;
   var _currentframe;
   var _roleName;
   var _x;
   var _y;
   var actionType;
   var attack_rate;
   var attack_rate0;
   var attack_s;
   var autoToSkill;
   var burst;
   var burstCheck;
   var burst_mode;
   var catch_check;
   var checkSide_abs;
   var colorNormal;
   var comboClass;
   var combo_rate;
   var combo_rate0;
   var combo_risk;
   var control;
   var countEnd;
   var cpu_control2;
   var delay;
   var delayTimer;
   var delayTimer0;
   var delayTimer1;
   var dir;
   var dis;
   var dis_array;
   var dis_num;
   var farJump;
   var farJumpT;
   var farJumpT2;
   var gotoAndStop;
   var holdCount;
   var holdFreeze;
   var hold_rate;
   var hold_rate0;
   var inBurst;
   var inCount;
   var inFreeze;
   var isDoCancel;
   var jumpSkill;
   var land_Y;
   var life;
   var life_max;
   var mc;
   var noAct;
   var nobody;
   var normalList;
   var nosh;
   var objName;
   var onEgde;
   var onEnterFrame;
   var onHit;
   var opp;
   var oppHeight;
   var opp_hight;
   var opp_hight2;
   var ownerHeight;
   var pitch;
   var powerDec;
   var powerDec2;
   var powerDecType;
   var powerDecType2;
   var roleMode;
   var roll_b;
   var roll_f;
   var sk2;
   var sk2_h;
   var sk14;
   var sk14_h;
   var sk29;
   var skillSuperCheck;
   var skillToEqual;
   var skill_dis;
   var skill_last;
   var skill_list;
   var skill_mc;
   var skill_next;
   var skill_now;
   var statusClear;
   var status_1;
   var status_2;
   var status_3;
   var status_4;
   var status_5;
   var status_6;
   var status_7;
   var status_end;
   var superCancle;
   var superCheck;
   var superMaxList;
   var superPoint;
   var toSkill_temp;
   var toStatus;
   var toStatus_switch;
   var toStatus_temp;
   var wait_frame;
   var wait_frame0;
   var winTimes;
   var combDis = 1000;
   var combHeight = 0;
   var attack_s0 = 30;
   var combo_risk0 = 0;
   var wait_f = 0;
   var combo_1 = new Object();
   var combo_land = new Object();
   var combo_auto = new Object();
   var combo_alwaysAttack = new Object();
   var combo_burst = new Object();
   var combo_defend = new Object();
   var combo_power = new Object();
   var combo_super = new Object();
   var delay_frames = new Object();
   var delay_framesBurst = new Object();
   var combo_oppOnEgde = new Object();
   var action_1 = new Object();
   var delay_framesH = new Object();
   var delay_framesL = new Object();
   var comboDis = new Object();
   var comboHeightL = new Object();
   var comboHeightH = new Object();
   function Kim_AI()
   {
      super();
      this.toSkill_temp = this.toSkill;
      this.toStatus_temp = this.toStatus;
      this.toSkill = this.noAct;
      this.dis_array = new Array();
      this.skill_dis = new Array();
   }
   function getDis()
   {
      this.dis = Math.abs(this._x - this.opp._x);
      if(isNaN(this.dis))
      {
         this.dis = 60;
      }
      return this.dis;
   }
   function getOwnerHeight()
   {
      this.ownerHeight = Math.abs(this._y - this.land_Y);
      if(isNaN(this.ownerHeight))
      {
         this.ownerHeight = 0;
      }
      if(this._y < 0)
      {
         this.ownerHeight = this.land_Y;
      }
      if(this.status_2 != "air")
      {
         this.ownerHeight = 0;
      }
      return this.ownerHeight;
   }
   function getOppHeight()
   {
      this.oppHeight = Math.abs(this.opp._y - this.land_Y);
      if(isNaN(this.oppHeight))
      {
         this.oppHeight = 0;
      }
      if(this._y < 0)
      {
         this.oppHeight = this.land_Y;
      }
      if(this.opp.status_2 != "air")
      {
         this.oppHeight = 0;
      }
      return this.oppHeight;
   }
   function getdoComboCan()
   {
      if(_level0.inPause)
      {
         return undefined;
      }
      if(this.inFreeze || _level0.inFreeze || this.opp.inFreeze)
      {
         return undefined;
      }
      if(_level0.KO || this.opp.isKO)
      {
         delete this.mc.onEnterFrame;
      }
      var _loc2_ = 0;
      var _loc3_;
      if(this.inBurst && this.burst_mode == "attack")
      {
         _loc2_ = this.comboClass.combo2[this.status_1];
      }
      else
      {
         _loc2_ = this.comboClass.combo3[this.status_1];
      }
      _loc3_ = this.comboClass.skill_o[this.status_1];
      if(_loc2_ == undefined)
      {
         _loc2_ = this.comboClass.combo2[this.status_1];
      }
      if(this.mc._currentframe >= _loc2_ && _loc2_ != 0 && _loc3_ == undefined)
      {
         return true;
      }
      if(this.mc._currentframe >= _loc2_ && _loc2_ != 0 && _loc3_ != undefined && this.mc._currentframe <= _loc3_)
      {
         return true;
      }
      return false;
   }
   function initStrage()
   {
      this.initPlus();
      var _loc2_;
      _loc2_ = Math.random();
      if(_level0.moreVs3V3 != true && this.opp.winTimes > 0 || _level0.moreVs3V3 == true && (this.opp.winTimes == 1 && _loc2_ < 0.1 * _level0.stageID || this.opp.winTimes > 1))
      {
         this.actionType = "attack";
         this.cpu_control2 = this.cpu_attack;
      }
      else if(this.opp.inBurst && this.opp.burst_mode == "defend")
      {
         this.actionType = "defend";
         this.cpu_control2 = this.cpu_defend;
      }
      else if(this.inBurst && this.burst_mode == "defend" && this.life / this.opp.life > 3)
      {
         this.actionType = "attack";
         this.cpu_control2 = this.cpu_attack;
      }
      else if(this.opp.winTimes < this.winTimes)
      {
         _loc2_ = Math.random();
         if(_loc2_ < 0.33)
         {
            this.actionType = "wander";
            this.cpu_control2 = this.cpu_wander;
         }
         else if(_loc2_ < 0.66)
         {
            this.actionType = "attack";
            this.cpu_control2 = this.cpu_attack;
         }
         else
         {
            this.actionType = "normal";
            this.cpu_control2 = this.cpu_normal;
         }
      }
      else
      {
         _loc2_ = Math.random();
         if(_loc2_ < 0.66)
         {
            this.actionType = "attack";
            this.cpu_control2 = this.cpu_attack;
         }
         else
         {
            this.actionType = "normal";
            this.cpu_control2 = this.cpu_normal;
         }
      }
   }
   function initPlus()
   {
      this.combo_rate = this.combo_rate0;
      this.attack_rate = this.attack_rate0;
      this.attack_s = this.attack_s0;
      this.hold_rate = this.hold_rate0;
      this.wait_frame = this.wait_frame0;
      this.combo_risk = this.combo_risk0;
      if(_level0.cpu_op_mode == "attack")
      {
         this.combo_risk = this.combo_risk0 - 10;
         this.attack_rate += 20;
         this.combo_rate += 20;
         this.attack_s += 10;
         this.hold_rate -= 10;
      }
      else if(_level0.cpu_op_mode == "defend")
      {
         this.attack_rate -= 10;
         this.attack_s -= 10;
         this.hold_rate += 20;
         this.combo_risk = this.combo_risk0 + 5;
      }
      var _loc2_;
      var _loc3_;
      var _loc4_;
      if(_level0.player_type == "1PVSCOM")
      {
         _loc2_ = 0;
         _loc3_ = 0;
         _loc4_ = 0;
         if(_level0.moreVs3V3 != true)
         {
            _loc2_ = 5;
            _loc3_ = 5;
            _loc4_ = 3;
         }
         else
         {
            _loc2_ = 8;
            _loc3_ = 8;
            _loc4_ = 5;
         }
         this.combo_rate += 5 * _level0.stageID;
         this.attack_rate += _loc2_ * _level0.stageID;
         this.attack_s += _loc3_ * _level0.stageID;
         this.hold_rate += 3 * _level0.stageID;
         this.wait_frame -= 3 * _level0.stageID;
         this.combo_risk -= _loc4_ * _level0.stageID;
         if(this.wait_frame < 0)
         {
            this.wait_frame = 0;
         }
         if(this.combo_risk < 0)
         {
            this.combo_risk = 0;
         }
      }
   }
   function cpu_control()
   {
      clearInterval(this.delayTimer0);
      this.delayTimer0 = setInterval(this,"stand_check",27);
      if(_level0.level == 3)
      {
         clearInterval(this.delayTimer1);
         this.delayTimer1 = setInterval(this,"shoushen",500);
      }
      else if(_level0.level == 4)
      {
         clearInterval(this.delayTimer1);
         this.delayTimer1 = setInterval(this,"shoushen",250);
      }
      else if(_level0.level == 5)
      {
         clearInterval(this.delayTimer1);
         this.delayTimer1 = setInterval(this,"shoushen",125);
      }
      if(_level0.level == 5)
      {
         if(_level0.cpu_op_mode == "attack")
         {
            if(this.checkAction())
            {
               return true;
            }
            if(this.attack_start())
            {
               return true;
            }
            this.checkDefend();
         }
         else if(_level0.cpu_op_mode == "defend")
         {
            if(this.checkDefend())
            {
               return true;
            }
            if(this.attack_start())
            {
               return true;
            }
            this.checkAction();
         }
         else
         {
            if(this.checkDefend())
            {
               return true;
            }
            if(this.checkAction())
            {
               return true;
            }
            this.attack_start();
         }
      }
      else if(_level0.level == 4)
      {
         if(this.checkDefend())
         {
            return true;
         }
         if(this.checkAttack())
         {
            return true;
         }
         this.checkAction();
      }
      else
      {
         if(this.checkAttack())
         {
            return true;
         }
         if(this.checkAction())
         {
            return true;
         }
         this.checkDefend();
      }
      this.checkStrage();
      this.cpu_control2();
   }
   function attackCD()
   {
      if(this == _level0.P1_role && _level0.LP_P1.powerPoint_num == 0 && !this.inBurst || this == _level0.P2_role && _level0.LP_P2.powerPoint_num == 0 && !this.inBurst || this.getDis() > 250)
      {
         return false;
      }
      var _loc3_ = int(Math.random() * 100);
      var _loc2_ = int(Math.random() * 100);
      if(this.getDis() <= 175 && _loc3_ < 12 * _level0.level)
      {
         this.holdCount();
      }
      else if(this.getDis() < 150)
      {
         if(_loc2_ < 15 * _level0.level)
         {
            this.roll_f();
         }
         else if(this.onEgde)
         {
            this.roll_b();
         }
      }
   }
   function breakCatchAI()
   {
      var _loc2_ = Math.random();
      if((this.status_3 == "hurt" || this.status_3 == "" || this.opp.status2 == "down" || this.status_4 == "hold" || this.status_2 == "air" || this.opp.status_3 == "normal") && this.status_1 != "sk_CChun" && (this.status_1 != "sk1" && this.status_1 != "sk1_2" && this._roleName == "Kyo"))
      {
         this.delay = 0;
      }
      if((this.opp.status_1 == "pitch" || this.opp.status_1 == "pitch2") && this.opp.status_3 == "attack" && this.opp.status_6 == "catch" && (this.status_3 == "hurt" || this.status_3 == "") && _loc2_ <= 0.06 * _level0.level)
      {
         this.pitch();
      }
   }
   function cpu_normal()
   {
      this.initPlus();
      if(this.checkAttack())
      {
         return true;
      }
      this.checkWait();
   }
   function cpu_defend()
   {
      this.initPlus();
      this.hold_rate *= 1.3;
      this.attack_s *= 1.3;
      var _loc2_;
      if(this.opp.status_3 != "hurt" && this.opp.status_3 != "" && this.opp.status_4 != "hold")
      {
         _loc2_ = this.action_select("action_1","defend");
         if(this.checkDefend() != true)
         {
            this.toSkill(_loc2_);
         }
      }
      else
      {
         this.cpu_normal();
      }
   }
   function cpu_attack()
   {
      this.initPlus();
      this.attack_rate *= 1.3;
      this.combo_rate *= 1.3;
      if(this.checkAttack())
      {
         return true;
      }
      this.checkWait();
   }
   function cpu_wander()
   {
      this.initPlus();
      var _loc2_;
      if(this.opp.status_3 != "hurt" && this.opp.status_3 != "" && this.opp.status_4 != "hold")
      {
         this.action_1.wanderSpecial = [["roll_b","jump_b","dash_b"],["jump_b","walk_f"],["wait","dash_f"]];
         this.delay_frames.wanderSpecial = [150,400,1000];
         _loc2_ = this.action_select("action_1","wanderSpecial");
         if(_level0.level > 3 && _loc2_ == "walk_f")
         {
            _loc2_ = "dash_f";
         }
         else if(_level0.level < 4 && _loc2_ == "dash_f")
         {
            _loc2_ = "walk_f";
         }
         if(this.checkDefend() != true && !(_level0.level == 5 && _loc2_ == "wait"))
         {
            this.toSkill(_loc2_);
         }
      }
      else
      {
         this.cpu_normal();
      }
   }
   function checkStrage()
   {
      var _loc2_ = Math.random();
      var _loc3_ = _level0.life_power_mc.time_mc.time_txt.text;
      if(this.opp.inBurst && this.opp.burst_mode == "defend")
      {
         this.actionType = "defend";
         this.cpu_control2 = this.cpu_defend;
      }
      if(this.inBurst && this.burst_mode == "defend" && this.life / this.opp.life > 3)
      {
         this.actionType = "attack";
         this.cpu_control2 = this.cpu_attack;
      }
      else if(_loc3_ > 0 && _loc3_ < 20 && this.life < this.opp.life && _loc2_ < 0.7)
      {
         this.actionType = "attack";
         this.cpu_control2 = this.cpu_attack;
      }
      else if(_loc3_ > 0 && _loc3_ < 20 && this.life > this.opp.life)
      {
         this.actionType = "defend";
         this.cpu_control2 = this.cpu_defend;
      }
      else if(this.life < this.life_max / 4 && _loc2_ < 0.7)
      {
         this.actionType = "defend";
         this.cpu_control2 = this.cpu_defend;
      }
      else if(this.opp.life < this.opp.life_max / 4 && _loc2_ < 0.7)
      {
         this.actionType = "attack";
         this.cpu_control2 = this.cpu_attack;
      }
      else if(this.opp.life / this.life > 1.5 && _loc2_ < 0.7)
      {
         this.actionType = "attack";
         this.cpu_control2 = this.cpu_attack;
      }
      else if(this.life / this.opp.life > 2 && _loc2_ < 0.7)
      {
         this.actionType = "wander";
         this.cpu_control2 = this.cpu_wander;
      }
      else if(this.actionType != "normal")
      {
         this.initStrage();
      }
      else
      {
         this.actionType = "normal";
         this.cpu_control2 = this.cpu_normal;
      }
   }
   function behindAttack()
   {
      var _loc2_;
      if(this.delay > 0)
      {
         this.waitStand();
         return undefined;
      }
      if((this.opp.status_3 == "hurt" || this.opp.status_3 == "") && this.opp.status_2 == "land")
      {
         _loc2_ = this.action_select("action_1","oppLandHurt");
      }
      if((this.opp.status_3 == "hurt" || this.opp.status_3 == "") && this.opp.status_2 == "air")
      {
         _loc2_ = this.action_select("action_1","airAttack");
      }
      else if(this.opp.status_2 == "air" && this.getOppHeight() > 125 && (this.opp.status_3 != "hurt" && this.opp.status_3 != "") && _level0.level < 5 && (this.opp.status_3 != "hurt" && this.opp.status_3 != ""))
      {
         _loc2_ = this.action_select("action_1","oppJump");
      }
      else if((this.opp.status_2 == "land" || this.opp.status_2 == "toLand") && this.opp.status_4 != "hold" && _level0.level >= 3 && (this.opp.status_3 != "hurt" && this.opp.status_3 != ""))
      {
         _loc2_ = this.action_select("action_1","oppLand");
      }
      else if(_loc2_ == undefined || this.opp.status_3 != "hurt" && this.opp.status_3 != "")
      {
         _loc2_ = this.skill_select();
      }
      this.toSkill(_loc2_);
   }
   function check_yingzi()
   {
      var _loc2_;
      if(this.getDis() > 100 && this.getDis() < 350)
      {
         _loc2_ = "roll_f";
      }
      else
      {
         _loc2_ = this.checkCatchSkill();
      }
      this.toSkill(_loc2_);
   }
   function check_jingling()
   {
      var _loc2_;
      if(this.getDis() < 100 && (this.opp.status_2 == "land" || this.opp.status_2 == "toLand"))
      {
         _loc2_ = "pitch";
      }
      else if((this.opp.mc.hitPos == "up" || this.opp.status_2 == "air") && this.status_1 != "hold_u" && this.status_1 != "hold_d")
      {
         _loc2_ = "hold_u";
      }
      else if((this.opp.mc.hitPos == "up" || this.opp.status_2 == "air") && this.status_1 == "hold_d")
      {
         _loc2_ = "hold_u";
      }
      else if((this.opp.status_1.indexOf("squat") > -1 || this.opp.mc.hitPos == "down") && this.status_1 != "hold_u" && this.status_1 != "hold_d")
      {
         _loc2_ = "hold_d";
      }
      else if((this.opp.status_1.indexOf("squat") > -1 || this.opp.mc.hitPos == "down") && this.status_1 == "hold_u")
      {
         _loc2_ = "hold_d";
      }
      this.toSkill(_loc2_);
   }
   function checkAction()
   {
      if(_level0.inPause)
      {
         return undefined;
      }
      if(this.inFreeze || _level0.inFreeze || this.opp.inFreeze)
      {
         return undefined;
      }
      if(_level0.KO || this.opp.isKO)
      {
         return undefined;
      }
      if(this.status_2 != "land")
      {
         return undefined;
      }
      if(this.status_3 != "normal")
      {
         return undefined;
      }
      if(this.status_4 != "normal")
      {
         return undefined;
      }
      if(this.delay > 0)
      {
         this.waitStand();
         return true;
      }
      if(this.holdEndFreeze() == false)
      {
         return undefined;
      }
      if(this.holdFreeze)
      {
         return undefined;
      }
      var _loc2_;
      if(_level0.level >= 3)
      {
         if(this.combo_check2() && (this.combo_auto[this.skill_now] == undefined && this.combo_1[this.skill_now] == undefined))
         {
            return true;
         }
         if(this.check_special_defend())
         {
            return true;
         }
      }
      this.getDis();
      var _loc3_ = int(Math.random() * 100);
      if(this.opp._roleName == "Zero" && this.opp.status_8 == "jingling")
      {
         this.check_jingling();
         return true;
      }
      var _loc5_;
      if(this.opp.status_2 == "air" && (this.opp.status_3 == "hurt" || this.opp.status_3 == "") && !this.opp.nosh && this.opp.status_6 != "all" && _loc3_ <= this.combo_rate && _level0.level >= 3)
      {
         if(this.inBurst && this.burst_mode == "power")
         {
            _loc5_ = this.action_select("action_1","airAttackPower");
         }
         if(_loc5_ != undefined)
         {
            _loc2_ = _loc5_;
         }
         else
         {
            _loc2_ = this.action_select("action_1","airAttack");
         }
         if(_loc2_ != undefined)
         {
            this.toSkill(_loc2_);
            return true;
         }
      }
      else if((this.opp.status_2 == "land" || this.opp.status_2 == "toLand") && (this.opp.status_3 == "hurt" || this.opp.status_3 == "") && _level0.level >= 3 && (this.status_1 == "stand" || this.status_1 == "ready") && _loc3_ <= this.combo_rate)
      {
         _loc2_ = this.action_select("action_1","oppLandHurt");
         if(_loc2_ != undefined)
         {
            this.toSkill(_loc2_);
            return true;
         }
      }
      if((this.opp.status_2 == "land" || this.opp.status_2 == "toLand") && this.opp.status_4 != "hold" && _level0.level >= 3 && this.catch_check() && (this.opp.status_3 != "hurt" && this.opp.status_3 != "") && _loc3_ <= 20 * _level0.level)
      {
         _loc2_ = this.checkCatchSkill();
         if(_loc2_ != undefined)
         {
            this.toSkill(_loc2_);
            return true;
         }
      }
      else if(this.opp.status_3 == "down" && !_level0.KO && this.opp.mc._currentframe <= 4 && _level0.level >= 3 && this.inBurst && this.burst_mode == "power" && _loc3_ <= this.combo_rate)
      {
         if(this.checkBurst())
         {
            return true;
         }
         _loc2_ = this.action_select("action_1","downMovePower");
         if(_loc2_ != undefined)
         {
            this.toSkill(_loc2_);
            return true;
         }
      }
      else if(this.opp.status_3 == "down" && !_level0.KO && this.opp.mc._currentframe > 4 && this.opp.mc._currentframe <= 14 && _loc3_ <= this.combo_rate && _level0.level >= 3 && this.inBurst && this.burst_mode == "power")
      {
         _loc2_ = this.action_select("action_1","downPower");
         if(_loc2_ != undefined)
         {
            this.toSkill(_loc2_);
            return true;
         }
      }
      else if(this.opp.status_3 == "down" && !_level0.KO && this.opp.mc._currentframe <= 4 && _level0.level >= 3 && _loc3_ <= this.combo_rate)
      {
         if(this.checkBurst())
         {
            return true;
         }
         _loc2_ = this.action_select("action_1","downMove");
         if(_loc2_ != undefined)
         {
            this.toSkill(_loc2_);
            return true;
         }
      }
      else if(this.opp.status_3 == "down" && !_level0.KO && this.opp.mc._currentframe > 4 && this.opp.mc._currentframe <= 14 && _loc3_ <= this.combo_rate && _level0.level >= 3 && _level0.cpu_op_mode != "defend")
      {
         _loc2_ = this.action_select("action_1","down");
         if(_loc2_ != undefined)
         {
            this.toSkill(_loc2_);
            return true;
         }
      }
      else if(this.onEgde && _loc3_ <= this.hold_rate && !(this.opp.status_2 == "air" && (this.opp.status_3 == "hurt" || this.opp.status_3 == "") && !this.opp.nosh && this.opp.status_6 != "all" && _level0.level < 4))
      {
         this.action_1.onEgdeAll = [["hold_u","roll_f"],["hold_u","walk_b"],["hold_u","jump_f","dash_f","roll_f","roll_b"],["hold_u","jump_b","roll_f","roll_b"]];
         this.delay_frames.onEgdeAll = [100,200,250,300];
         _loc2_ = this.action_select("action_1","onEgdeAll");
         if(_loc2_ != undefined)
         {
            this.toSkill(_loc2_);
            return true;
         }
      }
      if(_loc3_ > this.attack_rate)
      {
         return undefined;
      }
      var _loc4_;
      if((this.opp.status_3 == "down" || this.opp.status_3 == "") && !_level0.KO && this.opp.mc._currentframe > 14 && _level0.level > 3 && _level0.cpu_op_mode != "defend")
      {
         if(this.checkBurst())
         {
            return true;
         }
         if(_level0.cpu_op_mode != "attack")
         {
            _loc2_ = this.action_select("action_1","getup");
         }
         else if(this.opp.status_3 == "" || this.opp.mc._currentframe > 18)
         {
            _loc2_ = this.action_select("action_1","pos_down");
         }
         else
         {
            _loc2_ = "dash_b";
         }
         if(_loc2_ != undefined)
         {
            this.toSkill(_loc2_);
            return true;
         }
      }
      else if(this.getDis() > 250 && (this.getDis() <= 450 || this.getDis() >= 480))
      {
         if(this.checkBurst())
         {
            return true;
         }
      }
      else if(this.opp.status_2 == "air" && (this.opp.status_3 != "hurt" && this.opp.status_3 != "") && _level0.level > 3 && _loc3_ < _level0.level * 20)
      {
         if(this.getDis() < 100 && _loc3_ < 13 * _level0.level && this.opp.status_1 != "jump_b" && this.onEgde)
         {
            _loc2_ = "roll_f";
         }
         else
         {
            _loc4_ = Math.random();
            if(this.getOppHeight() > 125)
            {
               _loc2_ = this.action_select("action_1","oppJump");
            }
            else if(this.getOppHeight() > 100 && _loc4_ > 0.5 && _level0.cpu_op_mode != "defend")
            {
               _loc2_ = this.action_select("action_1","oppJump" && _level0.cpu_op_mode != "defend");
            }
            else if(this.getOppHeight() > 75 && _loc4_ > 0.8 && _level0.cpu_op_mode != "defend")
            {
               _loc2_ = this.action_select("action_1","oppJump");
            }
            else if(this.getOppHeight() > 50 && _loc4_ > 0.95 && _level0.cpu_op_mode != "defend")
            {
               _loc2_ = this.action_select("action_1","oppJump");
            }
         }
      }
      else if(this.opp.status_3 == "roll" && this.opp.status_6 == "normal" && _level0.level >= 3 && _loc3_ < _level0.level * 20)
      {
         _loc2_ = this.action_select("action_1","oppRoll");
         if(_loc2_ != undefined)
         {
            this.toSkill(_loc2_);
            return true;
         }
      }
      else if(this.opp.status_1 == "roll_ab" && this.opp.status_6 == "all" && _level0.level >= 3 && _loc3_ < _level0.level * 18)
      {
         if(_level0.cpu_op_mode == "defend" && this.getDis() < 200)
         {
            _loc2_ = "dash_b";
         }
         else
         {
            _loc2_ = this.action_select("action_1","oppRollDown");
         }
         if(_loc2_ != undefined)
         {
            this.toSkill(_loc2_);
            return true;
         }
      }
      else if(this.opp.onEgde && (this.opp.status_3 != "hurt" && this.opp.status_3 != "" || this.opp.status_6 != "all") && _level0.level < 4)
      {
         this.action_1.onOppEgdeAll = [["walk_b","dash_b"],["jump","jump_f"],["jump_f"]];
         this.delay_frames.onOppEgdeAll = [100,200,300];
         _loc2_ = this.action_select("action_1","onOppEgdeAll");
         if(_loc2_ != undefined)
         {
            this.toSkill(_loc2_);
            return true;
         }
      }
      else if((this.opp.status_2 == "land" || this.opp.status_2 == "toLand") && this.opp.status_4 != "hold" && _level0.level >= 3 && (this.opp.status_3 != "hurt" && this.opp.status_3 != ""))
      {
         if(!(_level0.cpu_op_mode == "defend" && this.opp.status_3 == "attack"))
         {
            _loc2_ = this.action_select("action_1","oppLand");
         }
         if(_loc2_ != undefined)
         {
            this.toSkill(_loc2_);
            return true;
         }
      }
      else if((this.opp.status_1 == "hold_u" || this.opp.status_1.indexOf("walk") > -1) && _level0.level > 3)
      {
         if(this.getDis() < 100 && _loc3_ < _level0.level * 5 && this.catch_check())
         {
            _loc2_ = "pitch";
            this.toSkill(_loc2_);
            return true;
         }
         _loc2_ = this.action_select("action_1","pos_down");
         if(_loc2_ == "pitch")
         {
            _loc2_ = "squatKick_l";
         }
         if(_loc2_ != undefined)
         {
            this.toSkill(_loc2_);
            return true;
         }
      }
      else if((this.opp.status_1 == "hold_d" || this.opp.status_1.indexOf("squat") > -1) && _level0.level > 3)
      {
         if(this.getDis() < 100 && _loc3_ < _level0.level * 5 && this.catch_check())
         {
            _loc2_ = "pitch";
            this.toSkill(_loc2_);
            return true;
         }
         _loc2_ = this.action_select("action_1","pos_up");
         if(_loc2_ == "pitch")
         {
            _loc2_ = "jump";
         }
         if(_loc2_ != undefined)
         {
            this.toSkill(_loc2_);
            return true;
         }
      }
   }
   function checkCatchSkill()
   {
      var _loc2_;
      var _loc3_ = int(Math.random() * 100);
      if(this.opp.hasObj() && this.getDis() <= 100)
      {
         _loc2_ = "pitch";
         return _loc2_;
      }
      _loc2_ = this.action_select("action_1","oppLandCatch");
      if(_loc2_ != undefined)
      {
         if(this.superCheck(_loc2_) == "notSuperSkill" && this.burstCheck(_loc2_) == "notBurstSkill")
         {
            if(_loc3_ <= 12 & _level0.level && _level0.cpu_op_mode != "defend" || _loc3_ <= 16 & _level0.level && _level0.cpu_op_mode == "defend")
            {
               if(_loc2_ == "pitch" || _loc2_ == "pitch2")
               {
                  if(_loc3_ <= _level0.level * 5 && this.catch_check() && _level0.cpu_op_mode != "defend" || _loc3_ <= _level0.level * 10 && this.catch_check() && _level0.cpu_op_mode == "defend")
                  {
                     _loc2_ = "pitch";
                  }
                  else
                  {
                     _loc2_ = this.action_select("action_1","oppLand");
                  }
               }
            }
            else
            {
               _loc2_ = this.action_select("action_1","oppLand");
            }
            return _loc2_;
         }
         if(this.superCheck(_loc2_) == false && this.burstCheck(_loc2_) == false)
         {
            _loc2_ = this.action_select("action_1","oppLand");
         }
         if(_loc2_ == "pitch" || _loc2_ == "pitch2")
         {
            if(_loc3_ <= _level0.level * 5 && this.catch_check() && _level0.cpu_op_mode != "defend" || _loc3_ <= _level0.level * 10 && this.catch_check() && _level0.cpu_op_mode == "defend")
            {
               _loc2_ = "pitch";
            }
            else
            {
               _loc2_ = this.action_select("action_1","oppLand");
            }
         }
         return _loc2_;
      }
      if(this.getDis() <= 100)
      {
         if(_loc3_ <= _level0.level * 5 && this.catch_check() && _level0.cpu_op_mode != "defend" || _loc3_ <= _level0.level * 10 && this.catch_check() && _level0.cpu_op_mode == "defend")
         {
            _loc2_ = "pitch";
         }
         else
         {
            _loc2_ = this.action_select("action_1","oppLand");
         }
         return _loc2_;
      }
   }
   function checkDefend()
   {
      var _loc2_ = int(Math.random() * 100);
      if(_loc2_ >= this.hold_rate)
      {
         return false;
      }
      if(this.status_2 != "land")
      {
         return false;
      }
      if(this.status_3 != "normal")
      {
         return false;
      }
      if(this.status_6 != "normal")
      {
         return false;
      }
      if(_level0.inPause)
      {
         return false;
      }
      if(this.inFreeze || _level0.inFreeze || this.opp.inFreeze)
      {
         return false;
      }
      if(_level0.KO || this.opp.isKO)
      {
         return false;
      }
      if(this.delay > 0)
      {
         this.waitStand();
         return true;
      }
      if(this.holdFreeze)
      {
         return false;
      }
      if(this.status_3 != "attack" && this.status_3 != "hurt" && this.status_3 != "" && this.status_2 == "land" && !(this.inFreeze || _level0.inFreeze || this.opp.inFreeze))
      {
         this.statusClear();
      }
      if(this.isNeedDefend() == "behindAttack")
      {
         this.behindAttack();
         return true;
      }
      if(this.isNeedDefend() == "checkActionObj")
      {
         this.attack_start();
         return true;
      }
      if(this.isNeedDefend() == "check_jingling")
      {
         this.checkAction();
         return true;
      }
      if(this.isNeedDefend() == "check_yingzi")
      {
         this.check_yingzi();
         return true;
      }
      if(this.isNeedDefend() == "check_special_defend")
      {
         this.check_special_defend();
         return true;
      }
      if(this.isNeedDefend())
      {
         this.defend_start();
         return true;
      }
      return false;
   }
   function isNeedDefend()
   {
      if(this.dir == this.opp.dir && this.getDis() <= 250 && this.opp.status_3 == "attack" && this.opp.status_2 == "air" && !this.opp.hit_over())
      {
         return true;
      }
      if(this.checkMustDefendSkill(this.opp.status_1))
      {
         return true;
      }
      if(this.dir == this.opp.dir && this.opp.status_5 != "hitDown" && this.opp.status_7 != "nohit")
      {
         return "behindAttack";
      }
      var _loc3_;
      var _loc4_;
      var _loc5_;
      var _loc2_;
      if(this.opp.hasObj())
      {
         _loc3_ = this.opp.getObjs();
         _loc4_ = this.opp.getObjDis();
         _loc5_ = this.opp.getObjNum();
         _loc2_ = 0;
         while(_loc2_ < _loc3_.length)
         {
            if(_loc3_[_loc2_]._x < this._x && this.dir > 0 || _loc3_[_loc2_]._x > this._x && this.dir < 0)
            {
               if(this.opp.hit_over())
               {
                  return "behindAttack";
               }
               return true;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      else
      {
         if(this.normalList.join().indexOf(this.opp.status_1) > -1 && this.getDis() >= 350)
         {
            return false;
         }
         if(this.opp.hit_over() && !this.opp.hasObj())
         {
            return false;
         }
         if(this.opp.status_8 == "jingling")
         {
            return "check_jingling";
         }
         if(this.opp.status_8 == "yingzi")
         {
            return "check_yingzi";
         }
         if(this.opp.status_6 != "normal" && this.opp.status_6 != "all" || this.opp.mc.hitPos == "all" || this.opp.mc.hitPos == "breakDefend")
         {
            return "check_special_defend";
         }
      }
      if(this.opp.status_3 == "hurt" || this.opp.status_3 == "")
      {
         return "behindAttack";
      }
      return true;
   }
   function checkAttack()
   {
      var _loc2_ = int(Math.random() * 100);
      if(_loc2_ >= this.attack_rate)
      {
         return false;
      }
      this.attack_start();
      return true;
   }
   function checkWait()
   {
      if(this.wait_frame == 0)
      {
         this.attack_start();
         return undefined;
      }
      this.wait_f = int(Math.random() * this.wait_frame);
      var owner = this;
      this.onEnterFrame = function()
      {
         if(_level0.inPause)
         {
            return undefined;
         }
         if(owner.inFreeze)
         {
            return undefined;
         }
         this.wait_f = this.wait_f - 1;
         if(this.wait_f < 0)
         {
            delete this.onEnterFrame;
            owner.attack_start();
            _level0.out("checkWait: 结束");
         }
      };
   }
   function checkBurst()
   {
      if(this.inBurst)
      {
         return undefined;
      }
      var _loc3_ = _level0.life_power_mc.time_mc.time_txt.text;
      if(_loc3_ < 15 && (this.opp.life / this.life > 3 || this.life / this.opp.life > 1.5) && this.winTimes == 0 && this.superPoint > 1)
      {
         return undefined;
      }
      if(_loc3_ < 15 && (this.opp.life / this.life > 3 || this.life / this.opp.life > 1.5) && this.winTimes < 2 && _level0.moreVs3V3 == true && this.superPoint > 1)
      {
         return undefined;
      }
      if(this.life < this.life_max / 4 && this.opp.life / this.life > 3 && this.opp.winTimes == 0 && this.winTimes == 0 && this.superPoint > 1)
      {
         return undefined;
      }
      if(this.life < this.life_max / 4 && this.opp.life / this.life > 3 && this.opp.winTimes < 2 && this.winTimes < 2 && _level0.moreVs3V3 == true && this.superPoint > 1)
      {
         return undefined;
      }
      if(this.opp.life < this.opp.life_max / 4 && this.life / this.opp.life > 1.5 && this.winTimes == 0 && this.superPoint > 1)
      {
         return undefined;
      }
      if(this.opp.life < this.opp.life_max / 4 && this.life / this.opp.life > 1.5 && this.winTimes < 2 && _level0.moreVs3V3 == true && this.superPoint > 1)
      {
         return undefined;
      }
      var _loc4_ = int(Math.random() * 100);
      var _loc2_;
      if(this.opp.inBurst && this.opp.burst_mode == "defend")
      {
         _loc2_ = "defend";
      }
      else if(_loc4_ < 15)
      {
         _loc2_ = "attack";
      }
      else if(_loc4_ < 75)
      {
         _loc2_ = "power";
      }
      else
      {
         _loc2_ = "defend";
      }
      if(this.burst(_loc2_))
      {
         return true;
      }
   }
   function skill_select()
   {
      this.skill_list = [];
      this.getDis();
      var _loc4_;
      if(this.skill_list.length == 0)
      {
         _loc4_ = 0;
         while(_loc4_ < this.dis_num)
         {
            if(this.dis < this.dis_array[_loc4_])
            {
               this.skill_list = this.skill_dis[_loc4_];
               break;
            }
            _loc4_ = _loc4_ + 1;
         }
      }
      var _loc9_ = this.skill_list.length;
      var _loc8_ = int(Math.random() * _loc9_);
      var _loc2_ = this.skill_list[_loc8_];
      var _loc7_;
      var _loc6_ = 0;
      var _loc3_;
      var _loc5_;
      do
      {
         _loc6_ = _loc6_ + 1;
         if((this.opp.status_2 == "land" || this.opp.status_2 == "toLand") && this.opp.status_4 != "hold" && (this.opp.status_3 != "hurt" && this.opp.status_3 != "") && _level0.cpu_op_mode == "attack")
         {
            _loc2_ = this.action_select("action_1","oppLand");
         }
         else if(this.opp.status_2 == "air" && !this.opp.hasObj() && (this.opp.status_3 != "hurt" && this.opp.status_3 != "") && _level0.cpu_op_mode == "attack")
         {
            _loc2_ = this.action_select("action_1","oppJump");
         }
         else if(this.opp.status_4 == "hold" && !this.opp.hasObj() && this.opp.status_1 == "hold_u" && _level0.cpu_op_mode == "attack")
         {
            _loc2_ = this.action_select("action_1","pos_down");
         }
         else if(this.opp.status_4 == "hold" && !this.opp.hasObj() && this.opp.status_1 == "hold_d" && _level0.cpu_op_mode == "attack")
         {
            _loc2_ = this.action_select("action_1","pos_up");
         }
         if((this.opp.status_3 == "hurt" || this.opp.status_3 == "") && _level0.cpu_op_mode == "attack")
         {
            _loc3_ = int(Math.random() * 100);
            if(this.opp.status_2 == "air" && (this.opp.status_3 == "hurt" || this.opp.status_3 == "") && !this.opp.nosh && this.opp.status_6 != "all" && _loc3_ <= this.combo_rate && _level0.level >= 3)
            {
               if(this.inBurst && this.burst_mode == "power")
               {
                  _loc5_ = this.action_select("action_1","airAttackPower");
               }
               if(_loc5_ != undefined)
               {
                  _loc2_ = _loc5_;
               }
               else
               {
                  _loc2_ = this.action_select("action_1","airAttack");
               }
            }
            else if(this.opp.status_3 == "down" && !_level0.KO && this.opp.mc._currentframe <= 4 && _level0.level >= 3 && this.inBurst && this.burst_mode == "power" && _loc3_ <= this.combo_rate)
            {
               _loc2_ = this.action_select("action_1","downMovePower");
            }
            else if(this.opp.status_3 == "down" && !_level0.KO && this.opp.mc._currentframe > 4 && this.opp.mc._currentframe <= 14 && _loc3_ <= this.combo_rate && _level0.level >= 3 && this.inBurst && this.burst_mode == "power")
            {
               _loc2_ = this.action_select("action_1","downPower");
            }
            else if(this.opp.status_3 == "down" && !_level0.KO && this.opp.mc._currentframe <= 4 && _level0.level >= 3 && _loc3_ <= this.combo_rate)
            {
               _loc2_ = this.action_select("action_1","downMove");
            }
            else if(this.opp.status_3 == "down" && !_level0.KO && this.opp.mc._currentframe > 4 && this.opp.mc._currentframe <= 14 && _loc4_ <= this.combo_rate && _level0.level >= 3 && _loc3_ <= this.combo_rate)
            {
               _loc2_ = this.action_select("action_1","down");
            }
            else if((this.opp.status_2 == "land" || this.opp.status_2 == "toLand") && (this.opp.status_3 == "hurt" || this.opp.status_3 == "") && _level0.level >= 3 && (this.status_1 == "stand" || this.status_1 == "ready") && _loc3_ <= this.combo_rate)
            {
               _loc2_ = this.action_select("action_1","oppLandHurt");
            }
         }
         if(_loc6_ > 5)
         {
            _loc2_ = "dash_f";
         }
         _loc7_ = this.superCheck(_loc2_) && this.burstCheck(_loc2_);
      }
      while(_loc7_ == false);
      if(_loc2_ == undefined)
      {
         _loc2_ = this.skill_list[_loc8_];
      }
      return _loc2_;
   }
   function action_select(object, member)
   {
      if(_level0.inPause)
      {
         return undefined;
      }
      if(this.inFreeze || _level0.inFreeze || this.opp.inFreeze)
      {
         return undefined;
      }
      if(_level0.KO || this.opp.isKO)
      {
         return undefined;
      }
      if(this.status_2 != "land")
      {
         return undefined;
      }
      if(this.status_3 != "normal")
      {
         return undefined;
      }
      if(this.status_4 != "normal")
      {
         return undefined;
      }
      if(this.delay > 0)
      {
         this.waitStand();
         return true;
      }
      if(this.holdEndFreeze() == false)
      {
         return undefined;
      }
      if(this.holdFreeze)
      {
         return undefined;
      }
      var _loc3_;
      var _loc9_;
      var _loc4_ = this[object][member];
      var _loc6_ = this.delay_frames[member];
      var _loc7_ = this.delay_framesH[member];
      var _loc8_ = this.delay_framesL[member];
      var _loc5_ = _loc4_.length;
      var _loc13_;
      var _loc12_ = 0;
      var _loc2_;
      var _loc11_;
      var _loc10_;
      do
      {
         _loc12_ = _loc12_ + 1;
         this.getDis();
         this.getOppHeight();
         if(_loc7_.length < 1 && _loc8_.length < 1)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc5_)
            {
               if(this.dis <= _loc6_[_loc2_])
               {
                  _loc3_ = _loc4_[_loc2_];
                  break;
               }
               _loc2_ = _loc2_ + 1;
            }
         }
         else if(_loc8_.length < 1 && _loc7_.length > 1)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc5_)
            {
               if(this.dis <= _loc6_[_loc2_] && this.oppHeight <= _loc7_[_loc2_])
               {
                  _loc3_ = _loc4_[_loc2_];
                  break;
               }
               _loc2_ = _loc2_ + 1;
            }
         }
         else if(_loc7_.length < 1 && _loc8_.length > 1)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc5_)
            {
               if(this.dis <= _loc6_[_loc2_] && this.oppHeight >= _loc8_[_loc2_])
               {
                  _loc3_ = _loc4_[_loc2_];
                  break;
               }
               _loc2_ = _loc2_ + 1;
            }
         }
         else
         {
            _loc2_ = 0;
            while(_loc2_ < _loc5_)
            {
               if(this.dis <= _loc6_[_loc2_] && this.oppHeight >= _loc8_[_loc2_] && this.oppHeight <= _loc7_[_loc2_])
               {
                  _loc3_ = _loc4_[_loc2_];
                  break;
               }
               _loc2_ = _loc2_ + 1;
            }
         }
         _loc11_ = _loc3_.length;
         _loc10_ = int(Math.random() * _loc11_);
         _loc9_ = _loc3_[_loc10_];
         if(_loc12_ > 5)
         {
            _loc9_ = "dash_f";
         }
         _loc13_ = this.superCheck(_loc9_) && this.burstCheck(_loc9_);
      }
      while(_loc13_ == false);
      return _loc9_;
   }
   function super_select()
   {
      var _loc4_ = int(Math.random() * 100);
      if(_loc4_ >= this.attack_s)
      {
         return false;
      }
      if(this.opp.freeze_frame() < 4)
      {
         return false;
      }
      var _loc3_ = this.action_select("action_1","super");
      var _loc2_ = this.superCheck(_loc3_);
      if(_loc2_ == false)
      {
         return false;
      }
      if(_loc2_ == "notSuperSkill")
      {
         return false;
      }
      return _loc3_;
   }
   function busrt_select()
   {
      if(this.inBurst != true)
      {
         return false;
      }
      var _loc3_ = int(Math.random() * 100);
      if(_loc3_ >= this.attack_s)
      {
         return false;
      }
      if(this.opp.freeze_frame() < 4)
      {
         return false;
      }
      var _loc2_ = this.action_select("action_1","busrt");
      if(_loc2_ == undefined)
      {
         return false;
      }
      return _loc2_;
   }
   function attack_start()
   {
      if(_level0.inPause)
      {
         return undefined;
      }
      if(this.inFreeze || _level0.inFreeze || this.opp.inFreeze)
      {
         return undefined;
      }
      if(_level0.KO || this.opp.isKO)
      {
         return undefined;
      }
      if(this.status_2 != "land")
      {
         return undefined;
      }
      if(this.status_3 != "normal")
      {
         return undefined;
      }
      if(this.status_4 != "normal")
      {
         return undefined;
      }
      if(this.delay > 0)
      {
         this.waitStand();
         return true;
      }
      if(this.holdEndFreeze() == false)
      {
         return undefined;
      }
      if(this.holdFreeze)
      {
         return undefined;
      }
      var _loc2_;
      var _loc3_ = Math.random();
      _loc2_ = this.super_select();
      if(_loc2_ == false)
      {
         _loc2_ = this.busrt_select();
      }
      if(_loc2_ == false)
      {
         _loc2_ = this.skill_select();
         this.toSkill(_loc2_);
      }
      this.opp.checkDefend();
      if(this.burst_mode != "attack")
      {
         if(this.inBurst)
         {
            this.inCount = false;
         }
      }
      if(_loc2_ == undefined)
      {
         trace("错误!技能未定义");
         this.attack_start();
      }
   }
   function defend_start()
   {
      var _loc2_;
      this.getDis();
      var _loc3_ = int(Math.random() * 100);
      if(_loc3_ < 50)
      {
         _loc2_ = "hold_u";
      }
      else
      {
         _loc2_ = "hold_d";
      }
      if(this.check_special_defend())
      {
         return undefined;
      }
      if(this.checkMustDefendSkill(this.opp.status_1))
      {
         this.toSkill(_loc2_);
         return undefined;
      }
      var _loc4_;
      var _loc8_;
      var _loc7_;
      var _loc9_;
      var _loc5_;
      var _loc6_;
      if(this.opp.status_3 == "roll" && this.opp.status_6 == "normal" && _loc3_ < this.attack_s)
      {
         _loc2_ = this.action_select("action_1","oppRoll");
      }
      else if(this.opp.status_1 == "walk_f" && _loc3_ < this.attack_s && _level0.level < 5)
      {
         _loc2_ = this.action_select("action_1","defend_f");
      }
      else if(this.opp.status_1 == "dash_f" && _loc3_ < this.attack_s && _level0.level < 5)
      {
         _loc2_ = this.action_select("action_1","defend_dashf");
      }
      else if(_loc3_ >= this.attack_s && (this.opp.mc.hitPos == "up" || this.opp.status_2 == "air") && this.status_1 != "hold_u" && this.status_1 != "hold_d")
      {
         _loc2_ = "hold_u";
      }
      else if((this.opp.mc.hitPos == "up" || this.opp.status_2 == "air") && this.status_1 == "hold_d" && _loc3_ < 18 * _level0.level)
      {
         _loc2_ = "hold_u";
      }
      else if(_loc3_ >= this.attack_s && (this.opp.status_1.indexOf("squat") > -1 || this.opp.mc.hitPos == "down") && this.status_1 != "hold_d" && this.status_1 != "hold_u")
      {
         _loc2_ = "hold_d";
      }
      else if((this.opp.status_1.indexOf("squat") > -1 || this.opp.mc.hitPos == "down") && this.status_1 == "hold_u" && _loc3_ < 18 * _level0.level)
      {
         _loc2_ = "hold_d";
      }
      else if(this.opp.status_2 == "air" && _loc3_ < this.attack_s && this.opp.status_3 == "attack" && _loc3_ < 18 * _level0.level)
      {
         if(this.getDis() < 100 && _loc3_ < 13 * _level0.level && this.opp.status_1 != "jump_b" && this.onEgde)
         {
            _loc2_ = "roll_f";
         }
         else if(this.getDis() < 200 && _loc3_ < 13 * _level0.level && this.opp.status_1 == "jump_f" && this.onEgde)
         {
            _loc2_ = "roll_f";
         }
         else
         {
            _loc4_ = Math.random();
            if(this.getOppHeight() > 200)
            {
               _loc2_ = this.action_select("action_1","oppJump");
            }
            else if(this.getOppHeight() > 150 && _loc4_ > 0.25)
            {
               _loc2_ = this.action_select("action_1","oppJump");
            }
            else if(this.getOppHeight() > 125 && _loc4_ > 0.5 && _level0.cpu_op_mode != "defend")
            {
               _loc2_ = this.action_select("action_1","oppJump");
            }
            else if(this.getOppHeight() > 100 && _loc4_ > 0.65 && _level0.cpu_op_mode != "defend")
            {
               _loc2_ = this.action_select("action_1","oppJump");
            }
            else if(this.getOppHeight() > 75 && _loc4_ > 0.85 && _level0.cpu_op_mode != "defend")
            {
               _loc2_ = this.action_select("action_1","oppJump");
            }
            else if(this.getOppHeight() > 50 && _loc4_ > 0.95 && _level0.cpu_op_mode != "defend")
            {
               _loc2_ = this.action_select("action_1","oppJump");
            }
         }
      }
      else if(this.getOppHeight() <= 150 && this.opp.status_3 == "attack" && this.opp.status_2 == "air" && this.getDis() < 200)
      {
         _loc2_ = "hold_u";
      }
      else if(_loc3_ < this.attack_s && this.opp.status_5 != "hitDown" && this.opp.status_7 != "nohit" && _level0.level >= 3 && (this.normalList.join().indexOf(this.opp.status_1) > -1 && this.getDis() < 200 || this.normalList.join().indexOf(this.opp.status_1) == -1) && !this.opp.hasObj() || this.opp.hasObj() && this.opp.getObjDis() > 150 && this.getDis() < 250)
      {
         if(!this.opp.hit_over() && !this.holdFreeze)
         {
            _loc8_ = this.action_select("action_1","defendAttackPower");
            _loc7_ = this.action_select("action_1","defendAttackPowerUp");
            _loc9_ = this.action_select("action_1","defendAttackPowerDown");
            if(this.opp.hasObj() && this.opp.getObjDis() < 250 && _loc3_ <= 18 * _level0.level)
            {
               _loc2_ == "hold_u";
            }
            else if(this.inBurst && this.burst_mode == "power" && _loc7_ != undefined && this.opp.mc.hitPos == "up")
            {
               _loc2_ = _loc7_;
               if(this.getDis() < 250 && (_loc3_ <= 2 * _level0.level || _level0.cpu_op_mode != "attack"))
               {
                  _loc2_ = this.action_select("action_1","pos_down");
               }
            }
            else if(this.inBurst && this.burst_mode == "power" && _loc9_ != undefined && this.opp.mc.hitPos == "down")
            {
               _loc2_ = _loc9_;
               if(this.getDis() < 250 && (_loc3_ <= 4 * _level0.level || _level0.cpu_op_mode != "attack"))
               {
                  _loc2_ = this.action_select("action_1","pos_up");
               }
            }
            else if(this.inBurst && this.burst_mode == "power" && _loc8_ != undefined)
            {
               _loc2_ = _loc8_;
            }
            else
            {
               _loc5_ = this.action_select("action_1","defendAttackUp");
               _loc6_ = this.action_select("action_1","defendAttackDown");
               if(this.opp.mc.hitPos == "up" && _loc5_ != undefined)
               {
                  _loc2_ = _loc5_;
                  if(this.getDis() < 250 && (_loc3_ <= 2 * _level0.level || _level0.cpu_op_mode != "attack"))
                  {
                     _loc2_ = this.action_select("action_1","pos_down");
                  }
               }
               else if(this.opp.mc.hitPos == "down" && _loc6_ != undefined)
               {
                  _loc2_ = _loc6_;
                  if(this.getDis() < 250 && (_loc3_ <= 4 * _level0.level || _level0.cpu_op_mode != "attack"))
                  {
                     _loc2_ = this.action_select("action_1","pos_up");
                  }
               }
               else if(!(this.normalList.join().indexOf(this.opp.status_1) > -1 && _level0.cpu_op_mode == "defend"))
               {
                  _loc2_ = this.action_select("action_1","defendAttack");
               }
            }
         }
         else if(this.opp.hit_over() && !this.holdFreeze && _level0.cpu_op_mode == "attack")
         {
            _loc2_ = this.action_select("action_1","oppLand");
         }
      }
      else if(this.normalList.join().indexOf(this.opp.status_1) > -1 && this.getDis() >= 200 && (_loc3_ < this.attack_s && !this.opp.hasObj() || _level0.cpu_op_mode == "attack"))
      {
         if(this.opp.mc.hitPos == "up")
         {
            _loc2_ = this.action_select("action_1","pos_down");
         }
         else if(this.opp.mc.hitPos == "down")
         {
            _loc2_ = this.action_select("action_1","pos_up");
         }
      }
      else if(this.opp.status_6 == "normal" || _loc2_ == undefined)
      {
         if(this.getDis() < 100 && _loc3_ < 0.5 && _level0.level == 5)
         {
            _loc2_ = "hold_u";
         }
         else if(this.getDis() < 100 && _loc3_ > 0.5 && _level0.level == 5)
         {
            _loc2_ = "hold_d";
         }
         else
         {
            _loc2_ = this.action_select("action_1","defend_h");
         }
      }
      if(this.onEgde && (_loc2_ == "roll_f" || _loc2_ == "roll_b") && this.getDis() > 250)
      {
         _loc2_ == "hold_u";
      }
      if(this.holdFreeze && _loc2_ != "hold_u" && _loc2_ != "hold_d")
      {
         return undefined;
      }
      this.toSkill(_loc2_);
   }
   function checkMustDefendSkill(oppSkill)
   {
      var _loc3_ = new Object();
      var _loc5_ = new Object();
      _loc3_.Kyo = ["sk31_s"];
      _loc3_.Iori = ["sk_s_89b_s"];
      _loc3_.Kula = ["sk_s_xingchen","sk_s_jiejie"];
      _loc3_.Zero = ["dfdf_k","dfdf_k_max"];
      _loc3_.CZero = ["dfdf_k","dfdf_k_max","db_o"];
      _loc3_.Orochi = ["sk_s_yangguang","sk_s_yangguang_s","sk_s_guangzhu_s"];
      _loc3_.Mizuchi = ["sk_s_zhuanpan","sk_s_zhuanpan_s","sk_s_zhuanpan2_s","sk_s_zhuanpan2","sk_s_sanhua","sk_s_jiguang"];
      _loc3_.Ash = ["bf_A_2","bf_A","dd_o_2","dbdf_P_2"];
      _loc5_.Ash = [400,400,1000,1000];
      _loc3_.Igniz = ["df_o","sk_dfdfk_ex_max","sk_dfo_ex"];
      _loc3_.Goenitz = ["sk_s_qianzai2","sk_s_qianzai1"];
      _loc3_.Ryo = ["sk_s_sys","sk_dfdb_k_max"];
      _loc3_.Krizalid = ["df_o","dbdf_p"];
      _loc5_.Krizalid = [1000,250];
      _loc3_.Nameless = ["df_o","dfdf_k"];
      _loc5_.Nameless = [1000,1000];
      _loc3_.Ryu = ["sk_s_q1"];
      _loc3_.CKrizalid = ["df_ph","df_pl"];
      var _loc4_ = _loc3_[this.opp._roleName].trim();
      var _loc2_ = _loc5_[this.opp._roleName].trim();
      for(var _loc6_ in _loc4_)
      {
         if(oppSkill.trim() == _loc4_[_loc6_] && !this.opp.hit_over())
         {
            if(_loc2_ == undefined || isNaN(_loc2_))
            {
               return true;
            }
            if(this.getDis() <= _loc2_[_loc6_])
            {
               return true;
            }
            return false;
         }
         return false;
         break;
      }
      return false;
   }
   function actionDefend(action)
   {
      if(this.status_2 != "land")
      {
         return undefined;
      }
      if(this.status_3 != "normal")
      {
         return undefined;
      }
      if(this.status_4 != "normal")
      {
         return undefined;
      }
      var _loc2_ = int(Math.random() * 100);
      if(_loc2_ > this.attack_s)
      {
         return false;
      }
   }
   function combo_wait(status_1)
   {
      var role_mc = this;
      var _loc3_ = this.mc;
      var start_frame;
      var end_frame;
      if(!(this.inBurst && this.burst_mode == "attack"))
      {
         start_frame = this.comboClass.combo3[status_1];
      }
      if(start_frame == undefined)
      {
         start_frame = this.comboClass.combo2[status_1];
      }
      end_frame = this.comboClass.skill_o[status_1];
      if(start_frame == undefined)
      {
         return undefined;
      }
      _loc3_.onEnterFrame = function()
      {
         if(_level0.inPause)
         {
            return undefined;
         }
         if(role_mc.inFreeze)
         {
            return undefined;
         }
         if(this._currentframe >= start_frame && end_frame == undefined)
         {
            delete this.onEnterFrame;
            if(_level0.level >= 3)
            {
               role_mc.combo_check();
            }
         }
         else if(this._currentframe >= start_frame && end_frame != undefined && this._currentframe <= end_frame)
         {
            delete this.onEnterFrame;
            if(_level0.level >= 3)
            {
               role_mc.combo_check();
            }
         }
      };
   }
   function combo_check()
   {
      if(this.combo_auto[this.skill_now] != undefined)
      {
         this.combo_select("combo_auto");
         this.combo_start();
         return true;
      }
      var _loc2_ = int(Math.random() * 100);
      if(this.onHit != true && this.opp.status_2 == "air" && (this.opp.status_3 == "hurt" || this.opp.status_3 == ""))
      {
         return false;
      }
      if(this.onHit != true && _level0.cpu_op_mode == "defend")
      {
         return false;
      }
      if(_loc2_ <= this.combo_rate && _loc2_ >= this.combo_risk)
      {
         if(_level0.level == 5 && (this.opp.status_3 == "hurt" || this.opp.status_3 == ""))
         {
            this.combo_select("combo_1");
            this.combo_start();
         }
         else if(_level0.level < 5)
         {
            this.combo_select("combo_1");
            this.combo_start();
         }
         return true;
      }
   }
   function combo_check2()
   {
      var _loc2_ = int(Math.random() * 100);
      if(this.opp.status_3 != "hurt" && this.opp.status_3 != "")
      {
         return false;
      }
      if(this.opp.status_3 == "hurt" && this.opp.status_3 == "" && this.opp.status_2 != "air" && this.status_1 == "jumpSkill_heavyHit" && _level0.cpu_op_mode != "attack")
      {
         return false;
      }
      if(_loc2_ >= this.combo_rate)
      {
         return false;
      }
      this.combo_select("combo_land");
      if(this.superCheck(this.skill_next) == false)
      {
         return false;
      }
      if(this.skill_next != undefined)
      {
         this.combo_start();
         if(this.inBurst && this.burst_mode == "attack")
         {
         }
         return true;
      }
   }
   function combo_select(combo)
   {
      var _loc5_;
      var _loc3_;
      var _loc13_;
      var _loc4_ = false;
      if(this.inBurst && this.burst_mode == "attack")
      {
         _loc5_ = this.combo_burst[this.skill_now];
         if(_loc5_ != undefined)
         {
            _loc13_ = true;
         }
      }
      if(this.inBurst && this.burst_mode == "power")
      {
         _loc5_ = this.combo_power[this.skill_now];
      }
      if(this.inBurst && this.burst_mode == "defend")
      {
         _loc5_ = this.combo_defend[this.skill_now];
      }
      if(!this.inBurst && (this == _level0.P1_role && _level0.LP_P1.powerPoint_num > 0 && !this.inBurst || this == _level0.P2_role && _level0.LP_P2.powerPoint_num > 0 && !this.inBurst))
      {
         _loc5_ = this.combo_super[this.skill_now];
      }
      if(_loc5_ == undefined)
      {
         _loc5_ = this[combo][this.skill_now];
      }
      var _loc11_ = this.comboDis[this.skill_now].length;
      var _loc8_ = this.comboHeightL[this.skill_now].length;
      var _loc7_ = this.comboHeightH[this.skill_now].length;
      var _loc12_ = _loc5_.length;
      var _loc2_;
      var _loc9_;
      var _loc10_;
      var _loc6_;
      if(_loc11_ > 0)
      {
         _loc2_ = 0;
         while(_loc2_ < _loc11_)
         {
            _loc9_ = 0;
            do
            {
               _loc9_ = _loc9_ + 1;
               _loc3_ = this.combo_oppOnEgde[this.skill_now][_loc2_];
               if(_loc3_ == true && this.opp.onEgde != true || _loc3_ == false && this.opp.onEgde == true || _loc3_ == undefined)
               {
                  _loc4_ = true;
               }
            }
            while(_loc4_ == false && _loc9_ <= _level0.level);
            if(_loc4_ != false)
            {
               if(_loc8_ < 1 && _loc7_ < 1)
               {
                  if(this.getDis() <= this.comboDis[this.skill_now][_loc2_])
                  {
                     this.skill_next = _loc5_[_loc2_];
                     if(this.inBurst && this.burst_mode == "attack")
                     {
                        this.delay = this.delay_framesBurst[this.skill_now][_loc2_];
                     }
                     if(this.delay == undefined || !(this.inBurst && this.burst_mode == "attack"))
                     {
                        this.delay = this.delay_frames[this.skill_now][_loc2_];
                     }
                     break;
                  }
               }
               else if(_loc8_ < 1 && _loc7_ > 0)
               {
                  if(this.getDis() <= this.comboDis[this.skill_now][_loc2_] && this.getOppHeight() <= this.comboHeightH[this.skill_now][_loc2_])
                  {
                     this.skill_next = _loc5_[_loc2_];
                     if(this.inBurst && this.burst_mode == "attack")
                     {
                        this.delay = this.delay_framesBurst[this.skill_now][_loc2_];
                     }
                     if(this.delay == undefined || !(this.inBurst && this.burst_mode == "attack"))
                     {
                        this.delay = this.delay_frames[this.skill_now][_loc2_];
                     }
                     break;
                  }
               }
               else if(_loc7_ < 1 && _loc8_ > 0)
               {
                  if(this.getDis() <= this.comboDis[this.skill_now][_loc2_] && this.getOppHeight() >= this.comboHeightL[this.skill_now][_loc2_])
                  {
                     this.skill_next = _loc5_[_loc2_];
                     if(this.inBurst && this.burst_mode == "attack")
                     {
                        this.delay = this.delay_framesBurst[this.skill_now][_loc2_];
                     }
                     if(this.delay == undefined || !(this.inBurst && this.burst_mode == "attack"))
                     {
                        this.delay = this.delay_frames[this.skill_now][_loc2_];
                     }
                     break;
                  }
               }
               else if(this.getDis() <= this.comboDis[this.skill_now][_loc2_] && this.getOppHeight() >= this.comboHeightL[this.skill_now][_loc2_] && this.getOppHeight() <= this.comboHeightH[this.skill_now][_loc2_])
               {
                  this.skill_next = _loc5_[_loc2_];
                  if(this.inBurst && this.burst_mode == "attack")
                  {
                     this.delay = this.delay_framesBurst[this.skill_now][_loc2_];
                  }
                  if(this.delay == undefined || !(this.inBurst && this.burst_mode == "attack"))
                  {
                     this.delay = this.delay_frames[this.skill_now][_loc2_];
                  }
                  break;
               }
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      else
      {
         _loc9_ = 0;
         _loc10_ = int(Math.random() * _loc12_);
         do
         {
            _loc9_ = _loc9_ + 1;
            _loc6_ = int(Math.random() * _loc12_);
            _loc3_ = this.combo_oppOnEgde[this.skill_now][_loc6_];
            if(_loc3_ == true && this.opp.onEgde != true || _loc3_ == false && this.opp.onEgde == true || _loc3_ == undefined)
            {
               _loc4_ = true;
               _loc10_ = _loc6_;
            }
         }
         while(_loc4_ == false && _loc9_ <= _level0.level);
         if(_loc4_ == true)
         {
            this.skill_next = _loc5_[_loc10_];
            if(this.inBurst && this.burst_mode == "attack")
            {
               this.delay = this.delay_framesBurst[this.skill_now][_loc10_];
            }
            if(this.delay == undefined || !(this.inBurst && this.burst_mode == "attack"))
            {
               this.delay = this.delay_frames[this.skill_now][_loc10_];
            }
         }
      }
      if(this.skill_next == undefined)
      {
         _loc4_ = false;
      }
      else
      {
         _loc4_ = true;
      }
      if(_loc4_ == true)
      {
         if(_loc13_ == true)
         {
            this.isDoCancel = true;
         }
      }
      else if(_loc4_ == false)
      {
         this.delay = 0;
         this.skill_next = undefined;
         if(_loc13_ == true)
         {
            this.isDoCancel = false;
         }
      }
      if(this.delay == undefined)
      {
         this.delay = 0;
      }
   }
   function combo_start()
   {
      if(this.skill_next == undefined)
      {
         this.delay = 0;
         return undefined;
      }
      if(this.delay <= 0)
      {
         this.toSkill(this.skill_next,true);
      }
      else
      {
         this.combo_delay();
      }
   }
   function combo_delay()
   {
      var owner = this;
      var skill = this.skill_next;
      this.onEnterFrame = function()
      {
         if(_level0.inPause)
         {
            return undefined;
         }
         if(this.inFreeze)
         {
            return undefined;
         }
         this.delay = this.delay - 1;
         if(!(this.mc._currentframe <= this.mc._totalframes && owner.status_1 != "stand"))
         {
            if(owner.status_2 != "air")
            {
               this.waitStand();
            }
         }
         if(this.delay <= 0)
         {
            delete this.onEnterFrame;
            owner.toSkill(skill,true);
         }
      };
   }
   function start_control()
   {
      this.control = true;
      this.initStrage();
      this.toSkill = this.toSkill_temp;
      this.toStatus = this.toStatus_temp;
      this.toStatus_switch("stand");
   }
   function toSkill(_action, cancle)
   {
      if(_level0.KO)
      {
         this.stand();
         return undefined;
      }
      var _loc2_ = _action;
      var _loc5_ = Math.random();
      if((this.opp.status_1 == "pitch" || this.opp.status_1 == "pitch2") && _loc2_ != "pitch" && _loc2_ != "pitch2")
      {
         return undefined;
      }
      if(_loc2_ == "pitch" || _loc2_ == "pitch2")
      {
         if(this.opp.status_3 == "hurt" || this.opp.status_3 == "" || this.catch_check() != true)
         {
            _loc2_ = "squatKick_l";
         }
         else if(this.onEgde)
         {
            _loc2_ = "pitch2";
         }
         else if(this.opp.onEgde)
         {
            _loc2_ = "pitch";
         }
         else if(_loc5_ <= 0.5)
         {
            _loc2_ = "pitch2";
         }
         else
         {
            _loc2_ = "pitch";
         }
      }
      if(_level0.inPause)
      {
         return undefined;
      }
      if(this.inFreeze || _level0.inFreeze || this.opp.inFreeze)
      {
         return undefined;
      }
      if(_level0.KO || this.opp.isKO)
      {
         return undefined;
      }
      if(this.holdFreeze)
      {
         return undefined;
      }
      if(_loc2_ == "hold_u")
      {
         this.hold_u();
         return undefined;
      }
      if(_loc2_ == "hold_d")
      {
         this.hold_d();
         return undefined;
      }
      if(_loc2_ == "dash_f")
      {
         if(_level0.cpu_op_mode == "defend" && this.opp.status_3 == "down")
         {
            this.roll_b();
         }
         else
         {
            this.dash_f();
         }
         return undefined;
      }
      if(_loc2_ == "walk_f")
      {
         if(_level0.cpu_op_mode == "defend" && this.opp.status_3 == "down")
         {
            this.dash_b();
         }
         else
         {
            this.walk_f();
         }
         return undefined;
      }
      if(_loc2_ == "walk_b")
      {
         this.walk_b();
         return undefined;
      }
      if(_loc2_ == "dash_b")
      {
         this.dash_b();
         return undefined;
      }
      if(_loc2_ == "pitch")
      {
         this.pitch();
         return undefined;
      }
      if(_loc2_ == "pitch2")
      {
         this.pitch(true);
         return undefined;
      }
      if(_loc2_ == undefined)
      {
         _loc2_ = this.skill_select();
      }
      this.skill_last = this.skill_now;
      this.skill_now = _loc2_;
      if(this.status_2 == "air")
      {
         this.skill_now += "_air";
      }
      if(this.skill_now.indexOf("undefined") > -1 || this.skill_now == undefined)
      {
         _loc2_ = this.skill_select();
      }
      if(this.skill_mc.action == _loc2_ && this.skill_mc.allowNum == 1)
      {
         _loc2_ = this.skill_select();
      }
      this.powerDecType = "";
      if((this.status_3 == "hurt" || this.status_3 == "") && this.status_6 != "all")
      {
         return undefined;
      }
      var _loc3_ = this.superCheck(_loc2_);
      if(_loc3_ == false)
      {
         return undefined;
      }
      var _loc4_;
      if(_loc3_ == true)
      {
         if(this.burst_mode == "power")
         {
            _loc4_ = this.skillSuperCheck(_loc2_);
            if(_loc4_ != "")
            {
               this.powerDecType = "super";
               _loc2_ = _loc4_;
            }
         }
      }
      else if(this.superMaxList[_loc2_] == 1)
      {
         this.powerDecType = "super";
      }
      if(this.burstCheck(_loc2_) == false)
      {
         return undefined;
      }
      if(this.status_1 == _loc2_)
      {
         if(this.opp.status_3 != "hurt" && this.opp.status_3 != "")
         {
            return undefined;
         }
         if(this.comboClass.combo1[this.status_1][_loc2_] == undefined)
         {
            if(!(this.status_1 == "punch_l" || this.status_1 == "kick_l" || this.status_1 == "squatPunch_l" || this.status_1 == "squatKick_l"))
            {
               return undefined;
            }
            if(!(this.comboClass.s_cancle[this.status_1][_loc2_] == 1 || this.comboClass.s_cancle[this.status_1][_loc2_] == true))
            {
               return undefined;
            }
         }
      }
      if(this.status_3 == "roll")
      {
         return undefined;
      }
      if(this[_loc2_] != undefined)
      {
         this.opp_hight2 = this.opp_hight;
         this.autoToSkill(_loc2_);
         if(this.toStatus(_loc2_))
         {
            if(this.isDoCancel == true)
            {
               this.isDoCancel = false;
               this.powerDecType2 = "cancle";
               this.powerDec();
               this.powerDec2();
            }
            this.countEnd();
            this.powerDec();
            this.powerDec2();
            this.skillToEqual(this.skill_now);
         }
         else
         {
            this.powerDecType = "";
            this.powerDecType2 = "";
         }
      }
      else if(this.status_2 == "land" && (this.status_3 == "normal" || this.status_3 == "attack"))
      {
         if(this.toStatus(_loc2_))
         {
            if(this.isDoCancel == true)
            {
               this.isDoCancel = false;
               this.powerDecType2 = "cancle";
               this.powerDec();
               this.powerDec2();
            }
            this.countEnd();
            this.powerDec();
            this.powerDec2();
            this.status_3 = "attack";
            this.status_4 = "normal";
            this.status_6 = "normal";
            this.nobody = false;
            this.skillToEqual(this.skill_now);
         }
         else
         {
            this.powerDecType = "";
            this.powerDecType2 = "";
         }
      }
      if(this.inBurst && this.burst_mode == "attack")
      {
         if(this.comboClass.combo2[this.status_1] != undefined && this.comboClass.skill_o[this.status_1] == undefined)
         {
            this.combo_wait(_loc2_);
         }
      }
      else if(this.comboClass.combo3[this.status_1] != undefined)
      {
         this.combo_wait(_loc2_);
      }
      else if(this.comboClass.combo2[this.status_1] != undefined)
      {
         this.combo_wait(_loc2_);
      }
      return true;
   }
   function move_walkRun()
   {
      clearInterval(this.delayTimer);
      if(this.status_2 != "land")
      {
         return undefined;
      }
      if(this.status_3 != "normal")
      {
         return undefined;
      }
      if(this.status_4 != "normal")
      {
         return undefined;
      }
      var Vx = this.Vx;
      var owner = this;
      var opp = owner.opp;
      var _loc2_ = Math.random();
      var S = 0;
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
         if(owner.holdFreeze)
         {
            return undefined;
         }
         if(_level0.KO)
         {
            this.stand();
         }
         owner.do_move(Vx);
         S++;
         if(opp.status_3 == "attack" && opp.status_6 == "normal" && !opp.hit_over())
         {
            owner.defend_start();
            delete this.mc.onEnterFrame;
            return undefined;
         }
         if(opp.hasObj())
         {
            if(this.getDis() < 200)
            {
               owner.hold_u();
               delete this.mc.onEnterFrame;
               return undefined;
            }
         }
         if(owner.checkDefend() && S > 25 - _level0.level * 4)
         {
            delete this.mc.onEnterFrame;
         }
         else if(owner.checkAction())
         {
            delete this.mc.onEnterFrame;
         }
         else
         {
            delete this.mc.onEnterFrame;
            owner.attack_start();
         }
         if((opp.status_1 == "stand" || opp.status_1 == "squat") && opp.status_3 != "attack" || owner.onEgde)
         {
            delete this.mc.onEnterFrame;
            owner.attack_start();
         }
      };
   }
   function move_squat()
   {
      clearInterval(this.delayTimer);
      if(this.status_2 != "land")
      {
         return undefined;
      }
      if(this.status_3 != "normal")
      {
         return undefined;
      }
      if(this.status_4 != "normal")
      {
         return undefined;
      }
      var owner = this;
      var _loc2_ = Math.random();
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
         if(_level0.KO && this.status_1 == "squat" && this.status_3 != "attack" && this.status_6 == "normal")
         {
            delete this.mc.onEnterFrame;
            this.stand();
            return undefined;
         }
         if(this.opp.status_3 == "attack" && this.opp.status_6 == "normal" || this.opp.hasObj())
         {
            owner.hold_d();
            return undefined;
         }
         if(owner.checkDefend())
         {
            delete this.mc.onEnterFrame;
         }
         else if(owner.checkAction())
         {
            delete this.mc.onEnterFrame;
         }
         else
         {
            delete this.mc.onEnterFrame;
            owner.attack_start();
         }
      };
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
         var _loc9_;
         var _loc10_;
         var _loc6_;
         var _loc5_;
         var _loc11_;
         var _loc7_;
         var _loc14_;
         var _loc4_;
         var _loc3_;
         var _loc12_;
         var _loc13_;
         var _loc2_;
         var _loc8_;
         if(opp.hasObj())
         {
            if(opp.status_3 == "hurt" || opp.status_3 == "" || opp.status_3 != "hurt" && opp.status_3 != "" && opp.hit_over())
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
                  _loc9_ = _loc3_[_loc2_].area.obj_level;
                  _loc10_ = _loc3_[_loc2_].area._width;
                  _loc6_ = _loc3_[_loc2_].area._height;
                  _loc5_ = _loc3_[_loc2_].area.obj_Vx;
                  _loc7_ = _loc3_[_loc2_].area._y;
                  _loc14_ = _loc3_[_loc2_].area.breakDefend;
                  _loc12_ = _loc3_[_loc2_].area._x;
                  _loc13_ = _loc3_[_loc2_].area.hitPos;
                  _loc11_ = _loc3_[_loc2_].area.people;
               }
               _loc2_ = _loc2_ + 1;
            }
            _loc2_ = Math.random();
            if(_loc10_ > 250)
            {
               return undefined;
            }
            if(_loc4_ < 130)
            {
               return undefined;
            }
            if(_loc9_ == 1000)
            {
               return undefined;
            }
            if(_loc4_ <= 180 && _loc4_ > 130 && _loc2_ < 0.05)
            {
               owner.roll_f();
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
            if(_loc4_ > 550 && _loc4_ <= 650 && _loc5_ > 40 && _loc5_ <= 60 && _loc2_ < 0.18 * _level0.level && (_loc6_ < 100 && _loc7_ < 100 && _level0.cpu_op_mode !== "defend" || _loc6_ < 75 && _loc7_ < 75 && _level0.cpu_op_mode === "defend"))
            {
               owner.jump_f();
               return undefined;
            }
            if(_loc4_ > 450 && _loc4_ <= 550 && _loc5_ > 30 && _loc5_ <= 40 && _loc2_ < 0.18 * _level0.level && (_loc6_ < 100 && _loc7_ < 100 && _level0.cpu_op_mode !== "defend" || _loc6_ < 75 && _loc7_ < 75 && _level0.cpu_op_mode === "defend"))
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
            if(_loc5_ < 25 && _loc5_ > 12 && _loc4_ >= 150 && _loc2_ < 0.18 * _level0.level)
            {
               if(_loc4_ <= 200 && this.getDis() > 450)
               {
                  owner.roll_f();
               }
            }
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
   function stand()
   {
      if(this.status_2 != "land" || this.status_3 != "normal" || this.holdFreeze || this.status_6 != "normal")
      {
         return undefined;
      }
      var _loc2_ = "";
      if(this.status_1 == "hold_u" || this.status_1 == "hold_d")
      {
         if(this.mc.toDefendEnd() != undefined && this.mc.goStand != true)
         {
            _loc2_ = this.mc.toDefendEnd();
         }
      }
      this.opp_hight2 = this.opp_hight;
      if(this.status_3 != "attack" && this.status_3 != "hurt" && this.status_3 != "" && this.status_2 == "land" && !(this.inFreeze || _level0.inFreeze || this.opp.inFreeze))
      {
         this.statusClear();
      }
      this.countEnd();
      this.nosh = false;
      this.colorNormal();
      if(_loc2_ == "")
      {
         if(this.roleMode == 2)
         {
            _loc2_ = "stand2";
         }
         else
         {
            _loc2_ = "stand";
         }
         this.gotoAndStop(_loc2_);
      }
      else
      {
         this.mc.gotoAndPlay(_loc2_);
      }
      var _loc5_ = this;
      this.mc.onEnterFrame = function()
      {
         if(_level0.inPause)
         {
            return undefined;
         }
         if(this.inFreeze || _level0.inFreeze || this.opp.inFreeze)
         {
            return undefined;
         }
         if(_level0.KO || this.opp.isKO)
         {
            return undefined;
         }
         var _loc3_ = Math.random();
         var _loc2_ = false;
      };
      if(!_level0.KO)
      {
         this.cpu_control();
      }
   }
   function squat()
   {
      if(_level0.KO)
      {
         this.stand();
         return undefined;
      }
      if(this.status_2 != "land" || this.status_3 != "normal" || this.holdFreeze || this.status_6 != "normal")
      {
         return undefined;
      }
      if((this.opp.status_3 == "attack" && this.opp.status_6 == "normal" || this.opp.hasObj()) && (this.opp.status_1 != "pitch" || this.opp.status_1 != "pitch2"))
      {
         this.hold_d();
         return undefined;
      }
      this.status_end = "stand";
      this.opp_hight2 = this.opp_hight - 40;
      this.status_4 = "normal";
      this.gotoAndStop("squat");
      this.status_1 = "squat";
      this.farJumpT2 = 10;
      clearInterval(this.farJumpT);
      this.farJumpT = setInterval(this,"farJumpTimer",10);
      clearInterval(this.delayTimer);
      this.delayTimer = setInterval(this,"move_squat",25);
   }
   function attack()
   {
      this.attack_start();
   }
   function wait()
   {
      if(this.status_2 != "land")
      {
         return undefined;
      }
      if(this.status_3 != "normal")
      {
         return undefined;
      }
      if(this.status_4 != "normal")
      {
         return undefined;
      }
      if(this.status_5 != "normal")
      {
         return undefined;
      }
      if(this.status_6 != "normal")
      {
         return undefined;
      }
      var _loc2_ = "";
      if(this.status_1 == "hold_u" || this.status_1 == "hold_d")
      {
         if(this.mc.toDefendEnd() != undefined && this.mc.goStand != true)
         {
            _loc2_ = this.mc.toDefendEnd();
         }
      }
      this.opp_hight2 = this.opp_hight;
      if(this.status_3 != "attack" && this.status_3 != "hurt" && this.status_3 != "" && this.status_2 == "land" && !(this.inFreeze || _level0.inFreeze || this.opp.inFreeze))
      {
         this.statusClear();
      }
      this.countEnd();
      this.nosh = false;
      this.colorNormal();
      if(_loc2_ == "")
      {
         if(this.roleMode == 2)
         {
            _loc2_ = "stand2";
         }
         else
         {
            _loc2_ = "stand";
         }
         this.gotoAndStop(_loc2_);
      }
      else
      {
         this.mc.gotoAndPlay(_loc2_);
      }
      this.checkWait();
   }
   function holdEndFreeze()
   {
      var _loc2_;
      if(this.status_1 == "hold_u" || this.status_1 == "hold_d")
      {
         if(this.mc.toDefendEnd() != undefined && this.mc.goStand != true)
         {
            _loc2_ = this.mc.toDefendEnd();
            this.gotoAndStop(_loc2_);
            return false;
         }
      }
   }
   function waitStand()
   {
      if(this.status_2 != "land")
      {
         return undefined;
      }
      if(this.status_3 != "normal")
      {
         return undefined;
      }
      if(this.status_4 != "normal")
      {
         return undefined;
      }
      if(this.status_5 != "normal")
      {
         return undefined;
      }
      if(this.status_6 != "normal")
      {
         return undefined;
      }
      var _loc2_ = "";
      if(this.status_1 == "hold_u" || this.status_1 == "hold_d")
      {
         if(this.mc.toDefendEnd() != undefined && this.mc.goStand != true)
         {
            _loc2_ = this.mc.toDefendEnd();
         }
      }
      this.opp_hight2 = this.opp_hight;
      if(this.status_3 != "attack" && this.status_3 != "hurt" && this.status_3 != "" && this.status_2 == "land" && !(this.inFreeze || _level0.inFreeze || this.opp.inFreeze))
      {
         this.statusClear();
      }
      this.countEnd();
      this.nosh = false;
      this.colorNormal();
      if(_loc2_ == "")
      {
         if(this.roleMode == 2)
         {
            _loc2_ = "stand2";
         }
         else
         {
            _loc2_ = "stand";
         }
         this.gotoAndStop(_loc2_);
      }
      else
      {
         this.mc.gotoAndPlay(_loc2_);
      }
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
         if(owner.delay <= 0)
         {
            delete this.mc.onEnterFrame;
            owner.attack_start();
         }
         else
         {
            owner.combo_delay();
         }
      };
   }
   function walk_f()
   {
      if(this.opp.status_8 == "jingling")
      {
         return undefined;
      }
      if(this.holdFreeze)
      {
         return undefined;
      }
      if(this.status_2 != "land" || this.status_3 != "normal" || this.status_1 == "squat" || this.holdFreeze || this.status_6 != "normal")
      {
         return undefined;
      }
      if(!(this.opp.status_2 == "air" && (this.opp.status_3 == "hurt" || this.opp.status_3 == "")) && _level0.level > 3 && this.getDis() > 200)
      {
         this.dash_f();
         return undefined;
      }
      this.opp_hight2 = this.opp_hight;
      this.status_4 = "normal";
      this.status_3 = "normal";
      this.Vx = this.dir * this.Vwalk;
      this.gotoAndStop("walk_f");
      this.status_1 = "walk_f";
      clearInterval(this.delayTimer);
      this.delayTimer = setInterval(this,"move_walkRun",27);
   }
   function walk_b()
   {
      if(this.holdFreeze)
      {
         return undefined;
      }
      if(this.status_2 != "land" || this.status_3 != "normal" || this.status_1 == "squat" || this.status_6 != "normal")
      {
         return undefined;
      }
      if(this.opp.status_3 == "attack" && this.opp.status_6 == "normal" || this.opp.hasObj() && (this.opp.status_1 != "pitch" || this.opp.status_1 != "pitch2"))
      {
         this.hold_u();
         return undefined;
      }
      if(!(this.opp.status_2 == "air" && (this.opp.status_3 == "hurt" || this.opp.status_3 == "")) && _level0.level > 3 && this.getDis() > 200)
      {
         this.dash_f();
         return undefined;
      }
      this.opp_hight2 = this.opp_hight;
      this.status_4 = "normal";
      this.status_3 = "normal";
      this.Vx = this.dir * (- this.Vwalk);
      this.gotoAndStop("walk_b");
      this.status_1 = "walk_b";
      clearInterval(this.delayTimer);
      this.delayTimer = setInterval(this,"move_walkRun",27);
   }
   function dash_f()
   {
      if(this.opp.status_8 == "jingling")
      {
         return undefined;
      }
      if(this.status_2 != "land" || this.status_3 != "normal" || this.status_1 == "squat" || this.holdFreeze || this.status_6 != "normal" || _level0.KO)
      {
         return undefined;
      }
      if(!(this.opp.status_2 == "air" && (this.opp.status_3 == "hurt" || this.opp.status_3 == "")) && _level0.level > 3 && this.getDis() < 100)
      {
         this.walk_f();
         return undefined;
      }
      this.opp_hight2 = this.opp_hight - 25;
      this.status_4 = "normal";
      this.Vx = this.dir * this.Vdash;
      this.gotoAndStop("dash_f");
      this.status_1 = "dash_f";
      this.status_3 = "normal";
      clearInterval(this.delayTimer);
      this.delayTimer = setInterval(this,"move_walkRun",27);
   }
   function dash_b()
   {
      if(this.status_2 != "land" || this.status_3 != "normal" || this.status_1 == "squat" || this.holdFreeze || this.status_6 != "normal" || _level0.KO)
      {
         return undefined;
      }
      this.gotoAndStop("dash_b");
      this.status_1 = "dash_b";
      this.status_3 = "normal";
      this.opp_hight2 = this.opp_hight;
      this.status_4 = "normal";
      this.Vx = -26;
      this.Vy = 17;
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
         if(owner._roleName != "Iori" && owner._roleName != "Kyo" && owner._roleName != "KyoW")
         {
            return undefined;
         }
         var _loc2_ = int(Math.random() * 100);
         if(!(_loc2_ <= 20 * _level0.level && this.opp.status_6 != "atemi"))
         {
            return undefined;
         }
         owner.air_check();
      };
   }
   function hold()
   {
      this.hold_u();
   }
   function hold_u()
   {
      if(this.status_2 != "land" || this.status_3 != "normal" || this.status_6 != "normal" || _level0.KO)
      {
         return undefined;
      }
      if(!((this.opp.status_3 == "attack" && this.opp.status_6 == "normal" || this.opp.hasObj()) && (this.opp.status_1 != "pitch" || this.opp.status_1 != "pitch2")))
      {
         return undefined;
      }
      this.opp_hight2 = this.opp_hight;
      this.nobody = false;
      this.status_6 = "normal";
      this.gotoAndStop("hold_u");
      this.status_1 = "hold_u";
      this.status_4 = "hold";
      clearInterval(this.delayTimer);
      this.delayTimer = setInterval(this,"move_hold",27);
   }
   function hold_d()
   {
      if(this.status_2 != "land" || this.status_3 != "normal" || this.status_6 != "normal" || _level0.KO)
      {
         return undefined;
      }
      if(!((this.opp.status_3 == "attack" && this.opp.status_6 == "normal" || this.opp.hasObj()) && (this.opp.status_1 != "pitch" || this.opp.status_1 != "pitch2")))
      {
         return undefined;
      }
      this.opp_hight2 = this.opp_hight - 40;
      this.nobody = false;
      this.status_6 = "normal";
      this.gotoAndStop("hold_d");
      this.status_1 = "hold_d";
      this.status_4 = "hold";
      clearInterval(this.delayTimer);
      this.delayTimer = setInterval(this,"move_hold",27);
   }
   function jump_f()
   {
      if(this.status_2 != "land" || _level0.KO)
      {
         return undefined;
      }
      this.status_2 = "air";
      this.Vx = this.Vjump_x;
      if(this.status_1 == "dash_f" || this.farJump == true)
      {
         this.Vx = this.Vjump_far * 1.15;
      }
      var _loc3_ = Math.random();
      var _loc4_ = 0.66;
      this.Vy = this.Vjump_y;
      var _loc2_;
      if(this.getDis() < 150)
      {
         _loc2_ = 1;
      }
      else if(this.getDis() < 250)
      {
         _loc2_ = 0.9;
      }
      else if(this.getDis() < 325)
      {
         _loc2_ = 0.8;
      }
      else if(this.getDis() < 400)
      {
         _loc2_ = 0.6;
      }
      else
      {
         _loc2_ = 0.2;
      }
      if(_loc3_ <= _level0.level * 0.19 * _loc2_ || this._roleName == "Kyo" && this.opp.status_1 == "hurt2" && this.opp.status_2 == "land")
      {
         this.Vy *= _loc4_;
      }
      this.gotoAndStop("jump_f");
      this.status_1 = "jump_f";
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
         var _loc2_ = int(Math.random() * 100);
         if(!(_loc2_ <= 20 * _level0.level && this.opp.status_6 != "atemi"))
         {
            return undefined;
         }
         owner.air_check();
      };
   }
   function jump_b()
   {
      if(this.status_2 != "land" || _level0.KO)
      {
         return undefined;
      }
      this.status_2 = "air";
      this.Vx = - this.Vjump_x;
      if(this.farJump == true)
      {
         this.Vx = (- this.Vjump_far) * 1.15;
      }
      var _loc3_ = Math.random();
      var _loc4_ = 0.66;
      this.Vy = this.Vjump_y;
      var _loc2_;
      if(this.getDis() < 150)
      {
         _loc2_ = 1;
      }
      else if(this.getDis() < 250)
      {
         _loc2_ = 0.9;
      }
      else if(this.getDis() < 325)
      {
         _loc2_ = 0.8;
      }
      else if(this.getDis() < 400)
      {
         _loc2_ = 0.6;
      }
      else
      {
         _loc2_ = 0.2;
      }
      if(_loc3_ <= _level0.level * 0.19 * _loc2_)
      {
         this.Vy *= _loc4_;
      }
      this.gotoAndStop("jump_b");
      this.status_1 = "jump_b";
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
         var _loc2_ = int(Math.random() * 100);
         if(!(_loc2_ <= 20 * _level0.level && this.opp.status_6 != "atemi"))
         {
            return undefined;
         }
         owner.air_check();
      };
   }
   function jump()
   {
      if(this.status_2 != "land" || _level0.KO)
      {
         return undefined;
      }
      this.status_2 = "air";
      this.gotoAndStop("jump");
      this.status_1 = "jump";
      this.Vx = 0;
      var _loc3_ = Math.random();
      var _loc4_ = 0.66;
      this.Vy = this.Vjump_y;
      var _loc2_;
      if(this.getDis() < 150)
      {
         _loc2_ = 1;
      }
      else if(this.getDis() < 250)
      {
         _loc2_ = 0.9;
      }
      else if(this.getDis() < 325)
      {
         _loc2_ = 0.8;
      }
      else if(this.getDis() < 400)
      {
         _loc2_ = 0.6;
      }
      else
      {
         _loc2_ = 0.2;
      }
      if(_loc3_ <= _level0.level * 0.19 * _loc2_)
      {
         this.Vy *= _loc4_;
      }
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
         var _loc2_ = int(Math.random() * 100);
         if(!(_loc2_ <= 20 * _level0.level && this.opp.status_6 != "atemi"))
         {
            return undefined;
         }
         owner.air_check();
      };
   }
   function selectOne(array)
   {
      var _loc1_ = array.length;
      var _loc2_ = int(Math.random() * _loc1_);
      var _loc3_ = array[_loc2_];
      return _loc3_;
   }
   function CPU_check(act)
   {
      this.checkSide_abs();
      if(this.skill_next != undefined)
      {
         this.combo_start();
      }
      this.stand();
   }
   function shoushen()
   {
      if(_level0.inPause)
      {
         return undefined;
      }
      if(this.inFreeze || _level0.inFreeze || this.opp.inFreeze)
      {
         return undefined;
      }
      if(_level0.KO || this.opp.isKO)
      {
         return undefined;
      }
      this.breakCatchAI();
      if(this.status_3 == "down" && !_level0.KO && this.mc._currentframe <= 3 && this.getOwnerHeight() < 50 || this.status_2 == "air" && (this.status_3 == "hurt" || this.status_3 == "") && this.status_6 != "all" && this.getOwnerHeight() < 50)
      {
         this.roll_b();
      }
   }
   function stand_check()
   {
      if(_level0.inPause)
      {
         return undefined;
      }
      if(this.inFreeze || _level0.inFreeze || this.opp.inFreeze)
      {
         return undefined;
      }
      if(_level0.KO || this.opp.isKO)
      {
         return undefined;
      }
      if(this.status_2 != "land")
      {
         return undefined;
      }
      if(this.opp.status_4 == "hold")
      {
         return undefined;
      }
      if((this.opp.status_3 == "hurt" || this.opp.status_3 == "") && this.delay > 0)
      {
         return undefined;
      }
      if(_level0.level < 5 && this.wait_f > 0)
      {
         return undefined;
      }
      var _loc3_ = int(Math.random() * 100);
      var _loc4_ = new Date();
      var _loc2_ = _loc4_.getSeconds();
      if(this.opp.onHit && this.status_4 == "hold" && this.status_5 == "hitBack" && this.status_3 == "normal" && _loc2_ % (8 - _level0.level) == 0 && !this.opp.hit_over() && this.status_6 == "normal" && this.status_3 == "normal" && !(this.opp.inBurst && this.opp.burst_mode == "defend") && this.opp.status_1 != "powercd" && !this.checkMustDefendSkill(this.opp.status_1))
      {
         if(!(this.inBurst && this.opp.burst_mode == "defend") && _loc3_ <= 50)
         {
            return undefined;
         }
         if(this.onEgde || this.opp.onEgde)
         {
            this.attackCD();
            return undefined;
         }
         if(this.opp.life / this.opp.life_max <= 0.2)
         {
            this.attackCD();
            return undefined;
         }
         if(this.opp.life / this.opp.life_max <= 0.2)
         {
            this.attackCD();
            return undefined;
         }
         if(this.life / this.opp.life >= 0.6 && this.life / this.opp.life <= 1.3)
         {
            this.attackCD();
            return undefined;
         }
      }
      if(this.status_4 == "hold" && _loc2_ % 3 == 0 && !this.opp.hasObj() && this.status_5 == "normal" && this.status_3 == "normal" && this.opp.status_8 != "jingling")
      {
         if(this.checkAction())
         {
            return undefined;
         }
         if(_loc3_ <= 50)
         {
            this.attack_start();
         }
         else
         {
            this.defend_start();
         }
         return undefined;
      }
      if((this.status_1 == "stand" || this.status_1 == "ready" || (this.status_1 == "jump" || this.status_1 == "jump_f" || this.status_1 == "jump_b") && (this.getOwnerHeight() <= 0 || this.status_2 != "air")) && !this.opp.hasObj() && this.opp.status_1 != "stand" && this.mc._currentframe > 3)
      {
         if(this.checkAction())
         {
            return undefined;
         }
         this.attack_start();
         return undefined;
      }
      if((this.status_1 == "stand" || this.status_1 == "ready") && !this.opp.hasObj() && this.opp.status_1 == "stand" && _loc2_ % 3 == 0)
      {
         if(this.checkAction())
         {
            return undefined;
         }
         this.attack_start();
         return undefined;
      }
   }
   function check_special_defend()
   {
      var _loc2_;
      var _loc3_ = Math.random();
      var _loc4_ = Math.random();
      if(_loc4_ > _level0.level * 0.18 && _level0.cpu_op_mode != "defend")
      {
         return false;
      }
      if(this.opp.mc.hitPos == "landDefend" && this.status_5 != "hitBack" && !this.opp.hit_over())
      {
         if(this.getDis() < 150)
         {
            _loc2_ = "jump";
         }
         else if(this.getDis() < 400)
         {
            _loc2_ = "jump_f";
         }
         else
         {
            _loc2_ = "jump";
         }
      }
      if(this.opp.mc.hitPos == "avoid" && this.status_5 != "hitBack" && !this.opp.hit_over())
      {
         if(this.getDis() < 200)
         {
            _loc2_ = "roll_f";
         }
         else if(this.getDis() < 325)
         {
            _loc2_ = "roll_b";
         }
         else
         {
            _loc2_ = "dash_b";
         }
      }
      else if(this.opp.mc.hitPos == "run" && this.status_5 != "hitBack" && !this.opp.hit_over() && this.dir != this.opp.dir)
      {
         if(this.getDis() < 200)
         {
            _loc2_ = "hold_u";
         }
         else
         {
            _loc2_ = "dash_b";
         }
      }
      else if(this.opp.mc.hitPos == "all" || this.opp.mc.hitPos == "breakDefend" && this.dir != this.opp.dir && this.status_5 != "hitBack" && !this.opp.hit_over())
      {
         if(this.getDis() < 200)
         {
            _loc2_ = "roll_f";
         }
         else if(this.getDis() < 325 && !this.onEgde)
         {
            _loc2_ = "roll_b";
         }
         else
         {
            _loc2_ = this.action_select("action_1","defendAttack");
         }
         if(_loc2_ == undefined)
         {
            _loc2_ = this.skill_select();
         }
      }
      else if(this.opp.status_6 == "catch" && (this.status_3 != "hurt" && this.status_3 != "") && !this.opp.onHit && this.status_7 != "nohit")
      {
         if(_loc3_ < 0.15 && _level0.cpu_op_mode != "defend" || _loc3_ < 0.3 && _level0.cpu_op_mode == "defend")
         {
            if(this.getDis() < 150)
            {
               _loc2_ = "jump";
            }
            else if(this.getDis() < 175)
            {
               _loc2_ = "dash_b";
            }
            else if(this.getDis() < 200)
            {
               _loc2_ = "jump_b";
            }
            else if(this.getDis() < 250)
            {
               _loc2_ = "jump_f";
            }
            else
            {
               _loc2_ = this.action_select("action_1","defendAttack");
            }
         }
         else if(_level0.level > 3)
         {
            _loc2_ = this.action_select("action_1","defendAttack");
         }
      }
      else if(this.opp.status_6 == "atemi" && this.dir != this.opp.dir)
      {
         if(this.getDis() < 100)
         {
            _loc2_ = "pitch";
         }
         else
         {
            _loc2_ = this.action_select("action_1","oppLandCatch");
         }
      }
      else if(this.opp.status_6 == "catchAir")
      {
         if(this.getDis() < 200)
         {
            _loc2_ = "roll_f";
         }
         else
         {
            _loc2_ = "dash_f";
         }
      }
      if(_loc2_ != undefined)
      {
         this.toSkill(_loc2_);
         return true;
      }
      return false;
   }
   function getComboSkill(status_1, skill)
   {
      var role_mc = this;
      var _loc3_ = this.mc;
      var start_frame = this.comboClass.combo2[status_1];
      var end_frame = this.comboClass.skill_o[status_1];
      var start_frame2 = this.comboClass.combo22[status_1];
      var end_frame2 = this.comboClass.skill_o2[status_1];
      if(isNaN(start_frame))
      {
         return false;
      }
      var SC = this.superCancle;
      if(_loc3_._currentframe < start_frame - 5)
      {
         return false;
      }
      _loc3_.onEnterFrame = function()
      {
         if(_level0.inPause)
         {
            return undefined;
         }
         if(role_mc.inFreeze)
         {
            return undefined;
         }
         if(start_frame < end_frame)
         {
            if(this._currentframe >= start_frame && this._currentframe <= end_frame)
            {
               if(SC)
               {
                  role_mc.powerDecType2 = "cancle";
                  role_mc.powerDec();
                  role_mc.powerDec2();
               }
               if(isNaN(start_frame2))
               {
                  delete this.onEnterFrame;
               }
            }
         }
         else if(this._currentframe >= start_frame)
         {
            if(SC)
            {
               role_mc.powerDecType2 = "cancle";
               role_mc.powerDec();
               role_mc.powerDec2();
            }
            delete this.onEnterFrame;
         }
         if(!isNaN(start_frame2))
         {
            if(start_frame2 < end_frame2)
            {
               if(this._currentframe >= start_frame2 && this._currentframe <= end_frame2)
               {
                  if(SC)
                  {
                     role_mc.powerDecType2 = "cancle";
                     role_mc.powerDec();
                     role_mc.powerDec2();
                  }
                  delete this.onEnterFrame;
               }
            }
            else if(this._currentframe >= start_frame2)
            {
               if(SC)
               {
                  role_mc.powerDecType2 = "cancle";
                  role_mc.powerDec();
                  role_mc.powerDec2();
               }
               delete this.onEnterFrame;
            }
         }
      };
      return true;
   }
   function check_combo(status_1, skill)
   {
      this.superCancle = false;
      if(status_1 == "powercd")
      {
         return undefined;
      }
      if(this.comboClass.noCancle[status_1] == skill)
      {
         return undefined;
      }
      if(this.check_combo2(status_1,skill) == true)
      {
         return true;
      }
      if(this.check_combo3(status_1,skill) == true)
      {
         return true;
      }
      if(this.check_combo4(status_1,skill) == true)
      {
         return true;
      }
   }
   function check_combo1(status_1, skill)
   {
      var _loc2_;
      _loc2_ = this.comboClass.combo1[status_1][skill];
      if(_loc2_ != undefined)
      {
         if(this.getComboSkill(status_1,_loc2_))
         {
            return true;
         }
      }
   }
   function check_combo2(status_1, skill)
   {
      var _loc4_ = this;
      var _loc5_ = this.mc;
      if(this.comboClass.beCancled[status_1] != 1)
      {
         return false;
      }
      if(!(this.comboClass.s_cancle[status_1][skill] == 1 || this.comboClass.s_cancle[status_1][skill] == true))
      {
         if(this.comboClass.notTOcancle[skill] == 1)
         {
            return false;
         }
      }
      if(this.getComboSkill(status_1,skill))
      {
         return true;
      }
   }
   function check_combo3(status_1, skill)
   {
      if(this.superCancleAI() && this.comboClass.notTOcancle[skill] != 1 && status_1 != skill)
      {
         this.superCancle = true;
         if(this.getComboSkill(status_1,skill))
         {
            return true;
         }
      }
   }
   function check_combo4(status_1, skill)
   {
      if(this.superCancleAI() && this.comboClass.notTOcancle[skill] != 1 && status_1 != skill)
      {
         this.superCancle = true;
         if(this.status_2 == "toLand")
         {
            this.status_2 = "land";
            this.powerDecType2 = "cancle";
            return true;
         }
      }
   }
   function superCancleAI()
   {
      if(this.inBurst && this.burst_mode == "attack")
      {
         return true;
      }
   }
   function air_check()
   {
      var _loc2_;
      var _loc3_;
      _loc3_ = int(Math.random() * 100);
      if(this.status_2 != "air")
      {
         return undefined;
      }
      if(this.getDis() < 200 && Math.abs(this.getOppHeight() - this.getOwnerHeight()) <= 75 && this.getOwnerHeight() > 50 && this.getOwnerHeight() < 100)
      {
         if(!this.opp.nosh && this.opp.status_6 != "all" && this.opp.status_3 == "hurt" && _loc3_ < 50)
         {
            this.sk29();
         }
         else
         {
            this.sk14();
         }
      }
      var _loc4_;
      if(this.opp.status_2 == "air" && this.opp.status_3 == "hurt" && this.getOppHeight() <= 250 && this.getOppHeight() >= 25)
      {
         _loc2_ = "heavyHit";
         if(this.mc._currentframe > 3 && _loc2_ != undefined)
         {
            this.jumpSkill(_loc2_);
            delete this.mc.onEnterFrame;
         }
      }
      else if(this.opp.status_2 == "air" && this.opp.status_3 != "hurt" && this.getDis() < 250)
      {
         _loc3_ = int(Math.random() * 100);
         _loc4_ = int(Math.random() * 100);
         if(_loc3_ < 25)
         {
            _loc2_ = "heavyHit";
         }
         else if(_loc3_ < 50)
         {
            _loc2_ = "kick_l";
         }
         else if(Math.abs(this.getOppHeight() - this.getOwnerHeight()) <= 100 && this.getOppHeight() > 75 && this.getOwnerHeight() > 75)
         {
            if(this.getDis() < 150 && _loc4_ <= 25)
            {
               this.sk14();
            }
            if(this.getDis() < 200 && _loc4_ <= 25)
            {
               this.sk14_h();
            }
            if(this.getDis() < 250 && _loc4_ <= 50)
            {
               this.sk29();
            }
            if(this.getDis() < 400)
            {
               this.sk2();
            }
            else if(this.getDis() < 400)
            {
               this.sk2_h();
            }
         }
         if(_loc2_ != undefined)
         {
            this.jumpSkill(_loc2_);
            delete this.mc.onEnterFrame;
         }
      }
      else if(this._x > this.opp._x && this.dir > 0 && !(this.opp.status_2 == "air" && this.opp.status_3 == "hurt"))
      {
         _loc3_ = int(Math.random() * 100);
         _loc2_ = "kick";
         this.jumpSkill(_loc2_);
         delete this.mc.onEnterFrame;
      }
      else if(this._x < this.opp._x && this.dir < 0 && !(this.opp.status_2 == "air" && this.opp.status_3 == "hurt"))
      {
         _loc2_ = "kick";
         this.jumpSkill(_loc2_);
         delete this.mc.onEnterFrame;
      }
      else if(this._y > this.land_Y - 150 && this.Vy < 0)
      {
         _loc3_ = int(Math.random() * 100);
         if(_loc3_ < 15)
         {
            _loc2_ = "kick";
         }
         else if(_loc3_ < 30)
         {
            _loc2_ = "punch_l";
         }
         else if(_loc3_ < 80)
         {
            if(this.getDis() < 150)
            {
               this.sk14();
            }
            else if(this.getDis() < 220)
            {
               this.sk14_h();
            }
         }
         if(_loc2_ != undefined)
         {
            this.jumpSkill(_loc2_);
            delete this.mc.onEnterFrame;
         }
      }
   }
   function checkDash_pl()
   {
      if(this.getdoComboCan())
      {
         delete this.mc.onEnterFrame;
         if(this.opp.status_3 == "hurt")
         {
            if((this.superPoint > 0 && this.superPoint < 3 || this.inBurst) && this.opp.status_2 == "land")
            {
               this.skill_next = this.selectOne(["sk29","sk29","sk29","sk2"]);
            }
            else
            {
               this.skill_next = this.selectOne(["sk2"]);
            }
            this.delay = 3;
            this.combo_delay();
         }
      }
   }
}
