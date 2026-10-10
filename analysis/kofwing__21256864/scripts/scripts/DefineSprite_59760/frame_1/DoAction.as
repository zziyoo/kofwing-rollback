function showDateTime()
{
   var _loc1_ = new Date();
   var _loc11_ = _loc1_.getHours();
   var _loc8_ = _loc1_.getMinutes();
   var _loc9_ = _loc1_.getSeconds();
   var _loc2_ = _loc1_.getDate();
   var _loc3_ = _loc1_.getMonth() + 1;
   var _loc12_ = _loc1_.getFullYear();
   var _loc10_ = 0;
   var _loc4_ = 0;
   var _loc6_ = 0;
   var _loc5_ = 0;
   var _loc7_ = 0;
   _loc11_ >= 10 ? (_loc10_ = _loc11_) : (_loc10_ = "0" + _loc11_);
   _loc8_ >= 10 ? (_loc4_ = _loc8_) : (_loc4_ = "0" + _loc8_);
   _loc3_ >= 10 ? (_loc7_ = _loc3_) : (_loc7_ = "0" + _loc3_);
   _loc2_ >= 10 ? (_loc5_ = _loc2_) : (_loc5_ = "0" + _loc2_);
   _loc9_ >= 10 ? (_loc6_ = _loc9_) : (_loc6_ = "0" + _loc9_);
   dateTxt.text = _loc12_ + " - " + _loc7_ + " - " + _loc5_;
   timeTxt.text = _loc10_ + " : " + _loc4_ + " : " + _loc6_;
}
var s;
showDateTime();
clearInterval(s);
s = setInterval(this,"showDateTime",100);
if(_level0.showMoreMsg != true)
{
   dateTxt._visible = false;
   timeTxt._visible = false;
   showMsg1._visible = false;
   showMsg2._visible = false;
   showMsg3._visible = false;
   showMsg4._visible = false;
}
else
{
   dateTxt._visible = true;
   timeTxt._visible = true;
   showMsg1._visible = true;
   showMsg2._visible = true;
   showMsg3._visible = true;
   showMsg4._visible = true;
}
