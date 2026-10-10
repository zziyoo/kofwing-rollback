with(_parent)
{
   var action = "stand";
   statusClear();
   checkSide();
   showHits_end();
   if(Key.isDown(u))
   {
      action = "jump";
   }
   else if(Key.isDown(d))
   {
      action = "squat";
   }
   else if(Key.isDown(f))
   {
      if(dir == 1)
      {
         action = "walk_f";
      }
      else
      {
         if(opp.status_3 == "attack")
         {
            hold_u();
            return undefined;
         }
         action = "walk_b";
      }
   }
   else if(Key.isDown(b))
   {
      if(dir == 1)
      {
         if(opp.status_3 == "attack")
         {
            hold_u();
            return undefined;
         }
         action = "walk_b";
      }
      else
      {
         action = "walk_f";
      }
   }
   else if(Key.isDown(p))
   {
      action = "punch";
   }
   else if(Key.isDown(k))
   {
      action = "kick";
   }
   toStatus(action);
}
