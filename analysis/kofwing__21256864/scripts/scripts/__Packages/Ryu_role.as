class Ryu_role extends role_corn.Role
{
   var Vdash;
   var Vjump_far;
   var Vjump_x;
   var Vjump_y;
   var Vwalk;
   var _roleName;
   var _x;
   var _y;
   var b;
   var burstList;
   var checkSide_abs;
   var colorObj;
   var comboClass;
   var d;
   var dir;
   var f;
   var getObjs;
   var gotoAndStop;
   var inBurst;
   var input_pre;
   var jumpSkill;
   var land_Y;
   var mode_key;
   var normalList2;
   var opp;
   var opp_width2;
   var pitch;
   var powerDec;
   var powerDecType;
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
   function Ryu_role()
   {
      super();
      this._roleName = "Ryu";
      this.scale = 100;
      this.Vwalk = 11;
      this.Vdash = 28;
      this.Vjump_x = 13;
      this.Vjump_y = 39;
      this.Vjump_far = 20;
      this.opp_width2 = 60;
      this.superList = {sk10:1,sk14:1,sk13:1};
      this.burstList = {sk_s_sys:1,sk_s_swms:1,sk_s_sys_air:1};
      this.superMaxList = {sk12:1,sk14_s:1,sk13_s:1};
      this.skillSuperMapping = {sk10:"sk12",sk14:"sk14_s",sk13:"sk13_s"};
      this.normalList2 = ["sk_d1","kick1","kick3","punch_s","punch_b"];
      this.skillObj.s1 = "sk10";
      this.skillObj.s2 = "sk14";
      this.skillObj.s3 = "sk13";
      this.skillObj.busrt_a = "sk_s_sys";
      this.skillObj.busrt_d = "sk_s_swms";
      this.skillObj.toAir = "sk3";
      this.skillObj.heavyHit = "heavyHit";
      this.skillObj.flyingObj = "sk1";
      this.comboClass = new Ryu_Combo(this);
      this.preCheck();
      this.colorObj.fire_red1 = {ra:"100",rb:"255",ga:"80",gb:"110",ba:"-100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.fire_red2 = {ra:"80",rb:"255",ga:"-80",gb:"255",ba:"-100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.fire_blue2 = {ra:"100",rb:"0",ga:"100",gb:"0",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.fire_blue1 = {ra:"-100",rb:"178",ga:"-100",gb:"96",ba:"-100",bb:"239",aa:"100",ab:"0"};
      this.colorObj.ice1 = {ra:"-100",rb:"255",ga:"-50",gb:"255",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.purple1 = {ra:"-16",rb:"139",ga:"-21",gb:"97",ba:"-11",bb:"170",aa:"100",ab:"0"};
      this.colorObj.purple2 = {ra:"2",rb:"129",ga:"-24",gb:"110",ba:"-5",bb:"140",aa:"100",ab:"0"};
   }
   function preCheck()
   {
      this.input_pre.roll_f = 10;
      this.input_pre.roll_b = 10;
      this.input_pre.land = 0;
      this.input_pre.land2 = 0;
      this.input_pre.kick1 = 9;
   }
   function getDis()
   {
      var _loc2_ = Math.abs(this._x - this.opp._x);
      if(isNaN(_loc2_))
      {
         _loc2_ = 60;
      }
      return _loc2_;
   }
   function getOwnerHeight()
   {
      var _loc2_ = Math.abs(this._y - this.land_Y);
      if(isNaN(_loc2_))
      {
         _loc2_ = 0;
      }
      if(this._y < 0)
      {
         _loc2_ = this.land_Y;
      }
      if(this.status_2 != "air")
      {
         _loc2_ = 0;
      }
      return _loc2_;
   }
   function getOppHeight()
   {
      var _loc2_ = Math.abs(this.opp._y - this.land_Y);
      if(isNaN(_loc2_))
      {
         _loc2_ = 0;
      }
      if(this._y < 0)
      {
         _loc2_ = this.land_Y;
      }
      if(this.opp.status_2 != "air")
      {
         _loc2_ = 0;
      }
      return _loc2_;
   }
   function kick1()
   {
      this.gotoAndStop("kick1");
      this.status_1 = "kick1";
      this.status_3 = "attack";
   }
   function kick2()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.gotoAndStop("kick2");
      this.status_1 = "kick2";
      this.status_3 = "attack";
   }
   function sk1()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "wave" && _loc3_[_loc2_].allowNum == 1)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_3 = "attack";
      this.status_1 = "sk1";
      this.gotoAndStop(this.status_1);
   }
   function sk1_l()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "wave_l" && _loc3_[_loc2_].allowNum == 1)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_3 = "attack";
      this.status_1 = "sk1_l";
      this.gotoAndStop(this.status_1);
   }
   function sk_d1()
   {
      this.status_1 = "sk_d1";
      this.gotoAndStop(this.status_1);
      this.status_3 = "attack";
   }
   function sk_bd_air()
   {
      this.status_3 = "attack";
      if(this.status_2 == "air")
      {
         this.status_1 = "sk_bd_air2";
         this.checkSide_abs();
      }
      else
      {
         this.status_1 = "sk_bd_air";
      }
      this.gotoAndStop(this.status_1);
   }
   function sk_bd_air_s()
   {
      this.status_3 = "attack";
      if(this.status_2 == "air")
      {
         this.status_1 = "sk_bd_air_s2";
         this.checkSide_abs();
      }
      else
      {
         this.status_1 = "sk_bd_air_s";
      }
      this.gotoAndStop(this.status_1);
   }
   function sk_s_sys_air_ai()
   {
      if(!this.inBurst || this.status_2 != "air")
      {
         return false;
      }
      this.status_1 = "sk_s_sys_air";
      this.status_3 = "attack";
      this.status_6 = "catch";
      this.checkSide_abs();
      this.powerDecType = "burst";
      this.powerDec();
      this.gotoAndStop(this.status_1);
   }
   function sk_s_sys()
   {
      if(!this.inBurst)
      {
         return false;
      }
      if(this.status_2 == "air")
      {
         this.status_1 = "sk_s_sys_air";
         this.status_3 = "attack";
         this.status_6 = "catchAir";
         this.checkSide_abs();
         this.powerDecType = "burst";
         this.powerDec();
      }
      else
      {
         this.status_1 = "sk_s_sys";
         this.status_3 = "attack";
         this.status_6 = "catch";
      }
      this.gotoAndStop(this.status_1);
   }
   function sk_SKF()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk_SKF";
      this.status_3 = "attack";
      this.status_6 = "move";
      this.gotoAndStop(this.status_1);
   }
   function sk_SKB()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk_SKB";
      this.status_3 = "attack";
      this.status_6 = "move";
      this.gotoAndStop(this.status_1);
   }
   function punch2()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "punch2";
      this.gotoAndStop(this.status_1);
      this.status_3 = "attack";
   }
   function heavyHit()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "heavyHit";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk_bodong_air()
   {
      if(this.status_2 == "air")
      {
         this.checkSide_abs();
         this.sk_bodong_air2();
         return undefined;
      }
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk_bodong_air";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk_bodong_air2()
   {
      this.status_1 = "sk_bodong_air2";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function kick3()
   {
      this.status_1 = "kick3";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
      if(_root.role_mc.mc.hitPos != "down")
      {
         _root.role_mc.mc.hitPos = "down";
      }
   }
   function sk2()
   {
      if(this.status_2 == "air")
      {
         this.checkSide_abs();
         this.sk4();
         return undefined;
      }
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk2";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk2_l()
   {
      if(this.status_2 == "air")
      {
         this.checkSide_abs();
         this.sk4();
         return undefined;
      }
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk2_l";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk4()
   {
      this.status_1 = "sk4";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk10()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk10";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk13()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk13";
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
         if(Key.isDown(this.d) && this.status_1 == "jump_f" && this._y < 440)
         {
            this.toSkill("sk_d1");
            return undefined;
         }
         _loc2_ = "kick_l";
         this.jumpSkill(_loc2_);
         return undefined;
      }
      if(this.status_1 == "dash_f")
      {
         _loc2_ = "kick1";
      }
      else if(Key.isDown(this.d))
      {
         _loc2_ = "squatKick_l";
      }
      else if(Key.isDown(this.f) && this.dir == 1 && this.status_2 == "land")
      {
         _loc2_ = "kick1";
      }
      else if(Key.isDown(this.b) && this.dir == -1 && this.status_2 == "land")
      {
         _loc2_ = "kick1";
      }
      else if(this.mode_key == "easy")
      {
         _loc2_ = this.skillObj.s2;
      }
      else
      {
         _loc2_ = "kick_l";
      }
      if(Key.isDown(this.d) && this.status_2 == "land")
      {
         if(Key.isDown(this.f) && this.dir == 1)
         {
            _loc2_ = "kick3";
         }
         else if(Key.isDown(this.b) && this.dir == -1)
         {
            _loc2_ = "kick3";
         }
         else
         {
            _loc2_ = "squatKick_l";
         }
      }
      else if(this.status_1 == "dash_f")
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
      if(Key.isDown(this.d))
      {
         _loc2_ = "squatPunch";
      }
      else if(this.status_1 == "dash_f")
      {
         _loc2_ = "punch";
      }
      else if(Key.isDown(this.b) && this.dir == 1 || Key.isDown(this.f) && this.dir == -1)
      {
         _loc2_ = "punch_b";
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
      else if(Key.isDown(this.f) && this.dir == 1)
      {
         _loc2_ = "punch_s";
      }
      else if(Key.isDown(this.b) && this.dir == -1)
      {
         _loc2_ = "punch_s";
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
