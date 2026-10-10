class CKrizalid_role extends role_corn.Role
{
   var Vdash;
   var Vjump_far;
   var Vjump_x;
   var Vjump_y;
   var Vwalk;
   var _roleName;
   var _y;
   var b;
   var begin;
   var begin2;
   var checkSide_abs;
   var colorObj;
   var comboClass;
   var d;
   var dir;
   var f;
   var getObjs;
   var gotoAndStop;
   var input_pre;
   var jumpSkill;
   var opp_width2;
   var pitch;
   var powerNum;
   var scale;
   var status_1;
   var status_2;
   var status_3;
   var toSkill;
   var winPoseArray;
   function CKrizalid_role()
   {
      super();
      this._roleName = "CKrizalid";
      this.scale = 100;
      this.Vwalk = 9;
      this.Vdash = 26;
      this.Vjump_x = 13;
      this.powerNum = 2;
      this.Vjump_y = 39;
      this.Vjump_far = 18;
      this.opp_width2 = 60;
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
      this.comboClass = new CKrizalid_Combo(this);
      this.preCheck();
      this.colorObj.fire_red2 = {ra:"100",rb:"255",ga:"100",gb:"80",ba:"100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.fire_red1 = {ra:"-45",rb:"255",ga:"-100",gb:"200",ba:"-100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.fire_blue2 = {ra:"100",rb:"0",ga:"100",gb:"0",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.fire_blue1 = {ra:"-100",rb:"178",ga:"-100",gb:"96",ba:"-100",bb:"239",aa:"100",ab:"0"};
      this.colorObj.ice1 = {ra:"-100",rb:"255",ga:"-50",gb:"255",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.purple2 = {ra:"-16",rb:"139",ga:"-21",gb:"97",ba:"-11",bb:"170",aa:"100",ab:"0"};
      this.colorObj.purple1 = {ra:"2",rb:"129",ga:"-24",gb:"110",ba:"-5",bb:"140",aa:"100",ab:"0"};
      this.colorObj.armor1 = {ra:"80",rb:"200",ga:"80",gb:"160",ba:"100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.att1 = {ra:"100",rb:"180",ga:"100",gb:"50",ba:"100",bb:"0",aa:"100",ab:"0"};
   }
   function preCheck()
   {
      this.input_pre.roll_f = 15;
      this.input_pre.roll_b = 15;
      this.input_pre.land = 0;
      this.input_pre.land2 = 0;
      this.input_pre.df_pl = 21;
      this.input_pre.df_ph = 21;
      this.input_pre.df_kl = 16;
      this.input_pre.df_kh = 16;
   }
   function df_pl()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "ck_bo_l" && _loc3_[_loc2_].allowNum == 1)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_1 = "df_pl";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function df_ph()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "ck_bo_h" && _loc3_[_loc2_].allowNum == 1)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_1 = "df_ph";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function df_kl()
   {
      if(this.status_2 != "air")
      {
         this.to_kick_l();
         return false;
      }
      this.status_1 = "df_kl";
      this.status_3 = "attack";
      this.checkSide_abs();
      if(this._y > 380)
      {
         this._y = 380;
      }
      this.gotoAndStop(this.status_1);
   }
   function df_kh()
   {
      if(this.status_2 != "air")
      {
         this.to_kick();
         return false;
      }
      this.status_1 = "df_kh";
      this.status_3 = "attack";
      this.checkSide_abs();
      if(this._y > 380)
      {
         this._y = 380;
      }
      this.gotoAndStop(this.status_1);
   }
   function to_kick()
   {
      var _loc2_;
      if(this.status_1 == "jump_f" || this.status_1 == "jump_far" || this.status_1 == "jump" || this.status_1 == "jump_b")
      {
         if(Key.isDown(this.d))
         {
            this.jumpSkill("kick_d");
         }
         else
         {
            this.jumpSkill("kick");
         }
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
      else
      {
         _loc2_ = "punch_l";
      }
      this.toSkill(_loc2_);
   }
}
