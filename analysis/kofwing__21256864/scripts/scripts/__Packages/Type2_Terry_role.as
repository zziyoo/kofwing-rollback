class Type2_Terry_role extends Terry_role
{
   var b;
   var begin2;
   var burstList;
   var d;
   var dir;
   var f;
   var jumpSkill;
   var mode_key;
   var normalList2;
   var pitch;
   var roleMode;
   var skillObj;
   var skillSuperMapping;
   var status_1;
   var status_3;
   var superList;
   var superMaxList;
   var toSkill;
   function Type2_Terry_role()
   {
      super();
      this.roleMode = 2;
      this.superList = {dbdf_p:1,dfdf_k_EX:1};
      this.burstList = {df_o_EX:1,db_o_EX:1};
      this.superMaxList = {dbdf_p_max:1,dfdf_k_EX_max:1};
      this.skillSuperMapping = {dbdf_p:"dbdf_p_max",dfdf_k_EX:"dfdf_k_EX_max"};
      this.normalList2 = ["df_p","f_p","f_p2"];
      this.begin2();
      this.skillObj.s1 = "dbdf_p";
      this.skillObj.s2 = "dfdf_k_EX";
      this.skillObj.busrt_a = "df_o_EX";
      this.skillObj.busrt_d = "db_o_EX";
      this.skillObj.toAir = "fdf_kh";
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
         if(this.status_3 == "attack")
         {
            _loc2_ = "f_p_EX2";
         }
         else
         {
            _loc2_ = "f_p_EX";
         }
      }
      else if(Key.isDown(this.b) && this.dir == -1)
      {
         if(this.status_3 == "attack")
         {
            _loc2_ = "f_p_EX2";
         }
         else
         {
            _loc2_ = "f_p_EX";
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
