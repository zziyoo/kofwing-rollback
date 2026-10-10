class KyoW_role extends role_corn.Role
{
   var Vdash;
   var Vjump_far;
   var Vjump_x;
   var Vjump_y;
   var Vwalk;
   var _roleName;
   var b;
   var burstList;
   var checkSide_abs;
   var colorObj;
   var comboClass;
   var d;
   var dir;
   var f;
   var frameOffset;
   var gotoAndStop;
   var inBurst;
   var input_pre;
   var jumpSkill;
   var mc;
   var mode_key;
   var normalList2;
   var opp_width2;
   var pitch;
   var powerDec;
   var powerDecType;
   var record_skill_totalFrame;
   var scale;
   var skillObj;
   var skillSuperMapping;
   var status_1;
   var status_2;
   var status_3;
   var status_6;
   var superList;
   var superMaxList;
   var toSkill;
   var winPoseArray;
   function KyoW_role()
   {
      super();
      this._roleName = "KyoW";
      this.scale = 100;
      this.Vwalk = 10;
      this.Vdash = 27;
      this.Vjump_x = 13;
      this.Vjump_y = 38;
      this.Vjump_far = 20;
      this.opp_width2 = 60;
      this.frameOffset = 2;
      this.superList = {sk29:1,sk31:1,sk31_air:1,sk_624a:1,sk_wushi:1,sk_zhuoyan_ai:1};
      this.burstList = {sk_10punch:1,sk_shenchen:1};
      this.superMaxList = {sk29_s:1,sk31_s:1,sk_zhuoyan_s:1,sk_zhuoyan_ai_s:1};
      this.skillSuperMapping = {sk29:"sk29_s",sk31:"sk31_s",sk_624a:"sk_624a",sk_zhuoyan_ai:"sk_zhuoyan_ai_s"};
      this.normalList2 = ["jumpSkill_punch_s","squatKick_s","kick1","kick3","airBack"];
      this.skillObj.s1 = "sk29";
      this.skillObj.s2 = "sk31";
      this.skillObj.busrt_a = "sk_10punch";
      this.skillObj.busrt_d = "sk_shenchen";
      this.skillObj.toAir = "sk0";
      this.winPoseArray = ["end","end3","end4","end5"];
      this.record_skill_totalFrame = ["sk1_2","sk28"];
      this.comboClass = new KyoW_Combo(this);
      this.preCheck();
      this.colorObj.fire_red2 = {ra:"100",rb:"255",ga:"100",gb:"80",ba:"100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.fire_red1 = {ra:"-100",rb:"255",ga:"-100",gb:"100",ba:"-100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.fire_blue2 = {ra:"100",rb:"0",ga:"100",gb:"0",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.fire_blue1 = {ra:"-100",rb:"178",ga:"-100",gb:"96",ba:"-100",bb:"239",aa:"100",ab:"0"};
      this.colorObj.ice1 = {ra:"-100",rb:"255",ga:"-50",gb:"255",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.purple1 = {ra:"-16",rb:"139",ga:"-21",gb:"97",ba:"-11",bb:"170",aa:"100",ab:"0"};
      this.colorObj.purple2 = {ra:"2",rb:"129",ga:"-24",gb:"110",ba:"-5",bb:"140",aa:"100",ab:"0"};
      this.colorObj.kyoEX = {ra:"70",rb:"190",ga:"70",gb:"120",ba:"100",bb:"0",aa:"100",ab:"0"};
   }
   function preCheck()
   {
      this.input_pre.roll_f = 10;
      this.input_pre.roll_b = 10;
      this.input_pre.land = 0;
      this.input_pre.land2 = 0;
   }
   function kick3()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      if(this.status_3 == "attack")
      {
         this.status_1 = "kick3";
      }
      else
      {
         this.status_1 = "kick1";
      }
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function airBack()
   {
      if(this.status_2 != "air")
      {
         return false;
      }
      this.status_1 = "airBack";
      this.status_3 = "attack";
      this.gotoAndStop("airBack");
   }
   function sk_shenchen()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_6 = "catch";
      this.status_1 = "sk_shenchen";
      this.gotoAndStop(this.status_1);
   }
   function sk_wushi()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      if(this.inBurst)
      {
         this.status_3 = "attack";
         this.status_1 = "sk_wushi2";
         this.gotoAndStop("sk_wushi2");
         return true;
      }
      if(this == _level0.P1_role && _level0.LP_P1.powerPoint_num < 2 || this == _level0.P2_role && _level0.LP_P2.powerPoint_num < 2)
      {
         return false;
      }
      this.powerDecType = "super";
      this.powerDec();
      this.powerDecType = "super";
      this.powerDec();
      this.status_3 = "attack";
      this.status_1 = "sk_wushi";
      this.gotoAndStop("sk_wushi");
      return true;
   }
   function sk1_2()
   {
      this.status_1 = "sk1_2";
      this.mc.gotoAndPlay("s_2");
   }
   function sk2()
   {
      if(this.status_2 != "land")
      {
         this.status_1 = "sk2_air";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
         return undefined;
      }
      this.status_1 = "sk2";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk2_h()
   {
      if(this.status_2 != "land")
      {
         this.status_1 = "sk2_h_air";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
         return undefined;
      }
      this.status_1 = "sk2_h";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk32()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk32";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk17_ai()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk17_ai";
      this.status_3 = "attack";
      this.gotoAndStop("sk17");
   }
   function sk15_ai()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.gotoAndStop("sk15");
      this.status_1 = "sk15_ai";
   }
   function sk15_air()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.gotoAndStop("sk15");
      this.status_1 = "sk15_air";
   }
   function sk16_ai()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.gotoAndStop("sk16");
      this.status_1 = "sk16_ai";
   }
   function sk28_ai()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.gotoAndStop("sk28");
      this.status_1 = "sk28_ai";
   }
   function sk3()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk3";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk31()
   {
      if(this.status_1 == "sk31")
      {
         return false;
      }
      if(this.status_2 == "air")
      {
         this.status_1 = "sk31_air";
         this.checkSide_abs();
      }
      else
      {
         this.status_1 = "sk31";
      }
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk34()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk34";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk_hezhai()
   {
      return false;
   }
   function sk_624a()
   {
      return false;
   }
   function sk_zhuoyan_ai()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk_zhuoyan";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
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
         if(Key.isDown(this.f) && this.dir == 1)
         {
            _loc2_ = "squatKick_s";
         }
         else if(Key.isDown(this.b) && this.dir == -1)
         {
            _loc2_ = "squatKick_s";
         }
         else
         {
            _loc2_ = "squatKick";
         }
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
         if(Key.isDown(this.d) && this.mode_key == "easy")
         {
            _loc2_ = "sk31";
            this.toSkill(_loc2_);
            return undefined;
         }
         this.jumpSkill("kick_l");
         return undefined;
      }
      if(Key.isDown(this.d))
      {
         _loc2_ = "squatKick_l";
      }
      else if(Key.isDown(this.f) && this.dir == 1)
      {
         if(this.status_3 == "attack")
         {
            _loc2_ = "kick3";
         }
         else
         {
            _loc2_ = "kick1";
         }
      }
      else if(Key.isDown(this.b) && this.dir == -1)
      {
         if(this.status_3 == "attack")
         {
            _loc2_ = "kick3";
         }
         else
         {
            _loc2_ = "kick1";
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
         if(Key.isDown(this.d))
         {
            this.jumpSkill("punch_s");
         }
         else
         {
            this.jumpSkill("punch");
         }
         return undefined;
      }
      if(Key.isDown(this.d) && this.status_1 == "dash_b")
      {
         _loc2_ = "airBack";
      }
      else if(Key.isDown(this.d))
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
         if(this.status_1 == "sk14_deriv" && this.mode_key == "easy")
         {
            _loc2_ = "sk_624a";
         }
         else
         {
            _loc2_ = "squatPunch_l";
         }
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
