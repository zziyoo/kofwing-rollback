if(_level0.debug == true)
{
   _visible = true;
}
else
{
   _visible = false;
}
role = _parent._parent;
role.move_HitTest(this,attFrame,endFrame,S,Vx,nohit_status);
