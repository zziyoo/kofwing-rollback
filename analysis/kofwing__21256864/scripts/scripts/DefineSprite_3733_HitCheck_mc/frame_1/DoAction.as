stop();
if(_level0.debug == true)
{
   _visible = true;
}
else
{
   _visible = false;
}
hitV = {area:this,Vx:Vx,Vy:Vy,a:a,g:g,hitShinning:hitShinning,reCheck:reCheck,checkTimes:checkTimes,hitPos:hitPos,hurtBack:hurtBack,hurtAway:hurtAway,hitDownRoll:hitDownRoll,hitDownFar:hitDownFar,DownVx:DownVx,freezeTime:freezeTime,freezeTime2:freezeTime2,slowTime:slowTime,hitType:hitType,hitEff:hitEff,d_rate:d_rate,flag:flag,shake:shake,shake_int:shake_int,end_status:end_status,end_dizzy:end_dizzy,isObj:isObj,nohit_status:nohit_status,nohit_skills:nohit_skills,bloodPower:_root.role_mc.bloodPower,calHits:calHits,edgeNotBack:edgeNotBack,hitSwitch:hitSwitch,flagHit:flagHit,flagHurt:flagHurt,flagDefend:flagDefend,defendBackCustom:defendBackCustom,hitAddBgEff:hitAddBgEff,changeDir:changeDir,wanneng:wanneng,flagair:flagair,freezeTimeair:freezeTimeair,dirs:_parent.dirs,isGd:isGd,breakDefend:breakDefend,d_rate2:d_rate2};
this.start_hitCheck(hitV,_root.role_mc);
