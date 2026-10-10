if(_parent.player_type == "cpu")
{
   var continueArray = new Array[6]();
   var doContinueRateValue = 1;
   if(_level0.level <= 3)
   {
      doContinueRateValue = 3;
   }
   else
   {
      doContinueRateValue = 0.1;
   }
   var s1 = 0;
   while(s1 < 7)
   {
      var doContinueRate = Math.random();
      canChange0 = true;
      canChange1 = true;
      canChange2 = true;
      if(doContinueRate <= 0.034 * _level0.level * (7 - s1) * (1.176 * _level0.level) * doContinueRateValue && s1 == 3)
      {
         canChange3 = true;
      }
      if(doContinueRate <= 0.034 * _level0.level * (7 - s1) * (1.176 * _level0.level) * doContinueRateValue && s1 == 4)
      {
         canChange4 = true;
      }
      if(doContinueRate <= 0.034 * _level0.level * (7 - s1) * (1.176 * _level0.level) * doContinueRateValue && s1 == 5)
      {
         canChange5 = true;
      }
      if(doContinueRate <= 0.034 * _level0.level * (7 - s1) * (1.176 * _level0.level) * doContinueRateValue && s1 == 6)
      {
         canChange6 = true;
      }
      s1++;
   }
}
var onwer = this;
key_mc0.pressFunc = function()
{
   if(_parent.onHit == true)
   {
      canChange0 = true;
   }
};
