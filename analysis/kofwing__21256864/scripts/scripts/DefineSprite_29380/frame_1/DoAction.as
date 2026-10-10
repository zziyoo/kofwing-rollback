stop();
if(_level0.debug == true)
{
   _visible = true;
}
else
{
   _visible = false;
}
role = _root.role_mc;
hitID = id;
role.catch_HitTest2(this,status_1,flag,land,hurt,downHit,rollhit,holdhit,superMoveEff,visibility,changeDir,id,hitID,nohitflag,nohit_status);
