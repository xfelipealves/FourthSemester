#ifndef VECTORZADA_H
#define VECTORZADA_H
#include <vector>
#include <iostream>
#include <string>
#include <stdio.h>
using namespace std;
static const vector<string> explode(const string& s, const char& c)
{
    string buff{""};
    vector<string> v;

    for(auto n:s)
    {
        if(n != c) buff+=n; else
        if(n == c && buff != "") { v.push_back(buff); buff = ""; }
    }
    if(buff != "") v.push_back(buff);

    return v;
}

static int mintotal(int hora, int minuto) {

    int r = (hora*60) + minuto;

    return r;
}

static std::string hora(int minutos) {

    int hora=0;
    string retorno;
    while (minutos>=60)
    {
        hora++;
        minutos-=60;
    }
    if (hora<10)
    {
        retorno="0";
    }
    retorno+=to_string(hora);
    retorno+=":";
    if (minutos<10)
    {
        retorno+="0";
    }
    retorno+=to_string(minutos);
    return retorno;
}

#endif // VECTORZADA_H
