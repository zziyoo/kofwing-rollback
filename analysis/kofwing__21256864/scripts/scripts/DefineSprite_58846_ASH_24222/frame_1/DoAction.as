function hit()
{
   if(stat)
   {
      if(hits == 1)
      {
         gotoAndStop("EX");
         play();
      }
      else
      {
         play();
      }
      hits++;
   }
   else
   {
      gotoAndStop("hit");
      play();
   }
}
var hits = 1;
var stat = _root.role_mc.ashPower;
