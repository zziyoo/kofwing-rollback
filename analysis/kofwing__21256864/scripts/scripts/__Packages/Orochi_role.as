class Orochi_role extends role_corn.Role
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
   var input_pre;
   var jumpSkill;
   var mode_key;
   var opp_width2;
   var pitch;
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
   function Orochi_role()
   {
      super();
      this._roleName = "Orochi";
      this.scale = 100;
      this.Vwalk = 10;
      this.Vdash = 35;
      this.Vjump_x = 13;
      this.Vjump_y = 39;
      this.Vjump_far = 20;
      this.opp_width2 = 60;
      this.superList = {sk_s_guangzhu:1,sk_s_yangguang:1,sk_97:1,sk_jiao:1};
      this.burstList = {sk_s_qianshou1:1,sk_s_taoxin:1};
      this.superMaxList = {sk_s_guangzhu_s:1,sk_s_yangguang_s:1,sk_97_s:1};
      this.skillSuperMapping = {sk_s_guangzhu:"sk_s_guangzhu_s",sk_s_yangguang:"sk_s_yangguang_s",sk_97:"sk_97_s"};
      this.record_skill_totalFrame = [];
      this.winPoseArray = ["end","end2","end3"];
      this.skillObj.s1 = "sk_s_guangzhu";
      this.skillObj.s2 = "sk_s_yangguang";
      this.skillObj.busrt_a = "sk_s_taoxin";
      this.skillObj.busrt_d = "sk_s_qianshou1";
      this.comboClass = new Orochi_Combo(this);
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
      this.input_pre.dbp_l = 5;
      this.input_pre.dbk_l = 5;
      this.input_pre.dbp = 5;
      this.input_pre.dbk = 5;
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
      this.status_6 = "move";
      this.status_1 = "sk_bdfk";
      this.gotoAndStop(this.status_1);
   }
   function sk_97()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_6 = "catch";
      this.status_1 = "sk_97";
      this.gotoAndStop(this.status_1);
   }
   function sk_97_s()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.status_6 = "catch";
      this.status_1 = "sk_97_s";
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
