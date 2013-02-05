module db;
import std.stdio;
import std.conv;
import std.string;
import helper;

struct table
{
    string dbname="db1";
    string tbname;
    string[][string] data;
    string[] tags;
    this(string tb)
    {
        tbname=tb;
    }
    /**/
    void open()
    {
        version(Windows) scope File dosya=File(dbname~"\\"~tbname,"r");

        version(Linux) scope File dosya=File(dbname~"/"~tbname,"r");

        tags=split(chomp(dosya.readln()),":");
        while(!dosya.eof())
        {
            string[] temp = split(chomp(dosya.readln()),"|");
            for(int i=0;i<tags.length;i++)
            {
                data[tags[i]]~=temp[i];
            }
        }
    }
    /**/
    void save()
    {
        version(Windows) scope File dosya=File(dbname~"\\"~tbname~".bak","w");

        version(Linux) scope File dosya=File(dbname~"/"~tbname~".bak","w");

        foreach(a,tag;tags)
        {

            if(a==tags.length-1)dosya.write(tag);
            else dosya.write(tag,":");

        }
        dosya.writeln();

        int sayi=data[tags[0]].length;

        for(int i=0;i<sayi;i++)
        {
                foreach(a,t;tags)
                {

                    if(a==tags.length-1)dosya.write(data[t][i]);
                    else dosya.write(data[t][i],"|");

                }
                dosya.writeln();
        }
    }
    /**/
    void add(string[] eklenecek)
    {
        for(int i=0;i<tags.length;i++)
        {
            data[tags[i]]~=eklenecek[i];
        }
    }
    /**/
    void del(int id)
    {
        for(int i=0;i<tags.length;i++)
        {
            data[tags[i]].removeAt(id);
        }
    }
}
