stop();
if(_level0.debug == true)
{
   _visible = true;
}
else
{
   _visible = false;
}
hitV = {area:this,Vx:Vx,Vy:Vy,a:a,g:g,hitShinning:hitShinning,reCheck:reCheck,checkTimes:checkTimes,hitDownRoll:hitDownRoll,hitPos:hitPos,hurtBack:hurtBack,hurtAway:hurtAway,freezeTime:freezeTime,freezeTime2:freezeTime2,slowTime:slowTime,hitType:hitType,hitEff:hitEff,d_rate:d_rate,flag:flag,shake:shake,end_status:end_status,isObj:isObj,nohit_status:nohit_status,nohit_skills:nohit_skills,flagair:flagair,freezeTimeair:freezeTimeair,hitID:hitID,dirs:_parent.dirs};
this.start_hitCheck(hitV,_root.role_mc);
