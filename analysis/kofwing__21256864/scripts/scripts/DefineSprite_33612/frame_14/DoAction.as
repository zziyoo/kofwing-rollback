if(_root.role_mc.opp.status_1 == "hurt2")
{
   _parent.opp.checkTouch_stop = false;
   _parent.checkTouch_stop = false;
   _parent.opp.mc.play();
   continueHit = false;
   delete this.onEnterFrame;
}
