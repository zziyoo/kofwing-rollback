class K_role extends role_corn.Role
{
   var Vdash;
   var Vjump_far;
   var Vjump_x;
   var Vjump_y;
   var Vwalk;
   var Vx;
   var Vy;
   var _roleName;
   var _y;
   var b;
   var burstList;
   var checkSide_abs;
   var colorObj;
   var comboClass;
   var d;
   var dir;
   var f;
   var gotoAndStop;
   var input_pre;
   var jumpSkill;
   var mc;
   var mode_key;
   var normalList2;
   var opp_width2;
   var pitch;
   var record_skill_totalFrame;
   var scale;
   var skillObj;
   var skillSuperMapping;
   var start_move_Y1;
   var status_1;
   var status_2;
   var status_3;
   var status_6;
   var superList;
   var superMaxList;
   var toSkill;
   var winPoseArray;
   function K_role()
   {
      super();
      this._roleName = "K";
      this.scale = 100;
      this.Vwalk = 11;
      this.Vdash = 28;
      this.Vjump_x = 13;
      this.Vjump_y = 39;
      this.Vjump_far = 20;
      this.opp_width2 = 60;
      this.superList = {sk_s1:1,sk_s2:1,sk_s3:1};
      this.burstList = {sk_s4:1,sk_s5:1,sk_max2:1,sk_neo:1};
      this.superMaxList = {sk_s1_s:1,sk_s3_s:1};
      this.skillSuperMapping = {sk_s1:"sk_s1_s",sk_s3:"sk_s3_s"};
      this.record_skill_totalFrame = ["sk_s4"];
      this.winPoseArray = ["end","end2"];
      this.normalList2 = ["kick_s1","kick_s2","kick_s3","punch_s1"];
      this.skillObj.s1 = "sk_s1";
      this.skillObj.s2 = "sk_s3";
      this.skillObj.s3 = "sk_s2";
      this.skillObj.busrt_a = "sk_s4";
      this.skillObj.busrt_d = "sk_s5";
      this.skillObj.toAir = "sk_fdfp";
      this.comboClass = new K_Combo(this);
      this.preCheck();
      this.colorObj.fire_red2 = {ra:"100",rb:"255",ga:"100",gb:"80",ba:"100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.fire_red1 = {ra:"-100",rb:"255",ga:"-100",gb:"180",ba:"-100",bb:"0",aa:"100",ab:"0"};
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
      this.input_pre.landY2 = 40;
      this.input_pre.sk_dfp_s2 = 13;
      this.input_pre.sk_dfp_s3 = 15;
      this.input_pre.sk_dfp_s4 = 14;
      this.input_pre.sk_dfp_s5 = 15;
      this.input_pre.sk_dfkl = 16;
      this.input_pre.sk_dfkl2 = 12;
      this.input_pre.sk_dfkh = 18;
   }
   function sk_fake()
   {
      return false;
   }
   function sk_s3_fake()
   {
      if(this.status_2 == "air")
      {
         this.toSkill("sk_s3");
      }
      else
      {
         this.to_kick_l();
      }
      return false;
   }
   function sk_max3()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_6 = "atemi";
      this.status_1 = "sk_max3";
      this.gotoAndStop(this.status_1);
   }
   function sk_dfp_s2()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_1 = "sk_dfp_s2";
      this.gotoAndStop(this.status_1);
   }
   function sk_dfp_s3()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_1 = "sk_dfp_s3";
      this.gotoAndStop(this.status_1);
   }
   function sk_fdfp2()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_1 = "sk_fdfp2";
      this.gotoAndStop(this.status_1);
   }
   function sk_dfkl()
   {
      if(this.status_2 != "air")
      {
         this.status_1 = "sk_dfkl";
         this.status_6 = "move";
      }
      else
      {
         if(this._y == 445)
         {
            this.start_move_Y1(this.Vy * 2 / 3,this.Vx);
         }
         this.status_1 = "sk_dbp2";
      }
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk_dbp2()
   {
      if(this.status_2 != "air")
      {
         return undefined;
      }
      this.status_1 = "sk_dbp2";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
      this.start_move_Y1(this.Vy * 2 / 3,this.Vx);
   }
   function sk_dfkh()
   {
      if(this.status_2 != "air")
      {
         this.status_1 = "sk_dfkh";
         this.status_6 = "move";
      }
      else
      {
         this.status_1 = "sk_dbp";
      }
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk_dbkl()
   {
      if(this.status_1 == "kick_s2" || this.status_1 == "kick_s1")
      {
         this.sk_dbk2l();
         return undefined;
      }
      if(this.status_2 == "air")
      {
         this.checkSide_abs();
         this.sk_dbk2l();
         return undefined;
      }
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_1 = "sk_dbkl";
      this.gotoAndStop(this.status_1);
   }
   function sk_dbk()
   {
      if(this.status_1 == "kick_s2" || this.status_1 == "kick_s1")
      {
         this.sk_dbk2();
         return undefined;
      }
      if(this.status_2 == "air")
      {
         this.checkSide_abs();
         this.sk_dbk2();
         return undefined;
      }
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_1 = "sk_dbk";
      this.gotoAndStop(this.status_1);
   }
   function sk_dbk_landHit()
   {
      this.status_3 = "attack";
      this.status_2 = "land";
      this.mc.gotoAndPlay("landY");
   }
   function sk_fdfp_kick()
   {
      this.mc.gotoAndPlay("s2");
   }
   function sk_dbk2l()
   {
      this.status_3 = "attack";
      this.status_1 = "sk_dbk2l";
      this.gotoAndStop(this.status_1);
   }
   function sk_dbk2()
   {
      this.status_3 = "attack";
      this.status_1 = "sk_dbk2";
      this.gotoAndStop(this.status_1);
   }
   function sk_dbk_2()
   {
      if(this.status_1 == "kick_s2" || this.status_1 == "kick_s1")
      {
         this.sk_dbk_2_air();
         return undefined;
      }
      if(this.status_2 == "air")
      {
         this.checkSide_abs();
         this.sk_dbk_2_air();
         return undefined;
      }
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_1 = "sk_dbk_2";
      this.gotoAndStop(this.status_1);
   }
   function sk_dbk_2_air()
   {
      this.status_3 = "attack";
      this.status_1 = "sk_dbk_2_air";
      this.gotoAndStop(this.status_1);
   }
   function sk_sanduan_2()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_1 = "sk_sanduan_2";
      this.gotoAndStop(this.status_1);
   }
   function sk_sanduan_3()
   {
      if(this.mc.played)
      {
         return false;
      }
      this.mc.played = true;
      this.status_3 = "attack";
      this.status_1 = "sk_sanduan_3";
      this.mc.gotoAndPlay(this.status_1);
   }
   function sk_s3()
   {
      if(this.status_2 == "air")
      {
         this.checkSide_abs();
      }
      this.status_3 = "attack";
      this.status_1 = "sk_s3";
      this.gotoAndStop(this.status_1);
   }
   function sk_s3_s()
   {
      if(this.status_2 == "air")
      {
         this.checkSide_abs();
      }
      this.status_3 = "attack";
      this.status_1 = "sk_s3_s";
      this.gotoAndStop(this.status_1);
   }
   function sk_s4()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_1 = "sk_s4";
      this.gotoAndStop(this.status_1);
   }
   function sk_s5()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_1 = "sk_s5";
      this.gotoAndStop(this.status_1);
   }
   function kick_s2()
   {
      if(this.status_2 != "air")
      {
         this.status_1 = "kick_s2";
      }
      else
      {
         if(!(this.mode_key == "easy" && this.status_2 == "air"))
         {
            return false;
         }
         if(this._y == 445)
         {
            this.start_move_Y1(this.Vy * 2 / 3,this.Vx);
         }
         this.status_1 = "sk_dbp2";
      }
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
         _loc2_ = "kick_l";
         this.jumpSkill(_loc2_);
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
            _loc2_ = "kick_s1";
         }
         else
         {
            _loc2_ = "kick_s2";
         }
      }
      else if(Key.isDown(this.b) && this.dir == -1)
      {
         if(this.status_3 == "attack")
         {
            _loc2_ = "kick_s1";
         }
         else
         {
            _loc2_ = "kick_s2";
         }
      }
      else if(Key.isDown(this.f) && this.dir == -1)
      {
         _loc2_ = "kick_s3";
      }
      else if(Key.isDown(this.b) && this.dir == 1)
      {
         _loc2_ = "kick_s3";
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
