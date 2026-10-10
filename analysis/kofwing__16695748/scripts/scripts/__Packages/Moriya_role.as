class Moriya_role extends role_corn.Role
{
   var Vdash;
   var Vjump_far;
   var Vjump_x;
   var Vjump_y;
   var Vwalk;
   var _roleName;
   var _y;
   var b;
   var burstList;
   var colorObj;
   var comboClass;
   var d;
   var dir;
   var f;
   var gotoAndStop;
   var input_pre;
   var jumpSkill;
   var land_Y;
   var mode_key;
   var normalList2;
   var opp;
   var opp_width2;
   var pitch;
   var scale;
   var skillObj;
   var skillSuperMapping;
   var status_1;
   var status_2;
   var status_3;
   var status_6;
   var stop_move_Y1;
   var superList;
   var superMaxList;
   var toSkill;
   var winPoseArray;
   function Moriya_role()
   {
      super();
      this._roleName = "Moriya";
      this.scale = 100;
      this.Vwalk = 11;
      this.Vdash = 28;
      this.Vjump_x = 13;
      this.Vjump_y = 39;
      this.Vjump_far = 20;
      this.opp_width2 = 60;
      this.superList = {sk_s1:1,sk_s2:1};
      this.burstList = {sk_s3:1,sk_s4:1};
      this.superMaxList = {sk_s1_s:1,sk_s2_s:1};
      this.skillSuperMapping = {sk_s1:"sk_s1_s",sk_s2:"sk_s2_s"};
      this.winPoseArray = ["end"];
      this.skillObj.s1 = "sk_s1";
      this.skillObj.s2 = "sk_s2";
      this.skillObj.busrt_a = "sk_s3";
      this.skillObj.busrt_d = "sk_s4";
      this.skillObj.toAir = "sk_xinyue2";
      this.normalList2 = ["df_p","punch3","punch3c"];
      this.comboClass = new Moriya_Combo(this);
      this.preCheck();
      this.colorObj.fire_red1 = {ra:"100",rb:"255",ga:"100",gb:"110",ba:"100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.fire_red2 = {ra:"100",rb:"255",ga:"100",gb:"210",ba:"100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.fire_blue1 = {ra:"100",rb:"0",ga:"100",gb:"0",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.fire_blue2 = {ra:"100",rb:"-100",ga:"100",gb:"-50",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.ice1 = {ra:"-100",rb:"255",ga:"-50",gb:"255",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.purple1 = {ra:"-16",rb:"139",ga:"-21",gb:"97",ba:"-11",bb:"170",aa:"100",ab:"0"};
      this.colorObj.purple2 = {ra:"2",rb:"129",ga:"-24",gb:"110",ba:"-5",bb:"140",aa:"100",ab:"0"};
      this.colorObj.white1 = {ra:"100",rb:"50",ga:"100",gb:"50",ba:"100",bb:"50",aa:"100",ab:"50"};
      this.colorObj.white2 = {ra:"100",rb:"100",ga:"100",gb:"100",ba:"100",bb:"100",aa:"100",ab:"100"};
      this.colorObj.golden1 = {ra:"100",rb:"75",ga:"80",gb:"50",ba:"100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.golden2 = {ra:"100",rb:"150",ga:"90",gb:"100",ba:"100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.red1 = {ra:"100",rb:"30",ga:"100",gb:"0",ba:"100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.red2 = {ra:"100",rb:"60",ga:"100",gb:"0",ba:"100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.armor1 = {ra:"80",rb:"200",ga:"80",gb:"160",ba:"100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.att1 = {ra:"100",rb:"180",ga:"100",gb:"50",ba:"100",bb:"0",aa:"100",ab:"0"};
   }
   function preCheck()
   {
      this.input_pre.roll_f = 10;
      this.input_pre.roll_b = 10;
      this.input_pre.land = 0;
      this.input_pre.land2 = 0;
      this.input_pre.land2 = 0;
      this.input_pre.sk_buyue1 = 3;
      this.input_pre.sk_buyue2 = 3;
      this.input_pre.sk_buyue3 = 3;
      this.input_pre.sk_buyue_s1 = 3;
      this.input_pre.sk_buyue_s2 = 3;
      this.input_pre.sk_buyue_s3 = 3;
   }
   function sk_shenwei()
   {
      if(this._y != this.land_Y)
      {
         return false;
      }
      this._y = this.land_Y;
      this.stop_move_Y1("none");
      this.status_1 = "sk_shenwei";
      this.status_2 = "land";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk_yuedu1()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk_yuedu1";
      this.status_3 = "attack";
      this.status_6 = "atemi";
      this.gotoAndStop(this.status_1);
   }
   function sk_yuedu2()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk_yuedu2";
      this.status_3 = "attack";
      this.status_6 = "atemi";
      this.gotoAndStop(this.status_1);
   }
   function sk_buyue1()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk_buyue1";
      this.status_3 = "attack";
      this.status_6 = "move";
      this.gotoAndStop(this.status_1);
   }
   function sk_yueying_a2_ai()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.gotoAndStop("sk_yueying_a2");
      this.status_1 = "sk_yueying_a2_ai";
   }
   function sk_buyue2()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk_buyue2";
      this.status_3 = "attack";
      this.status_6 = "move";
      this.gotoAndStop(this.status_1);
   }
   function sk_buyue3()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk_buyue3";
      this.status_3 = "attack";
      this.status_6 = "move";
      this.gotoAndStop(this.status_1);
   }
   function sk_nadao_l()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk_nadao";
      this.status_3 = "attack";
      this.status_6 = "move";
      this.gotoAndStop(this.status_1);
   }
   function sk_nadao()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk_nadao";
      this.status_3 = "attack";
      this.status_6 = "move";
      this.gotoAndStop(this.status_1);
   }
   function sk_nadao2_l()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk_nadao2";
      this.status_3 = "attack";
      this.status_6 = "move";
      this.gotoAndStop(this.status_1);
   }
   function sk_nadao2()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk_nadao2";
      this.status_3 = "attack";
      this.status_6 = "move";
      this.gotoAndStop(this.status_1);
   }
   function sk_buyue_s1()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk_buyue_s1";
      this.status_3 = "attack";
      this.status_6 = "move";
      this.gotoAndStop(this.status_1);
   }
   function sk_buyue_s2()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk_buyue_s2";
      this.status_3 = "attack";
      this.status_6 = "move";
      this.gotoAndStop(this.status_1);
   }
   function sk_buyue_s3()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_1 = "sk_buyue_s3";
      this.status_3 = "attack";
      this.status_6 = "move";
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
         if(this.dir == 1 && Key.isDown(this.b) || this.dir == -1 && Key.isDown(this.f))
         {
            _loc2_ = "kick_l";
         }
         else
         {
            _loc2_ = this.skillObj.s2;
         }
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
            _loc2_ = "df_p";
         }
         else if(Key.isDown(this.b) && this.dir == -1)
         {
            _loc2_ = "df_p";
         }
         else
         {
            _loc2_ = "squatPunch";
         }
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
         if(Key.isDown(this.f) && this.dir == 1 && this.opp.status_3 == "down")
         {
            _loc2_ = "punch4";
         }
         else if(Key.isDown(this.b) && this.dir == -1 && this.opp.status_3 == "down")
         {
            _loc2_ = "punch4";
         }
         else
         {
            _loc2_ = "squatPunch_l";
         }
      }
      else if(Key.isDown(this.f) && this.dir == 1 || Key.isDown(this.b) && this.dir == -1)
      {
         if(this.status_3 == "attack")
         {
            _loc2_ = "punch3c";
         }
         else
         {
            _loc2_ = "punch3";
         }
      }
      else if(this.status_1 == "dash_f")
      {
         _loc2_ = "punch3";
      }
      else if(this.mode_key == "easy")
      {
         if(this.dir == 1 && Key.isDown(this.b) || this.dir == -1 && Key.isDown(this.f))
         {
            _loc2_ = "punch_l";
         }
         else
         {
            _loc2_ = this.skillObj.s1;
         }
      }
      else
      {
         _loc2_ = "punch_l";
      }
      this.toSkill(_loc2_);
   }
}
