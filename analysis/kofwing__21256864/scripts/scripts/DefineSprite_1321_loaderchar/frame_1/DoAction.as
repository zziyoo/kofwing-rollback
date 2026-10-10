function addPlayer(type, roleMode, rolechar)
{
   var _loc2_ = _level0.level;
   var _loc1_ = rolechar;
   if(roleMode == 3)
   {
      _loc1_ += "2";
      if(type == "cpu")
      {
         if(_loc2_ == 1)
         {
            Object.registerClass(_loc1_,Type3_ + _loc1_ + _AI_Lv1);
         }
         else if(_loc2_ == 2)
         {
            Object.registerClass(_loc1_,Type3_ + _loc1_ + _AI_Lv2);
         }
         else if(_loc2_ == 3)
         {
            Object.registerClass(_loc1_,Type3_ + _loc1_ + _AI_Lv3);
         }
         else if(_loc2_ == 4)
         {
            Object.registerClass(_loc1_,Type3_ + _loc1_ + _AI_Lv4);
         }
         else if(_loc2_ == 5)
         {
            Object.registerClass(_loc1_,Type3_ + _loc1_ + _AI_Lv5);
         }
      }
      else if(type != "demo")
      {
         Object.registerClass(_loc1_,Type3_ + _loc1_ + _Player);
      }
   }
   else if(roleMode == 2)
   {
      if(rolechar == "Zero" && roleMode == 2)
      {
         _loc1_ += "2";
      }
      if(rolechar == "Igniz" && roleMode == 2)
      {
         _loc1_ += "2";
      }
      if(type == "cpu")
      {
         if(_loc2_ == 1)
         {
            Object.registerClass(_loc1_,Type2_ + _loc1_ + _AI_Lv1);
         }
         else if(_loc2_ == 2)
         {
            Object.registerClass(_loc1_,Type2_ + _loc1_ + _AI_Lv2);
         }
         else if(_loc2_ == 3)
         {
            Object.registerClass(_loc1_,Type2_ + _loc1_ + _AI_Lv3);
         }
         else if(_loc2_ == 4)
         {
            Object.registerClass(_loc1_,Type2_ + _loc1_ + _AI_Lv4);
         }
         else if(_loc2_ == 5)
         {
            Object.registerClass(_loc1_,Type2_ + _loc1_ + _AI_Lv5);
         }
      }
      else if(type != "demo")
      {
         Object.registerClass(_loc1_,Type2_ + _loc1_ + _Player);
      }
   }
   else if(type == "cpu")
   {
      if(_loc2_ == 1)
      {
         Object.registerClass(_loc1_,_loc1_ + _AI_Lv1);
      }
      else if(_loc2_ == 2)
      {
         Object.registerClass(_loc1_,_loc1_ + _AI_Lv2);
      }
      else if(_loc2_ == 3)
      {
         Object.registerClass(_loc1_,_loc1_ + _AI_Lv3);
      }
      else if(_loc2_ == 4)
      {
         Object.registerClass(_loc1_,_loc1_ + _AI_Lv4);
      }
      else if(_loc2_ == 5)
      {
         Object.registerClass(_loc1_,_loc1_ + _AI_Lv5);
      }
   }
   else
   {
      Object.registerClass(_loc1_,_loc1_ + _Player);
   }
   attachMovie(_loc1_,"role_mc",100);
}
stop();
