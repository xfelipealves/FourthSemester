#include "hash.h"

Hash::hash()
{

}

Hash::Hash(int Max)
{
}

Hash::~Hash()
{
    for(i=0;i<MAX;i++)
    {
        Vet[i].clear();
    }
    delete Vet;
}

void Hash::insert(char *k, int D)
{
    int X=hash(T->key);
    Vet[X].insert(T);
}

bool Hash::remove(char *k)
{
    int X=hash(k);
    for(auto a=Vet[X].begin(); a != Vet[X].end(); a++) {
        if(a->key==k)
        {
            Vet[X].erase(a);
            return true;
        }
    }
    return false;
}

bool Hash::search(char *k, thing* OBJ)
{
    auto a;
    int X=hash(k);
    for(a=Vet[X].begin(); a != Vet[X].end() && a->key!=k; a++) ;
    if(a!=Vet[X].end)
    {
        *OBJ = *a;
        return true;
    }
    return false;
}

int Hash::hash(char *k)
{
    int S=0;
    int x=1;
    for(int i=strten(k)-1;i>=0;i--)
    {
        S=S+k[i]*x;
        x=x*256;
    }
    return S % MAX;
    //return ((a*S + b)%p)%M;
}
