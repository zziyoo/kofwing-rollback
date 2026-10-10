stop();
if(_level0.debug == true)
{
   _visible = true;
}
else
{
   _visible = false;
}
var hitTypes = 0;
hitV = {area:this,Vx:Vx,Vy:Vy,defendBackCustom:defendBackCustom,accel:accel,slowdown:slowdown,a:a,g:g,zeroGrav:zeroGrav,hitShinning:hitShinning,reCheck:reCheck,checkTimes:checkTimes,hitPos:hitPos,hurtBack:hurtBack,hurtAway:hurtAway,freezeTime:freezeTime,freezeTime2:freezeTime2,slowTime:slowTime,hitType:hitType,hitEff:hitEff,d_rate:d_rate,flag:flag,shake:shake,end_status:end_status,isObj:isObj,nohit_status:nohit_status,wanneng:wanneng,freezeTimeair:freezeTimeair,isStand:isStand,d_rate2:d_rate2};
this.start_hitCheck(hitV,_root.role_mc);
var role = _root.role_mc;
