void game()
{
  background(#f0a646);
  Car1.show();
  Car1.act(wkey, akey, skey, dkey);
  Car2.show();
  Car2.act(upkey, leftkey, downkey, rightkey);
}

void gameClick()
{
}
