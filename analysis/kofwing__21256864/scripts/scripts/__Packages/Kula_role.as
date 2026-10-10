class Kula_role extends role_corn.Role
{
   var Vdash;
   var Vjump_far;
   var Vjump_x;
   var Vjump_y;
   var Vwalk;
   var _roleName;
   var b;
   var burstList;
   var colorObj;
   var comboClass;
   var d;
   var dir;
   var f;
   var gotoAndStop;
   var inBurst;
   var input_pre;
   var jumpSkill;
   var mode_key;
   var normalList2;
   var opp;
   var opp_width2;
   var pitch;
   var powerDec;
   var powerDecType;
   var roleMode;
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
   var toStatus;
   var winPoseArray;
   function Kula_role()
   {
      super();
      this._roleName = "Kula";
      this.scale = 100;
      this.Vwalk = 11;
      this.Vdash = 27;
      this.Vjump_x = 13;
      this.Vjump_y = 37;
      this.Vjump_far = 20;
      this.opp_width2 = 60;
      this.superList = {sk_s_bingren:1,sk_s_luanwu:1,sk_tibing:1};
      this.burstList = {sk_s_xingchen:1,sk_s_jiejie:1};
      this.superMaxList = {sk_s_bingren_s:1,sk_s_luanwu_s:1,sk_tibing_s:1};
      this.skillSuperMapping = {sk_s_bingren:"sk_s_bingren_s",sk_s_luanwu:"sk_s_luanwu_s",sk_tibing:"sk_tibing_s"};
      this.normalList2 = ["punch_s1","sk_huaxing"];
      this.winPoseArray = ["end","end2"];
      this.skillObj.s1 = "sk_s_bingren";
      this.skillObj.s2 = "sk_s_luanwu";
      this.skillObj.s3 = "sk_tibing";
      this.skillObj.busrt_a = "sk_s_xingchen";
      this.skillObj.busrt_d = "sk_s_jiejie";
      this.skillObj.toAir = "sk_fdfp";
      this.comboClass = new Kula_Combo(this);
      this.preCheck();
      this.colorObj.fire_red1 = {ra:"100",rb:"255",ga:"100",gb:"110",ba:"100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.fire_red2 = {ra:"100",rb:"255",ga:"100",gb:"210",ba:"100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.fire_blue1 = {ra:"100",rb:"0",ga:"100",gb:"0",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.fire_blue2 = {ra:"100",rb:"-100",ga:"100",gb:"-50",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.ice1 = {ra:"-100",rb:"255",ga:"-50",gb:"255",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.ice2 = {ra:"0",rb:"200",ga:"75",gb:"200",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.purple1 = {ra:"-16",rb:"139",ga:"-21",gb:"97",ba:"-11",bb:"170",aa:"100",ab:"0"};
      this.colorObj.purple2 = {ra:"2",rb:"129",ga:"-24",gb:"110",ba:"-5",bb:"140",aa:"100",ab:"0"};
   }
   function preCheck()
   {
      this.input_pre.roll_f = 10;
      this.input_pre.roll_b = 10;
      this.input_pre.land = 0;
      this.input_pre.land2 = 0;
      this.input_pre.sk_dfp = 25;
      this.input_pre.sk_dfpl = 17;
   }
   function sk_dfp_s2()
   {
   }
   function sk_dfp_s3()
   {
   }
   function sk_dongjie()
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
      this.status_1 = "sk_dongjie";
      this.gotoAndStop(this.status_1);
      return true;
   }
   function sk_s_luobing()
   {
      if(this.status_2 == "air")
      {
         this.status_1 = "sk_lacachora";
         this.status_3 = "attack";
         this.status_6 = "catch";
         this.gotoAndStop(this.status_1);
         return undefined;
      }
      this.status_1 = "sk_s_luobing";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
      return undefined;
   }
   function sk_lacachora_ai()
   {
      if(this == _level0.P1_role && _level0.LP_P1.powerPoint_num == 0 && !this.inBurst || this == _level0.P2_role && _level0.LP_P2.powerPoint_num == 0 && !this.inBurst)
      {
         return false;
      }
      this.powerDecType = "super";
      this.powerDec();
      this.status_1 = "sk_lacachora";
      this.status_3 = "attack";
      this.status_6 = "catch";
      this.gotoAndStop(this.status_1);
   }
   function sk_s_luobing_s()
   {
      if(this.status_2 == "air")
      {
         this.status_1 = "sk_lacachora";
         this.status_3 = "attack";
         this.status_6 = "catch";
         this.gotoAndStop(this.status_1);
         return undefined;
      }
      this.status_1 = "sk_s_luobing_s";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
      return undefined;
   }
   function sk_flyKick()
   {
      if(this.status_2 == "air")
      {
         this.status_1 = "sk_flyKick";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
         return undefined;
      }
      this.status_1 = "sk_flyKick";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function kick4()
   {
      if(this.status_2 == "air")
      {
         this.sk_ZSSJ2();
         return undefined;
      }
      if(this.status_2 == "land" && this.roleMode == 2)
      {
         this.status_1 = "sk_tibing1";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
         return undefined;
      }
      this.status_1 = "kick_l";
      this.gotoAndStop(this.status_1);
      this.status_3 = "attack";
   }
   function kick5()
   {
      if(this.status_2 == "air")
      {
         this.sk_ZSSJ();
         return undefined;
      }
      if(this.status_2 == "land" && this.roleMode == 2)
      {
         this.status_1 = "sk_tibing2";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
         return undefined;
      }
      this.status_1 = "kick";
      this.gotoAndStop(this.status_1);
      this.status_3 = "attack";
   }
   function sk_ZSSJ()
   {
      this.status_1 = "sk_ZSSJ";
      this.gotoAndStop(this.status_1);
      this.status_3 = "attack";
   }
   function sk_ZSSJ2()
   {
      this.status_1 = "sk_ZSSJ2";
      this.gotoAndStop(this.status_1);
      this.status_3 = "attack";
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
         if(Key.isDown(this.f) && this.dir == 1)
         {
            _loc2_ = "sk_bingdian";
         }
         else if(Key.isDown(this.b) && this.dir == -1)
         {
            _loc2_ = "sk_bingdian";
         }
         else
         {
            _loc2_ = "squatPunch";
         }
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
      else if(Key.isDown(this.f) && this.dir == 1)
      {
         _loc2_ = "punch_s1";
      }
      else if(Key.isDown(this.b) && this.dir == -1)
      {
         _loc2_ = "punch_s1";
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
