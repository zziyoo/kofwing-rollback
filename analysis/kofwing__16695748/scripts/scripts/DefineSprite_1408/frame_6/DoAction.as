_level0.p_snd.start();
var role = _root.role_mc;
var opp = role.opp;
var powerCost = 0;
var powerLevel = 0;
var powerNeed = 100;
if(role.inBurst || _parent == _level0.P1_role && _level0.LP_P1.powerPoint_num > 0 || _parent == _level0.P2_role && _level0.LP_P2.powerPoint_num > 0)
{
   role.countStart(10,"all",true,true);
   this.onEnterFrame = function()
   {
      if(_level0.inPause || _level0.inFreeze)
      {
         return undefined;
      }
      if(_parent.inCount == true)
      {
         delete this.onEnterFrame;
         role.powerDecType = "super";
         role.powerDec();
         gotoAndStop("att");
         play();
      }
   };
}
var owner = this;
hold_mc.holdFunc = function()
{
};
hold_mc.releaseFunc = function()
{
   if(owner._currentframe >= 28)
   {
      owner.gotoAndPlay("att0");
   }
   else
   {
      owner.gotoAndPlay("att");
   }
};
hold_mc.endFunc = function()
{
};
