void snowball()
{
  if (ckey)
  {
    ckey = false;
    Bullet b = new Bullet();
    objects.add(b);
  }
}
