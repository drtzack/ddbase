module helper;
import std.range;
import std.string;

//Dizideki Elemanı Silmeye Yarar
R removeAt(R)(R aralık, size_t indeks)
{
    auto gerisi = aralık.save;
    gerisi.popFrontN(indeks + 1);
    return aralık[0 .. indeks] ~ gerisi;
}
