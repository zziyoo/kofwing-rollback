class Mai_role extends role_corn.Role
{
   var Vdash;
   var Vjump_far;
   var Vjump_x;
   var Vjump_y;
   var Vwalk;
   var Vx;
   var Vy;
   var _roleName;
   var _x;
   var _y;
   var b;
   var begin;
   var begin2;
   var burstList;
   var burst_mode;
   var chageSide1;
   var chageSide2;
   var checkSide_abs;
   var colorObj;
   var comboClass;
   var d;
   var dir;
   var f;
   var getObjs;
   var gotoAndStop;
   var holdFreeze;
   var inBurst;
   var inRecord;
   var input_pre;
   var jumpSkill;
   var mc;
   var mode_key;
   var normalList2;
   var onEgde;
   var opp;
   var opp_width2;
   var pitch;
   var powerDec;
   var powerDec2;
   var powerDecType;
   var powerDecType2;
   var scale;
   var skillObj;
   var skillSuperMapping;
   var skill_record;
   var start_move_Y1;
   var status_1;
   var status_2;
   var status_3;
   var superList;
   var superMaxList;
   var superSkill;
   var toSkill;
   var winPoseArray;
   function Mai_role()
   {
      super();
      this._roleName = "Mai";
      this.scale = 100;
      this.Vwalk = 11;
      this.Vdash = 28;
      this.Vjump_x = 13;
      this.Vjump_y = 49;
      this.Vjump_far = 20;
      this.opp_width2 = 60;
      this.superList = {sk_s_shuiniao:1,sk_s_renfeng:1,sk_s_renfeng_air:1,sk_s_renfeng_s2:1};
      this.burstList = {sk_s_heti:1,sk_s_qianzai1:1};
      this.superMaxList = {sk_s_shuiniao_s:1,sk_s_renfeng_s:1,sk_s_renfeng_s_air:1,sk_s_renfeng_s2:1};
      this.skillSuperMapping = {sk_s_shuiniao:"sk_s_shuiniao_s",sk_s_renfeng:"sk_s_renfeng_s",sk_s_renfeng_air:"sk_s_renfeng_s_air",sk_s_renfeng_s2:"sk_s_renfeng_s2"};
      this.normalList2 = ["sk_d1","sk_d2","sk_huaxing","kick_s1","kick_s12","jumpSkill_punch_s"];
      this.winPoseArray = ["end","end2"];
      this.skillObj.s1 = "sk_s_shuiniao";
      this.skillObj.s2 = "sk_s_renfeng";
      this.skillObj.s3 = "sk_s_renfeng_air";
      this.skillObj.busrt_a = "sk_s_heti";
      this.skillObj.busrt_d = "sk_s_qianzai1";
      this.skillObj.toAir = "sk_feixiang";
      this.comboClass = new Mai_Combo(this);
      this.preCheck();
      this.colorObj.fire_red1 = {ra:"100",rb:"255",ga:"-70",gb:"255",ba:"-100",bb:"-100",aa:"100",ab:"0"};
      this.colorObj.fire_red2 = {ra:"100",rb:"255",ga:"-100",gb:"255",ba:"-100",bb:"-100",aa:"100",ab:"0"};
      this.colorObj.fire_blue2 = {ra:"100",rb:"0",ga:"100",gb:"0",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.fire_blue1 = {ra:"-100",rb:"178",ga:"-100",gb:"96",ba:"-100",bb:"239",aa:"100",ab:"0"};
      this.colorObj.ice1 = {ra:"-100",rb:"255",ga:"-50",gb:"255",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.purple1 = {ra:"-16",rb:"139",ga:"-21",gb:"97",ba:"-11",bb:"170",aa:"100",ab:"0"};
      this.colorObj.purple2 = {ra:"2",rb:"129",ga:"-24",gb:"110",ba:"-5",bb:"140",aa:"100",ab:"0"};
   }
   function stageVar(l_max, s_Point, p_max, opponent, burst)
   {
      super.stageVar(l_max,s_Point,p_max,opponent,burst);
      var _loc4_;
      if(opponent.roleName == "Chunli")
      {
         this.begin2();
      }
      else if(opponent.roleName == "Andy")
      {
         this.gotoAndStop("vsAndy");
      }
      else
      {
         _loc4_ = Math.random();
         if(_loc4_ > 0.5)
         {
            this.begin();
         }
         else
         {
            this.begin();
         }
      }
   }
   function preCheck()
   {
      this.input_pre.roll_f = 10;
      this.input_pre.roll_b = 10;
      this.input_pre.land = 0;
      this.input_pre.land2 = 0;
      this.input_pre.sk_qianniao_s2 = 10;
      this.input_pre.sk_qianniao_s3 = 10;
      this.input_pre.sk_dfk = 19;
      this.input_pre.sk_longyanwu = 24;
      this.input_pre.sk_longyanwu_l = 18;
   }
   function sk_huadieshan()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "mai_shanzi1" && _loc3_[_loc2_].allowNum == 1)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_1 = "sk_huadieshan";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk_huadieshan_h()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "mai_shanzi1_h" && _loc3_[_loc2_].allowNum == 1)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_1 = "sk_huadieshan_h";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk_s_renfeng_s2()
   {
      if(this.inBurst == true)
      {
         if(this.burst_mode == "defend" || this.burst_mode == "attack")
         {
            this.powerDecType = "super";
            this.powerDec();
            this.powerDecType = "super";
            this.powerDec();
         }
         else
         {
            this.superSkill = true;
            this.powerDecType2 = "cancle";
            this.powerDecType = "super";
            this.powerDec2();
         }
      }
      else
      {
         if(this == _level0.P1_role && _level0.LP_P1.powerPoint_num < 2 || this == _level0.P2_role && _level0.LP_P2.powerPoint_num < 2)
         {
            return false;
         }
         this.powerDecType = "super";
         this.powerDec();
         this.powerDecType = "super";
         this.powerDec();
      }
      if(this.status_2 != "land")
      {
         this.checkSide_abs();
         this.sk_s_renfeng_s_air();
         return undefined;
      }
      this.status_1 = "sk_s_renfeng_s";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk_renfeng_fake()
   {
      if(this.status_2 == "air")
      {
         this.checkSide_abs();
         this.sk_s_renfeng_air();
         return undefined;
      }
      if(this.status_3 == "attack")
      {
         this.status_1 = "kick_s12";
      }
      else
      {
         this.status_1 = "kick_s1";
      }
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk_s_renfeng()
   {
      if(this.status_2 == "air")
      {
         this.checkSide_abs();
         this.sk_s_renfeng_air();
         return undefined;
      }
      if(this.status_2 != "land")
      {
         return false;
      }
      if(this == _level0.P1_role && _level0.LP_P1.powerPoint_num == 0 && !this.inBurst || this == _level0.P2_role && _level0.LP_P2.powerPoint_num == 0 && !this.inBurst)
      {
         return false;
      }
      this.powerDecType = "super";
      this.powerDec();
      this.status_1 = "sk_s_renfeng";
      this.gotoAndStop(this.status_1);
      this.status_3 = "attack";
   }
   function sk_s_renfeng_s()
   {
      if(this.status_2 == "air")
      {
         this.checkSide_abs();
         this.sk_s_renfeng_s_air();
         return undefined;
      }
      if(this.status_2 != "land")
      {
         return false;
      }
      if(this == _level0.P1_role && _level0.LP_P1.powerPoint_num == 0 && !this.inBurst || this == _level0.P2_role && _level0.LP_P2.powerPoint_num == 0 && !this.inBurst)
      {
         return false;
      }
      this.powerDecType = "super";
      this.powerDec();
      this.status_1 = "sk_s_renfeng_s";
      this.gotoAndStop(this.status_1);
      this.status_3 = "attack";
   }
   function sk_s_renfeng_air()
   {
      if(this.status_2 != "air")
      {
         return false;
      }
      if(this._y == 445)
      {
         this.start_move_Y1(this.Vy * 2 / 3,this.Vx);
      }
      if(this == _level0.P1_role && _level0.LP_P1.powerPoint_num == 0 && !this.inBurst || this == _level0.P2_role && _level0.LP_P2.powerPoint_num == 0 && !this.inBurst)
      {
         return false;
      }
      this.powerDecType = "super";
      this.powerDec();
      this.status_1 = "sk_s_renfeng_air";
      this.gotoAndStop(this.status_1);
      this.status_3 = "attack";
   }
   function sk_s_renfeng_s_air()
   {
      if(this.status_2 != "air")
      {
         return false;
      }
      if(this._y == 445)
      {
         this.start_move_Y1(this.Vy * 2 / 3,this.Vx);
      }
      if(this == _level0.P1_role && _level0.LP_P1.powerPoint_num == 0 && !this.inBurst || this == _level0.P2_role && _level0.LP_P2.powerPoint_num == 0 && !this.inBurst)
      {
         return false;
      }
      this.powerDecType = "super";
      this.powerDec();
      this.status_1 = "sk_s_renfeng_s_air";
      this.gotoAndStop(this.status_1);
      this.status_3 = "attack";
   }
   function sk_longyanwu()
   {
      if(this.status_2 == "air")
      {
         this.sk_feishu();
         return undefined;
      }
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk_longyanwu";
      this.gotoAndStop(this.status_1);
      this.status_3 = "attack";
   }
   function sk_longyanwu_l()
   {
      if(this.status_2 == "air")
      {
         this.sk_feishu();
         return undefined;
      }
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk_longyanwu_l";
      this.gotoAndStop(this.status_1);
      this.status_3 = "attack";
   }
   function sk_longyanwu2()
   {
      if(this.status_2 == "air")
      {
         this.sk_feishu();
         return undefined;
      }
      if(this.status_2 != "land")
      {
         return false;
      }
      if(this.status_1 == "sk_longyanwu2")
      {
         return false;
      }
      this.status_1 = "sk_longyanwu2";
      this.gotoAndStop(this.status_1);
      this.status_3 = "attack";
   }
   function sk_feishu()
   {
      this.status_1 = "sk_feishu";
      this.gotoAndStop(this.status_1);
      this.status_3 = "attack";
   }
   function sk_d1()
   {
      this.status_1 = "sk_d1";
      this.gotoAndStop(this.status_1);
      this.status_3 = "attack";
   }
   function sk_d2()
   {
      this.status_1 = "sk_d2";
      this.gotoAndStop(this.status_1);
      this.status_3 = "attack";
   }
   function airThrow2()
   {
      if(!(this.opp.status_2 == "air" && (this.opp._y - this._y < 100 && this._y - this.opp._y < 100) && (this.opp._x - this._x < 100 && this._x - this.opp._x < 100)))
      {
         return false;
      }
      this.mc.gotoAndPlay("airThrow");
      this.status_3 = "attack";
      this.status_1 = "airThrow";
   }
   function jump_f()
   {
      var _loc2_;
      if(this.status_2 == "air" && this.status_3 == "normal" && this.status_1 != "jump_f")
      {
         _loc2_ = _level0.char_mc._x + this._x;
         if(_loc2_ < 80)
         {
            this.Vx = 17;
            this.Vy = 42;
         }
         else
         {
            if(_loc2_ <= 786)
            {
               return false;
            }
            this.Vx = 17;
            this.Vy = 42;
         }
      }
      else
      {
         if(this.status_2 != "land" || this.holdFreeze || this.status_3 != "normal")
         {
            return false;
         }
         this.Vx = this.Vjump_x;
         this.Vy = this.Vjump_y;
      }
      this.status_2 = "air";
      if(this.inRecord)
      {
         this.skill_record("jump_f");
      }
      this.gotoAndStop("jump_f");
      this.status_1 = "jump_f";
   }
   function jump_b()
   {
      var _loc2_;
      if(this.status_2 == "air" && this.status_3 == "normal" && this.status_1 == "jump_f")
      {
         _loc2_ = _level0.char_mc._x + this._x;
         if(this.dir == -1 && _loc2_ < 80)
         {
            this.chageSide1();
            this.Vx = 17;
            this.Vy = 42;
            if(this.inRecord)
            {
               this.skill_record("jump_f");
            }
            this.gotoAndStop("jump_f");
            this.status_1 = "jump_f";
            return undefined;
         }
         if(this.dir == 1 && _loc2_ > 786)
         {
            this.chageSide2();
            this.Vx = -17;
            this.Vy = 42;
            if(this.inRecord)
            {
               this.skill_record("jump_f");
            }
            this.gotoAndStop("jump_f");
            this.status_1 = "jump_f";
            return undefined;
         }
         return false;
      }
      if(this.status_2 != "land" || this.holdFreeze || this.status_3 != "normal")
      {
         return false;
      }
      this.Vx = - this.Vjump_x;
      this.Vy = this.Vjump_y;
      this.status_2 = "air";
      if(this.inRecord)
      {
         this.skill_record("jump_b");
      }
      this.gotoAndStop("jump_b");
      this.status_1 = "jump_b";
   }
   function jump_air()
   {
      var _loc2_;
      if(this.status_2 == "air" && this.onEgde && this.status_3 == "normal")
      {
         _loc2_ = _level0.char_mc._x + this._x;
         if(!(_loc2_ < 80 || _loc2_ > 786))
         {
            return false;
         }
      }
      else if(this.status_2 != "land" || this.holdFreeze || this.status_3 != "normal")
      {
         return false;
      }
      this.status_2 = "air";
      if(this.inRecord)
      {
         this.skill_record("jump_f");
      }
      this.Vx = this.Vjump_x;
      this.Vy = this.Vjump_y;
      this.gotoAndStop("jump_f");
      this.status_1 = "jump_f";
   }
   function to_kick()
   {
      var _loc2_;
      if(this.status_1 == "jump_f" || this.status_1 == "jump_far" || this.status_1 == "jump" || this.status_1 == "jump_b")
      {
         if(Key.isDown(this.d))
         {
            this.toSkill("sk_d1");
            return undefined;
         }
         _loc2_ = "kick";
         this.jumpSkill(_loc2_);
         return undefined;
      }
      if(Key.isDown(this.d))
      {
         _loc2_ = "squatKick";
      }
      else if(Key.isDown(this.f) && this.dir == 1 || Key.isDown(this.b) && this.dir == -1)
      {
         if(this.pitch(true))
         {
            return undefined;
         }
         _loc2_ = "kick";
      }
      else
      {
         _loc2_ = "kick";
      }
      this.toSkill(_loc2_);
   }
   function to_kick_l()
   {
      var _loc2_;
      if(this.status_1 == "jump_f" || this.status_1 == "jump_far" || this.status_1 == "jump" || this.status_1 == "jump_b")
      {
         if(Key.isDown(this.d))
         {
            this.toSkill("sk_d2");
            return undefined;
         }
         _loc2_ = "kick_l";
         this.jumpSkill(_loc2_);
         return undefined;
      }
      if(Key.isDown(this.d))
      {
         if(Key.isDown(this.f) && this.dir == 1)
         {
            _loc2_ = "sk_huaxing";
         }
         else if(Key.isDown(this.b) && this.dir == -1)
         {
            _loc2_ = "sk_huaxing";
         }
         else
         {
            _loc2_ = "squatKick_l";
         }
      }
      else if(Key.isDown(this.f) && this.dir == 1 || Key.isDown(this.b) && this.dir == -1)
      {
         if(this.status_3 == "attack")
         {
            _loc2_ = "kick_s12";
         }
         else
         {
            _loc2_ = "kick_s1";
         }
      }
      else if(this.mode_key == "easy")
      {
         _loc2_ = this.skillObj.s2;
      }
      else
      {
         _loc2_ = "kick_l";
      }
      this.toSkill(_loc2_);
   }
   function to_punch()
   {
      var _loc2_;
      if(this.status_1 == "jump_f" || this.status_1 == "jump_far" || this.status_1 == "jump" || this.status_1 == "jump_b")
      {
         this.jumpSkill("punch");
         return undefined;
      }
      if(Key.isDown(this.d))
      {
         _loc2_ = "squatPunch";
      }
      else if(this.status_1 == "dash_f")
      {
         _loc2_ = "punch";
      }
      else if(Key.isDown(this.f) && this.dir == 1 || Key.isDown(this.b) && this.dir == -1)
      {
         if(this.pitch())
         {
            return undefined;
         }
         _loc2_ = "punch";
      }
      else
      {
         _loc2_ = "punch";
      }
      this.toSkill(_loc2_);
   }
   function to_punch_l()
   {
      var _loc2_;
      if(this.status_1 == "jump_f" || this.status_1 == "jump_far" || this.status_1 == "jump" || this.status_1 == "jump_b")
      {
         if(Key.isDown(this.d))
         {
            this.jumpSkill("punch_s");
         }
         else
         {
            this.jumpSkill("punch_l");
         }
         return undefined;
      }
      if(Key.isDown(this.d))
      {
         _loc2_ = "squatPunch_l";
      }
      else if(this.mode_key == "easy")
      {
         _loc2_ = this.skillObj.s1;
      }
      else
      {
         _loc2_ = "punch_l";
      }
      this.toSkill(_loc2_);
   }
}
