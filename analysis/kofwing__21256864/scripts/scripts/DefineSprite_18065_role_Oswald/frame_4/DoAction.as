function addPlayer(type, roleMode)
{
   var _loc1_ = _level0.level;
   if(roleMode == 2)
   {
      if(type == "cpu")
      {
         if(_loc1_ == 1)
         {
            Object.registerClass("roleOswald",Type2_Oswald_AI_Lv1);
         }
         else if(_loc1_ == 2)
         {
            Object.registerClass("roleOswald",Type2_Oswald_AI_Lv2);
         }
         else if(_loc1_ == 3)
         {
            Object.registerClass("roleOswald",Type2_Oswald_AI_Lv3);
         }
         else if(_loc1_ == 4)
         {
            Object.registerClass("roleOswald",Type2_Oswald_AI_Lv4);
         }
         else if(_loc1_ == 5)
         {
            Object.registerClass("roleOswald",Type2_Oswald_AI_Lv5);
         }
      }
      else
      {
         Object.registerClass("roleOswald",Type2_Oswald_Player);
      }
      attachMovie("roleOswald","role_mc",100);
   }
   else
   {
      if(type == "cpu")
      {
         if(_loc1_ == 1)
         {
            Object.registerClass("roleOswald",Oswald_AI_Lv1);
         }
         else if(_loc1_ == 2)
         {
            Object.registerClass("roleOswald",Oswald_AI_Lv2);
         }
         else if(_loc1_ == 3)
         {
            Object.registerClass("roleOswald",Oswald_AI_Lv3);
         }
         else if(_loc1_ == 4)
         {
            Object.registerClass("roleOswald",Oswald_AI_Lv4);
         }
         else if(_loc1_ == 5)
         {
            Object.registerClass("roleOswald",Oswald_AI_Lv5);
         }
      }
      else
      {
         Object.registerClass("roleOswald",Oswald_Player);
      }
      attachMovie("roleOswald","role_mc",100);
   }
}
stop();
