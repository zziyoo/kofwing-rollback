role = _root.role_mc;
if(role.opp.status_3 == "hurt" && role.opp.status_2 == "air")
{
   gotoAndStop("hit");
   play();
}
_level0.p_snd.start();
