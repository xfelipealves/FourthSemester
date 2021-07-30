#ifndef NODEZIN_H
#define NODEZIN_H
#include <iostream>
#include "vectorzada.h"
#include <string>
#include <stdio.h>
#include <vector>
#include <iostream>
#include <string>
#include <stdio.h>
#include <list>
#include "voosbrabos.h"
using namespace std;
class nodezin
{
public:
    bool aresta;
//    string aeroportoPartida, aeroportoChegada;
    list<voosBrabos> voozin;
//    string voo; //nome do voo
//    vector<string> partida, chegada, tempoViagem;
//    int minPartida, minChegada, minTempoViagem;
    nodezin();
    void set(string voo, string partida, string chegada/*, string ap, string ac*/);
//    void remove();
    void print();
};

#endif // NODEZIN_H
