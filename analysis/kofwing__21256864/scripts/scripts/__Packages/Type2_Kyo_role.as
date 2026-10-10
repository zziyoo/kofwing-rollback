class Type2_Kyo_role extends Kyo_role
{
   var _roleName;
   var b;
   var begin2;
   var burstList;
   var d;
   var dir;
   var f;
   var getObjs;
   var gotoAndStop;
   var jumpSkill;
   var mode_key;
   var normalList2;
   var pitch;
   var roleMode;
   var skillObj;
   var skillSuperMapping;
   var status_1;
   var status_2;
   var status_3;
   var superList;
   var superMaxList;
   var toSkill;
   var to_punch_l;
   function Type2_Kyo_role()
   {
      super();
      this.roleMode = 2;
      this._roleName = "Kyo";
      this.superList = {sk_s_120:1,sk31:1,sk_8z:1,sk_wuyan:1,sk_caihua_kyo0:1,sk_zhutianfu:1,sk31_air:1};
      this.burstList = {sk34:1,sk35:1};
      this.superMaxList = {sk_s_120_s:1,sk31_s:1,sk_wuyan_s:1,sk_zhutianfu_s:1};
      this.skillSuperMapping = {sk_s_120:"sk_s_120_s",sk31:"sk31_s",sk_wuyan:"sk_wuyan_s",sk_zhutianfu:"sk_zhutianfu_s"};
      this.normalList2 = ["jumpSkill_punch_s","squatKick_s","kick1","kick1s","airBack","punch3"];
      this.begin2();
      this.skillObj.s1 = "sk_s_120";
      this.skillObj.s2 = "sk31";
      this.skillObj.busrt_a = "sk34";
      this.skillObj.busrt_d = "sk35";
   }
   function sk_caihua_kyo0()
   {
      if(this.mode_key != "easy")
      {
         return false;
      }
      this.to_punch_l();
   }
   function sk30()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "yangyan" && _loc3_[_loc2_].allowNum == 1)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_3 = "attack";
      this.status_1 = "sk30";
      this.gotoAndStop(this.status_1);
   }
   function sk30_l()
   {
      if(this.status_2 != "land")
      {
         return false;
      }
      var _loc3_ = this.getObjs();
      var _loc2_ = 0;
      while(_loc2_ < _loc3_.length)
      {
         if(_loc3_[_loc2_].objName == "yangyan2" && _loc3_[_loc2_].allowNum == 1)
         {
            return false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.status_3 = "attack";
      this.status_1 = "sk30_l";
      this.gotoAndStop(this.status_1);
   }
   function to_punch()
   {
      var _loc2_;
      if(this.status_1 == "jump_f" || this.status_1 == "jump_far" || this.status_1 == "jump" || this.status_1 == "jump_b")
      {
         if(Key.isDown(this.d))
         {
            this.jumpSkill("punch_s");
         }
         else
         {
            this.jumpSkill("punch");
         }
         return undefined;
      }
      if(Key.isDown(this.d) && this.status_1 == "dash_b")
      {
         _loc2_ = "airBack";
      }
      else if(Key.isDown(this.d))
      {
         if(Key.isDown(this.f) && this.dir == 1)
         {
            _loc2_ = "punch3";
         }
         else if(Key.isDown(this.b) && this.dir == -1)
         {
            _loc2_ = "punch3";
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
}
