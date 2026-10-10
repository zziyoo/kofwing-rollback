class Type2_Andy_role extends Andy_role
{
   var b;
   var begin2;
   var burstList;
   var catch_check;
   var d;
   var dir;
   var f;
   var gotoAndStop;
   var jumpSkill;
   var mode_key;
   var opp;
   var roleMode;
   var skillObj;
   var skillSuperMapping;
   var status_1;
   var status_3;
   var superList;
   var superMaxList;
   var toSkill;
   function Type2_Andy_role()
   {
      super();
      this.roleMode = 2;
      this.superList = {dbdf_p:1,dfdf_k_EX:1};
      this.burstList = {df_o_EX:1,db_o_EX:1};
      this.superMaxList = {dbdf_p_max:1,dfdf_k_EX_max:1};
      this.skillSuperMapping = {dbdf_p:"dbdf_p_max",dfdf_k_EX:"dfdf_k_EX_max"};
      this.begin2();
      this.skillObj.s1 = "dbdf_p";
      this.skillObj.s2 = "dfdf_k_EX";
      this.skillObj.busrt_a = "df_o_EX";
      this.skillObj.busrt_d = "db_o_EX";
      this.skillObj.toAir = "fdf_kh";
   }
   function pitch()
   {
      if(this.status_3 != "normal")
      {
         return false;
      }
      if(this.catch_check())
      {
         this.status_1 = "pitch2";
         this.gotoAndStop(this.status_1);
         this.status_3 = "attack";
         this.opp.status_3 = "hurt";
         return true;
      }
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
         _loc2_ = "f_p_EX";
      }
      else if(Key.isDown(this.b) && this.dir == -1)
      {
         _loc2_ = "f_p_EX";
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
