class Kusanagi_role extends role_corn.Role
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
   var getObjs;
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
   var superList;
   var superMaxList;
   var toSkill;
   var winPoseArray;
   function Kusanagi_role()
   {
      super();
      this._roleName = "Kusanagi";
      this.scale = 100;
      this.Vwalk = 11;
      this.Vdash = 28;
      this.Vjump_x = 13;
      this.Vjump_y = 38;
      this.Vjump_far = 20;
      this.opp_width2 = 60;
      this.frameOffset = 2;
      this.superList = {sk31:1,sk_8z:1,sk_wuyan:1,sk_caihua_kyo0:1,sk_ou:1,sk_neww:1,skh:1,skh_l:1,sk_caihua_kyo1:1};
      this.burstList = {sk_s3:1,sk3:1,skzz:1};
      this.superMaxList = {sk29_s:1,sk31_s:1,sk_wuyan_s:1,sk_8z_s:1,sk_ou_s:1};
      this.skillSuperMapping = {sk_wuyan:"sk_wuyan_s",sk31:"sk31_s",sk_8z:"sk_8z_s",sk_ou:"sk_ou_s"};
      this.normalList2 = ["kick1","kick3","squatKick_s","squatKick_ss","jumpSkill_punch_s","airBack"];
      this.skillObj.s2 = "sk31";
      this.skillObj.s1 = "sk_wuyan";
      this.skillObj.busrt_a = "sk_s3";
      this.skillObj.busrt_d = "sk3";
      this.skillObj.toAir = "sk0";
      this.winPoseArray = ["end","end2"];
      this.record_skill_totalFrame = ["sk1_2","sk28"];
      this.comboClass = new Kusanagi_Combo(this);
      this.preCheck();
      this.colorObj.fire_red2 = {ra:"100",rb:"255",ga:"100",gb:"80",ba:"100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.fire_red1 = {ra:"-45",rb:"255",ga:"-100",gb:"200",ba:"-100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.fire_blue2 = {ra:"100",rb:"0",ga:"100",gb:"0",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.fire_blue1 = {ra:"-100",rb:"178",ga:"-100",gb:"96",ba:"-100",bb:"239",aa:"100",ab:"0"};
      this.colorObj.ice1 = {ra:"-100",rb:"255",ga:"-50",gb:"255",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.purple2 = {ra:"-16",rb:"139",ga:"-21",gb:"97",ba:"-11",bb:"170",aa:"100",ab:"0"};
      this.colorObj.purple1 = {ra:"2",rb:"129",ga:"-24",gb:"110",ba:"-5",bb:"140",aa:"100",ab:"0"};
   }
   function preCheck()
   {
      this.input_pre.roll_f = 10;
      this.input_pre.roll_b = 10;
      this.input_pre.land = 0;
      this.input_pre.land2 = 0;
   }
   function sk_fake()
   {
      return false;
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
   function kick1()
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
   function easych()
   {
      this.to_punch_l();
      return false;
   }
   function sk1_2()
   {
      this.status_1 = "sk1_2";
      this.mc.gotoAndPlay("s_2");
   }
   function skhh()
   {
      this.status_1 = "skhh";
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
   function sk31()
   {
      if(this.status_1 == "sk31")
      {
         return false;
      }
      if(this.status_2 == "air")
      {
         this.checkSide_abs();
         this.status_1 = "sk31_air";
      }
      else
      {
         this.status_1 = "sk31";
      }
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk_caihua_kyo0()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "skh";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk_caihua_kyo1()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "skh_l";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function skh()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "skh";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function skh_l()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "skh_l";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function skh_ai()
   {
      if(this == _level0.P1_role && _level0.LP_P1.powerPoint_num == 0 && !this.inBurst || this == _level0.P2_role && _level0.LP_P2.powerPoint_num == 0 && !this.inBurst)
      {
         return false;
      }
      this.powerDecType = "super";
      this.powerDec();
      this.status_3 = "attack";
      this.status_1 = "skh";
      this.gotoAndStop("skh");
      this.status_1 = "skh_ai";
      return true;
   }
   function skh_l_ai()
   {
      if(this == _level0.P1_role && _level0.LP_P1.powerPoint_num == 0 && !this.inBurst || this == _level0.P2_role && _level0.LP_P2.powerPoint_num == 0 && !this.inBurst)
      {
         return false;
      }
      this.powerDecType = "super";
      this.powerDec();
      this.status_3 = "attack";
      this.gotoAndStop("skh_l");
      this.status_1 = "skh_l_ai";
      return true;
   }
   function sk30_l()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "yangyan2" && _loc3_[_loc2_].allowNum == 1)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_1 = "sk30_l";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk30()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "yangyan" && _loc3_[_loc2_].allowNum == 1)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_1 = "sk30";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function squatKick_s_ai()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.gotoAndStop("squatKick_s");
      this.status_1 = "squatKick_s_ai";
   }
   function sk28()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      if(this.status_1 == "sk288" || this.status_1 == "skk28")
      {
         return false;
      }
      this.status_1 = "sk28";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk_neww()
   {
      return false;
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
         if(this.status_3 != "attack")
         {
            _loc2_ = "kick1";
         }
         else
         {
            _loc2_ = "kick3";
         }
      }
      else if(Key.isDown(this.b) && this.dir == -1)
      {
         if(this.status_3 != "attack")
         {
            _loc2_ = "kick1";
         }
         else
         {
            _loc2_ = "kick3";
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
