function hit()
{
   onHit = true;
   gotoAndStop("hit");
   play();
}
var onHit = false;
dirs = this.dir;
if(_root.role_mc.status_1 == "ready")
{
   gotoAndPlay(104);
}
