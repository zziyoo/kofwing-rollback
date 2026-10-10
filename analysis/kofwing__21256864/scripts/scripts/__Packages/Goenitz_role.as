class Goenitz_role extends role_corn.Role
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
   var colorObj;
   var comboClass;
   var d;
   var dir;
   var egde_max;
   var egde_min;
   var f;
   var gotoAndPlay;
   var input_pre;
   var jumpSkill;
   var mode_key;
   var normalList2;
   var onEnterFrame;
   var onHit;
   var opp;
   var opp_width2;
   var pitch;
   var record_skill_totalFrame;
   var scale;
   var skillObj;
   var skillSuperMapping;
   var status_1;
   var superList;
   var superMaxList;
   var toSkill;
   var toStatus;
   var topLayer;
   var winPoseArray;
   function Goenitz_role()
   {
      super();
      this._roleName = "Goenitz";
      this.scale = 100;
      this.Vwalk = 11;
      this.Vdash = 28;
      this.Vjump_x = 13;
      this.Vjump_y = 39;
      this.Vjump_far = 20;
      this.opp_width2 = 60;
      this.superList = {sk_s1:1,sk_s_89b:1,sk_s_caihua0:1,sk_huofeng:1};
      this.burstList = {sk_s_qianzai2:1,sk_s_3shenji2:1};
      this.superMaxList = {sk_s1_s:1,sk_s_89b_s:1};
      this.skillSuperMapping = {sk_s1:"sk_s1_s",sk_s_89b:"sk_s_89b_s"};
      this.normalList2 = ["punch_s1"];
      this.winPoseArray = ["end","end2"];
      this.skillObj.s1 = "sk_s1";
      this.skillObj.s2 = "sk_s_89b";
      this.skillObj.busrt_a = "sk_s_qianzai2";
      this.skillObj.busrt_d = "sk_s_3shenji2";
      this.record_skill_totalFrame = ["sk_s1","sk_s4","sk_s3"];
      this.comboClass = new Goenitz_Combo(this);
      this.preCheck();
      this.colorObj.fire_red2 = {ra:"100",rb:"255",ga:"100",gb:"80",ba:"100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.fire_red1 = {ra:"-100",rb:"255",ga:"-100",gb:"100",ba:"-100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.fire_blue2 = {ra:"100",rb:"0",ga:"100",gb:"0",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.fire_blue1 = {ra:"-100",rb:"178",ga:"-100",gb:"96",ba:"-100",bb:"239",aa:"100",ab:"0"};
      this.colorObj.ice1 = {ra:"-100",rb:"255",ga:"-50",gb:"255",ba:"100",bb:"255",aa:"100",ab:"0"};
      this.colorObj.purple2 = {ra:"-16",rb:"139",ga:"-21",gb:"97",ba:"-11",bb:"170",aa:"100",ab:"0"};
      this.colorObj.purple1 = {ra:"2",rb:"129",ga:"-24",gb:"110",ba:"-5",bb:"140",aa:"100",ab:"0"};
      this.colorObj.huoFeng2 = {ra:"100",rb:"255",ga:"100",gb:"0",ba:"100",bb:"0",aa:"100",ab:"0"};
      this.colorObj.huoFeng1 = {ra:"100",rb:"55",ga:"100",gb:"0",ba:"100",bb:"0",aa:"100",ab:"0"};
   }
   function preCheck()
   {
      this.input_pre.roll_f = 10;
      this.input_pre.roll_b = 10;
      this.input_pre.land = 0;
      this.input_pre.land2 = 0;
      this.input_pre.getup1 = 20;
      this.input_pre.getup2 = 20;
   }
   function sk_s_caihua0()
   {
      return false;
   }
   function catch_HitTest(obj, status_c, flag, condition_land, condition_hurt, downHit, superMoveEffect, visibility, changeDir)
   {
      if(this.opp.nosh == true)
      {
         return undefined;
      }
      if(condition_land)
      {
         if(this.opp.status_2 == "air")
         {
            return undefined;
         }
      }
      if(condition_hurt)
      {
         if(!(this.opp.status_3 == "hurt" || this.opp.status_3 == ""))
         {
            if(!(this.opp.status_3 == "down" && this.onHit))
            {
               return undefined;
            }
         }
      }
      if(downHit == false)
      {
         if(this.opp.status_3 == "down")
         {
            return undefined;
         }
      }
      var _loc2_;
      var _loc3_;
      if(obj.hitTest(this.opp) && this.opp.status_3 == "roll" || obj.hitTest(this.opp.mc.body))
      {
         delete this.opp.onEnterFrame;
         this.opp.toStatus(status_c);
         this.opp.gotoAndStop(status_c);
         this.opp.mc.gotoAndStop(flag);
         this.opp.status_2 = "land";
         this.opp.status_3 = "hurt";
         this.onHit = true;
         _loc2_ = this._x + obj._x * this.dir;
         _loc3_ = this._y + obj._y;
         if(_level0.char_mc._x + _loc2_ > this.egde_max)
         {
            _loc2_ = this.egde_max - _level0.char_mc._x;
         }
         else if(_level0.char_mc._x + _loc2_ < this.egde_min)
         {
            _loc2_ = this.egde_min - _level0.char_mc._x;
         }
         this.opp._x = _loc2_;
         if(changeDir && this.dir == this.opp.dir)
         {
            if(this.dir == 1)
            {
               this.opp.chageSide2();
            }
            else
            {
               this.opp.chageSide1();
            }
         }
         if(visibility == undefined)
         {
            visibility = true;
         }
         if(visibility)
         {
            if(superMoveEffect)
            {
               _level0.effect_mc.hitFire("hitFire3_super",_loc2_,_loc3_);
            }
            else
            {
               _level0.effect_mc.hitFire("hitFire3",_loc2_,_loc3_);
            }
         }
         this.topLayer();
         this.onEnterFrame = function()
         {
            this.opp.mc.stop();
            if(this.opp.status_1 != status_c)
            {
               this.opp.mc.play();
               delete this.onEnterFrame;
            }
         };
      }
      else
      {
         this.onHit = false;
         if(this.status_1 == "sk4")
         {
            this.gotoAndPlay("nohit");
         }
         else
         {
            this.toStatus("stand");
         }
      }
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
         this.jumpSkill("kick_l");
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
         if(Key.isDown(this.f) && this.dir == 1)
         {
            _loc2_ = "sk_hang";
         }
         else if(Key.isDown(this.b) && this.dir == -1)
         {
            _loc2_ = "sk_hang";
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
      else if((Key.isDown(this.b) && this.dir == 1 || Key.isDown(this.f) && this.dir == -1) && (this.status_1 == "squatPunch_l" || this.status_1 == "squatKick_l"))
      {
         _loc2_ = "sk1_1";
      }
      else if((Key.isDown(this.f) && this.dir == 1 || Key.isDown(this.b) && this.dir == -1) && (this.status_1 == "squatPunch_l" || this.status_1 == "squatKick_l"))
      {
         _loc2_ = "sk4";
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
