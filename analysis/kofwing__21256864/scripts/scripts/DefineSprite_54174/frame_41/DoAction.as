var onwer = this;
if(_parent.player_type == "cpu")
{
   var continueArray = new Array[6]();
   var s1 = 0;
   while(s1 < 7)
   {
      var doContinueRate = Math.random();
      if(doContinueRate <= 0.034 * _level0.level * (7 - s1) * (1.176 * _level0.level) && s1 == 0)
      {
         canChange0 = true;
      }
      if(doContinueRate <= 0.034 * _level0.level * (7 - s1) * (1.176 * _level0.level) && s1 == 1)
      {
         canChange1 = true;
      }
      if(doContinueRate <= 0.034 * _level0.level * (7 - s1) * (1.176 * _level0.level) && s1 == 2)
      {
         canChange2 = true;
      }
      if(doContinueRate <= 0.034 * _level0.level * (7 - s1) * (1.176 * _level0.level) && s1 == 3)
      {
         canChange3 = true;
      }
      if(doContinueRate <= 0.034 * _level0.level * (7 - s1) * (1.176 * _level0.level) && s1 == 4)
      {
         canChange4 = true;
      }
      if(doContinueRate <= 0.034 * _level0.level * (7 - s1) * (1.176 * _level0.level) && s1 == 5)
      {
         canChange5 = true;
      }
      if(doContinueRate <= 0.034 * _level0.level * (7 - s1) * (1.176 * _level0.level) && s1 == 6)
      {
         canChange6 = true;
      }
      s1++;
   }
}
key_mc0.pressFunc = function()
{
   canChange0 = true;
};
