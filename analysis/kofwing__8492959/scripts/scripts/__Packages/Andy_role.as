class Andy_role extends role_corn.Role
{
   var Vdash;
   var Vjump_far;
   var Vjump_x;
   var Vjump_y;
   var Vwalk;
   var _roleName;
   var _x;
   var b;
   var begin;
   var begin2;
   var burstList;
   var colorObj;
   var comboClass;
   var d;
   var dir;
   var f;
   var gotoAndStop;
   var input_pre;
   var jumpSkill;
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
   var superList;
   var superMaxList;
   var toSkill;
   var winPoseArray;
   function Andy_role()
   {
      super();
      this._roleName = "Andy";
      this.scale = 100;
      this.Vwalk = 11;
      this.Vdash = 28;
      this.Vjump_x = 13;
      this.Vjump_y = 42;
      this.Vjump_far = 18;
      this.opp_width2 = 60;
      this.superList = {dbdf_p:1,dbdf_k:1};
      this.burstList = {df_o:1,db_o:1,dbdf_o:1};
      this.superMaxList = {dbdf_p_max:1,dbdf_k_max:1};
      this.skillSuperMapping = {dbdf_p:"dbdf_p_max",dbdf_k:"dbdf_k_max"};
      this.normalList2 = ["df_p","f_kl","f_kl_cancel"];
      this.winPoseArray = ["end","end2"];
      this.skillObj.s1 = "dbdf_p";
      this.skillObj.s2 = "dbdf_k";
      this.skillObj.busrt_a = "df_o";
      this.skillObj.busrt_b = "db_o";
      this.skillObj.toAir = "fdf_ph";
      this.comboClass = new Andy_Combo(this);
      this.preCheck();
      this.colorObj.fire_blue = {ra:"100",rb:"100",ga:"50",gb:"0",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.fire_red1 = {ra:"100",rb:"255",ga:"-70",gb:"255",ba:"100",bb:"-255",aa:"100",ab:"0"};
      this.colorObj.fire_red2 = {ra:"100",rb:"255",ga:"-100",gb:"255",ba:"100",bb:"-255",aa:"100",ab:"0"};
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
      this.input_pre.bdb_k = 20;
      this.input_pre.db_p = 55;
      this.input_pre.db_pl = 12;
      this.input_pre.bdf_k = 29;
      this.input_pre.bdf_kl = 24;
      this.input_pre.push = 14;
      this.input_pre.bdf_p_c = 39;
      this.input_pre.df_k_p = 16;
   }
   function stageVar(l_max, s_Point, p_max, opponent, burst)
   {
      super.stageVar(l_max,s_Point,p_max,opponent,burst);
      var _loc4_;
      if(opponent.roleName == "Mai")
      {
         this.gotoAndStop("vsmai");
      }
      else if(opponent.roleName == "Terry")
      {
         this.gotoAndStop("vsTerry");
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
            this.begin2();
         }
      }
   }
   function bdf_p_c()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      if(this.opp.noCatch == true)
      {
         this.status_1 = "bdf_ph";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
         return undefined;
      }
      if(this.opp.status_2 != "land" && this.opp.status_2 != "toLand" || this.opp.status_3 == "roll")
      {
         this.status_1 = "bdf_ph";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
         return undefined;
      }
      if(this.dir == 1)
      {
         if(this.opp._x - this._x <= 180 && this.opp._x - this._x >= -30)
         {
            this.status_1 = "bdf_p_c";
            this.status_3 = "attack";
            this.gotoAndStop(this.status_1);
         }
         else
         {
            this.status_1 = "bdf_ph";
            this.status_3 = "attack";
            this.gotoAndStop(this.status_1);
         }
      }
      else if(this._x - this.opp._x <= 180 && this._x - this.opp._x >= -30)
      {
         this.status_1 = "bdf_p_c";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
      }
      else
      {
         this.status_1 = "bdf_ph";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
      }
   }
   function bdf_p_c_l()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      if(this.opp.noCatch == true)
      {
         this.status_1 = "bdf_pl";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
         return undefined;
      }
      if(this.opp.status_2 != "land" && this.opp.status_2 != "toLand" || this.opp.status_3 == "roll")
      {
         this.status_1 = "bdf_pl";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
         return undefined;
      }
      if(this.dir == 1)
      {
         if(this.opp._x - this._x <= 180 && this.opp._x - this._x >= -30)
         {
            this.status_1 = "bdf_p_c";
            this.status_3 = "attack";
            this.gotoAndStop(this.status_1);
         }
         else
         {
            this.status_1 = "bdf_pl";
            this.status_3 = "attack";
            this.gotoAndStop(this.status_1);
         }
      }
      else if(this._x - this.opp._x <= 180 && this._x - this.opp._x >= -30)
      {
         this.status_1 = "bdf_p_c";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
      }
      else
      {
         this.status_1 = "bdf_pl";
         this.status_3 = "attack";
         this.gotoAndStop(this.status_1);
      }
   }
   function dbdf_o()
   {
      this.status_1 = "dbdf_o";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function bdf_ph_ai()
   {
      this.status_3 = "attack";
      this.gotoAndStop("bdf_ph");
      this.status_1 = "bdf_ph_ai";
   }
   function dd_p()
   {
      if(!(this.opp.status_3 == "down" & this.status_2 != "air"))
      {
         if(this.status_3 == "normal" && this.status_6 == "normal")
         {
            return false;
         }
         return false;
      }
      this.status_1 = "dd_p";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function sk_df_kl_air()
   {
      if(this.status_2 != "air")
      {
         return false;
      }
      this.status_1 = "sk_df_kl_air";
      this.status_3 = "attack";
      this.gotoAndStop("sk_df_kl_air");
   }
   function sk_df_k_air()
   {
      if(this.status_2 != "air")
      {
         return false;
      }
      this.status_1 = "sk_df_k_air";
      this.status_3 = "attack";
      this.gotoAndStop("sk_df_k_air");
   }
   function bdf_kl()
   {
      if(this.status_2 == "land" && this.status_1 != "bdf_kl")
      {
         this.status_1 = "bdf_kl";
      }
      else
      {
         if(this.status_2 != "air")
         {
            return false;
         }
         this.status_1 = "sk_df_kl_air";
      }
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function bdf_k()
   {
      if(this.status_2 == "land" && this.status_1 != "bdf_k")
      {
         this.status_1 = "bdf_k";
      }
      else
      {
         if(this.status_2 != "air")
         {
            return false;
         }
         this.status_1 = "sk_df_k_air";
      }
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
   }
   function df_k_p()
   {
      this.status_1 = "df_k_p";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
      if(_root.role_mc.mc.hitPos != "down")
      {
         _root.role_mc.mc.hitPos = "down";
      }
   }
   function df_k_k()
   {
      this.status_1 = "df_k_k";
      this.status_3 = "attack";
      this.gotoAndStop(this.status_1);
      if(_root.role_mc.mc.hitPos != "up")
      {
         _root.role_mc.mc.hitPos = "up";
      }
   }
   function f_kl_cancel_ai()
   {
      if(this.status_3 != "attack")
      {
         return false;
      }
      this.status_1 = "f_kl_cancel";
      this.status_3 = "attack";
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
      else if(Key.isDown(this.f) && this.dir == 1 || Key.isDown(this.b) && this.dir == -1)
      {
         if(this.status_3 == "attack")
         {
            _loc2_ = "f_kl_cancel";
         }
         else
         {
            _loc2_ = "f_kl";
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
         this.jumpSkill("punch_l");
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
