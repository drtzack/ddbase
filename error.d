module error;
import std.stdio;

//Hata Işlemlerini Bastırır
void setError(string T...)
{
    throw new Exception(T);
}
