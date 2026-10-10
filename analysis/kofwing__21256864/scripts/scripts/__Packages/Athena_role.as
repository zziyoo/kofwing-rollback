class Athena_role extends role_corn.Role
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
   var record_skill_totalFrame;
   var scale;
   var skillObj;
   var skillSuperMapping;
   var skill_record;
   var start_move_Y1;
   var status_1;
   var status_2;
   var status_3;
   var status_6;
   var superList;
   var superMaxList;
   var toSkill;
   var toStatus;
   var winPoseArray;
   function Athena_role()
   {
      super();
      this._roleName = "Athena";
      this.scale = 100;
      this.Vwalk = 10;
      this.Vdash = 25;
      this.Vjump_x = 16;
      this.Vjump_y = 42;
      this.Vjump_far = 22;
      this.opp_width2 = 60;
      this.superList = {sk_dfdf_k:1,sk_s_89b:1};
      this.burstList = {sk_s_qianzai2:1,sk_s_3shenji2:1,sk_s_abcd1:1,sk_wtf:1};
      this.superMaxList = {sk_dfdf_k_s:1,sk_s_89b_s:1};
      this.skillSuperMapping = {sk_dfdf_k:"sk_dfdf_k_s",sk_s_89b:"sk_s_89b_s"};
      this.normalList2 = ["kick_s1","jairback","jairback2"];
      this.winPoseArray = ["end","end2"];
      var _loc3_ = Math.random();
      if(_loc3_ > 0.5)
      {
         this.begin();
      }
      else
      {
         this.begin2();
      }
      this.skillObj.s1 = "sk_dfdf_k";
      this.skillObj.s2 = "sk_s_89b";
      this.skillObj.busrt_a = "sk_s_qianzai2";
      this.skillObj.busrt_d = "sk_s_3shenji2";
      this.skillObj.toAir = "sk0";
      this.record_skill_totalFrame = ["sk_s1","sk_s4","sk_s3"];
      this.comboClass = new Athena_Combo(this);
      this.preCheck();
      this.colorObj.fire_red1 = {ra:"100",rb:"255",ga:"100",gb:"80",ba:"100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.fire_red2 = {ra:"-100",rb:"255",ga:"-100",gb:"100",ba:"-100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.fire_blue1 = {ra:"100",rb:"0",ga:"100",gb:"0",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.fire_blue2 = {ra:"-100",rb:"178",ga:"-100",gb:"96",ba:"-100",bb:"239",aa:"100",ab:"0"};
      this.colorObj.ice1 = {ra:"-100",rb:"255",ga:"-50",gb:"255",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.purple1 = {ra:"-16",rb:"139",ga:"-21",gb:"97",ba:"-11",bb:"170",aa:"100",ab:"0"};
      this.colorObj.purple2 = {ra:"2",rb:"129",ga:"-24",gb:"110",ba:"-5",bb:"140",aa:"100",ab:"0"};
      this.colorObj.huoFeng1 = {ra:"100",rb:"255",ga:"100",gb:"0",ba:"100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.huoFeng2 = {ra:"100",rb:"55",ga:"100",gb:"0",ba:"100",bb:"0",aa:"100",ab:"0"};
   }
   function preCheck()
   {
      this.input_pre.roll_f = 10;
      this.input_pre.roll_b = 10;
      this.input_pre.land = 0;
      this.input_pre.land2 = 0;
      this.input_pre.land3 = 0;
      this.input_pre.land4 = 0;
      this.input_pre.sk4 = 24;
      this.input_pre.getup1 = 20;
      this.input_pre.getup2 = 20;
      this.input_pre.sk3_air = 34;
      this.input_pre.sk5_l = 10;
      this.input_pre.sk5 = 15;
      this.input_pre.sk3_l = 30;
   }
   function sk_wtf()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "athena_ball_wtf")
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_1 = "sk_wtf";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk_s_abcd0()
   {
      return false;
   }
   function kick_s1_fake()
   {
      if(this.status_2 == "air")
      {
         this.toSkill("sk_s_89b");
         this.checkSide_abs();
         if(this.inBurst == true && this.burst_mode == "power")
         {
            this.sk_s_89b_s();
         }
         else if(this.inBurst == true || this == _level0.P1_role && _level0.LP_P1.powerPoint_num > 0 || this == _level0.P2_role && _level0.LP_P2.powerPoint_num > 0)
         {
            this.sk_s_89b();
         }
         return undefined;
      }
      this.status_1 = "kick_s1";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function jairback()
   {
      if(this.status_1 == "jairback" || this.status_2 == "land")
      {
         return false;
      }
      this.status_1 = "jairback";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function jairback2()
   {
      if(this.status_1 == "jairback2" || this.status_2 == "land")
      {
         return false;
      }
      this.status_1 = "jairback2";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk0()
   {
      if(this.status_1 == "sk0")
      {
         return false;
      }
      this.checkSide_abs();
      this.status_1 = "sk0";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk0_l()
   {
      if(this.status_1 == "sk0_l")
      {
         return false;
      }
      this.checkSide_abs();
      this.status_1 = "sk0_l";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk_YTao()
   {
      this.status_1 = "sk_YTao";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk2_l_ai()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "Athena_fire3_light" && _loc3_[_loc2_].allowNum == 1)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_3 = "attack";
      this.gotoAndStop("sk2_l");
      this.status_1 = "sk2_l_ai";
   }
   function sk_YTao_h()
   {
      this.status_1 = "sk_YTao_h";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk2_l()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "Athena_fire3_light" && _loc3_[_loc2_].allowNum == 1)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_1 = "sk2_l";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk2()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "Athena_fire3" && _loc3_[_loc2_].allowNum == 1)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_1 = "sk2";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk3()
   {
      if(this.status_2 == "air")
      {
         this.checkSide_abs();
         this.status_1 = "sk3_air";
      }
      else
      {
         if(!(this.status_2 == "land" && this.status_1 != "sk3"))
         {
            return false;
         }
         this.status_1 = "sk3";
      }
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk3_l()
   {
      if(this.status_2 == "air")
      {
         this.checkSide_abs();
         this.status_1 = "sk3_l_air";
      }
      else
      {
         if(!(this.status_2 == "land" && this.status_1 != "sk3"))
         {
            return false;
         }
         this.status_1 = "sk3_l";
      }
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk3_l_air()
   {
      if(this.status_2 != "air")
      {
         return false;
      }
      this.checkSide_abs();
      this.status_1 = "sk3_l_air";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk3_air()
   {
      if(this.status_2 != "air")
      {
         return false;
      }
      this.checkSide_abs();
      this.status_1 = "sk3_air";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk4()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      if(this.opp.mc.catched)
      {
         this.toStatus("stand");
         return false;
      }
      this.status_3 = "attack";
      this.status_6 = "catch";
      this.status_1 = "sk4";
      this.gotoAndStop(this.status_1);
   }
   function sk5()
   {
      if(this.status_2 == "air")
      {
         this.status_1 = "sk5_air";
         this.checkSide_abs();
      }
      else if(this.status_2 == "land")
      {
         this.status_1 = "sk5";
      }
      this.status_3 = "attack";
      this.status_6 = "move";
      this.gotoAndStop(this.status_1);
   }
   function sk5_l()
   {
      if(this.status_2 == "air")
      {
         this.status_1 = "sk5_l_air";
         this.checkSide_abs();
      }
      else if(this.status_2 == "land")
      {
         this.status_1 = "sk5_l";
      }
      this.status_3 = "attack";
      this.status_6 = "move";
      this.gotoAndStop(this.status_1);
   }
   function sk5_l_air()
   {
      if(this.status_2 != "air")
      {
         return undefined;
      }
      this.status_1 = "sk5_l_air";
      this.checkSide_abs();
      this.status_6 = "move";
      this.gotoAndStop(this.status_1);
   }
   function sk5_air()
   {
      if(this.status_2 != "air")
      {
         return undefined;
      }
      this.status_1 = "sk5_air";
      this.checkSide_abs();
      this.status_6 = "move";
      this.gotoAndStop(this.status_1);
   }
   function sk_s_89b()
   {
      this.status_1 = "sk_s_89b";
      if(this.status_2 == "air")
      {
         this.checkSide_abs();
         this.status_1 = "sk_s_89b_air";
      }
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
      return true;
   }
   function sk_s_89b_s()
   {
      this.status_1 = "sk_s_89b_s";
      if(this.status_2 == "air")
      {
         this.status_1 = "sk_s_89b_s_air";
         this.checkSide_abs();
      }
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
      return true;
   }
   function sk_s3()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.checkSide_abs();
      this.status_3 = "attack";
      this.status_1 = "sk_s3";
      this.gotoAndStop(this.status_1);
   }
   function sk_s4()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.checkSide_abs();
      this.status_3 = "attack";
      this.status_1 = "sk_s4";
      this.gotoAndStop(this.status_1);
   }
   function sk_s_caihua0()
   {
      return false;
   }
   function sk_dfdf_k()
   {
      this.status_3 = "attack";
      if(this.status_2 == "air")
      {
         this.status_1 = "sk_dfdf_k_air";
         this.checkSide_abs();
      }
      else
      {
         this.status_1 = "sk_dfdf_k";
      }
      this.gotoAndStop(this.status_1);
   }
   function sk_dfdf_k_s()
   {
      this.status_3 = "attack";
      if(this.status_2 == "air")
      {
         this.status_1 = "sk_dfdf_k_s_air";
         this.checkSide_abs();
      }
      else
      {
         this.status_1 = "sk_dfdf_k_s";
      }
      this.gotoAndStop(this.status_1);
   }
   function sk_s_qianzai2()
   {
      this.status_3 = "attack";
      this.status_1 = "sk_s_qianzai2";
      this.checkSide_abs();
      this.gotoAndStop(this.status_1);
   }
   function b9b_ext()
   {
      this.mc.lh = false;
      this.status_3 = "attack";
      this.status_1 = "89b_ext";
      this.mc.gotoAndStop("s2");
   }
   function b9b_ext2()
   {
      this.mc.lh = true;
      this.status_3 = "attack";
      this.status_1 = "89b_ext";
      this.mc.gotoAndStop("s2");
   }
   function sk_s_abcd2()
   {
      this.status_3 = "attack";
      this.status_1 = "sk_s_abcd2";
      this.gotoAndStop(this.status_1);
   }
   function sk_s_abcd3()
   {
      this.status_3 = "attack";
      this.status_1 = "sk_s_abcd3";
      this.gotoAndStop(this.status_1);
   }
   function sk_huofeng()
   {
      if(this.inBurst)
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_1 = "sk_huofeng";
      this.gotoAndStop("sk_huofeng");
      return true;
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
         this.jumpSkill("kick");
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
      if(this.status_1 == "dash_b")
      {
         _loc2_ = "jairback";
         this.toSkill(_loc2_);
         return undefined;
      }
      if(this.status_1 == "jairback" && this.status_2 == "air")
      {
         if(Key.isDown(this.d))
         {
            _loc2_ = "jairback2";
            if(this._y == 445)
            {
               this.start_move_Y1(this.Vy * 2 / 3,this.Vx);
            }
            this.toSkill(_loc2_);
            return undefined;
         }
      }
      else if(this.status_1 == "jump_f" || this.status_1 == "jump" || this.status_1 == "jump_b" || this.status_1 == "jairback2")
      {
         if(Key.isDown(this.d))
         {
            _loc2_ = "jairback";
            if(this._y == 445)
            {
               this.start_move_Y1(this.Vy * 2 / 3,this.Vx);
            }
            this.toSkill(_loc2_);
            return undefined;
         }
         _loc2_ = "kick_l";
         this.jumpSkill(_loc2_);
         return undefined;
      }
      if(Key.isDown(this.d))
      {
         if(this.status_1 == "kick_s1")
         {
            _loc2_ = "jairback";
         }
         else
         {
            _loc2_ = "squatKick_l";
         }
      }
      else if(Key.isDown(this.f) && this.dir == 1)
      {
         _loc2_ = "kick_s1";
      }
      else if(Key.isDown(this.b) && this.dir == -1)
      {
         _loc2_ = "kick_s1";
      }
      else if((Key.isDown(this.b) && this.dir == 1 || Key.isDown(this.f) && this.dir == -1) && (this.status_1 == "squatPunch_l" || this.status_1 == "squatKick_l"))
      {
         _loc2_ = "sk3";
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
         this.jumpSkill("punch_l");
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
