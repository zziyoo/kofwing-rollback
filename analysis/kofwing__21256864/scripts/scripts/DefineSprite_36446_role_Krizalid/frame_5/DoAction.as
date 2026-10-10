function addPlayer(type, roleMode)
{
   var _loc2_ = _level0.level;
   var _loc1_ = "roleZero";
   if(roleMode == 2)
   {
      _loc1_ = "roleZero2";
      if(type == "cpu")
      {
         if(_loc2_ == 1)
         {
            Object.registerClass(_loc1_,CZero_AI_Lv1);
         }
         else if(_loc2_ == 2)
         {
            Object.registerClass(_loc1_,CZero_AI_Lv2);
         }
         else if(_loc2_ == 3)
         {
            Object.registerClass(_loc1_,CZero_AI_Lv3);
         }
         else if(_loc2_ == 4)
         {
            Object.registerClass(_loc1_,CZero_AI_Lv4);
         }
         else if(_loc2_ == 5)
         {
            Object.registerClass(_loc1_,CZero_AI_Lv5);
         }
      }
      else if(type != "demo")
      {
         Object.registerClass(_loc1_,CZero_Player);
      }
   }
   else if(type == "cpu")
   {
      if(_loc2_ == 1)
      {
         Object.registerClass(_loc1_,Zero_AI_Lv1);
      }
      else if(_loc2_ == 2)
      {
         Object.registerClass(_loc1_,Zero_AI_Lv2);
      }
      else if(_loc2_ == 3)
      {
         Object.registerClass(_loc1_,Zero_AI_Lv3);
      }
      else if(_loc2_ == 4)
      {
         Object.registerClass(_loc1_,Zero_AI_Lv4);
      }
      else if(_loc2_ == 5)
      {
         Object.registerClass(_loc1_,Zero_AI_Lv5);
      }
   }
   else
   {
      Object.registerClass(_loc1_,Zero_Player);
   }
   attachMovie(_loc1_,"role_mc",100);
}
stop();
