stop();
if(_level0.debug == true)
{
   _visible = true;
}
else
{
   _visible = false;
}
hitV = {role:_root.role_mc,area:this,Vx:Vx,Vy:Vy,a:a,g:g,obj_level:obj_level,reCheck:reCheck,checkTimes:checkTimes,hitPos:hitPos,hurtBack:hurtBack,hurtAway:hurtAway,freezeTime:freezeTime,freezeTime2:freezeTime2,slowTime:slowTime,hitType:hitType,hitEff:hitEff,d_rate:d_rate,flag:flag,shake:shake,end_status:end_status,isObj:isObj,nohit_status:nohit_status};
init_hit(hitV);
