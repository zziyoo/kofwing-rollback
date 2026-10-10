class Type2_Iori_role extends Iori_role
{
   var _x;
   var b;
   var begin2;
   var burstList;
   var burst_mode;
   var comboClass;
   var d;
   var dir;
   var f;
   var gotoAndStop;
   var inBurst;
   var jumpSkill;
   var mode_key;
   var normalList2;
   var opp;
   var powerDec;
   var powerDecType;
   var roleMode;
   var skillObj;
   var skillSuperMapping;
   var status_1;
   var status_3;
   var superList;
   var superMaxList;
   var toSkill;
   function Type2_Iori_role()
   {
      super();
      this.roleMode = 2;
      this.superList = {sk_s1xiii:1,sk_8ZW:1,sk_huofeng:1};
      this.burstList = {sk_s_zhuangqiang:1,sk_s_qianzai1:1,sk_s_zhuangqiang2:1,sk_bachiwu_maxCancel:1};
      this.superMaxList = {sk_s1_sxiii:1,sk_8ZW_s:1};
      this.skillSuperMapping = {sk_s1xiii:"sk_s1_sxiii",sk_8ZW:"sk_8ZW_s"};
      this.normalList2 = ["sk_hang","sk_hang2","sk_hang3","punch_s1","punch_s2","kick_s1","airBack","jumpSilll_kick_s"];
      this.begin2();
      this.skillObj.s1 = "sk_s1xiii";
      this.skillObj.s2 = "sk_8ZW";
      this.skillObj.busrt_a = "sk_s_zhuangqiang";
      this.skillObj.busrt_d = "sk_s_qianzai1";
      this.skillObj.toAir = "sk_YTao";
      this.comboClass.combo1.squatPunch_l = {};
   }
   function to_kick_l()
   {
      var _loc2_;
      if(this.status_1 == "dash_b")
      {
         _loc2_ = "airBack";
         this.toSkill(_loc2_);
         return undefined;
      }
      if(this.status_1 == "jump_f" || this.status_1 == "jump_far" || this.status_1 == "jump" || this.status_1 == "jump_b")
      {
         if(this.dir == 1)
         {
            if(Key.isDown(this.f) && this._x > this.opp._x)
            {
               _loc2_ = "kick_s";
            }
            else if(Key.isDown(this.b) && this._x < this.opp._x)
            {
               _loc2_ = "kick_s";
            }
            else
            {
               _loc2_ = "kick_l";
            }
         }
         else if(this.dir == -1)
         {
            if(Key.isDown(this.b) && this._x < this.opp._x)
            {
               _loc2_ = "kick_s";
            }
            else if(Key.isDown(this.f) && this._x > this.opp._x)
            {
               _loc2_ = "kick_s";
            }
            else
            {
               _loc2_ = "kick_l";
            }
         }
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
            _loc2_ = "kick_s3";
         }
         else
         {
            _loc2_ = "kick_s1";
         }
      }
      else if(Key.isDown(this.b) && this.dir == -1)
      {
         if(this.status_3 == "attack")
         {
            _loc2_ = "kick_s3";
         }
         else
         {
            _loc2_ = "kick_s1";
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
   function to_punch_l()
   {
      var _loc2_;
      if(this.status_1 == "jump_f" || this.status_1 == "jump_far" || this.status_1 == "jump" || this.status_1 == "jump_b")
      {
         this.jumpSkill("punch_l");
         return undefined;
      }
      if(this.status_1 == "punch_s1")
      {
         if(Key.isDown(this.f) && this.dir == 1)
         {
            _loc2_ = "punch_s2";
         }
         else if(Key.isDown(this.b) && this.dir == -1)
         {
            _loc2_ = "punch_s2";
         }
      }
      else if(Key.isDown(this.d))
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
   function sk_8ZW_s_ai()
   {
      if(!(this.inBurst && this.burst_mode == "power"))
      {
         return false;
      }
      this.powerDecType = "super";
      this.powerDec();
      this.status_3 = "attack";
      this.status_1 = "sk_8ZW_s";
      this.gotoAndStop(this.status_1);
      return true;
   }
}
