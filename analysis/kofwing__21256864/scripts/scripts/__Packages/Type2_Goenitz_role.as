class Type2_Goenitz_role extends Goenitz_role
{
   var b;
   var begin2;
   var burstList;
   var comboClass;
   var d;
   var dir;
   var f;
   var jumpSkill;
   var mode_key;
   var skillObj;
   var skillSuperMapping;
   var status_1;
   var superList;
   var superMaxList;
   var toSkill;
   function Type2_Goenitz_role()
   {
      super();
      this.superList = {sk_s1xiii:1,sk_8ZW:1,sk_huofeng:1};
      this.burstList = {sk_s_zhuangqiang:1,sk_s_qianzai1:1};
      this.superMaxList = {sk_s1_sxiii:1,sk_8ZW_s:1};
      this.skillSuperMapping = {sk_s1xiii:"sk_s1_sxiii",sk_8ZW:"sk_8ZW_s"};
      this.begin2();
      this.skillObj.s1 = "sk_s1xiii";
      this.skillObj.s2 = "sk_8ZW";
      this.skillObj.busrt_a = "sk_s_zhuangqiang";
      this.skillObj.busrt_d = "sk_s_qianzai1";
      this.skillObj.toAir = "sk_YTao";
      this.comboClass.combo1.squatPunch_l = {};
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
      else if(!((Key.isDown(this.b) && this.dir == 1 || Key.isDown(this.f) && this.dir == -1) && (this.status_1 == "squatPunch_l" || this.status_1 == "squatKick_l")))
      {
         if(!((Key.isDown(this.f) && this.dir == 1 || Key.isDown(this.b) && this.dir == -1) && (this.status_1 == "squatPunch_l" || this.status_1 == "squatKick_l")))
         {
            if(this.mode_key == "easy")
            {
               _loc2_ = this.skillObj.s1;
            }
            else
            {
               _loc2_ = "punch_l";
            }
         }
      }
      this.toSkill(_loc2_);
   }
}
