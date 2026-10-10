function playSound()
{
   var _loc2_ = new Sound(this);
   _loc2_.attachSound("defend.wav");
   _loc2_.start();
}
_parent.countStart(2,"up",false,false);
var owner = this;
s_mc.onHit = function()
{
   owner.playSound();
};
