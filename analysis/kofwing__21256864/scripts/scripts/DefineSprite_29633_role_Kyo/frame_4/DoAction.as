function addPlayer(type, roleMode)
{
   var _loc2_ = _level0.level;
   var _loc1_ = "roleKyo";
   if(roleMode == 2)
   {
      if(type == "cpu")
      {
         if(_loc2_ == 1)
         {
            Object.registerClass(_loc1_,Type2_Kyo_AI_Lv1);
         }
         else if(_loc2_ == 2)
         {
            Object.registerClass(_loc1_,Type2_Kyo_AI_Lv2);
         }
         else if(_loc2_ == 3)
         {
            Object.registerClass(_loc1_,Type2_Kyo_AI_Lv3);
         }
         else if(_loc2_ == 4)
         {
            Object.registerClass(_loc1_,Type2_Kyo_AI_Lv4);
         }
         else if(_loc2_ == 5)
         {
            Object.registerClass(_loc1_,Type2_Kyo_AI_Lv5);
         }
      }
      else if(type == "demo")
      {
         Object.registerClass(_loc1_,Demo_kyo);
      }
      else
      {
         Object.registerClass(_loc1_,Type2_Kyo_Player);
      }
   }
   else if(type == "cpu")
   {
      if(_loc2_ == 1)
      {
         Object.registerClass(_loc1_,Kyo_AI_Lv1);
      }
      else if(_loc2_ == 2)
      {
         Object.registerClass(_loc1_,Kyo_AI_Lv2);
      }
      else if(_loc2_ == 3)
      {
         Object.registerClass(_loc1_,Kyo_AI_Lv3);
      }
      else if(_loc2_ == 4)
      {
         Object.registerClass(_loc1_,Kyo_AI_Lv4);
      }
      else if(_loc2_ == 5)
      {
         Object.registerClass(_loc1_,Kyo_AI_Lv5);
      }
   }
   else if(type == "demo")
   {
      Object.registerClass(_loc1_,Demo_kyo);
   }
   else
   {
      Object.registerClass(_loc1_,Kyo_Player);
   }
   attachMovie(_loc1_,"role_mc",100);
}
stop();
