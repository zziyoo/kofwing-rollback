class Type2_K_role extends K_role
{
   var b;
   var begin2;
   var burstList;
   var checkSide_abs;
   var comboClass;
   var d;
   var dir;
   var f;
   var gotoAndStop;
   var jumpSkill;
   var mode_key;
   var normalList2;
   var pitch;
   var roleMode;
   var sk_dbk2;
   var skillObj;
   var skillSuperMapping;
   var status_1;
   var status_2;
   var status_3;
   var superList;
   var superMaxList;
   var toSkill;
   function Type2_K_role()
   {
      super();
      this.roleMode = 2;
      this.superList = {sk_s1_2:1,sk_menghuti:1,sk_liandong:1};
      this.burstList = {sk_max2:1,sk_xiangdong:1,sk_max3:1};
      this.superMaxList = {sk_s1_2_s:1,sk_menghuti_s:1,sk_liandong_s:1};
      this.skillSuperMapping = {sk_s1_2:"sk_s1_2_s",sk_menghuti:"sk_menghuti_s",sk_liandong:"sk_liandong_s"};
      this.normalList2 = ["kick_s1","kick_s2","kick_s3","punch_s1"];
      this.begin2();
      this.skillObj.s1 = "sk_s1_2";
      this.skillObj.s2 = "sk_menghuti";
      this.skillObj.s3 = "sk_liandong";
      this.skillObj.busrt_a = "sk_max2";
      this.skillObj.busrt_d = "sk_xiangdong";
      this.skillObj.toAir = "sk_fdfp";
      this.comboClass.combo1.sk_dfp = {kick:"sk_dfp_s3",kick_l:"sk_dbk2l",kick_s1:"sk_dbk2",kick_s2:"sk_dbk2",sk_dfkh:"sk_dfkh",sk_dfkl:"sk_dfkl"};
      this.comboClass.combo1.sk_dfp_l = {kick:"sk_dfp_s3",kick_l:"sk_dbk2l",kick_s1:"sk_dbk2",kick_s2:"sk_dbk2",sk_dfkh:"sk_dfkh",sk_dfkl:"sk_dfkl"};
      this.comboClass.combo1.sk_dfp_s3 = {sk_dfkl:"sk_dfkl2",sk_dfkh:"sk_dfkh"};
      this.comboClass.combo1.sk_dfkl2 = {kick_s3:"kick_s3"};
   }
   function punch_s1_ai()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      this.status_3 = "attack";
      this.gotoAndStop("punch_s1");
      this.status_1 = "punch_s1_ai";
   }
   function sk_dbk()
   {
      if(this.status_1 == "kick_s2")
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
      this.status_1 = "sk_dbk_2";
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
