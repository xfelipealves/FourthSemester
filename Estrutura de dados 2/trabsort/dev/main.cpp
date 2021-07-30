#include <iostream>
#include "sort.h"
#include <chrono>

using namespace std;

int main()
{
    int t=100;
    int*v = new int[t];
    for(int i=0; i<t; i++)
    {
        v[i]=rand()%200;
    }

    cout<<"Antes: ";
    for(int i=0; i<t; i++)
    {
        cout<<v[i]<<" ";
    }
    cout<<endl;

    auto inicio=chrono::system_clock::now();
    sort::HeapSort(v,t);
    auto fim=chrono::system_clock::now();

    chrono::duration<double> tempo=fim-inicio;

    cout<<"Depois: ";
    for(int i=0; i<t; i++)
    {
        cout<<v[i]<<" ";
    }
    cout<<endl;

    cout<<"Tempo: "<<tempo.count()<<"s"<<endl;

    return 0;
}
