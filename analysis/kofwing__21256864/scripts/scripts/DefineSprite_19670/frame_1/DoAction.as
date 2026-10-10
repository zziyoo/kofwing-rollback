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
rollhit = true;
changeDir = true;
downHit = true;
role.orochiTaoxin(this,status_1,flag,land,hurt,downHit,rollhit,holdhit,superMoveEff,visibility,changeDir,id,hitID,hitflag,nohit_status,Vx,f);
