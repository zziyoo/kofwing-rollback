class Type2_Orochi_role extends Orochi_role
{
   var Vdash;
   var Vjump_far;
   var Vjump_x;
   var Vjump_y;
   var Vwalk;
   var _roleName;
   var b;
   var begin;
   var burstList;
   var colorObj;
   var comboClass;
   var d;
   var dir;
   var f;
   var getObjs;
   var gotoAndStop;
   var input_pre;
   var jumpSkill;
   var mode_key;
   var opp_width2;
   var pitch;
   var roleMode;
   var scale;
   var skillObj;
   var skillSuperMapping;
   var skill_mc;
   var status_1;
   var status_2;
   var status_3;
   var status_6;
   var superList;
   var superMaxList;
   var toSkill;
   var winPoseArray;
   function Type2_Orochi_role()
   {
      super();
      this.roleMode = 2;
      this._roleName = "Mizuchi";
      this.scale = 100;
      this.Vwalk = 8;
      this.Vdash = 29;
      this.Vjump_x = 13;
      this.Vjump_y = 39;
      this.Vjump_far = 20;
      this.opp_width2 = 60;
      this.superList = {sk_s_zhuanpan:1,sk_s_lunhui:1,sk_s_zhuanpan2:1,sk_dfdfk:1};
      this.burstList = {sk_s_jiguang:1,sk_s_sanhua:1};
      this.superMaxList = {sk_s_lunhui_s:1,sk_s_zhuanpan_s:1,sk_dfdfk_s:1};
      this.skillSuperMapping = {sk_s_lunhui:"sk_s_lunhui_s",sk_s_zhuanpan:"sk_s_zhuanpan_s",sk_s_zhuanpan2:"sk_s_zhuanpan22",sk_dfdfk:"sk_dfdfk_s"};
      this.begin();
      this.skillObj.s1 = "sk_s_zhuanpan";
      this.skillObj.s2 = "sk_s_lunhui";
      this.skillObj.s3 = "sk_s_zhuanpan2";
      this.skillObj.busrt_a = "sk_s_jiguang";
      this.skillObj.busrt_d = "sk_s_sanhua";
      this.winPoseArray = ["end-M1","end-M2"];
      this.comboClass = new Orochi_Combo(this);
      this.comboClass.combo2.kick2 = 8;
      this.comboClass.combo2.punch = 15;
      this.comboClass.combo2.heavyHit = 11;
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
      this.input_pre.land3 = 0;
      this.input_pre.sk_fdbp = 20;
      this.input_pre.sk_fdbpl = 20;
      this.input_pre.sk_fdbk = 20;
      this.input_pre.sk_fdbkl = 20;
   }
   function sk_dbp2()
   {
      var _loc3_;
      var _loc2_;
      if(this.status_2 != "land")
      {
         this.status_1 = "backcd";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
      }
      else
      {
         _loc3_ = this.getObjs();
         _loc2_ = 0;
         while(_loc2_ < _loc3_.length)
         {
            if(_loc3_[_loc2_].objName == "sk_chilun1" && _loc3_[_loc2_].allowNum == 1)
            {
               return false;
            }
            _loc2_ = _loc2_ + 1;
         }
         this.status_1 = "sk_dbp2";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
      }
   }
   function sk_dbp2_l()
   {
      var _loc3_;
      var _loc2_;
      if(this.status_2 != "land")
      {
         this.status_1 = "backcd";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
      }
      else
      {
         _loc3_ = this.getObjs();
         _loc2_ = 0;
         while(_loc2_ < _loc3_.length)
         {
            if(_loc3_[_loc2_].objName == "sk_chilun1" && _loc3_[_loc2_].allowNum == 1)
            {
               return false;
            }
            _loc2_ = _loc2_ + 1;
         }
         this.status_1 = "sk_dbp2_l";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
      }
   }
   function sk_dfp2()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "flying_s1" && _loc3_[_loc2_].allowNum == 1)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_3 = "attack";
      this.status_1 = "sk_dfp2";
      this.gotoAndStop(this.status_1);
   }
   function sk_dfp2_l()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "flying_s1_l" && _loc3_[_loc2_].allowNum == 1)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_3 = "attack";
      this.status_1 = "sk_dfp2_l";
      this.gotoAndStop(this.status_1);
   }
   function sk_dbp_cpu()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      if(this.skill_mc && this.skill_mc.objName == "flying_s1" && this.skill_mc.allowNum == 1)
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_1 = "sk_dbp_cpu";
      this.gotoAndStop(this.status_1);
   }
   function sk_dbp_ex()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_1 = "sk_dbp_ex";
      this.gotoAndStop(this.status_1);
   }
   function sk_dbp_l_ex()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_1 = "sk_dbp_l_ex";
      this.gotoAndStop(this.status_1);
   }
   function sk_bdfk()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_6 = "catch";
      this.status_1 = "sk_bdfk";
      this.gotoAndStop(this.status_1);
   }
   function sk_dfdfk()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_6 = "catch";
      this.status_1 = "sk_dfdfk";
      this.gotoAndStop(this.status_1);
   }
   function sk_dfdfk_s()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_6 = "catch";
      this.status_1 = "sk_dfdfk_s";
      this.gotoAndStop(this.status_1);
   }
   function sk_shiyue0()
   {
      this.to_kick();
   }
   function sk_shiyue0_l()
   {
      this.to_kick_l();
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
         _loc2_ = "kick_l";
         this.jumpSkill(_loc2_);
         return undefined;
      }
      if(Key.isDown(this.d))
      {
         _loc2_ = "squatKick_l";
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
