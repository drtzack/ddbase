import std.stdio;
import db;
void main()
{
    table tablo=table("1001");
    tablo.open();
    tablo.add(["19","Ali","Veli"]);
    tablo.del(2);
    tablo.data.writeln();
    tablo.save();
}
